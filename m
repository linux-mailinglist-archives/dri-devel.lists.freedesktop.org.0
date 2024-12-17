Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB89F5A68
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DA610EAA1;
	Tue, 17 Dec 2024 23:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijDorBL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104DB10EA86;
 Tue, 17 Dec 2024 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478394; x=1766014394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SIxYHubM01zxDG7InLnNikjuJeTuPgn3vS7IU0vL8TY=;
 b=ijDorBL0KLnAkZ3Jw1SA31zEXG5bVK89f/EMYW6BJXsgG/S/M3RfmEAd
 ARkEVqugOa8hKzLhEgDGuhZBKr6VQplgNYpLBXZ9E4QbyjXJx2oKo1bIk
 xdMLBJMeqd3DAW4GWYDBIFbxxNEv/jZSaQiMACwK0hPZfhTpUYXPsD8Tx
 E9V80SxwPHEIfZzlj1eDNRicQ1JXctCnOgcV6CKfCzmyhwA7uMfolc3ve
 jLzoyUXpgHaZ/NAM8dJR3PO0vYAIWx6mfjgHOn4MZ82Pon/TAaFoHHHcu
 hk52o/rT2EFybReCUKWfPPePzUz4SWvwHebuFskWvKPbg0/lVc69R5AYx w==;
X-CSE-ConnectionGUID: rULhjA57SXe89vFZZJNj9g==
X-CSE-MsgGUID: 4AIN14JPT1m0GHVFia0Nvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517488"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:13 -0800
X-CSE-ConnectionGUID: 8XL7PIouQo2Ro4h8/mDj5g==
X-CSE-MsgGUID: 5+IgIdtPSPqaQdK4vUOfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273462"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 27/30] drm/xe: Basic SVM BO eviction
Date: Tue, 17 Dec 2024 15:33:45 -0800
Message-Id: <20241217233348.3519726-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Wire xe_bo_move to GPU SVM migration via new helper xe_svm_bo_evict.

v2:
 - Use xe_svm_bo_evict
 - Drop bo->range
v3:
 - Kernel doc (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a417d8942da4..8780a0b2c81e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -768,6 +768,20 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
 
+/**
+ * xe_svm_bo_evict() - SVM evict BO to system memory
+ * @bo: BO to evict
+ *
+ * SVM evict BO to system memory. GPU SVM layer ensures all device pages
+ * are evicted before returning.
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int xe_svm_bo_evict(struct xe_bo *bo)
+{
+	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
+}
+
 #if IS_ENABLED(CONFIG_XE_DEVMEM_MIRROR)
 static struct drm_pagemap_dma_addr
 xe_drm_pagemap_map_dma(struct drm_pagemap *dpagemap,
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index d549dd9e8641..9e9d333bb9d3 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -56,6 +56,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
+int xe_svm_bo_evict(struct xe_bo *bo);
+
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
 	return drm_gpusvm_range_pages_valid(range->base.gpusvm, &range->base);
-- 
2.34.1

