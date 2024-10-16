Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A6399FF6C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C1A10E66E;
	Wed, 16 Oct 2024 03:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtuaxR2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E6310E657;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049100; x=1760585100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GA/zL1uluiQDEWJwexSwyq5QZkUUs/IRhWSsa5ercM0=;
 b=RtuaxR2ezkZz6j/NJ4KQtBXCDi1QUgyBv94cLE1SOIDPuf13zYj0IdMh
 +UnzKMEAvg6gCZ30DiufrgbRZjPVbm9clVBvqMcnT9IPlt7PAkAnY/jPT
 NrsvyPUbRWv4FwSKZnC8iTsaFJqF4nDR7QUlRwMsgzONUGJ+2GbPV9qXi
 vo9ywN2wfdua1FpLiXyTmGrZ2MUgU46SJtbTTZQJ3nBJuEP8vj4iruPRD
 xNkwDaa+QIWjGF0CgAZshFsu2YRD7HWS2i227WstfTaP3yZIUR4FTJ/eh
 +20NXwobmVje3OdD6+pbQfRhaujlH02X2rMTjZRjtjYxqukZ6hCIwujLS A==;
X-CSE-ConnectionGUID: Zb7A2elRRiWOhmBleRN1Jw==
X-CSE-MsgGUID: PuDywwzXQfysTLZxG0c0aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056437"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056437"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: SLRwNQXiQOywQ0tLqknBUg==
X-CSE-MsgGUID: k32cve7vRnmEa7MQ2XizAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930270"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 19/29] drm/xe: Add GPUSVM devic memory copy vfunc functions
Date: Tue, 15 Oct 2024 20:25:08 -0700
Message-Id: <20241016032518.539495-20-matthew.brost@intel.com>
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

Add GPUSVM devic memory copy vfunc functions and connect to migration
layer.

v2:
 - Allow NULL device pages in xe_svm_copy
 - Use new drm_gpusvm_devmem_ops

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 22e6341117bd..b33fd42d035b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -6,6 +6,7 @@
 #include "drm_gpusvm.h"
 
 #include "xe_gt_tlb_invalidation.h"
+#include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_vm.h"
@@ -269,6 +270,155 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
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
+#define VRAM_ADDR_INVALID	~0x0ull
+	u64 vram_addr = VRAM_ADDR_INVALID;
+	int err = 0, pos = 0;
+	bool sram = dir == XE_SVM_COPY_TO_SRAM;
+
+	for (i = 0; i < npages; ++i) {
+		struct page *spage = pages[i];
+		struct dma_fence *__fence;
+		u64 __vram_addr;
+		bool match = false, chunk, last;
+
+		chunk = (i - pos) == (SZ_2M / PAGE_SIZE);
+		last = (i + 1) == npages;
+
+		if (!dma_addr[i] && vram_addr == VRAM_ADDR_INVALID)
+			continue;
+
+		if (!mr && spage) {
+			mr = page_to_mr(spage);
+			tile = mr_to_tile(mr);
+		}
+
+		if (dma_addr[i] && spage) {
+			__vram_addr = xe_mem_region_page_to_dpa(mr, spage);
+			if (vram_addr == VRAM_ADDR_INVALID) {
+				vram_addr = __vram_addr;
+				pos = i;
+			}
+
+			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
+		}
+
+		if (!match || chunk || last) {
+			int incr = (match && last) ? 1 : 0;
+
+			if (vram_addr != VRAM_ADDR_INVALID) {
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
+			if (dma_addr[i] && spage) {
+				vram_addr = __vram_addr;
+				pos = i;
+			} else {
+				vram_addr = VRAM_ADDR_INVALID;
+			}
+
+			if (!match && last && dma_addr[i] && spage) {
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
+	if (fence) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
+
+	return err;
+#undef VRAM_ADDR_INVALID
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

