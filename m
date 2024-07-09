Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884A92BC11
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBA210E570;
	Tue,  9 Jul 2024 13:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AB710E570
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:54:26 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-37492fe22cdso44416725ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720533266; x=1721138066;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=snTFk8YSasYZt6SETCH3WdS1mxN1Nt5Yw/Z1sH50H78=;
 b=DrNkzEWJOO9xJ8fC4VlfNnOnOLEUJ5WsfwI7oYia8vA6NBAL1LSgZ4Y/3h+BZRjiFd
 +fAtsONphbI5LkgSOHPX1jxlfSXntl1GRd/CoRr/5AS08lb7WyOmOpgVbNootvSUvRRk
 NuvPvl4IUdnaukibh41Oz1RyBkiAzRoNhEe6vdadkT3iPW7xoLoE9JSQN1kkmNlG+vrP
 7Rgs2juhQuaCVeBB4F+/ghdhw6Gb8TiVn/9TQQLF9+7PSu7WWG+q7UuHP98IV1MmifAe
 fe9zOyS4OLmtLWjzm+pyER1M95aJdE4OCR1CHKG3l9rtWRIx+h1kSHeJduLZfGzGe+oG
 aNyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvPON4WkeaeyMSaHQc4DvU5k3kjtLefs1S6edXb9d8z0EhaXCvtQpiHEY8CKR3cyah+8jnPmT2p50IPa8ffnjSYw7x8rQThMsE0ANjqiay
X-Gm-Message-State: AOJu0YzlDVBUJSpbhM/erADxPEQSn3ocoTIwaVvqHj73zd5ruESyQoew
 n2pIIyAEzY8rR7zq69ZXJBP9wVQnzV/tbVEPHOJZ5PA6zEhxjpGaXkiGowApTj6D53EVUR1NJDV
 kSFvOplu7Y4ITpwCcE2PhaHfBU9evz8Htg72O+/lIKkPt8xxtAVRi2hw=
X-Google-Smtp-Source: AGHT+IG0ojBHzU/p5f1mgufY2ZyuWUstkL7KugIXRmFJGywhbL9NaWH1t+SqEkvkdMtgZKcuHVNUeFT7NH4/E6j4YqjMPKftm7JV
MIME-Version: 1.0
X-Received: by 2002:a92:d6d1:0:b0:377:15b9:950d with SMTP id
 e9e14a558f8ab-38a70e42284mr659195ab.0.1720533266116; Tue, 09 Jul 2024
 06:54:26 -0700 (PDT)
Date: Tue, 09 Jul 2024 06:54:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000026c1ff061cd0de12@google.com>
Subject: [syzbot] [dri?] possible deadlock in modeset_lock
From: syzbot <syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net, 
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com, 
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

HEAD commit:    661e504db04c Merge tag 'for-6.10-rc6-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=144e9f99980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=864caee5f78cab51
dashboard link: https://syzkaller.appspot.com/bug?extid=6cebc1af246fe020a2f0
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3e115f4e545a/disk-661e504d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/48cfbafd84c8/vmlinux-661e504d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b19b9de9b5fd/bzImage-661e504d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.10.0-rc6-syzkaller-00163-g661e504db04c #0 Not tainted
------------------------------------------------------
syz.3.2274/16483 is trying to acquire lock:
ffff88807aca9e18 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0xaa/0x120 mm/memory.c:6234

