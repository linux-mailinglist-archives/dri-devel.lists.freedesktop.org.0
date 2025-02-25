Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90645A43457
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B0210E533;
	Tue, 25 Feb 2025 04:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRWuvJhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF2910E546;
 Tue, 25 Feb 2025 04:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458535; x=1771994535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l0P7EPyVXLvHe0x996+zJ/GDjeNuLfZlOlj6bx/KWoQ=;
 b=HRWuvJhBXZX8P5KaTqCQ7SJWCpuWxEUTKvHdqfBUmlCXzwMsE/xpMEIj
 mMAaHaTl8UzE92eYVjDGKCfpBhmB6tWy6KACy72/uccKEPyOZACt4plSH
 Ho2Xx/bAPZt2uagxU8BpybufuVKFS7oJI51uIuvWLdkrzSnEif2eHFRIh
 ZLrYs7kLKi385gTRuPCo0WMuKlw4PLZpc2ogws+xzi5BE8P6tv4rpXfwJ
 ltQRTIuV6Z/XH6QyXdXokyH0vhiDvO79boQtXUQ4PNf8f8b7WrVA8Q/gZ
 s5PbEL+AVGxYDwGpvl+EDiN6MAfVOoxJvyQcAZbnBpFzJLrDbJLVRLO+Z g==;
X-CSE-ConnectionGUID: fD+QhKVxRJ6RNNMp1iRGMw==
X-CSE-MsgGUID: cXSATw3WQCmeDtHuqGRKEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885030"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885030"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:14 -0800
X-CSE-ConnectionGUID: jrtdoxiBTiyyD041Fe+FTg==
X-CSE-MsgGUID: os6vwKzqRvuEksDbMGwGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290308"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 21/32] drm/xe: Add SVM device memory mirroring
Date: Mon, 24 Feb 2025 20:43:00 -0800
Message-Id: <20250225044311.3178695-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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

Add SVM device memory mirroring which enables device pages for
migration. Enabled via CONFIG_XE_DEVMEM_MIRROR Kconfig. Kconfig option
defaults to enabled. If not enabled, SVM will work sans migration and
KMD memory footprint will be less.

v3:
 - Add CONFIG_XE_DEVMEM_MIRROR
v4:
 - Fix Kconfig (Himal)
 - Use %pe to print errors (Thomas)
 - Fix alignment issue (Checkpatch)
v5:
 - s/xe_mem_region/xe_vram_region (Rebase)
v6:
 - Only compile if CONFIG_DRM_GPUSVM selected (CI, Lucas)
 - s/drm_info/drm_dbg/

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++
 drivers/gpu/drm/xe/xe_svm.c          | 62 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h          |  9 ++++
 drivers/gpu/drm/xe/xe_tile.c         |  5 +++
 4 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b171050eed50..325cb453167e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -106,6 +106,14 @@ struct xe_vram_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
 };
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 80076f4dc4b4..f5854fa6e415 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -29,6 +29,11 @@ static unsigned long xe_svm_range_end(struct xe_svm_range *range)
 	return drm_gpusvm_range_end(&range->base);
 }
 
+static void *xe_svm_devm_owner(struct xe_device *xe)
+{
+	return xe;
+}
+
 static struct drm_gpusvm_range *
 xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 {
@@ -313,8 +318,8 @@ int xe_svm_init(struct xe_vm *vm)
 		  xe_svm_garbage_collector_work_func);
 
 	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
-			      current->mm, NULL, 0, vm->size,
-			      SZ_512M, &gpusvm_ops, fault_chunk_sizes,
+			      current->mm, xe_svm_devm_owner(vm->xe), 0,
+			      vm->size, SZ_512M, &gpusvm_ops, fault_chunk_sizes,
 			      ARRAY_SIZE(fault_chunk_sizes));
 	if (err)
 		return err;
@@ -449,3 +454,56 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 {
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+/**
+ * xe_devm_add: Remap and provide memmap backing for device memory
+ * @tile: tile that the memory region belongs to
+ * @vr: vram memory region to remap
+ *
+ * This remap device memory to host physical address space and create
+ * struct page to back device memory
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+	struct resource *res;
+	void *addr;
+	int ret;
+
+	res = devm_request_free_mem_region(dev, &iomem_resource,
+					   vr->usable_size);
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
+		return ret;
+	}
+
+	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
+	vr->pagemap.range.start = res->start;
+	vr->pagemap.range.end = res->end;
+	vr->pagemap.nr_range = 1;
+	vr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
+	vr->pagemap.owner = xe_svm_devm_owner(xe);
+	addr = devm_memremap_pages(dev, &vr->pagemap);
+	if (IS_ERR(addr)) {
+		devm_release_mem_region(dev, res->start, resource_size(res));
+		ret = PTR_ERR(addr);
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
+			tile->id, ERR_PTR(ret));
+		return ret;
+	}
+	vr->hpa_base = res->start;
+
+	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
+	return 0;
+}
+#else
+int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+{
+	return 0;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 35e044e492e0..49c35e9ec183 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -11,6 +11,7 @@
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
+struct xe_vram_region;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
@@ -48,6 +49,8 @@ static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 	return drm_gpusvm_range_pages_valid(range->base.gpusvm, &range->base);
 }
 
+int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
+
 int xe_svm_init(struct xe_vm *vm);
 
 void xe_svm_fini(struct xe_vm *vm);
@@ -65,6 +68,12 @@ static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 	return false;
 }
 
+static inline
+int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+{
+	return 0;
+}
+
 static inline
 int xe_svm_init(struct xe_vm *vm)
 {
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d29658ff4dd4..0771acbbf367 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -13,6 +13,7 @@
 #include "xe_migrate.h"
 #include "xe_pcode.h"
 #include "xe_sa.h"
+#include "xe_svm.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
@@ -160,6 +161,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
  */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
+	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
 	err = tile_ttm_mgr_init(tile);
@@ -168,6 +170,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_wa_apply_tile_workarounds(tile);
 
+	if (xe->info.has_usm && IS_DGFX(xe))
+		xe_devm_add(tile, &tile->mem.vram);
+
 	return xe_tile_sysfs_init(tile);
 }
 
-- 
2.34.1

