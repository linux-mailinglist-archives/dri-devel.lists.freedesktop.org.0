Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51AB961C46
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3C710E458;
	Wed, 28 Aug 2024 02:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SN+UjAM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBC710E44B;
 Wed, 28 Aug 2024 02:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813290; x=1756349290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nEIA6EZhqfbNpqJqrcdWXkhSdB3sakd8rSbMVxuyzLk=;
 b=SN+UjAM1fvC5VJBO4FZLGpuZT9Nt6Y8X2FkiOUiJ0G6PMOyc1QL8r8kr
 nEBgX2HLOYdtRgOZWME9vJkwoxewPGc9vyYZzuBvls03/uWyyhjiX4rw5
 GAGO4/2uuGbm2fljsgJ+1utZwleGlv7q3JeCF9KZMgH6yXTrU+W+6wGCe
 clBLWt9x1XzXxct631ncQq/18M4/ANNHOwTbCsSJt3s+RmPsJTzxI2amH
 ryiSzHUjjI28KBVhpgqdLjfrfw6LdT6OBgND6TRn+49YgjVgeaHT5O3jE
 zeL8Zw+j5C+lCx26a+CEuuI7Eaq9J6NXkuJ5ppWEsfPyH7gH4VuofxSna w==;
X-CSE-ConnectionGUID: hPOTDWDiQAOEBGqEgeqzzQ==
X-CSE-MsgGUID: akWFcJmxRlyYz9JnQxAAZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251922"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
X-CSE-ConnectionGUID: tb74yusGTwy+HCubENekKg==
X-CSE-MsgGUID: mOjcp6eJRQGhzKhOq8XXOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224643"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 18/28] drm/xe: Add GPUSVM copy SRAM / VRAM vfunc functions
Date: Tue, 27 Aug 2024 19:48:51 -0700
Message-Id: <20240828024901.2582335-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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

Add GPUSVM copy SRAM / VRAM vfunc functions and connect to migration
layer.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Me: Fix vram_addr == 0 case
---
 drivers/gpu/drm/xe/xe_svm.c | 153 ++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 258a94e83e57..6c690ba827e7 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -6,6 +6,7 @@
 #include "drm_gpusvm.h"
 
 #include "xe_gt_tlb_invalidation.h"
+#include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_vm.h"
@@ -270,9 +271,161 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
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
+static int xe_svm_copy(struct drm_gpusvm *gpusvm, struct page **pages,
+		       dma_addr_t *dma_addr, unsigned long npages,
+		       const enum xe_svm_copy_dir dir)
+{
+	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
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
+		if (!mr) {
+			mr = page_to_mr(spage);
+			tile = mr_to_tile(mr);
+		}
+
+		if (dma_addr[i]) {
+			__vram_addr = xe_mem_region_page_to_dpa(mr, spage);
+			if (vram_addr == VRAM_ADDR_INVALID) {
+				vram_addr = __vram_addr;
+				pos = i;
+			}
+
+			xe_assert(vm->xe, __vram_addr != VRAM_ADDR_INVALID);
+			xe_assert(vm->xe, vram_addr != VRAM_ADDR_INVALID);
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
+			if (dma_addr[i]) {
+				vram_addr = __vram_addr;
+				pos = i;
+			} else {
+				vram_addr = VRAM_ADDR_INVALID;
+			}
+
+			if (!match && last && dma_addr[i]) {
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
+static int xe_svm_copy_to_vram(struct drm_gpusvm *gpusvm, struct page **pages,
+			       dma_addr_t *dma_addr, unsigned long npages)
+{
+	return xe_svm_copy(gpusvm, pages, dma_addr, npages,
+			   XE_SVM_COPY_TO_VRAM);
+}
+
+static int xe_svm_copy_to_sram(struct drm_gpusvm *gpusvm, struct page **pages,
+			       dma_addr_t *dma_addr, unsigned long npages)
+{
+	return xe_svm_copy(gpusvm, pages, dma_addr, npages,
+			   XE_SVM_COPY_TO_SRAM);
+}
+
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
+	.copy_to_vram = xe_svm_copy_to_vram,
+	.copy_to_sram = xe_svm_copy_to_sram,
 	.invalidate = xe_svm_invalidate,
 };
 
-- 
2.34.1

