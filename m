Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFF39DE9E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 16:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A296E8E4;
	Mon,  7 Jun 2021 14:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4706B6E507
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 13:57:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 642821063;
 Mon,  7 Jun 2021 06:57:03 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.4.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7601F3F694;
 Mon,  7 Jun 2021 06:57:01 -0700 (PDT)
Date: Mon, 7 Jun 2021 14:56:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210607135659.GE97489@C02TD0UTHF1T.local>
References: <20210527124356.22367-1-will@kernel.org>
 <CGME20210602132541eucas1p17127696041c26c00d1d2f50bef9cfaf0@eucas1p1.samsung.com>
 <4d0c8318-bad8-2be7-e292-fc8f70c198de@samsung.com>
 <20210602135123.GD12753@C02TD0UTHF1T.local>
 <130ce34f-460a-0046-f722-00144f2d5502@samsung.com>
 <20210604100114.GC64162@C02TD0UTHF1T.local>
 <0d10411d-49fe-fbca-0479-e2983af16aa8@samsung.com>
 <20210607120118.GC97489@C02TD0UTHF1T.local>
 <20210607130859.GD97489@C02TD0UTHF1T.local>
 <20210607133953.GB7330@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607133953.GB7330@willie-the-truck>
X-Mailman-Approved-At: Mon, 07 Jun 2021 14:23:15 +0000
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
Cc: Arnd Bergmann <arnd@arndb.de>, emma@anholt.net,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 dri-devel@lists.freedesktop.org, kernel-team@android.com,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 02:39:54PM +0100, Will Deacon wrote:
> [Adding VC4 folks -- please see the KASAN splat below!]
> 
> Background here is that reducing ARCH_DMA_MINALIGN to 64 on arm64 (queued in
> -next) is causing vc4 to hang on Rpi3b due to a probable driver bug.
> 
> Will
> 
> On Mon, Jun 07, 2021 at 02:08:59PM +0100, Mark Rutland wrote:
> > On Mon, Jun 07, 2021 at 01:01:18PM +0100, Mark Rutland wrote:
> > > On Mon, Jun 07, 2021 at 11:58:32AM +0200, Marek Szyprowski wrote:
> > > > I've just checked with the latest firmware from 
> > > > https://github.com/raspberrypi/firmware (master branch, just copied 
> > > > everything to /boot) and the issue is still there.
> > > > 
> > > > If you start from arm64/defconfig without modules, please make sure you 
> > > > have enabled all RPi drivers, otherwise VC4 DRM won't come up. I've 
> > > > managed to reproduce the issue without the modules with the following 
> > > > changes to arm64's defconfig:
> > > > 
> > > > ./scripts/config -e DRM -e DRM_VC4 -e CONFIG_CLK_RASPBERRYPI -e 
> > > > CONFIG_SENSORS_RASPBERRYPI_HWMON -e CONFIG_I2C_BCM2835 -e 
> > > > CONFIG_ARM_RASPBERRYPI_CPUFREQ
> > > 
> > > Thanks for this!
> > > 
> > > With that config on commit 65688d2a05deb9f0 I also see a hang at the end
> > > of boot, but before reaching userspace, with the last messages in dmesg
> > > as below.
> > > 
> > > I'll go check that the ARCH_DMA_MINALIGN affects this, then I'll go play
> > > with debug options.
> > 
> > I can confirm that with the ARCH_DMA_MINALIGN change reverted, the hang
> > goes away. Running with that reverted andwith KASAN, I get the
> > slab-out-of-bounds splat below, which occurs at the time the hang would
> > otherwise occur, and is possibly the problem:
> > 
> > [    3.609515] vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops)
> > [    3.621451] vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops)
> > [    3.628344] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops)
> > [    3.635904] vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops)
> > [    3.643351] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops)
> > [    3.651238] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops)
> > [    3.659167] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops)
> > [    3.666499] vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops)
> > [    3.688560] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
> > [    3.728010] ==================================================================
> > [    3.728042] BUG: KASAN: slab-out-of-bounds in vc4_atomic_commit_tail+0x1cc/0x910
> > [    3.728123] Read of size 8 at addr ffff000007360440 by task kworker/u8:0/7

