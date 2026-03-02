Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AUYKNG7pWnNFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:33:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319811DCE98
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6F610E564;
	Mon,  2 Mar 2026 16:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSjMvcuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A114510E559;
 Mon,  2 Mar 2026 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772469195; x=1804005195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xybYJgKcjIrQv217e/P+1Z/wnP7KMdw9tzTC5IHcWI4=;
 b=WSjMvcuhwR06HWo8Azk/rAMeNL+R9lboSTtTDukAvJ7jXOkLGkO6leID
 nVVgeFfvjwxUyvQieVU0ATbvzQnZFGrgDYjuxgFgGJ1eYgA2q+5e9YJaB
 +JXd8FhX7yJ9u9XZgV7H9E6QhuJ6Kov0HU948tBqlyM/1ZFFD+QcbKPWM
 lAWMbaftO0OwksYtV89qyed1QPYK/xLPySbXByI5GrhGpaw9PUNvO9gAy
 eKRNhD6UXo+ejJI+VFPtKEVy1s6YkNW58Z2RnXkyYrcMEUa9qojmC7ITi
 FFVdCYOFemSN6frwy7JSvhzqn0AJRnwim2UUbl8N4nk2DAozEqY5h6/16 Q==;
X-CSE-ConnectionGUID: eHWk2XRyQ7SqbWs7wPuvbw==
X-CSE-MsgGUID: Mnj+MwloQsK1bn1G3dOXig==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73447844"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73447844"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:33:15 -0800
X-CSE-ConnectionGUID: HyEPAEjNRT+ouo20DbAkTw==
X-CSE-MsgGUID: wN2u68H7QY274Oz8dz2kMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="255564528"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.81])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:33:13 -0800
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
Subject: [PATCH v2 2/4] drm/xe/userptr: Convert invalidation to two-pass MMU
 notifier
Date: Mon,  2 Mar 2026 17:32:46 +0100
Message-ID: <20260302163248.105454-3-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: 319811DCE98
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

In multi-GPU scenarios, asynchronous GPU job latency is a bottleneck if
each notifier waits for its own GPU before returning. The two-pass
mmu_interval_notifier infrastructure allows deferring the wait to a
second pass, so all GPUs can be signalled in the first pass before
any of them are waited on.

Convert the userptr invalidation to use the two-pass model:

Use invalidate_start as the first pass to mark the VMA for repin and
enable software signalling on the VM reservation fences to start any
gpu work needed for signaling. Fall back to completing the work
synchronously if all fences are already signalled, or if a concurrent
invalidation is already using the embedded finish structure.

Use invalidate_finish as the second pass to wait for the reservation
fences to complete, invalidate the GPU TLB in fault mode, and unmap
the gpusvm pages.

Embed a struct mmu_interval_notifier_finish in struct xe_userptr to
avoid dynamic allocation in the notifier callback. Use a finish_inuse
flag to prevent two concurrent invalidations from using it
simultaneously; fall back to the synchronous path for the second caller.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_userptr.c | 96 +++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_userptr.h | 14 +++++
 2 files changed, 88 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index e120323c43bc..440b0a79d16f 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -73,18 +73,42 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 				    &ctx);
 }
 
-static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
+static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma,
+				    bool is_deferred)
 {
 	struct xe_userptr *userptr = &uvma->userptr;
 	struct xe_vma *vma = &uvma->vma;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	struct drm_gpusvm_ctx ctx = {
 		.in_notifier = true,
 		.read_only = xe_vma_read_only(vma),
 	};
 	long err;
 
+	err = dma_resv_wait_timeout(xe_vm_resv(vm),
+				    DMA_RESV_USAGE_BOOKKEEP,
+				    false, MAX_SCHEDULE_TIMEOUT);
+	XE_WARN_ON(err <= 0);
+
+	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+		err = xe_vm_invalidate_vma(vma);
+		XE_WARN_ON(err);
+	}
+
+	if (is_deferred)
+		userptr->finish_inuse = false;
+	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
+			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
+}
+
+static struct mmu_interval_notifier_finish *
+xe_vma_userptr_invalidate_pass1(struct xe_vm *vm, struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	struct xe_vma *vma = &uvma->vma;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	bool signaled = true;
+
 	/*
 	 * Tell exec and rebind worker they need to repin and rebind this
 	 * userptr.
@@ -105,27 +129,32 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
 	 */
 	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
 			    DMA_RESV_USAGE_BOOKKEEP);
-	dma_resv_for_each_fence_unlocked(&cursor, fence)
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		dma_fence_enable_sw_signaling(fence);
+		if (signaled && !dma_fence_is_signaled(fence))
+			signaled = false;
+	}
 	dma_resv_iter_end(&cursor);
 
