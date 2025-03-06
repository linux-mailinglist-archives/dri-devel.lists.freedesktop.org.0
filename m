Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED00A53FE2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC4A10E8CB;
	Thu,  6 Mar 2025 01:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icXrc1ZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4AE10E898;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F6GjfcE/bj2AvMBcdAkSitqydPxDmEvkNwbKis/M/hI=;
 b=icXrc1ZDxHoQA0QSGF2xIyF3D287NC/4dDs66ANtN46epR1oOevabr1s
 cJ9Y2adPyQFU8JGq667upl1z3oOaD5rv0h5069sYNDIdbKyelcEPOR6ur
 Zq1DPNE2au9wQYv2F4Iz4+aLcpjVx9u+qvWv+Ht5lTmBRk7PoZPYME1fy
 WAJbMdvctKmE6hu8qzg4FpTHadHIfIM68skbHWSHmv3OLwI3NlEK7p4Bi
 +7o/uulgqUIMa7hK2LC8AHy1/wsWNZUVjKL2NMLdePNK/mYSAHZj/Q9xz
 fXGv3QPnaiog3gSsowOffhoKC/K2R/Eyx3B/dQXN/820s7/Fg0OrVCj1c g==;
X-CSE-ConnectionGUID: ntklqlZ+SdGlf3o0b0ynJQ==
X-CSE-MsgGUID: CuFKnCIoRkiAOckU5C4iOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427412"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427412"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
X-CSE-ConnectionGUID: mcXXoQzPSA6m5Txyb9dJMw==
X-CSE-MsgGUID: SWPMACmVRPumlT662nmDEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063306"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 24/32] drm/xe: Add GPUSVM device memory copy vfunc functions
Date: Wed,  5 Mar 2025 17:26:49 -0800
Message-Id: <20250306012657.3505757-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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
index 7a6e12377f05..4983d4175388 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_gt_tlb_invalidation.h"
+#include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_vm.h"
@@ -315,6 +316,157 @@ static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
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

