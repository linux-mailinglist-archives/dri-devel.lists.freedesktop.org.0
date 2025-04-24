Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F8A9AD1B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 14:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B969A10E7E0;
	Thu, 24 Apr 2025 12:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gS43AF7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D3810E7DF;
 Thu, 24 Apr 2025 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745497130; x=1777033130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=avxvZiecxuXes1eiJkiVF/NG8L7zejw7Ezmidb1SmOw=;
 b=gS43AF7ExniqrSUJVx7VQOndWXGBJH8n46CPZsJtzgoikXBdPaR1Od7F
 +TTMf1U6mpOOtulzxETq0o70IjzD8UbMXCOaXBywndPkxWhZfciaI90i4
 faD0Rzh6SjIBbRk609BrDox/jjmbgxBpYeGE6x3kdTAJFqvUkzjFbveQY
 pyz2n7iTwKn723S9Xq5tomiuNpuQbuoGxqiZPP40G4fEVo2oYOwuX4cFz
 x6yzqs31B+cMTAgeYpsdx1tAcIMlR5ZU+cxGFSh1bY6qi88CVSaI9YrUB
 kVWjmgz2HpBpOH4AifHYEqdZ78YDSELTybzSUJaJajb5lX75XR/0FRyCV w==;
X-CSE-ConnectionGUID: xlfOejYWRtCD7aQFuWFtnw==
X-CSE-MsgGUID: FeWNodgMSOaYYGEhc4o7Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50947943"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="50947943"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:50 -0700
X-CSE-ConnectionGUID: gC4WVz3PSlyuM4AAY92sfg==
X-CSE-MsgGUID: Or38IZyoRTmhxai0hDeXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137589407"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.164])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 3/7] drm/gpusvm: pull out drm_gpusvm_pages substructure
Date: Thu, 24 Apr 2025 13:18:31 +0100
Message-ID: <20250424121827.862729-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424121827.862729-9-matthew.auld@intel.com>
References: <20250424121827.862729-9-matthew.auld@intel.com>
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
 drivers/gpu/drm/drm_gpusvm.c | 66 ++++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_pt.c   |  2 +-
 drivers/gpu/drm/xe/xe_svm.c  |  8 ++---
 drivers/gpu/drm/xe/xe_svm.h  |  6 ++--
 include/drm/drm_gpusvm.h     | 53 +++++++++++++++++------------
 5 files changed, 76 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index d40a01524387..ef38017d2159 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -811,8 +811,8 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
 	range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
 	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
 	INIT_LIST_HEAD(&range->entry);
-	range->notifier_seq = LONG_MAX;
-	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
+	range->pages.notifier_seq = LONG_MAX;
+	range->pages.flags.migrate_devmem = migrate_devmem ? 1 : 0;
 
 	return range;
 }
@@ -1140,15 +1140,16 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
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
+	if (svm_pages->flags.has_dma_mapping) {
 		for (i = 0, j = 0; i < npages; j++) {
-			struct drm_pagemap_device_addr *addr = &range->dma_addr[j];
+			struct drm_pagemap_device_addr *addr = &svm_pages->dma_addr[j];
 
 			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
 				dma_unmap_page(dev,
@@ -1160,9 +1161,9 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 							    dev, *addr);
 			i += 1 << addr->order;
 		}
-		range->flags.has_devmem_pages = false;
-		range->flags.has_dma_mapping = false;
-		range->dpagemap = NULL;
+		svm_pages->flags.has_devmem_pages = false;
+		svm_pages->flags.has_dma_mapping = false;
+		svm_pages->dpagemap = NULL;
 	}
 }
 
@@ -1176,11 +1177,13 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
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
 
@@ -1291,9 +1294,11 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
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
 
@@ -1311,9 +1316,10 @@ static bool
 drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
 				      struct drm_gpusvm_range *range)
 {
+	struct drm_gpusvm_pages *svm_pages = &range->pages;
 	bool pages_valid;
 
-	if (!range->dma_addr)
+	if (!svm_pages->dma_addr)
 		return false;
 
 	drm_gpusvm_notifier_lock(gpusvm);
@@ -1340,6 +1346,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			       struct drm_gpusvm_range *range,
 			       const struct drm_gpusvm_ctx *ctx)
 {
+	struct drm_gpusvm_pages *svm_pages = &range->pages;
 	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
 	struct hmm_range hmm_range = {
 		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
@@ -1409,7 +1416,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	 */
 	drm_gpusvm_notifier_lock(gpusvm);
 
-	if (range->flags.unmapped) {
+	if (svm_pages->flags.unmapped) {
 		drm_gpusvm_notifier_unlock(gpusvm);
 		err = -EFAULT;
 		goto err_free;
@@ -1421,13 +1428,12 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
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
@@ -1465,13 +1471,13 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
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
@@ -1494,7 +1500,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				goto err_unmap;
 			}
 
-			range->dma_addr[j] = drm_pagemap_device_addr_encode
+			svm_pages->dma_addr[j] = drm_pagemap_device_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
 				 dma_dir);
 		}
@@ -1502,16 +1508,16 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		num_dma_mapped = i;
 	}
 