-	err = dma_resv_wait_timeout(xe_vm_resv(vm),
-				    DMA_RESV_USAGE_BOOKKEEP,
-				    false, MAX_SCHEDULE_TIMEOUT);
-	XE_WARN_ON(err <= 0);
-
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
-		err = xe_vm_invalidate_vma(vma);
-		XE_WARN_ON(err);
+	/*
+	 * Only one caller at a time can use the multi-pass state.
+	 * If it's already in use, or all fences are already signaled,
+	 * proceed directly to invalidation without deferring.
+	 */
+	if (signaled || userptr->finish_inuse) {
+		xe_vma_userptr_do_inval(vm, uvma, false);
+		return NULL;
 	}
 
-	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
-			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
+	userptr->finish_inuse = true;
+
+	return &userptr->finish;
 }
 
-static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
-				   const struct mmu_notifier_range *range,
-				   unsigned long cur_seq)
+static bool xe_vma_userptr_invalidate_start(struct mmu_interval_notifier *mni,
+					    const struct mmu_notifier_range *range,
+					    unsigned long cur_seq,
+					    struct mmu_interval_notifier_finish **p_finish)
 {
 	struct xe_userptr_vma *uvma = container_of(mni, typeof(*uvma), userptr.notifier);
 	struct xe_vma *vma = &uvma->vma;
@@ -138,21 +167,40 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		return false;
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
-	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
+	       "NOTIFIER PASS1: addr=0x%016llx, range=0x%016llx",
 		xe_vma_start(vma), xe_vma_size(vma));
 
 	down_write(&vm->svm.gpusvm.notifier_lock);
 	mmu_interval_set_seq(mni, cur_seq);
 
-	__vma_userptr_invalidate(vm, uvma);
+	*p_finish = xe_vma_userptr_invalidate_pass1(vm, uvma);
+
 	up_write(&vm->svm.gpusvm.notifier_lock);
-	trace_xe_vma_userptr_invalidate_complete(vma);
+	if (!*p_finish)
+		trace_xe_vma_userptr_invalidate_complete(vma);
 
 	return true;
 }
 
+static void xe_vma_userptr_invalidate_finish(struct mmu_interval_notifier_finish *finish)
+{
+	struct xe_userptr_vma *uvma = container_of(finish, typeof(*uvma), userptr.finish);
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "NOTIFIER PASS2: addr=0x%016llx, range=0x%016llx",
+		xe_vma_start(vma), xe_vma_size(vma));
+
+	down_write(&vm->svm.gpusvm.notifier_lock);
+	xe_vma_userptr_do_inval(vm, uvma, true);
+	up_write(&vm->svm.gpusvm.notifier_lock);
+	trace_xe_vma_userptr_invalidate_complete(vma);
+}
+
 static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
-	.invalidate = vma_userptr_invalidate,
+	.invalidate_start = xe_vma_userptr_invalidate_start,
+	.invalidate_finish = xe_vma_userptr_invalidate_finish,
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
@@ -164,6 +212,7 @@ static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
  */
 void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 {
+	static struct mmu_interval_notifier_finish *finish;
 	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 
 	/* Protect against concurrent userptr pinning */
@@ -179,7 +228,10 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
 				     uvma->userptr.pages.notifier_seq))
 		uvma->userptr.pages.notifier_seq -= 2;
-	__vma_userptr_invalidate(vm, uvma);
+
+	finish = xe_vma_userptr_invalidate_pass1(vm, uvma);
+	if (finish)
+		xe_vma_userptr_do_inval(vm, uvma, true);
 }
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
index ef801234991e..4f42db61fd62 100644
--- a/drivers/gpu/drm/xe/xe_userptr.h
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -57,12 +57,26 @@ struct xe_userptr {
 	 */
 	struct mmu_interval_notifier notifier;
 
+	/**
+	 * @finish: MMU notifier finish structure for two-pass invalidation.
+	 * Embedded here to avoid allocation in the notifier callback.
+	 * Protected by @vm::svm.gpusvm.notifier_lock.
+	 */
+	struct mmu_interval_notifier_finish finish;
+	/**
+	 * @finish_inuse: Whether @finish is currently in use by an in-progress
+	 * two-pass invalidation.
+	 * Protected by @vm::svm.gpusvm.notifier_lock.
+	 */
+	bool finish_inuse;
+
 	/**
 	 * @initial_bind: user pointer has been bound at least once.
 	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
 	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm->resv held.
 	 */
 	bool initial_bind;
+
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 	u32 divisor;
 #endif
-- 
2.53.0

