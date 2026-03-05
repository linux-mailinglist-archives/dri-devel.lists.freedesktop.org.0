Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF7HBWxPqWk14AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:39:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E520EB04
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB6A10EBE3;
	Thu,  5 Mar 2026 09:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKwB+4Dy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BB210EBE1;
 Thu,  5 Mar 2026 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703593; x=1804239593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RxDfvkY1zjSBVKQEcXFdDHmfFd96afZzeTBuuwtsgrc=;
 b=kKwB+4Dyw4UXOMynvOEoxGNRDH7HCgMZ3aM5PAqm9mP2U1AetUXgY9Rk
 q9x4BBTCkpdybwjnLHThpMP5v7u/2N+loU92+LszmPLhvgN3rSb9b8ozL
 0Y4z18kDNVS5/GO1r8Fe0elrfhT9o/8GSam9cZIcUWjwHKaeYQ2QjXADN
 7t62IniLx9nu+8Fvj+g+cpFXOTfmx144s8U9eZ4apydZXJHl4oA8C/RCY
 LqHUWUkb0V0ckLwVNWb0s7Qh9YmOQNr5ZtGG6ep1a1lkGKNFNSnmGqELQ
 mPJ5b0CQ2EZQh3jsh/tN0n1Q5lFaRCx22eoUd1vidqru0jzeTGFU5U99d w==;
X-CSE-ConnectionGUID: j1vQq54WQOStATVAvHf2Sw==
X-CSE-MsgGUID: EjBgpc1rRheKgqpUd0WNJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84870973"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="84870973"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:39:52 -0800
X-CSE-ConnectionGUID: jIoRPFlKQDGYcH4Yx7DLnw==
X-CSE-MsgGUID: jic1ah2sT26hBeUow8COVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="214685012"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.71])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 01:39:48 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] drm/xe/userptr: Convert invalidation to two-pass MMU
 notifier
Date: Thu,  5 Mar 2026 10:39:07 +0100
Message-ID: <20260305093909.43623-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305093909.43623-1-thomas.hellstrom@linux.intel.com>
References: <20260305093909.43623-1-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: A21E520EB04
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
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,lists.freedesktop.org,ziepe.ca,linux-foundation.org,kernel.org,oracle.com,google.com,suse.com,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linux.intel.com:mid]
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

v3:
- Add locking asserts in notifier components (Matt Brost)
- Clean up newlines (Matt Brost)
- Update the userptr notifier state member locking documentation
  (Matt Brost)

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_userptr.c | 108 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_userptr.h |  14 ++++-
 2 files changed, 99 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index e120323c43bc..37032b8125a6 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -10,6 +10,14 @@
 
 #include "xe_trace_bo.h"
 
+static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
+{
+	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
+		       (lockdep_is_held(&vm->lock) &&
+			lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
+			dma_resv_held(xe_vm_resv(vm))));
+}
+
 /**
  * xe_vma_userptr_check_repin() - Advisory check for repin needed
  * @uvma: The userptr vma
@@ -73,18 +81,46 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
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
 
+	xe_userptr_assert_in_notifier(vm);
+
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
+	xe_userptr_assert_in_notifier(vm);
+
 	/*
 	 * Tell exec and rebind worker they need to repin and rebind this
 	 * userptr.
@@ -105,27 +141,32 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
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
@@ -138,21 +179,40 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
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
@@ -164,6 +224,7 @@ static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
  */
 void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 {
+	static struct mmu_interval_notifier_finish *finish;
 	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 
 	/* Protect against concurrent userptr pinning */
@@ -179,7 +240,10 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
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
index ef801234991e..e1830c2f5fd2 100644
--- a/drivers/gpu/drm/xe/xe_userptr.h
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -56,7 +56,19 @@ struct xe_userptr {
 	 * @notifier: MMU notifier for user pointer (invalidation call back)
 	 */
 	struct mmu_interval_notifier notifier;
-
+	/**
+	 * @finish: MMU notifier finish structure for two-pass invalidation.
+	 * Embedded here to avoid allocation in the notifier callback.
+	 * Protected by struct xe_vm::svm.gpusvm.notifier_lock in write mode
+	 * alternatively by the same lock in read mode *and* the vm resv held.
+	 */
+	struct mmu_interval_notifier_finish finish;
+	/**
+	 * @finish_inuse: Whether @finish is currently in use by an in-progress
+	 * two-pass invalidation.
+	 * Protected using the same locking as @finish.
+	 */
+	bool finish_inuse;
 	/**
 	 * @initial_bind: user pointer has been bound at least once.
 	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
-- 
2.53.0

