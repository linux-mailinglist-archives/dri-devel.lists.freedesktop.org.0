Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6E961C53
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B051B10E44C;
	Wed, 28 Aug 2024 02:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuB+3uKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF5D10E44E;
 Wed, 28 Aug 2024 02:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813290; x=1756349290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JkbPLNkKBaSRiE5EGFBuRjRblyt1zA7OOQaLpNyGVeM=;
 b=cuB+3uKa1EQx9CqhAQdTXOF5exScpN4HbqUMEpFgO/wZJIhsWwUQ4gsb
 UafVBJKgE9C34GmWpyuorPeQydGocIT9dBzyBmmF7QwL6TM4kxNb1yp+P
 hdu7QeORbD3SSQC+Zj3yrqgSnnLHEnDWUt7A1JfPFn22DYYaGU9bdAM7Q
 u2J//zj4AkzIdoay9r0VGEV9ncpNoSJm/zj7itv+yeqQTP+Lh27hFzBEn
 ho4RYW3sqelNZ8G8W9xxOVK+4xJwkLtqjN7figX/tu7q56dkuLudGsRH3
 J68NtfUNThz5mfR37aCVn068of5cZpKav3jWS5lchmeVTzblR3eTBHoRR w==;
X-CSE-ConnectionGUID: PPAvnqQtSguj0rCJ6fPP4w==
X-CSE-MsgGUID: SpvnCP/qRcOorYpke97moQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251926"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251926"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
X-CSE-ConnectionGUID: YcSSrhn4TX+N3vaaddauWQ==
X-CSE-MsgGUID: uMDBUtBySI+w5lNOX1iVXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224646"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 19/28] drm/xe: Update PT layer to understand ranges in VRAM
Date: Tue, 27 Aug 2024 19:48:52 -0700
Message-Id: <20240828024901.2582335-20-matthew.brost@intel.com>
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

Kinda cheating here using BO directly rather than VRAM pages. Same at
the moment as mixed mappings are not supported. If this changes, then
the arary of pages / dma addresses will need a cursor.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  | 22 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.h | 10 ++++++++++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index fc86adf9f0a6..e9195029ea60 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -607,9 +607,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_bo *bo = xe_vma_bo(vma);
-	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
-		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
+	bool range_devmem = range && xe_svm_range_in_vram(range);
+	struct xe_bo *bo = range_devmem ? range->base.vram_allocation :
+		xe_vma_bo(vma);
+	bool is_devmem = range_devmem ||
+		(!xe_vma_is_userptr(vma) && bo &&
+		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo)));
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
 		.base = {
@@ -675,9 +678,16 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	xe_bo_assert_held(bo);
 
 	if (range) {
-		xe_res_first_dma(range->base.dma_addr, 0,
-				 range->base.va.end - range->base.va.start,
-				 range->base.order, &curs);
+		if (is_devmem)
+			xe_res_first(bo->ttm.resource, 0,
+				     range->base.va.end - range->base.va.start,
+				     &curs);
+		else if (xe_svm_range_has_dma_mapping(range))
+			xe_res_first_dma(range->base.dma_addr, 0,
+					 range->base.va.end - range->base.va.start,
+					 range->base.order, &curs);
+		else
+			return -EAGAIN;	/* Invalidation corner case */
 	} else if (!xe_vma_is_null(vma)) {
 		if (xe_vma_is_userptr(vma))
 			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index f15df5c813f1..8b72e91cc37d 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -35,6 +35,16 @@ static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 	return drm_gpusvm_range_pages_valid(range->base.gpusvm, &range->base);
 }
 
+static inline bool xe_svm_range_in_vram(struct xe_svm_range *range)
+{
+	return range->base.flags.has_vram_pages;
+}
+
+static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
+{
+	return range->base.flags.has_dma_mapping;
+}
+
 #define xe_svm_notifier_lock(vm__)	\
 	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
 
-- 
2.34.1

