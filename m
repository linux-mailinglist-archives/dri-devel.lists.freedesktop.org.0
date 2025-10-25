Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F6C08FD8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B515810E261;
	Sat, 25 Oct 2025 12:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZghydWkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4345210E26E;
 Sat, 25 Oct 2025 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393891; x=1792929891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPS3p5JtBbIDayzOtRa3TDOpYD+7a6iImuR+Et1Oyug=;
 b=ZghydWkkgcrJgXHCfzBGE8LeE3YuLTh8g7hn65POUFB69Rn19ladk5cw
 1Dbn8zhC5vXhE7TY+0tTYAeh9lb+4PHVvPG8ZAEkx4ZzMDNFgh8C+6zDw
 U8kEkI/GZLEguPhbLKEUZe39dmjBKt5Pw7ORw9KLtCzsNf3ZvpIGf4bsm
 TKObqL1eK6nXKkEvLFkpjSO/NRnrw5bW9Nq/lc4Vt7vdOnoWuQ0lJoGWs
 4A4alSgtkgiWfgxUhtF8CzIaki/IClcecPLtfMFO1B3QIaLIk7dX/aiSF
 /eQFnM4SnJJ5q3G3GcfoKvYSwiAA4E7KXk8rUHLBvBBQpJRV/5BopJ1ZF A==;
X-CSE-ConnectionGUID: KjFmXx+5Qe6KhV+SmVVZdQ==
X-CSE-MsgGUID: kPg+y3wtSP6N8j4yMPwdQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590377"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590377"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:51 -0700
X-CSE-ConnectionGUID: 1PoI2eFORXGxkIawfpElMA==
X-CSE-MsgGUID: j+dXr72HTxGuQPrOeL0Y8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023710"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:48 -0700
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
Subject: [PATCH 05/15] drm/xe: Use the drm_pagemap cache and shrinker
Date: Sat, 25 Oct 2025 14:04:02 +0200
Message-ID: <20251025120412.12262-6-thomas.hellstrom@linux.intel.com>
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

Define a struct xe_pagemap that embeds all pagemap-related
data used by xekmd, and use the drm_pagemap cache- and
shrinker to manage lifetime.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   6 +
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_svm.c          | 354 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.h          |  38 ++-
 drivers/gpu/drm/xe/xe_tile.c         |  34 ++-
 drivers/gpu/drm/xe/xe_tile.h         |  21 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |   1 +
 drivers/gpu/drm/xe/xe_vram_types.h   |  15 +-
 8 files changed, 379 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5f6a412b571c..ad004aab67ce 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_pagemap_util.h>
 #include <drm/drm_print.h>
 #include <uapi/drm/xe_drm.h>
 
@@ -62,6 +63,7 @@
 #include "xe_shrinker.h"
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
+#include "xe_svm.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -465,6 +467,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	init_rwsem(&xe->usm.lock);
 
+	err = xe_pagemap_shrinker_create(xe);
+	if (err)
+		goto err;
+
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6a62b520f5b5..dbcfe54b36d8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -35,6 +35,7 @@
 #endif
 
 struct dram_info;
+struct drm_pagemap_shrinker;
 struct intel_display;
 struct intel_dg_nvm_dev;
 struct xe_ggtt;
@@ -418,6 +419,10 @@ struct xe_device {
 		u32 next_asid;
 		/** @usm.lock: protects UM state */
 		struct rw_semaphore lock;
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
+		struct drm_pagemap_shrinker *dpagemap_shrinker;
+#endif
 	} usm;
 
 	/** @pinned: pinned BO state */
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f6ee22da2e95..8aced064c83f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -4,6 +4,9 @@
  */
 
 #include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_pagemap.h>
+#include <drm/drm_pagemap_util.h>
 
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
@@ -19,6 +22,8 @@
 #include "xe_vm_types.h"
 #include "xe_vram_types.h"
 
