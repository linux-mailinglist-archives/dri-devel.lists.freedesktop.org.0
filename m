Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB73F81AE02
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7048510E679;
	Thu, 21 Dec 2023 04:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6D10E658;
 Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132902; x=1734668902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=468vXP6XMA+Ped90HBw+ujY2GwFKDU6DLNg9OR9HBxA=;
 b=WH5s/lQ8yPWVvxZ0F88tYxL77jafZhXHtckxeMGeBGn3KrR55kGF69NL
 vs3jLBUP1QsgEWgrgQQzMZaJ1BrBwQle/SGM5cUp9LhTBfXUluHiy28vK
 GWg5500ancfQXqsgyMaORXRm6fbyrKqjK5I8iUHSVZIlCqEruW5gaEXWQ
 Li75p4Le0rt2e1C1RXIW0J8PgB5BOUBMW56z21Czp4tFR3+id4cQzm27N
 X79q/RQVPNps7nw2kCV/VWK+8U/Fv7fqFbvldNUJTtWeB4769IwRlJjzU
 vY9nVqGjS/ztc+F7GAURKy5HJLbPhj50FpyU65kjoY4y79HOK1ZkPOSjY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069773"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069773"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481376"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481376"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 13/22] drm/xe/svm: Handle CPU page fault
Date: Wed, 20 Dec 2023 23:38:03 -0500
Message-Id: <20231221043812.3783313-14-oak.zeng@intel.com>
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

Under the picture of svm, CPU and GPU program share one same
virtual address space. The backing store of this virtual address
space can be either in system memory or device memory. Since GPU
device memory is remaped as DEVICE_PRIVATE, CPU can't access it.
Any CPU access to device memory causes a page fault. Implement
a page fault handler to migrate memory back to system memory and
map it to CPU page table so the CPU program can proceed.

Also unbind this page from GPU side, and free the original GPU
device page

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  12 ++
 drivers/gpu/drm/xe/xe_svm.h          |   8 +-
 drivers/gpu/drm/xe/xe_svm_devmem.c   |  10 +-
 drivers/gpu/drm/xe/xe_svm_migrate.c  | 230 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm_range.c    |  27 ++++
 5 files changed, 280 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c67c28f04d2f..ac77996bebe6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -555,4 +555,16 @@ struct xe_file {
 	struct xe_drm_client *client;
 };
 
+static inline struct xe_tile *mem_region_to_tile(struct xe_mem_region *mr)
+{
+	return container_of(mr, struct xe_tile, mem.vram);
+}
+
+static inline u64 vram_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)
+{
+	u64 dpa;
+	u64 offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
+	dpa = mr->dpa_base + offset;
+	return dpa;
+}
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 8551df2b9780..6b93055934f8 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -12,8 +12,10 @@
 #include <linux/rbtree_types.h>
 #include <linux/interval_tree.h>
 #include <linux/hashtable.h>
+#include <linux/mm_types.h>
 #include <linux/types.h>
 #include <linux/hmm.h>
+#include <linux/mm.h>
 #include "xe_device_types.h"
 
 struct xe_vm;
@@ -66,16 +68,20 @@ struct xe_svm_range {
 	struct interval_tree_node inode;
 };
 
+vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf);
 void xe_destroy_svm(struct xe_svm *svm);
 struct xe_svm *xe_create_svm(struct xe_vm *vm);
 struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
 struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
 								unsigned long addr);
+bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
+								struct xe_svm_range *range,
+								struct vm_area_struct *vma);
+
 int xe_svm_build_sg(struct hmm_range *range, struct sg_table *st);
 int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
 void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mem);
 
