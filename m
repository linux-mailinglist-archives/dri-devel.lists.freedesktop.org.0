Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD9A961C47
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED62010E45A;
	Wed, 28 Aug 2024 02:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5PgOSOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D61510E443;
 Wed, 28 Aug 2024 02:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813290; x=1756349290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kxdKfB/eKyRFkT0+jlY6i1Ejdz0dlNPzmMI6dL9xcyg=;
 b=N5PgOSOvURErKFV4Rx/nH+LENy5tqAoykLjpB2j5PQbpriuLoX7ipqSB
 v3K4fZBj4SEnQlOUJ8UWwLUC/v9iiZCXGotu7JuzmI2hO0Vzj8c9zfRfT
 vstID/yQXK1m6ib/fk95wIKK6fWv3VygzEECFNRzxA/RrZAdqUz/Z0+LM
 ucoU8qFafki85PXLT8uM7lZzXZ+NfWXQV1IQXX3lWDh+SA0B4QioEWz2U
 yu95SxgC0Xei5DQbxlK/kBHdh2FUiBLHd4qFfgtLypBkRJQimX0rNULM+
 FzzC2zC6tLVNVeKkS6Qj/ZbU3ijUU4CphBcupQJxYrKMqLLBtrN/obejG Q==;
X-CSE-ConnectionGUID: NciJ6zDAT2O5635UbMguRg==
X-CSE-MsgGUID: iK3OcEpkSjKqbItIr9UuGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251918"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251918"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
X-CSE-ConnectionGUID: hATsDLD0SGi+neaxWYgx/Q==
X-CSE-MsgGUID: 0MrZ0eJkTayOzm40wmX56A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224639"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 17/28] drm/xe: Add SVM device memory mirroring
Date: Tue, 27 Aug 2024 19:48:50 -0700
Message-Id: <20240828024901.2582335-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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
migration.

TODO: Hide this behind Kconfig

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++
 drivers/gpu/drm/xe/xe_svm.c          | 56 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h          |  3 ++
 drivers/gpu/drm/xe/xe_tile.c         |  5 +++
 4 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4ecd620921a3..b4367efae55b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -105,6 +105,14 @@ struct xe_mem_region {
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
index 2339359a1d91..258a94e83e57 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -21,6 +21,11 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
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
@@ -285,8 +290,9 @@ int xe_svm_init(struct xe_vm *vm)
 		  xe_svm_garbage_collector_work_func);
 
 	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
-			       current->mm, NULL, 0, vm->size,
-			       SZ_512M, &gpusvm_ops, fault_chunk_sizes,
+			       current->mm, xe_svm_devm_owner(vm->xe), 0,
+			       vm->size, SZ_512M, &gpusvm_ops,
+			       fault_chunk_sizes,
 			       ARRAY_SIZE(fault_chunk_sizes));
 }
 
@@ -371,3 +377,49 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 {
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
+
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
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);
+		return ret;
+	}
+	mr->hpa_base = res->start;
+
+	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+		 tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index a4f764bcd835..f15df5c813f1 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -8,6 +8,7 @@
 
 #include "drm_gpusvm.h"
 
+struct xe_mem_region;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
@@ -19,6 +20,8 @@ struct xe_svm_range {
 	u8 tile_invalidated;
 };
 
+int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
+
 int xe_svm_init(struct xe_vm *vm);
 void xe_svm_fini(struct xe_vm *vm);
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 15ea0a942f67..1c1b3d406f1e 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -10,6 +10,7 @@
 #include "xe_gt.h"
 #include "xe_migrate.h"
 #include "xe_sa.h"
+#include "xe_svm.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
@@ -158,6 +159,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
  */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
+	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
 	err = tile_ttm_mgr_init(tile);
@@ -170,6 +172,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_wa_apply_tile_workarounds(tile);
 
+	if (xe->info.has_usm && IS_DGFX(xe))
+		xe_devm_add(tile, &tile->mem.vram);
+
 	err = xe_tile_sysfs_init(tile);
 
 	return 0;
-- 
2.34.1