+static int xe_svm_get_pagemaps(struct xe_vm *vm);
+
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
 	/*
@@ -395,22 +400,34 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
-static struct xe_vram_region *page_to_vr(struct page *page)
+static struct xe_vram_region *xe_pagemap_to_vr(struct xe_pagemap *xpagemap)
 {
-	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
+	return xpagemap->vr;
 }
 
-static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
-				      struct page *page)
+static struct xe_pagemap *xe_page_to_pagemap(struct page *page)
 {
-	u64 dpa;
+	return container_of(page_pgmap(page), struct xe_pagemap, pagemap);
+}
+
+static struct xe_vram_region *xe_page_to_vr(struct page *page)
+{
+	return xe_pagemap_to_vr(xe_page_to_pagemap(page));
+}
+
+static u64 xe_page_to_dpa(struct page *page)
+{
+	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
+	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
+	u64 hpa_base = xpagemap->hpa_base;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
+	u64 dpa;
 
 	xe_assert(vr->xe, is_device_private_page(page));
-	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= vr->hpa_base);
+	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= hpa_base);
 
-	offset = (pfn << PAGE_SHIFT) - vr->hpa_base;
+	offset = (pfn << PAGE_SHIFT) - hpa_base;
 	dpa = vr->dpa_base + offset;
 
 	return dpa;
@@ -514,11 +531,11 @@ static int xe_svm_copy(struct page **pages,
 			continue;
 
 		if (!vr && spage) {
-			vr = page_to_vr(spage);
+			vr = xe_page_to_vr(spage);
 			gt = xe_migrate_exec_queue(vr->migrate)->gt;
 			xe = vr->xe;
 		}
-		XE_WARN_ON(spage && page_to_vr(spage) != vr);
+		XE_WARN_ON(spage && xe_page_to_vr(spage) != vr);
 
 		/*
 		 * CPU page and device page valid, capture physical address on
@@ -526,7 +543,7 @@ static int xe_svm_copy(struct page **pages,
 		 * device pages.
 		 */
 		if (pagemap_addr[i].addr && spage) {
-			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
+			__vram_addr = xe_page_to_dpa(spage);
 			if (vram_addr == XE_VRAM_ADDR_INVALID) {
 				vram_addr = __vram_addr;
 				pos = i;
@@ -672,9 +689,11 @@ static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
 	xe_pm_runtime_put(xe);
 }
 
-static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
+static u64 block_offset_to_pfn(struct drm_pagemap *dpagemap, u64 offset)
 {
-	return PHYS_PFN(offset + vr->hpa_base);
+	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
+
+	return PHYS_PFN(offset + xpagemap->hpa_base);
 }
 
 static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
@@ -694,7 +713,8 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
 		struct drm_buddy *buddy = vram_to_buddy(vr);
-		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
+		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
+						    drm_buddy_block_offset(block));
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
@@ -711,6 +731,11 @@ static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
 