FWIW, faddr2line tells me this is:

[mark@lakrids:~/src/linux]% ./scripts/faddr2line vmlinux vc4_atomic_commit_tail+0x1cc/0x910
vc4_atomic_commit_tail+0x1cc/0x910:
vc4_atomic_commit_tail at drivers/gpu/drm/vc4/vc4_kms.c:375

... which is:

| ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[i].pending_commit);

Thanks,
Mark.

> > [    3.728153]
> > [    3.728169] CPU: 2 PID: 7 Comm: kworker/u8:0 Not tainted 5.13.0-rc3-00009-g694c523e7267 #3
> > [    3.728203] Hardware name: Raspberry Pi 3 Model B (DT)
> > [    3.728225] Workqueue: events_unbound deferred_probe_work_func
> > [    3.728290] Call trace:
> > [    3.728301]  dump_backtrace+0x0/0x2b4
> > [    3.728358]  show_stack+0x1c/0x30
> > [    3.728407]  dump_stack+0xfc/0x168
> > [    3.728445]  print_address_description.constprop.0+0x2c/0x2c0
> > [    3.728495]  kasan_report+0x1dc/0x240
> > [    3.728529]  __asan_load8+0x98/0xd4
> > [    3.728565]  vc4_atomic_commit_tail+0x1cc/0x910
> > [    3.728621]  commit_tail+0x100/0x210
> > [    3.728675]  drm_atomic_helper_commit+0x1c4/0x3dc
> > [    3.728730]  drm_atomic_commit+0x80/0x94
> > [    3.728768]  drm_client_modeset_commit_atomic+0x2f4/0x3a0
> > [    3.728821]  drm_client_modeset_commit_locked+0x8c/0x230
> > [    3.728872]  drm_fb_helper_pan_display+0x164/0x3a0
> > [    3.728924]  fb_pan_display+0x12c/0x1fc
> > [    3.728963]  bit_update_start+0x34/0xa0
> > [    3.729013]  fbcon_switch+0x678/0x920
> > [    3.729058]  redraw_screen+0x17c/0x35c
> > [    3.729095]  fbcon_prepare_logo+0x484/0x5bc
> > [    3.729143]  fbcon_init+0x77c/0x970
> > [    3.729187]  visual_init+0x14c/0x1e4
> > [    3.729239]  do_bind_con_driver.isra.0+0x2c4/0x530
> > [    3.729279]  do_take_over_console+0x200/0x2e0
> > [    3.729317]  do_fbcon_takeover+0x90/0x120
> > [    3.729363]  fbcon_fb_registered+0x14c/0x164
> > [    3.729412]  register_framebuffer+0x308/0x4e0
> > [    3.729451]  __drm_fb_helper_initial_config_and_unlock+0x538/0x7d0
> > [    3.729506]  drm_fbdev_client_hotplug+0x204/0x374
> > [    3.729556]  drm_fbdev_generic_setup+0xf4/0x24c
> > [    3.729604]  vc4_drm_bind+0x1d4/0x1f0
> > [    3.729654]  try_to_bring_up_master+0x254/0x2dc
> > [    3.729709]  __component_add+0x10c/0x240
> > [    3.729759]  component_add+0x18/0x24
> > [    3.729807]  vc4_v3d_dev_probe+0x20/0x30
> > [    3.729854]  platform_probe+0x90/0x110
> > [    3.729907]  really_probe+0x148/0x744
> > [    3.729952]  driver_probe_device+0x8c/0xfc
> > [    3.729998]  __device_attach_driver+0x120/0x180
> > [    3.730048]  bus_for_each_drv+0xf4/0x15c
> > [    3.730091]  __device_attach+0x168/0x250
> > [    3.730137]  device_initial_probe+0x18/0x24
> > [    3.730186]  bus_probe_device+0xec/0x100
> > [    3.730230]  deferred_probe_work_func+0xe8/0x130
> > [    3.730279]  process_one_work+0x3b8/0x650
> > [    3.730319]  worker_thread+0x3cc/0x72c
> > [    3.730356]  kthread+0x21c/0x224
> > [    3.730402]  ret_from_fork+0x10/0x38
> > [    3.730442]
> > [    3.730453] Allocated by task 7:
> > [    3.730470]  kasan_save_stack+0x2c/0x60
> > [    3.730526]  __kasan_kmalloc+0x90/0xb4
> > [    3.730577]  vc4_hvs_channels_duplicate_state+0x60/0x1a0
> > [    3.730637]  drm_atomic_get_private_obj_state+0x144/0x230
> > [    3.730680]  vc4_atomic_check+0x40/0x73c
> > [    3.730732]  drm_atomic_check_only+0x998/0xe60
> > [    3.730769]  drm_atomic_commit+0x34/0x94
> > [    3.730804]  drm_client_modeset_commit_atomic+0x2f4/0x3a0
> > [    3.730854]  drm_client_modeset_commit_locked+0x8c/0x230
> > [    3.730904]  drm_client_modeset_commit+0x38/0x60
> > [    3.730951]  drm_fb_helper_set_par+0x104/0x17c
> > [    3.730998]  fbcon_init+0x43c/0x970
> > [    3.731041]  visual_init+0x14c/0x1e4
> > [    3.731090]  do_bind_con_driver.isra.0+0x2c4/0x530
> > [    3.731128]  do_take_over_console+0x200/0x2e0
> > [    3.731165]  do_fbcon_takeover+0x90/0x120
> > [    3.731210]  fbcon_fb_registered+0x14c/0x164
> > [    3.731258]  register_framebuffer+0x308/0x4e0
> > [    3.731296]  __drm_fb_helper_initial_config_and_unlock+0x538/0x7d0
> > [    3.731349]  drm_fbdev_client_hotplug+0x204/0x374
> > [    3.731398]  drm_fbdev_generic_setup+0xf4/0x24c
> > [    3.731446]  vc4_drm_bind+0x1d4/0x1f0
> > [    3.731493]  try_to_bring_up_master+0x254/0x2dc
> > [    3.731546]  __component_add+0x10c/0x240
> > [    3.731594]  component_add+0x18/0x24
> > [    3.731642]  vc4_v3d_dev_probe+0x20/0x30
> > [    3.731686]  platform_probe+0x90/0x110
> > [    3.731737]  really_probe+0x148/0x744
> > [    3.731781]  driver_probe_device+0x8c/0xfc
> > [    3.731827]  __device_attach_driver+0x120/0x180
> > [    3.731875]  bus_for_each_drv+0xf4/0x15c
> > [    3.731916]  __device_attach+0x168/0x250
> > [    3.731962]  device_initial_probe+0x18/0x24
> > [    3.732009]  bus_probe_device+0xec/0x100
> > [    3.732052]  deferred_probe_work_func+0xe8/0x130
> > [    3.732100]  process_one_work+0x3b8/0x650
> > [    3.732137]  worker_thread+0x3cc/0x72c
> > [    3.732172]  kthread+0x21c/0x224
> > [    3.732215]  ret_from_fork+0x10/0x38
> > [    3.732253]
> > [    3.732262] The buggy address belongs to the object at ffff000007360400
> > [    3.732262]  which belongs to the cache kmalloc-128 of size 128
> > [    3.732293] The buggy address is located 64 bytes inside of
> > [    3.732293]  128-byte region [ffff000007360400, ffff000007360480)
> > [    3.732329] The buggy address belongs to the page:
> > [    3.732344] page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7360
> > [    3.732380] flags: 0x3fffc0000000200(slab|node=0|zone=0|lastcpupid=0xffff)
> > [    3.732442] raw: 03fffc0000000200 dead000000000100 dead000000000122 ffff000004c02300
> > [    3.732478] raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
> > [    3.732501] page dumped because: kasan: bad access detected
> > [    3.732518]
> > [    3.732527] Memory state around the buggy address:
> > [    3.732549]  ffff000007360300: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > [    3.732579]  ffff000007360380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > [    3.732608] >ffff000007360400: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
> > [    3.732629]                                            ^
> > [    3.732652]  ffff000007360480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > [    3.732682]  ffff000007360500: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > [    3.732703] ==================================================================
> > [    3.732718] Disabling lock debugging due to kernel taint
> > [    3.769129] Console: switching to colour frame buffer device 90x30
> > [    5.148699] vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