-
 int xe_devm_alloc_pages(struct xe_tile *tile,
 						unsigned long npages,
 						struct list_head *blocks,
diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
index 5cd54dde4a9d..01f8385ebb5b 100644
--- a/drivers/gpu/drm/xe/xe_svm_devmem.c
+++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
@@ -11,13 +11,16 @@
 #include <linux/dma-fence.h>
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
 #include <drm/drm_buddy.h>
-
 #include "xe_device_types.h"
 #include "xe_trace.h"
 #include "xe_migrate.h"
 #include "xe_ttm_vram_mgr_types.h"
 #include "xe_assert.h"
+#include "xe_pt.h"
+#include "xe_svm.h"
 
 /**
  * struct xe_svm_block_meta - svm uses this data structure to manage each
@@ -137,11 +140,6 @@ void xe_devm_free_blocks(struct list_head *blocks)
 		free_block(block);
 }
 
-static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
-{
-	return 0;
-}
-
 void xe_devm_page_free(struct page *page)
 {
 	struct drm_buddy_block *block =
diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c b/drivers/gpu/drm/xe/xe_svm_migrate.c
new file mode 100644
index 000000000000..3be26da33aa3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/gfp.h>
+#include <linux/migrate.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-fence.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <drm/drm_buddy.h>
+#include "xe_device_types.h"
+#include "xe_trace.h"
+#include "xe_migrate.h"
+#include "xe_ttm_vram_mgr_types.h"
+#include "xe_assert.h"
+#include "xe_pt.h"
+#include "xe_svm.h"
+
+
+/**
+ * alloc_host_page() - allocate one host page for the fault vma
+ *
+ * @dev: (GPU) device that will access the allocated page
+ * @vma: the fault vma that we need allocate page for
+ * @addr: the fault address. The allocated page is for this address
+ * @dma_addr: used to output the dma address of the allocated page.
+ * This dma address will be used for gpu to access this page. GPU
+ * access host page through a dma mapped address.
+ * @pfn: used to output the pfn of the allocated page.
+ *
+ * This function allocate one host page for the specified vma. It
+ * also does some prepare work for GPU to access this page, such
+ * as map this page to iommu (by calling dma_map_page).
+ *
+ * When this function returns, the page is locked.
+ *
+ * Return struct page pointer when success
+ * NULL otherwise
+ */
+static struct page *alloc_host_page(struct device *dev,
+							 struct vm_area_struct *vma,
+							 unsigned long addr,
+							 dma_addr_t *dma_addr,
+							 unsigned long *pfn)
+{
+	struct page *page;
+
+	page = alloc_page_vma(GFP_HIGHUSER, vma, addr);
+	if (unlikely(!page))
+		return NULL;
+
+	/**Lock page per hmm requirement, see hmm.rst*/
+	lock_page(page);
+	*dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, DMA_FROM_DEVICE);
+	if (unlikely(dma_mapping_error(dev, *dma_addr))) {
+		unlock_page(page);
+		__free_page(page);
+		return NULL;
+	}
+
+	*pfn = migrate_pfn(page_to_pfn(page));
+	return page;
+}
+
+static void free_host_page(struct page *page)
+{
+	unlock_page(page);
+	put_page(page);
+}
+
+static inline struct xe_mem_region *page_to_mem_region(struct page *page)
+{
+	return container_of(page->pgmap, struct xe_mem_region, pagemap);
+}
+
+/**
+ * migrate_page_vram_to_ram() - migrate one page from vram to ram
+ *
+ * @vma: The vma that the page is mapped to
+ * @addr: The virtual address that the page is mapped to
+ * @src_pfn: src page's page frame number
+ * @dst_pfn: used to return dstination page (in system ram)'s pfn
+ *
+ * Allocate one page in system ram and copy memory from device memory
+ * to system ram.
+ *
+ * Return: 0 if this page is already in sram (no need to migrate)
+ * 1: successfully migrated this page from vram to sram.
+ * error code otherwise
+ */
+static int migrate_page_vram_to_ram(struct vm_area_struct *vma, unsigned long addr,
+						unsigned long src_pfn, unsigned long *dst_pfn)
+{
+	struct xe_mem_region *mr;
+	struct xe_tile *tile;
+	struct xe_device *xe;
+	struct device *dev;
+	dma_addr_t dma_addr = 0;
+	struct dma_fence *fence;
+	struct page *host_page;
+	struct page *src_page;
+	u64 src_dpa;
+
+	src_page = migrate_pfn_to_page(src_pfn);
+	if (unlikely(!src_page || !(src_pfn & MIGRATE_PFN_MIGRATE)))
+		return 0;
+
+	mr = page_to_mem_region(src_page);
+	tile = mem_region_to_tile(mr);
+	xe = tile_to_xe(tile);
+	dev = xe->drm.dev;
+
+	src_dpa = vram_pfn_to_dpa(mr, src_pfn);
+	host_page = alloc_host_page(dev, vma, addr, &dma_addr, dst_pfn);
+	if (!host_page)
+		return -ENOMEM;
+
+	fence = xe_migrate_svm(tile->migrate, src_dpa, true,
+						dma_addr, false, PAGE_SIZE);
+	if (IS_ERR(fence)) {
+		dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_FROM_DEVICE);
+		free_host_page(host_page);
+		return PTR_ERR(fence);
+	}
+
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+	dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_FROM_DEVICE);
+	return 1;
+}
+
+/**
+ * xe_devmem_migrate_to_ram() - Migrate memory back to sram on CPU page fault
+ *
+ * @vmf: cpu vm fault structure, contains fault information such as vma etc.
+ *
+ * Note, this is in CPU's vm fault handler, caller holds the mmap read lock.
+ * FIXME: relook the lock design here. Is there any deadlock?
+ *
+ * This function migrate one svm range which contains the fault address to sram.
+ * We try to maintain a 1:1 mapping b/t the vma and svm_range (i.e., create one
+ * svm range for one vma initially and try not to split it). So this scheme end
+ * up migrate at the vma granularity. This might not be the best performant scheme
+ * when GPU is in the picture.
+ *
+ * This can be tunned with a migration granularity for  performance, for example,
+ * migration 2M for each CPU page fault, or let user specify how much to migrate.
+ * But this is more complicated as this scheme requires vma and svm_range splitting.
+ *
+ * This function should also update GPU page table, so the fault virtual address
+ * points to the same sram location from GPU side. This is TBD.
+ *
+ * Return:
+ * 0 on success
+ * VM_FAULT_SIGBUS: failed to migrate page to system memory, application
+ * will be signaled a SIGBUG
+ */
+vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
+{
+	struct xe_mem_region *mr = page_to_mem_region(vmf->page);
+	struct xe_tile *tile = mem_region_to_tile(mr);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct vm_area_struct *vma = vmf->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	struct xe_svm *svm = xe_lookup_svm_by_mm(mm);
+	struct xe_svm_range *range = xe_svm_range_from_addr(svm, vmf->address);
+	struct xe_vm *vm = svm->vm;
+	u64 npages = (range->end - range->start) >> PAGE_SHIFT;
+	unsigned long addr = range->start;
+	vm_fault_t ret = 0;
+	void *buf;
+	int i;
+
+	struct migrate_vma migrate_vma = {
+		.vma		= vmf->vma,
+		.start		= range->start,
+		.end		= range->end,
+		.pgmap_owner	= xe->drm.dev,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.fault_page = vmf->page,
+	};
+
+	xe_assert(xe, IS_ALIGNED(vmf->address, PAGE_SIZE));
+	xe_assert(xe, IS_ALIGNED(range->start, PAGE_SIZE));
+	xe_assert(xe, IS_ALIGNED(range->end, PAGE_SIZE));
+	/**FIXME: in case of vma split, svm range might not belongs to one vma*/
+	xe_assert(xe, xe_svm_range_belongs_to_vma(mm, range, vma));
+
+	buf = kvcalloc(npages, 2* sizeof(*migrate_vma.src), GFP_KERNEL);
+	migrate_vma.src = buf;
+	migrate_vma.dst = buf + npages;
+	if (migrate_vma_setup(&migrate_vma) < 0) {
+		ret = VM_FAULT_SIGBUS;
+		goto free_buf;
+	}
+
+	if (!migrate_vma.cpages)
+		goto free_buf;
+
+	for (i = 0; i < npages; i++) {
+		ret = migrate_page_vram_to_ram(vma, addr, migrate_vma.src[i],
+							migrate_vma.dst + i);
+		if (ret < 0) {
+			ret = VM_FAULT_SIGBUS;
+			break;
+		}
+
+		/** Migration has been successful, unbind src page from gpu,
+		 *  and free source page
+		 */
+		if (ret == 1) {
+			struct page *src_page = migrate_pfn_to_page(migrate_vma.src[i]);
+
+			xe_invalidate_svm_range(vm, addr, PAGE_SIZE);
+			xe_devm_page_free(src_page);
+		}
+
+		addr += PAGE_SIZE;
+	}
+
+	migrate_vma_pages(&migrate_vma);
+	migrate_vma_finalize(&migrate_vma);
+free_buf:
+	kvfree(buf);
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm_range.c b/drivers/gpu/drm/xe/xe_svm_range.c
index d8251d38f65e..b32c32f60315 100644
--- a/drivers/gpu/drm/xe/xe_svm_range.c
+++ b/drivers/gpu/drm/xe/xe_svm_range.c
@@ -5,7 +5,9 @@
 
 #include <linux/interval_tree.h>
 #include <linux/container_of.h>
+#include <linux/mm_types.h>
 #include <linux/mutex.h>
+#include <linux/mm.h>
 #include "xe_svm.h"
 
 /**
@@ -30,3 +32,28 @@ struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
 
 	return container_of(node, struct xe_svm_range, inode);
 }
+
+/**
+ * xe_svm_range_belongs_to_vma() - determine a virtual address range
+ * belongs to a vma or not
+ *
+ * @mm: the mm of the virtual address range
+ * @range: the svm virtual address range
+ * @vma: the vma to determine the range
+ *
+ * Returns true if range belongs to vma
+ * false otherwise
+ */
+bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
+								struct xe_svm_range *range,
+								struct vm_area_struct *vma)
+{
+	struct vm_area_struct *vma1, *vma2;
+	unsigned long start = range->start;
+	unsigned long end = range->end;
+
+	vma1  = find_vma_intersection(mm, start, start + 4);
+	vma2  = find_vma_intersection(mm, end - 4, end);
+
+	return (vma1 == vma) && (vma2 == vma);
+}
-- 
2.26.3

