Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BBDB2AC93
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D05810E48F;
	Mon, 18 Aug 2025 15:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvzBvx9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8721F10E48A;
 Mon, 18 Aug 2025 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755530529; x=1787066529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=posiiQhjAzEdnhroly8ylP2HlS6kItm+m9al7p0r39o=;
 b=mvzBvx9o0+q47C6lepz1xo1eRSnyX1STkSkzOKOWIp9Y7yQExygic2m/
 ZwH+//AcmdYzKDrG0NhgMP16svDtSKGNRrTjRMZwxIw9FeJR+4UReXmxd
 SbG6wtBCnwEYMeFZmneQw+I8IHjpaXm5N4auAWhx+RLCDGqDCDgqzkTf/
 BtgMDbBtY+nmhNWTGH2+vUb5ViEPRbJbzZmwtVLQzUufWf9gtk8VUYnkf
 nviv8QSYob4fwbH6VsOKB4Ltv/lbaJF96Ym9q4PabBa6sclg39eE2Dgcd
 LpbF4kVq7NbRwJ0yHXIA+5hpmX9VxHsR+VUKkLpquw39HNyDJv10QJIbi Q==;
X-CSE-ConnectionGUID: +/WVeBDGSB+QO5bCSMrBFg==
X-CSE-MsgGUID: fUnMLpO1S5SQRUWXyMh71Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69205846"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="69205846"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:09 -0700
X-CSE-ConnectionGUID: sxlThRmIRCmW0hhqiakRtA==
X-CSE-MsgGUID: tdJZt1BNQ3eT5cDpbhXP4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171837228"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v5 3/8] drm/gpusvm: pull out drm_gpusvm_pages substructure
Date: Mon, 18 Aug 2025 16:21:56 +0100
Message-ID: <20250818152152.67815-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818152152.67815-10-matthew.auld@intel.com>
References: <20250818152152.67815-10-matthew.auld@intel.com>
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

Pull the pages stuff from the svm range into its own substructure, with
the idea of having the main pages related routines, like get_pages(),
unmap_pages() and free_pages() all operating on some lower level
structures, which can then be re-used for stuff like userptr.

v2:
  - Move seq into pages struct (Matt B)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 69 +++++++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_pt.c   |  2 +-
 drivers/gpu/drm/xe/xe_svm.c  | 16 ++++-----
 drivers/gpu/drm/xe/xe_svm.h  |  6 ++--
 include/drm/drm_gpusvm.h     | 48 ++++++++++++++++---------
 5 files changed, 81 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index a6cb44e3f33e..0c11e61e9cf3 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -702,8 +702,8 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
 	range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
 	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
 	INIT_LIST_HEAD(&range->entry);
-	range->notifier_seq = LONG_MAX;
-	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
+	range->pages.notifier_seq = LONG_MAX;
+	range->pages.flags.migrate_devmem = migrate_devmem ? 1 : 0;
 
 	return range;
 }
