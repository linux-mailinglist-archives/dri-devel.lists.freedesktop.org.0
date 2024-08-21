Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6858959792
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 12:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA2F10E8BD;
	Wed, 21 Aug 2024 10:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eG50+pai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A7610E8BC;
 Wed, 21 Aug 2024 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724235536; x=1755771536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WwZ8Wf+/9YgnIUDxCb37b9Jxq5QSJt4H6stId2C1728=;
 b=eG50+paiAGfsS3d+B3qzjCj/EDysaiA0WXxV7R/ZWJ83BcXiLvBJRUpr
 pCclLjEOvfxwnrofKbDIf/8EpsyygsZkAp7SGa19GhQKZ1kErM9FDqgwp
 BFn9T5P1zl/etJFd5FtiX6v9Ncv5wpSmR25FkkuDyUL/u5xHVXotOEWE8
 SSPjvjeGbGBjqejJ+HK3Gwg6xvrBqhQpeOIueqHEP1rKBrmfJFZkYbjcZ
 M8VPhLuMbIUa3SubWMsBVyOnUTj2r2wa4S3/6Di3qX+cE/5tGsfM+0GuR
 xpOjeoGS+esoFupOy6c/Kl6qRT48vH3CZd5yQtA4vcmHcZo1zN2ZbNQgg Q==;
X-CSE-ConnectionGUID: yzA5wa9ZSeCZo9+wWlg+kg==
X-CSE-MsgGUID: 55jCrQ82RVGBXX4lh/7wmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22720555"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22720555"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 03:18:56 -0700
X-CSE-ConnectionGUID: i3qr9jujTMOgstkcmqXdqg==
X-CSE-MsgGUID: TRuOvZDHRbqJchuHNyB85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65880954"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 03:18:54 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/2] drm/xe/lnl: Only do gpu sys page clear for non-pooled BOs
Date: Wed, 21 Aug 2024 11:50:34 +0200
Message-ID: <20240821095035.29083-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Currently XE lacks clean-on-free implementation so using
TTM_TT_FLAG_CLEARED_ON_FREE is invalid. Remove usage of
TTM_TT_FLAG_CLEARED_ON_FREE and limit gpu system page clearing
only for WB cached BOs which are not pooled so there is no need to
return a zeroed pages to a pool.

Without the patch:
api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
UsmMemoryAllocation(api=l0 type=Host size=4KB) 79.439 us
UsmMemoryAllocation(api=l0 type=Host size=1GB) 98677.75 us
Perf tool top 5 entries:
11.16%  api_overhead_be [kernel.kallsyms] [k] __pageblock_pfn_to_page
7.85%  api_overhead_be  [kernel.kallsyms] [k] cpa_flush
7.59%  api_overhead_be  [kernel.kallsyms] [k] find_next_iomem_res
7.24%  api_overhead_be  [kernel.kallsyms] [k] pages_are_mergeable
5.53%  api_overhead_be  [kernel.kallsyms] [k] lookup_address_in_pgd_attr

With the patch:
UsmMemoryAllocation(api=l0 type=Host size=4KB) 78.164 us
UsmMemoryAllocation(api=l0 type=Host size=1GB) 98880.39 us
Perf tool top 5 entries:
25.40% api_overhead_be  [kernel.kallsyms] [k] clear_page_erms
9.89%  api_overhead_be  [kernel.kallsyms] [k] pages_are_mergeable
4.64%  api_overhead_be  [kernel.kallsyms] [k] cpa_flush
4.04%  api_overhead_be  [kernel.kallsyms] [k] find_next_iomem_res
3.96%  api_overhead_be  [kernel.kallsyms] [k] mod_find

This is still better than the base case where there was no
page clearing offloading.

Cc: Christian König <christian.koenig@amd.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6ed0e1955215..a18408d5d185 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -283,6 +283,7 @@ struct xe_ttm_tt {
 	struct device *dev;
 	struct sg_table sgt;
 	struct sg_table *sg;
+	bool clear_system_pages;
 };
 
 static int xe_tt_map_sg(struct ttm_tt *tt)
@@ -397,12 +398,17 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	}
 
 	/*
-	 * If the device can support gpu clear system pages then set proper ttm
+	 * If the device can support gpu clear system pages then set proper
 	 * flag. Zeroed pages are only required for ttm_bo_type_device so
 	 * unwanted data is not leaked to userspace.
+	 *
+	 * XE currently does clear-on-alloc so gpu clear will only work on
+	 * non-pooled BO, DRM_XE_GEM_CPU_CACHING_WB otherwise global pool will
+	 * get poisoned ono-zeroed pages.
 	 */
-	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
-		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
+	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys &&
+	    bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)
+		tt->clear_system_pages = true;
 
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
@@ -416,8 +422,11 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 			      struct ttm_operation_ctx *ctx)
 {
+	struct xe_ttm_tt *xe_tt;
 	int err;
 
+	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
 	/*
 	 * dma-bufs are not populated with pages, and the dma-
 	 * addresses are set up when moved to XE_PL_TT.
@@ -426,7 +435,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 		return 0;
 
 	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear system pages */
-	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
+	if (xe_tt->clear_system_pages)
 		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
 
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
@@ -664,6 +673,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	struct ttm_resource *old_mem = ttm_bo->resource;
 	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
 	struct ttm_tt *ttm = ttm_bo->ttm;
+	struct xe_ttm_tt *xe_tt = container_of(ttm, struct xe_ttm_tt, ttm);
 	struct xe_migrate *migrate = NULL;
 	struct dma_fence *fence;
 	bool move_lacks_source;
@@ -671,15 +681,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool needs_clear;
 	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
-	bool clear_system_pages;
+	bool clear_system_pages = false;
 	int ret = 0;
 
 	/*
 	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
 	 * moving to system as the bo doesn't have dma_mapping.
 	 */
-	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
-		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
+	if (!old_mem && ttm && !ttm_tt_is_populated(ttm) &&
+	    xe_tt->clear_system_pages)
+		xe_tt->clear_system_pages = false;
 
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
@@ -703,7 +714,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
 
-	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
+	clear_system_pages = ttm && xe_tt->clear_system_pages;
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
 		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
 		clear_system_pages;
-- 
2.42.0

