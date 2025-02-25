Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB96A43454
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DFD10E578;
	Tue, 25 Feb 2025 04:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLxGU2cN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981CE10E54F;
 Tue, 25 Feb 2025 04:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458536; x=1771994536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kGrMVv9bLY8UuT+9kVJjMHW5bznoJGJ6HpmiSXJl6s=;
 b=LLxGU2cNNkSTxDZ/6VTvwRzlXJuO35B4m0SDb1Axg+NhwDur7Ia5LUK9
 pbpoKcO+DdUjxk1gzybjY8qs5hEjXVXjvn0aM0go7nyJMFqLXnA8/mh4j
 lEBraY2aHTTBprGs5f2oY4ZHnL6ENGZmvHSvK2fdr0hLRgql+mKA8wTUZ
 HuvZKzbo/qa1uuV5twK63ZlGrtxl8s7tXtY6yBVIWR8qc5qpiuoSqaMwr
 MVEqzngkrkXx/6uAfXkbXoSc1rpjY23ZvAeTauQHadbW99tXWhdpI1jvN
 P6Wb0BeawqrrIXLp+VUeB7u6PA5tIRTbjZhEsn4h2KbQywn1gl/ng2Y89 g==;
X-CSE-ConnectionGUID: bTz5JkPlTLW7hbZBoKrxGA==
X-CSE-MsgGUID: vSG/llwpQwicumeqpvhN5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885060"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:15 -0800
X-CSE-ConnectionGUID: UULpg/nFRF6FpFjBo8qxdA==
X-CSE-MsgGUID: WyCEcqHBTICWZkfHCV1v3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290323"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 26/32] drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
Date: Mon, 24 Feb 2025 20:43:05 -0800
Message-Id: <20250225044311.3178695-27-matthew.brost@intel.com>
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

