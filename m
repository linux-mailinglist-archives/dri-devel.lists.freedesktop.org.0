Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE0C99F667
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7D610E5EF;
	Tue, 15 Oct 2024 18:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="PfXrujZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2555 seconds by postgrey-1.36 at gabe;
 Tue, 15 Oct 2024 18:56:00 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D16E10E121;
 Tue, 15 Oct 2024 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=gTV2WyhAptOPtQpq1eQKhlZnoaCfGwfjJaHbKBok3Oo=;
 t=1729018560; x=1729450560; b=PfXrujZDP4NWosslFs7jVgTiN7CfGA7z71Ppv/QL9MF/EzF
 Jnd+a4TzdXpg8TTq2yJE0ZK+SA/IjY0XwitnucEu8JiEd8kkEvyjAMlIvBymxi5VmcTkR21pEuJLg
 L30ddeD8shqqBG8DDEaLj7STuPURFfg4wRyIDUoZ2Xd+k3/P9dxAM/m9+HYumzVaoSu0x+qV2sVrK
 7EkVdVzFZp18mAvaDGPTK9yUJWV2S620ZStzf1MV2Qsf+0h2xCneMHYc8+vYhhoqgSLJeD4gFG6If
 0u2ghlO8LNzsq9E7SoqyXiibsMlNllodFyCk+aCxCowNrBr+y+cM1fTTKOA7PH+Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1t0m2m-0004mf-L7; Tue, 15 Oct 2024 20:13:16 +0200
Message-ID: <041511ee-4556-422a-8604-30b5e0dfd21c@leemhuis.info>
Date: Tue, 15 Oct 2024 20:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] GM20B pmu timeout
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Cc: regressions@lists.linux.dev
References: <20241010133253.30311-1-diogo.ivo@tecnico.ulisboa.pt>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <20241010133253.30311-1-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1729018560;
 92706003; 
X-HE-SMSGID: 1t0m2m-0004mf-L7
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thorsten here, the Linux kernel's regression tracker.

On 10.10.24 15:32, Diogo Ivo wrote:
> 
> Somewhere between 6.11-rc4 and 6.11-rc5 the following error message is displayed
> when trying to initialize a nvc0_screen on the Tegra X1's GM20B:
> 
> [ 34.431210] nouveau 57000000.gpu: pmu:hpq: timeout waiting for queue ready
> [ 34.438145] nouveau 57000000.gpu: gr: init failed, -110
> nvc0_screen_create:1075 - Error allocating PGRAPH context for M2MF: -110
> failed to create GPU screen

Thx for the report. Hmmm. No reply so far. :-/

Diogo, maybe report this here as well:
https://gitlab.freedesktop.org/drm/nouveau/-/issues/

Afterwards drop a link to the ticket here. Reporting nouveau issues via
email should work, but maybe you have more luck there.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

