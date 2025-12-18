Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C466CCCB6E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824EF10EA31;
	Thu, 18 Dec 2025 16:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2B3cu8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD72810EA30;
 Thu, 18 Dec 2025 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766074905; x=1797610905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TI0IBUWHl4sgMjgjK1bipBIWSBWt7zI9VY8VtkRgfyI=;
 b=G2B3cu8g3w03ToL0ccoZfvYbfgEnMZLFNM+t9/rOqgEuEsz/eM8vnNcP
 LxjI1VYCrMjnoCXXdaRaJU22BT/IofnXaoS6ua70T1qKqlcDvrRvlkdkj
 Y+rxWjAivK8x/hbqkN37I5v7hF78uQXpCjF0VeZPB7xoHDfS0D1gicomR
 wUH42C1XM7q9oaMul+q30/vIwKhgWEZ7IiBmGcUNv7hWSu4px6g+IPcwf
 QSWeoboidjezoOjLqyQoMCQG5Tfgkh3+NtUaDWmA8OpOmyZi28PC6Rj3e
 yd9g2KkY9XhOtPRj01GWTVVhkcekrKDqKS0WwRtFRnoZiT8v74ifBXaWN w==;
X-CSE-ConnectionGUID: owQzMD9wSTqfvw0vJxuqOg==
X-CSE-MsgGUID: qT4CT7s+T523Ig2+v2t5DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70607560"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="70607560"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:21:45 -0800
X-CSE-ConnectionGUID: kf1rfk4vSqOwxiWccZwZjg==
X-CSE-MsgGUID: MpydGRfnSYeDUEqcqpHAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203705560"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.93])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:21:41 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v5 03/24] drm/pagemap,
 drm/xe: Ensure that the devmem allocation is idle before use
Date: Thu, 18 Dec 2025 17:20:40 +0100
Message-ID: <20251218162101.605379-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
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

In situations where no system memory is migrated to devmem, and in
upcoming patches where another GPU is performing the migration to
the newly allocated devmem buffer, there is nothing to ensure any
ongoing clear to the devmem allocation or async eviction from the
devmem allocation is complete.

Address that by passing a struct dma_fence down to the copy
functions, and ensure it is waited for before migration is marked
complete.

v3:
- New patch.
v4:
- Update the logic used for determining when to wait for the
  pre_migrate_fence.
- Update the logic used for determining when to warn for the
  pre_migrate_fence since the scheduler fences apparently
  can signal out-of-order.
v5:
- Fix a UAF (CI)
- Remove references to source P2P migration (Himal)
- Put the pre_migrate_fence after migration.

Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc functions")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 17 ++++++---
 drivers/gpu/drm/xe/xe_svm.c   | 65 ++++++++++++++++++++++++++++++-----
 include/drm/drm_pagemap.h     | 17 +++++++--
 3 files changed, 83 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 4cf8f54e5a27..ac3832f85190 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -3,6 +3,7 @@
  * Copyright © 2024-2025 Intel Corporation
  */
 
+#include <linux/dma-fence.h>
 #include <linux/dma-mapping.h>
 #include <linux/migrate.h>
 #include <linux/pagemap.h>
@@ -408,10 +409,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		drm_pagemap_get_devmem_page(page, zdd);
 	}
 
-	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
+	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
+				  devmem_allocation->pre_migrate_fence);
 	if (err)
 		goto err_finalize;
 
+	dma_fence_put(devmem_allocation->pre_migrate_fence);
+	devmem_allocation->pre_migrate_fence = NULL;
+
 	/* Upon success bind devmem allocation to range and zdd */
 	devmem_allocation->timeslice_expiration = get_jiffies_64() +
 		msecs_to_jiffies(timeslice_ms);
@@ -596,7 +601,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	for (i = 0; i < npages; ++i)
 		pages[i] = migrate_pfn_to_page(src[i]);
 
-	err = ops->copy_to_ram(pages, pagemap_addr, npages);
+	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
 	if (err)
 		goto err_finalize;
 
@@ -719,7 +724,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	for (i = 0; i < npages; ++i)
 		pages[i] = migrate_pfn_to_page(migrate.src[i]);
 
-	err = ops->copy_to_ram(pages, pagemap_addr, npages);
+	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
 	if (err)
 		goto err_finalize;
 
