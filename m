Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E7A53FD7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68BC10E8AC;
	Thu,  6 Mar 2025 01:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoSGeuWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3DD10E88A;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bSwL+ByjRVhRP3kt+Wcm3zQSIt3Ltqiq+Ln8sFPkWXw=;
 b=UoSGeuWdehIqSvegJydh7AMEFG0SbBgzmkme3glhbdfvDhtg+b2xv8vo
 UDwYQ0MGlsLEDWFGI/y9ztitwJBObF9TBRL5onzfSRBvOzvMimnjVopWE
 1V60Jj62+or6xiwFl6mW7/FfHXoE+A9qw1v1+Ernr0OdvBGoxx0uZmWw0
 bxUgGcsFGce4wUUhCVrDXjxX6dwgurvC2S2G3E6Uafk8OmvI/rXV6+PYR
 vi8VtxhSmHX6U6cpxj8xZ9TbMu5A6zR22b8pjxXw/VHXMdLFhlWrA9GrQ
 NEaaUI3+DJ0KqdG89Mhi/53gvZqBX48SqtcwKfZzTT3BaXSxbu+NgUGjE g==;
X-CSE-ConnectionGUID: CFOpHweVQq28XNa5AIIFDA==
X-CSE-MsgGUID: dpNxXwQdT2aI3ubF+Sl6pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427420"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427420"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
X-CSE-ConnectionGUID: G+EXA7mYQZyEJ14CK89YEQ==
X-CSE-MsgGUID: c5ExH3wzRm6huzHk66YiFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063308"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 25/32] drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
Date: Wed,  5 Mar 2025 17:26:50 -0800
Message-Id: <20250306012657.3505757-26-matthew.brost@intel.com>
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

Get device pfns from BO's buddy blocks. Used in migrate_* core MM
functions called in GPU SVM to migrate between device and system memory.

v2:
 - Use new drm_gpusvm_devmem_ops
v3:
 - Better commit message (Thomas)
v5:
 - s/xe_mem_region/xe_vram_region (Rebase)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 4983d4175388..6e6a51eac5e5 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -7,6 +7,7 @@
 #include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
 
@@ -461,8 +462,47 @@ static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
 	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
 }
 
+static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
+{
+	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
+}
+
+static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
+{
+	return PHYS_PFN(offset + vr->hpa_base);
+}
+
+static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
+{
+	return &tile->mem.vram.ttm.mm;
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
+		struct xe_vram_region *vr = block->private;
+		struct xe_tile *tile = vr_to_tile(vr);
+		struct drm_buddy *buddy = tile_to_buddy(tile);
+		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
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

