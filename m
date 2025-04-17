Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7641AA919CA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A4E10EAA5;
	Thu, 17 Apr 2025 10:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1lJsVbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E8C10EAAF;
 Thu, 17 Apr 2025 10:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744887107; x=1776423107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DULzl20VbMKXtBBpzkfJise1OGn8egMfg77jnheWWRc=;
 b=k1lJsVboYR+rmj2LNGkB5JIzaOJtCe9IYSy+sFroufNO+pYg8d8As7d+
 2pTe3d1BDZg2H9NXNIyP5RPgsnnplYS3axS5liCBJsxFhVGRI/i5puyS/
 ahmEOO7YM//c6rE5wO4ZagqvM64lJHS2YSP3KEi2MW5obtsBLkH9EhvvE
 aUkDIVmkvnh2cCJngEN8Z3xrigClrKygyCaEcxjtuTjNyS5qC1lYYybJk
 kcqZmfGil5yf5L5PUu1YB4w1jkea83Haetx9jGfDQChITuTsiSvdi48Ub
 T/ocO4EldjrqgWJoG3YHLKlPvhaAQMV0+4sec7kJ49n+GncKjGfcyEvdw w==;
X-CSE-ConnectionGUID: 4XedSWFjRS+WvChvy9017g==
X-CSE-MsgGUID: TTFmul+FQ7a9iFdZiy8WoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68959794"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="68959794"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:51:47 -0700
X-CSE-ConnectionGUID: ZxWbpQrtRua/FeKVVTCflw==
X-CSE-MsgGUID: Xq1TWOEWS2WFLze0XQnuAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="130729678"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:51:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 3/3] drm/xe: Implement and use the drm_pagemap populate_mm op
Date: Thu, 17 Apr 2025 12:51:13 +0200
Message-ID: <20250417105113.48831-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417105113.48831-1-thomas.hellstrom@linux.intel.com>
References: <20250417105113.48831-1-thomas.hellstrom@linux.intel.com>
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

Add runtime PM since we might call populate_mm on a foreign device.
Also create the VRAM bos as ttm_bo_type_kernel. This avoids the
initial clearing and the creation of an mmap handle.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c |  4 +-
 drivers/gpu/drm/xe/xe_svm.c   | 80 ++++++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_tile.h  | 11 +++++
 3 files changed, 55 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 27e3f90cf49a..99394c7d1d66 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -276,7 +276,8 @@ npages_in_range(unsigned long start, unsigned long end)
  * The caller should hold a reference to the device memory allocation,
  * and the reference is consumed by this function unless it returns with
  * an error.
- * @mm: Pointer to the struct mm_struct.
+ * @mm: Pointer to the struct mm_struct. This pointer should hold a reference to
+ * the mm, and the mm should be locked on entry.
  * @start: Start of the virtual address range to migrate.
  * @end: End of the virtual address range to migrate.
  * @pgmap_owner: Not used currently, since only system memory is considered.
@@ -814,3 +815,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 	return err;
 }
+EXPORT_SYMBOL(drm_pagemap_populate_mm);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 185c726d6824..bd867a23c9ab 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,13 +3,17 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include <drm/drm_drv.h>
+
 #include "xe_bo.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_module.h"
+#include "xe_pm.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
+#include "xe_tile.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
@@ -536,8 +540,10 @@ static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
 static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
+	struct xe_device *xe = xe_bo_device(bo);
 
 	xe_bo_put_async(bo);
+	xe_pm_runtime_put(xe);
 }
 
 static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
@@ -661,77 +667,66 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 	return &tile->mem.vram;
 }
 
-static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-			     struct xe_svm_range *range,
-			     const struct drm_gpusvm_ctx *ctx)
+static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
+				      unsigned long start, unsigned long end,
+				      struct mm_struct *mm)
 {
-	struct mm_struct *mm = vm->svm.gpusvm.mm;
+	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct device *dev = xe->drm.dev;
 	struct xe_vram_region *vr = tile_to_vr(tile);
 	struct drm_buddy_block *block;
 	struct list_head *blocks;
 	struct xe_bo *bo;
-	ktime_t end = 0;
-	int err;
+	ktime_t time_end = 0;
+	int err, idx;
 
-	if (!range->base.flags.migrate_devmem)
-		return -EINVAL;
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
 
-	range_debug(range, "ALLOCATE VRAM");
+	xe_pm_runtime_get(xe);
 
-	if (!mmget_not_zero(mm))
-		return -EFAULT;
-	mmap_read_lock(mm);
-
-retry:
-	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
-				 xe_svm_range_size(range),
-				 ttm_bo_type_device,
+ retry:
+	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL, end - start,
+				 ttm_bo_type_kernel,
 				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				 XE_BO_FLAG_CPU_ADDR_MIRROR);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
-		if (xe_vm_validate_should_retry(NULL, err, &end))
+		if (xe_vm_validate_should_retry(NULL, err, &time_end))
 			goto retry;
-		goto unlock;
+		goto out_pm_put;
 	}
 
-	drm_pagemap_devmem_init(&bo->devmem_allocation,
-				vm->xe->drm.dev, mm,
+	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
 				&dpagemap_devmem_ops,
 				&tile->mem.vram.dpagemap,
-				xe_svm_range_size(range));
+				end - start);
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
 	list_for_each_entry(block, blocks, link)
 		block->private = vr;
 
 	xe_bo_get(bo);
-	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation,
-					    mm,
-					    xe_svm_range_start(range),
-					    xe_svm_range_end(range),
-					    xe_svm_devm_owner(vm->xe));
+
+	/* Ensure the device has a pm ref while there are device pages active. */
+	xe_pm_runtime_get_noresume(xe);
+	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
+					    start, end, xe_svm_devm_owner(xe));
 	if (err)
 		xe_svm_devmem_release(&bo->devmem_allocation);
 
 	xe_bo_unlock(bo);
 	xe_bo_put(bo);
 
-unlock:
-	mmap_read_unlock(mm);
-	mmput(mm);
+out_pm_put:
+	xe_pm_runtime_put(xe);
+	drm_dev_exit(idx);
 
 	return err;
 }
-#else
-static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-			     struct xe_svm_range *range,
-			     const struct drm_gpusvm_ctx *ctx)
-{
-	return -EOPNOTSUPP;
-}
-#endif
 
+#endif
 
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
@@ -791,9 +786,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	/* XXX: Add migration policy, for now migrate range once */
 	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
 	    xe_svm_range_size(range) >= SZ_64K) {
+		struct drm_pagemap *dpagemap;
+
 		range->skip_migrate = true;
 
-		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		range_debug(range, "ALLOCATE VRAM");
+		dpagemap = xe_tile_local_pagemap(tile);
+		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
+					      xe_svm_range_end(range),
+					      range->base.gpusvm->mm);
 		if (err) {
 			drm_dbg(&vm->xe->drm,
 				"VRAM allocation failed, falling back to "
@@ -915,6 +916,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.device_map = xe_drm_pagemap_device_map,
+	.populate_mm = xe_drm_pagemap_populate_mm,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index eb939316d55b..066a3d0cea79 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -16,4 +16,15 @@ int xe_tile_init(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
+{
+	return &tile->mem.vram.dpagemap;
+}
+#else
+static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
+{
+	return NULL;
+}
+#endif
 #endif
-- 
2.49.0