but task is already holding lock:
ffff88801fc08518 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0x2bf/0x650 drivers/gpu/drm/drm_modeset_lock.c:314

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #8 (crtc_ww_class_mutex){+.+.}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __ww_mutex_lock+0x1ac/0x2790 kernel/locking/mutex.c:759
       ww_mutex_lock+0x40/0x1f0 kernel/locking/mutex.c:876
       modeset_lock+0x2bf/0x650 drivers/gpu/drm/drm_modeset_lock.c:314
       drmm_mode_config_init+0xe91/0x17d0 drivers/gpu/drm/drm_mode_config.c:454
       vkms_modeset_init drivers/gpu/drm/vkms/vkms_drv.c:156 [inline]
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:215 [inline]
       vkms_init+0x380/0x730 drivers/gpu/drm/vkms/vkms_drv.c:252
       do_one_initcall+0x24a/0x880 init/main.c:1267
       do_initcall_level+0x157/0x210 init/main.c:1329
       do_initcalls+0x3f/0x80 init/main.c:1345
       kernel_init_freeable+0x435/0x5d0 init/main.c:1578
       kernel_init+0x1d/0x2b0 init/main.c:1467
       ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #7 (crtc_ww_class_acquire){+.+.}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       ww_acquire_init include/linux/ww_mutex.h:149 [inline]
       drm_modeset_acquire_init+0x1b7/0x360 drivers/gpu/drm/drm_modeset_lock.c:250
       drm_client_modeset_commit_atomic+0xd5/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1002
       drm_client_modeset_commit_locked+0xe0/0x520 drivers/gpu/drm/drm_client_modeset.c:1166
       drm_client_modeset_commit+0x4a/0x70 drivers/gpu/drm/drm_client_modeset.c:1192
       __drm_fb_helper_restore_fbdev_mode_unlocked+0xc3/0x170 drivers/gpu/drm/drm_fb_helper.c:251
       drm_fb_helper_set_par+0xaf/0x100 drivers/gpu/drm/drm_fb_helper.c:1347
       fbcon_init+0x112d/0x2100 drivers/video/fbdev/core/fbcon.c:1093
       visual_init+0x2e9/0x660 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x863/0xf60 drivers/tty/vt/vt.c:3833
       do_take_over_console+0x5e7/0x750 drivers/tty/vt/vt.c:4399
       do_fbcon_takeover+0x11a/0x200 drivers/video/fbdev/core/fbcon.c:531
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2968 [inline]
       fbcon_fb_registered+0x364/0x620 drivers/video/fbdev/core/fbcon.c:2988
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x66f/0x820 drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x1716/0x1df0 drivers/gpu/drm/drm_fb_helper.c:1871
       drm_fbdev_generic_client_hotplug+0x16e/0x230 drivers/gpu/drm/drm_fbdev_generic.c:278
       drm_client_register+0x181/0x210 drivers/gpu/drm/drm_client.c:141
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:226 [inline]
       vkms_init+0x5f5/0x730 drivers/gpu/drm/vkms/vkms_drv.c:252
       do_one_initcall+0x24a/0x880 init/main.c:1267
       do_initcall_level+0x157/0x210 init/main.c:1329
       do_initcalls+0x3f/0x80 init/main.c:1345
       kernel_init_freeable+0x435/0x5d0 init/main.c:1578
       kernel_init+0x1d/0x2b0 init/main.c:1467
       ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #6 (&client->modeset_mutex){+.+.}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __mutex_lock+0x136/0xd70 kernel/locking/mutex.c:752
       drm_client_modeset_probe+0x3b9/0x5480 drivers/gpu/drm/drm_client_modeset.c:832
       __drm_fb_helper_initial_config_and_unlock+0x112/0x1df0 drivers/gpu/drm/drm_fb_helper.c:1848
       drm_fbdev_generic_client_hotplug+0x16e/0x230 drivers/gpu/drm/drm_fbdev_generic.c:278
       drm_client_register+0x181/0x210 drivers/gpu/drm/drm_client.c:141
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:226 [inline]
       vkms_init+0x5f5/0x730 drivers/gpu/drm/vkms/vkms_drv.c:252
       do_one_initcall+0x24a/0x880 init/main.c:1267
       do_initcall_level+0x157/0x210 init/main.c:1329
       do_initcalls+0x3f/0x80 init/main.c:1345
       kernel_init_freeable+0x435/0x5d0 init/main.c:1578
       kernel_init+0x1d/0x2b0 init/main.c:1467
       ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #5 (&helper->lock){+.+.}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __mutex_lock+0x136/0xd70 kernel/locking/mutex.c:752
       __drm_fb_helper_restore_fbdev_mode_unlocked+0xa2/0x170 drivers/gpu/drm/drm_fb_helper.c:242
       drm_fb_helper_set_par+0xaf/0x100 drivers/gpu/drm/drm_fb_helper.c:1347
       fbcon_init+0x112d/0x2100 drivers/video/fbdev/core/fbcon.c:1093
       visual_init+0x2e9/0x660 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x863/0xf60 drivers/tty/vt/vt.c:3833
       do_take_over_console+0x5e7/0x750 drivers/tty/vt/vt.c:4399
       do_fbcon_takeover+0x11a/0x200 drivers/video/fbdev/core/fbcon.c:531
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2968 [inline]
       fbcon_fb_registered+0x364/0x620 drivers/video/fbdev/core/fbcon.c:2988
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x66f/0x820 drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x1716/0x1df0 drivers/gpu/drm/drm_fb_helper.c:1871
       drm_fbdev_generic_client_hotplug+0x16e/0x230 drivers/gpu/drm/drm_fbdev_generic.c:278
       drm_client_register+0x181/0x210 drivers/gpu/drm/drm_client.c:141
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:226 [inline]
       vkms_init+0x5f5/0x730 drivers/gpu/drm/vkms/vkms_drv.c:252
       do_one_initcall+0x24a/0x880 init/main.c:1267
       do_initcall_level+0x157/0x210 init/main.c:1329
       do_initcalls+0x3f/0x80 init/main.c:1345
       kernel_init_freeable+0x435/0x5d0 init/main.c:1578
       kernel_init+0x1d/0x2b0 init/main.c:1467
       ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #4 (console_lock){+.+.}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       console_lock+0x164/0x1b0 kernel/printk/printk.c:2665
       bch2_print_string_as_lines+0x20/0xc0 fs/bcachefs/util.c:264
       bch2_fsck_err+0xd44/0x1450 fs/bcachefs/error.c:352
       bch2_gc_mark_key+0xa69/0x1010 fs/bcachefs/btree_gc.c:586
       bch2_gc_btree fs/bcachefs/btree_gc.c:664 [inline]
       bch2_gc_btrees fs/bcachefs/btree_gc.c:697 [inline]
       bch2_check_allocations+0x3668/0xccc0 fs/bcachefs/btree_gc.c:1224
       bch2_run_recovery_pass+0xf2/0x1e0 fs/bcachefs/recovery_passes.c:182
       bch2_run_recovery_passes+0x19e/0x820 fs/bcachefs/recovery_passes.c:225
       bch2_fs_recovery+0x2386/0x3730 fs/bcachefs/recovery.c:813
       bch2_fs_start+0x356/0x5b0 fs/bcachefs/super.c:1035
       bch2_fs_open+0xa8d/0xdf0 fs/bcachefs/super.c:2132
       bch2_mount+0x6b0/0x13a0 fs/bcachefs/fs.c:1926
       legacy_get_tree+0xf0/0x190 fs/fs_context.c:662
       vfs_get_tree+0x92/0x2a0 fs/super.c:1789
       do_new_mount+0x2be/0xb40 fs/namespace.c:3352
       do_mount fs/namespace.c:3692 [inline]
       __do_sys_mount fs/namespace.c:3898 [inline]
       __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (&c->fsck_error_msgs_lock){+.+.}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __mutex_lock+0x136/0xd70 kernel/locking/mutex.c:752
       bch2_fsck_err+0x311/0x1450 fs/bcachefs/error.c:239
       bch2_gc_done fs/bcachefs/btree_gc.c:767 [inline]
       bch2_check_allocations+0x7d39/0xccc0 fs/bcachefs/btree_gc.c:1233
       bch2_run_recovery_pass+0xf2/0x1e0 fs/bcachefs/recovery_passes.c:182
       bch2_run_recovery_passes+0x19e/0x820 fs/bcachefs/recovery_passes.c:225
       bch2_fs_recovery+0x2386/0x3730 fs/bcachefs/recovery.c:813
       bch2_fs_start+0x356/0x5b0 fs/bcachefs/super.c:1035
       bch2_fs_open+0xa8d/0xdf0 fs/bcachefs/super.c:2132
       bch2_mount+0x6b0/0x13a0 fs/bcachefs/fs.c:1926
       legacy_get_tree+0xf0/0x190 fs/fs_context.c:662
       vfs_get_tree+0x92/0x2a0 fs/super.c:1789
       do_new_mount+0x2be/0xb40 fs/namespace.c:3352
       do_mount fs/namespace.c:3692 [inline]
       __do_sys_mount fs/namespace.c:3898 [inline]
       __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&c->mark_lock){++++}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       percpu_down_read+0x44/0x1b0 include/linux/percpu-rwsem.h:51
       __bch2_disk_reservation_add+0x97/0x620 fs/bcachefs/buckets.c:1530
       bch2_disk_reservation_add fs/bcachefs/buckets.h:430 [inline]
       bch2_folio_reservation_get+0x2d1/0x600 fs/bcachefs/fs-io-pagecache.c:446
       bch2_page_mkwrite+0x8a5/0xd90 fs/bcachefs/fs-io-pagecache.c:616
       do_page_mkwrite+0x19d/0x480 mm/memory.c:3093
       do_shared_fault mm/memory.c:4993 [inline]
       do_fault mm/memory.c:5055 [inline]
       do_pte_missing mm/memory.c:3897 [inline]
       handle_pte_fault+0x1290/0x7090 mm/memory.c:5381
       __handle_mm_fault mm/memory.c:5524 [inline]
       handle_mm_fault+0x10df/0x1ba0 mm/memory.c:5689
       do_user_addr_fault arch/x86/mm/fault.c:1389 [inline]
       handle_page_fault arch/x86/mm/fault.c:1481 [inline]
       exc_page_fault+0x2b9/0x8c0 arch/x86/mm/fault.c:1539
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623

