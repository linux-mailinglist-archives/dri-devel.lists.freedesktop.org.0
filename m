Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F40C08FE7
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2BF10E27B;
	Sat, 25 Oct 2025 12:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksxC8vLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA8A10E27B;
 Sat, 25 Oct 2025 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393906; x=1792929906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zAamFt9v7UyQFVG1OhnwmLhMTQzzoWgkYH2W2rTO1o4=;
 b=ksxC8vLhgFhEzx5K1zwaRE8v5BVazDSlTeik8disPydcMPKBOD7Ge/59
 wpoQuXBIwQ73FPm/Qtz5y8qj0pDl10zXp7Mo03OoSEGkoFx0GPAWcFdeN
 csF/xs7iWhS7UmuqXtgLzb4UY5+CO8azKewkM7FG1aKLduAgJtPdAvCeS
 7JoAtZ9RwqfvM1jUFSzAbLWD8ikYXaTozN7mArZqcTWTrMJP920IdVB5Z
 nXZ6K7qB+cov/7sfJxuJSV4VEg+NvP6/2LE7MvwuEaob6l/qd1OcJdVAs
 c/dVlMJxgaWpt8NSVOViF8DyB06btOD6PIACg6zm82sXUtfVzjUPZUkC4 w==;
X-CSE-ConnectionGUID: GCvnJeMhTJuzC3OYj78jNQ==
X-CSE-MsgGUID: WHhdeT2ISHqmVaVPhAIBbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590385"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:06 -0700
X-CSE-ConnectionGUID: jTH9iSeZRyumZdzy9FnCfA==
X-CSE-MsgGUID: f3/adEnfSyCKFort5qKHoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023783"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 10/15] drm/xe: Use the vma attibute drm_pagemap to select
 where to migrate
Date: Sat, 25 Oct 2025 14:04:07 +0200
Message-ID: <20251025120412.12262-11-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
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

Enable migrating to foreign drm_pagemaps.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      | 39 +++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_svm.h      |  8 +++----
 drivers/gpu/drm/xe/xe_vm.c       | 19 ++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h |  6 ++---
 4 files changed, 32 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d27cedeaf70c..36a6ac293e71 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1132,9 +1132,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	dpagemap = xe_vma_resolve_pagemap(vma, tile);
-	ctx.device_private_page_owner =
-		xe_svm_private_page_owner(vm, !dpagemap && !ctx.devmem_only);
+	dpagemap = ctx.devmem_only ? xe_tile_local_pagemap(tile) :
+		xe_vma_resolve_pagemap(vma, tile);
+	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
 	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
 
 	if (IS_ERR(range))
@@ -1159,13 +1159,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
 		ktime_t migrate_start = xe_svm_stats_ktime_get();
 
-		/* TODO : For multi-device dpagemap will be used to find the
-		 * remote tile and remote device. Will need to modify
-		 * xe_svm_alloc_vram to use dpagemap for future multi-device
-		 * support.
-		 */
 		xe_svm_range_migrate_count_stats_incr(gt, range);
-		err = xe_svm_alloc_vram(tile, range, &ctx);
+		err = xe_svm_alloc_vram(range, &ctx, dpagemap);
 		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
@@ -1482,7 +1477,13 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
  */
 struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
 {
-	s32 fd = (s32)vma->attr.preferred_loc.devmem_fd;
+	struct drm_pagemap *dpagemap = vma->attr.preferred_loc.dpagemap;
+	s32 fd;
+
+	if (dpagemap)
+		return dpagemap;
+
+	fd = (s32)vma->attr.preferred_loc.devmem_fd;
 
 	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
 		return NULL;
@@ -1490,28 +1491,24 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
 		return IS_DGFX(tile_to_xe(tile)) ? xe_tile_local_pagemap(tile) : NULL;
 
-	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
 	return NULL;
 }
 
 /**
  * xe_svm_alloc_vram()- Allocate device memory pages for range,
  * migrating existing data.
- * @tile: tile to allocate vram from
  * @range: SVM range
  * @ctx: DRM GPU SVM context
+ * @dpagemap: The struct drm_pagemap representing the memory to allocate.
  *
  * Return: 0 on success, error code on failure.
  */
-int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
-		      const struct drm_gpusvm_ctx *ctx)
+int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
+		      struct drm_pagemap *dpagemap)
 {
-	struct drm_pagemap *dpagemap;
-
-	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
+	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
-	dpagemap = xe_tile_local_pagemap(tile);
 	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 				       xe_svm_range_end(range),
 				       range->base.gpusvm->mm,
@@ -1778,9 +1775,9 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
 	return 0;
 }
 
-int xe_svm_alloc_vram(struct xe_tile *tile,
-		      struct xe_svm_range *range,
-		      const struct drm_gpusvm_ctx *ctx)
+int xe_svm_alloc_vram(struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx,
+		      struct drm_pagemap *dpagemap)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 5adce108f7eb..c7027facf6e9 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -94,8 +94,8 @@ int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
 
-int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
-		      const struct drm_gpusvm_ctx *ctx);
+int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
+		      struct drm_pagemap *dpagemap);
 
 struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
 						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);
@@ -276,8 +276,8 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 }
 
 static inline int
-xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
-		  const struct drm_gpusvm_ctx *ctx)
+xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
+		  struct drm_pagemap *dpagemap)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3c3dc1b1ace9..381d4b4abac9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2355,18 +2355,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
 				dpagemap = xe_vma_resolve_pagemap(vma,
 								  xe_device_get_root_tile(vm->xe));
-				/*
-				 * TODO: Once multigpu support is enabled will need
-				 * something to dereference tile from dpagemap.
-				 */
-				if (dpagemap)
-					tile = xe_device_get_root_tile(vm->xe);
 			} else if (prefetch_region) {
 				tile = &vm->xe->tiles[region_to_mem_type[prefetch_region] -
 						      XE_PL_VRAM0];
+				dpagemap = xe_tile_local_pagemap(tile);
 			}
 
-			op->prefetch_range.tile = tile;
+			op->prefetch_range.dpagemap = dpagemap;
 alloc_next_range:
 			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
 
@@ -2897,7 +2892,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
-	struct xe_tile *tile = op->prefetch_range.tile;
+	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
 	int err = 0;
 
 	struct xe_svm_range *svm_range;
@@ -2910,15 +2905,15 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
-	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !tile);
+	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		if (!tile)
+		if (!dpagemap)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
-			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
+		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!dpagemap)) {
+			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 70856d536047..5313bf2afa54 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -413,10 +413,10 @@ struct xe_vma_op_prefetch_range {
 	/** @ranges_count: number of svm ranges to map */
 	u32 ranges_count;
 	/**
-	 * @tile: Pointer to the tile structure containing memory to prefetch.
-	 *        NULL if prefetch requested region is smem
+	 * @dpagemap: Pointer to the dpagemap structure containing memory to prefetch.
+	 * NULL if prefetch requested region is smem
 	 */
-	struct xe_tile *tile;
+	struct drm_pagemap *dpagemap;
 };
 
 /** enum xe_vma_op_flags - flags for VMA operation */
-- 
2.51.0

