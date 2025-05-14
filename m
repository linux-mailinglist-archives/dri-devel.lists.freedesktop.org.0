Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C72AB6353
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 08:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A675610E1CD;
	Wed, 14 May 2025 06:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com
 [209.85.166.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0340610E1CD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 06:40:32 +0000 (UTC)
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3da644c8ffeso80209885ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 23:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747204832; x=1747809632;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vAkEPTx9dwkkj2bKXpi/HQeoWZ571gGmHN0U6s+XGdQ=;
 b=KB13xlRG5IIZDYFfGgKAgKa/CKjvVQWKlCjNEw10t4vjgOTIoaoq79jA8Di24CPkor
 mqAKJQT6riQUN9rud2wsMVzeC8u0Q0PB0Am8D4WsjGnU5itlXplGc/rbOu37Yj1kOJM0
 Cq/c+92fev0DM7tjvlbvtQKFMM2MDY2r5FM5WGxPNW5qV0n1Miw5bJ6vkDMoQnT4z7BM
 Ew76OHHljTx1f4cGPSU3WYbW6EMIzMwj+HR6FALidjVJFAt31bMMBwzsZugcc1UKvOn0
 U0HlBev38QdC9l4LkRhBc47UQWPiQUZ7SlDmon7E6kDM9o2TrpCBurMgVijtbMLClJhz
 KJKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/1GFAtVdb8nxUhy39ddc0EqjT/n0LX2fitmwg1BFX238VIwkbE0n01j4piep2wmrTx/RNhlnLbLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKq6uk08EaB6PPS58zNbZg60yEks4+tbfwntAlaClES9Ru5qa4
 1D7bebWInJf9z3d8RkisUGkfwBJeHWQz95vfTnmiXrybYYHGHYXBYyxMFUUv9s4dSEFyPeBvHiX
 Mn3U8utopKFzWxLDb8ahRjUodHvTiSshazCXCVoHBTyrFomMIRugAzIY=
X-Google-Smtp-Source: AGHT+IHHhQQCW5/K5DJPkjnABHCuBbIWp8ak8GtY03cIu1seXcaQ8QRalrBlss8xHy6JWJDQHtaIeCBxD4w/ET+KdjTBFKu3MkFa
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:188f:b0:3d9:66c7:d1e8 with SMTP id
 e9e14a558f8ab-3db6f6949fcmr23077055ab.0.1747204832103; Tue, 13 May 2025
 23:40:32 -0700 (PDT)
Date: Tue, 13 May 2025 23:40:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68243ae0.a00a0220.104b28.0007.GAE@google.com>
Subject: [syzbot] [dri?] possible deadlock in drm_mode_atomic_ioctl (2)
From: syzbot <syzbot+8c517b890398864b52ef@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 louis.chauvet@bootlin.com, maarten.lankhorst@linux.intel.com, 
 melissa.srw@gmail.com, mripard@kernel.org, simona@ffwll.ch, 
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

HEAD commit:    c32f8dc5aaf9 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=16b28cf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4635ffd6ad5b4a
dashboard link: https://syzkaller.appspot.com/bug?extid=8c517b890398864b52ef
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b921498959d4/disk-c32f8dc5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/04e6ad946c4b/vmlinux-c32f8dc5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d4f0d8db50ee/Image-c32f8dc5.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8c517b890398864b52ef@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc5-syzkaller-gc32f8dc5aaf9 #0 Not tainted
------------------------------------------------------
syz.1.455/8130 is trying to acquire lock:
ffff0000dd4e78d0 (&mm->mmap_lock){++++}-{4:4}, at: __might_fault+0x9c/0x124 mm/memory.c:7150

but task is already holding lock:
ffff80009c4e7918 (crtc_ww_class_mutex){+.+.}-{4:4}, at: drm_mode_atomic_ioctl+0x3b0/0xde4 drivers/gpu/drm/drm_atomic_uapi.c:1444

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #9 (crtc_ww_class_mutex){+.+.}-{4:4}:
       ww_acquire_init include/linux/ww_mutex.h:162 [inline]
       drm_modeset_acquire_init+0x1d8/0x374 drivers/gpu/drm/drm_modeset_lock.c:250
       drmm_mode_config_init+0xb0c/0x10d8 drivers/gpu/drm/drm_mode_config.c:462
       vkms_modeset_init drivers/gpu/drm/vkms/vkms_drv.c:146 [inline]
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:207 [inline]
       vkms_init+0x2c0/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
       do_one_initcall+0x250/0x990 init/main.c:1257
       do_initcall_level+0x154/0x214 init/main.c:1319
       do_initcalls+0x84/0xf4 init/main.c:1335
       do_basic_setup+0x8c/0xa0 init/main.c:1354
       kernel_init_freeable+0x2dc/0x444 init/main.c:1567
       kernel_init+0x24/0x1dc init/main.c:1457
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847

-> #8 (crtc_ww_class_acquire){+.+.}-{0:0}:
       ww_acquire_init include/linux/ww_mutex.h:161 [inline]
       drm_modeset_acquire_init+0x1b8/0x374 drivers/gpu/drm/drm_modeset_lock.c:250
       drm_client_modeset_commit_atomic+0xcc/0x6ac drivers/gpu/drm/drm_client_modeset.c:1018
       drm_client_modeset_commit_locked+0xd0/0x4a0 drivers/gpu/drm/drm_client_modeset.c:1182
       drm_client_modeset_commit+0x50/0x7c drivers/gpu/drm/drm_client_modeset.c:1208
       __drm_fb_helper_restore_fbdev_mode_unlocked+0x94/0x198 drivers/gpu/drm/drm_fb_helper.c:237
       drm_fb_helper_set_par+0xa4/0x108 drivers/gpu/drm/drm_fb_helper.c:1359
       fbcon_init+0xe4c/0x1d18 drivers/video/fbdev/core/fbcon.c:1112
       visual_init+0x27c/0x540 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x7b8/0xdd8 drivers/tty/vt/vt.c:3831
       do_take_over_console+0x824/0x97c drivers/tty/vt/vt.c:4397
       do_fbcon_takeover+0x158/0x25c drivers/video/fbdev/core/fbcon.c:548
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2989 [inline]
       fbcon_fb_registered+0x354/0x4c8 drivers/video/fbdev/core/fbcon.c:3009
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x44c/0x5ec drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x103c/0x159c drivers/gpu/drm/drm_fb_helper.c:1851
       drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
       drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
       drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
       drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
       drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
       vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
       do_one_initcall+0x250/0x990 init/main.c:1257
       do_initcall_level+0x154/0x214 init/main.c:1319
       do_initcalls+0x84/0xf4 init/main.c:1335
       do_basic_setup+0x8c/0xa0 init/main.c:1354
       kernel_init_freeable+0x2dc/0x444 init/main.c:1567
       kernel_init+0x24/0x1dc init/main.c:1457
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847

-> #7 (&client->modeset_mutex){+.+.}-{4:4}:
       __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
       __mutex_lock kernel/locking/mutex.c:746 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
       drm_client_modeset_probe+0x2f0/0x4e88 drivers/gpu/drm/drm_client_modeset.c:843
       __drm_fb_helper_initial_config_and_unlock+0xf0/0x159c drivers/gpu/drm/drm_fb_helper.c:1828
       drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
       drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
       drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
       drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
       drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
       vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
       do_one_initcall+0x250/0x990 init/main.c:1257
       do_initcall_level+0x154/0x214 init/main.c:1319
       do_initcalls+0x84/0xf4 init/main.c:1335
       do_basic_setup+0x8c/0xa0 init/main.c:1354
       kernel_init_freeable+0x2dc/0x444 init/main.c:1567
       kernel_init+0x24/0x1dc init/main.c:1457
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847

-> #6 (&helper->lock){+.+.}-{4:4}:
       __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
       __mutex_lock kernel/locking/mutex.c:746 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
       __drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0x198 drivers/gpu/drm/drm_fb_helper.c:228
       drm_fb_helper_set_par+0xa4/0x108 drivers/gpu/drm/drm_fb_helper.c:1359
       fbcon_init+0xe4c/0x1d18 drivers/video/fbdev/core/fbcon.c:1112
       visual_init+0x27c/0x540 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x7b8/0xdd8 drivers/tty/vt/vt.c:3831
       do_take_over_console+0x824/0x97c drivers/tty/vt/vt.c:4397
       do_fbcon_takeover+0x158/0x25c drivers/video/fbdev/core/fbcon.c:548
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2989 [inline]
       fbcon_fb_registered+0x354/0x4c8 drivers/video/fbdev/core/fbcon.c:3009
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x44c/0x5ec drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x103c/0x159c drivers/gpu/drm/drm_fb_helper.c:1851
       drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
       drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
       drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
       drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
       drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
       vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
       do_one_initcall+0x250/0x990 init/main.c:1257
       do_initcall_level+0x154/0x214 init/main.c:1319
       do_initcalls+0x84/0xf4 init/main.c:1335
       do_basic_setup+0x8c/0xa0 init/main.c:1354
       kernel_init_freeable+0x2dc/0x444 init/main.c:1567
       kernel_init+0x24/0x1dc init/main.c:1457
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847

-> #5 (console_lock){+.+.}-{0:0}:
       console_lock+0x194/0x1ec kernel/printk/printk.c:2849
       __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inline]
       bch2_print_string_as_lines+0x34/0x150 fs/bcachefs/util.c:286
       __bch2_fsck_err+0xb5c/0xdd0 fs/bcachefs/error.c:562
       __need_discard_or_freespace_err+0x14c/0x1cc fs/bcachefs/alloc_background.c:678
       bch2_bucket_do_index+0x320/0x490 fs/bcachefs/alloc_background.c:729
       bch2_trigger_alloc+0xd1c/0x2d54 fs/bcachefs/alloc_background.c:885
       bch2_key_trigger fs/bcachefs/bkey_methods.h:88 [inline]
       bch2_key_trigger_new fs/bcachefs/bkey_methods.h:116 [inline]
       run_one_trans_trigger fs/bcachefs/btree_trans_commit.c:516 [inline]
       bch2_trans_commit_run_triggers fs/bcachefs/btree_trans_commit.c:550 [inline]
       __bch2_trans_commit+0x634/0x62d0 fs/bcachefs/btree_trans_commit.c:990
       bch2_trans_commit fs/bcachefs/btree_update.h:195 [inline]
       btree_update_nodes_written fs/bcachefs/btree_update_interior.c:705 [inline]
       btree_interior_update_work+0xb80/0x1cfc fs/bcachefs/btree_update_interior.c:843
       process_one_work+0x7e8/0x156c kernel/workqueue.c:3238
       process_scheduled_works kernel/workqueue.c:3319 [inline]
       worker_thread+0x958/0xed8 kernel/workqueue.c:3400
       kthread+0x5fc/0x75c kernel/kthread.c:464
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847

