Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EA5ABCB52
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 01:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1955E10E342;
	Mon, 19 May 2025 23:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com
 [209.85.166.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6F410E442
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 23:14:29 +0000 (UTC)
Received: by mail-io1-f79.google.com with SMTP id
 ca18e2360f4ac-86a50b5f5bdso110102939f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747696468; x=1748301268;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0XIGhr+70ZjBiKQAvfrcT5pp0xw6sX0iOPNQPiN0Vb0=;
 b=IYycBszEng0s7fNvi0BUBC57It8QsMqxk974VrRP5z5oIJ2Jg4AYn31NkXP9mnnYFy
 4iOjOFU3MAnvxmnHSl3hnqi6+aNb4Gp59da/Looa2URuOlZNn1BUfAyLhTJvR83RF2si
 Ru72E/0xtXXsuhp3C12KyhFSglLNbgfww2ZpVb6iBiVGA9HwSOsiV7/zz63Ri1sUVZXl
 QaLm1VP9GogF6pdNaXQR1+HuvR+VZwjdTTU5QaakQN0RmDsQ0HSVTlZ9p1rPvS7d4NAh
 QI82Ym5aR7UhIa8mx4KYLAcIkeQaG1wViVEFc725ExsREN1qipnmFjUcQrW0Qz9z0AFf
 LE1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWds0QJqPB77C4Ju1qOctY3hFXEdPyN0NIuev8tKFvovqVYiiNtsThKA97hIBZMgG+w6Y1mc/XkhbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9p5Ob5nZkxQFyoOG9IPzdL05mKz6azWSTUUwTdK7uTF3DVlCg
 3GYwM5wjRmgVoo04xRbZ/7J+zoXgaD8v1IEm7qEpR8rhnWEXbZtGe0E9qDR31aLMjMDjmaFbwwY
 VxpTjA30Hi4dhDBt6mFzTqUEGKFs1oyxHrJVeycW6U4L1fEdXEdegUUzO8Bc=
X-Google-Smtp-Source: AGHT+IF+x8PQs5YczeEHe0/iHfsUhNVhWl21Aps0XFE3qKQvN4JknBGGqb8VyGaivuRgkrMO90kQN01RMIlDc68g6KNgbfzFQCD6
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2983:b0:864:4911:f463 with SMTP id
 ca18e2360f4ac-86a24c976c3mr1601576039f.10.1747696468455; Mon, 19 May 2025
 16:14:28 -0700 (PDT)
Date: Mon, 19 May 2025 16:14:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682bbb54.a00a0220.7a43a.007f.GAE@google.com>
Subject: [syzbot] [dri?] possible deadlock in drm_getunique
From: syzbot <syzbot+2e9aa2a09550887c9d40@syzkaller.appspotmail.com>
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

HEAD commit:    c919f08732cc Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=122dbcd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2727a5e5fea443ee
dashboard link: https://syzkaller.appspot.com/bug?extid=2e9aa2a09550887c9d40
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fedefc1f300a/disk-c919f087.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a2d33f61744a/vmlinux-c919f087.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2fda6bb2e321/Image-c919f087.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2e9aa2a09550887c9d40@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc6-syzkaller-gc919f08732cc #0 Not tainted
------------------------------------------------------
syz.0.923/9180 is trying to acquire lock:
ffff0000c89056d0 (&mm->mmap_lock){++++}-{4:4}, at: __might_fault+0x9c/0x124 mm/memory.c:7150

but task is already holding lock:
ffff0000c9d441b0 (&dev->master_mutex){+.+.}-{4:4}, at: drm_getunique+0x48/0x2e0 drivers/gpu/drm/drm_ioctl.c:121

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #5 (&dev->master_mutex){+.+.}-{4:4}:
       __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
       __mutex_lock kernel/locking/mutex.c:746 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
       drm_master_internal_acquire+0x24/0x78 drivers/gpu/drm/drm_auth.c:452
       drm_client_modeset_commit+0x40/0x7c drivers/gpu/drm/drm_client_modeset.c:1205
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

-> #4 (&helper->lock){+.+.}-{4:4}:
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

-> #3 (console_lock){+.+.}-{0:0}:
       console_lock+0x194/0x1ec kernel/printk/printk.c:2849
       __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inline]
       bch2_print_string_as_lines+0x34/0x150 fs/bcachefs/util.c:286
       bucket_ref_update_err+0x1c8/0x21c fs/bcachefs/buckets.c:417
       bch2_bucket_ref_update+0x3d8/0x888 fs/bcachefs/buckets.c:-1
       __mark_pointer fs/bcachefs/buckets.c:572 [inline]
       bch2_trigger_pointer fs/bcachefs/buckets.c:618 [inline]
       __trigger_extent+0xd90/0x35fc fs/bcachefs/buckets.c:763
       bch2_trigger_extent+0x3e4/0x78c fs/bcachefs/buckets.c:881
       run_one_trans_trigger fs/bcachefs/btree_trans_commit.c:-1 [inline]
       bch2_trans_commit_run_triggers fs/bcachefs/btree_trans_commit.c:550 [inline]
       __bch2_trans_commit+0x7e8/0x62d0 fs/bcachefs/btree_trans_commit.c:990
       bch2_trans_commit fs/bcachefs/btree_update.h:195 [inline]
       bch2_extent_update+0x2d8/0x7e8 fs/bcachefs/io_write.c:353
       bch2_fpunch_at+0x4dc/0x98c fs/bcachefs/io_misc.c:187
       bch2_fpunch+0x104/0x1b8 fs/bcachefs/io_misc.c:206
       bchfs_fpunch+0x204/0x404 fs/bcachefs/fs-io.c:575
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

