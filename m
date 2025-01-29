Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35F5A224CE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF3810E88B;
	Wed, 29 Jan 2025 19:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOMwNEoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E9310E896;
 Wed, 29 Jan 2025 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180285; x=1769716285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4yQuUMvIZ99pmBPtkBneYVeUea2BIdfK5AluIzsWXvY=;
 b=TOMwNEoNl5PEZd/tt9p5r3OfNP5PeN9KUV76IUCBNUszabYlyjGgLvUY
 JFXm3XT4MnK5/wggx25tCHmh1LDxyPc9p/6MFKc8/jPZQU/SZSzubooyo
 6EbBUmbrQCwTPbtigINyD7TCNhRKgzP+FTLIuwOJfgnbateNPxj7eS5yi
 ONOwsYvlzaC/6zw1Cu5XbLM4bk55fUX4Ej3O8O8mCxppBY3EOGvJd6635
 eCH4pNbbgMbOwbsmNEO5wRfSSLBZ+pFkkoH9cUmlfmn2Lb6j43IbiDK6g
 U6ocwkKMpEeXgJDmAyJFg7KAFf2lFZ/vezILTNLkiOj1m3SzzZ0OJguD+ w==;
X-CSE-ConnectionGUID: MOEtsgXXQQac0HV0Cn0ypA==
X-CSE-MsgGUID: ST9oucC2Szu+C/WnnjEMMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132835"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132835"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:24 -0800
X-CSE-ConnectionGUID: JBoNrb9eSkKzmUV0ebOb3g==
X-CSE-MsgGUID: adi6dFi6TDum6zMsjd3gKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392169"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 21/33] drm/xe: Add SVM device memory mirroring
Date: Wed, 29 Jan 2025 11:52:00 -0800
Message-Id: <20250129195212.745731-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig           |  9 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++
 drivers/gpu/drm/xe/xe_svm.c          | 62 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h          |  3 ++
 drivers/gpu/drm/xe/xe_tile.c         |  5 +++
 5 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 60b922f75001..4bc03d6f6720 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -74,6 +74,15 @@ config DRM_XE_DP_TUNNEL
 
 	  If in doubt say "Y".
 
+config DRM_XE_DEVMEM_MIRROR
+	bool "Enable device memory mirror"
+	depends on DRM_XE
+	select GET_FREE_REGION
+	default y
+	help
+	  Disable this option only if you want to compile out without device
+	  memory mirror. Will reduce KMD memory footprint when disabled.
+
 config DRM_XE_FORCE_PROBE
 	string "Force probe xe for selected Intel hardware IDs"
 	depends on DRM_XE
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 71151532e28f..da5bf145324b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -104,6 +104,14 @@ struct xe_mem_region {
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
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ee150139470f..985ac20c5b07 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -19,6 +19,11 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	return gpusvm_to_vm(r->gpusvm);
 }
 
+static void *xe_svm_devm_owner(struct xe_device *xe)
+{
+	return xe;
+}
+
 static struct drm_gpusvm_range *
 xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 {
@@ -307,8 +312,8 @@ int xe_svm_init(struct xe_vm *vm)
 		  xe_svm_garbage_collector_work_func);
 
 	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
-			      current->mm, NULL, 0, vm->size,
-			      SZ_512M, &gpusvm_ops, fault_chunk_sizes,
+			      current->mm, xe_svm_devm_owner(vm->xe), 0,
+			      vm->size, SZ_512M, &gpusvm_ops, fault_chunk_sizes,
 			      ARRAY_SIZE(fault_chunk_sizes));
 	if (err)
 		return err;
@@ -443,3 +448,56 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 {
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+/**
+ * xe_devm_add: Remap and provide memmap backing for device memory
+ * @tile: tile that the memory region belongs to
+ * @mr: memory region to remap
+ *
+ * This remap device memory to host physical address space and create
+ * struct page to back device memory
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+	struct resource *res;
+	void *addr;
+	int ret;
+
+	res = devm_request_free_mem_region(dev, &iomem_resource,
+					   mr->usable_size);
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
+		return ret;
+	}
+
+	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
+	mr->pagemap.range.start = res->start;
+	mr->pagemap.range.end = res->end;
+	mr->pagemap.nr_range = 1;
+	mr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
+	mr->pagemap.owner = xe_svm_devm_owner(xe);
+	addr = devm_memremap_pages(dev, &mr->pagemap);
+	if (IS_ERR(addr)) {
+		devm_release_mem_region(dev, res->start, resource_size(res));
+		ret = PTR_ERR(addr);
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
+			tile->id, ERR_PTR(ret));
+		return ret;
+	}
+	mr->hpa_base = res->start;
+
+	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+		 tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
+	return 0;
+}
+#else
+int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
+{
+	return 0;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b181c174ca61..63daffdfdbf6 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -11,6 +11,7 @@
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
+struct xe_mem_region;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
@@ -36,6 +37,8 @@ struct xe_svm_range {
 	u8 tile_invalidated;
 };
 
+int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
+
 int xe_svm_init(struct xe_vm *vm);
 
 void xe_svm_fini(struct xe_vm *vm);
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 2825553b568f..6c80a637ded5 100644
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
@@ -164,6 +165,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
  */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
+	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
 	err = tile_ttm_mgr_init(tile);
@@ -172,6 +174,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_wa_apply_tile_workarounds(tile);
 
+	if (xe->info.has_usm && IS_DGFX(xe))
+		xe_devm_add(tile, &tile->mem.vram);
+
 	err = xe_tile_sysfs_init(tile);
 
 	return 0;
-- 
2.34.1

