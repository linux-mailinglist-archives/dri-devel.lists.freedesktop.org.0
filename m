Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F499CA3FF7
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 15:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1A310E1DC;
	Thu,  4 Dec 2025 14:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com
 [209.85.210.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAB610E1DC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 14:25:28 +0000 (UTC)
Received: by mail-ot1-f77.google.com with SMTP id
 46e09a7af769-7c7599be25cso1747750a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 06:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764858327; x=1765463127;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2qChMBo//uJtvgAzYTP8cENEAgL+uL69Q2If0xHljM=;
 b=CVcXM1Hw8msuqdfTnkozP5MRij4HED2qAd5fR3Va0X4n8Nrc7jBothkou8n3sRqhOP
 tpicV0K5XlhXXxymAogIZJkes1UZ0YNxPg+GtQV08SfFN7vGWTEu4vi86MJDzTuwH0Bp
 OynHKMWBoxA7U1v93X4WLXtTu4JMURnM8d81YGpev6gRBJNciGPFRfKDKDfkIPfkMrFi
 8KAPDIbNBls7TUIV7RUqhQd8/gplJKFcE8mHQcXtjm3VOMlaktYMo+CyivB9q2E7PJRr
 V7I3cJwlQvV3rGUJkEk5kA/77WYYHPwznbrO6Z+b1mBil17ZG0gYjw8L10fP78KRIGqc
 4u5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj5wWzqa4y5lTIghaJOlnJp8otXyohyXfPDoKn+cW88S3lw4wjaZhOgTO42HFx9xC9AQjRf3CZV8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4kC1zZTDhKAOz7FoFU5ZCV2AXqztBCsHNHY9lFe8OBCmolWvv
 1QFd8iFe3b5Bbz//nmlNrJiKPq2+qkUSMoJ+VGK6DZn5VFrHsuU0BstZq06VA9mAvWc86rm7TqM
 aCrlMS/ZClsnsCqpuvYhrJu7PaOGd8USPP2JZfGdKkiRdnoDkTpPlogh4wz8=
X-Google-Smtp-Source: AGHT+IEJTaO4qLqtOb/Hk3SCPxBNfMfkFgNDB8YMXKqpPViTWH8/ZDLkrhag7RmDAky8riFCAlPUJvpGihd+b5bDM30Wa5U8Q04u
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1512:b0:44d:aa6b:a59a with SMTP id
 5614622812f47-45379c6bfb5mr1862469b6e.10.1764858327394; Thu, 04 Dec 2025
 06:25:27 -0800 (PST)
Date: Thu, 04 Dec 2025 06:25:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <693199d7.a70a0220.2ea503.00de.GAE@google.com>
Subject: [syzbot] [dri?] memory leak in drm_mode_atomic_ioctl
From: syzbot <syzbot+3fc9eecaf97147282c87@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, simona@ffwll.ch, syzkaller-bugs@googlegroups.com, 
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

HEAD commit:    6bda50f4333f Merge tag 'mips-fixes_6.18_2' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17ab8512580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f30cc590c4f6da44
dashboard link: https://syzkaller.appspot.com/bug?extid=3fc9eecaf97147282c87
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14447cb4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1094d508580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/864951cecf67/disk-6bda50f4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4692a21b76e7/vmlinux-6bda50f4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a2898beb8301/bzImage-6bda50f4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3fc9eecaf97147282c87@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888125711880 (size 128):
  comm "syz.0.18", pid 6089, jiffies 4294942955
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc f5a89fc0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    create_vblank_event drivers/gpu/drm/drm_atomic_uapi.c:931 [inline]
    prepare_signaling drivers/gpu/drm/drm_atomic_uapi.c:1221 [inline]
    drm_mode_atomic_ioctl+0x924/0x13d0 drivers/gpu/drm/drm_atomic_uapi.c:1529
    drm_ioctl_kernel+0x125/0x1f0 drivers/gpu/drm/drm_ioctl.c:797
    drm_ioctl+0x371/0x6b0 drivers/gpu/drm/drm_ioctl.c:894
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xfa0 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888125711780 (size 128):
  comm "syz.0.19", pid 6092, jiffies 4294942957
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc f5a89fc0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    create_vblank_event drivers/gpu/drm/drm_atomic_uapi.c:931 [inline]
    prepare_signaling drivers/gpu/drm/drm_atomic_uapi.c:1221 [inline]
    drm_mode_atomic_ioctl+0x924/0x13d0 drivers/gpu/drm/drm_atomic_uapi.c:1529
    drm_ioctl_kernel+0x125/0x1f0 drivers/gpu/drm/drm_ioctl.c:797
    drm_ioctl+0x371/0x6b0 drivers/gpu/drm/drm_ioctl.c:894
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xfa0 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888125711700 (size 128):
  comm "syz.0.20", pid 6121, jiffies 4294943534
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc f5a89fc0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    create_vblank_event drivers/gpu/drm/drm_atomic_uapi.c:931 [inline]
    prepare_signaling drivers/gpu/drm/drm_atomic_uapi.c:1221 [inline]
    drm_mode_atomic_ioctl+0x924/0x13d0 drivers/gpu/drm/drm_atomic_uapi.c:1529
    drm_ioctl_kernel+0x125/0x1f0 drivers/gpu/drm/drm_ioctl.c:797
    drm_ioctl+0x371/0x6b0 drivers/gpu/drm/drm_ioctl.c:894
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xfa0 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881266fab80 (size 128):
  comm "syz.0.21", pid 6122, jiffies 4294943536
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc f5a89fc0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    create_vblank_event drivers/gpu/drm/drm_atomic_uapi.c:931 [inline]
    prepare_signaling drivers/gpu/drm/drm_atomic_uapi.c:1221 [inline]
    drm_mode_atomic_ioctl+0x924/0x13d0 drivers/gpu/drm/drm_atomic_uapi.c:1529
    drm_ioctl_kernel+0x125/0x1f0 drivers/gpu/drm/drm_ioctl.c:797
    drm_ioctl+0x371/0x6b0 drivers/gpu/drm/drm_ioctl.c:894
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xfa0 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
