Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653BDC08FCC
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD7710E262;
	Sat, 25 Oct 2025 12:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xf/C8Pe+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0000510E262;
 Sat, 25 Oct 2025 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393879; x=1792929879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mFxpRm0qVnl0L4z1chqzbxNoruWLniYFixO6fzdTmuQ=;
 b=Xf/C8Pe+YmQ0T9ugrf3KRmpEtvHWmGWbyfKbwc93Qwg0eqn+1YONpQmD
 ZQ3ZZAX+lY25BE0EPHwpTs8Dbdr/4b0o/6qGX2qvAL472CkVD33bSBM1R
 GVAKwaqdDzSM+Ffl4GXu09PwHrEUnlYzYrR81RKtHRY43/9744LiHi0lo
 RY07mfpgPtH3ltnuUGqTdoYAC/sDII1QNUmE5U5XirOt/dHxiKZ++mJDb
 VAo03weDS/PKPSEIqSnGk6Az+8tkeDzhln297Cd9oZEZ/U4/7/m3iiXJK
 iSaH0N/DWyzaJ4MVAZbdmeSGqq66Scaq9Jb+JsvCINVwzI1kq+Eyl1USl A==;
X-CSE-ConnectionGUID: DcGnlaLyRT6X+z9CJ2HFmg==
X-CSE-MsgGUID: d1I3STwRSLmVT8jsiPZ9uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590370"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:39 -0700
X-CSE-ConnectionGUID: s+WuAaqBSeiXi7PeX/EN6g==
X-CSE-MsgGUID: BMmgNcjWSQeQF5s1WEfXNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023668"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:36 -0700
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
Subject: [PATCH 01/15] drm/pagemap,
 drm/xe: Add refcounting to struct drm_pagemap
Date: Sat, 25 Oct 2025 14:03:58 +0200
Message-ID: <20251025120412.12262-2-thomas.hellstrom@linux.intel.com>
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

With the end goal of being able to free unused pagemaps
and allocate them on demand, add a refcount to struct drm_pagemap,
remove the xe embedded drm_pagemap, allocating and freeing it
explicitly.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c      | 51 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.c        | 26 ++++++++++-----
 drivers/gpu/drm/xe/xe_vram_types.h |  2 +-
 include/drm/drm_pagemap.h          | 36 +++++++++++++++++++++
 4 files changed, 106 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 22c44807e3fe..4b8692f0b2a2 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -538,6 +538,57 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
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
index 129e7818565c..6d2c6c144315 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -861,7 +861,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      struct mm_struct *mm,
 				      unsigned long timeslice_ms)
 {
-	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
+	struct xe_vram_region *vr = container_of(dpagemap->pagemap, typeof(*vr), pagemap);
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
 	struct drm_buddy_block *block;
@@ -1372,7 +1372,7 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
 
 static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
 {
-	return &tile->mem.vram->dpagemap;
+	return tile->mem.vram->dpagemap;
 }
 
 /**
@@ -1482,6 +1482,15 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
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
@@ -1489,22 +1498,23 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
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
index f6e7e234c089..2c7de928865b 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -129,11 +129,15 @@ struct drm_pagemap_ops {
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
@@ -202,6 +206,37 @@ struct drm_pagemap_devmem_ops {
 			   unsigned long npages);
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
@@ -246,3 +281,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			    unsigned long timeslice_ms);
 
 #endif
+
-- 
2.51.0