-> #4 (&c->fsck_error_msgs_lock){+.+.}-{4:4}:
       __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
       __mutex_lock kernel/locking/mutex.c:746 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
       __bch2_count_fsck_err+0x58/0x98 fs/bcachefs/error.c:385
       __bch2_i_sectors_acct+0x328/0x3c4 fs/bcachefs/fs-io.c:155
       bch2_i_sectors_acct fs/bcachefs/fs-io.h:138 [inline]
       bchfs_fpunch+0x23c/0x404 fs/bcachefs/fs-io.c:578
       bch2_fallocate_dispatch+0x378/0x4e0 fs/bcachefs/fs-io.c:838
       vfs_fallocate+0x5cc/0x73c fs/open.c:338
       ioctl_preallocate fs/ioctl.c:290 [inline]
       file_ioctl fs/ioctl.c:-1 [inline]
       do_vfs_ioctl+0x1d4c/0x2218 fs/ioctl.c:885
       __do_sys_ioctl fs/ioctl.c:904 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __arm64_sys_ioctl+0xe4/0x1c4 fs/ioctl.c:892
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
       el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #3 (&inode->ei_quota_lock){+.+.}-{4:4}:
       __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
       __mutex_lock kernel/locking/mutex.c:746 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
       bch2_quota_reservation_add fs/bcachefs/fs-io.h:97 [inline]
       __bch2_folio_reservation_get+0x5c0/0xa00 fs/bcachefs/fs-io-pagecache.c:460
       bch2_folio_reservation_get fs/bcachefs/fs-io-pagecache.c:477 [inline]
       bch2_page_mkwrite+0xa48/0xd60 fs/bcachefs/fs-io-pagecache.c:637
       do_page_mkwrite+0x138/0x2b8 mm/memory.c:3287
       wp_page_shared mm/memory.c:3688 [inline]
       do_wp_page+0x1b54/0x43a8 mm/memory.c:3907
       handle_pte_fault mm/memory.c:6013 [inline]
       __handle_mm_fault mm/memory.c:6140 [inline]
       handle_mm_fault+0x1064/0x4cec mm/memory.c:6309
       do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
       do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
       el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #2 (sb_pagefaults#2){.+.+}-{0:0}:
       percpu_down_read include/linux/percpu-rwsem.h:52 [inline]
       __sb_start_write include/linux/fs.h:1783 [inline]
       sb_start_pagefault include/linux/fs.h:1948 [inline]
       bch2_page_mkwrite+0x260/0xd60 fs/bcachefs/fs-io-pagecache.c:614
       do_page_mkwrite+0x138/0x2b8 mm/memory.c:3287
       wp_page_shared mm/memory.c:3688 [inline]
       do_wp_page+0x1b54/0x43a8 mm/memory.c:3907
       handle_pte_fault mm/memory.c:6013 [inline]
       __handle_mm_fault mm/memory.c:6140 [inline]
       handle_mm_fault+0x1064/0x4cec mm/memory.c:6309
       do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
       do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
       el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #1 (vm_lock){++++}-{0:0}:
       __vma_enter_locked+0x184/0x354 mm/memory.c:6473
       __vma_start_write+0x34/0x158 mm/memory.c:6497
       vma_start_write include/linux/mm.h:829 [inline]
       vma_expand+0x1b8/0x8f0 mm/vma.c:1086
       relocate_vma_down+0x234/0x400 mm/mmap.c:1767
       setup_arg_pages+0x4b4/0x920 fs/exec.c:800
       load_elf_binary+0x8c4/0x1ebc fs/binfmt_elf.c:1019
       search_binary_handler fs/exec.c:1778 [inline]
       exec_binprm fs/exec.c:1810 [inline]
       bprm_execve+0x77c/0x10dc fs/exec.c:1862
       kernel_execve+0x70c/0x7f4 fs/exec.c:2028
       run_init_process+0x1bc/0x1ec init/main.c:1378
       try_to_run_init_process+0x20/0x7c init/main.c:1385
       kernel_init+0xa8/0x1dc init/main.c:1513
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847

