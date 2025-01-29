Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E52A224B9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D51C10E89B;
	Wed, 29 Jan 2025 19:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANVmfqdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E625510E177;
 Wed, 29 Jan 2025 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180284; x=1769716284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q8Z8/+IlffCToOIXa1s7pp7xLfSW6Rn3rJP4RqhONH0=;
 b=ANVmfqdmlA38OlSjTY9juqbYQIElkzP9/aoXzMCoA1RSA5QXsBbAiipS
 fIheXT/g+0kI6YKaj6SfID3rxBcUdqjzI7u1GAKQi3sAakV7HmL4JWoYA
 1gMCc7Sqc7jLCDgr6VN/iZjB26HqFY5fDGjPessvizXZbkFjAnlfVQ5h1
 wlBpdZCAZd2xSeF6ZzU57ZHiTdHFHnC97cO1I7M3nx4eSDuqKC2peUbnA
 jQ5a2ypln2MFnjl4X3qN+p3PHj88IB3rwyPnKsBpYxPTTA+tfVcQTth++
 bfxjCNAG3bE6miP4Sj0uMGF1+TNGhFI6/T7AuhEuKW11AaSU2hylde1xX Q==;
X-CSE-ConnectionGUID: 5D1zbzuMSq6GTAe5nkBGpg==
X-CSE-MsgGUID: i+HoLcMOQkiRPwigbjemBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132811"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132811"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:23 -0800
X-CSE-ConnectionGUID: B08ar4viQBmMHR7BTGUgzw==
X-CSE-MsgGUID: L/bSp/BeT8iixJ/LDRm+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392157"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 17/33] drm/xe: Do not allow CPU address mirror VMA unbind
 if the GPU has bindings
Date: Wed, 29 Jan 2025 11:51:56 -0800
Message-Id: <20250129195212.745731-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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
index 03c5cbcacb0e..56ece53b2069 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -428,3 +428,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	return err;
 }
+
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
+{
+	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index ef5bc4e919e8..b181c174ca61 100644
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
index 6fa446884955..d8c78ecd54ec 100644
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

