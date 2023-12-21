Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F4681ADF9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9210E660;
	Thu, 21 Dec 2023 04:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704D510E653;
 Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132903; x=1734668903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TFuLDl5rjE5Z8M92BmQP1BBm1VJQTh1JMd04l6WaM4I=;
 b=RkoeQ8Ggw4L1+L7rsEAwIfkGupVdUgYKfeXrYIFq567TkJ6LNoEROMDw
 Ugj0cWdL2AQkHSiw2XNzdCrypzES1/azqidwa5+JJlX8vgP4BJNF32Hsq
 L7HB/aN85z+cFrgpyBJtEGrDGEDhiOelTBTW26q4zdhOWYn5E2sM0hKO9
 Z50B8BAPnB4sMpDCzen2yhL+CiotjeJ/Q9cJrrRdsjvyaZuKvucjJZNVY
 vUNixJn2VcpK4YC60Mi4TsjhLMpwAu17nfFA+qq0POE87Sn2QmgpFMLHc
 gMI/py0QxbTj0HW9WDCzHO0imviLp1GmhcdI0AQRSwFM4iX72Jy/1YlWN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069779"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069779"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481394"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481394"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 19/22] drm/xe/svm: migrate svm range to vram
Date: Wed, 20 Dec 2023 23:38:09 -0500
Message-Id: <20231221043812.3783313-20-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the source pages of the svm range can be physically none
contiguous, and the destination vram pages can also be none
contiguous, there is no easy way to migrate multiple pages per
blitter command. We do page by page migration for now.

Migration is best effort. Even if we fail to migrate some pages,
we will try to migrate the rest pages.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c         |   7 ++
 drivers/gpu/drm/xe/xe_svm.h         |   3 +
 drivers/gpu/drm/xe/xe_svm_migrate.c | 114 ++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 5772bfcf7da4..44d4f4216a93 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -5,12 +5,19 @@
 
 #include <linux/mutex.h>
 #include <linux/mm_types.h>
+#include <linux/interval_tree.h>
+#include <linux/container_of.h>
+#include <linux/types.h>
+#include <linux/migrate.h>
 #include "xe_svm.h"
 #include <linux/hmm.h>
 #include <linux/scatterlist.h>
 #include "xe_pt.h"
 #include "xe_assert.h"
 #include "xe_vm_types.h"
+#include "xe_gt.h"
+#include "xe_migrate.h"
+#include "xe_trace.h"
 
 DEFINE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 5b3bd2c064f5..659bcb7927d6 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -80,6 +80,9 @@ struct xe_svm_range {
 };
 
 vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf);
+int svm_migrate_range_to_vram(struct xe_svm_range *range,
+							struct vm_area_struct *vma,
+							struct xe_tile *tile);
 void xe_destroy_svm(struct xe_svm *svm);
 struct xe_svm *xe_create_svm(struct xe_vm *vm);
 struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c b/drivers/gpu/drm/xe/xe_svm_migrate.c
index b4df411e04f3..3724ad6c7aea 100644
--- a/drivers/gpu/drm/xe/xe_svm_migrate.c
+++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
@@ -229,3 +229,117 @@ vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
 	kvfree(buf);
 	return 0;
 }