+#else
+static int xe_svm_get_pagemaps(struct xe_vm *vm)
+{
+	return 0;
+}
 #endif
 
 static const struct drm_gpusvm_ops gpusvm_ops = {
@@ -725,6 +750,26 @@ static const unsigned long fault_chunk_sizes[] = {
 	SZ_4K,
 };
 
+static void xe_pagemap_put(struct xe_pagemap *xpagemap)
+{
+	drm_pagemap_put(&xpagemap->dpagemap);
+}
+
+static void xe_svm_put_pagemaps(struct xe_vm *vm)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_pagemap *xpagemap = vm->svm.pagemaps[id];
+
+		if (xpagemap)
+			xe_pagemap_put(xpagemap);
+		vm->svm.pagemaps[id] = NULL;
+	}
+}
+
 /**
  * xe_svm_init() - SVM initialize
  * @vm: The VM.
@@ -743,12 +788,21 @@ int xe_svm_init(struct xe_vm *vm)
 		INIT_WORK(&vm->svm.garbage_collector.work,
 			  xe_svm_garbage_collector_work_func);
 
+		err = xe_svm_get_pagemaps(vm);
+		if (err)
+			return err;
+
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
 				      current->mm, 0, vm->size,
 				      xe_modparam.svm_notifier_size * SZ_1M,
 				      &gpusvm_ops, fault_chunk_sizes,
 				      ARRAY_SIZE(fault_chunk_sizes));
 		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
+
+		if (err) {
+			xe_svm_put_pagemaps(vm);
+			return err;
+		}
 	} else {
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
 				      &vm->xe->drm, NULL, 0, 0, 0, NULL,
@@ -768,6 +822,7 @@ void xe_svm_close(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_is_closed(vm));
 	flush_work(&vm->svm.garbage_collector.work);
+	xe_svm_put_pagemaps(vm);
 }
 
 /**
@@ -861,7 +916,8 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      struct mm_struct *mm,
 				      unsigned long timeslice_ms)
 {
-	struct xe_vram_region *vr = container_of(dpagemap->pagemap, typeof(*vr), pagemap);
+	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
+	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
 	struct drm_buddy_block *block;
@@ -1370,11 +1426,6 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
-static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
-{
-	return tile->mem.vram->dpagemap;
-}
-
 /**
  * xe_vma_resolve_pagemap - Resolve the appropriate DRM pagemap for a VMA
  * @vma: Pointer to the xe_vma structure containing memory attributes
@@ -1400,7 +1451,7 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 		return NULL;
 
 	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
-		return IS_DGFX(tile_to_xe(tile)) ? tile_local_pagemap(tile) : NULL;
+		return IS_DGFX(tile_to_xe(tile)) ? xe_tile_local_pagemap(tile) : NULL;
 
 	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
 	return NULL;
@@ -1423,7 +1474,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
-	dpagemap = tile_local_pagemap(tile);
+	dpagemap = xe_tile_local_pagemap(tile);
 	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 				       xe_svm_range_end(range),
 				       range->base.gpusvm->mm,
@@ -1442,7 +1493,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 	dma_addr_t addr;
 
 	if (pgmap_dev == dev) {
-		addr = xe_vram_region_page_to_dpa(page_to_vr(page), page);
+		addr = xe_page_to_dpa(page);
 		prot = XE_INTERCONNECT_VRAM;
 	} else {
 		addr = DMA_MAPPING_ERROR;
@@ -1452,94 +1503,243 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 	return drm_pagemap_addr_encode(addr, prot, order, dir);
 }
 
-static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
-	.device_map = xe_drm_pagemap_device_map,
-	.populate_mm = xe_drm_pagemap_populate_mm,
-};
+static void xe_pagemap_destroy_work(struct work_struct *work)
+{
+	struct xe_pagemap *xpagemap = container_of(work, typeof(*xpagemap), destroy_work);
+	struct dev_pagemap *pagemap = &xpagemap->pagemap;
+	struct drm_device *drm = xpagemap->dpagemap.drm;
+	int idx;
 
-static void xe_devm_release(void *data)
+	/*
+	 * Only unmap / release if devm_ release hasn't run yet.
+	 * Otherwise the devm_ callbacks have already released, or
+	 * will do shortly.
+	 */
+	if (drm_dev_enter(drm, &idx)) {
+		devm_memunmap_pages(drm->dev, pagemap);
+		devm_release_mem_region(drm->dev, pagemap->range.start,
+					pagemap->range.end - pagemap->range.start + 1);
+		drm_dev_exit(idx);
+	}
+	kfree(xpagemap);
+}
+
+static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or_reclaim)
 {
-	struct xe_vram_region *vr = data;
+	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
+	struct xe_device *xe = to_xe_device(dpagemap->drm);
 
-	drm_pagemap_put(vr->dpagemap);
-	vr->dpagemap = NULL;
+	if (from_atomic_or_reclaim)
+		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
+	else
+		xe_pagemap_destroy_work(&xpagemap->destroy_work);
 }
 
+static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
+	.device_map = xe_drm_pagemap_device_map,
+	.populate_mm = xe_drm_pagemap_populate_mm,
+	.destroy = xe_pagemap_destroy,
+};
+
 /**
- * xe_devm_add: Remap and provide memmap backing for device memory
- * @tile: tile that the memory region belongs to
- * @vr: vram memory region to remap
+ * xe_pagemap_create() - Create a struct xe_pagemap object
+ * @xe: The xe device.
+ * @vr: Back-pointer to the struct xe_vram_region.
  *
- * This remap device memory to host physical address space and create
- * struct page to back device memory
+ * Allocate and initialize a struct xe_pagemap. On successful
+ * return, drm_pagemap_put() on the embedded struct drm_pagemap
+ * should be used to unreference.
  *
- * Return: 0 on success standard error code otherwise
+ * Return: Pointer to a struct xe_pagemap if successful. Error pointer
+ * on failure.
  */
