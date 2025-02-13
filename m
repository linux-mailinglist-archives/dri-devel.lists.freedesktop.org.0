Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7D5A33547
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F0210E9F3;
	Thu, 13 Feb 2025 02:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xzj0WUre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A7C10E9D8;
 Thu, 13 Feb 2025 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412620; x=1770948620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MJhiTmoe7zl3ie/WW8v1d78sLIyO7+NaPkb4AxcezCc=;
 b=Xzj0WUreWZH07ssV+FFqObd5VtUDEZMgV0nbLA1A0JzoZBCLjf628GDS
 qUjtjMB2yqj0XNFEPpxipHiztYZK3sqe+adstskI0VwiR8LlvV2Ni5VWv
 j4nypUWKawt0B2YsLNyrwsIOPZ5wRz8VV6MDOED9rmN1b5c35uK+IzXuo
 eG1OWVrXYQ+Jt2+DS/Zt3cyeKU87UagucONmtImw28vrie1gC8EgyuMp3
 dEBEUsJDbq+4n5Zm7NG8AMgiAsLCNl35a9x4CDMnb85dF9/xofqSWB0FB
 27exReLffw+uc8tBD3RH2WJqx7io2joEDBStUxYZrhioCVHWyDDo62TGL g==;
X-CSE-ConnectionGUID: wIOKAx23TNipJeRwiuTWBg==
X-CSE-MsgGUID: oDVCA/+DSz2qx93/HvB3qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456053"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456053"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: gFXJHc1RR3io9PhVOz76sQ==
X-CSE-MsgGUID: z6ma9aTMR+SxW9lsNb1TUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945109"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 25/32] drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
Date: Wed, 12 Feb 2025 18:11:05 -0800
Message-Id: <20250213021112.1228481-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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
index d3a4ed693508..974d69a39445 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -7,6 +7,7 @@
 #include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
 
@@ -465,8 +466,47 @@ static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
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