-	range->flags.has_dma_mapping = true;
+	svm_pages->flags.has_dma_mapping = true;
 	if (zdd) {
-		range->flags.has_devmem_pages = true;
-		range->dpagemap = dpagemap;
+		svm_pages->flags.has_devmem_pages = true;
+		svm_pages->dpagemap = dpagemap;
 	}
 
 	drm_gpusvm_notifier_unlock(gpusvm);
 	kvfree(pfns);
 set_seqno:
-	range->notifier_seq = hmm_range.notifier_seq;
+	svm_pages->notifier_seq = hmm_range.notifier_seq;
 
 	return 0;
 
@@ -1718,7 +1724,7 @@ int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
 
 	mmap_assert_locked(gpusvm->mm);
 
-	if (!range->flags.migrate_devmem)
+	if (!range->pages.flags.migrate_devmem)
 		return -EINVAL;
 
 	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
@@ -2247,10 +2253,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
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
index b42cf5d1b20c..5cccfd9cc3e9 100644
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
index 890f6b2f40e9..f60c7f587cd6 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -17,7 +17,7 @@
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
 	/* Not reliable without notifier lock */
-	return range->base.flags.has_devmem_pages;
+	return range->base.pages.flags.has_devmem_pages;
 }
 
 static bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
@@ -59,7 +59,7 @@ static unsigned long xe_svm_range_size(struct xe_svm_range *range)
 	       (r__)->base.gpusvm,					\
 	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
 	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
-	       (r__)->base.notifier_seq,				\
+	       (r__)->base.pages.notifier_seq,				\
 	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
 	       xe_svm_range_size((r__)))
 
@@ -135,7 +135,7 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	range_debug(range, "NOTIFIER");
 
 	/* Skip if already unmapped or if no binding exist */
-	if (range->base.flags.unmapped || !range->tile_present)
+	if (range->base.pages.flags.unmapped || !range->tile_present)
 		return 0;
 
 	range_debug(range, "NOTIFIER - EXECUTE");
@@ -783,7 +783,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	range_debug(range, "PAGE FAULT");
 
 	/* XXX: Add migration policy, for now migrate range once */
-	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
+	if (!range->skip_migrate && range->base.pages.flags.migrate_devmem &&
 	    xe_svm_range_size(range) >= SZ_64K) {
 		range->skip_migrate = true;
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 3d441eb1f7ea..8bc83de87250 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -84,7 +84,7 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
 static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 {
 	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
-	return range->base.flags.has_dma_mapping;
+	return range->base.pages.flags.has_dma_mapping;
 }
 
 #define xe_svm_assert_in_notifier(vm__) \
@@ -112,7 +112,9 @@ struct xe_vram_region;
 struct xe_svm_range {
 	struct {
 		struct interval_tree_node itree;
-		const struct drm_pagemap_device_addr *dma_addr;
+		struct {
+			struct drm_pagemap_device_addr *dma_addr;
+		} pages;
 	} base;
 	u32 tile_present;
 	u32 tile_invalidated;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index df120b4d1f83..1b7ed4f4a8e2 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -185,6 +185,35 @@ struct drm_gpusvm_notifier {
 	} flags;
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
+	struct drm_pagemap_device_addr *dma_addr;
+	struct drm_pagemap *dpagemap;
+	unsigned long notifier_seq;
+	struct {
+		/* All flags below must be set upon creation */
+		u16 migrate_devmem : 1;
+		/* All flags below must be set / cleared under notifier lock */
+		u16 unmapped : 1;
+		u16 partial_unmap : 1;
+		u16 has_devmem_pages : 1;
+		u16 has_dma_mapping : 1;
+	} flags;
+};
+
 /**
  * struct drm_gpusvm_range - Structure representing a GPU SVM range
  *
@@ -193,16 +222,7 @@ struct drm_gpusvm_notifier {
  * @refcount: Reference count for the range
  * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
  * @entry: List entry to fast interval tree traversal
- * @notifier_seq: Notifier sequence number of the range's pages
- * @dma_addr: Device address array
- * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
- *            Note this is assuming only one drm_pagemap per range is allowed.
- * @flags: Flags for range
- * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
- * @flags.unmapped: Flag indicating if the range has been unmapped
- * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
- * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
- * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
+ * @pages: The pages for this range.
  *
  * This structure represents a GPU SVM range used for tracking memory ranges
  * mapped in a DRM device.
@@ -213,18 +233,7 @@ struct drm_gpusvm_range {
 	struct kref refcount;
 	struct interval_tree_node itree;
 	struct list_head entry;
-	unsigned long notifier_seq;
-	struct drm_pagemap_device_addr *dma_addr;
-	struct drm_pagemap *dpagemap;
-	struct {
-		/* All flags below must be set upon creation */
-		u16 migrate_devmem : 1;
-		/* All flags below must be set / cleared under notifier lock */
-		u16 unmapped : 1;
-		u16 partial_unmap : 1;
-		u16 has_devmem_pages : 1;
-		u16 has_dma_mapping : 1;
-	} flags;
+	struct drm_gpusvm_pages pages;
 };
 
 /**
-- 
2.49.0

