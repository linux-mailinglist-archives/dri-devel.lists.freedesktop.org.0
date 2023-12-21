Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E637281ADF6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BDB10E653;
	Thu, 21 Dec 2023 04:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2F210E653;
 Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132902; x=1734668902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h53Z4lotbrDr8C4EGWcUwwWlUSfdukAs71sZw2Y37nk=;
 b=ZfGARM0ITZgJC3nZ5bhntAFIdNLl/qQKsUXMETAapQdEGV5cr6OiFutz
 2F086v9erARYFgKOIpr0H+eEhptW4dA6IxsRCaGqzfkP3+/6wn8uYAKMD
 6jiLp2tMnlIBl5xTGarOUrm/uFo0KdiPEoY7k4HQlhJ5Sc4nKwXr1+49J
 7Ae6iv6L9wIrwlLCmLiwZK9jOuAmolRTgJqnl7MzNX3cU60tehDZFzVaA
 24ThbHUT63ido1BfoLs2d0hqTNDRsdNQH5YO94PPpyy8GA2yEfa96c+UC
 15OL7jyfvuiab8Oyi9x3dV6Q51VOpj3s44q5ujIsoVP15lwOfJXRxyzZX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069771"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069771"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481370"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481370"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 11/22] drm/xe/svm: implement functions to allocate and free
 device memory
Date: Wed, 20 Dec 2023 23:38:01 -0500
Message-Id: <20231221043812.3783313-12-oak.zeng@intel.com>
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

Function xe_devm_alloc_pages allocate pages from drm buddy and perform
house keeping work for all the pages allocated, such as get a page
refcount, keep a bitmap of all pages to denote whether a page is in
use, put pages to a drm lru list for eviction purpose.

Function xe_devm_free_blocks return all memory blocks to drm buddy
allocator.

Function xe_devm_free_page is a call back function from hmm layer. It
is called whenever a page's refcount reaches to 1. This function clears
the bit of this page in the bitmap. If all the bits in the bitmap is
cleared, it means all the pages have been freed, we return all the pages
in this memory block back to drm buddy.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h        |   9 ++
 drivers/gpu/drm/xe/xe_svm_devmem.c | 146 ++++++++++++++++++++++++++++-
 2 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b54f7714a1fc..8551df2b9780 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -74,4 +74,13 @@ struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
 int xe_svm_build_sg(struct hmm_range *range, struct sg_table *st);
 int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
 void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mem);
+
+
+int xe_devm_alloc_pages(struct xe_tile *tile,
+						unsigned long npages,
+						struct list_head *blocks,
+						unsigned long *pfn);
+
+void xe_devm_free_blocks(struct list_head *blocks);
+void xe_devm_page_free(struct page *page);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
index cf7882830247..445e0e1bc3b4 100644
--- a/drivers/gpu/drm/xe/xe_svm_devmem.c
+++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
@@ -5,18 +5,162 @@
 
 #include <linux/mm_types.h>
 #include <linux/sched/mm.h>
+#include <linux/gfp.h>
+#include <linux/migrate.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-fence.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
+#include <drm/drm_buddy.h>
 
 #include "xe_device_types.h"
 #include "xe_trace.h"
+#include "xe_migrate.h"
+#include "xe_ttm_vram_mgr_types.h"
+#include "xe_assert.h"
 
