Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D6D1EF1EC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692B86E868;
	Fri,  5 Jun 2020 07:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDA16E2E8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 10:15:20 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id o4so3620241ilc.15
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 03:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=2WkRXGF/9K/CmmudqnkShQ8ojmLnZNEVTlTs88DNymU=;
 b=fvDKGaTrfKD5pqZslca2kI0GUVP8tycHYfS3FTesXpOpxEke+qkf/eBYqxXQ+qe48T
 Sw/4+0OSYsGA0rGjt3oETjpYe4em+ybOYaMo9XvFGmH8FoKvhjqpyKOqU2w0ZOymDM/B
 Vkhl77F2vQJJplp5308bhTQwAESCasAea30y/RUfHnQENAMBZegi5PP2kys6MoBARmLM
 TVHDrvw1D/H6cmEWk826cCVfqMDpA2qI96npDqSO2w4DJYgTu3aJHgGJgSQH0VVbsq07
 0KNmUwxiiTRJX/MsA6XPIe8a8GVXik7AeHigolP2EOfD2Y2w1De3uvlDbPgryzzV+w0B
 nf9A==
X-Gm-Message-State: AOAM533sFBIGYkMLtCzdTcB3OuiNqks0hEtTvyf5dXZxApII88owR7Gb
 U7PGblfjsnOdqV8i2GbYd7pKdS2ExDkr7KaFT4G+NctoPUlK
X-Google-Smtp-Source: ABdhPJyCuz74mlyZXGn+6OI1o8Y51YqgJxo9QJ3BR6lO7hGygFAMP7+O5P86lL9pVMaxWvdaDqvSRRD/qKvvUYQBHcZ5q3auBubd
MIME-Version: 1.0
X-Received: by 2002:a6b:14d5:: with SMTP id 204mr3344334iou.14.1591265719319; 
 Thu, 04 Jun 2020 03:15:19 -0700 (PDT)
Date: Thu, 04 Jun 2020 03:15:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f1859f05a73f6bb0@google.com>
Subject: KASAN: vmalloc-out-of-bounds Read in trace_raw_output_sys_enter
From: syzbot <syzbot+a2196edd853f2b2eed30@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following crash on:

HEAD commit:    86852175 Merge tag 'armsoc-fixes-v5.7' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=125d79ce100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=129ea1e5950835e5
dashboard link: https://syzkaller.appspot.com/bug?extid=a2196edd853f2b2eed30
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a2196edd853f2b2eed30@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in trace_raw_output_sys_enter+0x1a8/0x230 include/trace/events/syscalls.h:18
Read of size 8 at addr ffffc90006191510 by task syz-executor.1/3440

CPU: 1 PID: 3440 Comm: syz-executor.1 Not tainted 5.7.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x188/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x413 mm/kasan/report.c:382
 __kasan_report.cold+0x20/0x38 mm/kasan/report.c:511
 kasan_report+0x33/0x50 mm/kasan/common.c:625
 trace_raw_output_sys_enter+0x1a8/0x230 include/trace/events/syscalls.h:18
 interrupt_entry+0xb8/0xc0 arch/x86/entry/entry_64.S:578
 </IRQ>
RIP: 0010:bitfill_aligned drivers/video/fbdev/core/cfbfillrect.c:71 [inline]
RIP: 0010:bitfill_aligned+0x11c/0x200 drivers/video/fbdev/core/cfbfillrect.c:35
Code: 89 e7 4c 89 ed e8 b4 04 b4 fd 48 89 5d 00 48 89 5d 08 48 89 5d 10 48 89 5d 18 48 89 5d 20 48 89 5d 28 48 8d 45 38 48 89 5d 30 <48> 83 c5 40 48 89 18 41 83 ef 08 bf 07 00 00 00 44 89 fe e8 ec 05
RSP: 0018:ffffc9000618f480 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: ffff888001007a78 RBX: 0000000000000000 RCX: ffffc9000a905000
RDX: 0000000000040000 RSI: ffffffff83bf3b1c RDI: 0000000000000005
RBP: ffff888001007a40 R08: ffff8880a7aa41c0 R09: 0000000000000040
R10: ffff8880a3ada55f R11: ffffed101475b4ab R12: 0000000000000050
R13: ffff888001007980 R14: 0000000000000000 R15: 0000000000000038
 cfb_fillrect+0x418/0x7a0 drivers/video/fbdev/core/cfbfillrect.c:327
 vga16fb_fillrect+0x68f/0x1960 drivers/video/fbdev/vga16fb.c:951
 bit_clear_margins+0x2d5/0x4a0 drivers/video/fbdev/core/bitblit.c:232
 fbcon_clear_margins+0x1de/0x240 drivers/video/fbdev/core/fbcon.c:1381
 fbcon_switch+0xcde/0x16f0 drivers/video/fbdev/core/fbcon.c:2363
 redraw_screen+0x2ae/0x770 drivers/tty/vt/vt.c:1015
 fbcon_modechanged+0x581/0x720 drivers/video/fbdev/core/fbcon.c:3000
 fbcon_set_all_vcs+0x3b3/0x460 drivers/video/fbdev/core/fbcon.c:3038
 fbcon_update_vcs+0x26/0x50 drivers/video/fbdev/core/fbcon.c:3045
 fb_set_var+0xad0/0xd40 drivers/video/fbdev/core/fbmem.c:1056
 do_fb_ioctl+0x390/0x6e0 drivers/video/fbdev/core/fbmem.c:1109
 fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:771
 __do_sys_ioctl fs/ioctl.c:780 [inline]
 __se_sys_ioctl fs/ioctl.c:778 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:778
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3
RIP: 0033:0x45ca69
Code: 0d b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f4c0e062c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004e4b00 RCX: 000000000045ca69
RDX: 0000000020000000 RSI: 0000000000004601 RDI: 0000000000000004
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 00000000000002f2 R14: 00000000004c5708 R15: 00007f4c0e0636d4


Memory state around the buggy address:
 ffffc90006191400: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc90006191480: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
>ffffc90006191500: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                         ^
 ffffc90006191580: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc90006191600: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
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
