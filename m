Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F2OKXRPqWk14AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:40:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DDB20EB13
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A78910EBDE;
	Thu,  5 Mar 2026 09:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkA5t/NU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AAE10EBDD;
 Thu,  5 Mar 2026 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703601; x=1804239601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EkW2TPya80geCG27da7LAu868d+oGPxc6iUTc9tfTpc=;
 b=gkA5t/NUlABWk7kGkY6ME5H15/3LtDEyK4PoSSN4IUn5woQ4lpY+3mGX
 +RA5HH5OzrIi2FPAf4PFPmG2n+DShze1DMOuhX8a6fBbOV1MErHlGBJa7
 Kt1pUQOthXC5uWcXEC3ffH4M9p4xaQLy1NJWR4wDXhtE9ryi9ZR7qzshA
 6ZwBFjnq6O2sIRgyIps/8jyfCyvJyDlqiUwgJ3wzJAaqxJpNiEb7Fags3
 PK2ijjDK8x4y1iby8m14E5hymRD0yrCzuA+XXX7egYSistfctAUpijT/P
 Y/t3+iqX0L8kK6UaRCc7n7oX/tCOJQ7Qg4ytA08yMvAwMgcb7065O3VYE Q==;
X-CSE-ConnectionGUID: snhLC/0MTrahPvblVblK8A==
X-CSE-MsgGUID: YDjfoE2iTXu9+HXZJCpN1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84871010"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="84871010"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:40:01 -0800
X-CSE-ConnectionGUID: O2xpvH8IT1GZu80v/B3Qmg==
X-CSE-MsgGUID: aW/HBbk8RYOpVy0TQlk+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="214685027"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.71])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 01:39:57 -0800
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
Subject: [PATCH v4 4/4] drm/xe/userptr: Defer Waiting for TLB invalidation to
 the second pass if possible
Date: Thu,  5 Mar 2026 10:39:09 +0100
Message-ID: <20260305093909.43623-5-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: 58DDB20EB13
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Now that the two-pass notifier flow uses xe_vma_userptr_do_inval() for
the fence-wait + TLB-invalidate work, extend it to support a further
deferred TLB wait:

- xe_vma_userptr_do_inval(): when the embedded finish handle is free,
  submit the TLB invalidation asynchronously (xe_vm_invalidate_vma_submit)
  and return &userptr->finish so the mmu_notifier core schedules a third
  pass.  When the handle is occupied by a concurrent invalidation, fall
  back to the synchronous xe_vm_invalidate_vma() path.

- xe_vma_userptr_complete_tlb_inval(): new helper called from
  invalidate_finish when tlb_inval_submitted is set.  Waits for the
  previously submitted batch and unmaps the gpusvm pages.

xe_vma_userptr_invalidate_finish() dispatches between the two helpers
via tlb_inval_submitted, making the three possible flows explicit:

  pass1 (fences pending)  -> invalidate_finish -> do_inval (sync TLB)
  pass1 (fences done)     -> do_inval -> invalidate_finish
                          -> complete_tlb_inval (deferred TLB)
  pass1 (finish occupied) -> do_inval (sync TLB, inline)

In multi-GPU scenarios this allows TLB flushes to be submitted on all
GPUs in one pass before any of them are waited on.

Also adds xe_vm_invalidate_vma_submit() which submits the TLB range
invalidation without blocking, populating a xe_tlb_inval_batch that
the caller waits on separately.

v3:
- Add locking asserts and notifier state asserts (Matt Brost)
- Update the locking documentation of the notifier
  state members (Matt Brost)
- Remove unrelated code formatting changes (Matt Brost)

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_userptr.c | 63 ++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_userptr.h | 17 +++++++++
 drivers/gpu/drm/xe/xe_vm.c      | 38 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.h      |  2 ++
 4 files changed, 104 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 37032b8125a6..6761005c0b90 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -8,6 +8,7 @@
 
 #include <linux/mm.h>
 
+#include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
 
 static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
@@ -81,8 +82,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 				    &ctx);
 }
 
