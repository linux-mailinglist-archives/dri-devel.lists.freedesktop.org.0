Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F15942D61
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 13:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BDC10E540;
	Wed, 31 Jul 2024 11:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFA510E540
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 11:38:20 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-81fc0896188so180310839f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 04:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722425899; x=1723030699;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AZQzn55hmwUwe/OLN07Yt1bGgbGwuLAI4PDXp5aGGzQ=;
 b=hjM8FrqsFW7nE8G1ItYBwSK83zuXw0VpGkpYUoT3x2ZdTcydgjW1JiflKfgmqNa038
 rh4FhedK6lVIMcmmnyKoTE5q8DFZ1ewMLkX0WW6fO0FHUoHuD0tyL0ygiS+Outai5bwH
 jVSihXkZAl3/fqqIJX+3nYBAgBS8Ml/BUxYDb1czBaTrDwnkksX13eel/oKQX1pH0y7J
 Rz34wHEQkypiJ+D6242854GBGz+wvkxPlIMt8AB5KlcvAgCgXkQbxSGk98Cpzbfi9Jf6
 +fU/KY6au4DGKx7fKESH+jZfp3ifUXpx1Wfmz64mn5mBO5L3pTmwceMjT0OKe0QvseXv
 9yXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcagIbJ0QB25Yow4iVvPnIjICHMS0D+lDUhwRty4vyHuzHEfQCDUWP9hgYt55y5K+Xmf5/GTDhLqqabhsimGDFne5Y/q38hGLPUJaqO1W4
X-Gm-Message-State: AOJu0Yyv56f8IIwOKE0KYwNI3eYalan+uV3Lng+qHHuDsAjWbS9Yah+Y
 er00J2OaJVrbMy9i4u18OM01CQCtVB5qJP4S+t/CZjRSftO/rjs5nB9uUPC7OgtrHnD2YAQmSDY
 q8hclv8p570gJxsX6UYrm5yFzpXnr/BPe51qrEACTX021LEHAm5QOnIk=
X-Google-Smtp-Source: AGHT+IEsBuLENj62DdnzKW8aEcsM1YkZAnwt3UvU7FAzopC0Cd1elTa9/gEeBOr1PiAxcEcNZIuXWDOSPCJBjwP31vXC5zpwLqRx
MIME-Version: 1.0
X-Received: by 2002:a05:6638:150f:b0:4c0:9a05:44c4 with SMTP id
 8926c6da1cb9f-4c6352e57admr767806173.0.1722425899452; Wed, 31 Jul 2024
 04:38:19 -0700 (PDT)
Date: Wed, 31 Jul 2024 04:38:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e39b37061e898704@google.com>
Subject: [syzbot] [fbdev?] KASAN: global-out-of-bounds Read in bit_putcs (3)
From: syzbot <syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com>
To: daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following issue on:

HEAD commit:    c912bf709078 Merge remote-tracking branches 'origin/arm64-..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13b495bd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=35545feca25ede03
dashboard link: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/caeac6485006/disk-c912bf70.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/501c87f28da9/vmlinux-c912bf70.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6812e99b7182/Image-c912bf70.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in __fb_pad_aligned_buffer include/linux/fb.h:633 [inline]
BUG: KASAN: global-out-of-bounds in bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
BUG: KASAN: global-out-of-bounds in bit_putcs+0x9b8/0xe30 drivers/video/fbdev/core/bitblit.c:185
Read of size 1 at addr ffff80008b830d80 by task syz.1.1270/10828

CPU: 0 PID: 10828 Comm: syz.1.1270 Not tainted 6.10.0-rc7-syzkaller-gc912bf709078 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:317
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:324
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:114
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x198/0x538 mm/kasan/report.c:488
 kasan_report+0xd8/0x138 mm/kasan/report.c:601
 __asan_report_load1_noabort+0x20/0x2c mm/kasan/report_generic.c:378
 __fb_pad_aligned_buffer include/linux/fb.h:633 [inline]
 bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
 bit_putcs+0x9b8/0xe30 drivers/video/fbdev/core/bitblit.c:185
 fbcon_putcs+0x318/0x4e8 drivers/video/fbdev/core/fbcon.c:1288
 do_update_region+0x1e8/0x3d0 drivers/tty/vt/vt.c:609
 update_region+0x1e0/0x478 drivers/tty/vt/vt.c:633
 vcs_write+0x90c/0x10c8 drivers/tty/vt/vc_screen.c:698
 do_loop_readv_writev fs/read_write.c:764 [inline]
 vfs_writev+0x5c8/0xb80 fs/read_write.c:973
 do_writev+0x178/0x304 fs/read_write.c:1018
 __do_sys_writev fs/read_write.c:1091 [inline]
 __se_sys_writev fs/read_write.c:1088 [inline]
 __arm64_sys_writev+0x80/0x94 fs/read_write.c:1088
 __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:131
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:150
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

The buggy address belongs to the variable:
 oid_data+0x340/0x3a0

The buggy address belongs to the virtual mapping at
 [ffff80008b260000, ffff80008ee20000) created by:
 declare_kernel_vmas+0x58/0xb8 arch/arm64/mm/mmu.c:770

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1a9430
flags: 0x5ffc00000002000(reserved|node=0|zone=2|lastcpupid=0x7ff)
raw: 05ffc00000002000 fffffdffc5a50c08 fffffdffc5a50c08 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff80008b830c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff80008b830d00: 00 00 00 07 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
>ffff80008b830d80: f9 f9 f9 f9 f9 f9 f9 f9 00 00 00 00 06 f9 f9 f9
                   ^
 ffff80008b830e00: 05 f9 f9 f9 06 f9 f9 f9 00 00 00 00 00 00 00 00
 ffff80008b830e80: 00 00 00 00 00 00 00 00 00 00 00 00 00 02 f9 f9
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
