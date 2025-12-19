Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDE4CCF971
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E2610E197;
	Fri, 19 Dec 2025 11:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhVTCra7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E84E10EF2C;
 Fri, 19 Dec 2025 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144057; x=1797680057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i5dA0xxbTfYVcnCj4yWs7LIreldiuFVfglVitR1ICNY=;
 b=UhVTCra7pEf1eqwJbmVYea3zKgh0MJ84Giq2y/Z2hbEbrEe8zlHK0IvD
 R9dKSE+Z/NzIK1XdGlD9d+vJAJa20pPgIMExI3RDjMqp4tIn2YCqTyypt
 a3WfpEwzg9jIeNhPciREUozPR/lZ0Jr4W1HOicpSEfNeUnMqy56cEL15R
 nOs/QEGPb+/JwPbmaGjszGnTlx5vFCyjNNcc0dgOkeAVpg02+ysouEzMW
 vgkAdh4KPjElvc2NSf/Ed2ULRbu2kXILEw5yr1mhWKLvtVo0laSQwrxyu
 vXnFArPZ1YPwq2ecgaOXU08duGBt7kzTYlEN35NUa6wWVyxXfjMuKdwDZ A==;
X-CSE-ConnectionGUID: X7Lm848/SI2p8Yyw9zMfIg==
X-CSE-MsgGUID: 4aKmafYkRQamu/TvwaSOag==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224486"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224486"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:16 -0800
X-CSE-ConnectionGUID: dpg8EGcKRa2riwz+Fi5Juw==
X-CSE-MsgGUID: EH+kFi/6Q+SWzUlp6yTIZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005599"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:13 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 04/24] drm/pagemap,
 drm/xe: Add refcounting to struct drm_pagemap
Date: Fri, 19 Dec 2025 12:33:00 +0100
Message-ID: <20251219113320.183860-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
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

With the end goal of being able to free unused pagemaps
and allocate them on demand, add a refcount to struct drm_pagemap,
remove the xe embedded drm_pagemap, allocating and freeing it
explicitly.

v2:
- Make the drm_pagemap pointer in drm_gpusvm_pages reference-counted.
v3:
- Call drm_pagemap_get() before drm_pagemap_put() in drm_gpusvm_pages
  (Himal Prasad Ghimiray)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c       |  3 ++
 drivers/gpu/drm/drm_pagemap.c      | 51 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.c        | 26 ++++++++++-----
 drivers/gpu/drm/xe/xe_vram_types.h |  2 +-
 include/drm/drm_pagemap.h          | 36 +++++++++++++++++++++
 5 files changed, 109 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 39c8c50401dd..4c7474a331bc 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1038,6 +1038,7 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		flags.has_dma_mapping = false;
 		WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
 
+		drm_pagemap_put(svm_pages->dpagemap);
 		svm_pages->dpagemap = NULL;
 	}
 }
@@ -1434,6 +1435,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 
 	if (pagemap) {
 		flags.has_devmem_pages = true;
+		drm_pagemap_get(dpagemap);
+		drm_pagemap_put(svm_pages->dpagemap);
 		svm_pages->dpagemap = dpagemap;
 	}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index ac3832f85190..87648a498a31 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -543,6 +543,57 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 	return -ENOMEM;
 }
 
