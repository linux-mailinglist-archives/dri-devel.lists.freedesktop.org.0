Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D764AB6D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 00:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B7A10E2BB;
	Mon, 12 Dec 2022 23:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9951810E2AC;
 Mon, 12 Dec 2022 23:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670886936; x=1702422936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4yXm+4K6NXFcAq+5uxVEea3xwnNgpemQKHHJjkmpVOM=;
 b=CWA5ciOAUvbpFbmnw+Pk8IAtuyDaPtMtgwgUsGYeacbtihLQ3f0+9f4i
 OGX9vhER+IMi0ipxGTYPn8wEdB50c8/SVHAVivqG+iZT3SEXxXkRhc6t2
 dCFNu/kUWwtofgFRvgNQSdVptTToXgQPvc+vPYTUOMi9mu2/ea+IMDqs+
 UgpFiMdEcdMN+Iw/IuIR8rfMYdxBPV1XqWBB6DvhsvO1GBBhdzDXQjPzj
 3h8Fu0QF1L3ouAx2RKXrV0XwnbqSKlDxieM/prOFEkZMUUcPe/LU3d1ts
 355UGJkMiC1yF4bBfB56AHGOq2h/DFu31n1KZXK4ycjSEUEZKrZlA7uce g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="380196382"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="380196382"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="679090339"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="679090339"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:35 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 12/23] drm/i915/vm_bind: Use common execbuf functions in
 execbuf path
Date: Mon, 12 Dec 2022 15:15:16 -0800
Message-Id: <20221212231527.2384-13-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the execbuf path to use common execbuf functions to
reduce code duplication with the newer execbuf3 path.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 513 ++----------------
 1 file changed, 39 insertions(+), 474 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 6a7f0227f65f..8b49543f3265 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -28,6 +28,7 @@
 #include "i915_file_private.h"
 #include "i915_gem_clflush.h"
 #include "i915_gem_context.h"
+#include "i915_gem_execbuffer_common.h"
 #include "i915_gem_evict.h"
 #include "i915_gem_ioctls.h"
 #include "i915_reg.h"
