Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4BA65787C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 15:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D386310E1B2;
	Wed, 28 Dec 2022 14:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D751810E1B2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 14:51:31 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D721C6008775;
 Wed, 28 Dec 2022 14:50:49 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id HQFEh9eA__YI; Wed, 28 Dec 2022 14:50:46 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C49DE600876F;
 Wed, 28 Dec 2022 14:50:46 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1672239046;
 bh=1HO4Euafnc3ATG0WLfDkiuUVCgo90WriGTavAR16hUY=;
 h=Date:From:To:Cc:Subject;
 b=KL4BZIRAdPdUIOiqIBxUYZv/G2GM/dz0gLzls8Q/Z380lvMaG3gkaJpapim4aKqVg
 CLk037AggI/XDTjxSVJ4PcEcr4nrxJEylm2W91WH0aeFkS1ZsL5q0eKr38e/uyMJ2Z
 mi/mKUOiyDvJdIiZpWBaXRhRprfhJgK42ZOEWjFc=
Received: from wslaptop (unknown [IPv6:2001:8a0:fbe7:6700:65be:d034:d2ec:60ff])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id DE47B360071;
 Wed, 28 Dec 2022 14:50:45 +0000 (WET)
Date: Wed, 28 Dec 2022 14:49:14 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: diogo.ivo@tecnico.ulisboa.pt
Subject: [REGRESSION] GM20B probe fails after commit 2541626cfb79
Message-ID: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: nouveau@lists.freedesktop.org, airlied@redhat.com,
 regressions@lists.linux.dev, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Commit 2541626cfb79 breaks GM20B probe with
the following kernel log:

[    2.153892] ------------[ cut here ]------------
[    2.153897] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:273 gf100_vmm_valid+0x2c4/0x390
[    2.153916] Modules linked in:
[    2.153922] CPU: 1 PID: 36 Comm: kworker/u8:1 Not tainted 6.1.0+ #1
[    2.153929] Hardware name: Google Pixel C (DT)
[    2.153933] Workqueue: events_unbound deferred_probe_work_func
[    2.153943] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.153950] pc : gf100_vmm_valid+0x2c4/0x390
[    2.153959] lr : gf100_vmm_valid+0xb4/0x390
[    2.153966] sp : ffffffc009e134b0
[    2.153969] x29: ffffffc009e134b0 x28: 0000000000000000 x27: ffffffc008fd44c8
[    2.153979] x26: 00000000ffffffea x25: ffffffc0087b98d0 x24: ffffff8080f89038
[    2.153987] x23: ffffff8081fadc08 x22: 0000000000000000 x21: 0000000000000000
[    2.153995] x20: ffffff8080f8a000 x19: ffffffc009e13678 x18: 0000000000000000
[    2.154003] x17: f37a8b93418958e6 x16: ffffffc009f0d000 x15: 0000000000000000
[    2.154011] x14: 0000000000000002 x13: 000000000003a020 x12: ffffffc008000000
[    2.154019] x11: 0000000102913000 x10: 0000000000000000 x9 : 0000000000000000
[    2.154026] x8 : ffffffc009e136d8 x7 : ffffffc008fd44c8 x6 : ffffff80803d0f00
[    2.154034] x5 : 0000000000000000 x4 : ffffff8080f88c00 x3 : 0000000000000010
[    2.154041] x2 : 000000000000000c x1 : 00000000ffffffea x0 : 00000000ffffffea
[    2.154050] Call trace:
[    2.154053]  gf100_vmm_valid+0x2c4/0x390
[    2.154061]  nvkm_vmm_map_valid+0xd4/0x204
[    2.154069]  nvkm_vmm_map_locked+0xa4/0x344
[    2.154076]  nvkm_vmm_map+0x50/0x84
[    2.154083]  nvkm_firmware_mem_map+0x84/0xc4
[    2.154094]  nvkm_falcon_fw_oneinit+0xc8/0x320
[    2.154101]  nvkm_acr_oneinit+0x428/0x5b0
[    2.154109]  nvkm_subdev_oneinit_+0x50/0x104
[    2.154114]  nvkm_subdev_init_+0x3c/0x12c
[    2.154119]  nvkm_subdev_init+0x60/0xa0
[    2.154125]  nvkm_device_init+0x14c/0x2a0
[    2.154133]  nvkm_udevice_init+0x60/0x9c
[    2.154140]  nvkm_object_init+0x48/0x1b0
[    2.154144]  nvkm_ioctl_new+0x168/0x254
[    2.154149]  nvkm_ioctl+0xd0/0x220
[    2.154153]  nvkm_client_ioctl+0x10/0x1c
[    2.154162]  nvif_object_ctor+0xf4/0x22c
[    2.154168]  nvif_device_ctor+0x28/0x70
[    2.154174]  nouveau_cli_init+0x150/0x590
[    2.154180]  nouveau_drm_device_init+0x60/0x2a0
[    2.154187]  nouveau_platform_device_create+0x90/0xd0
[    2.154193]  nouveau_platform_probe+0x3c/0x9c
[    2.154200]  platform_probe+0x68/0xc0
[    2.154207]  really_probe+0xbc/0x2dc
[    2.154211]  __driver_probe_device+0x78/0xe0
[    2.154216]  driver_probe_device+0xd8/0x160
[    2.154221]  __device_attach_driver+0xb8/0x134
[    2.154226]  bus_for_each_drv+0x78/0xd0
[    2.154230]  __device_attach+0x9c/0x1a0
[    2.154234]  device_initial_probe+0x14/0x20
[    2.154239]  bus_probe_device+0x98/0xa0
[    2.154243]  deferred_probe_work_func+0x88/0xc0
[    2.154247]  process_one_work+0x204/0x40c
[    2.154256]  worker_thread+0x230/0x450
[    2.154261]  kthread+0xc8/0xcc
[    2.154266]  ret_from_fork+0x10/0x20
[    2.154273] ---[ end trace 0000000000000000 ]---
[    2.154278] nouveau 57000000.gpu: pmu: map -22
[    2.154285] nouveau 57000000.gpu: acr: one-time init failed, -22
[    2.154559] nouveau 57000000.gpu: init failed with -22
[    2.154564] nouveau: DRM-master:00000000:00000080: init failed with -22
[    2.154574] nouveau 57000000.gpu: DRM-master: Device allocation failed: -22
[    2.162905] nouveau: probe of 57000000.gpu failed with error -22

#regzbot introduced: 2541626cfb79

Thanks,

Diogo Ivo
