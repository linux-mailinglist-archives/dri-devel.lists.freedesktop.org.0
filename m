Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FA631BC35
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 16:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EC96E3CE;
	Mon, 15 Feb 2021 15:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558CB89F0B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 15:17:21 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id s12so5552786ilh.20
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 07:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=Ik+zbkUUT7o5CXIWisz6oWxrHhb0QPnBkokiBVI2sAM=;
 b=MtaXBHSD+cNGQ3obE+j/V/8CYO4DN+/wUhEPe3dxWDClGtHYeb8GAHGXFHQtrEpTU5
 Bnxj71qE/YGoDyV7PoSGs9DwvmOUwKi3fk8rBHL2upXlm2uaAfXw4e900G4430xM9byo
 ywkfqnzQnzbVk7fwzKXLJzgbfVLHTcihCGdvrb/9CdQoIjDnUAfAX0Y/3AUHhaj1xpwn
 FlWzAvDKy4KiPTT8ryPvKvHKVhBccTYkUFmdmn6xDzLhuFkiUlg5MDJ+sL0t3srE4F3B
 9U3XU+PkRmx1oqc9yEmZM3wS1/pDxlon3Dq+uq7Mn4k6/2DQy6hfW/gpJw+fS9/3+YKd
 Av/g==
X-Gm-Message-State: AOAM533l01lcIO2ttjsXVWCLcr64GU+u6dHxPd5t7jW5YJj687Lk2+yt
 yEG7PxSCf8EW6+dRj2Iw4q4ZEcDgSK1VG/4x3V1VCDghGzlV
X-Google-Smtp-Source: ABdhPJyUvm9QRSyLtDmlJSFIa6Q6kBIndzWPojWxEe5oc8YXRaPi0Q+gt53AaYhpCUllswdtzXt0C8KYrsfsFCSivjy95ds4c1Nf
MIME-Version: 1.0
X-Received: by 2002:a5e:dd09:: with SMTP id t9mr7237557iop.57.1613402240583;
 Mon, 15 Feb 2021 07:17:20 -0800 (PST)
Date: Mon, 15 Feb 2021 07:17:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006e0bfa05bb617b2b@google.com>
Subject: KMSAN: kernel-infoleak in fb_cmap_to_user
From: syzbot <syzbot+47fa9c9c648b765305b9@syzkaller.appspotmail.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, glider@google.com,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mchehab+huawei@kernel.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 15 Feb 2021 15:23:51 +0000
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
console output: https://syzkaller.appspot.com/x/log.txt?x=1001ac60d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c8e3b38ca92283e
dashboard link: https://syzkaller.appspot.com/bug?extid=47fa9c9c648b765305b9
compiler:       Debian clang version 11.0.1-2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ffe738d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ca2914d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+47fa9c9c648b765305b9@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: kernel-infoleak in kmsan_copy_to_user+0x9c/0xb0 mm/kmsan/kmsan_hooks.c:249
CPU: 1 PID: 8225 Comm: syz-executor269 Not tainted 5.11.0-rc7-syzkaller #0
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
 fb_cmap_to_user+0x40a/0x990 drivers/video/fbdev/core/fbcmap.c:208
 do_fb_ioctl+0xc53/0x1090 drivers/video/fbdev/core/fbmem.c:1136
 fb_ioctl+0x1e4/0x210 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl+0x311/0x4d0 fs/ioctl.c:739
 __x64_sys_ioctl+0x4a/0x70 fs/ioctl.c:739
 do_syscall_64+0x9f/0x140 arch/x86/entry/common.c:48
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x43fbd9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc68acbf98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000400488 RCX: 000000000043fbd9
RDX: 0000000020007400 RSI: 0000000000004604 RDI: 0000000000000003
RBP: 0000000000000000 R08: 00007ffc68acc138 R09: 00007ffc68acc138
R10: 00007ffc68acba10 R11: 0000000000000246 R12: 0000000000403460
R13: 431bde82d7b634db R14: 00000000004ad018 R15: 0000000000400488

Uninit was created at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:121 [inline]
 kmsan_internal_poison_shadow+0x5c/0xf0 mm/kmsan/kmsan.c:104
 kmsan_slab_alloc+0x8d/0xe0 mm/kmsan/kmsan_hooks.c:76
 slab_alloc_node mm/slub.c:2907 [inline]
 slab_alloc mm/slub.c:2916 [inline]
 __kmalloc+0x378/0x560 mm/slub.c:3998
 kmalloc include/linux/slab.h:557 [inline]
 fb_alloc_cmap_gfp+0x39b/0xa70 drivers/video/fbdev/core/fbcmap.c:104
 fb_alloc_cmap+0x95/0xb0 drivers/video/fbdev/core/fbcmap.c:135
 drm_fb_helper_alloc_fbi+0x106/0x3f0 drivers/gpu/drm/drm_fb_helper.c:563
 drm_fb_helper_generic_probe+0x4f3/0xc70 drivers/gpu/drm/drm_fb_helper.c:2320
 drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1658 [inline]
 __drm_fb_helper_initial_config_and_unlock+0x1cac/0x26c0 drivers/gpu/drm/drm_fb_helper.c:1816
 drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1911 [inline]
 drm_fbdev_client_hotplug+0xbb8/0xd70 drivers/gpu/drm/drm_fb_helper.c:2413
 drm_fbdev_generic_setup+0x39d/0xa00 drivers/gpu/drm/drm_fb_helper.c:2495
 vkms_init+0x880/0xa02 drivers/gpu/drm/vkms/vkms_drv.c:168
 do_one_initcall+0x362/0x8d0 init/main.c:1226
 do_initcall_level+0x1e7/0x35a init/main.c:1299
 do_initcalls+0x127/0x1cb init/main.c:1315
 do_basic_setup+0x33/0x36 init/main.c:1335
 kernel_init_freeable+0x23d/0x390 init/main.c:1536
 kernel_init+0x1f/0x840 init/main.c:1424
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Bytes 0-1 of 2 are uninitialized
Memory access of size 2 starts at ffff8881455651c0
Data copied to user address 0000000020007300
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
