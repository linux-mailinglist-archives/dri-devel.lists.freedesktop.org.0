Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86810A3353F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6013910E9E5;
	Thu, 13 Feb 2025 02:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOxfd2cI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEA010E24D;
 Thu, 13 Feb 2025 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412620; x=1770948620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VUBYG7zwZtMGRFOLZwjYeY575ra1WMaakyA6XP1vr88=;
 b=QOxfd2cIteGhfXbvaChkZheyjfAEocYwmN29CwZ/p4rVyeQ09PLYjWIt
 LYV/+HsQjIZ60Ec7RptGSZHej2g4Dxb0AqfBweqzhWfnNtNpv/ntVdeus
 50B6035c1ZWJPKopUt88+nkzoCuLmpn4SmUhbgUCIxvxbw2nYHBEVnnmY
 NUHxzEHmwEEUltbshI+46uefEbf9uC96MGUm/QD38393LySrEZyP8pOlG
 aIqW7pzk2lEVjvcp1Tg85cc9TKzIztj1CktQFz88RS1q5olyQpOUbF5Gt
 2/tQXkfc04M0SmDkZxXKS9EaQHhUSyFpv8cP/+lXZrKkFuDCqrlneumaO A==;
X-CSE-ConnectionGUID: e6/vnZrWTFC8RJRd2cYEUA==
X-CSE-MsgGUID: l14m+TaiSJSeJ1Dpvn9N0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456058"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456058"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: J7yTcxVmTPW5C1bLwwtCkA==
X-CSE-MsgGUID: 8TSn7tmxSpqKEQzhlYoFWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945111"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 26/32] drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
Date: Wed, 12 Feb 2025 18:11:06 -0800
Message-Id: <20250213021112.1228481-27-matthew.brost@intel.com>
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

Implement with a simple BO put which releases the device memory.

v2:
 - Use new drm_gpusvm_devmem_ops
v3:
 - Better commit message (Thomas)
v4:
 - Use xe_bo_put_async (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 974d69a39445..0a78a838508c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include "xe_bo.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt.h"
@@ -471,6 +472,13 @@ static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
 	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
 }
 
+static void xe_svm_devmem_release(struct drm_gpusvm_devmem *devmem_allocation)
+{
+	struct xe_bo *bo = to_xe_bo(devmem_allocation);
+
+	xe_bo_put_async(bo);
+}
+
 static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 {
 	return PHYS_PFN(offset + vr->hpa_base);
@@ -506,6 +514,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 
 __maybe_unused
 static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
+	.devmem_release = xe_svm_devmem_release,
 	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
-- 
2.34.1

