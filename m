Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393BEB3A191
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2823910E9ED;
	Thu, 28 Aug 2025 14:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/tyDUhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391BB10E9E5;
 Thu, 28 Aug 2025 14:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756391161; x=1787927161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XYraX9WBt4/ZGdP4VERwCedpodcwHHdZ5EbzsY96tKk=;
 b=G/tyDUhSpu16Cy8LB53WGH9cz+clOeYTKkC80sshLPZXgYPRjse8jtQm
 TYAiN5Dg4TDCr0sfGUmvBwr8sDHac8gkXbwyxaQc45GfWxua3PSGDrs34
 Pp7quoZPuzD+dclgayeKimMZ85E/HKGDGGac7VmsEPcKyjMwIX6Wd8TJE
 3JplqgaZms9pzlJXDvfLRIkJJ2wSWn4D1stI4ljM/kyho/b/5i8OlZcd0
 joKdQ8Vte6XKdJ7JkDrskDCobjxkiIBNjmmkEqdusZeTnAhbxe4UjgZXT
 LWQTyWeUD2TVb1NQQdscldahrQPO9McfpxW0xxB3spTh28p+7pzzvm0md g==;
X-CSE-ConnectionGUID: gioEj/lNTlaLJH73sfVT8w==
X-CSE-MsgGUID: Oz7v0v0QRDyDPnhru3m/9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58763193"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58763193"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:26:01 -0700
X-CSE-ConnectionGUID: XmFxCi64Tbq5cB1niQrKWw==
X-CSE-MsgGUID: Vq3TFIvATn+y5JWhINH3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170025875"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:26:00 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v6 3/8] drm/gpusvm: pull out drm_gpusvm_pages substructure
Date: Thu, 28 Aug 2025 15:24:34 +0100
Message-ID: <20250828142430.615826-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828142430.615826-10-matthew.auld@intel.com>
References: <20250828142430.615826-10-matthew.auld@intel.com>
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
v3:
  - Small kernel-doc fixes

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 67 +++++++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_pt.c   |  2 +-
 drivers/gpu/drm/xe/xe_svm.c  | 16 ++++-----
 drivers/gpu/drm/xe/xe_svm.h  |  6 ++--
 include/drm/drm_gpusvm.h     | 48 +++++++++++++++++---------
 5 files changed, 80 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index b2920b8551f5..fa193dd265b0 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -629,8 +629,8 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
 	range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
 	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
 	INIT_LIST_HEAD(&range->entry);
-	range->notifier_seq = LONG_MAX;
-	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
+	range->pages.notifier_seq = LONG_MAX;
+	range->pages.flags.migrate_devmem = migrate_devmem ? 1 : 0;
 
 	return range;
 }
@@ -992,19 +992,20 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
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
@@ -1020,9 +1021,9 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
 		flags.has_devmem_pages = false;
 		flags.has_dma_mapping = false;
-		WRITE_ONCE(range->flags.__flags, flags.__flags);
+		WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
 
-		range->dpagemap = NULL;
+		svm_pages->dpagemap = NULL;
 	}
 }
 
@@ -1036,11 +1037,13 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
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
 
@@ -1152,9 +1155,11 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
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
 
@@ -1172,9 +1177,10 @@ static bool
 drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
 				      struct drm_gpusvm_range *range)
 {
+	struct drm_gpusvm_pages *svm_pages = &range->pages;
 	bool pages_valid;
 
-	if (!range->dma_addr)
+	if (!svm_pages->dma_addr)
 		return false;
 
 	drm_gpusvm_notifier_lock(gpusvm);
@@ -1201,6 +1207,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			       struct drm_gpusvm_range *range,
 			       const struct drm_gpusvm_ctx *ctx)
 {
+	struct drm_gpusvm_pages *svm_pages = &range->pages;
 	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
 	struct hmm_range hmm_range = {
 		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
@@ -1223,7 +1230,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	int err = 0;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
-	struct drm_gpusvm_range_flags flags;
+	struct drm_gpusvm_pages_flags flags;
 	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
 							   DMA_BIDIRECTIONAL;
 
@@ -1269,7 +1276,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	 */
 	drm_gpusvm_notifier_lock(gpusvm);
 
-	flags.__flags = range->flags.__flags;
+	flags.__flags = svm_pages->flags.__flags;
 	if (flags.unmapped) {
 		drm_gpusvm_notifier_unlock(gpusvm);
 		err = -EFAULT;
@@ -1282,13 +1289,12 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
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
@@ -1327,13 +1333,13 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
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
@@ -1359,7 +1365,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				goto err_unmap;
 			}
 
-			range->dma_addr[j] = drm_pagemap_addr_encode
+			svm_pages->dma_addr[j] = drm_pagemap_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
 				 dma_dir);
 		}
