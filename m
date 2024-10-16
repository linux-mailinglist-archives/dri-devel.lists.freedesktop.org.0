Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BB099FF5F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0444D10E660;
	Wed, 16 Oct 2024 03:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElXsN9n0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4E310E654;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049100; x=1760585100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ICHzS1IvSe3mhck8yHv4+OEYu+Ud7FnYBBkFJwqC/YA=;
 b=ElXsN9n0XYCQ9hWvzwUgWRL9c6xBBhgHIUD1qeRgxaVilylGU2z0KBkD
 37BMpNJvtqJ7OQmFx+KAL//yrFxNB8E9IunKTZm0ie5jj+gbpLXdAseX+
 7p+/e1CVIe8thirwDPZ6a3DMbCEPXctOnD+1Fu5iQGvcSyV+s0TPJ8KQy
 9+fXqUfw0AXiBXRyZ38q1i5ESRU1OzMqWR794u32SKQpu10PZrYbSQ58Q
 BFo/iJQojXcLLLhqHQwNVBU2BMYPevO15UdZtDsyVH50pEM3p+Hs2m7Oj
 f2UDei6v50DFg62/IPGSauZaPz3EmplPso1+Q3bCx1GUsygDjwY49zCdT g==;
X-CSE-ConnectionGUID: rAURCsIzR/ScSS1n9D2qhg==
X-CSE-MsgGUID: XApLSoEDQyieT6kC8QtrVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056429"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056429"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: RVz4MwzMRNeNRAcXWPTVvA==
X-CSE-MsgGUID: 79AazXBzTx2VFRIg1EgTgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930268"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 17/29] drm/xe: Add SVM device memory mirroring
Date: Tue, 15 Oct 2024 20:25:06 -0700
Message-Id: <20241016032518.539495-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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
index 85bede4dd646..2ac5de7751c9 100644
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
index 1d8021b4e2f0..22e6341117bd 100644
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
@@ -284,8 +289,9 @@ int xe_svm_init(struct xe_vm *vm)
 		  xe_svm_garbage_collector_work_func);
 
 	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
-			       current->mm, NULL, 0, vm->size,
-			       SZ_512M, &gpusvm_ops, fault_chunk_sizes,
+			       current->mm, xe_svm_devm_owner(vm->xe), 0,
+			       vm->size, SZ_512M, &gpusvm_ops,
+			       fault_chunk_sizes,
 			       ARRAY_SIZE(fault_chunk_sizes));
 }
 
@@ -383,3 +389,49 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
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
index 472fbc51f30e..760d22cefb1e 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -11,6 +11,7 @@
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
+struct xe_mem_region;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
@@ -22,6 +23,8 @@ struct xe_svm_range {
 	u8 tile_invalidated;
 };
 
+int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
+
 int xe_svm_init(struct xe_vm *vm);
 void xe_svm_fini(struct xe_vm *vm);
 void xe_svm_close(struct xe_vm *vm);
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 07cf7cfe4abd..bbb430392dfb 100644
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
@@ -176,6 +178,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_wa_apply_tile_workarounds(tile);
 
+	if (xe->info.has_usm && IS_DGFX(xe))
+		xe_devm_add(tile, &tile->mem.vram);
+
 	err = xe_tile_sysfs_init(tile);
 
 	return 0;
-- 
2.34.1