-static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma,
-				    bool is_deferred)
+static struct mmu_interval_notifier_finish *
+xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_deferred)
 {
 	struct xe_userptr *userptr = &uvma->userptr;
 	struct xe_vma *vma = &uvma->vma;
@@ -93,6 +94,8 @@ static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvm
 	long err;
 
 	xe_userptr_assert_in_notifier(vm);
+	if (is_deferred)
+		xe_assert(vm->xe, userptr->finish_inuse && !userptr->tlb_inval_submitted);
 
 	err = dma_resv_wait_timeout(xe_vm_resv(vm),
 				    DMA_RESV_USAGE_BOOKKEEP,
@@ -100,6 +103,19 @@ static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvm
 	XE_WARN_ON(err <= 0);
 
 	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+		if (!userptr->finish_inuse) {
+			/*
+			 * Defer the TLB wait to an extra pass so the caller
+			 * can pipeline TLB flushes across GPUs before waiting
+			 * on any of them.
+			 */
+			xe_assert(vm->xe, !userptr->tlb_inval_submitted);
+			userptr->finish_inuse = true;
+			userptr->tlb_inval_submitted = true;
+			err = xe_vm_invalidate_vma_submit(vma, &userptr->inval_batch);
+			XE_WARN_ON(err);
+			return &userptr->finish;
+		}
 		err = xe_vm_invalidate_vma(vma);
 		XE_WARN_ON(err);
 	}
@@ -108,6 +124,28 @@ static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvm
 		userptr->finish_inuse = false;
 	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
 			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
+	return NULL;
+}
+
+static void
+xe_vma_userptr_complete_tlb_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	struct xe_vma *vma = &uvma->vma;
+	struct drm_gpusvm_ctx ctx = {
+		.in_notifier = true,
+		.read_only = xe_vma_read_only(vma),
+	};
+
+	xe_userptr_assert_in_notifier(vm);
+	xe_assert(vm->xe, userptr->finish_inuse);
+	xe_assert(vm->xe, userptr->tlb_inval_submitted);
+
+	xe_tlb_inval_batch_wait(&userptr->inval_batch);
+	userptr->tlb_inval_submitted = false;
+	userptr->finish_inuse = false;
+	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
+			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
 }
 
 static struct mmu_interval_notifier_finish *
@@ -153,11 +191,10 @@ xe_vma_userptr_invalidate_pass1(struct xe_vm *vm, struct xe_userptr_vma *uvma)
 	 * If it's already in use, or all fences are already signaled,
 	 * proceed directly to invalidation without deferring.
 	 */
-	if (signaled || userptr->finish_inuse) {
-		xe_vma_userptr_do_inval(vm, uvma, false);
-		return NULL;
-	}
+	if (signaled || userptr->finish_inuse)
+		return xe_vma_userptr_do_inval(vm, uvma, false);
 
+	/* Defer: the notifier core will call invalidate_finish once done. */
 	userptr->finish_inuse = true;
 
 	return &userptr->finish;
@@ -205,7 +242,15 @@ static void xe_vma_userptr_invalidate_finish(struct mmu_interval_notifier_finish
 		xe_vma_start(vma), xe_vma_size(vma));
 
 	down_write(&vm->svm.gpusvm.notifier_lock);
-	xe_vma_userptr_do_inval(vm, uvma, true);
+	/*
+	 * If a TLB invalidation was previously submitted (deferred from the
+	 * synchronous pass1 fallback), wait for it and unmap pages.
+	 * Otherwise, fences have now completed: invalidate the TLB and unmap.
+	 */
+	if (uvma->userptr.tlb_inval_submitted)
+		xe_vma_userptr_complete_tlb_inval(vm, uvma);
+	else
+		xe_vma_userptr_do_inval(vm, uvma, true);
 	up_write(&vm->svm.gpusvm.notifier_lock);
 	trace_xe_vma_userptr_invalidate_complete(vma);
 }
@@ -243,7 +288,9 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 
 	finish = xe_vma_userptr_invalidate_pass1(vm, uvma);
 	if (finish)
