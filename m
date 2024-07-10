Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344E792CE29
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 11:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F73E10E155;
	Wed, 10 Jul 2024 09:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BMHLAeTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A914B10E155
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 09:28:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-426659ff58bso4276585e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720603720; x=1721208520; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXMqaQ3CoV5zetv7uvxj3VrSA7H8PuasSLsOG39mM68=;
 b=BMHLAeTGjjsrogIWDCWL3OWGDT7lS42vedFRL2OHSQ3xYtiGrudpkhyk4vwN+6hRVv
 CGvWPtYpHUaRq2ZKKOIsmiOxeZvoSTmsuWQJC/NO7ZuCiZX1opNxPISvrkCrt2Tl2en8
 JT+WhGDB0VlgBpYiWcNxVTcitg27kHdsZoX3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720603720; x=1721208520;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QXMqaQ3CoV5zetv7uvxj3VrSA7H8PuasSLsOG39mM68=;
 b=cnWqLJ8Im1S0S5iaismPPqbR1ams+Nh76r1FToXtgq0BDqV1elCXMeH5ydJ9IO30lk
 7mvuvBFe9xXw7xXg9cCjR249l5By+n/flra8GdPGyAyXxXLQjdrnkuFvt+PF0Zr8QIqg
 eeBSTAM+juu0vdiCj1C2Ea8JTyaZGaxZtYE3X5hlgXpSHi16oBVCfMF3OHzK/lh6JW5+
 nqMbfd7FyPNH9Q+B6mlgURth4j2+ArjYl3hD1YT8uja2esmXS0j5MPEVqMh7/kNCYX6t
 m7WI+qOD+Xrw/k+tucd2usGGaHWmz8jkA3jx3HRjrX5n+NoSCL3jVkiQJyrUFW0C4cBm
 fzVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdA0LyMEv+8ft0z1SxUs1+CugD8XH24QsqMC4vIe/uWkseSYoEZl0UtI3H7UEbhJFrebJ4j7RMbktgzSC1bNuHDgr43/988aLeFIy9eEE1
X-Gm-Message-State: AOJu0YzOurpJko9ym0GFxKPVBpHzp4p8MeiJaS4ZPfIBXu2mDNyzfDzJ
 CinV5a6v+wMs9B/55+QWssgINXEc26uZOmSfLws9zsx4Fg6frta3e+6MCtGv2uU=
X-Google-Smtp-Source: AGHT+IFDhL2plDsssKiIesAVPihoGi/+2qZ2J3g9xFx123hma/wuKeX2uZUbpD0NiOKhV7Qb/ozrcw==
X-Received: by 2002:a05:600c:5106:b0:426:67e0:3aa with SMTP id
 5b1f17b1804b1-426707cee07mr31430455e9.1.1720603719843; 
 Wed, 10 Jul 2024 02:28:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2fc942sm240427935e9.42.2024.07.10.02.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 02:28:39 -0700 (PDT)
Date: Wed, 10 Jul 2024 11:28:36 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: syzbot <syzbot+2e171785a12db2e2bd5d@syzkaller.appspotmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, syzkaller-bugs@googlegroups.com,
 tzimmermann@suse.de
Subject: Re: [syzbot] [dri?] possible deadlock in drm_modeset_lock
Message-ID: <Zo5URGHN3d4le-GJ@phenom.ffwll.local>
Mail-Followup-To: syzbot
 <syzbot+2e171785a12db2e2bd5d@syzkaller.appspotmail.com>, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, syzkaller-bugs@googlegroups.com,
 tzimmermann@suse.de
