Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5057CB2C64
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A6910E6E3;
	Wed, 10 Dec 2025 11:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYcKsXLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E0610E6FB;
 Wed, 10 Dec 2025 11:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765364937; x=1796900937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fiRQGatdyVwrtkXBdVWxcw8hnkqy7QXLG1ZdqbOqjmM=;
 b=NYcKsXLuwIHNvmsYAuFxqhV9xgKpYbwbDl/s6/37p39cSu2X0+3Ae0kV
 B3wc14hEToXmkYSeSeDquMZ/EgLEdsQafOIMWiaMcCJdiPSyDYIEnYBwJ
 MidO7dzXKbRR55dMNN4LRqKm8nIfZaiJTwxBGLWuEzmMJ307fPv5G0oa/
 X2yvT9K4tiwRXzDK4EbSFXWLQk6RAjzBKrv+HCanbJmXQ9LHApXL0KOQe
 zY7B65Z4VPEjXfyPbaii01cc+jWxl4vq92qXpsM39LlXNxs8ahx15elln
 OeuxbyrWA2d4tKSIgxDE6qMcYk5aLD05aXLcw4M2+1pIwf0UoKpqNQHVQ Q==;
X-CSE-ConnectionGUID: 71PE9jstSZCmoO16bPVexw==
X-CSE-MsgGUID: WplQAnJbRKycgm2yLkgdqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67221823"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67221823"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:08:57 -0800
X-CSE-ConnectionGUID: A2z2xoF0TO2ITLOw+6rSEQ==
X-CSE-MsgGUID: ion4ugrTR6enLxXNpYFYRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196487140"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:08:54 -0800
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
Subject: [PATCH v3 12/22] drm/xe: Use the vma attibute drm_pagemap to select
 where to migrate
Date: Wed, 10 Dec 2025 12:07:32 +0100
Message-ID: <20251210110742.107575-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
References: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
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

Honor the drm_pagemap vma attribute when migrating SVM pages.
Ensure that when the desired placement is validated as device
memory, that we also check that the requested drm_pagemap is
consistent with the current.

v2:
- Initialize a struct drm_pagemap pointer to NULL that could
  otherwise be dereferenced uninitialized. (CI)
- Remove a redundant assignment (Matt Brost)
- Slightly improved commit message (Matt Brost)
- Extended drm_pagemap validation.

v3:
- Fix a compilation error if CONFIG_DRM_GPUSVM is not enabled.
  (kernel test robot <lkp@intel.com>)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      | 86 ++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_svm.h      | 14 +++---
 drivers/gpu/drm/xe/xe_vm.c       | 24 ++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  6 +--
 4 files changed, 72 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c065b357e8bb..3884aff729e3 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -920,13 +920,34 @@ void xe_svm_fini(struct xe_vm *vm)
 	drm_gpusvm_fini(&vm->svm.gpusvm);
 }
 
+static bool xe_svm_range_has_pagemap_locked(const struct xe_svm_range *range,
+					    const struct drm_pagemap *dpagemap)
+{
+	return range->base.pages.dpagemap == dpagemap;
+}
+
+static bool xe_svm_range_has_pagemap(struct xe_svm_range *range,
+				     const struct drm_pagemap *dpagemap)
+{
+	struct xe_vm *vm = range_to_vm(&range->base);
+	bool ret;
+
+	xe_svm_notifier_lock(vm);
+	ret = xe_svm_range_has_pagemap_locked(range, dpagemap);
+	xe_svm_notifier_unlock(vm);
+
+	return ret;
+}
+
 static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 				  struct xe_tile *tile,
