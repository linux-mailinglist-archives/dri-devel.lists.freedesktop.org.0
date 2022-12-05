Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8A764224E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 05:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AFD10E0D6;
	Mon,  5 Dec 2022 04:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDB810E0C1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 04:34:45 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 h20-20020a056e021d9400b00300581edaa5so11213695ila.12
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Dec 2022 20:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vcFrvjYpY9w3oBH5VMBrbCN5cG4DGtca+C+V9MNGNBY=;
 b=nrXctPKllePCuKmsDMNIGzAOi9KCVTevtxqVAdfLZi7oIxq1/pw2LVSAaFr4CdkLNp
 W8jDEzD/o5eJ1+c/CeuLpw+LpEicIfXvhTDtF/S79jMVXgfQmevSonsL2bQLNSLK8dhX
 zuqcT1NFGgd230pIKTmGUWbhNGnuwTKGvWgiORk2+Noob29XEwt81EAKCQVuU6ZTTDYJ
 MoF2iyVyAZuw1WdG2nMTNFe8Zfd1rahAt8edllxQChZ9JnL9c3ysNlo81+GoHEnyYNwt
 FRISc8S5m4CMkHIQecmE6ef2b4cZjutyYXu2706++PVC9Oojn40JusaIPYrkodNjT1Ra
 5SFQ==
X-Gm-Message-State: ANoB5pk89psqhPtFF38ewqmqCYAA+FCzezXzG5DfTqz9DVjuocmrimtd
 nL/C3tKnF5/5uyPD8w/ZhU3/q7gnI7u57hhGaPQFu9+KPee3
X-Google-Smtp-Source: AA0mqf7iyVepFf9uvSqFu+Czqel85Bx9rIZHqrT9xKNbJkXJrxGVTRza++ig5vx166ELXQ5StTz/hrZ9soFSQWNPcWfAbfhn3byU
MIME-Version: 1.0
X-Received: by 2002:a5d:804e:0:b0:6dc:30bd:ed8f with SMTP id
 b14-20020a5d804e000000b006dc30bded8fmr30399822ior.130.1670214884451; Sun, 04
 Dec 2022 20:34:44 -0800 (PST)
Date: Sun, 04 Dec 2022 20:34:44 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e2efc305ef0d341f@google.com>
Subject: [syzbot] memory leak in fbcon_set_font (2)
From: syzbot <syzbot+25bdb7b1703639abd498@syzkaller.appspotmail.com>
To: daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 geert+renesas@glider.be, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sam@ravnborg.org, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    c2bf05db6c78 Merge tag 'i2c-for-6.1-rc8' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=171883d5880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=979161df0e247659
dashboard link: https://syzkaller.appspot.com/bug?extid=25bdb7b1703639abd498
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fff84d880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=135806a7880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/63cd45bf1d68/disk-c2bf05db.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bafbfb42c660/vmlinux-c2bf05db.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9f803a721cfc/bzImage-c2bf05db.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+25bdb7b1703639abd498@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888111648000 (size 18448):
  comm "syz-executor148", pid 3653, jiffies 4294970435 (age 13.520s)
  hex dump (first 32 bytes):
    85 44 7e c7 00 00 00 00 00 48 00 00 00 00 00 00  .D~......H......
    92 30 86 d2 8c 38 30 9e e7 a3 05 00 9f 09 33 bb  .0...80.......3.
  backtrace:
    [<ffffffff814ee6d3>] __do_kmalloc_node mm/slab_common.c:943 [inline]
    [<ffffffff814ee6d3>] __kmalloc+0xb3/0x120 mm/slab_common.c:968
    [<ffffffff8250c359>] kmalloc include/linux/slab.h:558 [inline]
    [<ffffffff8250c359>] fbcon_set_font+0x1a9/0x470 drivers/video/fbdev/core/fbcon.c:2508
    [<ffffffff8262cd59>] con_font_set drivers/tty/vt/vt.c:4667 [inline]
    [<ffffffff8262cd59>] con_font_op+0x3a9/0x600 drivers/tty/vt/vt.c:4713
    [<ffffffff82618e3d>] vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
    [<ffffffff82618e3d>] vt_ioctl+0x14fd/0x1a80 drivers/tty/vt/vt_ioctl.c:752
    [<ffffffff825fdaf5>] tty_ioctl+0x6d5/0xbe0 drivers/tty/tty_io.c:2771
    [<ffffffff816200bc>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff816200bc>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff816200bc>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff816200bc>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:856
    [<ffffffff8485c5e5>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff8485c5e5>] do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84a00087>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff888110b18000 (size 18448):
  comm "syz-executor148", pid 3655, jiffies 4294971001 (age 7.860s)
  hex dump (first 32 bytes):
    85 44 7e c7 00 00 00 00 00 48 00 00 00 00 00 00  .D~......H......
    92 30 86 d2 8c 38 30 9e e7 a3 05 00 9f 09 33 bb  .0...80.......3.
  backtrace:
    [<ffffffff814ee6d3>] __do_kmalloc_node mm/slab_common.c:943 [inline]
    [<ffffffff814ee6d3>] __kmalloc+0xb3/0x120 mm/slab_common.c:968
    [<ffffffff8250c359>] kmalloc include/linux/slab.h:558 [inline]
    [<ffffffff8250c359>] fbcon_set_font+0x1a9/0x470 drivers/video/fbdev/core/fbcon.c:2508
    [<ffffffff8262cd59>] con_font_set drivers/tty/vt/vt.c:4667 [inline]
    [<ffffffff8262cd59>] con_font_op+0x3a9/0x600 drivers/tty/vt/vt.c:4713
    [<ffffffff82618e3d>] vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
    [<ffffffff82618e3d>] vt_ioctl+0x14fd/0x1a80 drivers/tty/vt/vt_ioctl.c:752
    [<ffffffff825fdaf5>] tty_ioctl+0x6d5/0xbe0 drivers/tty/tty_io.c:2771
    [<ffffffff816200bc>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff816200bc>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff816200bc>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff816200bc>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:856
    [<ffffffff8485c5e5>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff8485c5e5>] do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84a00087>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

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