+
+
+/**
+ * svm_migrate_range_to_vram() - migrate backing store of a va range to vram
+ * Must be called with mmap_read_lock(mm) held.
+ * @range: the va range to migrate. Range should only belong to one vma.
+ * @vma: the vma that this range belongs to. @range can cover whole @vma
+ * or a sub-range of @vma.
+ * @tile: the destination tile which holds the new backing store of the range
+ *
+ * Returns: negative errno on faiure, 0 on success
+ */
+int svm_migrate_range_to_vram(struct xe_svm_range *range,
+							struct vm_area_struct *vma,
+							struct xe_tile *tile)
+{
+	struct mm_struct *mm = range->svm->mm;
+	unsigned long start = range->start;
+	unsigned long end = range->end;
+	unsigned long npages = (end - start) >> PAGE_SHIFT;
+	struct xe_mem_region *mr = &tile->mem.vram;
+	struct migrate_vma migrate = {
+		.vma		= vma,
+		.start		= start,
+		.end		= end,
+		.pgmap_owner	= tile->xe->drm.dev,
+		.flags          = MIGRATE_VMA_SELECT_SYSTEM,
+	};
+	struct device *dev = tile->xe->drm.dev;
+	dma_addr_t *src_dma_addr;
+	struct dma_fence *fence;
+	struct page *src_page;
+	LIST_HEAD(blocks);
+	int ret = 0, i;
+	u64 dst_dpa;
+	void *buf;
+
+	mmap_assert_locked(mm);
+	xe_assert(tile->xe, xe_svm_range_belongs_to_vma(mm, range, vma));
+
+	buf = kvcalloc(npages, 2* sizeof(*migrate.src) + sizeof(*src_dma_addr),
+					GFP_KERNEL);
+	if(!buf)
+		return -ENOMEM;
+	migrate.src = buf;
+	migrate.dst = migrate.src + npages;
+	src_dma_addr = (dma_addr_t *) (migrate.dst + npages);
+	ret = xe_devm_alloc_pages(tile, npages, &blocks, migrate.dst);
+	if (ret)
+		goto kfree_buf;
+
+	ret = migrate_vma_setup(&migrate);
+	if (ret) {
+		drm_err(&tile->xe->drm, "vma setup returned %d for range [%lx - %lx]\n",
+				ret, start, end);
+		goto free_dst_pages;
+	}
+
+	trace_xe_svm_migrate_sram_to_vram(range);
+	/**FIXME: partial migration of a range
+	 * print a warning for now. If this message
+	 * is printed, we need to fall back to page by page
+	 * migration: only migrate pages with MIGRATE_PFN_MIGRATE
+	 */
+	if (migrate.cpages != npages)
+		drm_warn(&tile->xe->drm, "Partial migration for range [%lx - %lx], range is %ld pages, migrate only %ld pages\n",
+				start, end, npages, migrate.cpages);
+
+	/**Migrate page by page for now.
+	 * Both source pages and destination pages can physically not contiguous,
+	 * there is no good way to migrate multiple pages per blitter command.
+	 */
+	for (i = 0; i < npages; i++) {
+		src_page = migrate_pfn_to_page(migrate.src[i]);
+		if (unlikely(!src_page || !(migrate.src[i] & MIGRATE_PFN_MIGRATE)))
+			goto free_dst_page;
+
+		xe_assert(tile->xe, !is_zone_device_page(src_page));
+		src_dma_addr[i] = dma_map_page(dev, src_page, 0, PAGE_SIZE, DMA_TO_DEVICE);
+		if (unlikely(dma_mapping_error(dev, src_dma_addr[i]))) {
+			drm_warn(&tile->xe->drm, "dma map error for host pfn %lx\n", migrate.src[i]);
+			goto free_dst_page;
+		}
+		dst_dpa = vram_pfn_to_dpa(mr, migrate.dst[i]);
+		fence = xe_migrate_svm(tile->migrate, src_dma_addr[i], false,
+				dst_dpa, true, PAGE_SIZE);
+		if (IS_ERR(fence)) {
+			drm_warn(&tile->xe->drm, "migrate host page (pfn: %lx) to vram failed\n",
+					migrate.src[i]);
+			/**Migration is best effort. Even we failed here, we continue*/
+			goto free_dst_page;
+		}
+		/**FIXME: Use the first migration's out fence as the second migration's input fence,
+		 * and so on. Only wait the out fence of last migration?
+		 */
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+free_dst_page:
+		xe_devm_page_free(pfn_to_page(migrate.dst[i]));
+	}
+
+	for (i = 0; i < npages; i++)
+		if (!(dma_mapping_error(dev, src_dma_addr[i])))
+			dma_unmap_page(dev, src_dma_addr[i], PAGE_SIZE, DMA_TO_DEVICE);
+
+	migrate_vma_pages(&migrate);
+	migrate_vma_finalize(&migrate);
+free_dst_pages:
+	if (ret)
+		xe_devm_free_blocks(&blocks);
+kfree_buf:
+	kfree(buf);
+	return ret;
+}
-- 
2.26.3

