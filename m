Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65602A33546
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC7510E9EF;
	Thu, 13 Feb 2025 02:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2PYR4fB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2F010E9D6;
 Thu, 13 Feb 2025 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412620; x=1770948620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rNkNJYCzV+D20etdLJTHUwXk3JI7WBaLBpD5haKksA8=;
 b=P2PYR4fBD4MeAL0mlFKQmShOirhL64AYGX0u/ukgzUBDKIDJFveDlD06
 XKpV/DycmaVqmY/omeqJWzz8tArUaaQoGXOQkPV5/3LRb757FIvCpPhwA
 JR4P1WRGCKVRUGapRKZB5aMl80T1zj1koiKOFxhPlm2iWPbY+QxjtKd1x
 ltqpOwl70XOVUR/I5E0YG7C6Xs7N1/1WqvCR1bv+DPMffIWn7o2M98Qas
 OzkBzGeTV+ijTLbNgaq8CL8hoBXyvSz8Pm4mLN3JiNPSwGVCqGbxGUeab
 HxflC2C9TRrTOmVEmkaS7SwmIyPxek0q8nPYuDz9gUyG5mBEtzkIdmmaX A==;
X-CSE-ConnectionGUID: Gi9T5fXOQfyTlqgG2Zu5Iw==
X-CSE-MsgGUID: R0dMpoMFSnOtW4BBuZewXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456046"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456046"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: pYUpo20tQDK8iNOH34qJnA==
X-CSE-MsgGUID: 5DJEUiLPSqOdWDijXscW4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945105"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 24/32] drm/xe: Add GPUSVM device memory copy vfunc functions
Date: Wed, 12 Feb 2025 18:11:04 -0800
Message-Id: <20250213021112.1228481-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Add GPUSVM device memory copy vfunc functions and connect to migration
layer. Used for device memory migration.

v2:
 - Allow NULL device pages in xe_svm_copy
 - Use new drm_gpusvm_devmem_ops
v3:
 - Prefix defines with XE_ (Thomas)
 - Change copy chunk size to 8M
 - Add a bunch of comments to xe_svm_copy to clarify behavior (Thomas)
 - Better commit message (Thomas)
v5:
 - s/xe_mem_region/xe_vram_region (Rebase)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 152 ++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 5746f0342906..d3a4ed693508 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_gt_tlb_invalidation.h"
+#include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_vm.h"
@@ -319,6 +320,157 @@ static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 	return dpa;
 }
 
+enum xe_svm_copy_dir {
+	XE_SVM_COPY_TO_VRAM,
+	XE_SVM_COPY_TO_SRAM,
+};
+
+static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
+		       unsigned long npages, const enum xe_svm_copy_dir dir)
+{
+	struct xe_vram_region *vr = NULL;
+	struct xe_tile *tile;
+	struct dma_fence *fence = NULL;
+	unsigned long i;
+#define XE_VRAM_ADDR_INVALID	~0x0ull
+	u64 vram_addr = XE_VRAM_ADDR_INVALID;
+	int err = 0, pos = 0;
+	bool sram = dir == XE_SVM_COPY_TO_SRAM;
+
+	/*
+	 * This flow is complex: it locates physically contiguous device pages,
+	 * derives the starting physical address, and performs a single GPU copy
+	 * to for every 8M chunk in a DMA address array. Both device pages and
+	 * DMA addresses may be sparsely populated. If either is NULL, a copy is
+	 * triggered based on the current search state. The last GPU copy is
+	 * waited on to ensure all copies are complete.
+	 */
+
+	for (i = 0; i < npages; ++i) {
+		struct page *spage = pages[i];
+		struct dma_fence *__fence;
+		u64 __vram_addr;
+		bool match = false, chunk, last;
+
+#define XE_MIGRATE_CHUNK_SIZE	SZ_8M
+		chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
+		last = (i + 1) == npages;
+
+		/* No CPU page and no device pages queue'd to copy */
+		if (!dma_addr[i] && vram_addr == XE_VRAM_ADDR_INVALID)
+			continue;
+
+		if (!vr && spage) {
+			vr = page_to_vr(spage);
+			tile = vr_to_tile(vr);
+		}
+		XE_WARN_ON(spage && page_to_vr(spage) != vr);
+
+		/*
+		 * CPU page and device page valid, capture physical address on
+		 * first device page, check if physical contiguous on subsequent
+		 * device pages.
+		 */
+		if (dma_addr[i] && spage) {
+			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
+			if (vram_addr == XE_VRAM_ADDR_INVALID) {
+				vram_addr = __vram_addr;
+				pos = i;
+			}
+
+			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
+		}
+
+		/*
+		 * Mismatched physical address, 8M copy chunk, or last page -
+		 * trigger a copy.
+		 */
+		if (!match || chunk || last) {
+			/*
+			 * Extra page for first copy if last page and matching
+			 * physical address.
+			 */
+			int incr = (match && last) ? 1 : 0;
+
+			if (vram_addr != XE_VRAM_ADDR_INVALID) {
+				if (sram)
+					__fence = xe_migrate_from_vram(tile->migrate,
+								       i - pos + incr,
+								       vram_addr,
+								       dma_addr + pos);
+				else
+					__fence = xe_migrate_to_vram(tile->migrate,
+								     i - pos + incr,
+								     dma_addr + pos,
+								     vram_addr);
+				if (IS_ERR(__fence)) {
+					err = PTR_ERR(__fence);
+					goto err_out;
+				}
+
+				dma_fence_put(fence);
+				fence = __fence;
+			}
+
+			/* Setup physical address of next device page */
+			if (dma_addr[i] && spage) {
+				vram_addr = __vram_addr;
+				pos = i;
+			} else {
+				vram_addr = XE_VRAM_ADDR_INVALID;
+			}
+
+			/* Extra mismatched device page, copy it */
+			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
+				if (sram)
+					__fence = xe_migrate_from_vram(tile->migrate, 1,
+								       vram_addr,
+								       dma_addr + pos);
+				else
+					__fence = xe_migrate_to_vram(tile->migrate, 1,
+								     dma_addr + pos,
+								     vram_addr);
+				if (IS_ERR(__fence)) {
+					err = PTR_ERR(__fence);
+					goto err_out;
+				}
+
+				dma_fence_put(fence);
+				fence = __fence;
+			}
+		}
+	}
+
+err_out:
+	/* Wait for all copies to complete */
+	if (fence) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
+
+	return err;
+#undef XE_MIGRATE_CHUNK_SIZE
+#undef XE_VRAM_ADDR_INVALID
+}
+
+static int xe_svm_copy_to_devmem(struct page **pages, dma_addr_t *dma_addr,
+				 unsigned long npages)
+{
+	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_VRAM);
+}
+
+static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
+			      unsigned long npages)
+{
+	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
+}
+
+__maybe_unused
+static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
+	.copy_to_devmem = xe_svm_copy_to_devmem,
+	.copy_to_ram = xe_svm_copy_to_ram,
+};
+
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
-- 
2.34.1

