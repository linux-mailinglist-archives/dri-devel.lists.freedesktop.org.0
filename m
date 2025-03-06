Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A059A53FD6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACD110E8A8;
	Thu,  6 Mar 2025 01:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kyb0bDaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B3410E899;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kGrMVv9bLY8UuT+9kVJjMHW5bznoJGJ6HpmiSXJl6s=;
 b=Kyb0bDaBrK3Q4vfsd/WMgvP9u9+fCvMZZ/aqvOrHWXHI9xLumDoWwMFJ
 3QhO9+74aItALdab+q0EzAqdzArIQcGHeAuwCbvqGBz0uKUW55f2Y/NC8
 3jhr8BkEeDXM9/7ZmD40rP1INYz5FXzhsMA8Kn51ZpfNvRdMiiLL9hnZj
 NKRk4Q+jMnOiyd3HgI1bOEdprFQi0zjs9LCYNFdoEzI4Zja262neM4mUA
 gopEkt0u4WsRB2I8H0h1bRCkpdEcP+YWBSkMUp2LmPjEzbiu1G+7L8+jH
 7LvEh/j9Db2GrKOCbYJMKki8zuoIdJBTKUQXHsjzbS5u8SK5LZTAKWbkk g==;
X-CSE-ConnectionGUID: 9XemgxzjSMqyMlnTFLfdrg==
X-CSE-MsgGUID: tYKQWIpwQlWE/CEXo5xxjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427426"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427426"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
X-CSE-ConnectionGUID: FcY9XT22R2CLgkNcvm1oBA==
X-CSE-MsgGUID: oLpxPjXQScGa0ikPOx/PyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063311"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 26/32] drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
Date: Wed,  5 Mar 2025 17:26:51 -0800
Message-Id: <20250306012657.3505757-27-matthew.brost@intel.com>
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

Implement with a simple BO put which releases the device memory.

v2:
 - Use new drm_gpusvm_devmem_ops
v3:
 - Better commit message (Thomas)
v4:
 - Use xe_bo_put_async (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6e6a51eac5e5..cb3567b561be 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include "xe_bo.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt.h"
@@ -467,6 +468,13 @@ static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
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
@@ -502,6 +510,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 
 __maybe_unused
 static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
+	.devmem_release = xe_svm_devmem_release,
 	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
-- 
2.34.1