> If we then try a second time we get a more detailed error message:
> 
> [   27.432391] ------------[ cut here ]------------
> [   27.437019] nouveau 57000000.gpu: timeout
> [   27.441083] WARNING: CPU: 2 PID: 307 at drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:840 gf100_gr_fecs_bind_pointer+0x140/0x158 [nouveau]
> [   27.453897] Modules linked in: nouveau drm_ttm_helper ttm backlight gpu_sched i2c_algo_bit drm_gpuvm drm_exec efivarfs
> [   27.464592] CPU: 2 UID: 0 PID: 307 Comm: loadjpeg Not tainted 6.11.0-rc4+ #1
> [   27.471628] Hardware name: nvidia NVIDIA P2371-2180/NVIDIA P2371-2180, BIOS 2024.10-rc5-00018-g56b47b8b6a09 10/01/2024
> [   27.482303] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   27.489251] pc : gf100_gr_fecs_bind_pointer+0x140/0x158 [nouveau]
> [   27.495535] lr : gf100_gr_fecs_bind_pointer+0x140/0x158 [nouveau]
> [   27.501794] sp : ffffffc082473810
> [   27.505100] x29: ffffffc082473840 x28: ffffff80c56fe500 x27: ffffff80c6f3be40
> [   27.512227] x26: 00000000804001ea x25: 0000000000000001 x24: 0000000000000000
> [   27.519351] x23: ffffff80c5516808 x22: ffffffc079d08350 x21: ffffff80c16bae40
> [   27.526476] x20: 0000000000409800 x19: ffffff80c5516808 x18: ffffffffffffffff
> [   27.533599] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000006
> [   27.540724] x14: ffffffc0817defc8 x13: 74756f656d697420 x12: 3a7570672e303030
> [   27.547848] x11: ffffffc0817defc8 x10: 00000000000003f1 x9 : ffffffc081836fc8
> [   27.554972] x8 : 0000000000017fe8 x7 : 00000000fffff000 x6 : 0000000000000001
> [   27.562096] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [   27.569218] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff80d578c600
> [   27.576341] Call trace:
> [   27.578780]  gf100_gr_fecs_bind_pointer+0x140/0x158 [nouveau]
> [   27.584698]  gf100_grctx_generate+0x54c/0x6f4 [nouveau]
> [   27.590093]  gf100_gr_chan_new+0x3f8/0x430 [nouveau]
> [   27.595223]  nvkm_gr_cclass_new+0x34/0x48 [nouveau]
> [   27.600269]  nvkm_cgrp_ectx_get+0x134/0x224 [nouveau]
> [   27.605485]  nvkm_cgrp_vctx_get+0x11c/0x300 [nouveau]
> [   27.610704]  nvkm_chan_cctx_get+0x144/0x25c [nouveau]
> [   27.615920]  nvkm_uchan_object_new+0xd8/0x1e0 [nouveau]
> [   27.621311]  nvkm_ioctl_new+0x14c/0x24c [nouveau]
> [   27.626167]  nvkm_ioctl+0xd0/0x280 [nouveau]
> [   27.630590]  nvkm_client_ioctl+0x10/0x1c [nouveau]
> [   27.635551]  nvif_client_ioctl+0x20/0x2c [nouveau]
> [   27.640493]  usif_ioctl+0x294/0x420 [nouveau]
> [   27.645021]  nouveau_drm_ioctl+0xb0/0xe0 [nouveau]
> [   27.649982]  __arm64_sys_ioctl+0xac/0xf0
> [   27.653900]  invoke_syscall+0x48/0x104
> [   27.657645]  el0_svc_common.constprop.0+0x40/0xe0
> [   27.662341]  do_el0_svc+0x1c/0x28
> [   27.665650]  el0_svc+0x3c/0x108
> [   27.668787]  el0t_64_sync_handler+0x120/0x12c
> [   27.673133]  el0t_64_sync+0x190/0x194
> [   27.676789] ---[ end trace 0000000000000000 ]---
> [   27.681937] nouveau 57000000.gpu: gr: failed to construct context
> [   27.688126] nouveau 57000000.gpu: fifo:000000:0002:[loadjpeg[307]] ectx 0[gr]: -110
> [   27.695786] nouveau 57000000.gpu: fifo:000000:0002:0002:[loadjpeg[307]] vctx 0[gr]: -110
> nvc0_screen_create:1075 - Error allocating PGRAPH context for M2MF: -110
> failed to create GPU screen
> 
> but I am not sure if this is connected to the fact that the first attempt
> failed or not.
> 
> When trying to bissect the issue the "bad" commit I obtained was 9b340aeb26d5.
> However, checking out this commit and compiling the kernel leads to a different
> error where we have a boot regression:
> 
> [   19.146693] nouveau 57000000.gpu: Adding to iommu group 3
> [   19.155581] nouveau 57000000.gpu: NVIDIA GM20B (12b000a1)
> [   19.161025] nouveau 57000000.gpu: imem: using IOMMU
> [   22.451833] ------------[ cut here ]------------
> [   22.456460] nouveau 57000000.gpu: timeout
> [   22.460508] WARNING: CPU: 0 PID: 201 at drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c:231 gm200_flcn_fw_boot+0x2a4/0x428 [nouveau]
> [   22.472384] Modules linked in: nouveau(+) drm_ttm_helper ttm backlight gpu_sched i2c_algo_bit drm_gpuvm drm_exec efivarfs
> [   22.483342] CPU: 0 UID: 0 PID: 201 Comm: (udev-worker) Not tainted 6.11.0-rc1+ #4
> [   22.490811] Hardware name: nvidia NVIDIA P2371-2180/NVIDIA P2371-2180, BIOS 2024.10-rc5-00018-g56b47b8b6a09 10/01/2024
> [   22.501485] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   22.508434] pc : gm200_flcn_fw_boot+0x2a4/0x428 [nouveau]
> [   22.514063] lr : gm200_flcn_fw_boot+0x2a4/0x428 [nouveau]
> [   22.519656] sp : ffffffc0822fb3e0
> [   22.522961] x29: ffffffc0822fb410 x28: ffffff80c7bf0008 x27: ffffff80d5625208
> [   22.530088] x26: 0000000000000001 x25: 0000000000000010 x24: 0000000000000000
> [   22.537213] x23: ffffff80c4e920b8 x22: 0000000000000000 x21: 0000000000000000
> [   22.544336] x20: 0000000000000010 x19: ffffff80c4e920b8 x18: ffffffffffffffff
> [   22.551460] x17: 000000000000d000 x16: 0000000000000000 x15: 0000000000000006
> [   22.558585] x14: ffffffc08181efa8 x13: 74756f656d697420 x12: 3a7570672e303030
> [   22.565709] x11: ffffffc08181efa8 x10: 00000000000003fd x9 : ffffffc081876fa8
> [   22.572834] x8 : 0000000000017fe8 x7 : 00000000fffff000 x6 : 0000000000000001
> [   22.579958] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [   22.587083] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff80c2f98000
> [   22.594208] Call trace:
> [   22.596647]  gm200_flcn_fw_boot+0x2a4/0x428 [nouveau]
> [   22.601904]  nvkm_falcon_fw_boot+0x1b4/0x598 [nouveau]
> [   22.607237]  nvkm_acr_hsfw_boot+0x78/0xa4 [nouveau]
> [   22.612309]  gm200_acr_init+0x18/0x24 [nouveau]
> [   22.617034]  nvkm_acr_load+0x7c/0x18c [nouveau]
> [   22.621760]  nvkm_acr_init+0x54/0x70 [nouveau]
> [   22.626400]  nvkm_subdev_init_+0x5c/0x12c [nouveau]
> [   22.631471]  nvkm_subdev_init+0x60/0xa0 [nouveau]
> [   22.636370]  nvkm_device_init+0x160/0x2a0 [nouveau]
> [   22.641448]  nvkm_udevice_init+0x60/0xa0 [nouveau]
> [   22.646439]  nvkm_object_init+0x48/0x1c0 [nouveau]
> [   22.651426]  nvkm_ioctl_new+0x164/0x24c [nouveau]
> [   22.656323]  nvkm_ioctl+0xd0/0x280 [nouveau]
> [   22.660787]  nvkm_client_ioctl+0x10/0x1c [nouveau]
> [   22.665784]  nvif_object_ctor+0xe8/0x1b8 [nouveau]
> [   22.670769]  nvif_device_ctor+0x28/0x78 [nouveau]
> [   22.675667]  nouveau_cli_init+0x154/0x5e0 [nouveau]
> [   22.680749]  nouveau_drm_device_init+0x84/0x2e0 [nouveau]
> [   22.686352]  nouveau_platform_device_create+0x90/0xe0 [nouveau]
> [   22.692476]  nouveau_platform_probe+0x40/0xc0 [nouveau]
> [   22.697904]  platform_probe+0x68/0xd8
> [   22.701564]  really_probe+0xbc/0x2c0
> [   22.705133]  __driver_probe_device+0x78/0x120
> [   22.709480]  driver_probe_device+0x3c/0x160
> [   22.713654]  __driver_attach+0x90/0x1a0
> [   22.717481]  bus_for_each_dev+0x78/0xd8
> [   22.721309]  driver_attach+0x24/0x30
> [   22.724875]  bus_add_driver+0xe4/0x208
> [   22.728615]  driver_register+0x68/0x124
> [   22.732443]  __platform_driver_register+0x28/0x40
> [   22.737137]  nouveau_drm_init+0x90/0x1000 [nouveau]
> [   22.742217]  do_one_initcall+0x44/0x230
> [   22.746047]  do_init_module+0x5c/0x220
> [   22.749788]  load_module+0x748/0x87c
> [   22.753355]  init_module_from_file+0x88/0xcc
> [   22.757617]  __arm64_sys_finit_module+0x164/0x328
> [   22.762310]  invoke_syscall+0x48/0x104
> [   22.766054]  el0_svc_common+0xc8/0xe8
> [   22.769710]  do_el0_svc+0x20/0x34
> [   22.773017]  el0_svc+0x3c/0x108
> [   22.776155]  el0t_64_sync_handler+0x120/0x12c
> [   22.780502]  el0t_64_sync+0x190/0x194
> [   22.784156] ---[ end trace 0000000000000000 ]---
> [   22.788838] nouveau 57000000.gpu: pmu(acr): mbox 00000001 00000000
> [   22.795033] nouveau 57000000.gpu: pmu(acr):load: boot failed: -110
> [   22.801235] nouveau 57000000.gpu: acr: init failed, -110
> [   22.806858] nouveau 57000000.gpu: init failed with -110
> [   22.812084] nouveau: DRM-master:00000000:00000080: init failed with -110
> [   22.818793] nouveau 57000000.gpu: DRM-master: Device allocation failed: -110
> [   22.826368] ------------[ cut here ]------------
> [   22.830980] WARNING: CPU: 2 PID: 201 at drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c:239 nvkm_mmu_dtor+0xac/0xc0 [nouveau]
> [   22.842573] Modules linked in: nouveau(+) drm_ttm_helper ttm backlight gpu_sched i2c_algo_bit drm_gpuvm drm_exec efivarfs
> [   22.853529] CPU: 2 UID: 0 PID: 201 Comm: (udev-worker) Tainted: G        W          6.11.0-rc1+ #4
> [   22.862475] Tainted: [W]=WARN
> [   22.865433] Hardware name: nvidia NVIDIA P2371-2180/NVIDIA P2371-2180, BIOS 2024.10-rc5-00018-g56b47b8b6a09 10/01/2024
> [   22.876107] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   22.883055] pc : nvkm_mmu_dtor+0xac/0xc0 [nouveau]
> [   22.888063] lr : nvkm_mmu_dtor+0x24/0xc0 [nouveau]
> [   22.893057] sp : ffffffc0822fb7f0
> [   22.896362] x29: ffffffc0822fb7f0 x28: 0000000000000000 x27: ffffffc079c69a18
> [   22.903488] x26: ffffffc079c69d38 x25: ffffffc081892ce8 x24: ffffff80d5624e00
> [   22.910613] x23: ffffff80d5624e08 x22: dead000000000122 x21: dead000000000100
> [   22.917737] x20: ffffff80d5624f50 x19: ffffff80c4e07500 x18: ffffffffffffffff
> [   22.924861] x17: 0000000000001000 x16: 0000000000000000 x15: 0000000000000000
> [   22.931985] x14: 0000000000000000 x13: dead000000000122 x12: 0000000000000001
> [   22.939109] x11: 0000000080000000 x10: 0000000000000000 x9 : 0000000000000001
> [   22.946233] x8 : 00000000000007e0 x7 : 0000000000000000 x6 : 0000000000000239
> [   22.953357] x5 : 000000000010000c x4 : dead000000000122 x3 : ffffff80c2fa5b38
> [   22.960481] x2 : ffffff80d519a320 x1 : ffffff80d519a2d0 x0 : ffffff80d519a2c0
> [   22.967604] Call trace:
> [   22.970042]  nvkm_mmu_dtor+0xac/0xc0 [nouveau]
> [   22.974690]  nvkm_subdev_del+0x6c/0xf8 [nouveau]
> [   22.979504]  nvkm_device_del+0x78/0x120 [nouveau]
> [   22.984410]  nouveau_platform_device_create+0x54/0xe0 [nouveau]
> [   22.990534]  nouveau_platform_probe+0x40/0xc0 [nouveau]
> [   22.995966]  platform_probe+0x68/0xd8
> [   22.999624]  really_probe+0xbc/0x2c0
> [   23.003192]  __driver_probe_device+0x78/0x120
> [   23.007540]  driver_probe_device+0x3c/0x160
> [   23.011714]  __driver_attach+0x90/0x1a0
> [   23.015542]  bus_for_each_dev+0x78/0xd8
> [   23.019369]  driver_attach+0x24/0x30
> [   23.022937]  bus_add_driver+0xe4/0x208
> [   23.026676]  driver_register+0x68/0x124
> [   23.030503]  __platform_driver_register+0x28/0x40
> [   23.035197]  nouveau_drm_init+0x90/0x1000 [nouveau]
> [   23.040274]  do_one_initcall+0x44/0x230
> [   23.044103]  do_init_module+0x5c/0x220
> [   23.047844]  load_module+0x748/0x87c
> [   23.051412]  init_module_from_file+0x88/0xcc
> [   23.055672]  __arm64_sys_finit_module+0x164/0x328
> [   23.060367]  invoke_syscall+0x48/0x104
> [   23.064110]  el0_svc_common+0xc8/0xe8
> [   23.067765]  do_el0_svc+0x20/0x34
> [   23.071073]  el0_svc+0x3c/0x108
> [   23.074206]  el0t_64_sync_handler+0x120/0x12c
> [   23.078553]  el0t_64_sync+0x190/0x194
> [   23.082206] ---[ end trace 0000000000000000 ]---
> [   23.087065] nouveau 57000000.gpu: imem: instobj LRU not empty!
> [   23.092906] nouveau 57000000.gpu: imem: instobj vmap area not empty! 0x40000 bytes still mapped
> [   23.101958] nvkm: mm not clean!
> [   23.105095] nvkm: node list:
> [   23.107994] nvkm: 	00000000 00000074 0
> [   23.111750] nvkm: 	00400074 00000040 1
> [   23.115496] nvkm: 	000000b4 003fff4c 0
> [   23.119248] nvkm: free list:
> [   23.122128] nvkm: 	00000000 00000074 0
> [   23.125880] nvkm: 	000000b4 003fff4c 0
> [   23.129643] nouveau 57000000.gpu: probe with driver nouveau failed with error -110
> 
> so I am not sure that this is the actual commit that introduces the breakage.
> I have also tried to manually checkout some commits to see where the problem
> could be but unfortunately nothing came out of it.
> 
> Best regards,
> Diogo
> 
> #regzbot introduced: v6.11-rc4..v6.11-rc5 
> 
> 
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