@@ -236,13 +237,6 @@ enum {
  * the batchbuffer in trusted mode, otherwise the ioctl is rejected.
  */
 
-struct eb_fence {
-	struct drm_syncobj *syncobj; /* Use with ptr_mask_bits() */
-	struct dma_fence *dma_fence;
-	u64 value;
-	struct dma_fence_chain *chain_fence;
-};
-
 struct i915_execbuffer {
 	struct drm_i915_private *i915; /** i915 backpointer */
 	struct drm_file *file; /** per-file lookup tables and limits */
@@ -2452,164 +2446,29 @@ static const enum intel_engine_id user_ring_map[] = {
 	[I915_EXEC_VEBOX]	= VECS0
 };
 
-static struct i915_request *eb_throttle(struct i915_execbuffer *eb, struct intel_context *ce)
-{
-	struct intel_ring *ring = ce->ring;
-	struct intel_timeline *tl = ce->timeline;
-	struct i915_request *rq;
-
-	/*
-	 * Completely unscientific finger-in-the-air estimates for suitable
-	 * maximum user request size (to avoid blocking) and then backoff.
-	 */
-	if (intel_ring_update_space(ring) >= PAGE_SIZE)
-		return NULL;
-
-	/*
-	 * Find a request that after waiting upon, there will be at least half
-	 * the ring available. The hysteresis allows us to compete for the
-	 * shared ring and should mean that we sleep less often prior to
-	 * claiming our resources, but not so long that the ring completely
-	 * drains before we can submit our next request.
-	 */
-	list_for_each_entry(rq, &tl->requests, link) {
-		if (rq->ring != ring)
-			continue;
-
-		if (__intel_ring_space(rq->postfix,
-				       ring->emit, ring->size) > ring->size / 2)
-			break;
-	}
-	if (&rq->link == &tl->requests)
-		return NULL; /* weird, we will check again later for real */
-
-	return i915_request_get(rq);
-}
-
-static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
-			   bool throttle)
-{
-	struct intel_timeline *tl;
-	struct i915_request *rq = NULL;
-
-	/*
-	 * Take a local wakeref for preparing to dispatch the execbuf as
-	 * we expect to access the hardware fairly frequently in the
-	 * process, and require the engine to be kept awake between accesses.
-	 * Upon dispatch, we acquire another prolonged wakeref that we hold
-	 * until the timeline is idle, which in turn releases the wakeref
-	 * taken on the engine, and the parent device.
-	 */
-	tl = intel_context_timeline_lock(ce);
-	if (IS_ERR(tl))
-		return PTR_ERR(tl);
-
-	intel_context_enter(ce);
-	if (throttle)
-		rq = eb_throttle(eb, ce);
-	intel_context_timeline_unlock(tl);
-
-	if (rq) {
-		bool nonblock = eb->file->filp->f_flags & O_NONBLOCK;
-		long timeout = nonblock ? 0 : MAX_SCHEDULE_TIMEOUT;
-
-		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
-				      timeout) < 0) {
-			i915_request_put(rq);
-
-			/*
-			 * Error path, cannot use intel_context_timeline_lock as
-			 * that is user interruptable and this clean up step
-			 * must be done.
-			 */
-			mutex_lock(&ce->timeline->mutex);
-			intel_context_exit(ce);
-			mutex_unlock(&ce->timeline->mutex);
-
-			if (nonblock)
-				return -EWOULDBLOCK;
-			else
-				return -EINTR;
-		}
-		i915_request_put(rq);
-	}
-
-	return 0;
-}
-
 static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle)
 {
-	struct intel_context *ce = eb->context, *child;
 	int err;
-	int i = 0, j = 0;
 
 	GEM_BUG_ON(eb->args->flags & __EXEC_ENGINE_PINNED);
 
-	if (unlikely(intel_context_is_banned(ce)))
-		return -EIO;
-
-	/*
-	 * Pinning the contexts may generate requests in order to acquire
-	 * GGTT space, so do this first before we reserve a seqno for
-	 * ourselves.
-	 */
-	err = intel_context_pin_ww(ce, &eb->ww);
+	err = i915_eb_pin_engine(eb->context, &eb->ww, throttle,
+				 eb->file->filp->f_flags & O_NONBLOCK);
 	if (err)
 		return err;
-	for_each_child(ce, child) {
-		err = intel_context_pin_ww(child, &eb->ww);
-		GEM_BUG_ON(err);	/* perma-pinned should incr a counter */
-	}
-
-	for_each_child(ce, child) {
-		err = eb_pin_timeline(eb, child, throttle);
-		if (err)
-			goto unwind;
-		++i;
-	}
-	err = eb_pin_timeline(eb, ce, throttle);
-	if (err)
-		goto unwind;
 
 	eb->args->flags |= __EXEC_ENGINE_PINNED;
 	return 0;
-
-unwind:
-	for_each_child(ce, child) {
-		if (j++ < i) {
-			mutex_lock(&child->timeline->mutex);
-			intel_context_exit(child);
-			mutex_unlock(&child->timeline->mutex);
-		}
-	}
-	for_each_child(ce, child)
-		intel_context_unpin(child);
-	intel_context_unpin(ce);
-	return err;
 }
 
 static void eb_unpin_engine(struct i915_execbuffer *eb)
 {
-	struct intel_context *ce = eb->context, *child;
-
 	if (!(eb->args->flags & __EXEC_ENGINE_PINNED))
 		return;
 
 	eb->args->flags &= ~__EXEC_ENGINE_PINNED;
 
-	for_each_child(ce, child) {
-		mutex_lock(&child->timeline->mutex);
-		intel_context_exit(child);
-		mutex_unlock(&child->timeline->mutex);
-
-		intel_context_unpin(child);
-	}
-
-	mutex_lock(&ce->timeline->mutex);
-	intel_context_exit(ce);
-	mutex_unlock(&ce->timeline->mutex);
-
-	intel_context_unpin(ce);
+	i915_eb_unpin_engine(eb->context);
 }
 
 static unsigned int