-				  bool devmem_only)
+				  bool devmem_only,
+				  const struct drm_pagemap *dpagemap)
+
 {
 	return (xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
 					    range->tile_invalidated) &&
-		(!devmem_only || xe_svm_range_in_vram(range)));
+		(!devmem_only || xe_svm_range_has_pagemap(range, dpagemap)));
 }
 
 /** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
@@ -947,7 +968,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
  * @vm: xe_vm pointer
  * @range: Pointer to the SVM range structure
  * @tile_mask: Mask representing the tiles to be checked
- * @devmem_preferred : if true range needs to be in devmem
+ * @dpagemap: if !%NULL, the range is expected to be present
+ * in device memory identified by this parameter.
  *
  * The xe_svm_range_validate() function checks if a range is
  * valid and located in the desired memory region.
@@ -956,14 +978,15 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
  */
 bool xe_svm_range_validate(struct xe_vm *vm,
 			   struct xe_svm_range *range,
-			   u8 tile_mask, bool devmem_preferred)
+			   u8 tile_mask, const struct drm_pagemap *dpagemap)
 {
 	bool ret;
 
 	xe_svm_notifier_lock(vm);
 
-	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
-	       (devmem_preferred == range->base.pages.flags.has_devmem_pages);
+	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask;
+	if (dpagemap)
+		ret = ret && xe_svm_range_has_pagemap_locked(range, dpagemap);
 
 	xe_svm_notifier_unlock(vm);
 
@@ -1077,22 +1100,22 @@ static bool supports_4K_migration(struct xe_device *xe)
  * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
  * @range: SVM range for which migration needs to be decided
  * @vma: vma which has range
- * @preferred_region_is_vram: preferred region for range is vram
+ * @dpagemap: The preferred struct drm_pagemap to migrate to.
  *
  * Return: True for range needing migration and migration is supported else false
  */
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
-					bool preferred_region_is_vram)
+					const struct drm_pagemap *dpagemap)
 {
 	struct xe_vm *vm = range_to_vm(&range->base);
 	u64 range_size = xe_svm_range_size(range);
 
-	if (!range->base.pages.flags.migrate_devmem || !preferred_region_is_vram)
+	if (!range->base.pages.flags.migrate_devmem || !dpagemap)
 		return false;
 
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
 
-	if (xe_svm_range_in_vram(range)) {
+	if (xe_svm_range_has_pagemap(range, dpagemap)) {
 		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
 		return false;
 	}
@@ -1189,9 +1212,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
@@ -1204,7 +1227,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		goto out;
 	}
 
-	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
+	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
 		xe_svm_range_valid_fault_count_stats_incr(gt, range);
 		range_debug(range, "PAGE FAULT - VALID");
 		goto out;
@@ -1213,16 +1236,11 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	range_debug(range, "PAGE FAULT");
 
 	if (--migrate_try_count >= 0 &&
-	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
+	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
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
@@ -1539,7 +1557,13 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
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
@@ -1547,28 +1571,24 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
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
@@ -1838,9 +1858,9 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
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
index 5adce108f7eb..a003f571c82a 100644
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
@@ -104,13 +104,13 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 			   struct drm_gpusvm_ctx *ctx);
 
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
-					bool preferred_region_is_vram);
+					const struct drm_pagemap *dpagemap);
 
 void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
 
 bool xe_svm_range_validate(struct xe_vm *vm,
 			   struct xe_svm_range *range,
-			   u8 tile_mask, bool devmem_preferred);
+			   u8 tile_mask, const struct drm_pagemap *dpagemap);
 
 u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
 
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
@@ -318,7 +318,7 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
 
 static inline
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
-					u32 region)
+					const struct drm_pagemap *dpagemap)
 {
 	return false;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b1e708a1b236..ae2c1d500d54 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2339,7 +2339,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			struct xe_tile *tile;
 			struct xe_svm_range *svm_range;
 			struct drm_gpusvm_ctx ctx = {};
-			struct drm_pagemap *dpagemap;
+			struct drm_pagemap *dpagemap = NULL;
 			u8 id, tile_mask = 0;
 			u32 i;
 
@@ -2357,23 +2357,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
 			op->prefetch_range.ranges_count = 0;
-			tile = NULL;
 
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
 
@@ -2392,7 +2386,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				goto unwind_prefetch_ops;
 			}
 
-			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!tile)) {
+			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
 				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				goto check_next_range;
 			}
@@ -2914,7 +2908,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
-	struct xe_tile *tile = op->prefetch_range.tile;
+	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
 	int err = 0;
 
 	struct xe_svm_range *svm_range;
@@ -2927,15 +2921,15 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
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
+		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
+			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 0eaaebb42d9a..84976c793506 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -408,10 +408,10 @@ struct xe_vma_op_prefetch_range {
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
2.51.1

