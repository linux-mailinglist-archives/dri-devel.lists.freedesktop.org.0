Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFY1J9K7pWnNFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:33:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9541DCEA7
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397F410E56B;
	Mon,  2 Mar 2026 16:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNVMLb8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9599D10E57B;
 Mon,  2 Mar 2026 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772469198; x=1804005198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=REVi10SRu9z3ZPsNcbifTyehMK0hQmtR42Guy7n5z44=;
 b=RNVMLb8X3kBYmmiA2WPHwYDpcQg400rnpf5K7eVwTeZH9ZKnsfIimY2n
 IV7tFjZWEPnCuS1Vk72JeO5IWxDsFZ5xaPOqne+y5ZOJ4c+uKPIuhKuqt
 utdC+5FRyQ7BkfRnJ3VlKOgJ4+4ySYqeu8QrRyCmKYjuZnbr0rgplbMS1
 Pe0rsmq8HEnkGAa5e3P1LnyADXsjRhpVS9JzxR8qqJf1TpVy4kjvDEgPK
 J+wDRJpZBYAwgSZseOcQu11F6qxsuJyeyvzBhs8MPF7o47nUwHDz2xvt/
 8+PsdvRkXoWf3qEgkJLTrVM02qMPcco6NeI7QP6vc0dSGTynYX+OU30NG A==;
X-CSE-ConnectionGUID: 25QQrNicSdic2Z27V9shRQ==
X-CSE-MsgGUID: LWotnI8+TqmWD2JvR7ZTtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73447855"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73447855"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:33:18 -0800
X-CSE-ConnectionGUID: K+CRsj+RQZ6ru4vAsX+Wvw==
X-CSE-MsgGUID: p97XZGPvQkm1YvytgY0cqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="255564533"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.81])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:33:16 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/xe: Split TLB invalidation into submit and wait
 steps
Date: Mon,  2 Mar 2026 17:32:47 +0100
Message-ID: <20260302163248.105454-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: 3C9541DCEA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,lists.freedesktop.org,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Action: no action

xe_vm_range_tilemask_tlb_inval() submits TLB invalidation requests to
all GTs in a tile mask and then immediately waits for them to complete
before returning. This is fine for the existing callers, but a
subsequent patch will need to defer the wait in order to overlap TLB
invalidations across multiple VMAs.

Introduce xe_tlb_inval_range_tilemask_submit() and
xe_tlb_inval_batch_wait() in xe_tlb_inval.c as the submit and wait
halves respectively. The batch of fences is carried in the new
xe_tlb_inval_batch structure. Remove xe_vm_range_tilemask_tlb_inval()
and convert all three call sites to the new API.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c             |  6 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 82 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  6 ++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 14 +++++
 drivers/gpu/drm/xe/xe_vm.c              | 69 +++------------------
 drivers/gpu/drm/xe/xe_vm.h              |  3 -
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  9 ++-
 drivers/gpu/drm/xe/xe_vm_types.h        |  1 +
 8 files changed, 123 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 002b6c22ad3f..6ea4972c2791 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -19,6 +19,7 @@
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_tile.h"
+#include "xe_tlb_inval.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
@@ -225,6 +226,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 			      const struct mmu_notifier_range *mmu_range)
 {
 	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
+	struct xe_tlb_inval_batch _batch;
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_range *r, *first;
 	struct xe_tile *tile;
@@ -276,7 +278,9 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 
 	xe_device_wmb(xe);
 
-	err = xe_vm_range_tilemask_tlb_inval(vm, adj_start, adj_end, tile_mask);
+	err = xe_tlb_inval_range_tilemask_submit(xe, vm->usm.asid, adj_start, adj_end,
+						 tile_mask, &_batch);
+	xe_tlb_inval_batch_wait(&_batch);
 	WARN_ON_ONCE(err);
 
 range_notifier_event_end:
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 933f30fb617d..343e37cfe715 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -486,3 +486,85 @@ bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval)
 	guard(spinlock_irq)(&tlb_inval->pending_lock);
 	return list_is_singular(&tlb_inval->pending_fences);
 }
+
+/**
+ * xe_tlb_inval_batch_wait() - Wait for all fences in a TLB invalidation batch
+ * @batch: Batch of TLB invalidation fences to wait on
+ *
+ * Waits for every fence in @batch to signal, then resets @batch so it can be
+ * reused for a subsequent invalidation.
+ */
+void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch)
+{
+	struct xe_tlb_inval_fence *fence = &batch->fence[0];
+	unsigned int i;
+
+	for (i = 0; i < batch->num_fences; ++i)
+		xe_tlb_inval_fence_wait(fence++);
+
+	batch->num_fences = 0;
+}
+
+/**
+ * xe_tlb_inval_range_tilemask_submit() - Submit TLB invalidations for an
+ * address range on a tile mask
+ * @xe: The xe device
+ * @asid: Address space ID
+ * @start: start address
+ * @end: end address
+ * @tile_mask: mask for which gt's issue tlb invalidation
+ * @batch: Batch of tlb invalidate fences
+ *
+ * Issue a range based TLB invalidation for gt's in tilemask
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32 asid,
+				       u64 start, u64 end, u8 tile_mask,
+				       struct xe_tlb_inval_batch *batch)
+{
+	struct xe_tlb_inval_fence *fence = &batch->fence[0];
+	struct xe_tile *tile;
+	u32 fence_id = 0;
+	u8 id;
+	int err;
+
+	batch->num_fences = 0;
+	if (!tile_mask)
+		return 0;
+
+	for_each_tile(tile, xe, id) {
+		if (!(tile_mask & BIT(id)))
+			continue;
+
+		xe_tlb_inval_fence_init(&tile->primary_gt->tlb_inval,
+					&fence[fence_id], true);
+
+		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
+					 &fence[fence_id], start, end,
+					 asid, NULL);
+		if (err)
+			goto wait;
+		++fence_id;
+
+		if (!tile->media_gt)
+			continue;
+
+		xe_tlb_inval_fence_init(&tile->media_gt->tlb_inval,
+					&fence[fence_id], true);
+
+		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
+					 &fence[fence_id], start, end,
+					 asid, NULL);
+		if (err)
+			goto wait;
+		++fence_id;
+	}
+
+wait:
+	batch->num_fences = fence_id;
+	if (err)
+		xe_tlb_inval_batch_wait(batch);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index 62089254fa23..a76b7823a5f2 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -45,4 +45,10 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno);
 
 bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval);
 
+int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32 asid,
+				       u64 start, u64 end, u8 tile_mask,
+				       struct xe_tlb_inval_batch *batch);
+
+void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch);
+
 #endif	/* _XE_TLB_INVAL_ */
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 3b089f90f002..3d1797d186fd 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -9,6 +9,8 @@
 #include <linux/workqueue.h>
 #include <linux/dma-fence.h>
 
