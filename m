Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82D9F5A7A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E44E10EABB;
	Tue, 17 Dec 2024 23:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZdAhlsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684CA10EA96;
 Tue, 17 Dec 2024 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478393; x=1766014393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tLe96lD4/vdfrw7RBqJXlbOnMZbo8zrGGTqMjYQsD/s=;
 b=DZdAhlscdd/X6iRGiG71zopYxA+GfSiB0zJs76XfGExALNLiXiSCNLT5
 F1z0cJUaXNmCtyLlSIkvcecy5aZqD2wAkNCbsJmSHqcnFrhyUZpFMnQ9+
 vIjAVGLLJB2Of5aj1DTNYFP/TbIl7txYeDYqTgMUUqHUApxMH7qsk0PLK
 /DXf5Q0yV9+JGt6NvS8YTPhOgNMG/92PUSWhm/qT+57V82XaBbXKh+hU0
 T0GCheR3ErjJLgI/a0CwxcKkNa78cEN+TIBVLRH4gDGTW86A8xvhzvmos
 btHG0K+vwRfgrF5KIhmAPlAB6CeTJ5A69T2wX3cuxClw1jJEZ23CeS08h A==;
X-CSE-ConnectionGUID: ZI/9PfOMR7OQmJn01KHu+A==
X-CSE-MsgGUID: Z18t4da0RE290/rLn/RliA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517463"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517463"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:12 -0800
X-CSE-ConnectionGUID: q0bXUw0oSvq2wCK91laMIw==
X-CSE-MsgGUID: 6hbCpNDhSeSdB4mtIHawGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273454"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 23/30] drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
Date: Tue, 17 Dec 2024 15:33:41 -0800
Message-Id: <20241217233348.3519726-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Get device pfns from BO's buddy blocks. Used in migrate_* core MM
functions called in GPU SVM to migrate between device and system memory.

v2:
 - Use new drm_gpusvm_devmem_ops
v3:
 - Better commit message (Thomas)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index dcd99520a6d9..16d526b2d19a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -7,6 +7,7 @@
 #include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
 
@@ -454,8 +455,47 @@ static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
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
+	int j = 0;
+
+	list_for_each_entry(block, blocks, link) {
+		struct xe_mem_region *mr = block->private;
+		struct xe_tile *tile = mr_to_tile(mr);
+		struct drm_buddy *buddy = tile_to_buddy(tile);
+		u64 block_pfn = block_offset_to_pfn(mr, drm_buddy_block_offset(block));
+		int i;
+
+		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
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

