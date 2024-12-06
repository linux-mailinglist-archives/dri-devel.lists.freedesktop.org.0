Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291E9E6465
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 03:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2389A10E19E;
	Fri,  6 Dec 2024 02:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com
 [209.85.166.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DFA10E02D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 02:48:32 +0000 (UTC)
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3a7cf41b54eso28845105ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 18:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733453311; x=1734058111;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HntQwQj8vXX4azeD4/XX8RL8k5U8Rv1XSvcDT4BY268=;
 b=ekbxOKYy/7EMtvG7yyKYvmQdaYKTtk1yX4tIpuerSQElgoo4MyZGDd82CMr0TxqJcE
 gs00rHQQr2SyjVxfkcBYtn3/ICe9yiF+EnMBvL30sGtXm6LVVBF73cXZWplkFqqaCKks
 zIL6GpCSwvehfBcG5/smEZIregoyORm+PVg0fCg1STWpHbS1oZZUbM8bFWCfYTFBqyZ9
 p+iVutw8uUNu983DSBHoK7SpfOSnsV91YOFARHdLV/LnlHFEjor6qR9YWoO+FKnSN/jT
 EvSB0j+EHdin2ik3ldhn7tcaQ8UpzmpKjVQsEK9s7LCbqs1YN9deP80/UVEIci+9WTSh
 GPxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ7wm1X5QBsSpdyvVQWtau3CqzrKmh4YaNWusVXGBTlAgOf8TZ5R/5pAeq6JjMe9n9EZh1orzlv58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo5AXd8TC7gTFkg/HaUr7SsyPaPjbXZtHfTNLziAYWqywpOCgT
 FbIb0lVubxUmA4xSODvrE8mykh7SN4BS3fSHEmpKPEK21/fMJyBCFx99ZHSgbP7Gjc52FUxQYBM
 GuH1Dt0qrcaqjnyeE2e0hL0DyoHLPdm4eb2v/++scEPJhSqQVvCN+zYQ=
X-Google-Smtp-Source: AGHT+IHbLC12YUXR+kuNBwbbpuKlevm4LD8A1kInaF6bR2ildL57zmQfR3EbTgzB/jpezfAkyA67atg7H6XRLnyta408DdIKJa/Q
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198c:b0:3a6:b783:3c06 with SMTP id
 e9e14a558f8ab-3a811e10b74mr26216525ab.19.1733453311384; Thu, 05 Dec 2024
 18:48:31 -0800 (PST)
Date: Thu, 05 Dec 2024 18:48:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675265ff.050a0220.171b20.008e.GAE@google.com>
Subject: [syzbot] [dri?] possible deadlock in drm_mode_atomic_ioctl
From: syzbot <syzbot+e1ec61eb0a3855cb7437@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net, 
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com, 
 simona@ffwll.ch, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    7b1d1d4cfac0 Merge remote-tracking branch 'iommu/arm/smmu'..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=17596330580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9bc44a6de1ceb5d6
dashboard link: https://syzkaller.appspot.com/bug?extid=e1ec61eb0a3855cb7437
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4d4a0162c7c3/disk-7b1d1d4c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a8c47a4be472/vmlinux-7b1d1d4c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0e173b91f83e/Image-7b1d1d4c.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e1ec61eb0a3855cb7437@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.12.0-syzkaller-g7b1d1d4cfac0 #0 Not tainted
------------------------------------------------------
syz.6.184/7775 is trying to acquire lock:
ffff0000d8b0b188 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x9c/0x124 mm/memory.c:6715

but task is already holding lock:
ffff8000a08d78f0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x3f4/0x13d4 drivers/gpu/drm/drm_atomic_uapi.c:1423

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #7 (crtc_ww_class_acquire){+.+.}-{0:0}:
       ww_acquire_init include/linux/ww_mutex.h:149 [inline]
       drm_modeset_acquire_init+0x194/0x330 drivers/gpu/drm/drm_modeset_lock.c:250
       drm_client_modeset_commit_atomic+0xe0/0x730 drivers/gpu/drm/drm_client_modeset.c:1007
       drm_client_modeset_commit_locked+0xd0/0x4a8 drivers/gpu/drm/drm_client_modeset.c:1171
       drm_client_modeset_commit+0x50/0x7c drivers/gpu/drm/drm_client_modeset.c:1197
       __drm_fb_helper_restore_fbdev_mode_unlocked+0xd4/0x178 drivers/gpu/drm/drm_fb_helper.c:237
       drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_helper.c:1345
       fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1113
       visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
       do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
       do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbcon.c:549
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2988 [inline]
       fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/fbcon.c:3008
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x470/0x610 drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x13b0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1869
       drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1934
       drm_fbdev_shmem_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_shmem.c:250
       drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
       drm_fbdev_shmem_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_shmem.c:309
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:228 [inline]
       vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:254
       do_one_initcall+0x24c/0x9c0 init/main.c:1269
       do_initcall_level+0x154/0x214 init/main.c:1331
       do_initcalls+0x58/0xac init/main.c:1347
       do_basic_setup+0x8c/0xa0 init/main.c:1366
       kernel_init_freeable+0x324/0x478 init/main.c:1580
       kernel_init+0x24/0x2a0 init/main.c:1469
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862

-> #6 (&client->modeset_mutex){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       drm_client_modeset_probe+0x318/0x3f78 drivers/gpu/drm/drm_client_modeset.c:832
       __drm_fb_helper_initial_config_and_unlock+0xf0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1846
       drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1934
       drm_fbdev_shmem_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_shmem.c:250
       drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
       drm_fbdev_shmem_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_shmem.c:309
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:228 [inline]
       vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:254
       do_one_initcall+0x24c/0x9c0 init/main.c:1269
       do_initcall_level+0x154/0x214 init/main.c:1331
       do_initcalls+0x58/0xac init/main.c:1347
       do_basic_setup+0x8c/0xa0 init/main.c:1366
       kernel_init_freeable+0x324/0x478 init/main.c:1580
       kernel_init+0x24/0x2a0 init/main.c:1469
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862

-> #5 (&helper->lock){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0x178 drivers/gpu/drm/drm_fb_helper.c:228
       drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_helper.c:1345
       fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1113
       visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
       do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
       do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbcon.c:549
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2988 [inline]
       fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/fbcon.c:3008
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x470/0x610 drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x13b0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1869
       drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1934
       drm_fbdev_shmem_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_shmem.c:250
       drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
       drm_fbdev_shmem_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_shmem.c:309
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:228 [inline]
       vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:254
       do_one_initcall+0x24c/0x9c0 init/main.c:1269
       do_initcall_level+0x154/0x214 init/main.c:1331
       do_initcalls+0x58/0xac init/main.c:1347
       do_basic_setup+0x8c/0xa0 init/main.c:1366
       kernel_init_freeable+0x324/0x478 init/main.c:1580
       kernel_init+0x24/0x2a0 init/main.c:1469
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862

-> #4 (console_lock){+.+.}-{0:0}:
       console_lock+0x19c/0x1f4 kernel/printk/printk.c:2808
       __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inline]
       bch2_print_string_as_lines+0x2c/0xd4 fs/bcachefs/util.c:286
       __bch2_fsck_err+0x1864/0x2544 fs/bcachefs/error.c:411
       bch2_check_fix_ptr fs/bcachefs/buckets.c:112 [inline]
       bch2_check_fix_ptrs+0x15b8/0x515c fs/bcachefs/buckets.c:266
       bch2_trigger_extent+0x71c/0x814 fs/bcachefs/buckets.c:856
       bch2_key_trigger fs/bcachefs/bkey_methods.h:87 [inline]
       bch2_gc_mark_key+0x4b4/0xb70 fs/bcachefs/btree_gc.c:634
       bch2_gc_btree fs/bcachefs/btree_gc.c:670 [inline]
       bch2_gc_btrees fs/bcachefs/btree_gc.c:729 [inline]
       bch2_check_allocations+0x1018/0x48f4 fs/bcachefs/btree_gc.c:1133
       bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:191
       bch2_run_recovery_passes+0x30c/0x73c fs/bcachefs/recovery_passes.c:244
       bch2_fs_recovery+0x32d8/0x55dc fs/bcachefs/recovery.c:861
       bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1037
       bch2_fs_get_tree+0x938/0x1030 fs/bcachefs/fs.c:2170
       vfs_get_tree+0x90/0x28c fs/super.c:1814
       do_new_mount+0x278/0x900 fs/namespace.c:3507
       path_mount+0x590/0xe04 fs/namespace.c:3834
       do_mount fs/namespace.c:3847 [inline]
       __do_sys_mount fs/namespace.c:4057 [inline]
       __se_sys_mount fs/namespace.c:4034 [inline]
       __arm64_sys_mount+0x4d4/0x5ac fs/namespace.c:4034
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #3 (&c->fsck_error_msgs_lock){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       __bch2_fsck_err+0x344/0x2544 fs/bcachefs/error.c:282
       bch2_check_fix_ptr fs/bcachefs/buckets.c:112 [inline]
       bch2_check_fix_ptrs+0x15b8/0x515c fs/bcachefs/buckets.c:266
       bch2_trigger_extent+0x71c/0x814 fs/bcachefs/buckets.c:856
       bch2_key_trigger fs/bcachefs/bkey_methods.h:87 [inline]
       bch2_gc_mark_key+0x4b4/0xb70 fs/bcachefs/btree_gc.c:634
       bch2_gc_btree fs/bcachefs/btree_gc.c:670 [inline]
       bch2_gc_btrees fs/bcachefs/btree_gc.c:729 [inline]
       bch2_check_allocations+0x1018/0x48f4 fs/bcachefs/btree_gc.c:1133
       bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:191
       bch2_run_recovery_passes+0x30c/0x73c fs/bcachefs/recovery_passes.c:244
       bch2_fs_recovery+0x32d8/0x55dc fs/bcachefs/recovery.c:861
       bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1037
       bch2_fs_get_tree+0x938/0x1030 fs/bcachefs/fs.c:2170
       vfs_get_tree+0x90/0x28c fs/super.c:1814
       do_new_mount+0x278/0x900 fs/namespace.c:3507
       path_mount+0x590/0xe04 fs/namespace.c:3834
       do_mount fs/namespace.c:3847 [inline]
       __do_sys_mount fs/namespace.c:4057 [inline]
       __se_sys_mount fs/namespace.c:4034 [inline]
       __arm64_sys_mount+0x4d4/0x5ac fs/namespace.c:4034
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #2 (&c->mark_lock){++++}-{0:0}:
       percpu_down_read+0x5c/0x2e8 include/linux/percpu-rwsem.h:51
       __bch2_disk_reservation_add+0xc4/0x9f4 fs/bcachefs/buckets.c:1170
       bch2_disk_reservation_add+0x29c/0x4f4 fs/bcachefs/buckets.h:367
       __bch2_folio_reservation_get+0x2dc/0x798 fs/bcachefs/fs-io-pagecache.c:428
       bch2_folio_reservation_get fs/bcachefs/fs-io-pagecache.c:477 [inline]
       bch2_page_mkwrite+0xa70/0xe44 fs/bcachefs/fs-io-pagecache.c:637
       do_page_mkwrite+0x140/0x2dc mm/memory.c:3162
       do_shared_fault mm/memory.c:5373 [inline]
       do_fault mm/memory.c:5435 [inline]
       do_pte_missing mm/memory.c:3965 [inline]
       handle_pte_fault mm/memory.c:5766 [inline]
       __handle_mm_fault+0x1e1c/0x66e8 mm/memory.c:5909
       handle_mm_fault+0x29c/0x8b4 mm/memory.c:6077
       do_page_fault+0x570/0x10a8 arch/arm64/mm/fault.c:690
       do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
       do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:919
       el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:604
       el0t_64_sync_handler+0xcc/0x108 arch/arm64/kernel/entry-common.c:765
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #1 (sb_pagefaults#2){.+.+}-{0:0}:
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1716 [inline]
       sb_start_pagefault include/linux/fs.h:1881 [inline]
       bch2_page_mkwrite+0x280/0xe44 fs/bcachefs/fs-io-pagecache.c:614
       do_page_mkwrite+0x140/0x2dc mm/memory.c:3162
       do_shared_fault mm/memory.c:5373 [inline]
       do_fault mm/memory.c:5435 [inline]
       do_pte_missing mm/memory.c:3965 [inline]
       handle_pte_fault mm/memory.c:5766 [inline]
       __handle_mm_fault+0x1e1c/0x66e8 mm/memory.c:5909
       handle_mm_fault+0x29c/0x8b4 mm/memory.c:6077
       do_page_fault+0x570/0x10a8 arch/arm64/mm/fault.c:690
       do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
       do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:919
       el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:604
       el0t_64_sync_handler+0xcc/0x108 arch/arm64/kernel/entry-common.c:765
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain kernel/locking/lockdep.c:3904 [inline]
       __lock_acquire+0x33f8/0x77c8 kernel/locking/lockdep.c:5202
       lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5825
       __might_fault+0xc4/0x124 mm/memory.c:6716
       drm_mode_atomic_ioctl+0x52c/0x13d4 drivers/gpu/drm/drm_atomic_uapi.c:1437
       drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:745
       drm_ioctl+0x624/0xb14 drivers/gpu/drm/drm_ioctl.c:842
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl fs/ioctl.c:893 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

other info that might help us debug this:

Chain exists of:
  &mm->mmap_lock --> &client->modeset_mutex --> crtc_ww_class_acquire

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(crtc_ww_class_acquire);
                               lock(&client->modeset_mutex);
                               lock(crtc_ww_class_acquire);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

1 lock held by syz.6.184/7775:
 #0: ffff8000a08d78f0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x3f4/0x13d4 drivers/gpu/drm/drm_atomic_uapi.c:1423

stack backtrace:
CPU: 0 UID: 0 PID: 7775 Comm: syz.6.184 Not tainted 6.12.0-syzkaller-g7b1d1d4cfac0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x154/0x1c0 kernel/locking/lockdep.c:2074
 check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain kernel/locking/lockdep.c:3904 [inline]
 __lock_acquire+0x33f8/0x77c8 kernel/locking/lockdep.c:5202
 lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5825
 __might_fault+0xc4/0x124 mm/memory.c:6716
 drm_mode_atomic_ioctl+0x52c/0x13d4 drivers/gpu/drm/drm_atomic_uapi.c:1437
 drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:745
 drm_ioctl+0x624/0xb14 drivers/gpu/drm/drm_ioctl.c:842
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
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