References: <00000000000073db8b061cd43496@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000073db8b061cd43496@google.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 09, 2024 at 10:53:18AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8e2f4becf4fa Merge remote-tracking branch 'tglx/devmsi-arm..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=10676a9e980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=15349546db652fd3
> dashboard link: https://syzkaller.appspot.com/bug?extid=2e171785a12db2e2bd5d
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ee71a34a1c26/disk-8e2f4bec.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/f8a6bf3c4b1c/vmlinux-8e2f4bec.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/236760504de5/Image-8e2f4bec.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+2e171785a12db2e2bd5d@syzkaller.appspotmail.com
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.10.0-rc6-syzkaller-g8e2f4becf4fa #0 Not tainted
> ------------------------------------------------------
> syz.4.1912/14164 is trying to acquire lock:
> ffff0000ccd2e988 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x9c/0x124 mm/memory.c:6233
> 
> but task is already holding lock:
> ffff0000c8f64518 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_lock+0x78/0xa4 drivers/gpu/drm/drm_modeset_lock.c:398
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #8 (crtc_ww_class_mutex){+.+.}-{3:3}:
>        __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
>        __ww_mutex_lock kernel/locking/mutex.c:759 [inline]
>        ww_mutex_lock+0x64/0x3a4 kernel/locking/mutex.c:876
>        modeset_lock+0x278/0x59c drivers/gpu/drm/drm_modeset_lock.c:314
>        drm_modeset_lock+0x64/0xa4 drivers/gpu/drm/drm_modeset_lock.c:396
>        drmm_mode_config_init+0xba0/0x1280 drivers/gpu/drm/drm_mode_config.c:454
>        vkms_modeset_init drivers/gpu/drm/vkms/vkms_drv.c:156 [inline]
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:215 [inline]
>        vkms_init+0x2fc/0x600 drivers/gpu/drm/vkms/vkms_drv.c:252
>        do_one_initcall+0x24c/0x9c0 init/main.c:1267
>        do_initcall_level+0x154/0x214 init/main.c:1329
>        do_initcalls+0x58/0xac init/main.c:1345
>        do_basic_setup+0x8c/0xa0 init/main.c:1364
>        kernel_init_freeable+0x324/0x478 init/main.c:1578
>        kernel_init+0x24/0x2a0 init/main.c:1467
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860
> 
> -> #7 (crtc_ww_class_acquire){+.+.}-{0:0}:
>        ww_acquire_init include/linux/ww_mutex.h:149 [inline]
>        drm_modeset_acquire_init+0x194/0x330 drivers/gpu/drm/drm_modeset_lock.c:250
>        drm_client_modeset_commit_atomic+0xe0/0x730 drivers/gpu/drm/drm_client_modeset.c:1002
>        drm_client_modeset_commit_locked+0xd0/0x4a8 drivers/gpu/drm/drm_client_modeset.c:1166
>        drm_client_modeset_commit+0x50/0x7c drivers/gpu/drm/drm_client_modeset.c:1192
>        __drm_fb_helper_restore_fbdev_mode_unlocked+0xd4/0x178 drivers/gpu/drm/drm_fb_helper.c:251
>        drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_helper.c:1347
>        fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1093
>        visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
>        do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
>        do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
>        do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbcon.c:531
>        do_fb_registered drivers/video/fbdev/core/fbcon.c:2968 [inline]
>        fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/fbcon.c:2988
>        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
>        register_framebuffer+0x470/0x610 drivers/video/fbdev/core/fbmem.c:515
>        __drm_fb_helper_initial_config_and_unlock+0x13b0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1871
>        drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1936
>        drm_fbdev_generic_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_generic.c:278
>        drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
>        drm_fbdev_generic_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_generic.c:340
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:226 [inline]
>        vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:252
>        do_one_initcall+0x24c/0x9c0 init/main.c:1267
>        do_initcall_level+0x154/0x214 init/main.c:1329
>        do_initcalls+0x58/0xac init/main.c:1345
>        do_basic_setup+0x8c/0xa0 init/main.c:1364
>        kernel_init_freeable+0x324/0x478 init/main.c:1578
>        kernel_init+0x24/0x2a0 init/main.c:1467
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860
> 
> -> #6 (&client->modeset_mutex){+.+.}-{3:3}:
>        __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
>        __mutex_lock kernel/locking/mutex.c:752 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
>        drm_client_modeset_probe+0x318/0x3f68 drivers/gpu/drm/drm_client_modeset.c:832
>        __drm_fb_helper_initial_config_and_unlock+0xf0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1848
>        drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1936
>        drm_fbdev_generic_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_generic.c:278
>        drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
>        drm_fbdev_generic_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_generic.c:340
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:226 [inline]
>        vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:252
>        do_one_initcall+0x24c/0x9c0 init/main.c:1267
>        do_initcall_level+0x154/0x214 init/main.c:1329
>        do_initcalls+0x58/0xac init/main.c:1345
>        do_basic_setup+0x8c/0xa0 init/main.c:1364
>        kernel_init_freeable+0x324/0x478 init/main.c:1578
>        kernel_init+0x24/0x2a0 init/main.c:1467
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860
> 
> -> #5 (&helper->lock){+.+.}-{3:3}:
>        __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
>        __mutex_lock kernel/locking/mutex.c:752 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
>        __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0x178 drivers/gpu/drm/drm_fb_helper.c:242
>        drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_helper.c:1347
>        fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1093
>        visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
>        do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
>        do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
>        do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbcon.c:531
>        do_fb_registered drivers/video/fbdev/core/fbcon.c:2968 [inline]
>        fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/fbcon.c:2988
>        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
>        register_framebuffer+0x470/0x610 drivers/video/fbdev/core/fbmem.c:515
>        __drm_fb_helper_initial_config_and_unlock+0x13b0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1871
>        drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1936
>        drm_fbdev_generic_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_generic.c:278
>        drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
>        drm_fbdev_generic_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_generic.c:340
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:226 [inline]
>        vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:252
>        do_one_initcall+0x24c/0x9c0 init/main.c:1267
>        do_initcall_level+0x154/0x214 init/main.c:1329
>        do_initcalls+0x58/0xac init/main.c:1345
>        do_basic_setup+0x8c/0xa0 init/main.c:1364
>        kernel_init_freeable+0x324/0x478 init/main.c:1578
>        kernel_init+0x24/0x2a0 init/main.c:1467
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860
> 
> -> #4 (console_lock){+.+.}-{0:0}:
>        console_lock+0x19c/0x1f4 kernel/printk/printk.c:2665
>        bch2_print_string_as_lines+0x2c/0xd4 fs/bcachefs/util.c:264