@@ -800,11 +805,14 @@ EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
  * @ops: Pointer to the operations structure for GPU SVM device memory
  * @dpagemap: The struct drm_pagemap we're allocating from.
  * @size: Size of device memory allocation
+ * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
+ * (May be NULL).
  */
 void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 			     struct device *dev, struct mm_struct *mm,
 			     const struct drm_pagemap_devmem_ops *ops,
-			     struct drm_pagemap *dpagemap, size_t size)
+			     struct drm_pagemap *dpagemap, size_t size,
+			     struct dma_fence *pre_migrate_fence)
 {
 	init_completion(&devmem_allocation->detached);
 	devmem_allocation->dev = dev;
@@ -812,6 +820,7 @@ void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 	devmem_allocation->ops = ops;
 	devmem_allocation->dpagemap = dpagemap;
 	devmem_allocation->size = size;
+	devmem_allocation->pre_migrate_fence = pre_migrate_fence;
 }
 EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index bab8e6cbe53d..b806a1fce188 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -472,11 +472,12 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
 
 static int xe_svm_copy(struct page **pages,
 		       struct drm_pagemap_addr *pagemap_addr,
-		       unsigned long npages, const enum xe_svm_copy_dir dir)
+		       unsigned long npages, const enum xe_svm_copy_dir dir,
+		       struct dma_fence *pre_migrate_fence)
 {
 	struct xe_vram_region *vr = NULL;
 	struct xe_gt *gt = NULL;
-	struct xe_device *xe;
+	struct xe_device *xe = NULL;
 	struct dma_fence *fence = NULL;
 	unsigned long i;
 #define XE_VRAM_ADDR_INVALID	~0x0ull
@@ -485,6 +486,16 @@ static int xe_svm_copy(struct page **pages,
 	bool sram = dir == XE_SVM_COPY_TO_SRAM;
 	ktime_t start = xe_gt_stats_ktime_get();
 
+	if (pre_migrate_fence && dma_fence_is_container(pre_migrate_fence)) {
+		/*
+		 * This would typically be a composite fence operation on the destination memory.
+		 * Ensure that the other GPU operation on the destination is complete.
+		 */
+		err = dma_fence_wait(pre_migrate_fence, true);
+		if (err)
+			return err;
+	}
+
 	/*
 	 * This flow is complex: it locates physically contiguous device pages,
 	 * derives the starting physical address, and performs a single GPU copy
@@ -621,10 +632,28 @@ static int xe_svm_copy(struct page **pages,
 
 err_out:
 	/* Wait for all copies to complete */
-	if (fence) {
+	if (fence)
 		dma_fence_wait(fence, false);
-		dma_fence_put(fence);
+
+	/*
+	 * If migrating to devmem, we should have pipelined the migration behind
+	 * the pre_migrate_fence. Verify that this is indeed likely. If we
+	 * didn't perform any copying, just wait for the pre_migrate_fence.
+	 */
+	if (pre_migrate_fence && !dma_fence_is_signaled(pre_migrate_fence)) {
+		if (xe && fence &&
+		    (pre_migrate_fence->context != fence->context ||
+		     dma_fence_is_later(pre_migrate_fence, fence))) {
+			drm_WARN(&xe->drm, true, "Unsignaled pre-migrate fence");
+			drm_warn(&xe->drm, "fence contexts: %llu %llu. container %d\n",
+				 (unsigned long long)fence->context,
+				 (unsigned long long)pre_migrate_fence->context,
+				 dma_fence_is_container(pre_migrate_fence));
+		}
+
+		dma_fence_wait(pre_migrate_fence, false);
 	}
+	dma_fence_put(fence);
 
 	/*
 	 * XXX: We can't derive the GT here (or anywhere in this functions, but
@@ -641,16 +670,20 @@ static int xe_svm_copy(struct page **pages,
 
 static int xe_svm_copy_to_devmem(struct page **pages,
 				 struct drm_pagemap_addr *pagemap_addr,
-				 unsigned long npages)
+				 unsigned long npages,
+				 struct dma_fence *pre_migrate_fence)
 {
-	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM);
+	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM,
+			   pre_migrate_fence);
 }
 
 static int xe_svm_copy_to_ram(struct page **pages,
 			      struct drm_pagemap_addr *pagemap_addr,
-			      unsigned long npages)
+			      unsigned long npages,
+			      struct dma_fence *pre_migrate_fence)
 {
-	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM);
+	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM,
+			   pre_migrate_fence);
 }
 
 static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
@@ -663,6 +696,7 @@ static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct xe_device *xe = xe_bo_device(bo);
 
+	dma_fence_put(devmem_allocation->pre_migrate_fence);
 	xe_bo_put_async(bo);
 	xe_pm_runtime_put(xe);
 }
@@ -857,6 +891,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      unsigned long timeslice_ms)
 {
 	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
+	struct dma_fence *pre_migrate_fence = NULL;
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
 	struct drm_buddy_block *block;
@@ -883,8 +918,20 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			break;
 		}
 
+		/* Ensure that any clearing or async eviction will complete before migration. */
+		if (!dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL)) {
+			err = dma_resv_get_singleton(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+						     &pre_migrate_fence);
+			if (err)
+				dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+						      false, MAX_SCHEDULE_TIMEOUT);
+			else if (pre_migrate_fence)
+				dma_fence_enable_sw_signaling(pre_migrate_fence);
+		}
+
 		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
-					&dpagemap_devmem_ops, dpagemap, end - start);
+					&dpagemap_devmem_ops, dpagemap, end - start,
+					pre_migrate_fence);
 
 		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
 		list_for_each_entry(block, blocks, link)
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index f6e7e234c089..70a7991f784f 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -8,6 +8,7 @@
 
 #define NR_PAGES(order) (1U << (order))
 
