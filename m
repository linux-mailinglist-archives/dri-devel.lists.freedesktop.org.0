Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6510311DF49
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B656E291;
	Fri, 13 Dec 2019 08:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7039F6ECE5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 08:58:08 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id 4so1104068ill.15
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 00:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=sKHgHXNET5NzD721BUspeErwLiJQg0Q5DJ+q3NfquJk=;
 b=Ue1xHC8FpqVjqfcwCBQuJAYJnCA1lVXERRjlHBmIohYE5nIfFJ6wAkqsxgt2LV/7Yj
 NvCYh16Xwo1hYt0mA/GiI7pRyrIiBnt8kdHpvbYuLfMb6/QpQjkYGlJ2AuiHnniZtP9c
 LXRNc9fxSf8o0R7esRhfyxW5euY5z7aDxATKo49ZnTBEtDOCRdWigAYDY+wsc5/V/qHO
 R+S3cMDNHQSk1mkD4Qh3G8zlEWjV8ZcbL7d5uEBYJGZJjM7CDSbYvJKKNM8HiZ+Qo55x
 K+jDd+kRWVH5LlDGQmqh5dK6YIfIe+7dA+d+EWJg9LUu+8GjUqqMUg3/nB8K6WTqK1Mi
 2Fuw==
X-Gm-Message-State: APjAAAWQpyUBdkjWLGcXUasX8j5lEO/c7fabkj5zcnHtk3x55WxSsXpm
 murc0MR73e2aELsQUy+8mHpVQemk+ZeLYp81PNWZhkb/BCXq
X-Google-Smtp-Source: APXvYqx4u070HFRMDkGpEFRM3FrKCEMy5hsKbvsI8QdZuftRgcmVPMDZHUFnn42Ky/ql3KF7nfQd4HJp2UER/h7+3yU1ijlGeOlB
MIME-Version: 1.0
X-Received: by 2002:a5d:9046:: with SMTP id v6mr2073717ioq.302.1576141087806; 
 Thu, 12 Dec 2019 00:58:07 -0800 (PST)
Date: Thu, 12 Dec 2019 00:58:07 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a79daf05997df166@google.com>
Subject: KASAN: global-out-of-bounds Read in soft_cursor
From: syzbot <syzbot+88dbe7c16ff8616b3720@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following crash on:

HEAD commit:    687dec9b Merge tag 'erofs-for-5.5-rc2-fixes' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14e0acfae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79f79de2a27d3e3d
dashboard link: https://syzkaller.appspot.com/bug?extid=88dbe7c16ff8616b3720
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+88dbe7c16ff8616b3720@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in memcpy include/linux/string.h:380  
[inline]
BUG: KASAN: global-out-of-bounds in soft_cursor+0x439/0xa30  
drivers/video/fbdev/core/softcursor.c:70
Read of size 32 at addr ffffffff8872a360 by task syz-executor.2/24342

CPU: 0 PID: 24342 Comm: syz-executor.2 Not tainted 5.5.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0x5/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:639
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
  memcpy+0x24/0x50 mm/kasan/common.c:125
  memcpy include/linux/string.h:380 [inline]
  soft_cursor+0x439/0xa30 drivers/video/fbdev/core/softcursor.c:70
  bit_cursor+0x12fc/0x1a60 drivers/video/fbdev/core/bitblit.c:386
  fbcon_cursor+0x487/0x660 drivers/video/fbdev/core/fbcon.c:1402
  hide_cursor+0x9d/0x2b0 drivers/tty/vt/vt.c:895
  redraw_screen+0x60b/0x7d0 drivers/tty/vt/vt.c:988
  fbcon_do_set_font+0x829/0x960 drivers/video/fbdev/core/fbcon.c:2605
  fbcon_copy_font+0x12c/0x190 drivers/video/fbdev/core/fbcon.c:2620
  con_font_copy drivers/tty/vt/vt.c:4594 [inline]
  con_font_op+0x6b2/0x1270 drivers/tty/vt/vt.c:4609
  vt_ioctl+0x181a/0x26d0 drivers/tty/vt/vt_ioctl.c:965
  tty_ioctl+0xa37/0x14f0 drivers/tty/tty_io.c:2660
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a909
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f61bb330c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a909
RDX: 0000000020000040 RSI: 0000000000004b72 RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f61bb3316d4
R13: 00000000004c3a41 R14: 00000000004d8f78 R15: 00000000ffffffff

The buggy address belongs to the variable:
  oid_index+0x520/0xb80

Memory state around the buggy address:
  ffffffff8872a200: 00 07 fa fa fa fa fa fa 00 06 fa fa fa fa fa fa
  ffffffff8872a280: 06 fa fa fa fa fa fa fa 00 00 00 04 fa fa fa fa
> ffffffff8872a300: 00 00 fa fa fa fa fa fa 00 00 06 fa fa fa fa fa
                                                        ^
  ffffffff8872a380: 00 06 fa fa fa fa fa fa 00 00 00 00 fa fa fa fa
  ffffffff8872a400: 00 00 01 fa fa fa fa fa 06 fa fa fa fa fa fa fa
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