-int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram_region *vr)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+	struct device *dev = xe->drm.dev;
+	struct xe_pagemap *xpagemap;
+	struct dev_pagemap *pagemap;
+	struct drm_pagemap *dpagemap;
 	struct resource *res;
 	void *addr;
-	int ret;
+	int err;
+
+	xpagemap = kzalloc(sizeof(*xpagemap), GFP_KERNEL);
+	if (!xpagemap)
+		return ERR_PTR(-ENOMEM);
+
+	pagemap = &xpagemap->pagemap;
+	dpagemap = &xpagemap->dpagemap;
+	INIT_WORK(&xpagemap->destroy_work, xe_pagemap_destroy_work);
+	xpagemap->vr = vr;
+
+	err = drm_pagemap_init(dpagemap, pagemap, &xe->drm, &xe_drm_pagemap_ops);
+	if (err)
+		goto out_no_dpagemap;
 
 	res = devm_request_free_mem_region(dev, &iomem_resource,
 					   vr->usable_size);
 	if (IS_ERR(res)) {
-		ret = PTR_ERR(res);
-		return ret;
+		err = PTR_ERR(res);
+		goto out_err;
 	}
 
-	vr->dpagemap = drm_pagemap_create(&xe->drm, &vr->pagemap,
-					  &xe_drm_pagemap_ops);
-	if (IS_ERR(vr->dpagemap)) {
-		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
-			tile->id, vr->dpagemap);
-		ret = PTR_ERR(vr->dpagemap);
-		goto out_no_dpagemap;
+	pagemap->type = MEMORY_DEVICE_PRIVATE;
+	pagemap->range.start = res->start;
+	pagemap->range.end = res->end;
+	pagemap->nr_range = 1;
+	pagemap->owner = xe_svm_devm_owner(xe);
+	pagemap->ops = drm_pagemap_pagemap_ops_get();
+	addr = devm_memremap_pages(dev, pagemap);
+	if (IS_ERR(addr)) {
+		err = PTR_ERR(addr);
+		devm_release_mem_region(dev, res->start, res->end - res->start + 1);
+		goto out_err;
 	}
-	ret = devm_add_action_or_reset(dev, xe_devm_release, vr);
-	if (ret)
-		goto out_no_dpagemap;
+	xpagemap->hpa_base = res->start;
+	return xpagemap;
 
-	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	vr->pagemap.range.start = res->start;
-	vr->pagemap.range.end = res->end;
-	vr->pagemap.nr_range = 1;
-	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
-	vr->pagemap.owner = xe_svm_devm_owner(xe);
-	addr = devm_memremap_pages(dev, &vr->pagemap);
-	if (IS_ERR(addr)) {
-		ret = PTR_ERR(addr);
-		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
-			tile->id, ERR_PTR(ret));
-		goto out_failed_memremap;
+out_err:
+	drm_pagemap_put(dpagemap);
+	return ERR_PTR(err);
+
+out_no_dpagemap:
+	kfree(xpagemap);
+	return ERR_PTR(err);
+}
+
+/**
+ * xe_pagemap_find_or_create() - Find or create a struct xe_pagemap
+ * @xe: The xe device.
+ * @cache: The struct xe_pagemap_cache.
+ * @vr: The VRAM region.
+ *
+ * Check if there is an already used xe_pagemap for this tile, and in that case,
+ * return it.
+ * If not, check if there is a cached xe_pagemap for this tile, and in that case,
+ * cancel its destruction, re-initialize it and return it.
+ * Finally if there is no cached or already used pagemap, create one and
+ * register it in the tile's pagemap cache.
+ *
+ * Note that this function is typically called from within an IOCTL, and waits are
+ * therefore carried out interruptible if possible.
+ *
+ * Return: A pointer to a struct xe_pagemap if successful, Error pointer on failure.
+ */
+static struct xe_pagemap *
+xe_pagemap_find_or_create(struct xe_device *xe, struct drm_pagemap_cache *cache,
+			  struct xe_vram_region *vr)
+{
+	struct drm_pagemap *dpagemap;
+	struct xe_pagemap *xpagemap;
+	int err;
+
+	err = drm_pagemap_cache_lock_lookup(cache);
+	if (err)
+		return ERR_PTR(err);
+
+	dpagemap = drm_pagemap_get_from_cache(cache);
+	if (IS_ERR(dpagemap)) {
+		xpagemap = ERR_CAST(dpagemap);
+	} else if (!dpagemap) {
+		xpagemap = xe_pagemap_create(xe, vr);
+		if (IS_ERR(xpagemap))
+			goto out_unlock;
+		drm_pagemap_cache_set_pagemap(cache, &xpagemap->dpagemap);
+	} else {
+		xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
+	}
+
+out_unlock:
+	drm_pagemap_cache_unlock_lookup(cache);
+	return xpagemap;
+}
+
+static int xe_svm_get_pagemaps(struct xe_vm *vm)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_pagemap *xpagemap;
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_vram_region *vr;
+
+		if (!((BIT(id) << 1) & xe->info.mem_region_mask))
+			continue;
+
+		vr = xe_tile_to_vr(tile);
+		xpagemap = xe_pagemap_find_or_create(xe, vr->dpagemap_cache, vr);
+		if (IS_ERR(xpagemap))
+			break;
+		vm->svm.pagemaps[id] = xpagemap;
+	}
+
+	if (IS_ERR(xpagemap)) {
+		xe_svm_put_pagemaps(vm);
+		return PTR_ERR(xpagemap);
 	}
