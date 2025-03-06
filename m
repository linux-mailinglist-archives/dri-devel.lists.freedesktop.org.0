Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85EA53FDD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8392010E8AE;
	Thu,  6 Mar 2025 01:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIX8GTXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B5E10E892;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y0l+sTCqmBvvOw/TtCAoV+5VGSMezfd3+pQ1qhmn1LA=;
 b=BIX8GTXkDySYoB0nMzWs4obby5mlR0/FSw6Xgx050rWVSZL9XxXcOVqc
 Oh07jOGAuooT5cNQyEp1ZY9EKvIhC/gqhndxQzHZuNSqLToh8noFiXIv3
 hb+lNJmNkIzlYYFyAyttlLKzjDi2kGFkCEp67WjaoAPLF69zZ2iQZLPsb
 NLNdBpf+W79QZXnINGIhv/aqMmEoAOi7Sj0Gitwendxi8WCcsxcbIp7p+
 K2G1+GpfS40tSgAT7z38nDZ6dNRVXPPeyIrdtIGtc5Y2IIGhwiCTJyvek
 sitHe5Ff9YVmOkcr4uWgmEeFAamR9qDiQN5keJ6z/EWpXaOTnY3MvHDMJ w==;
X-CSE-ConnectionGUID: V1yth1fMRpumQuzICrebYQ==
X-CSE-MsgGUID: U9ni0OfLSLOpW8SQ6vJFPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427366"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427366"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
X-CSE-ConnectionGUID: XkUnWMDDSem3F4ehlOin7Q==
X-CSE-MsgGUID: gMPpEREhQGm6PBcWmKuibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063284"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 17/32] drm/xe: Do not allow CPU address mirror VMA unbind if
Date: Wed,  5 Mar 2025 17:26:42 -0800
Message-Id: <20250306012657.3505757-18-matthew.brost@intel.com>
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

uAPI is designed with the use case that only mapping a BO to a malloc'd
address will unbind a CPU-address mirror VMA. Therefore, allowing a
CPU-address mirror VMA to unbind when the GPU has bindings in the range
being unbound does not make much sense. This behavior is not supported,
as it simplifies the code. This decision can always be revisited if a
use case arises.

v3:
 - s/arrises/arises (Thomas)
 - s/system allocator/GPU address mirror (Thomas)
 - Kernel doc (Thomas)
 - Newline between function defs (Thomas)
v5:
 - Kernel doc (Thomas)
v6:
 - Only compile if CONFIG_DRM_GPUSVM selected (CI, Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
 drivers/gpu/drm/xe/xe_vm.c  | 16 ++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a9d32cd69ae9..80076f4dc4b4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -434,3 +434,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	return err;
 }
+
+/**
+ * xe_svm_has_mapping() - SVM has mappings
+ * @vm: The VM.
+ * @start: Start address.
+ * @end: End address.
+ *
+ * Check if an address range has SVM mappings.
+ *
+ * Return: True if address range has a SVM mapping, False otherwise
+ */
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
+{
+	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 87cbda5641bb..35e044e492e0 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -57,6 +57,8 @@ void xe_svm_close(struct xe_vm *vm);
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_tile *tile, u64 fault_addr,
 			    bool atomic);
+
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 #else
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
@@ -86,6 +88,12 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 {
 	return 0;
 }
+
+static inline
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
+{
+	return false;
+}
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5f81c81c8f43..80b57d7a3f4c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2485,6 +2485,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			struct xe_vma *old =
 				gpuva_to_vma(op->base.remap.unmap->va);
 			bool skip = xe_vma_is_cpu_addr_mirror(old);
+			u64 start = xe_vma_start(old), end = xe_vma_end(old);
+
+			if (op->base.remap.prev)
+				start = op->base.remap.prev->va.addr +
+					op->base.remap.prev->va.range;
+			if (op->base.remap.next)
+				end = op->base.remap.next->va.addr;
+
+			if (xe_vma_is_cpu_addr_mirror(old) &&
+			    xe_svm_has_mapping(vm, start, end))
+				return -EBUSY;
 
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
@@ -2566,6 +2577,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		case DRM_GPUVA_OP_UNMAP:
 			vma = gpuva_to_vma(op->base.unmap.va);
 
+			if (xe_vma_is_cpu_addr_mirror(vma) &&
+			    xe_svm_has_mapping(vm, xe_vma_start(vma),
+					       xe_vma_end(vma)))
+				return -EBUSY;
+
 			if (!xe_vma_is_cpu_addr_mirror(vma))
 				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
-- 
2.34.1

