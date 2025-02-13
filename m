Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBA1A3354B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9247010E9FE;
	Thu, 13 Feb 2025 02:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VM6Ye9sg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EAC10E9CB;
 Thu, 13 Feb 2025 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412619; x=1770948619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k2/3xJlfleN81zvnDNC+B25M9GecXtT2Wfy6y6HWqXM=;
 b=VM6Ye9sgGWnkCNoVR+b2mylrFswF8gDgTy1O84LK4WDeCCeTNd/QD+Uh
 7eShB8p9yCvepRR5u5v1Cj14ewqD1lrk9Jf5zu7z/QLVfIZkPxZAHlE9H
 nyVd9UbYzrjrDWKAyvMB0SZv9IBUFC/ZlcH9Rig/lJTtNly1x+s1PTyjx
 udP7tzEhxyCbpSwiFon1mUn1LUgwmHRzSqG18UmsyboE/vrezXVEXGGdC
 93rv6Q9A66MPylVr8CxFMjO04grKvkRMA5bw1MSWsTfe48Kyh2TfiemXJ
 Wzpvjk6t6iej708gUWDcrgY8pwlhwYeOQRONDeTIAO4ty54VASGOE4lpG g==;
X-CSE-ConnectionGUID: Ykq2VrfLTM6Efzms+ngHvQ==
X-CSE-MsgGUID: Wv8nvb6nSLehQno3HPRMhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456013"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456013"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: UkBPmq9yR7eykwrReUKYXg==
X-CSE-MsgGUID: +Qd53wi6QH+EjNH8ozyzLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945084"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 17/32] drm/xe: Do not allow CPU address mirror VMA unbind
 if the GPU has bindings
Date: Wed, 12 Feb 2025 18:10:57 -0800
Message-Id: <20250213021112.1228481-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  2 ++
 drivers/gpu/drm/xe/xe_vm.c  | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 98130c0768ec..7b1076c184e3 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -438,3 +438,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
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
index b3a4f2e82b50..50d47024d2db 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -46,6 +46,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_tile *tile, u64 fault_addr,
 			    bool atomic);
 
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
+
 /**
  * xe_svm_range_pages_valid() - SVM range pages valid
  * @range: SVM range
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d482c0cafba3..06b013d1f533 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2417,6 +2417,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
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
@@ -2499,6 +2510,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		{
 			struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
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

