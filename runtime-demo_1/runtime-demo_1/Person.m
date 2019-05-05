//
//  Person.m
//  runtime-demo_1
//
//  Created by sheng xue on 2019/3/29.
//  Copyright © 2019年 sxmaps. All rights reserved.
//

#import "Person.h"
#import "Child.h"
#import <objc/runtime.h>
@implementation Person

//- (void)sendMessage:(NSString *)msg{
//    NSLog(@"person send msg:%@",msg);
//}


//void sendMessage(id self,SEL _cmd,NSString *msg) {
//    NSLog(@"send msg:%@",msg);
//}

//动态解析
+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    NSLog(@"动态方法解析");
//    NSString *methodName = NSStringFromSelector(sel);
//    if ([methodName isEqualToString:@"sendMessage:"]) {
//        return class_addMethod(self, sel, (IMP)sendMessage, "v@:@");
//    }
    return NO;
}

//快速转发
- (id)forwardingTargetForSelector:(SEL)aSelector{
//    NSString *methodName = NSStringFromSelector(aSelector);
//    if ([methodName isEqualToString:@"sendMessage:"]) {
//        return [Child new];
//    }
    return [super forwardingTargetForSelector:aSelector];

}

//慢速转发 1.签名 2.转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"sendMessage:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
//    SEL sel = anInvocation.selector;
//    Child *child = [Child new];
//    if ([child respondsToSelector:sel]) {
//        [anInvocation invokeWithTarget:child];
//    }else {
//        [super forwardInvocation:anInvocation];
//    }
    
    [super forwardInvocation:anInvocation];

}
-(void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"无法识别该消息:%@",NSStringFromSelector(aSelector));
}

@end
