Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7F5CCF96E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD20E10EF28;
	Fri, 19 Dec 2025 11:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAEJjyUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A5510EF29;
 Fri, 19 Dec 2025 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144053; x=1797680053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k68QeXX7IyNIPccbjSIbhE0jXfJFWCyGJ9BJ7SPL0Jo=;
 b=aAEJjyUQ6KEwgSjbqJVCx/8VH3mhNPrCD5W/EBTujgHRavMUK3icx6k8
 0Jy0vtQXKHgX+lC3wSSRyWK8bNcocEaEhSdBp6N9ui3xWleb6mDZ5wlE6
 9s2b4M7WGXu/sSRNubJxRjlXpopEjgR9cVMb9QYoBZh4Jtgyxlf9nLIQA
 mIBNOBESzrWtlG7NQrK+gFN66frX/pE9cYrX1UCVzgBzEu6tfjsCWypjT
 1KAYstI5kg51UTDo3W0LzpI0p2h88tnQVlMxqSITSVyruyw1g/BnRIy5L
 bsuLlJ0ARh1S06Ul7sIju+C5XQKkebpnIPbFIebOXz7nOktIoFLuLFlX0 g==;
X-CSE-ConnectionGUID: 4gcI5Y5AT8uGhqkVWAZOWw==
X-CSE-MsgGUID: hW8VFg1mQL2hrwmejQ12hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224478"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224478"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:13 -0800
X-CSE-ConnectionGUID: pPffkl+8RBGA07D1JG8XzQ==
X-CSE-MsgGUID: 3WbFty1bTpSv5Ktp4X8H+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005590"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:08 -0800
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
Subject: [PATCH v6 03/24] drm/pagemap,
 drm/xe: Ensure that the devmem allocation is idle before use
Date: Fri, 19 Dec 2025 12:32:59 +0100
Message-ID: <20251219113320.183860-4-thomas.hellstrom@linux.intel.com>
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
v6:
- Pipeline the pre_migrate_fence dependency (Matt Brost)

Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc functions")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c   | 17 +++++++++---
 drivers/gpu/drm/xe/xe_migrate.c | 25 +++++++++++++----
 drivers/gpu/drm/xe/xe_migrate.h |  6 ++--
 drivers/gpu/drm/xe/xe_svm.c     | 49 +++++++++++++++++++++++++--------
 include/drm/drm_pagemap.h       | 17 ++++++++++--
 5 files changed, 88 insertions(+), 26 deletions(-)

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
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f3b66b55acfb..284b575346ee 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2113,6 +2113,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 					 unsigned long sram_offset,
 					 struct drm_pagemap_addr *sram_addr,
 					 u64 vram_addr,
