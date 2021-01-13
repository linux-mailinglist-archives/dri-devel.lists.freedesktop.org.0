Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD12F5D64
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB6B6E116;
	Thu, 14 Jan 2021 09:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB35D6E453
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 10:38:15 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id v21so2143656iol.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 02:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=Rf0qkGcLKZcXOCwuSoJ3U1uuRWEpE0nNPdXTF3l2hL4=;
 b=emxp24hmV71JsHoCgA02tMcdEMu7R0DrEB6uVk0SLRaY6vcbxS/udyXA95bUpp1V26
 l8mVgp2Kai3ptgdOm6kTfJf08+92jc+QvB5DmPXKRkJR4Rvh3+FcyBVu7fifp8QkIJql
 aon7U7EgV0Lo4TH0e5yxcTY0v1ttmoyh1rTJlqKCT6QRzXxP2jjBj1aNdk/PB2p/busV
 qFq/vcYfSaTlRNna4cTRRNkT6y6zGE2aC8totI3z8YmtirtcW/VyHytBgra9kk68A+er
 Tm7/OoOmkD4xNvEYvaRTuPDiHmNC23TtlhI7YhTl3OEKd+8SXHv3TqH6Ah02/JRL8Oj9
 pIKg==
X-Gm-Message-State: AOAM532qkxycjc6dEBv1QqAG4hVqYQbQd2V3BuFzRzOYyiVpdv8mnvX1
 irwPk3yyhYGiQRgVqsw0xTzDIs0MVEsZAtFP2+5yEyzOew1g
X-Google-Smtp-Source: ABdhPJxIhbMxWbqH09VI31IeFE5tniINNYJsm+xRvLC1RO/aVt96bC7M+rTNvvoBEMKrvWy0erLgmcwV3LR6kmS2XHxJrP6DxWSC
MIME-Version: 1.0
X-Received: by 2002:a92:b008:: with SMTP id x8mr1773225ilh.297.1610534295232; 
 Wed, 13 Jan 2021 02:38:15 -0800 (PST)
Date: Wed, 13 Jan 2021 02:38:15 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000090e80805b8c5bc59@google.com>
Subject: memory leak in fbcon_set_font
From: syzbot <syzbot+2f2c18881a450f22d1bf@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, george.kennedy@oracle.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 yepeilin.cs@gmail.com
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:32 +0000
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

syzbot found the following issue on:

