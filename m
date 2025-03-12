Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4622A5E619
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4694510E7AE;
	Wed, 12 Mar 2025 21:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqPaq87+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6656C10E7AE;
 Wed, 12 Mar 2025 21:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813531; x=1773349531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q19zeRvTjI8WRNaqh8HKq2VUmvFQM4Qmx7ZlY+LvZqc=;
 b=FqPaq87+rZ2X2HsoXs//smMB2wECkTA6/j6y+pa1Nj+96Yki1LxOjD/O
 uD2EvnYgYnXpdSCPNFjTw54qXOEoaq21XkHwCO8RpTtw8DlmgiKSjIYzH
 f1eIQwHyG8szHqOUL+/jPecjjeJqmMqT7u1PqFPAWMUgUbS8Ew0LCTOts
 4zFc4wYATzwY1oMz7A+k7GYQ/0ZBsyIoj+9Ns89SzAHbKxff/v+HcKHQ9
 9BsBrYHxECKNJLCJ/gI37F2vw+ZBmMfGdtJBhVBs4OntvApoQUXTw9e33
 qb6qYMsJuPdDQGPDQQ8dlZWbnnFFkeIKsUjRCNgUnXft2aoLa9MRh5u03 w==;
X-CSE-ConnectionGUID: VvmM22+0Qeqpkp38Ud0RZA==
X-CSE-MsgGUID: GNVz+ZHXQpqq9UkwMHetnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562231"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:31 -0700
X-CSE-ConnectionGUID: S8DAZ/bQSae9sitMt1gN9A==
X-CSE-MsgGUID: GNnj603oQCGgnG+D3snGoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791188"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 12/19] drm/xe: Make the PT code handle placement per PTE
 rather than per vma / range
Date: Wed, 12 Mar 2025 22:04:09 +0100
Message-ID: <20250312210416.3120-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

With SVM, ranges forwarded to the PT code for binding can, mostly
due to races when migrating, point to both VRAM and system / foreign
device memory. Make the PT code able to handle that by checking,
for each PTE set up, whether it points to local VRAM or to system
memory.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c |  12 +++--
 drivers/gpu/drm/xe/xe_pt.c | 106 ++++++++++++++++---------------------
 2 files changed, 56 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 390f90fbd366..bec788bce95c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2091,10 +2091,16 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 