@@ -2658,7 +2517,7 @@ eb_select_legacy_ring(struct i915_execbuffer *eb)
 static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
-	struct intel_context *ce, *child;
+	struct intel_context *ce;
 	unsigned int idx;
 	int err;
 
@@ -2683,36 +2542,10 @@ eb_select_engine(struct i915_execbuffer *eb)
 	}
 	eb->num_batches = ce->parallel.number_children + 1;
 
-	for_each_child(ce, child)
-		intel_context_get(child);
-	intel_gt_pm_get(ce->engine->gt);
-
-	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
-		err = intel_context_alloc_state(ce);
-		if (err)
-			goto err;
-	}
-	for_each_child(ce, child) {
-		if (!test_bit(CONTEXT_ALLOC_BIT, &child->flags)) {
-			err = intel_context_alloc_state(child);
-			if (err)
-				goto err;
-		}
-	}
-
-	/*
-	 * ABI: Before userspace accesses the GPU (e.g. execbuffer), report
-	 * EIO if the GPU is already wedged.
-	 */
-	err = intel_gt_terminally_wedged(ce->engine->gt);
+	err = i915_eb_select_engine(ce);
 	if (err)
 		goto err;
 
-	if (!i915_vm_tryget(ce->vm)) {
-		err = -ENOENT;
-		goto err;
-	}
-
 	eb->context = ce;
 	eb->gt = ce->engine->gt;
 
@@ -2721,12 +2554,9 @@ eb_select_engine(struct i915_execbuffer *eb)
 	 * during ww handling. The pool is destroyed when last pm reference
 	 * is dropped, which breaks our -EDEADLK handling.
 	 */
-	return err;
+	return 0;
 
 err:
-	intel_gt_pm_put(ce->engine->gt);
-	for_each_child(ce, child)
-		intel_context_put(child);
 	intel_context_put(ce);
 	return err;
 }
@@ -2734,24 +2564,7 @@ eb_select_engine(struct i915_execbuffer *eb)
 static void
 eb_put_engine(struct i915_execbuffer *eb)
 {
-	struct intel_context *child;
-
-	i915_vm_put(eb->context->vm);
-	intel_gt_pm_put(eb->gt);
-	for_each_child(eb->context, child)
-		intel_context_put(child);
-	intel_context_put(eb->context);
-}
-
-static void
-__free_fence_array(struct eb_fence *fences, unsigned int n)
-{
-	while (n--) {
-		drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
-		dma_fence_put(fences[n].dma_fence);
-		dma_fence_chain_free(fences[n].chain_fence);
-	}
-	kvfree(fences);
+	i915_eb_put_engine(eb->context);
 }
 
 static int
@@ -2762,7 +2575,6 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
 	u64 __user *user_values;
 	struct eb_fence *f;
 	u64 nfences;
-	int err = 0;
 
 	nfences = timeline_fences->fence_count;
 	if (!nfences)
