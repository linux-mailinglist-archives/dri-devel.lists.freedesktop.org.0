Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72ED99FF75
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532EF10E679;
	Wed, 16 Oct 2024 03:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IysFok7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B03E10E655;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049100; x=1760585100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JPDahZu0li5bjPvSiy3nWAji9ySJZFrS0qUJ+LsDo3Y=;
 b=IysFok7g4kQ7Kd/dfMo95v1oLP1A5MlixhlbmVclKNxw+Vs5nH6OOYnX
 MQFuBxPVM/DRtywfEp9muj6Y2DE1D1tbBmMLXwZ1BzH9EDU0XTjSD0QXQ
 Bg1C/e23PNZCSORTbzPTESwugT+su7o6J8wX0yuhvXgUDK7Hd8PGk9EIB
 2z9AhMrjQixnONBXQy4+cYVG3O2cAO0+E2qYr8eSQwo86skhAsXyvOE6d
 uDSYu1dZXsbq31GqWKZmOTWqSjW2jmSqppRGxa2Ucx1+EPRbSBk3AXv0G
 GYL09QjUA4vsMyjv6GxQj5bjs/mrXJzDloUV4y2fAO/SOIri02pEkqe7W w==;
X-CSE-ConnectionGUID: LjIHMsuYSvCkUtzMVs+hmw==
X-CSE-MsgGUID: gwp4koSqQdShpdQYmF4+zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056446"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: 4RXrR2pYQqO6B5yYRutoTQ==
X-CSE-MsgGUID: 0RzearjGR5eWdwdckrjoPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930272"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 21/29] drm/xe: Add Xe SVM populate_devmem_pfn vfunc
Date: Tue, 15 Oct 2024 20:25:10 -0700
Message-Id: <20241016032518.539495-22-matthew.brost@intel.com>
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

Get VRAM pfns from BO's buddy blocks.

v2:
 - Use new drm_gpusvm_devmem_ops

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 4f01941b2cc2..19fcb8f71791 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -9,6 +9,7 @@
 #include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
 
@@ -413,8 +414,47 @@ static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
 	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
 }
 
+static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
+{
+	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
+}
+
+static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
+{
+	return PHYS_PFN(offset + mr->hpa_base);
+}
+
+static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
+{
+	return &tile->mem.vram_mgr->mm;
+}
+
+static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
+				      unsigned long npages, unsigned long *pfn)
+{
+	struct xe_bo *bo = to_xe_bo(devmem_allocation);
+	struct ttm_resource *res = bo->ttm.resource;
+	struct list_head *blocks = &to_xe_ttm_vram_mgr_resource(res)->blocks;
+	struct drm_buddy_block *block;
+	int j =0;
+
+	list_for_each_entry(block, blocks, link) {
+		struct xe_mem_region *mr = block->private;
+		struct xe_tile *tile = mr_to_tile(mr);
+		struct drm_buddy *buddy = tile_to_buddy(tile);
+		u64 block_pfn = block_offset_to_pfn(mr, drm_buddy_block_offset(block));
+		int i;
+
+		for(i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
+			pfn[j++] = block_pfn + i;
+	}
+
+	return 0;
+}
+
 __maybe_unused
 static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
+	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
-- 
2.34.1

