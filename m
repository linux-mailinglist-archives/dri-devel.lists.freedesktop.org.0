Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F67AE079B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0CB10EA6B;
	Thu, 19 Jun 2025 13:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7w+1r1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314D610EA69;
 Thu, 19 Jun 2025 13:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750340466; x=1781876466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/xatWmCtw6t7pROi4L8wl4C9MS4v66nMHLvmXiuCeIw=;
 b=e7w+1r1OyaJIKucM0W1DqNGkpb7ofD7FobGXyGDd2KlGtpES8Fv6qoJ7
 9d7ZYD6/AXiO9nSnInRRRZp64+TL/JY3lMgw7Rtpsjkln657NAEY+UdnM
 QQKzOa8xMfNyzHc1aN5i+f1gNkQk/KltamB8Zx/g1YCPg1smHz5EigH/Z
 iI6yyNzkDkS20/CJbf0tDy6toPZTE+B98lgCexhg2i//1kb0jj3sZwzWG
 kyMWBhNKg+CvBWAWka4iH8c3nVBxsndCHFJgJ8rTaubfGIms8KlGw6QQk
 q0prfr5e3MaW2rp39J2Q55Hn6SLIejJdYQteEtVxhWTNgJxoT9wljpEZI w==;
X-CSE-ConnectionGUID: qpg0O5CZRuuHenR1gHta/Q==
X-CSE-MsgGUID: hGoR0W2MT6uNCWvjasiQPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62862146"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="62862146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:41:06 -0700
X-CSE-ConnectionGUID: vDBVbVFYQLyAFLHvKNZy0Q==
X-CSE-MsgGUID: v96w2T+vRbKZwMLvxT+yTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="150247445"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:41:02 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?q?Felix=20K=C3=BChling?= <felix.kuehling@amd.com>,
 "Philip Yang" <philip.yang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 3/3] drm/xe: Implement and use the drm_pagemap populate_mm
 op
Date: Thu, 19 Jun 2025 15:40:35 +0200
Message-ID: <20250619134035.170086-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619134035.170086-1-thomas.hellstrom@linux.intel.com>
References: <20250619134035.170086-1-thomas.hellstrom@linux.intel.com>
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

v3:
- Fix a kerneldoc failure (Matt Brost)
- Revert the bo type change from device to kernel (Matt Brost)
v4:
- Add an assert in xe_svm_alloc_vram (Matt Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c |   1 +
 drivers/gpu/drm/xe/xe_svm.c   | 102 ++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_svm.h   |  10 ++--
 drivers/gpu/drm/xe/xe_tile.h  |  11 ++++
 drivers/gpu/drm/xe/xe_vm.c    |   2 +-
 5 files changed, 77 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 13e1519aa6d6..1da55322af12 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -835,3 +835,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 	return err;
 }
+EXPORT_SYMBOL(drm_pagemap_populate_mm);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a4bb219b2407..a7ff5975873f 100644
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
@@ -491,8 +495,10 @@ static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
 static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
+	struct xe_device *xe = xe_bo_device(bo);
 
 	xe_bo_put_async(bo);
+	xe_pm_runtime_put(xe);
 }
 
 static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
@@ -682,76 +688,63 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 	return &tile->mem.vram;
 }
 
-/**
- * xe_svm_alloc_vram()- Allocate device memory pages for range,
- * migrating existing data.
- * @vm: The VM.
- * @tile: tile to allocate vram from
- * @range: SVM range
- * @ctx: DRM GPU SVM context
- *
- * Return: 0 on success, error code on failure.
- */
-int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-		      struct xe_svm_range *range,
-		      const struct drm_gpusvm_ctx *ctx)
+static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
+				      unsigned long start, unsigned long end,
+				      struct mm_struct *mm,
+				      unsigned long timeslice_ms)
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
-
-	if (!range->base.flags.migrate_devmem)
-		return -EINVAL;
+	ktime_t time_end = 0;
+	int err, idx;
 
-	range_debug(range, "ALLOCATE VRAM");
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
 
-	if (!mmget_not_zero(mm))
-		return -EFAULT;
-	mmap_read_lock(mm);
+	xe_pm_runtime_get(xe);
 
-retry:
-	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
-				 xe_svm_range_size(range),
+ retry:
+	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL, end - start,
 				 ttm_bo_type_device,
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
-					    ctx->timeslice_ms,
-					    xe_svm_devm_owner(vm->xe));
+
+	/* Ensure the device has a pm ref while there are device pages active. */
+	xe_pm_runtime_get_noresume(xe);
+	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
+					    start, end, timeslice_ms,
+					    xe_svm_devm_owner(xe));
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
@@ -859,7 +852,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
-		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		err = xe_svm_alloc_vram(tile, range, &ctx);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
 			if (migrate_try_count || !ctx.devmem_only) {
@@ -1006,6 +999,30 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
+/**
+ * xe_svm_alloc_vram()- Allocate device memory pages for range,
+ * migrating existing data.
+ * @tile: tile to allocate vram from
+ * @range: SVM range
+ * @ctx: DRM GPU SVM context
+ *
+ * Return: 0 on success, error code on failure.
+ */
+int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
+{
+	struct drm_pagemap *dpagemap;
+
+	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
+	range_debug(range, "ALLOCATE VRAM");
+
+	dpagemap = xe_tile_local_pagemap(tile);
+	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
+				       xe_svm_range_end(range),
+				       range->base.gpusvm->mm,
+				       ctx->timeslice_ms);
+}
+
 static struct drm_pagemap_device_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  struct device *dev,
@@ -1030,6 +1047,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.device_map = xe_drm_pagemap_device_map,
+	.populate_mm = xe_drm_pagemap_populate_mm,
 };
 
 /**
@@ -1082,7 +1100,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 	return 0;
 }
 #else
-int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+int xe_svm_alloc_vram(struct xe_tile *tile,
 		      struct xe_svm_range *range,
 		      const struct drm_gpusvm_ctx *ctx)
 {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 19ce4f2754a7..da9a69ea0bb1 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -70,8 +70,7 @@ int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
 
-int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-		      struct xe_svm_range *range,
+int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 		      const struct drm_gpusvm_ctx *ctx);
 
 struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
@@ -237,10 +236,9 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 {
 }
 
-static inline
-int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-		      struct xe_svm_range *range,
-		      const struct drm_gpusvm_ctx *ctx)
+static inline int
+xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
+		  const struct drm_gpusvm_ctx *ctx)
 {
 	return -EOPNOTSUPP;
 }
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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 04d1a43b81e3..f590b1553e98 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2913,7 +2913,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 
 		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
 			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
-			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
+			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-- 
2.49.0