+struct dma_fence;
 struct drm_pagemap;
 struct drm_pagemap_zdd;
 struct device;
@@ -174,6 +175,8 @@ struct drm_pagemap_devmem_ops {
 	 * @pages: Pointer to array of device memory pages (destination)
 	 * @pagemap_addr: Pointer to array of DMA information (source)
 	 * @npages: Number of pages to copy
+	 * @pre_migrate_fence: dma-fence to wait for before migration start.
+	 * May be NULL.
 	 *
 	 * Copy pages to device memory. If the order of a @pagemap_addr entry
 	 * is greater than 0, the entry is populated but subsequent entries
@@ -183,13 +186,16 @@ struct drm_pagemap_devmem_ops {
 	 */
 	int (*copy_to_devmem)(struct page **pages,
 			      struct drm_pagemap_addr *pagemap_addr,
-			      unsigned long npages);
+			      unsigned long npages,
+			      struct dma_fence *pre_migrate_fence);
 
 	/**
 	 * @copy_to_ram: Copy to system RAM (required for migration)
 	 * @pages: Pointer to array of device memory pages (source)
 	 * @pagemap_addr: Pointer to array of DMA information (destination)
 	 * @npages: Number of pages to copy
+	 * @pre_migrate_fence: dma-fence to wait for before migration start.
+	 * May be NULL.
 	 *
 	 * Copy pages to system RAM. If the order of a @pagemap_addr entry
 	 * is greater than 0, the entry is populated but subsequent entries
@@ -199,7 +205,8 @@ struct drm_pagemap_devmem_ops {
 	 */
 	int (*copy_to_ram)(struct page **pages,
 			   struct drm_pagemap_addr *pagemap_addr,
-			   unsigned long npages);
+			   unsigned long npages,
+			   struct dma_fence *pre_migrate_fence);
 };
 
 /**
@@ -212,6 +219,8 @@ struct drm_pagemap_devmem_ops {
  * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
  * @size: Size of device memory allocation
  * @timeslice_expiration: Timeslice expiration in jiffies
+ * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
+ * (May be NULL).
  */
 struct drm_pagemap_devmem {
 	struct device *dev;
@@ -221,6 +230,7 @@ struct drm_pagemap_devmem {
 	struct drm_pagemap *dpagemap;
 	size_t size;
 	u64 timeslice_expiration;
+	struct dma_fence *pre_migrate_fence;
 };
 
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
@@ -238,7 +248,8 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
 void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 			     struct device *dev, struct mm_struct *mm,
 			     const struct drm_pagemap_devmem_ops *ops,
-			     struct drm_pagemap *dpagemap, size_t size);
+			     struct drm_pagemap *dpagemap, size_t size,
+			     struct dma_fence *pre_migrate_fence);
 
 int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			    unsigned long start, unsigned long end,
-- 
2.51.1