@@ -1065,19 +1065,20 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 					   struct drm_gpusvm_range *range,
 					   unsigned long npages)
 {
-	unsigned long i, j;
-	struct drm_pagemap *dpagemap = range->dpagemap;
+	struct drm_gpusvm_pages *svm_pages = &range->pages;
+	struct drm_pagemap *dpagemap = svm_pages->dpagemap;
 	struct device *dev = gpusvm->drm->dev;
+	unsigned long i, j;
 
 	lockdep_assert_held(&gpusvm->notifier_lock);
 
-	if (range->flags.has_dma_mapping) {
-		struct drm_gpusvm_range_flags flags = {
-			.__flags = range->flags.__flags,
+	if (svm_pages->flags.has_dma_mapping) {
+		struct drm_gpusvm_pages_flags flags = {
+			.__flags = svm_pages->flags.__flags,
 		};
 
 		for (i = 0, j = 0; i < npages; j++) {
-			struct drm_pagemap_addr *addr = &range->dma_addr[j];
+			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
 
 			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
 				dma_unmap_page(dev,
@@ -1093,9 +1094,9 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
 		flags.has_devmem_pages = false;
 		flags.has_dma_mapping = false;
-		WRITE_ONCE(range->flags.__flags, flags.__flags);
+		WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
 
-		range->dpagemap = NULL;
+		svm_pages->dpagemap = NULL;
 	}
 }
 
@@ -1109,11 +1110,13 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
 					struct drm_gpusvm_range *range)
 {
+	struct drm_gpusvm_pages *svm_pages = &range->pages;
+
 	lockdep_assert_held(&gpusvm->notifier_lock);
 
-	if (range->dma_addr) {
-		kvfree(range->dma_addr);
-		range->dma_addr = NULL;
+	if (svm_pages->dma_addr) {
+		kvfree(svm_pages->dma_addr);
+		svm_pages->dma_addr = NULL;
 	}
 }
 
@@ -1224,9 +1227,11 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
 bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
 				  struct drm_gpusvm_range *range)
 {
+	struct drm_gpusvm_pages *svm_pages = &range->pages;
+
 	lockdep_assert_held(&gpusvm->notifier_lock);
 
-	return range->flags.has_devmem_pages || range->flags.has_dma_mapping;
+	return svm_pages->flags.has_devmem_pages || svm_pages->flags.has_dma_mapping;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
 
@@ -1244,9 +1249,10 @@ static bool
 drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
 				      struct drm_gpusvm_range *range)
 {
+	struct drm_gpusvm_pages *svm_pages = &range->pages;
 	bool pages_valid;
 
-	if (!range->dma_addr)
+	if (!svm_pages->dma_addr)
 		return false;
 
 	drm_gpusvm_notifier_lock(gpusvm);
@@ -1273,6 +1279,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			       struct drm_gpusvm_range *range,
 			       const struct drm_gpusvm_ctx *ctx)
 {
+	struct drm_gpusvm_pages *svm_pages = &range->pages;
 	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
 	struct hmm_range hmm_range = {
 		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
@@ -1295,7 +1302,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	int err = 0;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
-	struct drm_gpusvm_range_flags flags;
+	struct drm_gpusvm_pages_flags flags;
 	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
 							   DMA_BIDIRECTIONAL;
 
@@ -1341,7 +1348,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	 */
 	drm_gpusvm_notifier_lock(gpusvm);
 
-	flags.__flags = range->flags.__flags;
+	flags.__flags = svm_pages->flags.__flags;
 	if (flags.unmapped) {
 		drm_gpusvm_notifier_unlock(gpusvm);
 		err = -EFAULT;
@@ -1354,13 +1361,12 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		goto retry;
 	}
 
-	if (!range->dma_addr) {
+	if (!svm_pages->dma_addr) {
 		/* Unlock and restart mapping to allocate memory. */
 		drm_gpusvm_notifier_unlock(gpusvm);
-		range->dma_addr = kvmalloc_array(npages,
-						 sizeof(*range->dma_addr),
-						 GFP_KERNEL);
-		if (!range->dma_addr) {
+		svm_pages->dma_addr =
+			kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
+		if (!svm_pages->dma_addr) {
 			err = -ENOMEM;
 			goto err_free;
 		}
@@ -1399,13 +1405,13 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 					goto err_unmap;
 				}
 			}
-			range->dma_addr[j] =
+			svm_pages->dma_addr[j] =
 				dpagemap->ops->device_map(dpagemap,
 							  gpusvm->drm->dev,
 							  page, order,
 							  dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev,
-					      range->dma_addr[j].addr)) {
+					      svm_pages->dma_addr[j].addr)) {
 				err = -EFAULT;
 				goto err_unmap;
 			}
@@ -1431,7 +1437,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				goto err_unmap;
 			}
 
-			range->dma_addr[j] = drm_pagemap_addr_encode
+			svm_pages->dma_addr[j] = drm_pagemap_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
 				 dma_dir);
 		}
@@ -1442,16 +1448,16 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 
 	if (pagemap) {
 		flags.has_devmem_pages = true;
-		range->dpagemap = dpagemap;
+		svm_pages->dpagemap = dpagemap;
 	}
 
 	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
-	WRITE_ONCE(range->flags.__flags, flags.__flags);
+	WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
 
 	drm_gpusvm_notifier_unlock(gpusvm);
 	kvfree(pfns);
 set_seqno:
-	range->notifier_seq = hmm_range.notifier_seq;
+	svm_pages->notifier_seq = hmm_range.notifier_seq;
 
 	return 0;
 
@@ -1499,8 +1505,7 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
 
 /**
- * drm_gpusvm_range_evict() - Evict GPU SVM range
- * @gpusvm: Pointer to the GPU SVM structure
+ * drm_gpusvm_range_evict - Evict GPU SVM range
  * @range: Pointer to the GPU SVM range to be removed
  *
  * This function evicts the specified GPU SVM range.
@@ -1592,10 +1597,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 {
 	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
 
-	range->flags.unmapped = true;
+	range->pages.flags.unmapped = true;
 	if (drm_gpusvm_range_start(range) < mmu_range->start ||
 	    drm_gpusvm_range_end(range) > mmu_range->end)
-		range->flags.partial_unmap = true;
+		range->pages.flags.partial_unmap = true;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f3a39e734a90..3d3a1a3ae0d1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -725,7 +725,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			return -EAGAIN;
 		}
 		if (xe_svm_range_has_dma_mapping(range)) {
-			xe_res_first_dma(range->base.dma_addr, 0,
+			xe_res_first_dma(range->base.pages.dma_addr, 0,
 					 range->base.itree.last + 1 - range->base.itree.start,
 					 &curs);
 			xe_svm_range_debug(range, "BIND PREPARE - MIXED");
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e35c6d4def20..1c6ffea7179d 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -26,9 +26,9 @@ static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 	 * memory.
 	 */
 
-	struct drm_gpusvm_range_flags flags = {
+	struct drm_gpusvm_pages_flags flags = {
 		/* Pairs with WRITE_ONCE in drm_gpusvm.c */
-		.__flags = READ_ONCE(range->base.flags.__flags),
+		.__flags = READ_ONCE(range->base.pages.flags.__flags),
 	};
 
 	return flags.has_devmem_pages;
@@ -58,7 +58,7 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	       (r__)->base.gpusvm,					\
 	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
 	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
-	       (r__)->base.notifier_seq,				\
+	       (r__)->base.pages.notifier_seq,				\
 	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
 	       xe_svm_range_size((r__)))
 
@@ -129,7 +129,7 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	range_debug(range, "NOTIFIER");
 
 	/* Skip if already unmapped or if no binding exist */
-	if (range->base.flags.unmapped || !range->tile_present)
+	if (range->base.pages.flags.unmapped || !range->tile_present)
 		return 0;
 
 	range_debug(range, "NOTIFIER - EXECUTE");
@@ -660,7 +660,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 	xe_svm_notifier_lock(vm);
 
 	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
-	       (devmem_preferred == range->base.flags.has_devmem_pages);
+	       (devmem_preferred == range->base.pages.flags.has_devmem_pages);
 
 	xe_svm_notifier_unlock(vm);
 
@@ -771,7 +771,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	struct xe_vm *vm = range_to_vm(&range->base);
 	u64 range_size = xe_svm_range_size(range);
 
-	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
+	if (!range->base.pages.flags.migrate_devmem || !preferred_region_is_vram)
 		return false;
 
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
@@ -841,7 +841,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(range))
 		return PTR_ERR(range);
 
