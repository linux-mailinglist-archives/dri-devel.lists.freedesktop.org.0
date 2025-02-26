Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65CCA45286
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 03:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A7210E831;
	Wed, 26 Feb 2025 02:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rudhP1RB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBA310E831;
 Wed, 26 Feb 2025 02:00:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 67B5961201;
 Wed, 26 Feb 2025 02:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 538BCC4CEE8;
 Wed, 26 Feb 2025 02:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740535220;
 bh=0MQc7fMF+RNLl2cUvk9VyHGqe4od4BWS2NW80uwz8RA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=rudhP1RBg6NUHAPpAJCgd9BmFSMzm04apVcZFnOCV9ognvt6BJUW+3o5vpEOqsO6N
 FebddIE3XSVQehIC4vmn1MdUX5ZlUKpBj47nynppgAaY8BZNt45Z4MNuLF7tuP0LqH
 Sj694wTiM/tOtqlzM0YwAZwlVODjPUeStFhzMpSB3+fJAR/LGQzrzj7cCVT9Ow8W8v
 mT/0tyPg9jhKSfHdcqKTeGCZD2wSzRuviXoHVeT2pT4NqDAKTvefMDUNqUguByV93V
 anMfRoTQwfUlggD3z5WIHel+7gXCPC7/KnJIR7R9tkA5RHupQsVpx7CDQxQZFOtIo1
 oAVNKCdOJ8W4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 44353C18E7C;
 Wed, 26 Feb 2025 02:00:20 +0000 (UTC)
From: Mingcong Bai via B4 Relay <devnull+jeffbai.aosc.io@kernel.org>
Date: Wed, 26 Feb 2025 10:00:18 +0800
Subject: [PATCH 1/5] drm/xe/bo: fix alignment with non-4K kernel page sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-xe-non-4k-fix-v1-1-80f23b5ee40e@aosc.io>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
In-Reply-To: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Mateusz Naklicki <mateusz.naklicki@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Kexy Biscuit <kexybiscuit@aosc.io>, 
 Shang Yatsen <429839446@qq.com>, Mingcong Bai <jeffbai@aosc.io>, 
 stable@vger.kernel.org, Haien Liang <27873200@qq.com>, 
 Shirong Liu <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740535218; l=7713;
 i=jeffbai@aosc.io; s=20250225; h=from:subject:message-id;
 bh=vSGHi13qMDeyRShqqFIXKtr/EE7KCZjunjoYZNAKjoM=;
 b=tdT4cJa14X716FB8/XNttyKiscK2Sm6A9Cra3I0UR9d0MMLsGmf+kFbLuh6ZCo0I0EoSOQJIN
 4HCMwN3Dn23CMCKS+fcS1pvEmGqFa3/lh5b7JYplqru3Wxfuvii7kw7
X-Developer-Key: i=jeffbai@aosc.io; a=ed25519;
 pk=PShXLX1m130BHsde1t/EjBugyyOjSVdzV0dYuYejXYU=
X-Endpoint-Received: by B4 Relay for jeffbai@aosc.io/20250225 with auth_id=349
X-Original-From: Mingcong Bai <jeffbai@aosc.io>
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
Reply-To: jeffbai@aosc.io
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mingcong Bai <jeffbai@aosc.io>

The bo/ttm interfaces with kernel memory mapping from dedicated GPU
memory. It is not correct to assume that SZ_4K would suffice for page
alignment as there are a few hardware platforms that commonly uses non-4K
pages - for instance, currently, Loongson 3A5000/6000 devices (of the
LoongArch architecture) commonly uses 16K kernel pages.

Per my testing Intel Xe/Arc families of GPUs works on at least
Loongson 3A6000 platforms so long as "Above 4G Decoding" and "Resizable
BAR" were enabled in the EFI firmware settings. I tested this patch series
on my Loongson XA61200 (3A6000) motherboard with an Intel Arc A750 GPU.