-	vr->hpa_base = res->start;
 
-	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
-		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
 	return 0;
+}
 
-out_failed_memremap:
-	drm_pagemap_put(vr->dpagemap);
-out_no_dpagemap:
-	devm_release_mem_region(dev, res->start, resource_size(res));
-	return ret;
+/**
+ * xe_pagemap_shrinker_create() - Create a drm_pagemap shrinker
+ * @xe: The xe device
+ *
+ * Create a drm_pagemap shrinker and register with the xe device.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int xe_pagemap_shrinker_create(struct xe_device *xe)
+{
+	xe->usm.dpagemap_shrinker = drm_pagemap_shrinker_create_devm(&xe->drm);
+	return PTR_ERR_OR_ZERO(xe->usm.dpagemap_shrinker);
 }
+
+/**
+ * xe_pagemap_cache_create() - Create a drm_pagemap cache
+ * @tile: The tile to register the cache with
+ *
+ * Create a drm_pagemap cache and register with the tile.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int xe_pagemap_cache_create(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+
+	if (IS_DGFX(xe)) {
+		struct drm_pagemap_cache *cache =
+			drm_pagemap_cache_create_devm(xe->usm.dpagemap_shrinker);
+
+		if (IS_ERR(cache))
+			return PTR_ERR(cache);
+
+		tile->mem.vram->dpagemap_cache = cache;
+	}
+
+	return 0;
+}
+
 #else
-int xe_svm_alloc_vram(struct xe_tile *tile,
-		      struct xe_svm_range *range,
-		      const struct drm_gpusvm_ctx *ctx)
+
+int xe_pagemap_shrinker_create(struct xe_device *xe)
 {
-	return -EOPNOTSUPP;
+	return 0;
 }
 
-int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+int xe_pagemap_cache_create(struct xe_tile *tile)
 {
 	return 0;
 }
 
+int xe_svm_alloc_vram(struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
+{
+	return -EOPNOTSUPP;
+}
+
 struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
 {
 	return NULL;
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index fa757dd07954..8a49ff17ef0c 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -27,8 +27,13 @@ static inline void *xe_svm_devm_owner(struct xe_device *xe)
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
+struct drm_device;
+struct drm_file;
+
 struct xe_bo;
 struct xe_gt;
+struct xe_device;
+struct xe_vram_region;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
@@ -55,6 +60,22 @@ struct xe_svm_range {
 	u8 tile_invalidated;
 };
 
+/**
+ * struct xe_pagemap - Manages xe device_private memory for SVM.
+ * @pagemap: The struct dev_pagemap providing the struct pages.
+ * @dpagemap: The drm_pagemap managing allocation and migration.
+ * @destroy_work: Handles asnynchronous destruction and caching.
+ * @hpa_base: The host physical address base for the managemd memory.
+ * @vr: Backpointer to the xe_vram region.
+ */
+struct xe_pagemap {
+	struct dev_pagemap pagemap;
+	struct drm_pagemap dpagemap;
+	struct work_struct destroy_work;
+	resource_size_t hpa_base;
+	struct xe_vram_region *vr;
+};
+
 /**
  * xe_svm_range_pages_valid() - SVM range pages valid
  * @range: SVM range
@@ -171,6 +192,10 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
 
 void xe_svm_flush(struct xe_vm *vm);
 
+int xe_pagemap_shrinker_create(struct xe_device *xe);
+
+int xe_pagemap_cache_create(struct xe_tile *tile);
+
 #else
 #include <linux/interval_tree.h>
 #include "xe_vm.h"
@@ -179,7 +204,7 @@ struct drm_pagemap_addr;
 struct drm_gpusvm_ctx;
 struct drm_gpusvm_range;
 struct xe_bo;
-struct xe_gt;
+struct xe_device;
 struct xe_vm;
 struct xe_vma;
 struct xe_tile;
@@ -346,6 +371,17 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 static inline void xe_svm_flush(struct xe_vm *vm)
 {
 }
+
+static inline int xe_pagemap_shrinker_create(struct xe_device *xe)
+{
+	return 0;
+}
+
+static inline int xe_pagemap_cache_create(struct xe_tile *tile)
+{
+	return 0;
+}
+
 #define xe_svm_range_has_dma_mapping(...) false
 #endif /* CONFIG_DRM_XE_GPUSVM */
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 4f4f9a5c43af..051b191377df 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -6,6 +6,7 @@
 #include <linux/fault-inject.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_pagemap_util.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -180,17 +181,19 @@ ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
