Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BEBB1F4D4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 15:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BF510E329;
	Sat,  9 Aug 2025 13:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUfugQiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DFB10E33F;
 Sat,  9 Aug 2025 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754747546; x=1786283546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eVwlttIO5cPoFbzrqx0Zh2eNe66yN5Gkt7LN4QnB250=;
 b=WUfugQiQZEq5MG97m8M4HprNo5316mcdIjF7oZS+EpdpK/zTMFtrAVuT
 Xi2D5s71oo127b+EsGlW1urSWstyDyIs9fUycKYdZWpkQRZNU5xSD3f1c
 Sb2PUGit/jyl3K4bqYjU9Xb/kC3/ShFsshg+nW6CGwJfOsFMa9MjE4WVR
 ZLI1czzt5sAOZA6A4DolDx1owLhg7uyGpm1KHU6QmC7FqfAjgSe98yjwM
 rsgvara3Ct2bIXFV2T9nIyWiKWDQrRbpvpQ1RIbr/jbV3vzjHJo78oBfv
 FcC0kuBK2HThEy59UrgGXbhEhfiKLG2wicWqILy4Zl2+7CVAYA4tm8KhR A==;
X-CSE-ConnectionGUID: wQwn8ae2RmCG6EgbJvSwkA==
X-CSE-MsgGUID: ppmffWCPQmqOacdJJQEzMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68153593"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68153593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:52:26 -0700
X-CSE-ConnectionGUID: R3aCHRgpQ4+mVFpxSPBY2Q==
X-CSE-MsgGUID: zuNnvxMYTpSWm7CSeb31rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165903777"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.28])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:52:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/6] drm/xe: Implement two pass MMU notifiers for SVM
Date: Sat,  9 Aug 2025 15:51:37 +0200
Message-ID: <20250809135137.259427-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Implement two-pass MMU notifiers for SVM, enabling multiple VMs or
devices with GPU mappings to pipeline costly TLB invalidations by
issuing them in the first pass and waiting for completion in the second.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c |  2 +-
 drivers/gpu/drm/xe/xe_svm.c  | 74 ++++++++++++++++++++++++++++++------
 2 files changed, 63 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 92dc7d2bd6cf..f153df1bc862 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -413,7 +413,7 @@ drm_gpusvm_notifier_invalidate_twopass(struct mmu_interval_notifier *mni,
  * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SVM
  */
 static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
-	.invalidate_twopass = drm_gpusvm_notifier_invalidate_twopass,
+	.invalidate_multipass = drm_gpusvm_notifier_invalidate_twopass,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 82a598c8d56e..5728394806ca 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -144,15 +144,8 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	 * invalidations spanning multiple ranges.
 	 */
 	for_each_tile(tile, xe, id)
-		if (xe_pt_zap_ptes_range(tile, vm, range)) {
+		if (xe_pt_zap_ptes_range(tile, vm, range))
 			tile_mask |= BIT(id);
-			/*
-			 * WRITE_ONCE pairs with READ_ONCE in
-			 * xe_vm_has_valid_gpu_mapping()
-			 */
-			WRITE_ONCE(range->tile_invalidated,
-				   range->tile_invalidated | BIT(id));
-		}
 
 	return tile_mask;
 }
@@ -161,16 +154,60 @@ static void
 xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
 				const struct mmu_notifier_range *mmu_range)
 {
+	struct xe_svm_range *range = to_xe_range(r);
 	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
 
 	xe_svm_assert_in_notifier(vm);
 
+	/*
+	 * WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping()
+	 */
+	WRITE_ONCE(range->tile_invalidated, range->tile_present);
+
 	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
 	if (!xe_vm_is_closed(vm) && mmu_range->event == MMU_NOTIFY_UNMAP)
 		xe_svm_garbage_collector_add_range(vm, to_xe_range(r),
 						   mmu_range);
 }
 
+struct xe_svm_invalidate_pass {
+	struct drm_gpusvm *gpusvm;
+	struct drm_gpusvm_notifier *notifier;
+#define XE_SVM_INVALIDATE_FENCE_COUNT	\
+	(XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE)
+	struct xe_gt_tlb_invalidation_fence fences[XE_SVM_INVALIDATE_FENCE_COUNT];
+	struct mmu_interval_notifier_pass p;
+};
+
+static struct mmu_interval_notifier_pass *
+xe_svm_invalidate_second(struct mmu_interval_notifier_pass *p,
+			 const struct mmu_notifier_range *mmu_range,
+			 unsigned long cur_seq)
+{
+	struct xe_svm_invalidate_pass *pass = container_of(p, typeof(*pass), p);
+	struct drm_gpusvm *gpusvm = pass->gpusvm;
+	struct drm_gpusvm_notifier *notifier = pass->notifier;
+	struct drm_gpusvm_range *r = NULL;
+	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
+	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
+	int id;
+
+	/* Adjust invalidation to notifier boundaries */
+	adj_start = max(drm_gpusvm_notifier_start(notifier), adj_start);
+	adj_end = min(drm_gpusvm_notifier_end(notifier), adj_end);
+
+	for (id = 0; id < XE_SVM_INVALIDATE_FENCE_COUNT; ++id)
+		xe_gt_tlb_invalidation_fence_wait(&pass->fences[id]);
+
+	drm_gpusvm_in_notifier_lock(gpusvm);
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+		xe_svm_range_notifier_event_end(vm, r, mmu_range);
+	drm_gpusvm_in_notifier_unlock(gpusvm);
+
+	kfree(pass);
+	return NULL;
+}
+
 static void xe_svm_invalidate_twopass(struct drm_gpusvm *gpusvm,
 				      struct drm_gpusvm_notifier *notifier,
 				      const struct mmu_notifier_range *mmu_range,
@@ -179,6 +216,8 @@ static void xe_svm_invalidate_twopass(struct drm_gpusvm *gpusvm,
 	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_range *r, *first;
+	struct xe_svm_invalidate_pass *pass = NULL;
+	struct xe_gt_tlb_invalidation_fence *fences = NULL;
 	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
 	u8 tile_mask = 0;
 	long err;
@@ -226,14 +265,25 @@ static void xe_svm_invalidate_twopass(struct drm_gpusvm *gpusvm,
 
 	xe_device_wmb(xe);
 
-	err = xe_vm_range_tilemask_tlb_invalidation(vm, NULL, adj_start,
+	pass = kzalloc(sizeof(*pass), GFP_NOWAIT);
+	if (pass) {
+		pass->gpusvm = gpusvm;
+		pass->notifier = notifier;
+		pass->p.pass = xe_svm_invalidate_second;
+		fences = pass->fences;
+		*p = &pass->p;
+	}
+
+	err = xe_vm_range_tilemask_tlb_invalidation(vm, fences, adj_start,
 						    adj_end, tile_mask);
 	WARN_ON_ONCE(err);
 
 range_notifier_event_end:
-	r = first;
-	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
-		xe_svm_range_notifier_event_end(vm, r, mmu_range);
+	if (!pass) {
+		r = first;
+		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+			xe_svm_range_notifier_event_end(vm, r, mmu_range);
+	}
 }
 
 static int __xe_svm_garbage_collector(struct xe_vm *vm,
-- 
2.50.1