HEAD commit:    e609571b Merge tag 'nfs-for-5.11-2' of git://git.linux-nfs..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165261e0d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=850b6de5f8959443
dashboard link: https://syzkaller.appspot.com/bug?extid=2f2c18881a450f22d1bf
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ab20c7500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1008b770d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2f2c18881a450f22d1bf@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88811813ea00 (size 512):
  comm "syz-executor939", pid 10246, jiffies 4294971847 (age 34.510s)
  hex dump (first 32 bytes):
    b0 55 1f 9b 00 00 00 00 00 01 00 00 06 00 00 00  .U..............
    11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000062fad90>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000062fad90>] fbcon_set_font+0x128/0x370 drivers/video/fbdev/core/fbcon.c:2454
    [<00000000ed2d1b1e>] con_font_set drivers/tty/vt/vt.c:4667 [inline]
    [<00000000ed2d1b1e>] con_font_op+0x497/0x740 drivers/tty/vt/vt.c:4711
    [<00000000fd6b18ad>] vt_io_ioctl drivers/tty/vt/vt_ioctl.c:596 [inline]
    [<00000000fd6b18ad>] vt_ioctl+0xeab/0x19d0 drivers/tty/vt/vt_ioctl.c:817
    [<00000000369331c6>] tty_ioctl+0x6c3/0xc40 drivers/tty/tty_io.c:2658
    [<00000000a092c047>] vfs_ioctl fs/ioctl.c:48 [inline]
    [<00000000a092c047>] __do_sys_ioctl fs/ioctl.c:753 [inline]
    [<00000000a092c047>] __se_sys_ioctl fs/ioctl.c:739 [inline]
    [<00000000a092c047>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
    [<00000000705a3959>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000f35163f9>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88811813ea00 (size 512):
  comm "syz-executor939", pid 10246, jiffies 4294971847 (age 36.030s)
  hex dump (first 32 bytes):
    b0 55 1f 9b 00 00 00 00 00 01 00 00 06 00 00 00  .U..............
    11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000062fad90>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000062fad90>] fbcon_set_font+0x128/0x370 drivers/video/fbdev/core/fbcon.c:2454
    [<00000000ed2d1b1e>] con_font_set drivers/tty/vt/vt.c:4667 [inline]
    [<00000000ed2d1b1e>] con_font_op+0x497/0x740 drivers/tty/vt/vt.c:4711
    [<00000000fd6b18ad>] vt_io_ioctl drivers/tty/vt/vt_ioctl.c:596 [inline]
    [<00000000fd6b18ad>] vt_ioctl+0xeab/0x19d0 drivers/tty/vt/vt_ioctl.c:817
    [<00000000369331c6>] tty_ioctl+0x6c3/0xc40 drivers/tty/tty_io.c:2658
    [<00000000a092c047>] vfs_ioctl fs/ioctl.c:48 [inline]
    [<00000000a092c047>] __do_sys_ioctl fs/ioctl.c:753 [inline]
    [<00000000a092c047>] __se_sys_ioctl fs/ioctl.c:739 [inline]
    [<00000000a092c047>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
    [<00000000705a3959>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000f35163f9>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88811813ea00 (size 512):
  comm "syz-executor939", pid 10246, jiffies 4294971847 (age 37.550s)
  hex dump (first 32 bytes):
    b0 55 1f 9b 00 00 00 00 00 01 00 00 06 00 00 00  .U..............
    11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000062fad90>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000062fad90>] fbcon_set_font+0x128/0x370 drivers/video/fbdev/core/fbcon.c:2454
    [<00000000ed2d1b1e>] con_font_set drivers/tty/vt/vt.c:4667 [inline]
    [<00000000ed2d1b1e>] con_font_op+0x497/0x740 drivers/tty/vt/vt.c:4711
    [<00000000fd6b18ad>] vt_io_ioctl drivers/tty/vt/vt_ioctl.c:596 [inline]
    [<00000000fd6b18ad>] vt_ioctl+0xeab/0x19d0 drivers/tty/vt/vt_ioctl.c:817
    [<00000000369331c6>] tty_ioctl+0x6c3/0xc40 drivers/tty/tty_io.c:2658
    [<00000000a092c047>] vfs_ioctl fs/ioctl.c:48 [inline]
    [<00000000a092c047>] __do_sys_ioctl fs/ioctl.c:753 [inline]
    [<00000000a092c047>] __se_sys_ioctl fs/ioctl.c:739 [inline]
    [<00000000a092c047>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
    [<00000000705a3959>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000f35163f9>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88811813ea00 (size 512):
  comm "syz-executor939", pid 10246, jiffies 4294971847 (age 37.630s)
  hex dump (first 32 bytes):
    b0 55 1f 9b 00 00 00 00 00 01 00 00 06 00 00 00  .U..............
    11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000062fad90>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000062fad90>] fbcon_set_font+0x128/0x370 drivers/video/fbdev/core/fbcon.c:2454
    [<00000000ed2d1b1e>] con_font_set drivers/tty/vt/vt.c:4667 [inline]
    [<00000000ed2d1b1e>] con_font_op+0x497/0x740 drivers/tty/vt/vt.c:4711
    [<00000000fd6b18ad>] vt_io_ioctl drivers/tty/vt/vt_ioctl.c:596 [inline]
    [<00000000fd6b18ad>] vt_ioctl+0xeab/0x19d0 drivers/tty/vt/vt_ioctl.c:817
    [<00000000369331c6>] tty_ioctl+0x6c3/0xc40 drivers/tty/tty_io.c:2658
    [<00000000a092c047>] vfs_ioctl fs/ioctl.c:48 [inline]
    [<00000000a092c047>] __do_sys_ioctl fs/ioctl.c:753 [inline]
    [<00000000a092c047>] __se_sys_ioctl fs/ioctl.c:739 [inline]
    [<00000000a092c047>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
    [<00000000705a3959>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000f35163f9>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88811813ea00 (size 512):
  comm "syz-executor939", pid 10246, jiffies 4294971847 (age 37.720s)
  hex dump (first 32 bytes):
    b0 55 1f 9b 00 00 00 00 00 01 00 00 06 00 00 00  .U..............
    11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000062fad90>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000062fad90>] fbcon_set_font+0x128/0x370 drivers/video/fbdev/core/fbcon.c:2454
    [<00000000ed2d1b1e>] con_font_set drivers/tty/vt/vt.c:4667 [inline]
    [<00000000ed2d1b1e>] con_font_op+0x497/0x740 drivers/tty/vt/vt.c:4711
    [<00000000fd6b18ad>] vt_io_ioctl drivers/tty/vt/vt_ioctl.c:596 [inline]
    [<00000000fd6b18ad>] vt_ioctl+0xeab/0x19d0 drivers/tty/vt/vt_ioctl.c:817
    [<00000000369331c6>] tty_ioctl+0x6c3/0xc40 drivers/tty/tty_io.c:2658
    [<00000000a092c047>] vfs_ioctl fs/ioctl.c:48 [inline]
    [<00000000a092c047>] __do_sys_ioctl fs/ioctl.c:753 [inline]
    [<00000000a092c047>] __se_sys_ioctl fs/ioctl.c:739 [inline]
    [<00000000a092c047>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
    [<00000000705a3959>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000f35163f9>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88811813ea00 (size 512):
  comm "syz-executor939", pid 10246, jiffies 4294971847 (age 37.810s)
  hex dump (first 32 bytes):
    b0 55 1f 9b 00 00 00 00 00 01 00 00 06 00 00 00  .U..............
    11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000062fad90>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000062fad90>] fbcon_set_font+0x128/0x370 drivers/video/fbdev/core/fbcon.c:2454
    [<00000000ed2d1b1e>] con_font_set drivers/tty/vt/vt.c:4667 [inline]
    [<00000000ed2d1b1e>] con_font_op+0x497/0x740 drivers/tty/vt/vt.c:4711
    [<00000000fd6b18ad>] vt_io_ioctl drivers/tty/vt/vt_ioctl.c:596 [inline]
    [<00000000fd6b18ad>] vt_ioctl+0xeab/0x19d0 drivers/tty/vt/vt_ioctl.c:817
    [<00000000369331c6>] tty_ioctl+0x6c3/0xc40 drivers/tty/tty_io.c:2658
    [<00000000a092c047>] vfs_ioctl fs/ioctl.c:48 [inline]
    [<00000000a092c047>] __do_sys_ioctl fs/ioctl.c:753 [inline]
    [<00000000a092c047>] __se_sys_ioctl fs/ioctl.c:739 [inline]
    [<00000000a092c047>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
    [<00000000705a3959>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000f35163f9>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
executing program
write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
executing program
write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