+					 struct dma_fence *deps,
 					 const enum xe_migrate_copy_dir dir)
 {
 	struct xe_gt *gt = m->tile->primary_gt;
@@ -2201,6 +2202,14 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 
 	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
 
+	if (deps && !dma_fence_is_signaled(deps)) {
+		dma_fence_get(deps);
+		err = drm_sched_job_add_dependency(&job->drm, deps);
+		if (err)
+			dma_fence_wait(deps, false);
+		err = 0;
+	}
+
 	mutex_lock(&m->job_mutex);
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
@@ -2226,6 +2235,8 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
  * @npages: Number of pages to migrate.
  * @src_addr: Array of DMA information (source of migrate)
  * @dst_addr: Device physical address of VRAM (destination of migrate)
+ * @deps: struct dma_fence representing the dependencies that need
+ * to be signaled before migration.
  *
  * Copy from an array dma addresses to a VRAM device physical address
  *
@@ -2235,10 +2246,11 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
 				     struct drm_pagemap_addr *src_addr,
-				     u64 dst_addr)
+				     u64 dst_addr,
+				     struct dma_fence *deps)
 {
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
-			       XE_MIGRATE_COPY_TO_VRAM);
+			       deps, XE_MIGRATE_COPY_TO_VRAM);
 }
 
 /**
@@ -2247,6 +2259,8 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
  * @npages: Number of pages to migrate.
  * @src_addr: Device physical address of VRAM (source of migrate)
  * @dst_addr: Array of DMA information (destination of migrate)
+ * @deps: struct dma_fence representing the dependencies that need
+ * to be signaled before migration.
  *
  * Copy from a VRAM device physical address to an array dma addresses
  *
@@ -2256,10 +2270,11 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       unsigned long npages,
 				       u64 src_addr,
-				       struct drm_pagemap_addr *dst_addr)
+				       struct drm_pagemap_addr *dst_addr,
+				       struct dma_fence *deps)
 {
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
-			       XE_MIGRATE_COPY_TO_SRAM);
+			       deps, XE_MIGRATE_COPY_TO_SRAM);
 }
 
 static void xe_migrate_dma_unmap(struct xe_device *xe,
@@ -2435,7 +2450,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		__fence = xe_migrate_vram(m, current_bytes,
 					  (unsigned long)buf & ~PAGE_MASK,
 					  &pagemap_addr[current_page],
-					  vram_addr, write ?
+					  vram_addr, NULL, write ?
 					  XE_MIGRATE_COPY_TO_VRAM :
 					  XE_MIGRATE_COPY_TO_SRAM);
 		if (IS_ERR(__fence)) {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 464c05dde1ba..1522afb37dcf 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -116,12 +116,14 @@ int xe_migrate_init(struct xe_migrate *m);
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
 				     struct drm_pagemap_addr *src_addr,
-				     u64 dst_addr);
+				     u64 dst_addr,
+				     struct dma_fence *deps);
 
 struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       unsigned long npages,
 				       u64 src_addr,
-				       struct drm_pagemap_addr *dst_addr);
+				       struct drm_pagemap_addr *dst_addr,
+				       struct dma_fence *deps);
 
 struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct xe_bo *src_bo,
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index bab8e6cbe53d..14a027b3ee6b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -472,7 +472,8 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
 
 static int xe_svm_copy(struct page **pages,
 		       struct drm_pagemap_addr *pagemap_addr,
-		       unsigned long npages, const enum xe_svm_copy_dir dir)
+		       unsigned long npages, const enum xe_svm_copy_dir dir,
+		       struct dma_fence *pre_migrate_fence)
 {
 	struct xe_vram_region *vr = NULL;
 	struct xe_gt *gt = NULL;
@@ -561,7 +562,8 @@ static int xe_svm_copy(struct page **pages,
 					__fence = xe_migrate_from_vram(vr->migrate,
 								       i - pos + incr,
 								       vram_addr,
-								       &pagemap_addr[pos]);
+								       &pagemap_addr[pos],
+								       pre_migrate_fence);
 				} else {
 					vm_dbg(&xe->drm,
 					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
@@ -570,13 +572,14 @@ static int xe_svm_copy(struct page **pages,
 					__fence = xe_migrate_to_vram(vr->migrate,
 								     i - pos + incr,
 								     &pagemap_addr[pos],
-								     vram_addr);
+								     vram_addr,
+								     pre_migrate_fence);
 				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
 				}
-
+				pre_migrate_fence = NULL;
 				dma_fence_put(fence);
 				fence = __fence;
 			}
@@ -599,20 +602,22 @@ static int xe_svm_copy(struct page **pages,
 					       vram_addr, (u64)pagemap_addr[pos].addr, 1);
 					__fence = xe_migrate_from_vram(vr->migrate, 1,
 								       vram_addr,
-								       &pagemap_addr[pos]);
+								       &pagemap_addr[pos],
+								       pre_migrate_fence);
 				} else {
 					vm_dbg(&xe->drm,
 					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
 					       (u64)pagemap_addr[pos].addr, vram_addr, 1);
 					__fence = xe_migrate_to_vram(vr->migrate, 1,
 								     &pagemap_addr[pos],
-								     vram_addr);
+								     vram_addr,
+								     pre_migrate_fence);
 				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
 				}
-
+				pre_migrate_fence = NULL;
 				dma_fence_put(fence);
 				fence = __fence;
 			}
@@ -625,6 +630,8 @@ static int xe_svm_copy(struct page **pages,
 		dma_fence_wait(fence, false);
 		dma_fence_put(fence);
 	}
+	if (pre_migrate_fence)
+		dma_fence_wait(pre_migrate_fence, false);
 
 	/*
 	 * XXX: We can't derive the GT here (or anywhere in this functions, but
@@ -641,16 +648,20 @@ static int xe_svm_copy(struct page **pages,
 
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
@@ -663,6 +674,7 @@ static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct xe_device *xe = xe_bo_device(bo);
 
+	dma_fence_put(devmem_allocation->pre_migrate_fence);
 	xe_bo_put_async(bo);
 	xe_pm_runtime_put(xe);
 }
@@ -857,6 +869,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      unsigned long timeslice_ms)
 {
 	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
+	struct dma_fence *pre_migrate_fence = NULL;
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
 	struct drm_buddy_block *block;
@@ -883,8 +896,20 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
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

