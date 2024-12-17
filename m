Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D679F5A71
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DE010EAAE;
	Tue, 17 Dec 2024 23:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkuhuHX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1126E10EA86;
 Tue, 17 Dec 2024 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478393; x=1766014393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pb09vTnn6toYYT6AY8Yp483OxRY03JXzYZUBJ+4mYc0=;
 b=RkuhuHX6QhwxYTAOcRQ4k+rPgnNRt5z8b8A6JIgd98PpLf3EizEEelJB
 G9KvJeDrLztXytnS+TZORBvMPGG+klPms6Xta0pX2yRwcJhbm3kDFt5cr
 bkQ3stJn2fy6++hynXB3E8SmckacU8CbDjLGmR9vOXmaChJnCF7sNLLZg
 Oxq5UdHYCowls6mK5F48h3t7IBzFWr873fMaEpE/eWA5XN2g/hIhe1Uxr
 KXYVlfT29pO3gnhSYufIpZOVgL8by4rXOb5p4iM9EQ9Kwzy0Hp7m2dQ7a
 Bu1WJZTmwu/Ov0DZ6MHQamY1hIiJY+PzGyCWCiSw14AruXjiQwgowuw1j Q==;
X-CSE-ConnectionGUID: 8Y4Y157wQmmV8XAnWbZE+g==
X-CSE-MsgGUID: Xh35X4n5SXKbwDUKrRkt9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517457"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517457"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:12 -0800
X-CSE-ConnectionGUID: BnfVvNKVSoGlBK82ilOkdQ==
X-CSE-MsgGUID: SjZI+JBGRH2rilsAAgAOXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273453"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 22/30] drm/xe: Add GPUSVM device memory copy vfunc functions
Date: Tue, 17 Dec 2024 15:33:40 -0800
Message-Id: <20241217233348.3519726-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 179 ++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index faeacf0ccdaa..dcd99520a6d9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_gt_tlb_invalidation.h"
+#include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_vm.h"
@@ -281,6 +282,184 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 	up_write(&vm->lock);
 }
 
+static struct xe_mem_region *page_to_mr(struct page *page)
+{
+	return container_of(page->pgmap, struct xe_mem_region, pagemap);
+}
+
+static struct xe_tile *mr_to_tile(struct xe_mem_region *mr)
+{
+	return container_of(mr, struct xe_tile, mem.vram);
+}
+
+static u64 xe_mem_region_page_to_dpa(struct xe_mem_region *mr,
+				     struct page *page)
+{
+	u64 dpa;
+	struct xe_tile *tile = mr_to_tile(mr);
+	u64 pfn = page_to_pfn(page);
+	u64 offset;
+
+	xe_tile_assert(tile, is_device_private_page(page));
+	xe_tile_assert(tile, (pfn << PAGE_SHIFT) >= mr->hpa_base);
+
+	offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
+	dpa = mr->dpa_base + offset;
+
+	return dpa;
+}
+
+enum xe_svm_copy_dir {
+	XE_SVM_COPY_TO_VRAM,
+	XE_SVM_COPY_TO_SRAM,
+};
+
+static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
+		       unsigned long npages, const enum xe_svm_copy_dir dir)
+{
+	struct xe_mem_region *mr = NULL;
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
+		if (!mr && spage) {
+			mr = page_to_mr(spage);
+			tile = mr_to_tile(mr);
+		}
+		XE_WARN_ON(spage && page_to_mr(spage) != mr);
+
+		/*
+		 * CPU page and device page valid, capture physical address on
+		 * first device page, check if physical contiguous on subsequent
+		 * device pages.
+		 */
+		if (dma_addr[i] && spage) {
+			__vram_addr = xe_mem_region_page_to_dpa(mr, spage);
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

