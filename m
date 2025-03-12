Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA0A5E61C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E359110E7A3;
	Wed, 12 Mar 2025 21:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dveIaztk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA9110E7C9;
 Wed, 12 Mar 2025 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813538; x=1773349538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dRVEafaDupiQl9FtLfS7ATNdKVhLKgQGBM/2BswVRPs=;
 b=dveIaztkwQWi0aAbjYa0wbWuHiSB3wWsdi1ixgT65cqme646VrYv/qnc
 9eo4Qp0s1FCRRSKL2x3ucEtgtCPhUih7SIavGK/BoKGYte52tMz4oXQiq
 FWJ+97e1TAtWOaUQbnvUSP43IbzeN/O+1LBAabzoBz/DFTLMIQyerBvb0
 Q4kKEk/HAC1Wrhjh8UsxFva+i1jwFsIpvGI6WWL3E1WwrvuXjcWz2NYZc
 tRPqQsiCjtVWsRR9RAjdCP98QfMUsQiwIsPiSE/j4bf5NOUONZT8y2HN5
 YYe6fj4BFnkV9mrp1wvVBZ89vVHN4tGjfVazSQC1RogYS10ftFOCpRCoi w==;
X-CSE-ConnectionGUID: WScQVHwSTnOmE+G/e9OTBw==
X-CSE-MsgGUID: BCMN+I0CSSWAeIyU1b7ERQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562248"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562248"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:37 -0700
X-CSE-ConnectionGUID: 1YOJRLo7T/ajMVGS9Uizgw==
X-CSE-MsgGUID: l69o3NVPR9SsDDCKXlXn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791217"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 14/19] drm/xe: Add a preferred dpagemap
Date: Wed, 12 Mar 2025 22:04:11 +0100
Message-ID: <20250312210416.3120-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

Introduce a preferred dpagemap, that can override the default.
The default is still the local tile vram dpagemap.
The preferred pagemap is intended to be set from user-space.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      | 18 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h      | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
 drivers/gpu/drm/xe/xe_vm_types.h |  6 ++++++
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 25d49d0d7484..660fae255a09 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -814,7 +814,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		return 0;
 
 	range_debug(range, "PAGE FAULT");
-	dpagemap = xe_tile_local_pagemap(tile);
+	dpagemap = vma->svm.pref_dpagemap ? : xe_tile_local_pagemap(tile);
 
 	/* XXX: Add migration policy, for now migrate range once */
 	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
@@ -1271,4 +1271,20 @@ xe_pagemap_find_or_create(struct xe_device *xe, struct xe_pagemap_cache *cache,
 	mutex_unlock(&cache->mutex);
 	return xpagemap;
 }
+
 #endif
+
+/**
+ * xe_svm_vma_fini() - Finalize the svm part of a vma
+ * @svma: The struct xe_svm_vma to finalize
+ *
+ * Release the resources associated with the svm
+ * metadata of a gpu vma.
+ */
+void xe_svm_vma_fini(struct xe_svm_vma *svma)
+{
+	if (svma->pref_dpagemap) {
+		drm_pagemap_put(svma->pref_dpagemap);
+		svma->pref_dpagemap = NULL;
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 3fd8fc125cba..c5d542567cfc 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -24,6 +24,16 @@ struct xe_tile;
 struct xe_vm;
 struct xe_vma;
 
+/**
+ * struct xe_svm_vma - VMA svm metadata
+ * @pref_dpagemap: Reference-counted pointer to the drm_pagemap preferred
+ * for migration on a SVM page-fault. The pointer is protected by the
+ * vm lock.
+ */
+struct xe_svm_vma {
+	struct drm_pagemap *pref_dpagemap;
+};
+
 /** struct xe_svm_range - SVM range */
 struct xe_svm_range {
 	/** @base: base drm_gpusvm_range */
@@ -124,10 +134,18 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 #define xe_svm_notifier_unlock(vm__)	\
 	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
 
+void xe_svm_vma_fini(struct xe_svm_vma *svma);
+
 struct xe_pagemap *
 xe_pagemap_create(struct xe_device *xe, struct xe_pagemap_cache *cache,
 		  struct xe_vram_region *vr);
 
+static inline void xe_svm_vma_assign_dpagemap(struct xe_svm_vma *svma,
+					      struct drm_pagemap *dpagemap)
+{
+	svma->pref_dpagemap = drm_pagemap_get(dpagemap);
+}
+
 #else
 #include <linux/interval_tree.h>
 
@@ -213,6 +231,10 @@ static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
 {
 }
 
+#define xe_svm_vma_fini(...) do {} while (0)
+
+#define xe_svm_vma_assign_dpagemap(...) do {} while (0)
+
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 07c4992fb3d7..4eea35957549 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1246,6 +1246,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 
+	xe_svm_vma_fini(&vma->svm);
+
 	if (vma->ufence) {
 		xe_sync_ufence_put(vma->ufence);
 		vma->ufence = NULL;
@@ -2516,6 +2518,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
+				xe_svm_vma_assign_dpagemap(&vma->svm, old->svm.pref_dpagemap);
 				op->remap.prev = vma;
 
 				/*
@@ -2547,6 +2550,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					return PTR_ERR(vma);
 
 				op->remap.next = vma;
+				xe_svm_vma_assign_dpagemap(&vma->svm, old->svm.pref_dpagemap);
 
 				/*
 				 * Userptr creates a new SG mapping so
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 08baea03df00..0e6b6e0251d1 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -17,6 +17,7 @@
 #include "xe_device_types.h"
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
+#include "xe_svm.h"
 
 struct xe_bo;
 struct xe_svm_range;
@@ -128,6 +129,11 @@ struct xe_vma {
 	 * Needs to be signalled before UNMAP can be processed.
 	 */
 	struct xe_user_fence *ufence;
+
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
+	/** @svm: SVM metadata attached to the vma. */
+	struct xe_svm_vma svm;
+#endif
 };
 
 /**
-- 
2.48.1