@@ -2797,9 +2609,9 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
 
 	while (nfences--) {
 		struct drm_i915_gem_exec_fence user_fence;
-		struct drm_syncobj *syncobj;
-		struct dma_fence *fence = NULL;
+		bool wait, signal;
 		u64 point;
+		int ret;
 
 		if (__copy_from_user(&user_fence,
 				     user_fences++,
@@ -2812,75 +2624,16 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
 		if (__get_user(point, user_values++))
 			return -EFAULT;
 
-		syncobj = drm_syncobj_find(eb->file, user_fence.handle);
-		if (!syncobj) {
-			drm_dbg(&eb->i915->drm,
-				"Invalid syncobj handle provided\n");
-			return -ENOENT;
-		}
-
-		fence = drm_syncobj_fence_get(syncobj);
-
-		if (!fence && user_fence.flags &&
-		    !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
-			drm_dbg(&eb->i915->drm,
-				"Syncobj handle has no fence\n");
-			drm_syncobj_put(syncobj);
-			return -EINVAL;
-		}
-
-		if (fence)
-			err = dma_fence_chain_find_seqno(&fence, point);
-
-		if (err && !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
-			drm_dbg(&eb->i915->drm,
-				"Syncobj handle missing requested point %llu\n",
-				point);
-			dma_fence_put(fence);
-			drm_syncobj_put(syncobj);
-			return err;
-		}
-
-		/*
-		 * A point might have been signaled already and
-		 * garbage collected from the timeline. In this case
-		 * just ignore the point and carry on.
-		 */
-		if (!fence && !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
-			drm_syncobj_put(syncobj);
+		wait = user_fence.flags & I915_EXEC_FENCE_WAIT;
+		signal = user_fence.flags & I915_EXEC_FENCE_SIGNAL;
+		ret = i915_eb_add_timeline_fence(eb->i915, eb->file,
+						 user_fence.handle, point,
+						 f, wait, signal);
+		if (ret < 0)
+			return ret;
+		else if (!ret)
 			continue;
-		}
-
-		/*
-		 * For timeline syncobjs we need to preallocate chains for
-		 * later signaling.
-		 */
-		if (point != 0 && user_fence.flags & I915_EXEC_FENCE_SIGNAL) {
-			/*
-			 * Waiting and signaling the same point (when point !=
-			 * 0) would break the timeline.
-			 */
-			if (user_fence.flags & I915_EXEC_FENCE_WAIT) {
-				drm_dbg(&eb->i915->drm,
-					"Trying to wait & signal the same timeline point.\n");
-				dma_fence_put(fence);
-				drm_syncobj_put(syncobj);
-				return -EINVAL;
-			}
-
-			f->chain_fence = dma_fence_chain_alloc();
-			if (!f->chain_fence) {
-				drm_syncobj_put(syncobj);
-				dma_fence_put(fence);
-				return -ENOMEM;
-			}
-		} else {
-			f->chain_fence = NULL;
-		}
 
-		f->syncobj = ptr_pack_bits(syncobj, user_fence.flags, 2);
-		f->dma_fence = fence;
-		f->value = point;
 		f++;
 		eb->num_fences++;
 	}
@@ -2962,60 +2715,6 @@ static int add_fence_array(struct i915_execbuffer *eb)
 	return 0;
 }
 
-static void put_fence_array(struct eb_fence *fences, int num_fences)
-{
-	if (fences)
-		__free_fence_array(fences, num_fences);
-}
-
-static int
-await_fence_array(struct i915_execbuffer *eb,
-		  struct i915_request *rq)
-{
-	unsigned int n;
-	int err;
-
-	for (n = 0; n < eb->num_fences; n++) {
-		if (!eb->fences[n].dma_fence)
-			continue;
-
-		err = i915_request_await_dma_fence(rq, eb->fences[n].dma_fence);
-		if (err < 0)
-			return err;
-	}
-
-	return 0;
-}
-
-static void signal_fence_array(const struct i915_execbuffer *eb,
-			       struct dma_fence * const fence)
-{
-	unsigned int n;
-
-	for (n = 0; n < eb->num_fences; n++) {
-		struct drm_syncobj *syncobj;
-		unsigned int flags;
-
-		syncobj = ptr_unpack_bits(eb->fences[n].syncobj, &flags, 2);
-		if (!(flags & I915_EXEC_FENCE_SIGNAL))
-			continue;
-
-		if (eb->fences[n].chain_fence) {
-			drm_syncobj_add_point(syncobj,
-					      eb->fences[n].chain_fence,
-					      fence,
-					      eb->fences[n].value);
-			/*
-			 * The chain's ownership is transferred to the
-			 * timeline.
-			 */
-			eb->fences[n].chain_fence = NULL;
-		} else {
-			drm_syncobj_replace_fence(syncobj, fence);
-		}
-	}
-}
-
 static int
 parse_timeline_fences(struct i915_user_extension __user *ext, void *data)
 {
@@ -3028,80 +2727,6 @@ parse_timeline_fences(struct i915_user_extension __user *ext, void *data)
 	return add_timeline_fence_array(eb, &timeline_fences);
 }
 
-static void retire_requests(struct intel_timeline *tl, struct i915_request *end)
-{
-	struct i915_request *rq, *rn;
-
-	list_for_each_entry_safe(rq, rn, &tl->requests, link)
-		if (rq == end || !i915_request_retire(rq))
-			break;
-}
-
-static int eb_request_add(struct i915_execbuffer *eb, struct i915_request *rq,
-			  int err, bool last_parallel)
-{
-	struct intel_timeline * const tl = i915_request_timeline(rq);
-	struct i915_sched_attr attr = {};
-	struct i915_request *prev;
-
-	lockdep_assert_held(&tl->mutex);
-	lockdep_unpin_lock(&tl->mutex, rq->cookie);
-
-	trace_i915_request_add(rq);
-
-	prev = __i915_request_commit(rq);
-
-	/* Check that the context wasn't destroyed before submission */
-	if (likely(!intel_context_is_closed(eb->context))) {
-		attr = eb->gem_context->sched;
-	} else {
-		/* Serialise with context_close via the add_to_timeline */
-		i915_request_set_error_once(rq, -ENOENT);
-		__i915_request_skip(rq);
-		err = -ENOENT; /* override any transient errors */
-	}
-
-	if (intel_context_is_parallel(eb->context)) {
-		if (err) {
-			__i915_request_skip(rq);
-			set_bit(I915_FENCE_FLAG_SKIP_PARALLEL,
-				&rq->fence.flags);
-		}
-		if (last_parallel)
-			set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
-				&rq->fence.flags);
-	}
-
-	__i915_request_queue(rq, &attr);
-
-	/* Try to clean up the client's timeline after submitting the request */
-	if (prev)
-		retire_requests(tl, prev);
-
-	mutex_unlock(&tl->mutex);
-
-	return err;
-}
-
-static int eb_requests_add(struct i915_execbuffer *eb, int err)
-{
-	int i;
-
-	/*
-	 * We iterate in reverse order of creation to release timeline mutexes in
-	 * same order.
-	 */
-	for_each_batch_add_order(eb, i) {
-		struct i915_request *rq = eb->requests[i];
-
-		if (!rq)
-			continue;
-		err |= eb_request_add(eb, rq, err, i == 0);
-	}
-
-	return err;
-}
-
 static const i915_user_extension_fn execbuf_extensions[] = {
 	[DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES] = parse_timeline_fences,
 };
