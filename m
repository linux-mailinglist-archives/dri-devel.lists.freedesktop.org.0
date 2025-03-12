Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD595A5E612
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E6E10E7BA;
	Wed, 12 Mar 2025 21:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrudGXst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128B010E6B0;
 Wed, 12 Mar 2025 21:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813513; x=1773349513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9L/uXpDhdM81ojOceJfn7JiwYN037fz+vFx/wzVCZQQ=;
 b=ZrudGXstaVkfXoHYkgaBw6DQEI3SmCWz4KkgIdUKbW+gvIOShGiOGlTp
 xzSBTp7+ECMv6pfhaslAV9gjE/UFJseU0cE1ElOR5cJGqSZgyU9Gykv3I
 E799+WAYS4YynyJHLiCOw/f18xP2cX4iWjYNHJA8tkITU03hZXA6jnBsz
 ZdrwbIMf3rTFcYUvcPlUiNFDgt5pDQ9WeMyFUTew0wBstpb+GdZQM7PfY
 TlrJQjXZspK3Y6q4Sh05p+o7f9aiaLTRqqXEEVbBXrGlVO1fjgTHaOHwf
 KV5XQ+MFBSz5gWIXPllJZM6UaW3xPB4zlk/dwxjq1lZ5WgbpsPxJHMaV1 Q==;
X-CSE-ConnectionGUID: mWG4z3lgRXuDaf+KmPM2ug==
X-CSE-MsgGUID: 6TAPir+jQZGCjLFYx+BuyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562166"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:10 -0700
X-CSE-ConnectionGUID: sZFr7zugRouhMGCjnLfTgw==
X-CSE-MsgGUID: NRODltvkSTSWah6rQGSz2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791099"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 06/19] drm/pagemap,
 drm/xe: Add refcounting to struct drm_pagemap and manage lifetime
Date: Wed, 12 Mar 2025 22:04:03 +0100
Message-ID: <20250312210416.3120-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

Remove the xe embedded drm_pagemap, and instead allocate and
reference count.
This is a step towards adding drm_pagemaps on demand.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c        | 58 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  2 +-
 drivers/gpu/drm/xe/xe_svm.c          | 27 +++++++++----
 drivers/gpu/drm/xe/xe_tile.h         |  2 +-
 include/drm/drm_pagemap.h            | 25 ++++++++++++
 5 files changed, 102 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 99394c7d1d66..8a0bdf38fc65 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -61,6 +61,7 @@
  *
  * @refcount: Reference count for the zdd
  * @devmem_allocation: device memory allocation
+ * @dpagemap: Pointer to the struct drm_pagemap.
  * @device_private_page_owner: Device private pages owner
  *
  * This structure serves as a generic wrapper installed in
@@ -73,11 +74,13 @@
 struct drm_pagemap_zdd {
 	struct kref refcount;
 	struct drm_pagemap_devmem *devmem_allocation;
+	struct drm_pagemap *dpagemap;
 	void *device_private_page_owner;
 };
 
 /**
  * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
+ * @dpagemap: Pointer to the struct drm_pagemap.
  * @device_private_page_owner: Device private pages owner
  *
  * This function allocates and initializes a new zdd structure. It sets up the
@@ -86,7 +89,7 @@ struct drm_pagemap_zdd {
  * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
  */
 static struct drm_pagemap_zdd *
-drm_pagemap_zdd_alloc(void *device_private_page_owner)
+drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap, void *device_private_page_owner)
 {
 	struct drm_pagemap_zdd *zdd;
 
@@ -97,6 +100,7 @@ drm_pagemap_zdd_alloc(void *device_private_page_owner)
 	kref_init(&zdd->refcount);
 	zdd->devmem_allocation = NULL;
 	zdd->device_private_page_owner = device_private_page_owner;
+	zdd->dpagemap = dpagemap;
 
 	return zdd;
 }
@@ -340,7 +344,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
 	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
 
-	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
+	zdd = drm_pagemap_zdd_alloc(devmem_allocation->dpagemap, pgmap_owner);
 	if (!zdd) {
 		err = -ENOMEM;
 		goto err_free;
@@ -484,6 +488,56 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
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
+	kref_put(&dpagemap->ref, drm_pagemap_release);
+}
+EXPORT_SYMBOL(drm_pagemap_put);
+
 /**
  * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
  * @devmem_allocation: Pointer to the device memory allocation
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d288a5880508..40c6f88f5933 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -116,7 +116,7 @@ struct xe_vram_region {
 	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
 	 * pages of this tile.
 	 */
-	struct drm_pagemap dpagemap;
+	struct drm_pagemap *dpagemap;
 	/**
 	 * @hpa_base: base host physical address
 	 *
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 36ae7d6a218b..37e1607052ed 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -670,7 +670,8 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      unsigned long start, unsigned long end,
 				      struct mm_struct *mm)
 {
-	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);
+	struct xe_tile *tile = container_of(dpagemap->pagemap, typeof(*tile),
+					    mem.vram.pagemap);
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
 	struct xe_vram_region *vr = tile_to_vr(tile);
@@ -699,7 +700,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
 				&dpagemap_devmem_ops,
-				&tile->mem.vram.dpagemap,
+				tile->mem.vram.dpagemap,
 				end - start);
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
@@ -940,6 +941,15 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
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
@@ -947,22 +957,23 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
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
 int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 066a3d0cea79..1d42b235c322 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -19,7 +19,7 @@ void xe_tile_migrate_wait(struct xe_tile *tile);
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
 {
-	return &tile->mem.vram.dpagemap;
+	return tile->mem.vram.dpagemap;
 }
 #else
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index c591736e7c48..49f2e0b6c699 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -126,11 +126,15 @@ struct drm_pagemap_ops {
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
@@ -195,6 +199,26 @@ struct drm_pagemap_devmem_ops {
 			   unsigned long npages);
 };
 
+struct drm_pagemap *drm_pagemap_create(struct device *dev,
+				       struct dev_pagemap *pagemap,
+				       const struct drm_pagemap_ops *ops);
+
+void drm_pagemap_put(struct drm_pagemap *dpagemap);
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
+	kref_get(&dpagemap->ref);
+
+	return dpagemap;
+}
+
 /**
  * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
  *
@@ -235,3 +259,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			    struct mm_struct *mm);
 
 #endif
+
-- 
2.48.1

