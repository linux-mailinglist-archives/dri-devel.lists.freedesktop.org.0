Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E29FABC933
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 23:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B5810E2D7;
	Mon, 19 May 2025 21:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com
 [209.85.166.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36FA10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 21:24:32 +0000 (UTC)
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-85b5878a66cso1409839439f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 14:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747689872; x=1748294672;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qAi6d3zQOGer37kjkQrjgy9QMoLp9PZbKJecZPtDuto=;
 b=w5rM8Sj7bQChLWMmFoj2ejMdYJOBmvnZdOKu8HT4TLqUKsYOfW8mGFG7dUN35f7wln
 awV7DCcahtukxa4pEt141R1HD46aJnK98n0LMffdTFx56Xd51+pm+cXGGjhwrEkDxvoM
 BuMq9fY6/utbOOAbGqZ53RUjL9fhq/Ouq8AvmfJzd3nLasrzW1zbrqdfPSZnB8nj94uP
 IDEUYg9NVxTMAT31z9hFZigDR1gTJ31QkkX94kQ3TCBXwIvkRaiy9zadwjuNP6Yw4Bx3
 +sOsJLCAxf9ZUcQIWNteHD3nVjXLkPXUGxAfLOC6ufMAUim1kpTYfXLlJf65KhukRHEN
 wXoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGuYYlqbaobTxVyEhkmawpJaZ4GQbXl1KJjf55QucuVbtviHxeNKJQJ7VpEsPVdlzvua731cqtLDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9rI6o05liSpy8Cfi7f/On5HCy5J9TYTWq5OW28SwRZHgurSNY
 BaRzcZ6WZAGeiqhezuA3jW4HlNWvFuHYxQVwb22vtoLqZ2//YB1KnUlzu2dgU+NmMuw8LLF1ZRP
 DmPotCTwFXG+iBby3XquD5Erqf0qmjo0T6+0qY3QQ8xsu/tMrG7jHy2tXxis=
X-Google-Smtp-Source: AGHT+IHa2hAETFBhS3SdNw0Cj0t8P/+zOINenggKf2eUNLMmAXMwpmrv+DRV189g1M/vnv8ihNwvLq2mP+DQB7Jg3U0BX9stsA33
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4c8c:b0:864:88f9:62f2 with SMTP id
 ca18e2360f4ac-86a2322a488mr2043079139f.9.1747689871909; Mon, 19 May 2025
 14:24:31 -0700 (PDT)
Date: Mon, 19 May 2025 14:24:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682ba18f.a00a0220.7a43a.007e.GAE@google.com>
Subject: [syzbot] [dri?] possible deadlock in drm_modeset_lock (3)
From: syzbot <syzbot+d1451ae6745bd92ed771@syzkaller.appspotmail.com>
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

HEAD commit:    c919f08732cc Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15ed4abc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2727a5e5fea443ee
dashboard link: https://syzkaller.appspot.com/bug?extid=d1451ae6745bd92ed771
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fedefc1f300a/disk-c919f087.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a2d33f61744a/vmlinux-c919f087.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2fda6bb2e321/Image-c919f087.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d1451ae6745bd92ed771@syzkaller.appspotmail.com

EXT4-fs (loop6): 1 truncate cleaned up
EXT4-fs (loop6): mounted filesystem 00000000-0000-0000-0000-000000000000 r/w without journal. Quota mode: none.
======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc6-syzkaller-gc919f08732cc #0 Not tainted
------------------------------------------------------
syz.6.583/9849 is trying to acquire lock:
ffff0000d22bce50 (&mm->mmap_lock){++++}-{4:4}, at: __might_fault+0x9c/0x124 mm/memory.c:7150

but task is already holding lock:
ffff0000c9c82518 (crtc_ww_class_mutex){+.+.}-{4:4}, at: drm_modeset_lock+0x64/0x8c drivers/gpu/drm/drm_modeset_lock.c:398

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #7 (crtc_ww_class_mutex){+.+.}-{4:4}:
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

-> #6 (crtc_ww_class_acquire){+.+.}-{0:0}:
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

-> #5 (&client->modeset_mutex){+.+.}-{4:4}:
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
       bch2_write_index_default fs/bcachefs/io_write.c:401 [inline]
       __bch2_write_index+0x570/0xfec fs/bcachefs/io_write.c:591
       bch2_write_data_inline fs/bcachefs/io_write.c:1630 [inline]
       bch2_write+0xacc/0x112c fs/bcachefs/io_write.c:1698
       closure_queue include/linux/closure.h:270 [inline]
       closure_call include/linux/closure.h:432 [inline]
       bch2_writepage_do_io fs/bcachefs/fs-io-buffered.c:494 [inline]
       bch2_writepages+0x1fc/0x2cc fs/bcachefs/fs-io-buffered.c:677
       do_writepages+0x2c0/0x6a8 mm/page-writeback.c:2656
       filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
       __filemap_fdatawrite_range mm/filemap.c:419 [inline]
       filemap_write_and_wait_range+0x1ac/0x29c mm/filemap.c:691
       bchfs_truncate+0x574/0xa70 fs/bcachefs/fs-io.c:-1
       bch2_setattr+0x198/0x20c fs/bcachefs/fs.c:1245
       notify_change+0x9a4/0xc50 fs/attr.c:552
       do_truncate+0x178/0x1f0 fs/open.c:65
       vfs_truncate+0x398/0x444 fs/open.c:115
       do_sys_truncate+0xe4/0x1a8 fs/open.c:138
       __do_sys_truncate fs/open.c:150 [inline]
       __se_sys_truncate fs/open.c:148 [inline]
       __arm64_sys_truncate+0x5c/0x74 fs/open.c:148
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

-> #1 (mapping.invalidate_lock#4){.+.+}-{4:4}:
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
       drm_mode_object_get_properties+0x1f0/0x524 drivers/gpu/drm/drm_mode_object.c:407
       drm_mode_getconnector+0xd78/0x1254 drivers/gpu/drm/drm_connector.c:3399
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

1 lock held by syz.6.583/9849:
 #0: ffff0000c9c82518 (crtc_ww_class_mutex){+.+.}-{4:4}, at: drm_modeset_lock+0x64/0x8c drivers/gpu/drm/drm_modeset_lock.c:398

stack backtrace:
CPU: 0 UID: 0 PID: 9849 Comm: syz.6.583 Not tainted 6.15.0-rc6-syzkaller-gc919f08732cc #0 PREEMPT 
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
 drm_mode_object_get_properties+0x1f0/0x524 drivers/gpu/drm/drm_mode_object.c:407
 drm_mode_getconnector+0xd78/0x1254 drivers/gpu/drm/drm_connector.c:3399
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