-	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
+	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem)
 		return -EACCES;
 
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
@@ -1017,7 +1017,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 {
 	struct drm_pagemap *dpagemap;
 
-	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
+	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
 	dpagemap = tile_local_pagemap(tile);
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 4bdccb56d25f..634ccdfe096b 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -99,7 +99,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *v
 static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 {
 	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
-	return range->base.flags.has_dma_mapping;
+	return range->base.pages.flags.has_dma_mapping;
 }
 
 /**
@@ -178,7 +178,9 @@ struct xe_vram_region;
 struct xe_svm_range {
 	struct {
 		struct interval_tree_node itree;
-		const struct drm_pagemap_addr *dma_addr;
+		struct {
+			const struct drm_pagemap_addr *dma_addr;
+		} pages;
 	} base;
 	u32 tile_present;
 	u32 tile_invalidated;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 8d613e9b2690..1eb484c6af57 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -106,16 +106,16 @@ struct drm_gpusvm_notifier {
 };
 
 /**
- * struct drm_gpusvm_range_flags - Structure representing a GPU SVM range flags
+ * struct drm_gpusvm_range_flags - Structure representing a GPU SVM pages flags
  *
- * @migrate_devmem: Flag indicating whether the range can be migrated to device memory
- * @unmapped: Flag indicating if the range has been unmapped
- * @partial_unmap: Flag indicating if the range has been partially unmapped
- * @has_devmem_pages: Flag indicating if the range has devmem pages
- * @has_dma_mapping: Flag indicating if the range has a DMA mapping
- * @__flags: Flags for range in u16 form (used for READ_ONCE)
+ * @migrate_devmem: Flag indicating whether the pages can be migrated to device memory
+ * @unmapped: Flag indicating if the pages has been unmapped
+ * @partial_unmap: Flag indicating if the pages has been partially unmapped
+ * @has_devmem_pages: Flag indicating if the pages has devmem pages
+ * @has_dma_mapping: Flag indicating if the pages has a DMA mapping
+ * @__flags: Flags for pages in u16 form (used for READ_ONCE)
  */
-struct drm_gpusvm_range_flags {
+struct drm_gpusvm_pages_flags {
 	union {
 		struct {
 			/* All flags below must be set upon creation */
@@ -130,6 +130,27 @@ struct drm_gpusvm_range_flags {
 	};
 };
 
+/**
+ * struct drm_gpusvm_pages - Structure representing a GPU SVM mapped pages
+ *
+ * @dma_addr: Device address array
+ * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
+ *            Note this is assuming only one drm_pagemap per range is allowed.
+ * @notifier_seq: Notifier sequence number of the range's pages
+ * @flags: Flags for range
+ * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
+ * @flags.unmapped: Flag indicating if the range has been unmapped
+ * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
+ * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
+ * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
+ */
+struct drm_gpusvm_pages {
+	struct drm_pagemap_addr *dma_addr;
+	struct drm_pagemap *dpagemap;
+	unsigned long notifier_seq;
+	struct drm_gpusvm_pages_flags flags;
+};
+
 /**
  * struct drm_gpusvm_range - Structure representing a GPU SVM range
  *
@@ -138,11 +159,7 @@ struct drm_gpusvm_range_flags {
  * @refcount: Reference count for the range
  * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
  * @entry: List entry to fast interval tree traversal
- * @notifier_seq: Notifier sequence number of the range's pages
- * @dma_addr: Device address array
- * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
- *            Note this is assuming only one drm_pagemap per range is allowed.
- * @flags: Flags for range
+ * @pages: The pages for this range.
  *
  * This structure represents a GPU SVM range used for tracking memory ranges
  * mapped in a DRM device.
@@ -153,10 +170,7 @@ struct drm_gpusvm_range {
 	struct kref refcount;
 	struct interval_tree_node itree;
 	struct list_head entry;
-	unsigned long notifier_seq;
-	struct drm_pagemap_addr *dma_addr;
-	struct drm_pagemap *dpagemap;
-	struct drm_gpusvm_range_flags flags;
+	struct drm_gpusvm_pages pages;
 };
 
 /**
-- 
2.50.1