-> #0 (&mm->mmap_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain kernel/locking/lockdep.c:3909 [inline]
       __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
       lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
       __might_fault+0xc4/0x124 mm/memory.c:7151
       drm_mode_atomic_ioctl+0x494/0xde4 drivers/gpu/drm/drm_atomic_uapi.c:1458
       drm_ioctl_kernel+0x238/0x310 drivers/gpu/drm/drm_ioctl.c:796
       drm_ioctl+0x65c/0xa5c drivers/gpu/drm/drm_ioctl.c:893
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __arm64_sys_ioctl+0x14c/0x1c4 fs/ioctl.c:892
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
       el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

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

2 locks held by syz.1.455/8130:
 #0: ffff80009c4e78f0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x3b0/0xde4 drivers/gpu/drm/drm_atomic_uapi.c:1444
 #1: ffff80009c4e7918 (crtc_ww_class_mutex){+.+.}-{4:4}, at: drm_mode_atomic_ioctl+0x3b0/0xde4 drivers/gpu/drm/drm_atomic_uapi.c:1444

stack backtrace:
CPU: 0 UID: 0 PID: 8130 Comm: syz.1.455 Not tainted 6.15.0-rc5-syzkaller-gc32f8dc5aaf9 #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x324/0x32c kernel/locking/lockdep.c:2079
 check_noncircular+0x154/0x174 kernel/locking/lockdep.c:2211
 check_prev_add kernel/locking/lockdep.c:3166 [inline]
 check_prevs_add kernel/locking/lockdep.c:3285 [inline]
 validate_chain kernel/locking/lockdep.c:3909 [inline]
 __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
 lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
 __might_fault+0xc4/0x124 mm/memory.c:7151
 drm_mode_atomic_ioctl+0x494/0xde4 drivers/gpu/drm/drm_atomic_uapi.c:1458
 drm_ioctl_kernel+0x238/0x310 drivers/gpu/drm/drm_ioctl.c:796
 drm_ioctl+0x65c/0xa5c drivers/gpu/drm/drm_ioctl.c:893
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __arm64_sys_ioctl+0x14c/0x1c4 fs/ioctl.c:892
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600


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