-	if (res->mem_type == XE_PL_STOLEN)
+	switch (res->mem_type) {
+	case XE_PL_STOLEN:
 		return xe_ttm_stolen_gpu_offset(xe);
-
-	return res_to_mem_region(res)->dpa_base;
+	case XE_PL_TT:
+	case XE_PL_SYSTEM:
+		return 0;
+	default:
+		return res_to_mem_region(res)->dpa_base;
+	}
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 9e719535a3bb..d14b1a28474a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -278,13 +278,15 @@ struct xe_pt_stage_bind_walk {
 	struct xe_vm *vm;
 	/** @tile: The tile we're building for. */
 	struct xe_tile *tile;
-	/** @default_pte: PTE flag only template. No address is associated */
-	u64 default_pte;
+	/** @default_pte: PTE flag only template for VRAM. No address is associated */
+	u64 default_vram_pte;
+	/** @default_pte: PTE flag only template for VRAM. No address is associated */
+	u64 default_system_pte;
 	/** @dma_offset: DMA offset to add to the PTE. */
 	u64 dma_offset;
 	/**
 	 * @needs_64k: This address range enforces 64K alignment and
-	 * granularity.
+	 * granularity on VRAM.
 	 */
 	bool needs_64K;
 	/**
@@ -515,13 +517,16 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
 		struct xe_res_cursor *curs = xe_walk->curs;
 		bool is_null = xe_vma_is_null(xe_walk->vma);
+		bool is_vram = xe_res_is_vram(curs);
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
 		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
 						 xe_res_dma(curs) + xe_walk->dma_offset,
 						 xe_walk->vma, pat_index, level);
-		pte |= xe_walk->default_pte;
+		if (!is_null)
+			pte |= is_vram ? xe_walk->default_vram_pte :
+				xe_walk->default_system_pte;
 
 		/*
 		 * Set the XE_PTE_PS64 hint if possible, otherwise if
@@ -531,7 +536,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
 				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
 				pte |= XE_PTE_PS64;
-			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
+			} else if (XE_WARN_ON(xe_walk->needs_64K && is_vram)) {
 				return -EINVAL;
 			}
 		}
@@ -603,6 +608,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
 	.pt_entry = xe_pt_stage_bind_entry,
 };
 
+/* The GPU can always to atomics in VRAM */
+static bool xe_atomic_for_vram(struct xe_vm *vm)
+{
+	return true;
+}
+
+/*
+ * iGFX always expect to be able to do atomics in system.
+ *
+ * For DGFX, 3D clients want to do atomics in system that is
+ * not coherent with CPU atomics. Compute clients want
+ * atomics that look coherent with CPU atomics. We
+ * distinguish the two by checking for lr mode. For
+ * compute we then disallow atomics in system.
+ * Compute attempts to perform atomics in system memory would
+ * then cause an unrecoverable page-fault in preempt-fence
+ * mode, but in fault mode the data would be migrated to VRAM
+ * for GPU atomics and to system for CPU atomics.
+ */
+static bool xe_atomic_for_system(struct xe_vm *vm)
+{
+	return (!IS_DGFX(vm->xe) || !xe_vm_in_lr_mode(vm)) &&
+		!vm->xe->info.has_device_atomics_on_smem;
+}
+
 /**
  * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
  * range.
@@ -629,9 +659,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *bo = xe_vma_bo(vma);
-	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
-		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
 	struct xe_res_cursor curs;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_pt_stage_bind_walk xe_walk = {
 		.base = {
 			.ops = &xe_pt_stage_bind_ops,
@@ -639,7 +668,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 			.staging = true,
 		},
-		.vm = xe_vma_vm(vma),
+		.vm = vm,
 		.tile = tile,
 		.curs = &curs,
 		.va_curs_start = range ? range->base.itree.start :
@@ -647,26 +676,22 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.vma = vma,
 		.wupd.entries = entries,
 	};
-	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
+	struct xe_pt *pt = vm->pt_root[tile->id];
 	int ret;
 
 	if (range) {
 		/* Move this entire thing to xe_svm.c? */
-		xe_svm_notifier_lock(xe_vma_vm(vma));
+		xe_svm_notifier_lock(vm);
 		if (!xe_svm_range_pages_valid(range)) {
 			xe_svm_range_debug(range, "BIND PREPARE - RETRY");
-			xe_svm_notifier_unlock(xe_vma_vm(vma));
+			xe_svm_notifier_unlock(vm);
 			return -EAGAIN;
 		}
 		if (xe_svm_range_has_dma_mapping(range)) {
 			xe_res_first_dma(range->base.dma_addr, 0,
 					 range->base.itree.last + 1 - range->base.itree.start,
 					 &curs);
-			is_devmem = xe_res_is_vram(&curs);
-			if (is_devmem)
-				xe_svm_range_debug(range, "BIND PREPARE - DMA VRAM");
-			else
-				xe_svm_range_debug(range, "BIND PREPARE - DMA");
+			xe_svm_range_debug(range, "BIND PREPARE - MIXED");
 		} else {
 			xe_assert(xe, false);
 		}
@@ -674,54 +699,17 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		 * Note, when unlocking the resource cursor dma addresses may become
 		 * stale, but the bind will be aborted anyway at commit time.
 		 */
-		xe_svm_notifier_unlock(xe_vma_vm(vma));
+		xe_svm_notifier_unlock(vm);
 	}
 
-	xe_walk.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem;
-
-	/**
-	 * Default atomic expectations for different allocation scenarios are as follows:
-	 *
-	 * 1. Traditional API: When the VM is not in LR mode:
-	 *    - Device atomics are expected to function with all allocations.
-	 *
-	 * 2. Compute/SVM API: When the VM is in LR mode:
-	 *    - Device atomics are the default behavior when the bo is placed in a single region.
-	 *    - In all other cases device atomics will be disabled with AE=0 until an application
-	 *      request differently using a ioctl like madvise.
-	 */
+	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
 	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
-		if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
-			if (bo && xe_bo_has_single_placement(bo))
-				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
-			/**
-			 * If a SMEM+LMEM allocation is backed by SMEM, a device
-			 * atomics will cause a gpu page fault and which then
-			 * gets migrated to LMEM, bind such allocations with
-			 * device atomics enabled.
-			 */
-			else if (is_devmem)
-				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
-		} else {
-			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
-		}
-
-		/**
-		 * Unset AE if the platform(PVC) doesn't support it on an
-		 * allocation
-		 */
-		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
-			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
+		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
+		xe_walk.default_system_pte = xe_atomic_for_system(vm) ? XE_USM_PPGTT_PTE_AE : 0;
 	}
 
-	if (is_devmem) {
-		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
-		xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
-	}
-
-	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
-		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
-
+	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
+	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
 	if (!range)
 		xe_bo_assert_held(bo);
 
-- 
2.48.1

