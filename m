Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D583EB499B5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A322210E1F4;
	Mon,  8 Sep 2025 19:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com
 [209.85.166.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A0310E1F4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:19:28 +0000 (UTC)
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-40f97299233so4477735ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757359168; x=1757963968;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GS51yBm+KZpy05gOITF+TyPHlJCUTXtwtV3UCcoHVHI=;
 b=b7TH9kotkus1WBzXr5mHgEbHebQKelMWEGEVrxFK75aeCmq7zIWPpwUSWSK7nYBcQu
 JVC19cE+Kd4pP1Zi23f4bNAXoclZclg+0IclynIcUjMVzBzg7s4gp5H4JjqknWr07M9G
 Uy5H/Q7PzQJilL+KF4nAEFgZYNy1r2h8w10g7+MxP/qfCshfmI0jwDwa/tT6R2XEFj2x
 DACW3EdvJ6vZ8gfh/tWnfYPyNwbnocT5doDYqghA5y403Ph/MCVIYURNKU05hCAFSWmN
 /fWjjf11ppj6iyCD76gS4yD+Qlv33V3PHOC5r1OU2AuSyasCbHyhAuI202ImOj9upE62
 HLZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBxmx1JeGppir0sfP6uMnpn2MQNtHHrZOVtE6Jq2nieBuRFs9Eqb9etdtB2kZFrOvD/Tz4/FQibz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/FTHc5VywFRSJzp7NVtgMZBbH8dxczBV1nLBRH01RbR7yttzF
 Nr/KYDd6RipAW5DWrffMiijGwEGG7clZPyYsNdbuFBRYlYQ7yrJBgAtIbMVYdJm1nrxr00Qtn6P
 yAk+MA7Ot6DFV3BwnjVNGMvg5uevBq0G2FlMf1h2X5ABUaeVUpWHpztjjgtY=
X-Google-Smtp-Source: AGHT+IEES7IE7iRjJaxYjfY8EtJaJrjfyO12oDu3Dxea0hsbmIRzW3W9wfliz6N4OT7EukOeIr7wEqRT3bnbv1mqF8q806YnN/Vc
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2194:b0:40e:fe2a:b321 with SMTP id
 e9e14a558f8ab-40efe2ab529mr12939775ab.15.1757359168014; Mon, 08 Sep 2025
 12:19:28 -0700 (PDT)
Date: Mon, 08 Sep 2025 12:19:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68bf2c3f.050a0220.192772.0884.GAE@google.com>
Subject: [syzbot] [fbdev?] KASAN: vmalloc-out-of-bounds Write in imageblit (5)
From: syzbot <syzbot+48b0652a95834717f190@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, simona@ffwll.ch, 
 soci@c64.rulez.org, syzkaller-bugs@googlegroups.com
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

HEAD commit:    76eeb9b8de98 Linux 6.17-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14379562580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0bea6c0b97a2002
dashboard link: https://syzkaller.appspot.com/bug?extid=48b0652a95834717f190
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b2c9b90de8ba/disk-76eeb9b8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dd1bcf1fd25e/vmlinux-76eeb9b8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dc7e94f5dffb/bzImage-76eeb9b8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in fb_write_offset drivers/video/fbdev/core/sysmem.h:30 [inline]
BUG: KASAN: vmalloc-out-of-bounds in fb_bitmap_2ppw drivers/video/fbdev/core/fb_imageblit.h:364 [inline]
BUG: KASAN: vmalloc-out-of-bounds in fb_bitmap_imageblit drivers/video/fbdev/core/fb_imageblit.h:462 [inline]
BUG: KASAN: vmalloc-out-of-bounds in fb_imageblit drivers/video/fbdev/core/fb_imageblit.h:492 [inline]
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x1a6f/0x1e60 drivers/video/fbdev/core/sysimgblt.c:24
Write of size 8 at addr ffffc90003649000 by task syz.1.259/7231

CPU: 0 UID: 0 PID: 7231 Comm: syz.1.259 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 fb_write_offset drivers/video/fbdev/core/sysmem.h:30 [inline]
 fb_bitmap_2ppw drivers/video/fbdev/core/fb_imageblit.h:364 [inline]
 fb_bitmap_imageblit drivers/video/fbdev/core/fb_imageblit.h:462 [inline]
 fb_imageblit drivers/video/fbdev/core/fb_imageblit.h:492 [inline]
 sys_imageblit+0x1a6f/0x1e60 drivers/video/fbdev/core/sysimgblt.c:24
 drm_fbdev_shmem_defio_imageblit+0x20/0x130 drivers/gpu/drm/drm_fbdev_shmem.c:38
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:138 [inline]
 bit_putcs+0x90f/0xde0 drivers/video/fbdev/core/bitblit.c:187
 fbcon_putcs+0x384/0x4a0 drivers/video/fbdev/core/fbcon.c:1327
 do_update_region+0x2e6/0x3f0 drivers/tty/vt/vt.c:627
 update_region+0xc1/0x160 drivers/tty/vt/vt.c:641
 vcs_write+0x7c7/0xdb0 drivers/tty/vt/vc_screen.c:698
 vfs_write+0x29d/0x11d0 fs/read_write.c:684
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7effcbf8ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007effccda6038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007effcc1c6270 RCX: 00007effcbf8ebe9
RDX: 000000000000ffd8 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007effcc011e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007effcc1c6308 R14: 00007effcc1c6270 R15: 00007ffd4fcb0c08
 </TASK>

The buggy address belongs to a 0-page vmalloc region starting at 0xffffc90003349000 allocated at drm_gem_shmem_vmap_locked+0x561/0x7e0 drivers/gpu/drm/drm_gem_shmem_helper.c:371
Memory state around the buggy address:
 ffffc90003648f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90003648f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90003649000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc90003649080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90003649100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
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