@@ -3128,73 +2753,26 @@ parse_execbuf2_extensions(struct drm_i915_gem_execbuffer2 *args,
 				    eb);
 }
 
-static void eb_requests_get(struct i915_execbuffer *eb)
-{
-	unsigned int i;
-
-	for_each_batch_create_order(eb, i) {
-		if (!eb->requests[i])
-			break;
-
-		i915_request_get(eb->requests[i]);
-	}
-}
-
-static void eb_requests_put(struct i915_execbuffer *eb)
-{
-	unsigned int i;
-
-	for_each_batch_create_order(eb, i) {
-		if (!eb->requests[i])
-			break;
-
-		i915_request_put(eb->requests[i]);
-	}
-}
-
 static struct sync_file *
 eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
 {
 	struct sync_file *out_fence = NULL;
-	struct dma_fence_array *fence_array;
-	struct dma_fence **fences;
-	unsigned int i;
-
-	GEM_BUG_ON(!intel_context_is_parent(eb->context));
+	struct dma_fence *fence;
 
-	fences = kmalloc_array(eb->num_batches, sizeof(*fences), GFP_KERNEL);
-	if (!fences)
-		return ERR_PTR(-ENOMEM);
-
-	for_each_batch_create_order(eb, i) {
-		fences[i] = &eb->requests[i]->fence;
-		__set_bit(I915_FENCE_FLAG_COMPOSITE,
-			  &eb->requests[i]->fence.flags);
-	}
-
-	fence_array = dma_fence_array_create(eb->num_batches,
-					     fences,
-					     eb->context->parallel.fence_context,
-					     eb->context->parallel.seqno++,
-					     false);
-	if (!fence_array) {
-		kfree(fences);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	/* Move ownership to the dma_fence_array created above */
-	for_each_batch_create_order(eb, i)
-		dma_fence_get(fences[i]);
+	fence = i915_eb_composite_fence_create(eb->requests, eb->num_batches,
+					       eb->context);
+	if (IS_ERR(fence))
+		return ERR_CAST(fence);
 
 	if (out_fence_fd != -1) {
-		out_fence = sync_file_create(&fence_array->base);
+		out_fence = sync_file_create(fence);
 		/* sync_file now owns fence_arry, drop creation ref */
-		dma_fence_put(&fence_array->base);
+		dma_fence_put(fence);
 		if (!out_fence)
 			return ERR_PTR(-ENOMEM);
 	}
 
-	eb->composite_fence = &fence_array->base;
+	eb->composite_fence = fence;
 
 	return out_fence;
 }
@@ -3226,7 +2804,7 @@ eb_fences_add(struct i915_execbuffer *eb, struct i915_request *rq,
 	}
 
 	if (eb->fences) {
-		err = await_fence_array(eb, rq);
+		err = i915_eb_await_fence_array(eb->fences, eb->num_fences, rq);
 		if (err)
 			return ERR_PTR(err);
 	}
@@ -3244,23 +2822,6 @@ eb_fences_add(struct i915_execbuffer *eb, struct i915_request *rq,
 	return out_fence;
 }
 
-static struct intel_context *
-eb_find_context(struct i915_execbuffer *eb, unsigned int context_number)
-{
-	struct intel_context *child;
-
-	if (likely(context_number == 0))
-		return eb->context;
-
-	for_each_child(eb->context, child)
-		if (!--context_number)
-			return child;
-
-	GEM_BUG_ON("Context not found");
-
-	return NULL;
-}
-
 static struct sync_file *
 eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
 		   int out_fence_fd)
