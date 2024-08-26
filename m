Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB095F72F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 18:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B933E10E25A;
	Mon, 26 Aug 2024 16:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bb0h77Sm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAE110E255;
 Mon, 26 Aug 2024 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724691249; x=1756227249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ee5iJgBGQK2gest5+KJ+2ba/nJOgbq5Xij1Wpbg7Q8s=;
 b=Bb0h77SmzH6fyvVO5pwSO+cARFQEkcanVI5Cw4/LB2g1ipG+HTbBq9Cn
 oeNc2dIxRNJLnTer2f7es1iy0z5npG2NV60FAAEaAezZ592LHb1QVWf7g
 7REEiVhxJKJQaoA4dnksYZ9xXal3ZwR/MXikRTVNVmgudTF0+geyxqCcW
 0ld1NepzhXRaD03tK/Wjq4ckSAGkG15t6qGYwGDD4LRGaYK49XvLJSPxL
 M4jcTK4n5Nx6bFGg1srvXwJCrF1RXiPiCACcRZvHfR9QG/N6HrEmdMDVg
 AR/eRVPhbqp8etZZOi/9WsIHfz/gksRH/QxAHLmsczj0OJHxxE/wPsr68 g==;
X-CSE-ConnectionGUID: Fq/+05TDQBy3M8IUC6JDGA==
X-CSE-MsgGUID: dRjRA87KTGS2A80CExKSOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26923452"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="26923452"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:54:09 -0700
X-CSE-ConnectionGUID: MYVXFfC5RoSYIizIbEXtag==
X-CSE-MsgGUID: ANoiI7ZHR0iUzxZ/zIzHTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="62563500"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:54:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH 2/2] drm/xe: Invalidate media_gt TLBs in PT code
Date: Mon, 26 Aug 2024 09:54:56 -0700
Message-Id: <20240826165456.2491477-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826165456.2491477-1-matthew.brost@intel.com>
References: <20240826165456.2491477-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Testing on LNL has shown media GT's TLBs need to be invalidated via the
GuC, update PT code appropriately.

v2:
 - Do dma_fence_get before first call of invalidation_fence_init (Himal)
 - No need to check for valid chain fence (Himal)
v3:
 - Use dma-fence-array

Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 117 ++++++++++++++++++++++++++++++-------
 1 file changed, 96 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 579ed31b46db..2e35444a85b0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,6 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <linux/dma-fence-array.h>
+
 #include "xe_pt.h"
 
 #include "regs/xe_gtt_defs.h"
@@ -1627,9 +1629,11 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
 
 static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
 {
+	int shift = xe_device_get_root_tile(xe)->media_gt ? 1 : 0;
+
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
 		return dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv,
-					       xe->info.tile_count);
+					       xe->info.tile_count << shift);
 
 	return 0;
 }
@@ -1816,6 +1820,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
 	struct xe_vma_op *op;
+	int shift = tile->media_gt ? 1 : 0;
 	int err;
 
 	lockdep_assert_held(&vops->vm->lock);
@@ -1824,7 +1829,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	xe_pt_update_ops_init(pt_update_ops);
 
 	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
-				      tile_to_xe(tile)->info.tile_count);
+				      tile_to_xe(tile)->info.tile_count << shift);
 	if (err)
 		return err;
 
@@ -1849,13 +1854,20 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
-			   struct xe_vma *vma, struct dma_fence *fence)
+			   struct xe_vma *vma, struct dma_fence *fence,
+			   struct dma_fence *fence2)
 {
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
+		if (fence2)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
+					   pt_update_ops->wait_vm_bookkeep ?
+					   DMA_RESV_USAGE_KERNEL :
+					   DMA_RESV_USAGE_BOOKKEEP);
+	}
 	vma->tile_present |= BIT(tile->id);
 	vma->tile_staged &= ~BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
@@ -1875,13 +1887,20 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 
 static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops,
