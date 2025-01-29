Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B83A224C8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7710E8C1;
	Wed, 29 Jan 2025 19:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNSZewC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12A410E8A1;
 Wed, 29 Jan 2025 19:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180286; x=1769716286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BtgbjqJfYE64J72drVQuHJ2BfatWLBYdvsTxfPZMQOw=;
 b=HNSZewC6fY6Gy43yMiijuonDw1+FA9nSinwfSkyXxNk3Z/dkzynStW/L
 oenAhEAdwB0PTvp5a82EsQ1jlAe29qM3nZP4NSq+RlyJrsAi+HKcABsO1
 4/sfd+AodCIaeeztfaEHzcjTxyOoZNxd2iFa9h2Rxt1CaZMyFCtvEv5bp
 gOyTmi1Ump+0XSGmUPC/l8Sfh390tXA3EMhP+kGmIQWMTsOV/mI/GOEZH
 YnUEtZKfGdf+nETqU1nNfXOqwN4AuLE5BIWaAi434JqKU6rCuSeFWH6V4
 g6PTk6mG6/cbUgD3Fdwde0aUYQwbn22XVav5fas+zvvGQmv5TD0NiFhXd A==;
X-CSE-ConnectionGUID: giB/9CyNRZqAMADniKWmlg==
X-CSE-MsgGUID: tAocHjh9QGqo0GoomOqqZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132865"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132865"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:25 -0800
X-CSE-ConnectionGUID: Kt+bU59ARRS7dva9VH1YPg==
X-CSE-MsgGUID: dWGDq5jET/GIIIIP3zQC8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392188"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 26/33] drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
Date: Wed, 29 Jan 2025 11:52:05 -0800
Message-Id: <20250129195212.745731-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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
index 1fbb9777ee0c..ba1db030bf33 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include "xe_bo.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt.h"
@@ -461,6 +462,13 @@ static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
 	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
 }
 
+static void xe_svm_devmem_release(struct drm_gpusvm_devmem *devmem_allocation)
+{
+	struct xe_bo *bo = to_xe_bo(devmem_allocation);
+
+	xe_bo_put_async(bo);
+}
+
 static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
 {
 	return PHYS_PFN(offset + mr->hpa_base);
@@ -496,6 +504,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 
 __maybe_unused
 static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
+	.devmem_release = xe_svm_devmem_release,
 	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
-- 
2.34.1