@@ -3270,7 +2831,9 @@ eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
 
 	for_each_batch_create_order(eb, i) {
 		/* Allocate a request for this batch buffer nice and early. */
-		eb->requests[i] = i915_request_create(eb_find_context(eb, i));
+		eb->requests[i] =
+			i915_request_create(i915_eb_find_context(eb->context,
+								 i));
 		if (IS_ERR(eb->requests[i])) {
 			out_fence = ERR_CAST(eb->requests[i]);
 			eb->requests[i] = NULL;
@@ -3450,13 +3013,15 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	err = eb_submit(&eb);
 
 err_request:
-	eb_requests_get(&eb);
-	err = eb_requests_add(&eb, err);
+	i915_eb_requests_get(eb.requests, eb.num_batches);
+	err = i915_eb_requests_add(eb.requests, eb.num_batches, eb.context,
+				   eb.gem_context->sched, err);
 
 	if (eb.fences)
-		signal_fence_array(&eb, eb.composite_fence ?
-				   eb.composite_fence :
-				   &eb.requests[0]->fence);
+		i915_eb_signal_fence_array(eb.fences, eb.num_fences,
+					   eb.composite_fence ?
+					   eb.composite_fence :
+					   &eb.requests[0]->fence);
 
 	if (out_fence) {
 		if (err == 0) {
@@ -3479,7 +3044,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	if (!out_fence && eb.composite_fence)
 		dma_fence_put(eb.composite_fence);
 
-	eb_requests_put(&eb);
+	i915_eb_requests_put(eb.requests, eb.num_batches);
 
 err_vma:
 	eb_release_vmas(&eb, true);
@@ -3500,7 +3065,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 err_in_fence:
 	dma_fence_put(in_fence);
 err_ext:
-	put_fence_array(eb.fences, eb.num_fences);
+	i915_eb_put_fence_array(eb.fences, eb.num_fences);
 	return err;
 }
 
-- 
2.21.0.rc0.32.g243a4c7e27

