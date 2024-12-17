Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE939F5A75
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E814A10EAB0;
	Tue, 17 Dec 2024 23:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYnMbwz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B60A10EA86;
 Tue, 17 Dec 2024 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478393; x=1766014393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JlA2cAgAUm7utvXYPtvqjBrFoIUaqmvyRHHQWTJ4vQQ=;
 b=XYnMbwz3JRPUFC0pLIU0y5q19C/eu0k2qYh17AHsDeBDSvQpFOBVK4bv
 I5gFv28euZJbHVJVwpjBAEOUxSUNrwhdD1k8f294PXvY1qH4h/pSr3ZbO
 fHW95IUvQ2hYi5W60dInV944zvVBtmNexRwoc1VsOE1K1wC3umw0m/NW1
 XUD8MT25ai+HxJDc0Ibvfe494lcOdvSs+6Zto51VR9lwk+NFs9DWwmPlv
 Mh3z224Yp8uE/EWFkys7GORD0nVeIm1dSVCzSvntt8Sm31/zrty3G2hrE
 VgJ7TGz5D5SOwSTsqQjVG46U51up6+4uySarTFVS9CaZ1/Dr0NcxSshGv A==;
X-CSE-ConnectionGUID: virD38LRQbSXnRF6x/G16w==
X-CSE-MsgGUID: l4DinK3DS5ift7H2u+QfTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517470"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517470"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:13 -0800
X-CSE-ConnectionGUID: fltwTPoNRLqHsQ0p3BWu8A==
X-CSE-MsgGUID: QQ/3k6ihT46DJyStRhOErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273456"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 24/30] drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
Date: Tue, 17 Dec 2024 15:33:42 -0800
Message-Id: <20241217233348.3519726-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 16d526b2d19a..466a0b8cbfa8 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include "xe_bo.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt.h"
@@ -460,6 +461,11 @@ static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
 	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
 }
 
+static void xe_svm_devmem_release(struct drm_gpusvm_devmem *devmem_allocation)
+{
+	xe_bo_put(to_xe_bo(devmem_allocation));
+}
+
 static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
 {
 	return PHYS_PFN(offset + mr->hpa_base);
@@ -495,6 +501,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 
 __maybe_unused
 static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
+	.devmem_release = xe_svm_devmem_release,
 	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
-- 
2.34.1