+static void drm_pagemap_release(struct kref *ref)
+{
+	struct drm_pagemap *dpagemap = container_of(ref, typeof(*dpagemap), ref);
+
+	kfree(dpagemap);
+}
+
+/**
+ * drm_pagemap_create() - Create a struct drm_pagemap.
+ * @dev: Pointer to a struct device providing the device-private memory.
+ * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the struct pages.
+ * @ops: Pointer to the struct drm_pagemap_ops.
+ *
+ * Allocate and initialize a struct drm_pagemap.
+ *
+ * Return: A refcounted pointer to a struct drm_pagemap on success.
+ * Error pointer on error.
+ */
+struct drm_pagemap *
+drm_pagemap_create(struct device *dev,
+		   struct dev_pagemap *pagemap,
+		   const struct drm_pagemap_ops *ops)
+{
+	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
+
+	if (!dpagemap)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&dpagemap->ref);
+	dpagemap->dev = dev;
+	dpagemap->ops = ops;
+	dpagemap->pagemap = pagemap;
+
+	return dpagemap;
+}
+EXPORT_SYMBOL(drm_pagemap_create);
+
+/**
+ * drm_pagemap_put() - Put a struct drm_pagemap reference
+ * @dpagemap: Pointer to a struct drm_pagemap object.
+ *
+ * Puts a struct drm_pagemap reference and frees the drm_pagemap object
+ * if the refount reaches zero.
+ */
+void drm_pagemap_put(struct drm_pagemap *dpagemap)
+{
+	if (likely(dpagemap))
+		kref_put(&dpagemap->ref, drm_pagemap_release);
+}
+EXPORT_SYMBOL(drm_pagemap_put);
+
 /**
  * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
  * @devmem_allocation: Pointer to the device memory allocation
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 14a027b3ee6b..b30daedb9a5f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -868,7 +868,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      struct mm_struct *mm,
 				      unsigned long timeslice_ms)
 {
-	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
+	struct xe_vram_region *vr = container_of(dpagemap->pagemap, typeof(*vr), pagemap);
 	struct dma_fence *pre_migrate_fence = NULL;
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
@@ -1392,7 +1392,7 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
 
 static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
 {
-	return &tile->mem.vram->dpagemap;
+	return tile->mem.vram->dpagemap;
 }
 
 /**
@@ -1502,6 +1502,15 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 		return ret;
 	}
 
+	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
+					  &xe_drm_pagemap_ops);
+	if (IS_ERR(vr->dpagemap)) {
+		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
+			tile->id, vr->dpagemap);
+		ret = PTR_ERR(vr->dpagemap);
+		goto out_no_dpagemap;
+	}
+
 	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	vr->pagemap.range.start = res->start;
 	vr->pagemap.range.end = res->end;
@@ -1509,22 +1518,23 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
 	vr->pagemap.owner = xe_svm_devm_owner(xe);
 	addr = devm_memremap_pages(dev, &vr->pagemap);
-
-	vr->dpagemap.dev = dev;
-	vr->dpagemap.ops = &xe_drm_pagemap_ops;
-
 	if (IS_ERR(addr)) {
-		devm_release_mem_region(dev, res->start, resource_size(res));
 		ret = PTR_ERR(addr);
 		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
 			tile->id, ERR_PTR(ret));
-		return ret;
+		goto out_failed_memremap;
 	}
 	vr->hpa_base = res->start;
 
 	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
 		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
 	return 0;
+
+out_failed_memremap:
+	drm_pagemap_put(vr->dpagemap);
+out_no_dpagemap:
+	devm_release_mem_region(dev, res->start, resource_size(res));
+	return ret;
 }
 #else
 int xe_svm_alloc_vram(struct xe_tile *tile,
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 83772dcbf1af..c0d2c5ee8c10 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -72,7 +72,7 @@ struct xe_vram_region {
 	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
 	 * pages of this tile.
 	 */
-	struct drm_pagemap dpagemap;
+	struct drm_pagemap *dpagemap;
 	/**
 	 * @hpa_base: base host physical address
 	 *
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 70a7991f784f..093e7199c44b 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -130,11 +130,15 @@ struct drm_pagemap_ops {
  * struct drm_pagemap: Additional information for a struct dev_pagemap
  * used for device p2p handshaking.
  * @ops: The struct drm_pagemap_ops.
+ * @ref: Reference count.
  * @dev: The struct drevice owning the device-private memory.
+ * @pagemap: Pointer to the underlying dev_pagemap.
  */
 struct drm_pagemap {
 	const struct drm_pagemap_ops *ops;
+	struct kref ref;
 	struct device *dev;
+	struct dev_pagemap *pagemap;
 };
 
 struct drm_pagemap_devmem;
@@ -209,6 +213,37 @@ struct drm_pagemap_devmem_ops {
 			   struct dma_fence *pre_migrate_fence);
 };
 
+struct drm_pagemap *drm_pagemap_create(struct device *dev,
+				       struct dev_pagemap *pagemap,
+				       const struct drm_pagemap_ops *ops);
+
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+
+void drm_pagemap_put(struct drm_pagemap *dpagemap);
+
+#else
+
+static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
+{
+}
+
+#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
+
+/**
+ * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
+ * @dpagemap: Pointer to the struct drm_pagemap.
+ *
+ * Return: Pointer to the struct drm_pagemap.
+ */
+static inline struct drm_pagemap *
+drm_pagemap_get(struct drm_pagemap *dpagemap)
+{
+	if (likely(dpagemap))
+		kref_get(&dpagemap->ref);
+
+	return dpagemap;
+}
+
 /**
  * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
  *
@@ -257,3 +292,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			    unsigned long timeslice_ms);
 
 #endif
+
-- 
2.51.1

