Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BABA4344D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7046610E572;
	Tue, 25 Feb 2025 04:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFw88Eq8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6570C10E54B;
 Tue, 25 Feb 2025 04:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458536; x=1771994536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bSwL+ByjRVhRP3kt+Wcm3zQSIt3Ltqiq+Ln8sFPkWXw=;
 b=JFw88Eq8ClwKLKJUbkPKPCjCj6sswmlOqK5gpvR8APS8c+gEcUVaf7Pv
 nxvat1MZPFYvp9Xj6YiLPxS5QD8PxoEQJW20MiBH1dKLwMKfW004hq17o
 FHjHVYCZarPbAHeiK308jlhTI8J+krvr+OucKSF9EhyEADib7tx8HlefV
 Oml9wHUaows63Iol43OYAZ3XZD1vBCsW8s1qqvJsQMVzLybISNvtL5LS2
 rlbEx1F3J8UHH2OCrAIpaNrUiRVbJXps/9+JNsi2onJwpyDPigb7Rm8kr
 sGP1KzVvVLZqNOP4DIcvstmUbmSvuMPHfHI7oFjN67m5Ehjb01phyohN4 w==;
X-CSE-ConnectionGUID: 8ZEWmHm0RVePaN1DvWUxqQ==
X-CSE-MsgGUID: X/nSvu4XQ5esFNllA7vmnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885054"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885054"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:15 -0800
X-CSE-ConnectionGUID: NsGIqnbKSMiv8JTGU6Kqlg==
X-CSE-MsgGUID: zsMmhiPgThikN87y+2Ul8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290320"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 25/32] drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
Date: Mon, 24 Feb 2025 20:43:04 -0800
Message-Id: <20250225044311.3178695-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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