-		xe_vma_userptr_do_inval(vm, uvma, true);
+		finish = xe_vma_userptr_do_inval(vm, uvma, true);
+	if (finish)
+		xe_vma_userptr_complete_tlb_inval(vm, uvma);
 }
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
index e1830c2f5fd2..2a3cd1b5efbb 100644
--- a/drivers/gpu/drm/xe/xe_userptr.h
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -14,6 +14,8 @@
 
 #include <drm/drm_gpusvm.h>
 
+#include "xe_tlb_inval_types.h"
+
 struct xe_vm;
 struct xe_vma;
 struct xe_userptr_vma;
@@ -63,12 +65,27 @@ struct xe_userptr {
 	 * alternatively by the same lock in read mode *and* the vm resv held.
 	 */
 	struct mmu_interval_notifier_finish finish;
+	/**
+	 * @inval_batch: TLB invalidation batch for deferred completion.
+	 * Stores an in-flight TLB invalidation submitted during a two-pass
+	 * notifier so the wait can be deferred to a subsequent pass, allowing
+	 * multiple GPUs to be signalled before any of them are waited on.
+	 * Protected using the same locking as @finish.
+	 */
+	struct xe_tlb_inval_batch inval_batch;
 	/**
 	 * @finish_inuse: Whether @finish is currently in use by an in-progress
 	 * two-pass invalidation.
 	 * Protected using the same locking as @finish.
 	 */
 	bool finish_inuse;
+	/**
+	 * @tlb_inval_submitted: Whether a TLB invalidation has been submitted
+	 * via @inval_batch and is pending completion.  When set, the next pass
+	 * must call xe_tlb_inval_batch_wait() before reusing @inval_batch.
+	 * Protected using the same locking as @finish.
+	 */
+	bool tlb_inval_submitted;
 	/**
 	 * @initial_bind: user pointer has been bound at least once.
 	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a3c2e8cefec7..fdad9329dfb4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3967,20 +3967,23 @@ void xe_vm_unlock(struct xe_vm *vm)
 }
 
 /**
- * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
+ * xe_vm_invalidate_vma_submit - Submit a job to invalidate GPU mappings for
+ * VMA.
  * @vma: VMA to invalidate
+ * @batch: TLB invalidation batch to populate; caller must later call
+ *         xe_tlb_inval_batch_wait() on it to wait for completion
  *
  * Walks a list of page tables leaves which it memset the entries owned by this
- * VMA to zero, invalidates the TLBs, and block until TLBs invalidation is
- * complete.
+ * VMA to zero, invalidates the TLBs, but doesn't block waiting for TLB flush
+ * to complete, but instead populates @batch which can be waited on using
+ * xe_tlb_inval_batch_wait().
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_vm_invalidate_vma(struct xe_vma *vma)
+int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct xe_tlb_inval_batch *batch)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_tlb_inval_batch batch;
 	struct xe_tile *tile;
 	u8 tile_mask = 0;
 	int ret = 0;
@@ -4023,14 +4026,33 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	ret = xe_tlb_inval_range_tilemask_submit(xe, xe_vma_vm(vma)->usm.asid,
 						 xe_vma_start(vma), xe_vma_end(vma),
-						 tile_mask, &batch);
+						 tile_mask, batch);
 
 	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
 	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
+	return ret;
+}
+
+/**
+ * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
+ * @vma: VMA to invalidate
+ *
+ * Walks a list of page tables leaves which it memset the entries owned by this
+ * VMA to zero, invalidates the TLBs, and block until TLBs invalidation is
+ * complete.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_vm_invalidate_vma(struct xe_vma *vma)
+{
+	struct xe_tlb_inval_batch batch;
+	int ret;
 
-	if (!ret)
-		xe_tlb_inval_batch_wait(&batch);
+	ret = xe_vm_invalidate_vma_submit(vma, &batch);
+	if (ret)
+		return ret;
 
+	xe_tlb_inval_batch_wait(&batch);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 62f4b6fec0bc..0bc7ed23eeae 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -242,6 +242,8 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
+int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct xe_tlb_inval_batch *batch);
+
 int xe_vm_validate_protected(struct xe_vm *vm);
 
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
-- 
2.53.0

