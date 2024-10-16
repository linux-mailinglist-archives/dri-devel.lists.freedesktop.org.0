Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08399FF6E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0058310E67B;
	Wed, 16 Oct 2024 03:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzS/pFMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8EA10E65A;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049101; x=1760585101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h2evK/5DBRBfRJ+ldw/Gfm5vxi1D3heD5gJw9vcczOA=;
 b=lzS/pFMglIcg5vcJkfrnq0B80vWzQONiqTCB5sbai4AHhNh5bEv7UHdE
 TLuE1AN06KlLX34efcpdfOpvO5Jp5M/AiG12yvEN5anqDgbyPuj7ZRfcz
 NxApoeLZo7TiyqJelodXXbGElvj13UV9IVYxPkCyybskn/1CAhPylIDvH
 vLb/HiyiDN14dxocex2PiA32vWCGa0ZQd9Jv0PNnuq2EM2mbBu3nWvMpW
 xF5MC0kCj4//OWxehL8iXcWW7EjE3JziPiibW9cWPFHXekicPdd4fQ9vI
 r0xxfYsw0DP4LKXsqirOUbRCz520eckqakjVheJWBojtqPC3bRRgz2Gsf Q==;
X-CSE-ConnectionGUID: Xamk1HmNRPSxLjdCu6Tf4w==
X-CSE-MsgGUID: KiyAKXUiTSaSj5IMkgef6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056474"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056474"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: R/kTC2jTSAqsX/CE8fFw1g==
X-CSE-MsgGUID: PvIWz52LR+m4ToyM1yE4Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930277"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 25/29] drm/xe: Basic SVM BO eviction
Date: Tue, 15 Oct 2024 20:25:14 -0700
Message-Id: <20241016032518.539495-26-matthew.brost@intel.com>
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

Wire xe_bo_move to GPUSVM migration to SRAM with trylocking of mmap
lock.

v2:
 - Use xe_svm_bo_evict
 - Drop bo->range

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.c |  5 +++++
 drivers/gpu/drm/xe/xe_svm.h |  3 +++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index dbd03383878e..17d158762e03 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -25,6 +25,7 @@
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
+#include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -250,6 +251,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
 			   struct ttm_placement *placement)
 {
+	struct xe_bo *bo;
+
 	if (!xe_bo_is_xe_bo(tbo)) {
 		/* Don't handle scatter gather BOs */
 		if (tbo->type == ttm_bo_type_sg) {
@@ -261,6 +264,12 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 		return;
 	}
 
+	bo = ttm_to_xe_bo(tbo);
+	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) {
+		*placement = sys_placement;
+		return;
+	}
+
 	/*
 	 * For xe, sg bos that are evicted to system just triggers a
 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
@@ -738,6 +747,17 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		}
 	}
 
+	if (!move_lacks_source && (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) &&
+	    new_mem->mem_type == XE_PL_SYSTEM) {
+		ret = xe_svm_bo_evict(bo);
+		if (!ret) {
+			drm_dbg(&xe->drm, "Evict system allocator BO success\n");
+			ttm_bo_move_null(ttm_bo, new_mem);
+		}
+
+		goto out;
+	}
+
 	if (!move_lacks_source &&
 	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
 	     (mem_type_is_vram(old_mem_type) &&
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 31b80cde15c4..555bc71ae523 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -752,3 +752,8 @@ int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
 		 tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
 	return 0;
 }
+
+int xe_svm_bo_evict(struct xe_bo *bo)
+{
+	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 6893664dae70..5b9d5ac9ef72 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -11,6 +11,7 @@
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
+struct xe_bo;
 struct xe_mem_region;
 struct xe_tile;
 struct xe_vm;
@@ -35,6 +36,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    bool atomic);
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
+int xe_svm_bo_evict(struct xe_bo *bo);
+
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
 	return drm_gpusvm_range_pages_valid(range->base.gpusvm, &range->base);
-- 
2.34.1