-> #1 (sb_pagefaults#2){.+.+}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1655 [inline]
       sb_start_pagefault include/linux/fs.h:1820 [inline]
       bch2_page_mkwrite+0x2fc/0xd90 fs/bcachefs/fs-io-pagecache.c:593
       do_page_mkwrite+0x19d/0x480 mm/memory.c:3093
       do_shared_fault mm/memory.c:4993 [inline]
       do_fault mm/memory.c:5055 [inline]
       do_pte_missing mm/memory.c:3897 [inline]
       handle_pte_fault+0x1290/0x7090 mm/memory.c:5381
       __handle_mm_fault mm/memory.c:5524 [inline]
       handle_mm_fault+0x10df/0x1ba0 mm/memory.c:5689
       do_user_addr_fault arch/x86/mm/fault.c:1389 [inline]
       handle_page_fault arch/x86/mm/fault.c:1481 [inline]
       exc_page_fault+0x2b9/0x8c0 arch/x86/mm/fault.c:1539
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3134 [inline]
       check_prevs_add kernel/locking/lockdep.c:3253 [inline]
       validate_chain+0x18e0/0x5900 kernel/locking/lockdep.c:3869
       __lock_acquire+0x1346/0x1fd0 kernel/locking/lockdep.c:5137
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       __might_fault+0xc6/0x120 mm/memory.c:6234
       drm_mode_object_get_properties+0x222/0x4d0 drivers/gpu/drm/drm_mode_object.c:406
       drm_mode_obj_get_properties_ioctl+0x350/0x610 drivers/gpu/drm/drm_mode_object.c:458
       drm_ioctl_kernel+0x33c/0x440 drivers/gpu/drm/drm_ioctl.c:744
       drm_ioctl+0x611/0xad0 drivers/gpu/drm/drm_ioctl.c:841
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &mm->mmap_lock --> crtc_ww_class_acquire --> crtc_ww_class_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(crtc_ww_class_mutex);
                               lock(crtc_ww_class_acquire);
                               lock(crtc_ww_class_mutex);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

