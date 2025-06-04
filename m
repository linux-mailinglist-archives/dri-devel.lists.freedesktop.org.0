Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E434ACDB15
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 11:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8B310E943;
	Wed,  4 Jun 2025 09:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbHTmM8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BE410E943;
 Wed,  4 Jun 2025 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749029769; x=1780565769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G62oSzEIsaYANagnU13H64wvoR8g8FJ/B6CGPDFABVM=;
 b=KbHTmM8uramKlkZ5P/TL/F8cHZYs374NF4vJmvLlFyiqeHZ07Ubp2ZyH
 SFV3d3pHfTSp4w+OUu8W4Ctipa98dnQ+ljhjEiUi/i3eCqWolql4AryWE
 5SgktgAn7okCUnlKD8nqkLG/CF2KC/NWqJyhDg4Qpul0z4G2d2S0WPYUi
 2QNM6B89UCh97/17SUdylwynXrZkofWdHuUHkL2PSG/R+EbkC+KucDZAa
 vjFuZdJmMUtDqtv/zenIkbse9RGeBPHdg5Nnf9O8VvnhCZBRDzOm0L1BU
 jyfaDySg4t7IAkbXf2dV6a2ROrVxrHweTGUXUUnZK7sSciCfrtsSqTxJs A==;
X-CSE-ConnectionGUID: AtDqe6gmSyKDEsSzWvKFaw==
X-CSE-MsgGUID: Croria62S4OHCw1oRc5rfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50344685"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="50344685"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:36:09 -0700
X-CSE-ConnectionGUID: hETWjSN2SeOhqq+MDSRYSQ==
X-CSE-MsgGUID: DabIJw5oR2CSL04NsyZxQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="176001351"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:36:06 -0700
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
Subject: [PATCH v2 3/3] drm/xe: Implement and use the drm_pagemap populate_mm
 op
Date: Wed,  4 Jun 2025 11:35:36 +0200
Message-ID: <20250604093536.95982-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/drm_pagemap.c |   1 +
 drivers/gpu/drm/xe/xe_svm.c   | 104 ++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_svm.h   |  10 ++--
 drivers/gpu/drm/xe/xe_tile.h  |  11 ++++
 drivers/gpu/drm/xe/xe_vm.c    |   2 +-
 5 files changed, 78 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 25395685a9b8..94619be00d2a 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -843,3 +843,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 	return err;
 }
+EXPORT_SYMBOL(drm_pagemap_populate_mm);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e161ce3e67a1..a10aab3768d8 100644
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
@@ -525,8 +529,10 @@ static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
 static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
+	struct xe_device *xe = xe_bo_device(bo);
 
 	xe_bo_put_async(bo);
+	xe_pm_runtime_put(xe);
 }
 
 static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
@@ -720,76 +726,63 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
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
@@ -898,7 +891,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
-		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		err = xe_svm_alloc_vram(tile, range, &ctx);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
 			if (migrate_try_count || !ctx.devmem_only) {
@@ -1054,6 +1047,30 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
+/**
+ * xe_svm_alloc_vram()- Allocate device memory pages for range,
+ * migrating existing data.
+ * @vm: The VM.
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
@@ -1078,6 +1095,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.device_map = xe_drm_pagemap_device_map,
+	.populate_mm = xe_drm_pagemap_populate_mm,
 };
 
 /**
@@ -1130,7 +1148,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
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
index 7140d8856bad..def493acb4d7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2911,7 +2911,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 
 		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
 			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
-			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
+			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-- 
2.49.0