-			     struct xe_vma *vma, struct dma_fence *fence)
+			     struct xe_vma *vma, struct dma_fence *fence,
+			     struct dma_fence *fence2)
 {
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
+		if (fence2)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
+					   pt_update_ops->wait_vm_bookkeep ?
+					   DMA_RESV_USAGE_KERNEL :
+					   DMA_RESV_USAGE_BOOKKEEP);
+	}
 	vma->tile_present &= ~BIT(tile->id);
 	if (!vma->tile_present) {
 		list_del_init(&vma->combined_links.rebind);
@@ -1898,7 +1917,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 static void op_commit(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
-		      struct xe_vma_op *op, struct dma_fence *fence)
+		      struct xe_vma_op *op, struct dma_fence *fence,
+		      struct dma_fence *fence2)
 {
 	xe_vm_assert_held(vm);
 
@@ -1907,26 +1927,28 @@ static void op_commit(struct xe_vm *vm,
 		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
 			break;
 
-		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
+		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
+			       fence2);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.remap.unmap->va), fence);
+				 gpuva_to_vma(op->base.remap.unmap->va), fence,
+				 fence2);
 
 		if (op->remap.prev)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
-				       fence);
+				       fence, fence2);
 		if (op->remap.next)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
-				       fence);
+				       fence, fence2);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.unmap.va), fence);
+				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 		bind_op_commit(vm, tile, pt_update_ops,
-			       gpuva_to_vma(op->base.prefetch.va), fence);
+			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
 		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -1963,7 +1985,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
 	struct dma_fence *fence;
-	struct invalidation_fence *ifence = NULL;
+	struct invalidation_fence *ifence = NULL, *mfence = NULL;
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
 	int err = 0, i;
@@ -1996,6 +2020,23 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			err = -ENOMEM;
 			goto kill_vm_tile1;
 		}
+		if (tile->media_gt) {
+			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+			if (!mfence) {
+				err = -ENOMEM;
+				goto free_ifence;
+			}
+			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
+			if (!fences) {
+				err = -ENOMEM;
+				goto free_ifence;
+			}
+			cf = dma_fence_array_alloc(2);
+			if (!cf) {
+				err = -ENOMEM;
+				goto free_ifence;
+			}
+		}
 	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
@@ -2027,19 +2068,50 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	/* tlb invalidation must be done before signaling rebind */
 	if (ifence) {
+		if (mfence)
+			dma_fence_get(fence);
 		invalidation_fence_init(tile->primary_gt, ifence, fence,
 					pt_update_ops->start,
 					pt_update_ops->last, vm->usm.asid);
-		fence = &ifence->base.base;
+		if (mfence) {
+			invalidation_fence_init(tile->media_gt, mfence, fence,
+						pt_update_ops->start,
+						pt_update_ops->last, vm->usm.asid);
+			fences[0] = &ifence->base.base;
+			fences[1] = &mfence->base.base;
+			dma_fence_array_arm(cf, 2, fences,
+					    vm->composite_fence_ctx,
+					    vm->composite_fence_seqno++,
+					    false);
+			fence = &cf->base;
+		} else {
+			fence = &ifence->base.base;
+		}
 	}
 
-	dma_resv_add_fence(xe_vm_resv(vm), fence,
-			   pt_update_ops->wait_vm_bookkeep ?
-			   DMA_RESV_USAGE_KERNEL :
-			   DMA_RESV_USAGE_BOOKKEEP);
+	if (!mfence) {
+		dma_resv_add_fence(xe_vm_resv(vm), fence,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
 
-	list_for_each_entry(op, &vops->list, link)
-		op_commit(vops->vm, tile, pt_update_ops, op, fence);
+		list_for_each_entry(op, &vops->list, link)
+			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
+	} else {
+		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+
+		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+
+		list_for_each_entry(op, &vops->list, link)
+			op_commit(vops->vm, tile, pt_update_ops, op,
+				  &ifence->base.base, &mfence->base.base);
+	}
 
 	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
@@ -2049,6 +2121,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 free_rfence:
 	kfree(rfence);
 free_ifence:
+	kfree(cf);
+	kfree(fences);
+	kfree(mfence);
 	kfree(ifence);
 kill_vm_tile1:
 	if (err != -EAGAIN && tile->id)
-- 
2.34.1

