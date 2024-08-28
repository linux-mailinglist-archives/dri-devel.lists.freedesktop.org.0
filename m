Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C485A961C5A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FA410E47C;
	Wed, 28 Aug 2024 02:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeBwd2xp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D3110E443;
 Wed, 28 Aug 2024 02:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813290; x=1756349290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mDtZfjyBpF1EM1TamxTeoVGjdwIM8ZdiqTK97tr6KrA=;
 b=WeBwd2xpVDsKzY3Wwl/WA6vAoymPoNk3DtnxJ4tWdWOGI/Vn4IQlsAww
 ADb5BynfTDGOIwyej2MBExOyvE5edz/LCQmmfcg1E7w7X67N22+04QpLW
 zNHxSs5gBV2g9TVkkvv9M0q8g25dI8mEFU8FD+PQ6nkH3MYg8XYV3jKqm
 VYfqvcM7cZ73ifV9YUO2JNAiJYdD+54QjGaFxkWQ8j1DH4T0AzMgCCW2n
 IuI+9zK9cg4Suv9OmOvLpj7lFIwwcBAlv2BZuhUV8xN3ky31OPDIumZDj
 sqDUoaS6L7aK4DDxkwG0ge8TYYdNpPJ/z4dqsBD6TPnpKq7TZwOun5Asr w==;
X-CSE-ConnectionGUID: JL2uRob2Q7SrX+awrflr3A==
X-CSE-MsgGUID: ni3a4stWSmif2IJs2ZgTsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251904"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:09 -0700
X-CSE-ConnectionGUID: wHHVLFrkRxaT/nFizO0hZQ==
X-CSE-MsgGUID: s05ZAlXcTfSTbu3gV/7JnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224628"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 14/28] drm/xe: Do not allow system allocator VMA unbind if
 the GPU has bindings
Date: Tue, 27 Aug 2024 19:48:47 -0700
Message-Id: <20240828024901.2582335-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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

uAPI is designed with the the use case that only mapping a BO to a
malloc'd address will unbind a system allocator VMA. Thus it doesn't
make tons of sense to allow a system allocator VMA unbind if the GPU has
bindings in the range being unbound. Do not support this as it
simplifies the code. Can always be revisited if a use case for this
arrises.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c |  5 +++++
 drivers/gpu/drm/xe/xe_svm.h |  1 +
 drivers/gpu/drm/xe/xe_vm.c  | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7188aa590fa5..2339359a1d91 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -366,3 +366,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 err_out:
 	return err;
 }
+
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
+{
+	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 84fd0d8c3380..a4f764bcd835 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -25,6 +25,7 @@ void xe_svm_fini(struct xe_vm *vm);
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_tile *tile, u64 fault_addr,
 			    bool atomic);
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6916cdfe4be3..d9bff07ef8d1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2352,6 +2352,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			struct xe_vma *old =
 				gpuva_to_vma(op->base.remap.unmap->va);
 			bool skip = xe_vma_is_system_allocator(old);
+			u64 start = xe_vma_start(old), end = xe_vma_end(old);
+
+			if (op->base.remap.prev)
+				start = op->base.remap.prev->va.addr +
+					op->base.remap.prev->va.range;
+			if (op->base.remap.next)
+				end = op->base.remap.next->va.addr;
+
+			if (xe_vma_is_system_allocator(old) &&
+			    xe_svm_has_mapping(vm, start, end))
+				return -EBUSY;
 
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
@@ -2434,6 +2445,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		{
 			struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
+			if (xe_vma_is_system_allocator(vma) &&
+			    xe_svm_has_mapping(vm, xe_vma_start(vma),
+					       xe_vma_end(vma)))
+				return -EBUSY;
+
 			if (!xe_vma_is_system_allocator(vma))
 				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
-- 
2.34.1

