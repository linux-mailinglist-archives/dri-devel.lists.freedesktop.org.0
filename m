Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D3734317
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 20:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6A010E053;
	Sat, 17 Jun 2023 18:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com
 [209.85.166.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB87F10E053
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 18:42:47 +0000 (UTC)
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-33d93feefb5so16098005ab.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 11:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687027366; x=1689619366;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DBaDf6IaqpzK1ZRigtHt9P4RoGRnNk1rRIyUUGVymcY=;
 b=CVRlRdvhbRHmDvEHOVv+iAk1qKrRnluwQE6xv22Dm5vdQa950VCr3Wrl4PK79goMDH
 wHfL+VFwACzL3FJxaDW4WpTxeJbp+B47+lzGNEjYhytBBXVx5Oc2WX+6vga4G7vXYRNm
 TCzrL6Ay1KZ+Kp3iBuVVIkka+hGY5ExDKPL5rlWIXALVdLzse88yZ4Ca3fOplAOZjBmA
 X2gjol9oZOYY+SvsqZs2pJpJ44yuX/OssvqqMmIXKhmmokM6hQMn9u0PQBNAlJT8/Qrw
 9O8L48bu7pRiHAUVlbkC3ZSia2WxmmYtPjFZ/ysTBE9x/4mekJb/dAZ2X+1XbI6NuZsM
 qO8Q==
X-Gm-Message-State: AC+VfDwHpaJrw43IUESjbN5KMQQhnhNljfePpbQDtjZVxFWdhFWZ1u/M
 yfF+3lhWxbiHO8v/2C5VFSH4vexrH33S+IprFRRlOU0C1+1i
X-Google-Smtp-Source: ACHHUZ7CYafZSONe2OvDQu1FzU/g//AWiU+h+oZNfT7C8pKY2i6K0k+u8Q1dvFGQcIC5sN+Dv8KKCW7XpvJDLw7jCAqjoAFcGZXK
MIME-Version: 1.0
X-Received: by 2002:a92:d204:0:b0:338:bdd7:d439 with SMTP id
 y4-20020a92d204000000b00338bdd7d439mr1512731ily.6.1687027366660; Sat, 17 Jun
 2023 11:42:46 -0700 (PDT)
Date: Sat, 17 Jun 2023 11:42:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ea931b05fe57aa62@google.com>
Subject: [syzbot] [dri?] KMSAN: uninit-value in drm_mode_setcrtc
From: syzbot <syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com>
To: airlied@gmail.com, christian.koenig@amd.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, glider@google.com, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
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

HEAD commit:    2741f1b02117 string: use __builtin_memcpy() in strlcpy/str..
git tree:       https://github.com/google/kmsan.git master
console+strace: https://syzkaller.appspot.com/x/log.txt?x=17bb33d1280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=753079601b2300f9
dashboard link: https://syzkaller.appspot.com/bug?extid=4fad2e57beb6397ab2fc
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d669a5280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d8f095280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ebd05512d8d7/disk-2741f1b0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/aa555b09582c/vmlinux-2741f1b0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5ea0934e02cc/bzImage-2741f1b0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in drm_mode_setcrtc+0x1ad3/0x24a0 drivers/gpu/drm/drm_crtc.c:896
 drm_mode_setcrtc+0x1ad3/0x24a0 drivers/gpu/drm/drm_crtc.c:896
 drm_ioctl_kernel+0x5ae/0x730 drivers/gpu/drm/drm_ioctl.c:788
 drm_ioctl+0xd12/0x1590 drivers/gpu/drm/drm_ioctl.c:891
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl+0x222/0x400 fs/ioctl.c:856
 __x64_sys_ioctl+0x96/0xe0 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Uninit was created at:
 slab_post_alloc_hook+0x12d/0xb60 mm/slab.h:716
 slab_alloc_node mm/slub.c:3451 [inline]
 __kmem_cache_alloc_node+0x4ff/0x8b0 mm/slub.c:3490
 __do_kmalloc_node mm/slab_common.c:965 [inline]
 __kmalloc+0x121/0x3c0 mm/slab_common.c:979
 kmalloc_array include/linux/slab.h:596 [inline]
 drm_mode_setcrtc+0x1dba/0x24a0 drivers/gpu/drm/drm_crtc.c:846
 drm_ioctl_kernel+0x5ae/0x730 drivers/gpu/drm/drm_ioctl.c:788
 drm_ioctl+0xd12/0x1590 drivers/gpu/drm/drm_ioctl.c:891
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl+0x222/0x400 fs/ioctl.c:856
 __x64_sys_ioctl+0x96/0xe0 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

CPU: 1 PID: 4955 Comm: syz-executor275 Not tainted 6.4.0-rc4-syzkaller-g2741f1b02117 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/25/2023
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
