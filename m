Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4632169D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 13:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C72B6E429;
	Mon, 22 Feb 2021 12:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9D66E924
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 09:15:15 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id s13so1312152ilp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 01:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=OEjUdAntmh0cV69BmZZEmoUlVVj/CIh6n7qrYCRIkK8=;
 b=Xm+Wfao7RaNY8VtX3Hg/VahvE2PPuPQhgBG3h5vjw/fijEWkqM8/kh7w1WNiMcIPlm
 XmqYDV9NyboJyETETje4qEmEz0h+qiuld8e78ETWLdrDeKrNdv37gVKNEW+2G3w8w3Gt
 1/oH4S7SxBWRKMg7VGxox3l6aWoZV5Lt8Fi6wdRrUxVETAMjKutuARb9Wdaul7nA4jdk
 aN5VSGEoxTBIT91UM7GSd2iPSryEHsvC+JHeUAyDdR0IcIWvg2juPe9QzrhWkwjNryLW
 5o+ixTyzDidZo9YENENkY6X8BSl3gklb79nGcsRZgBC9C4Adv5Lsx8XtqAutTbTNPKHv
 3NkQ==
X-Gm-Message-State: AOAM532kEJhdUOinVrLwmj0ODTHwH/64nW3dMlIl8JvRhWVrFBOofwhL
 /hNOHz64j8+m0L3pSx38hjOOsAqGKww40i213z56/t2kJxzY
X-Google-Smtp-Source: ABdhPJxZJaKpP8tyaybDaDJn5xSuedJMPndywknS7IfdSwqObQsk56zdpme9j16Z8mZeWv9AwiK4Xea4DW/KTvNXxPYEmbktDv2r
MIME-Version: 1.0
X-Received: by 2002:a92:ab10:: with SMTP id v16mr14643708ilh.100.1613985314424; 
 Mon, 22 Feb 2021 01:15:14 -0800 (PST)
Date: Mon, 22 Feb 2021 01:15:14 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000056cda705bbe93d11@google.com>
Subject: KMSAN: kernel-infoleak in compat_drm_wait_vblank
From: syzbot <syzbot+620cf21140fc7e772a5d@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 glider@google.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
X-Mailman-Approved-At: Mon, 22 Feb 2021 12:28:50 +0000
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

HEAD commit:    29ad81a1 arch/x86: add missing include to sparsemem.h
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=111e6312d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c8e3b38ca92283e
dashboard link: https://syzkaller.appspot.com/bug?extid=620cf21140fc7e772a5d
compiler:       Debian clang version 11.0.1-2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+620cf21140fc7e772a5d@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: kernel-infoleak in kmsan_copy_to_user+0x9c/0xb0 mm/kmsan/kmsan_hooks.c:249
CPU: 1 PID: 26999 Comm: syz-executor.2 Not tainted 5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 kmsan_internal_check_memory+0x484/0x520 mm/kmsan/kmsan.c:437
 kmsan_copy_to_user+0x9c/0xb0 mm/kmsan/kmsan_hooks.c:249
 instrument_copy_to_user include/linux/instrumented.h:121 [inline]
 _copy_to_user+0x1ac/0x270 lib/usercopy.c:33
 copy_to_user include/linux/uaccess.h:209 [inline]
 compat_drm_wait_vblank+0x36f/0x450 drivers/gpu/drm/drm_ioc32.c:866
 drm_compat_ioctl+0x3f6/0x590 drivers/gpu/drm/drm_ioc32.c:995
 __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
 __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
 __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
 do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
 __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
 do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
 do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7f47549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000f55415fc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c018643a
RDX: 0000000020000100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Uninit was stored to memory at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:121 [inline]
 kmsan_internal_chain_origin+0xad/0x130 mm/kmsan/kmsan.c:289
 __msan_chain_origin+0x57/0xa0 mm/kmsan/kmsan_instr.c:147
 compat_drm_wait_vblank+0x43c/0x450 drivers/gpu/drm/drm_ioc32.c:865
 drm_compat_ioctl+0x3f6/0x590 drivers/gpu/drm/drm_ioc32.c:995
 __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
 __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
 __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
 do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
 __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
 do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
 do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c

Local variable ----req@compat_drm_wait_vblank created at:
 compat_drm_wait_vblank+0x7b/0x450 drivers/gpu/drm/drm_ioc32.c:849
 compat_drm_wait_vblank+0x7b/0x450 drivers/gpu/drm/drm_ioc32.c:849

Bytes 12-15 of 16 are uninitialized
Memory access of size 16 starts at ffff88814ffe3c98
Data copied to user address 0000000020000100
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
