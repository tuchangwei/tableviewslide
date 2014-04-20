//
//  ViewController.m
//  TableViewSlide
//
//  Created by tu on 4/20/14.
//  Copyright (c) 2014 tu changwei. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reload:(id)sender {
    
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Item %d",indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect frame = cell.frame;
    frame.origin.x = 320;
    cell.frame = frame;
    cell.layer.opacity = 0;
    [UIView animateWithDuration:0.25 delay:0.03*indexPath.row options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect frame = cell.frame;
        frame.origin.x = 10;
        cell.frame = frame;
        cell.layer.opacity = 1;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            CGRect frame = cell.frame;
            frame.origin.x = 0;
            cell.frame = frame;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = cell.frame;
                frame.origin.x = 10;
                cell.frame = frame;
            }];
        }];
        
    }];
}

@end
