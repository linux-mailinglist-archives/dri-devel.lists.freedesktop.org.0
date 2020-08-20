Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71424AFAF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B66E6E8D8;
	Thu, 20 Aug 2020 07:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61446E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 04:56:14 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id y7so750002ilm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 21:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=IV+LyH+BPu5J+Dtv08XtTCzIg9KfbMGVvqfxRyaesJ0=;
 b=HwtVY+CkmwHc6UsnIWQGSSNVTqcMEEDIZeVGB1Ko6hii0MtnHc9Y40HJshtNK+23hs
 KeLCVo31SN9a44tqJB6eu3N4aqeTlira8fhwnQqMizQLjFW+4Kx+3Z4PdjEO5/7Kf8Fa
 h+M3CdrUtBztugPoQz+hikAd52S8/kCpiRT0XJ9sSU21+OLYff1nQRUylOSvUToz9VOj
 AEyLKA4z7d9VzFy52dE8+WgelwE/tug46Py+SHJVFNfQsMXSO7yh70FQHQ1BUWgpSmM9
 sDrUW31/ocBvFgbQgzTgUaQ1tUNWdemRg2QpmqF2qJrr2+1SCco+lAQpTNuTc+yG/qKn
 GcAQ==
X-Gm-Message-State: AOAM5320pznbOzF9Qa4D+faJxrOELjG0XU/HMGp1pxpossSDJEPnigou
 h575fuJo+cbDPhV3zEb01LjVIKRdeeo3IiQlTZg/VS9cmr7F
X-Google-Smtp-Source: ABdhPJzvndFcEzOxi42FfsPZucM5ZTRPrmX++CIV+o19zD4YzElcu7VQEdDp9jZRR2wIDznxF50kvGcjvyJefBVZTcytpRGmI6Nz
MIME-Version: 1.0
X-Received: by 2002:a02:9307:: with SMTP id d7mr1628969jah.71.1597899374117;
 Wed, 19 Aug 2020 21:56:14 -0700 (PDT)
Date: Wed, 19 Aug 2020 21:56:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000094c57905ad47f05e@google.com>
Subject: KMSAN: uninit-value in soft_cursor
From: syzbot <syzbot+2741e4d93bff16ad8d4d@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 glider@google.com, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

HEAD commit:    ce8056d1 wip: changed copy_from_user where instrumented
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=14dcd116900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
dashboard link: https://syzkaller.appspot.com/bug?extid=2741e4d93bff16ad8d4d
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103f7891900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2741e4d93bff16ad8d4d@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in soft_cursor+0xa89/0x13f0 drivers/video/fbdev/core/softcursor.c:61
CPU: 0 PID: 12272 Comm: syz-executor.2 Not tainted 5.8.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:121
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
 soft_cursor+0xa89/0x13f0 drivers/video/fbdev/core/softcursor.c:61
 bit_cursor+0x38c6/0x3a40 drivers/video/fbdev/core/bitblit.c:386
 fbcon_cursor+0x195e/0x1a60 drivers/video/fbdev/core/fbcon.c:1411
 set_cursor drivers/tty/vt/vt.c:915 [inline]
 redraw_screen+0x28ee/0x2980 drivers/tty/vt/vt.c:1031
 vc_do_resize+0x36a8/0x38f0 drivers/tty/vt/vt.c:1314
 vc_resize+0xc3/0xe0 drivers/tty/vt/vt.c:1334
 fbcon_modechanged+0xdc1/0x1320 drivers/video/fbdev/core/fbcon.c:2990
 fbcon_update_vcs+0x86/0xa0 drivers/video/fbdev/core/fbcon.c:3048
 fb_set_var+0x1420/0x1850 drivers/video/fbdev/core/fbmem.c:1056
 do_fb_ioctl+0xc00/0x1150 drivers/video/fbdev/core/fbmem.c:1109
 fb_ioctl+0x1e4/0x210 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl fs/ioctl.c:753 [inline]
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl+0x319/0x4d0 fs/ioctl.c:760
 __x64_sys_ioctl+0x4a/0x70 fs/ioctl.c:760
 do_syscall_64+0xad/0x160 arch/x86/entry/common.c:386
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45d239
Code: Bad RIP value.
RSP: 002b:00007ff9aafacc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000000d580 RCX: 000000000045d239
RDX: 0000000020000000 RSI: 0000000000004601 RDI: 0000000000000003
RBP: 000000000118cf80 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000118cf4c
R13: 000000000169fb6f R14: 00007ff9aafad9c0 R15: 000000000118cf4c

Uninit was stored to memory at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:144 [inline]
 kmsan_internal_chain_origin+0xad/0x130 mm/kmsan/kmsan.c:310
 kmsan_memcpy_memmove_metadata+0x272/0x2e0 mm/kmsan/kmsan.c:247
 kmsan_memcpy_metadata+0xb/0x10 mm/kmsan/kmsan.c:267
 __msan_memcpy+0x43/0x50 mm/kmsan/kmsan_instr.c:116
 soft_cursor+0x44d/0x13f0 drivers/video/fbdev/core/softcursor.c:50
 bit_cursor+0x38c6/0x3a40 drivers/video/fbdev/core/bitblit.c:386
 fbcon_cursor+0x195e/0x1a60 drivers/video/fbdev/core/fbcon.c:1411
 set_cursor drivers/tty/vt/vt.c:915 [inline]
 redraw_screen+0x28ee/0x2980 drivers/tty/vt/vt.c:1031
 vc_do_resize+0x36a8/0x38f0 drivers/tty/vt/vt.c:1314
 vc_resize+0xc3/0xe0 drivers/tty/vt/vt.c:1334
 fbcon_modechanged+0xdc1/0x1320 drivers/video/fbdev/core/fbcon.c:2990
 fbcon_update_vcs+0x86/0xa0 drivers/video/fbdev/core/fbcon.c:3048
 fb_set_var+0x1420/0x1850 drivers/video/fbdev/core/fbmem.c:1056
 do_fb_ioctl+0xc00/0x1150 drivers/video/fbdev/core/fbmem.c:1109
 fb_ioctl+0x1e4/0x210 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl fs/ioctl.c:753 [inline]
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl+0x319/0x4d0 fs/ioctl.c:760
 __x64_sys_ioctl+0x4a/0x70 fs/ioctl.c:760
 do_syscall_64+0xad/0x160 arch/x86/entry/common.c:386
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Local variable ----cursor@bit_cursor created at:
 bit_cursor+0xe3/0x3a40 drivers/video/fbdev/core/bitblit.c:239
 bit_cursor+0xe3/0x3a40 drivers/video/fbdev/core/bitblit.c:239
=====================================================


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
