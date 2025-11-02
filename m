Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFA5C296FC
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 22:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7326610E08D;
	Sun,  2 Nov 2025 21:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com
 [209.85.166.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCBA10E08D
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 21:10:33 +0000 (UTC)
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-8870219dce3so395853539f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 13:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762117832; x=1762722632;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3r4tNEJZqNR7jvnaf7lJZd2h8YwAodUy8epKeDGKL8M=;
 b=oskBVn6ZhJjiA0az5AtVrqTNCa3vCSHxT2C8MDLKZL52CD0qMA73UdnboTSdHSjn4A
 JydtKUGtso97l0lRIRf6N0EMo52ENli0fB1G+85NklgdijKObQrXGm2JQyV018aMvUJ1
 mGm8sqJSX7I/Uoiu7euvn6uWyasS8Ng9Cb8ZZcmY1F0tlwUWJkTvHr9lUIzhnN68ex+6
 lY9sN2M/gYQ7WTZf91H2H8mYhMW+E/eNWeHWHhWVeW0dDUqU0YeuuGlN0x2Q/gRSTwYN
 GMGMlWy5cTP+VaZVzD4Gf4J8/GgvNtejGXViTd0JHf93zkU0OLfb2CjABCHSzRZWGMks
 rWpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHDHcl9JOaP80OSg7YoPmPybSzFeeyBFrzt6dDGFlr6CIi+T79fynar1aL8MJ1tpuMyIXFCpja/Lk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCuHpHbF7y3PJ7IwBevgE8NfkoXUvMASH0MSk0IvtnwB1VW59O
 ScYHTjwlBilIw7q/bqfONO9xBmVX4aHz+/TWB4e9bSgQjjJHrZKuo0UevANU8rDD5Xj49tPRf1G
 fwbVjcrb8t8QZ/7/T5GgyiRN0tA5m9v6joNX6xJGmJSozOFQN2Wo4WWpwTc4=
X-Google-Smtp-Source: AGHT+IEqch9T1rUJ4zmGL76ryOqcCV26GrGnOehnclE3lWkRPkCkLqATTcyvFnUrKGBOLj8Tji95+WoXRgANuKRr2nfZX0/Qrafy
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1849:b0:433:3035:7426 with SMTP id
 e9e14a558f8ab-4333035764fmr19518625ab.16.1762117832219; Sun, 02 Nov 2025
 13:10:32 -0800 (PST)
Date: Sun, 02 Nov 2025 13:10:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6907c8c8.a70a0220.37351b.0012.GAE@google.com>
Subject: [syzbot] [fbdev?] KASAN: vmalloc-out-of-bounds Write in imageblit (6)
From: syzbot <syzbot+5a40432dfe8f86ee657a@syzkaller.appspotmail.com>
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

HEAD commit:    691d401c7e0e Merge tag 'spi-fix-v6.18-rc3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14607932580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19d831c6d0386a9c
dashboard link: https://syzkaller.appspot.com/bug?extid=5a40432dfe8f86ee657a
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5eaccda03e4f/disk-691d401c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0df5294a69bc/vmlinux-691d401c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f4f242731772/bzImage-691d401c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5a40432dfe8f86ee657a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in fb_write_offset drivers/video/fbdev/core/sysmem.h:30 [inline]
BUG: KASAN: vmalloc-out-of-bounds in fb_bitmap_2ppw drivers/video/fbdev/core/fb_imageblit.h:364 [inline]
BUG: KASAN: vmalloc-out-of-bounds in fb_bitmap_imageblit drivers/video/fbdev/core/fb_imageblit.h:462 [inline]
BUG: KASAN: vmalloc-out-of-bounds in fb_imageblit drivers/video/fbdev/core/fb_imageblit.h:492 [inline]
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x1a6f/0x1e60 drivers/video/fbdev/core/sysimgblt.c:24
Write of size 8 at addr ffffc90003e99280 by task kworker/0:2/781

CPU: 0 UID: 0 PID: 781 Comm: kworker/0:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Workqueue: events_power_efficient fb_flashcursor
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
 soft_cursor+0x524/0xa10 drivers/video/fbdev/core/softcursor.c:74
 bit_cursor+0xe8c/0x17e0 drivers/video/fbdev/core/bitblit.c:395
 fb_flashcursor drivers/video/fbdev/core/fbcon.c:401 [inline]
 fb_flashcursor+0x310/0x400 drivers/video/fbdev/core/fbcon.c:370
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3263
 process_scheduled_works kernel/workqueue.c:3346 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3427
 kthread+0x3c5/0x780 kernel/kthread.c:463
 ret_from_fork+0x675/0x7d0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The buggy address belongs to a vmalloc virtual mapping
Memory state around the buggy address:
 ffffc90003e99180: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90003e99200: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc90003e99280: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc90003e99300: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90003e99380: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
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