+/**
+ * struct xe_svm_block_meta - svm uses this data structure to manage each
+ * block allocated from drm buddy. This will be set to the drm_buddy_block's
+ * private field.
+ *
+ * @lru: used to link this block to drm's lru lists. This will be replace
+ * with struct drm_lru_entity later.
+ * @tile: tile from which we allocated this block
+ * @bitmap: A bitmap of each page in this block. 1 means this page is used,
+ * 0 means this page is idle. When all bits of this block are 0, it is time
+ * to return this block to drm buddy subsystem.
+ */
+struct xe_svm_block_meta {
+	struct list_head lru;
+	struct xe_tile *tile;
+	unsigned long bitmap[];
+};
+
+static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
+{
+	/** DRM buddy's block offset is 0-based*/
+	offset += mr->hpa_base;
+
+	return PHYS_PFN(offset);
+}
+
+/**
+ * xe_devm_alloc_pages() - allocate device pages from buddy allocator
+ *
+ * @xe_tile: which tile to allocate device memory from
+ * @npages: how many pages to allocate
+ * @blocks: used to return the allocated blocks
+ * @pfn: used to return the pfn of all allocated pages. Must be big enough
+ * to hold at @npages entries.
+ *
+ * This function allocate blocks of memory from drm buddy allocator, and
+ * performs initialization work: set struct page::zone_device_data to point
+ * to the memory block; set/initialize drm_buddy_block::private field;
+ * lock_page for each page allocated; add memory block to lru managers lru
+ * list - this is TBD.
+ *
+ * return: 0 on success
+ * error code otherwise
+ */
+int xe_devm_alloc_pages(struct xe_tile *tile,
+						unsigned long npages,
+						struct list_head *blocks,
+						unsigned long *pfn)
+{
+	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
+	struct drm_buddy_block *block, *tmp;
+	u64 size = npages << PAGE_SHIFT;
+	int ret = 0, i, j = 0;
+
+	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
+						blocks, DRM_BUDDY_TOPDOWN_ALLOCATION);
+
+	if (unlikely(ret))
+		return ret;
+
+	list_for_each_entry_safe(block, tmp, blocks, link) {
+		struct xe_mem_region *mr = &tile->mem.vram;
+		u64 block_pfn_first, pages_per_block;
+		struct xe_svm_block_meta *meta;
+		u32 meta_size;
+
+		size = drm_buddy_block_size(mm, block);
+		pages_per_block = size >> PAGE_SHIFT;
+		meta_size = BITS_TO_BYTES(pages_per_block) +
+					sizeof(struct xe_svm_block_meta);
+		meta = kzalloc(meta_size, GFP_KERNEL);
+		bitmap_fill(meta->bitmap, pages_per_block);
+		meta->tile = tile;
+		block->private = meta;
+		block_pfn_first =
+					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
+		for(i = 0; i < pages_per_block; i++) {
+			struct page *page;
+
+			pfn[j++] = block_pfn_first + i;
+			page = pfn_to_page(block_pfn_first + i);
+			/**Lock page per hmm requirement, see hmm.rst.*/
+			zone_device_page_init(page);
+			page->zone_device_data = block;
+		}
+	}
+
+	return ret;
+}
+
+/** FIXME: we locked page by calling zone_device_page_init
+ *  inxe_dev_alloc_pages. Should we unlock pages here?
+ */
+static void free_block(struct drm_buddy_block *block)
+{
+	struct xe_svm_block_meta *meta =
+		(struct xe_svm_block_meta *)block->private;
+	struct xe_tile *tile  = meta->tile;
+	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
+
+	kfree(block->private);
+	drm_buddy_free_block(mm, block);
+}
+
+/**
+ * xe_devm_free_blocks() - free all memory blocks
+ *
+ * @blocks: memory blocks list head
+ */
+void xe_devm_free_blocks(struct list_head *blocks)
+{
+	struct drm_buddy_block *block, *tmp;
+
+	list_for_each_entry_safe(block, tmp, blocks, link)
+		free_block(block);
+}
 
 static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
 {
 	return 0;
 }
 
-static void xe_devm_page_free(struct page *page)
+void xe_devm_page_free(struct page *page)
 {
+	struct drm_buddy_block *block =
+					(struct drm_buddy_block *)page->zone_device_data;
+	struct xe_svm_block_meta *meta =
+					(struct xe_svm_block_meta *)block->private;
+	struct xe_tile *tile  = meta->tile;
+	struct xe_mem_region *mr = &tile->mem.vram;
+	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
+	u64 size = drm_buddy_block_size(mm, block);
+	u64 pages_per_block = size >> PAGE_SHIFT;
+	u64 block_pfn_first =
+					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
+	u64 page_pfn = page_to_pfn(page);
+	u64 i = page_pfn - block_pfn_first;
+
+	xe_assert(tile->xe, i < pages_per_block);
+	clear_bit(i, meta->bitmap);
+	if (bitmap_empty(meta->bitmap, pages_per_block))
+		free_block(block);
 }
 
 static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
-- 
2.26.3