@@ -1370,16 +1376,16 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 
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
 
@@ -1396,7 +1402,6 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
 
 /**
  * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
- * drm_gpusvm_range_evict() - Evict GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
  * @range: Pointer to the GPU SVM range structure
  * @ctx: GPU SVM context
@@ -1520,10 +1525,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
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
index c129048a9a09..029480c9cebd 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -729,7 +729,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			return -EAGAIN;
 		}
 		if (xe_svm_range_has_dma_mapping(range)) {
-			xe_res_first_dma(range->base.dma_addr, 0,
+			xe_res_first_dma(range->base.pages.dma_addr, 0,
 					 range->base.itree.last + 1 - range->base.itree.start,
 					 &curs);
 			xe_svm_range_debug(range, "BIND PREPARE - MIXED");
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 76c6d74c1208..d6ef0cd8a02c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -25,9 +25,9 @@ static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 	 * memory.
 	 */
 
-	struct drm_gpusvm_range_flags flags = {
+	struct drm_gpusvm_pages_flags flags = {
 		/* Pairs with WRITE_ONCE in drm_gpusvm.c */
-		.__flags = READ_ONCE(range->base.flags.__flags),
+		.__flags = READ_ONCE(range->base.pages.flags.__flags),
 	};
 
 	return flags.has_devmem_pages;
@@ -57,7 +57,7 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	       (r__)->base.gpusvm,					\
 	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
 	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
-	       (r__)->base.notifier_seq,				\
+	       (r__)->base.pages.notifier_seq,				\
 	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
 	       xe_svm_range_size((r__)))
 
@@ -128,7 +128,7 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	range_debug(range, "NOTIFIER");
 
 	/* Skip if already unmapped or if no binding exist */
-	if (range->base.flags.unmapped || !range->tile_present)
+	if (range->base.pages.flags.unmapped || !range->tile_present)
 		return 0;
 
 	range_debug(range, "NOTIFIER - EXECUTE");
@@ -716,7 +716,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 	xe_svm_notifier_lock(vm);
 
 	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
-	       (devmem_preferred == range->base.flags.has_devmem_pages);
+	       (devmem_preferred == range->base.pages.flags.has_devmem_pages);
 
 	xe_svm_notifier_unlock(vm);
 
@@ -827,7 +827,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	struct xe_vm *vm = range_to_vm(&range->base);
 	u64 range_size = xe_svm_range_size(range);
 
-	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
+	if (!range->base.pages.flags.migrate_devmem || !preferred_region_is_vram)
 		return false;
 
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
@@ -884,7 +884,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(range))
 		return PTR_ERR(range);
 
-	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
+	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem)
 		return -EACCES;
 
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
@@ -1221,7 +1221,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 {
 	struct drm_pagemap *dpagemap;
 
-	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
+	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
 	dpagemap = tile_local_pagemap(tile);
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 9d6a8840a8b7..f0e0e009c7fc 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -105,7 +105,7 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 {
 	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
-	return range->base.flags.has_dma_mapping;
+	return range->base.pages.flags.has_dma_mapping;
 }
 
 /**
@@ -184,7 +184,9 @@ struct xe_vram_region;
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
index 0e336148309d..1ee4188c3067 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -106,16 +106,16 @@ struct drm_gpusvm_notifier {
 };
 
 /**
- * struct drm_gpusvm_range_flags - Structure representing a GPU SVM range flags
+ * struct drm_gpusvm_pages_flags - Structure representing a GPU SVM pages flags
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
2.51.0