2 locks held by syz.3.2274/16483:
 #0: ffffc900044d7b30 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_obj_get_properties_ioctl+0x1d3/0x610 drivers/gpu/drm/drm_mode_object.c:446
 #1: ffff88801fc08518 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0x2bf/0x650 drivers/gpu/drm/drm_modeset_lock.c:314

stack backtrace:
CPU: 1 PID: 16483 Comm: syz.3.2274 Not tainted 6.10.0-rc6-syzkaller-00163-g661e504db04c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2187
 check_prev_add kernel/locking/lockdep.c:3134 [inline]
 check_prevs_add kernel/locking/lockdep.c:3253 [inline]
 validate_chain+0x18e0/0x5900 kernel/locking/lockdep.c:3869
 __lock_acquire+0x1346/0x1fd0 kernel/locking/lockdep.c:5137
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
 __might_fault+0xc6/0x120 mm/memory.c:6234
 drm_mode_object_get_properties+0x222/0x4d0 drivers/gpu/drm/drm_mode_object.c:406
 drm_mode_obj_get_properties_ioctl+0x350/0x610 drivers/gpu/drm/drm_mode_object.c:458
 drm_ioctl_kernel+0x33c/0x440 drivers/gpu/drm/drm_ioctl.c:744
 drm_ioctl+0x611/0xad0 drivers/gpu/drm/drm_ioctl.c:841
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7140375bd9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7141231048 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f7140503f60 RCX: 00007f7140375bd9
RDX: 00000000200002c0 RSI: 00000000c02064b9 RDI: 0000000000000003
RBP: 00007f71403e4aa1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007f7140503f60 R15: 00007ffdba322618
 </TASK>


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
