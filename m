Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED65961C49
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C9210E457;
	Wed, 28 Aug 2024 02:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggG2JsrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997110E443;
 Wed, 28 Aug 2024 02:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813290; x=1756349290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dffn3G8V5DqXAkynazLT52niPnWTv1oq1p1BNlYdnXE=;
 b=ggG2JsrSpzecF3NLa4xV9H5n+HSyTEz+NmLL57FzPMKkGv97MJDdHz66
 uN5O+/sL81H21Ik5d3iKMc4UImsRMH9PkQOHE8au31UBxJB26+7xBgpY3
 1p2gRRh2cr13M4DD7UO9sl197VZuOC8q9SebI1NSXRNK8C9l2vtQt+PTi
 zrnBU7tuYS+WQBu1IOd3CGxDAHZ02LCj6dUQLWcMXs6uE/z9HdzurcwfB
 5nY1EkVuyLesfEgoZKm8JYKwj5J379+8deUOdm2wAmyQB14oNrLg2oxQe
 OasTZnuhbcQwRYhg1Nb/RcrxHDpew6sOG2Que8GDV+dGlLhmHxRFbYtXV g==;
X-CSE-ConnectionGUID: +ESlr6mhRKKGUfQygw0+tA==
X-CSE-MsgGUID: T/5kN/vJTSikVBe2bMw0sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251930"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
X-CSE-ConnectionGUID: XAjmRqzMSk+piUc+Wwezdw==
X-CSE-MsgGUID: 3z2oBxoKT6mprXwTnkZ0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224649"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 20/28] drm/xe: Add Xe SVM populate_vram_pfn vfunc
Date: Tue, 27 Aug 2024 19:48:53 -0700
Message-Id: <20240828024901.2582335-21-matthew.brost@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6c690ba827e7..82cb5a260c87 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -9,6 +9,7 @@
 #include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
 
@@ -421,9 +422,45 @@ static int xe_svm_copy_to_sram(struct drm_gpusvm *gpusvm, struct page **pages,
 			   XE_SVM_COPY_TO_SRAM);
 }
 
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
+static int xe_svm_populate_vram_pfn(struct drm_gpusvm *gpusvm,
+				    void *vram_allocation,
+				    unsigned long npages,
+				    unsigned long *pfn)
+{
+	struct xe_bo *bo = vram_allocation;
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
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
+	.populate_vram_pfn = xe_svm_populate_vram_pfn,
 	.copy_to_vram = xe_svm_copy_to_vram,
 	.copy_to_sram = xe_svm_copy_to_sram,
 	.invalidate = xe_svm_invalidate,
-- 
2.34.1

