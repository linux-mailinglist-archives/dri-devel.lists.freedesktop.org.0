Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171839F5A73
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E19D10EAAF;
	Tue, 17 Dec 2024 23:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQvKdO4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E5410E860;
 Tue, 17 Dec 2024 23:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478392; x=1766014392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DekUpJ3M+HQPZXiunqMVekiBvlQ6tTvvYNjDxjKwvVk=;
 b=hQvKdO4tIc41Q6Qk1IrOIHdYE1OC/YmXbcPGVy1DYcwMejhCN4UV0F1t
 65fWn9HmtAEwyWe6ev/w95QRwxFSCDmumEFrZXpD/rWCkjeztYCpRj4Hj
 0ww5400CSBc7Iq0+ko7U8ldH57+NtkwV92TgtBCWKKlNOF500nEyNwBkN
 onK7nGlFXqRHH823x6Y5IVZtQ80jPtNwQFCdOjbG21PDwcWiNCpa99o9n
 c7Mwy9mTLtuAVWRW1WTA95IUA/UEOoxBVtvlSUfApfnEGYCtMBoi7pEoC
 /IHLI+Oi87DAu3WuFtnDueMx4pdZLJnquQCrsgzqCfocWqatWm5PXACqL A==;
X-CSE-ConnectionGUID: TdVCwuXsSjmZWlzVV5MQjA==
X-CSE-MsgGUID: t3KDfl8dRBuke9edpVM8pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517420"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517420"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:11 -0800
X-CSE-ConnectionGUID: +jIlzRF+Ta++9cfu0/qEsA==
X-CSE-MsgGUID: PkaoFC/3RU2AgbrqcbXEUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273446"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 16/30] drm/xe: Do not allow CPU address mirror VMA unbind
 if the GPU has bindings
Date: Tue, 17 Dec 2024 15:33:34 -0800
Message-Id: <20241217233348.3519726-17-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c |  5 +++++
 drivers/gpu/drm/xe/xe_svm.h |  2 ++
 drivers/gpu/drm/xe/xe_vm.c  | 16 ++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 58fbe1b65e8b..8237b534a65b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -427,3 +427,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	return err;
 }
+
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
+{
+	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 5531868cdd6f..ddce1069ba1e 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -46,6 +46,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_tile *tile, u64 fault_addr,
 			    bool atomic);
 
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
+
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
 	return drm_gpusvm_range_pages_valid(range->base.gpusvm, &range->base);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 20ea099664af..613a68498a24 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2398,6 +2398,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
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
@@ -2480,6 +2491,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
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