Without this fix, the kernel will hang at a kernel BUG():

[    7.425445] ------------[ cut here ]------------
[    7.430032] kernel BUG at drivers/gpu/drm/drm_gem.c:181!
[    7.435330] Oops - BUG[#1]:
[    7.438099] CPU: 0 UID: 0 PID: 102 Comm: kworker/0:4 Tainted: G            E      6.13.3-aosc-main-00336-g60829239b300-dirty #3
[    7.449511] Tainted: [E]=UNSIGNED_MODULE
[    7.453402] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
[    7.467144] Workqueue: events work_for_cpu_fn
[    7.471472] pc 9000000001045fa4 ra ffff8000025331dc tp 90000001010c8000 sp 90000001010cb960
[    7.479770] a0 900000012a3e8000 a1 900000010028c000 a2 000000000005d000 a3 0000000000000000
[    7.488069] a4 0000000000000000 a5 0000000000000000 a6 0000000000000000 a7 0000000000000001
[    7.496367] t0 0000000000001000 t1 9000000001045000 t2 0000000000000000 t3 0000000000000000
[    7.504665] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
[    7.504667] t8 0000000000000000 u0 90000000029ea7d8 s9 900000012a3e9360 s0 900000010028c000
[    7.504668] s1 ffff800002744000 s2 0000000000000000 s3 0000000000000000 s4 0000000000000001
[    7.504669] s5 900000012a3e8000 s6 0000000000000001 s7 0000000000022022 s8 0000000000000000
[    7.537855]    ra: ffff8000025331dc ___xe_bo_create_locked+0x158/0x3b0 [xe]
[    7.544893]   ERA: 9000000001045fa4 drm_gem_private_object_init+0xcc/0xd0
[    7.551639]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[    7.557785]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[    7.562111]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[    7.566870]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[    7.571628] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
[    7.577163]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[    7.583128] Modules linked in: xe(E+) drm_gpuvm(E) drm_exec(E) drm_buddy(E) gpu_sched(E) drm_suballoc_helper(E) drm_display_helper(E) loongson(E) r8169(E) cec(E) rc_core(E) realtek(E) i2c_algo_bit(E) tpm_tis_spi(E) led_class(E) hid_generic(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) la_ow_syscall(E) i2c_dev(E)
[    7.613049] Process kworker/0:4 (pid: 102, threadinfo=00000000bc26ebd1, task=0000000055480707)
[    7.621606] Stack : 0000000000000000 3030303a6963702b 000000000005d000 0000000000000000
[    7.629563]         0000000000000001 0000000000000000 0000000000000000 8e1bfae42b2f7877
[    7.637519]         000000000005d000 900000012a3e8000 900000012a3e9360 0000000000000000
[    7.645475]         ffffffffffffffff 0000000000000000 0000000000022022 0000000000000000
[    7.653431]         0000000000000001 ffff800002533660 0000000000022022 9000000000234470
[    7.661386]         90000001010cba28 0000000000001000 0000000000000000 000000000005c300
[    7.669342]         900000012a3e8000 0000000000000000 0000000000000001 900000012a3e8000
[    7.677298]         ffffffffffffffff 0000000000022022 900000012a3e9498 ffff800002533a14
[    7.685254]         0000000000022022 0000000000000000 900000000209c000 90000000010589e0
[    7.693209]         90000001010cbab8 ffff8000027c78c0 fffffffffffff000 900000012a3e8000
[    7.701165]         ...
[    7.703588] Call Trace:
[    7.703590] [<9000000001045fa4>] drm_gem_private_object_init+0xcc/0xd0
[    7.712496] [<ffff8000025331d8>] ___xe_bo_create_locked+0x154/0x3b0 [xe]
[    7.719268] [<ffff80000253365c>] __xe_bo_create_locked+0x228/0x304 [xe]
[    7.725951] [<ffff800002533a10>] xe_bo_create_pin_map_at_aligned+0x70/0x1b0 [xe]
[    7.733410] [<ffff800002533c7c>] xe_managed_bo_create_pin_map+0x34/0xcc [xe]
[    7.740522] [<ffff800002533d58>] xe_managed_bo_create_from_data+0x44/0xb0 [xe]
[    7.747807] [<ffff80000258d19c>] xe_uc_fw_init+0x3ec/0x904 [xe]
[    7.753814] [<ffff80000254a478>] xe_guc_init+0x30/0x3dc [xe]
[    7.759553] [<ffff80000258bc04>] xe_uc_init+0x20/0xf0 [xe]
[    7.765121] [<ffff800002542abc>] xe_gt_init_hwconfig+0x5c/0xd0 [xe]
[    7.771461] [<ffff800002537204>] xe_device_probe+0x240/0x588 [xe]
[    7.777627] [<ffff800002575448>] xe_pci_probe+0x6c0/0xa6c [xe]
[    7.783540] [<9000000000e9828c>] local_pci_probe+0x4c/0xb4
[    7.788989] [<90000000002aa578>] work_for_cpu_fn+0x20/0x40
[    7.794436] [<90000000002aeb50>] process_one_work+0x1a4/0x458
[    7.800143] [<90000000002af5a0>] worker_thread+0x304/0x3fc
[    7.805591] [<90000000002bacac>] kthread+0x114/0x138
[    7.810520] [<9000000000241f64>] ret_from_kernel_thread+0x8/0xa4
[    7.816489]
[    7.817961] Code: 4c000020  29c3e2f9  53ff93ff <002a0001> 0015002c  03400000  02ff8063  29c04077  001500f7
[    7.827651]
[    7.829140] ---[ end trace 0000000000000000 ]---

Revise all instances of `SZ_4K' with `PAGE_SIZE' and revise the call to
`drm_gem_private_object_init()' in `*___xe_bo_create_locked()' (last call
before BUG()) to use `size_t aligned_size' calculated from `PAGE_SIZE' to
fix the above error.

