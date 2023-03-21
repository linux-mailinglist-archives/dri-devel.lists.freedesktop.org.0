Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06726C379B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 18:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AF010E0D7;
	Tue, 21 Mar 2023 17:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B1710E812
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 17:03:56 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 k13-20020a056e021a8d00b0031bae68b383so8136480ilv.18
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 10:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679418235;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iQJQrb9mny4qoyxwqwRsccNTiZVnDvEPXFwh94AIcx4=;
 b=DWvUgVatppYSvLACgkW1/QldkR4RuDm6iOdBE22ta59rcjXshj5W5M5vduNilWoYMt
 esAroNkpUIE30UULHsfVAbo3K14FtGrj10aXQMPy4tjONDo5yeD/fRsPrkuY9nRjvP3D
 AF87xa2PaPV6/og18UJUFDOL8YCaZDMlay+C+sFeFokELmBB0/0kdFPxYTwdZ0tKXw/I
 keVCBmwyRPFTiLGCERWodtkQVbyb7SJgXh/qfDw+T7thHaRh9XPowMMhg84GJqnLMzrW
 Vj9TYMH+QQ3t46cuVI2HA+492vvrp2XYs5+1HqVkpYAzpyhe9ZH1ffW5bC//VswLym7E
 1lJA==
X-Gm-Message-State: AO0yUKXTpMFycK/Bt8edLESfRpUTWpiNDwYg7rjZVEK9KuVEJIgYMW0m
 7Tupkv8KATrv3aqbAodD409454WJikmHWd0w/SjlbMRbX8/L
X-Google-Smtp-Source: AK7set+fiYdL/20PbMmGdByHO7Cgctxr2BNWMLEy39OP9mKD0YmSO0FLCepsjH3LZ27U6vkan+fXqNh6Qfv4AI9Do0zrUEpqe020
MIME-Version: 1.0
X-Received: by 2002:a6b:5d0b:0:b0:74e:7a27:d183 with SMTP id
 r11-20020a6b5d0b000000b0074e7a27d183mr1242791iob.2.1679418235745; Tue, 21 Mar
 2023 10:03:55 -0700 (PDT)
Date: Tue, 21 Mar 2023 10:03:55 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005f023705f76c075c@google.com>
Subject: [syzbot] [fbdev?] KASAN: use-after-free Write in fbcon_get_font
From: syzbot <syzbot+5a04eb16db96950bb112@syzkaller.appspotmail.com>
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

HEAD commit:    fe15c26ee26e Linux 6.3-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11bc9c16c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7573cbcd881a88c9
dashboard link: https://syzkaller.appspot.com/bug?extid=5a04eb16db96950bb112
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=135becbac80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1182c9d2c80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/89d41abd07bd/disk-fe15c26e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fa75f5030ade/vmlinux-fe15c26e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/590d0f5903ee/Image-fe15c26e.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5a04eb16db96950bb112@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in fbcon_get_font+0x240/0x8cc drivers/video/fbdev/core/fbcon.c:2290
Write of size 22062 at addr ffff0000e1bfabd6 by task syz-executor329/5944

CPU: 0 PID: 5944 Comm: syz-executor329 Not tainted 6.3.0-rc1-syzkaller-gfe15c26ee26e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
Call trace:
 dump_backtrace+0x1c8/0x1f4 arch/arm64/kernel/stacktrace.c:158
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:165
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:319 [inline]
 print_report+0x174/0x514 mm/kasan/report.c:430
 kasan_report+0xd4/0x130 mm/kasan/report.c:536
 kasan_check_range+0x264/0x2a4 mm/kasan/generic.c:187
 __asan_memset+0x40/0x70 mm/kasan/shadow.c:84
 fbcon_get_font+0x240/0x8cc drivers/video/fbdev/core/fbcon.c:2290
 con_font_get drivers/tty/vt/vt.c:4559 [inline]
 con_font_op+0x468/0xfa0 drivers/tty/vt/vt.c:4674
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x1a90/0x252c drivers/tty/vt/vt_ioctl.c:752
 tty_ioctl+0x8a4/0xd8c drivers/tty/tty_io.c:2777
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:856
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall+0x98/0x2c0 arch/arm64/kernel/syscall.c:52
 el0_svc_common+0x138/0x258 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x64/0x198 arch/arm64/kernel/syscall.c:193
 el0_svc+0x58/0x168 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:591

The buggy address belongs to the physical page:
page:00000000c3c989b0 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x121800
head:00000000c3c989b0 order:10 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x5ffc00000010000(head|node=0|zone=2|lastcpupid=0x7ff)
raw: 05ffc00000010000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000e1bfff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff0000e1bfff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff0000e1c00000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                   ^
 ffff0000e1c00080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff0000e1c00100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
