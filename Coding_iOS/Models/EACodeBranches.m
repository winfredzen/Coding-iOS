//
//  EACodeBranches.m
//  Coding_iOS
//
//  Created by Easeeeeeeeee on 2018/3/22.
//  Copyright © 2018年 Coding. All rights reserved.
//

#import "EACodeBranches.h"

@implementation EACodeBranches

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.propertyArrayMap = @{@"list": @"CodeBranchOrTag"};
    }
    return self;
}

- (NSString *)curBaseStr{
    CodeBranchOrTag *defaultB = nil;
    for (CodeBranchOrTag *itemB in self.list) {
        if (itemB.is_default_branch.boolValue) {
            defaultB = itemB;
            break;
        }
    }
    if (!defaultB) {
        defaultB = self.list.firstObject;
    }
    return defaultB.last_commit.commitId;
//    return [(CodeBranchOrTag *)self.list.firstObject last_commit].commitId;
}

//https://coding.net/api/user/ease/project/CodingTest/git/branches/filter?page=1&q=
- (NSString *)toPath{
    return [NSString stringWithFormat:@"api/user/%@/project/%@/git/branches/filter", _curPro.owner_user_name, _curPro.name];
}
- (NSDictionary *)toParams{
    NSMutableDictionary *params = [super toParams];
    params[@"q"] = _queryStr;
    return params;
}

@end
