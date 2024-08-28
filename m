Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD00961C48
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6168C10E456;
	Wed, 28 Aug 2024 02:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FY0cVVMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7460D10E44B;
 Wed, 28 Aug 2024 02:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813290; x=1756349290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SM8XB4VrHy7O7uQVm5RJ4pT4QRxR7TsVKZl2nXaN9yM=;
 b=FY0cVVMw/hL8PMgrEr2UWlwRhId6AlMsjqFF4/ANR7P25ZCXJzS99b/X
 YZQoyRrw5DW1KWa9igcpHpGSGRuxK+af0bvR6JVt9HPEqBFmbTnIRqRLI
 Zw/tVeBqVmuB+xuSaTZrkoTOd6Zoer+7yipLvXYDahQn5tvVoqd+Ny0tY
 X5i7OFJcI+4hrRvVGyfSSYERpUUaoKGdRd3j4Hxcs44a+kiLt5PvI/OcD
 vP545K27Ne8j7o7+MbDR42i5IQGaX7jveKA9E+smllki2p8NZoGwo/0cS
 TU6gd+qRyBSyDJTDicsVlUMXmSvOH2H5mVnG+d8j1fEHDiWHeNGvBUoMa A==;
X-CSE-ConnectionGUID: 56hjmnEyQdOziFHjQl8EXA==
X-CSE-MsgGUID: Q2kU9nGGRE2/3CDfJHan5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251934"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251934"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
X-CSE-ConnectionGUID: QasRnbUpRJCAI7sYOwu99g==
X-CSE-MsgGUID: i7OB8gWiRxqUSlDs9ks4Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224654"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 21/28] drm/xe: Add Xe SVM vram_release vfunc
Date: Tue, 27 Aug 2024 19:48:54 -0700
Message-Id: <20240828024901.2582335-22-matthew.brost@intel.com>
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

Implement with a simple BO put.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 82cb5a260c87..4372c02a341f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -5,6 +5,7 @@
 
 #include "drm_gpusvm.h"
 
+#include "xe_bo.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt.h"
@@ -422,6 +423,11 @@ static int xe_svm_copy_to_sram(struct drm_gpusvm *gpusvm, struct page **pages,
 			   XE_SVM_COPY_TO_SRAM);
 }
 
+static void xe_svm_vram_release(void *vram_allocation)
+{
+	xe_bo_put(vram_allocation);
+}
+
 static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
 {
 	return PHYS_PFN(offset + mr->hpa_base);
@@ -460,6 +466,7 @@ static int xe_svm_populate_vram_pfn(struct drm_gpusvm *gpusvm,
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
+	.vram_release = xe_svm_vram_release,
 	.populate_vram_pfn = xe_svm_populate_vram_pfn,
 	.copy_to_vram = xe_svm_copy_to_vram,
 	.copy_to_sram = xe_svm_copy_to_sram,
-- 
2.34.1