+#include "xe_device_types.h"
+
 struct drm_suballoc;
 struct xe_tlb_inval;
 
@@ -132,4 +134,16 @@ struct xe_tlb_inval_fence {
 	ktime_t inval_time;
 };
 
+/**
+ * struct xe_tlb_inval_batch - Batch of TLB invalidation fences
+ *
+ * Holds one fence per GT covered by a TLB invalidation request.
+ */
+struct xe_tlb_inval_batch {
+	/** @fence: per-GT TLB invalidation fences */
+	struct xe_tlb_inval_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	/** @num_fences: number of valid entries in @fence */
+	unsigned int num_fences;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 548b0769b3ef..7f29d2b2972d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3966,66 +3966,6 @@ void xe_vm_unlock(struct xe_vm *vm)
 	dma_resv_unlock(xe_vm_resv(vm));
 }
 
-/**
- * xe_vm_range_tilemask_tlb_inval - Issue a TLB invalidation on this tilemask for an
- * address range
- * @vm: The VM
- * @start: start address
- * @end: end address
- * @tile_mask: mask for which gt's issue tlb invalidation
- *
- * Issue a range based TLB invalidation for gt's in tilemask
- *
- * Returns 0 for success, negative error code otherwise.
- */
-int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
-				   u64 end, u8 tile_mask)
-{
-	struct xe_tlb_inval_fence
-		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
-	struct xe_tile *tile;
-	u32 fence_id = 0;
-	u8 id;
-	int err;
-
-	if (!tile_mask)
-		return 0;
-
-	for_each_tile(tile, vm->xe, id) {
-		if (!(tile_mask & BIT(id)))
-			continue;
-
-		xe_tlb_inval_fence_init(&tile->primary_gt->tlb_inval,
-					&fence[fence_id], true);
-
-		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
-					 &fence[fence_id], start, end,
-					 vm->usm.asid, NULL);
-		if (err)
-			goto wait;
-		++fence_id;
-
-		if (!tile->media_gt)
-			continue;
-
-		xe_tlb_inval_fence_init(&tile->media_gt->tlb_inval,
-					&fence[fence_id], true);
-
-		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
-					 &fence[fence_id], start, end,
-					 vm->usm.asid, NULL);
-		if (err)
-			goto wait;
-		++fence_id;
-	}
-
-wait:
-	for (id = 0; id < fence_id; ++id)
-		xe_tlb_inval_fence_wait(&fence[id]);
-
-	return err;
-}
-
 /**
  * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
  * @vma: VMA to invalidate
@@ -4040,6 +3980,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_tlb_inval_batch _batch;
 	struct xe_tile *tile;
 	u8 tile_mask = 0;
 	int ret = 0;
@@ -4080,12 +4021,16 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	xe_device_wmb(xe);
 
-	ret = xe_vm_range_tilemask_tlb_inval(xe_vma_vm(vma), xe_vma_start(vma),
-					     xe_vma_end(vma), tile_mask);
+	ret = xe_tlb_inval_range_tilemask_submit(xe, xe_vma_vm(vma)->usm.asid,
+						 xe_vma_start(vma), xe_vma_end(vma),
+						 tile_mask, &_batch);
 
 	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
 	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
 
+	if (!ret)
+		xe_tlb_inval_batch_wait(&_batch);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f849e369432b..62f4b6fec0bc 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -240,9 +240,6 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 				     struct xe_svm_range *range);
 
-int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
-				   u64 end, u8 tile_mask);
-
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
 int xe_vm_validate_protected(struct xe_vm *vm);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 95bf53cc29e3..39717026e84f 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -12,6 +12,7 @@
 #include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
+#include "xe_tlb_inval.h"
 
 struct xe_vmas_in_madvise_range {
 	u64 addr;
@@ -235,13 +236,19 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 {
 	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start, end);
+	struct xe_tlb_inval_batch batch;
+	int err;
 
 	if (!tile_mask)
 		return 0;
 
 	xe_device_wmb(vm->xe);
 
-	return xe_vm_range_tilemask_tlb_inval(vm, start, end, tile_mask);
+	err = xe_tlb_inval_range_tilemask_submit(vm->xe, vm->usm.asid, start, end,
+						 tile_mask, &batch);
+	xe_tlb_inval_batch_wait(&batch);
+
+	return err;
 }
 
 static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1f6f7e30e751..de6544165cfa 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -18,6 +18,7 @@
 #include "xe_device_types.h"
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
+#include "xe_tlb_inval_types.h"
 #include "xe_userptr.h"
 
 struct drm_pagemap;
-- 
2.53.0