Cc: <stable@vger.kernel.org>
Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Tested-by: Mingcong Bai <jeffbai@aosc.io>
Tested-by: Haien Liang <27873200@qq.com>
Tested-by: Shirong Liu <lsr1024@qq.com>
Tested-by: Haofeng Wu <s2600cw2@126.com>
Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
Co-developed-by: Shang Yatsen <429839446@qq.com>
Signed-off-by: Shang Yatsen <429839446@qq.com>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3f5391d416d469c636d951dd6f0a2b3b5ae95dab..dd03c581441f352eff51d0eafe1298fca7d9653d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1441,9 +1441,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		flags |= XE_BO_FLAG_INTERNAL_64K;
 		alignment = align >> PAGE_SHIFT;
 	} else {
-		aligned_size = ALIGN(size, SZ_4K);
+		aligned_size = ALIGN(size, PAGE_SIZE);
 		flags &= ~XE_BO_FLAG_INTERNAL_64K;
-		alignment = SZ_4K >> PAGE_SHIFT;
+		alignment = PAGE_SIZE >> PAGE_SHIFT;
 	}
 
 	if (type == ttm_bo_type_device && aligned_size != size)
@@ -1457,7 +1457,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	bo->ccs_cleared = false;
 	bo->tile = tile;
-	bo->size = size;
+	bo->size = aligned_size;
 	bo->flags = flags;
 	bo->cpu_caching = cpu_caching;
 	bo->ttm.base.funcs = &xe_gem_object_funcs;
@@ -1468,7 +1468,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 #endif
 	INIT_LIST_HEAD(&bo->vram_userfault_link);
 
-	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
+	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, aligned_size);
 
 	if (resv) {
 		ctx.allow_res_evict = !(flags & XE_BO_FLAG_NO_RESV_EVICT);

-- 
2.48.1