-> #2 (bcachefs_btree){+.+.}-{0:0}:
       trans_set_locked+0x94/0x200 fs/bcachefs/btree_locking.h:198
       bch2_trans_begin+0x6f8/0xa40 fs/bcachefs/btree_iter.c:3282
       bch2_read_err_msg_trans+0x64/0x298 fs/bcachefs/io_read.c:346
       __bch2_read_extent+0x21fc/0x3694 fs/bcachefs/io_read.c:975
       bch2_read_extent fs/bcachefs/io_read.h:140 [inline]
       bchfs_read+0x1178/0x17dc fs/bcachefs/fs-io-buffered.c:226
       bch2_readahead+0xa18/0xd88 fs/bcachefs/fs-io-buffered.c:316
       read_pages+0x13c/0x4c8 mm/readahead.c:160
       page_cache_ra_order+0x7b8/0xb34 mm/readahead.c:515
       do_sync_mmap_readahead+0x2f0/0x660 mm/filemap.c:-1
       filemap_fault+0x600/0x1278 mm/filemap.c:3403
       bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
       __do_fault+0xf8/0x498 mm/memory.c:5098
       do_read_fault mm/memory.c:5518 [inline]
       do_fault mm/memory.c:5652 [inline]
       do_pte_missing mm/memory.c:4160 [inline]
       handle_pte_fault mm/memory.c:5997 [inline]
       __handle_mm_fault mm/memory.c:6140 [inline]
       handle_mm_fault+0x2c00/0x4cf0 mm/memory.c:6309
       faultin_page mm/gup.c:1193 [inline]
       __get_user_pages+0x1da4/0x30cc mm/gup.c:1491
       populate_vma_page_range+0x218/0x2e8 mm/gup.c:1929
       __mm_populate+0x208/0x330 mm/gup.c:2032
       mm_populate include/linux/mm.h:3487 [inline]
       vm_mmap_pgoff+0x378/0x43c mm/util.c:584
       ksys_mmap_pgoff+0x394/0x5b8 mm/mmap.c:607
       __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
       __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
       __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
       el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #1 (mapping.invalidate_lock#3){.+.+}-{4:4}:
       down_read+0x58/0x2f8 kernel/locking/rwsem.c:1524
       filemap_invalidate_lock_shared include/linux/fs.h:922 [inline]
       filemap_fault+0x564/0x1278 mm/filemap.c:3391
       bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
       __do_fault+0xf8/0x498 mm/memory.c:5098
       do_read_fault mm/memory.c:5518 [inline]
       do_fault mm/memory.c:5652 [inline]
       do_pte_missing mm/memory.c:4160 [inline]
       handle_pte_fault mm/memory.c:5997 [inline]
       __handle_mm_fault mm/memory.c:6140 [inline]
       handle_mm_fault+0x2c00/0x4cf0 mm/memory.c:6309
       faultin_page mm/gup.c:1193 [inline]
       __get_user_pages+0x1da4/0x30cc mm/gup.c:1491
       populate_vma_page_range+0x218/0x2e8 mm/gup.c:1929
       __mm_populate+0x208/0x330 mm/gup.c:2032
       mm_populate include/linux/mm.h:3487 [inline]
       vm_mmap_pgoff+0x378/0x43c mm/util.c:584
       ksys_mmap_pgoff+0x394/0x5b8 mm/mmap.c:607
       __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
       __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
       __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
       el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #0 (&mm->mmap_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain kernel/locking/lockdep.c:3909 [inline]
       __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
       lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
       __might_fault+0xc4/0x124 mm/memory.c:7151
       _inline_copy_to_user include/linux/uaccess.h:192 [inline]
       copy_to_user include/linux/uaccess.h:223 [inline]
       drm_getunique+0x114/0x2e0 drivers/gpu/drm/drm_ioctl.c:124
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
  &mm->mmap_lock --> &helper->lock --> &dev->master_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&dev->master_mutex);
                               lock(&helper->lock);
                               lock(&dev->master_mutex);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

1 lock held by syz.0.923/9180:
 #0: ffff0000c9d441b0 (&dev->master_mutex){+.+.}-{4:4}, at: drm_getunique+0x48/0x2e0 drivers/gpu/drm/drm_ioctl.c:121

stack backtrace:
CPU: 0 UID: 0 PID: 9180 Comm: syz.0.923 Not tainted 6.15.0-rc6-syzkaller-gc919f08732cc #0 PREEMPT 
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
 _inline_copy_to_user include/linux/uaccess.h:192 [inline]
 copy_to_user include/linux/uaccess.h:223 [inline]
 drm_getunique+0x114/0x2e0 drivers/gpu/drm/drm_ioctl.c:124
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