Still the same function that's busted, this is a dupe of
https://lore.kernel.org/dri-devel/00000000000026c1ff061cd0de12@google.com/

Cheers, Sima

>        bch2_fsck_err+0x1d84/0x3300 fs/bcachefs/error.c:352
>        bch2_check_fix_ptr fs/bcachefs/buckets.c:504 [inline]
>        bch2_check_fix_ptrs+0x14b4/0x4ae8 fs/bcachefs/buckets.c:631
>        bch2_trigger_extent+0x634/0x734 fs/bcachefs/buckets.c:1238
>        bch2_key_trigger fs/bcachefs/bkey_methods.h:88 [inline]
>        bch2_gc_mark_key+0x474/0xb3c fs/bcachefs/btree_gc.c:613
>        bch2_gc_btree fs/bcachefs/btree_gc.c:664 [inline]
>        bch2_gc_btrees fs/bcachefs/btree_gc.c:697 [inline]
>        bch2_check_allocations+0x2128/0x80d8 fs/bcachefs/btree_gc.c:1224
>        bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:182
>        bch2_run_recovery_passes+0x258/0x6e0 fs/bcachefs/recovery_passes.c:225
>        bch2_fs_recovery+0x31f0/0x5488 fs/bcachefs/recovery.c:813
>        bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1035
>        bch2_fs_open+0x8b4/0xb64 fs/bcachefs/super.c:2132
>        bch2_mount+0x4fc/0xe68 fs/bcachefs/fs.c:1926
>        legacy_get_tree+0xd4/0x16c fs/fs_context.c:662
>        vfs_get_tree+0x90/0x288 fs/super.c:1780
>        do_new_mount+0x278/0x900 fs/namespace.c:3352
>        path_mount+0x590/0xe04 fs/namespace.c:3679
>        do_mount fs/namespace.c:3692 [inline]
>        __do_sys_mount fs/namespace.c:3898 [inline]
>        __se_sys_mount fs/namespace.c:3875 [inline]
>        __arm64_sys_mount+0x45c/0x594 fs/namespace.c:3875
>        __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:131
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:150
>        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
>        el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
>        el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
> 
> -> #3 (&c->fsck_error_msgs_lock){+.+.}-{3:3}:
>        __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
>        __mutex_lock kernel/locking/mutex.c:752 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
>        bch2_fsck_err+0x2d4/0x3300 fs/bcachefs/error.c:239
>        bch2_check_fix_ptr fs/bcachefs/buckets.c:504 [inline]
>        bch2_check_fix_ptrs+0x14b4/0x4ae8 fs/bcachefs/buckets.c:631
>        bch2_trigger_extent+0x634/0x734 fs/bcachefs/buckets.c:1238
>        bch2_key_trigger fs/bcachefs/bkey_methods.h:88 [inline]
>        bch2_gc_mark_key+0x474/0xb3c fs/bcachefs/btree_gc.c:613
>        bch2_gc_btree fs/bcachefs/btree_gc.c:664 [inline]
>        bch2_gc_btrees fs/bcachefs/btree_gc.c:697 [inline]
>        bch2_check_allocations+0x2128/0x80d8 fs/bcachefs/btree_gc.c:1224
>        bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:182
>        bch2_run_recovery_passes+0x258/0x6e0 fs/bcachefs/recovery_passes.c:225
>        bch2_fs_recovery+0x31f0/0x5488 fs/bcachefs/recovery.c:813
>        bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1035
>        bch2_fs_open+0x8b4/0xb64 fs/bcachefs/super.c:2132
>        bch2_mount+0x4fc/0xe68 fs/bcachefs/fs.c:1926
>        legacy_get_tree+0xd4/0x16c fs/fs_context.c:662
>        vfs_get_tree+0x90/0x288 fs/super.c:1780
>        do_new_mount+0x278/0x900 fs/namespace.c:3352
>        path_mount+0x590/0xe04 fs/namespace.c:3679
>        do_mount fs/namespace.c:3692 [inline]
>        __do_sys_mount fs/namespace.c:3898 [inline]
>        __se_sys_mount fs/namespace.c:3875 [inline]
>        __arm64_sys_mount+0x45c/0x594 fs/namespace.c:3875
>        __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:131
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:150
>        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
>        el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
>        el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
> 
> -> #2 (&c->mark_lock){++++}-{0:0}:
>        percpu_down_read+0x5c/0x2e8 include/linux/percpu-rwsem.h:51
>        __bch2_disk_reservation_add+0x98/0x904 fs/bcachefs/buckets.c:1530
>        bch2_disk_reservation_add+0x2f0/0x45c fs/bcachefs/buckets.h:430
>        bch2_folio_reservation_get+0x4b0/0x7a0 fs/bcachefs/fs-io-pagecache.c:446
>        bch2_page_mkwrite+0xa08/0xddc fs/bcachefs/fs-io-pagecache.c:616
>        do_page_mkwrite+0x140/0x2dc mm/memory.c:3093
>        do_shared_fault mm/memory.c:4993 [inline]
>        do_fault mm/memory.c:5055 [inline]
>        do_pte_missing mm/memory.c:3897 [inline]
>        handle_pte_fault+0x11e4/0x5714 mm/memory.c:5381
>        __handle_mm_fault mm/memory.c:5524 [inline]
>        handle_mm_fault+0xe84/0x15cc mm/memory.c:5689
>        do_page_fault+0x428/0xb1c arch/arm64/mm/fault.c:613
>        do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:690
>        do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:826
>        el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:580
>        el0t_64_sync_handler+0xcc/0xfc arch/arm64/kernel/entry-common.c:733
>        el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
> 
> -> #1 (sb_pagefaults#2){.+.+}-{0:0}:
>        percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
>        __sb_start_write include/linux/fs.h:1655 [inline]
>        sb_start_pagefault include/linux/fs.h:1820 [inline]
>        bch2_page_mkwrite+0x260/0xddc fs/bcachefs/fs-io-pagecache.c:593
>        do_page_mkwrite+0x140/0x2dc mm/memory.c:3093
>        do_shared_fault mm/memory.c:4993 [inline]
>        do_fault mm/memory.c:5055 [inline]
>        do_pte_missing mm/memory.c:3897 [inline]
>        handle_pte_fault+0x11e4/0x5714 mm/memory.c:5381
>        __handle_mm_fault mm/memory.c:5524 [inline]
>        handle_mm_fault+0xe84/0x15cc mm/memory.c:5689
>        do_page_fault+0x428/0xb1c arch/arm64/mm/fault.c:613
>        do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:690
>        do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:826
>        el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:580
>        el0t_64_sync_handler+0xcc/0xfc arch/arm64/kernel/entry-common.c:733
>        el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
> 
> -> #0 (&mm->mmap_lock){++++}-{3:3}:
>        check_prev_add kernel/locking/lockdep.c:3134 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3253 [inline]
>        validate_chain kernel/locking/lockdep.c:3869 [inline]
>        __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
>        lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5754
>        __might_fault+0xc4/0x124 mm/memory.c:6234
>        drm_mode_object_get_properties+0x208/0x560 drivers/gpu/drm/drm_mode_object.c:406
>        drm_mode_getconnector+0xde4/0x1224 drivers/gpu/drm/drm_connector.c:3020
>        drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:744
>        drm_ioctl+0x5e4/0xae4 drivers/gpu/drm/drm_ioctl.c:841
>        vfs_ioctl fs/ioctl.c:51 [inline]
>        __do_sys_ioctl fs/ioctl.c:907 [inline]
>        __se_sys_ioctl fs/ioctl.c:893 [inline]
>        __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
>        __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:131
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:150
>        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
>        el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
>        el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
> 
> other info that might help us debug this:
> 
> Chain exists of:
>   &mm->mmap_lock --> crtc_ww_class_acquire --> crtc_ww_class_mutex
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(crtc_ww_class_mutex);
>                                lock(crtc_ww_class_acquire);
>                                lock(crtc_ww_class_mutex);
>   rlock(&mm->mmap_lock);
> 
>  *** DEADLOCK ***
> 
> 1 lock held by syz.4.1912/14164:
>  #0: ffff0000c8f64518 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_lock+0x78/0xa4 drivers/gpu/drm/drm_modeset_lock.c:398
> 
> stack backtrace:
> CPU: 0 PID: 14164 Comm: syz.4.1912 Not tainted 6.10.0-rc6-syzkaller-g8e2f4becf4fa #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
> Call trace:
>  dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:317
>  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:324
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:114
>  dump_stack+0x1c/0x28 lib/dump_stack.c:123
>  print_circular_bug+0x150/0x1b8 kernel/locking/lockdep.c:2060
>  check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2187
>  check_prev_add kernel/locking/lockdep.c:3134 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3253 [inline]
>  validate_chain kernel/locking/lockdep.c:3869 [inline]
>  __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
>  lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5754
>  __might_fault+0xc4/0x124 mm/memory.c:6234
>  drm_mode_object_get_properties+0x208/0x560 drivers/gpu/drm/drm_mode_object.c:406
>  drm_mode_getconnector+0xde4/0x1224 drivers/gpu/drm/drm_connector.c:3020
>  drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:744
>  drm_ioctl+0x5e4/0xae4 drivers/gpu/drm/drm_ioctl.c:841
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:907 [inline]
>  __se_sys_ioctl fs/ioctl.c:893 [inline]
>  __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
>  __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:131
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:150
>  el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
>  el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
>  el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