+	int err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
-	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, tile->mem.vram);
+	err = xe_pagemap_cache_create(tile);
+	if (err)
+		return err;
 
 	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
-		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
-
+		err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
 		if (err)
 			return err;
+
 		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
 	}
 
@@ -215,3 +218,26 @@ void xe_tile_migrate_wait(struct xe_tile *tile)
 {
 	xe_migrate_wait(tile->migrate);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+/**
+ * xe_tile_local_pagemap() - Return a pointer to the tile's local drm_pagemap if any
+ * @tile: The tile.
+ *
+ * Return: A pointer to the tile's local drm_pagemap, or NULL if local pagemap
+ * support has been compiled out.
+ */
+struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
+{
+	struct drm_pagemap *dpagemap =
+		drm_pagemap_get_from_cache_if_active(xe_tile_to_vr(tile)->dpagemap_cache);
+
+	if (dpagemap) {
+		xe_assert(tile_to_xe(tile), kref_read(&dpagemap->ref) >= 2);
+		drm_pagemap_put(dpagemap);
+	}
+
+	return dpagemap;
+}
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index dceb6297aa01..734132eddda5 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -8,6 +8,7 @@
 
 #include "xe_device_types.h"
 
+struct xe_pagemap;
 struct xe_tile;
 
 int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
@@ -23,4 +24,24 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
 	return tile->id == 0;
 }
 
+/**
+ * xe_tile_to_vr() - Return the struct xe_vram_region pointer from a
+ * struct xe_tile pointer
+ * @tile: Pointer to the struct xe_tile.
+ *
+ * Return: Pointer to the struct xe_vram_region embedded in *@tile.
+ */
+static inline struct xe_vram_region *xe_tile_to_vr(struct xe_tile *tile)
+{
+	return tile->mem.vram;
+}
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile);
+#else
+static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
+{
+	return NULL;
+}
+#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index d6e2a0fdd4b3..9f0d8bf1af4f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -191,6 +191,7 @@ struct xe_vm {
 			 */
 			struct work_struct work;
 		} garbage_collector;
+		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
 	} svm;
 
 	struct xe_device *xe;
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index c0d2c5ee8c10..646e3c12ae9f 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -66,19 +66,8 @@ struct xe_vram_region {
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 	/** @migrate: Back pointer to migrate */
 	struct xe_migrate *migrate;
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap *dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
+	/** @dpagemap_cache: drm_pagemap cache. */
+	struct drm_pagemap_cache *dpagemap_cache;
 #endif
 };
 
-- 
2.51.0

