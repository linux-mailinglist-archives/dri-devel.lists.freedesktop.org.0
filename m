Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F257563C93
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 00:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5113112663;
	Fri,  1 Jul 2022 22:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995A0112582;
 Fri,  1 Jul 2022 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656715878; x=1688251878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4T1QFi+P+DxZ697ZwBSeuFKKGUMiXDxEDMEMzzCv8E8=;
 b=PtyKS9jKTqVP0w/B5z8pa27cCgPzRu8TKZh3i9feDA05Alme2vG+Z7Wn
 UvqrnokKqPxBEOglHgshnUZfq/SPRJWETrfZdZznLIqrn4qQICyVMfXB2
 TpAq4hP9F+UTFHLReXB61aIDJdvv88mj8MVWQ56ZutkNlQN+3urMiycPe
 dniuqqPZLywEnLk66Q6fB7Ii8RdQ/aSH7YxXbZeW1vb8ZXh1vEVCBLODG
 nrRfXUROLMabf5GoyOdXYkHQXUdN4/tqVdBFqTmPIUTlrPjSt0JEPNUNu
 pZKIcXUc1oP65K1PCbHn6Slg+jH8bF2cokrHZgYRoIajXBjrWhJmjGolw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282789053"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="282789053"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 15:51:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="918645102"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 01 Jul 2022 15:51:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 06/10] drm/i915/vm_bind: Add I915_GEM_EXECBUFFER3 ioctl
Date: Fri,  1 Jul 2022 15:50:51 -0700
Message-Id: <20220701225055.8204-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only
works in vm_bind mode. The vm_bind mode only works with
this new execbuf3 ioctl.

The new execbuf3 ioctl will not have any execlist support
and all the legacy support like relocations etc are removed.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |    1 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |    5 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 1029 +++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |    2 +
 drivers/gpu/drm/i915/i915_driver.c            |    1 +
 include/uapi/drm/i915_drm.h                   |   67 +-
 6 files changed, 1104 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4e1627e96c6e..38cd1c5bc1a5 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -148,6 +148,7 @@ gem-y += \
 	gem/i915_gem_dmabuf.o \
 	gem/i915_gem_domain.o \
 	gem/i915_gem_execbuffer.o \
+	gem/i915_gem_execbuffer3.o \
 	gem/i915_gem_internal.o \
 	gem/i915_gem_object.o \
 	gem/i915_gem_lmem.o \
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index b7b2c14fd9e1..37bb1383ab8f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -782,6 +782,11 @@ static int eb_select_context(struct i915_execbuffer *eb)
 	if (unlikely(IS_ERR(ctx)))
 		return PTR_ERR(ctx);
 
+	if (ctx->vm->vm_bind_mode) {
+		i915_gem_context_put(ctx);
+		return -EOPNOTSUPP;
+	}
+
 	eb->gem_context = ctx;
 	if (i915_gem_context_has_full_ppgtt(ctx))
 		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
new file mode 100644
index 000000000000..13121df72e3d
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
@@ -0,0 +1,1029 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <linux/dma-resv.h>
+#include <linux/sync_file.h>
+#include <linux/uaccess.h>
+
+#include <drm/drm_syncobj.h>
+
+#include "gt/intel_context.h"
+#include "gt/intel_gpu_commands.h"
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_pm.h"
+#include "gt/intel_ring.h"
+
+#include "i915_drv.h"
+#include "i915_file_private.h"
+#include "i915_gem_context.h"
+#include "i915_gem_ioctls.h"
+#include "i915_gem_vm_bind.h"
+#include "i915_trace.h"
+
+#define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
+#define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
+
+/* Catch emission of unexpected errors for CI! */
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
+#undef EINVAL
+#define EINVAL ({ \
+	DRM_DEBUG_DRIVER("EINVAL at %s:%d\n", __func__, __LINE__); \
+	22; \
+})
+#endif
+
+/**
+ * DOC: User command execution with execbuf3 ioctl
+ *
+ * A VM in VM_BIND mode will not support older execbuf mode of binding.
+ * The execbuf ioctl handling in VM_BIND mode differs significantly from the
+ * older execbuf2 ioctl (See struct drm_i915_gem_execbuffer2).
+ * Hence, a new execbuf3 ioctl has been added to support VM_BIND mode. (See
+ * struct drm_i915_gem_execbuffer3). The execbuf3 ioctl will not accept any
+ * execlist. Hence, no support for implicit sync.
+ *
+ * The new execbuf3 ioctl only works in VM_BIND mode and the VM_BIND mode only
+ * works with execbuf3 ioctl for submission.
+ *
+ * The execbuf3 ioctl directly specifies the batch addresses instead of as
+ * object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
+ * support many of the older features like in/out/submit fences, fence array,
+ * default gem context etc. (See struct drm_i915_gem_execbuffer3).
+ *
+ * In VM_BIND mode, VA allocation is completely managed by the user instead of
+ * the i915 driver. Hence all VA assignment, eviction are not applicable in
+ * VM_BIND mode. Also, for determining object activeness, VM_BIND mode will not
+ * be using the i915_vma active reference tracking. It will instead check the
+ * dma-resv object's fence list for that.
+ *
+ * So, a lot of code supporting execbuf2 ioctl, like relocations, VA evictions,
+ * vma lookup table, implicit sync, vma active reference tracking etc., are not
+ * applicable for execbuf3 ioctl.
+ */
+
+struct eb_fence {
+	struct drm_syncobj *syncobj; /* Use with ptr_mask_bits() */
+	struct dma_fence *dma_fence;
+	u64 value;
+	struct dma_fence_chain *chain_fence;
+};
+
+struct i915_execbuffer {
+	struct drm_i915_private *i915; /** i915 backpointer */
+	struct drm_file *file; /** per-file lookup tables and limits */
+	struct drm_i915_gem_execbuffer3 *args; /** ioctl parameters */
+
+	struct intel_gt *gt; /* gt for the execbuf */
+	struct intel_context *context; /* logical state for the request */
+	struct i915_gem_context *gem_context; /** caller's context */
+
+	/** our requests to build */
+	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
+
+	/** used for excl fence in dma_resv objects when > 1 BB submitted */
+	struct dma_fence *composite_fence;
+
+	struct i915_gem_ww_ctx ww;
+
+	/* number of batches in execbuf IOCTL */
+	unsigned int num_batches;
+
+	u64 batch_addresses[MAX_ENGINE_INSTANCE + 1];
+	/** identity of the batch obj/vma */
+	struct i915_vma *batches[MAX_ENGINE_INSTANCE + 1];
+
+	struct eb_fence *fences;
+	unsigned long num_fences;
+};
+
+static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle);
+static void eb_unpin_engine(struct i915_execbuffer *eb);
+
+static int eb_select_context(struct i915_execbuffer *eb)
+{
+	struct i915_gem_context *ctx;
+
+	ctx = i915_gem_context_lookup(eb->file->driver_priv, eb->args->ctx_id);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	eb->gem_context = ctx;
+	return 0;
+}
+
+static struct i915_vma *
+eb_find_vma(struct i915_address_space *vm, u64 addr)
+{
+	u64 va;
+
+	assert_vm_bind_held(vm);
+
+	va = gen8_noncanonical_addr(addr & PIN_OFFSET_MASK);
+	return i915_gem_vm_bind_lookup_vma(vm, va);
+}
+
+static int eb_lookup_vmas(struct i915_execbuffer *eb)
+{
+	unsigned int i, current_batch = 0;
+	struct i915_vma *vma;
+
+	for (i = 0; i < eb->num_batches; i++) {
+		vma = eb_find_vma(eb->context->vm, eb->batch_addresses[i]);
+		if (!vma)
+			return -EINVAL;
+
+		eb->batches[current_batch] = vma;
+		++current_batch;
+	}
+
+	return 0;
+}
+
+static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
+{
+}
+
+static int eb_validate_vmas(struct i915_execbuffer *eb)
+{
+	int err;
+	bool throttle = true;
+
+retry:
+	err = eb_pin_engine(eb, throttle);
+	if (err) {
+		if (err != -EDEADLK)
+			return err;
+
+		goto err;
+	}
+
+	/* only throttle once, even if we didn't need to throttle */
+	throttle = false;
+
+err:
+	if (err == -EDEADLK) {
+		err = i915_gem_ww_ctx_backoff(&eb->ww);
+		if (!err)
+			goto retry;
+	}
+
+	return err;
+}
+
+/*
+ * Using two helper loops for the order of which requests / batches are created
+ * and added the to backend. Requests are created in order from the parent to
+ * the last child. Requests are added in the reverse order, from the last child
+ * to parent. This is done for locking reasons as the timeline lock is acquired
+ * during request creation and released when the request is added to the
+ * backend. To make lockdep happy (see intel_context_timeline_lock) this must be
+ * the ordering.
+ */
+#define for_each_batch_create_order(_eb, _i) \
+	for ((_i) = 0; (_i) < (_eb)->num_batches; ++(_i))
+#define for_each_batch_add_order(_eb, _i) \
+	BUILD_BUG_ON(!typecheck(int, _i)); \
+	for ((_i) = (_eb)->num_batches - 1; (_i) >= 0; --(_i))
+
+static int eb_move_to_gpu(struct i915_execbuffer *eb)
+{
+	/* Unconditionally flush any chipset caches (for streaming writes). */
+	intel_gt_chipset_flush(eb->gt);
+
+	return 0;
+}
+
+static int eb_request_submit(struct i915_execbuffer *eb,
+			     struct i915_request *rq,
+			     struct i915_vma *batch,
+			     u64 batch_len)
+{
+	int err;
+
+	if (intel_context_nopreempt(rq->context))
+		__set_bit(I915_FENCE_FLAG_NOPREEMPT, &rq->fence.flags);
+
+	/*
+	 * After we completed waiting for other engines (using HW semaphores)
+	 * then we can signal that this request/batch is ready to run. This
+	 * allows us to determine if the batch is still waiting on the GPU
+	 * or actually running by checking the breadcrumb.
+	 */
+	if (rq->context->engine->emit_init_breadcrumb) {
+		err = rq->context->engine->emit_init_breadcrumb(rq);
+		if (err)
+			return err;
+	}
+
+	err = rq->context->engine->emit_bb_start(rq,
+						 batch->node.start,
+						 batch_len, 0);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int eb_submit(struct i915_execbuffer *eb)
+{
+	unsigned int i;
+	int err;
+
+	err = eb_move_to_gpu(eb);
+
+	for_each_batch_create_order(eb, i) {
+		if (!eb->requests[i])
+			break;
+
+		trace_i915_request_queue(eb->requests[i], 0);
+		if (!err)
+			err = eb_request_submit(eb, eb->requests[i],
+						eb->batches[i],
+						eb->batches[i]->size);
+	}
+
+	return err;
+}
+
+static struct i915_request *eb_throttle(struct i915_execbuffer *eb, struct intel_context *ce)
+{
+	struct intel_ring *ring = ce->ring;
+	struct intel_timeline *tl = ce->timeline;
+	struct i915_request *rq;
+
+	/*
+	 * Completely unscientific finger-in-the-air estimates for suitable
+	 * maximum user request size (to avoid blocking) and then backoff.
+	 */
+	if (intel_ring_update_space(ring) >= PAGE_SIZE)
+		return NULL;
+
+	/*
+	 * Find a request that after waiting upon, there will be at least half
+	 * the ring available. The hysteresis allows us to compete for the
+	 * shared ring and should mean that we sleep less often prior to
+	 * claiming our resources, but not so long that the ring completely
+	 * drains before we can submit our next request.
+	 */
+	list_for_each_entry(rq, &tl->requests, link) {
+		if (rq->ring != ring)
+			continue;
+
+		if (__intel_ring_space(rq->postfix,
+				       ring->emit, ring->size) > ring->size / 2)
+			break;
+	}
+	if (&rq->link == &tl->requests)
+		return NULL; /* weird, we will check again later for real */
+
+	return i915_request_get(rq);
+}
+
+static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
+			   bool throttle)
+{
+	struct intel_timeline *tl;
+	struct i915_request *rq = NULL;
+
+	/*
+	 * Take a local wakeref for preparing to dispatch the execbuf as
+	 * we expect to access the hardware fairly frequently in the
+	 * process, and require the engine to be kept awake between accesses.
+	 * Upon dispatch, we acquire another prolonged wakeref that we hold
+	 * until the timeline is idle, which in turn releases the wakeref
+	 * taken on the engine, and the parent device.
+	 */
+	tl = intel_context_timeline_lock(ce);
+	if (IS_ERR(tl))
+		return PTR_ERR(tl);
+
+	intel_context_enter(ce);
+	if (throttle)
+		rq = eb_throttle(eb, ce);
+	intel_context_timeline_unlock(tl);
+
+	if (rq) {
+		bool nonblock = eb->file->filp->f_flags & O_NONBLOCK;
+		long timeout = nonblock ? 0 : MAX_SCHEDULE_TIMEOUT;
+
+		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
+				      timeout) < 0) {
+			i915_request_put(rq);
+
+			/*
+			 * Error path, cannot use intel_context_timeline_lock as
+			 * that is user interruptable and this clean up step
+			 * must be done.
+			 */
+			mutex_lock(&ce->timeline->mutex);
+			intel_context_exit(ce);
+			mutex_unlock(&ce->timeline->mutex);
+
+			if (nonblock)
+				return -EWOULDBLOCK;
+			else
+				return -EINTR;
+		}
+		i915_request_put(rq);
+	}
+
+	return 0;
+}
+
+static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle)
+{
+	struct intel_context *ce = eb->context, *child;
+	int err;
+	int i = 0, j = 0;
+
+	GEM_BUG_ON(eb->args->flags & __EXEC3_ENGINE_PINNED);
+
+	if (unlikely(intel_context_is_banned(ce)))
+		return -EIO;
+
+	/*
+	 * Pinning the contexts may generate requests in order to acquire
+	 * GGTT space, so do this first before we reserve a seqno for
+	 * ourselves.
+	 */
+	err = intel_context_pin_ww(ce, &eb->ww);
+	if (err)
+		return err;
+	for_each_child(ce, child) {
+		err = intel_context_pin_ww(child, &eb->ww);
+		GEM_BUG_ON(err);	/* perma-pinned should incr a counter */
+	}
+
+	for_each_child(ce, child) {
+		err = eb_pin_timeline(eb, child, throttle);
+		if (err)
+			goto unwind;
+		++i;
+	}
+	err = eb_pin_timeline(eb, ce, throttle);
+	if (err)
+		goto unwind;
+
+	eb->args->flags |= __EXEC3_ENGINE_PINNED;
+	return 0;
+
+unwind:
+	for_each_child(ce, child) {
+		if (j++ < i) {
+			mutex_lock(&child->timeline->mutex);
+			intel_context_exit(child);
+			mutex_unlock(&child->timeline->mutex);
+		}
+	}
+	for_each_child(ce, child)
+		intel_context_unpin(child);
+	intel_context_unpin(ce);
+	return err;
+}
+
+static void eb_unpin_engine(struct i915_execbuffer *eb)
+{
+	struct intel_context *ce = eb->context, *child;
+
+	if (!(eb->args->flags & __EXEC3_ENGINE_PINNED))
+		return;
+
+	eb->args->flags &= ~__EXEC3_ENGINE_PINNED;
+
+	for_each_child(ce, child) {
+		mutex_lock(&child->timeline->mutex);
+		intel_context_exit(child);
+		mutex_unlock(&child->timeline->mutex);
+
+		intel_context_unpin(child);
+	}
+
+	mutex_lock(&ce->timeline->mutex);
+	intel_context_exit(ce);
+	mutex_unlock(&ce->timeline->mutex);
+
+	intel_context_unpin(ce);
+}
+
+static int
+eb_select_engine(struct i915_execbuffer *eb)
+{
+	struct intel_context *ce, *child;
+	unsigned int idx;
+	int err;
+
+	if (!i915_gem_context_user_engines(eb->gem_context))
+		return -EINVAL;
+
+	idx = eb->args->engine_idx;
+	ce = i915_gem_context_get_engine(eb->gem_context, idx);
+	if (IS_ERR(ce))
+		return PTR_ERR(ce);
+
+	eb->num_batches = ce->parallel.number_children + 1;
+
+	for_each_child(ce, child)
+		intel_context_get(child);
+	intel_gt_pm_get(ce->engine->gt);
+
+	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
+		err = intel_context_alloc_state(ce);
+		if (err)
+			goto err;
+	}
+	for_each_child(ce, child) {
+		if (!test_bit(CONTEXT_ALLOC_BIT, &child->flags)) {
+			err = intel_context_alloc_state(child);
+			if (err)
+				goto err;
+		}
+	}
+
+	/*
+	 * ABI: Before userspace accesses the GPU (e.g. execbuffer), report
+	 * EIO if the GPU is already wedged.
+	 */
+	err = intel_gt_terminally_wedged(ce->engine->gt);
+	if (err)
+		goto err;
+
+	if (!i915_vm_tryget(ce->vm)) {
+		err = -ENOENT;
+		goto err;
+	}
+
+	eb->context = ce;
+	eb->gt = ce->engine->gt;
+
+	/*
+	 * Make sure engine pool stays alive even if we call intel_context_put
+	 * during ww handling. The pool is destroyed when last pm reference
+	 * is dropped, which breaks our -EDEADLK handling.
+	 */
+	return err;
+
+err:
+	intel_gt_pm_put(ce->engine->gt);
+	for_each_child(ce, child)
+		intel_context_put(child);
+	intel_context_put(ce);
+	return err;
+}
+
+static void
+eb_put_engine(struct i915_execbuffer *eb)
+{
+	struct intel_context *child;
+
+	i915_vm_put(eb->context->vm);
+	intel_gt_pm_put(eb->gt);
+	for_each_child(eb->context, child)
+		intel_context_put(child);
+	intel_context_put(eb->context);
+}
+
+static void
+__free_fence_array(struct eb_fence *fences, unsigned int n)
+{
+	while (n--) {
+		drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
+		dma_fence_put(fences[n].dma_fence);
+		dma_fence_chain_free(fences[n].chain_fence);
+	}
+	kvfree(fences);
+}
+
+static int add_timeline_fence_array(struct i915_execbuffer *eb)
+{
+	struct drm_i915_gem_timeline_fence __user *user_fences;
+	struct eb_fence *f;
+	u64 nfences;
+	int err = 0;
+
+	nfences = eb->args->fence_count;
+	if (!nfences)
+		return 0;
+
+	/* Check multiplication overflow for access_ok() and kvmalloc_array() */
+	BUILD_BUG_ON(sizeof(size_t) > sizeof(unsigned long));
+	if (nfences > min_t(unsigned long,
+			    ULONG_MAX / sizeof(*user_fences),
+			    SIZE_MAX / sizeof(*f)) - eb->num_fences)
+		return -EINVAL;
+
+	user_fences = u64_to_user_ptr(eb->args->timeline_fences);
+	if (!access_ok(user_fences, nfences * sizeof(*user_fences)))
+		return -EFAULT;
+
+	f = krealloc(eb->fences,
+		     (eb->num_fences + nfences) * sizeof(*f),
+		     __GFP_NOWARN | GFP_KERNEL);
+	if (!f)
+		return -ENOMEM;
+
+	eb->fences = f;
+	f += eb->num_fences;
+
+	BUILD_BUG_ON(~(ARCH_KMALLOC_MINALIGN - 1) &
+		     ~__I915_TIMELINE_FENCE_UNKNOWN_FLAGS);
+
+	while (nfences--) {
+		struct drm_i915_gem_timeline_fence user_fence;
+		struct drm_syncobj *syncobj;
+		struct dma_fence *fence = NULL;
+		u64 point;
+
+		if (__copy_from_user(&user_fence,
+				     user_fences++,
+				     sizeof(user_fence)))
+			return -EFAULT;
+
+		if (user_fence.flags & __I915_TIMELINE_FENCE_UNKNOWN_FLAGS)
+			return -EINVAL;
+
+		syncobj = drm_syncobj_find(eb->file, user_fence.handle);
+		if (!syncobj) {
+			DRM_DEBUG("Invalid syncobj handle provided\n");
+			return -ENOENT;
+		}
+
+		fence = drm_syncobj_fence_get(syncobj);
+
+		if (!fence && user_fence.flags &&
+		    !(user_fence.flags & I915_TIMELINE_FENCE_SIGNAL)) {
+			DRM_DEBUG("Syncobj handle has no fence\n");
+			drm_syncobj_put(syncobj);
+			return -EINVAL;
+		}
+
+		point = user_fence.value;
+		if (fence)
+			err = dma_fence_chain_find_seqno(&fence, point);
+
+		if (err && !(user_fence.flags & I915_TIMELINE_FENCE_SIGNAL)) {
+			DRM_DEBUG("Syncobj handle missing requested point %llu\n", point);
+			dma_fence_put(fence);
+			drm_syncobj_put(syncobj);
+			return err;
+		}
+
+		/*
+		 * A point might have been signaled already and
+		 * garbage collected from the timeline. In this case
+		 * just ignore the point and carry on.
+		 */
+		if (!fence && !(user_fence.flags & I915_TIMELINE_FENCE_SIGNAL)) {
+			drm_syncobj_put(syncobj);
+			continue;
+		}
+
+		/*
+		 * For timeline syncobjs we need to preallocate chains for
+		 * later signaling.
+		 */
+		if (point != 0 && user_fence.flags & I915_TIMELINE_FENCE_SIGNAL) {
+			/*
+			 * Waiting and signaling the same point (when point !=
+			 * 0) would break the timeline.
+			 */
+			if (user_fence.flags & I915_TIMELINE_FENCE_WAIT) {
+				DRM_DEBUG("Trying to wait & signal the same timeline point.\n");
+				dma_fence_put(fence);
+				drm_syncobj_put(syncobj);
+				return -EINVAL;
+			}
+
+			f->chain_fence = dma_fence_chain_alloc();
+			if (!f->chain_fence) {
+				drm_syncobj_put(syncobj);
+				dma_fence_put(fence);
+				return -ENOMEM;
+			}
+		} else {
+			f->chain_fence = NULL;
+		}
+
+		f->syncobj = ptr_pack_bits(syncobj, user_fence.flags, 2);
+		f->dma_fence = fence;
+		f->value = point;
+		f++;
+		eb->num_fences++;
+	}
+
+	return 0;
+}
+
+static void put_fence_array(struct eb_fence *fences, int num_fences)
+{
+	if (fences)
+		__free_fence_array(fences, num_fences);
+}
+
+static int
+await_fence_array(struct i915_execbuffer *eb,
+		  struct i915_request *rq)
+{
+	unsigned int n;
+	int err;
+
+	for (n = 0; n < eb->num_fences; n++) {
+		struct drm_syncobj *syncobj;
+		unsigned int flags;
+
+		syncobj = ptr_unpack_bits(eb->fences[n].syncobj, &flags, 2);
+
+		if (!eb->fences[n].dma_fence)
+			continue;
+
+		err = i915_request_await_dma_fence(rq, eb->fences[n].dma_fence);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static void signal_fence_array(const struct i915_execbuffer *eb,
+			       struct dma_fence * const fence)
+{
+	unsigned int n;
+
+	for (n = 0; n < eb->num_fences; n++) {
+		struct drm_syncobj *syncobj;
+		unsigned int flags;
+
+		syncobj = ptr_unpack_bits(eb->fences[n].syncobj, &flags, 2);
+		if (!(flags & I915_TIMELINE_FENCE_SIGNAL))
+			continue;
+
+		if (eb->fences[n].chain_fence) {
+			drm_syncobj_add_point(syncobj,
+					      eb->fences[n].chain_fence,
+					      fence,
+					      eb->fences[n].value);
+			/*
+			 * The chain's ownership is transferred to the
+			 * timeline.
+			 */
+			eb->fences[n].chain_fence = NULL;
+		} else {
+			drm_syncobj_replace_fence(syncobj, fence);
+		}
+	}
+}
+
+static int parse_timeline_fences(struct i915_execbuffer *eb)
+{
+	return add_timeline_fence_array(eb);
+}
+
+static int parse_batch_addresses(struct i915_execbuffer *eb)
+{
+	struct drm_i915_gem_execbuffer3 *args = eb->args;
+	u64 __user *batch_addr = u64_to_user_ptr(args->batch_address);
+
+	if (copy_from_user(eb->batch_addresses, batch_addr,
+			   sizeof(batch_addr[0]) * eb->num_batches))
+		return -EFAULT;
+
+	return 0;
+}
+
+static void retire_requests(struct intel_timeline *tl, struct i915_request *end)
+{
+	struct i915_request *rq, *rn;
+
+	list_for_each_entry_safe(rq, rn, &tl->requests, link)
+		if (rq == end || !i915_request_retire(rq))
+			break;
+}
+
+static int eb_request_add(struct i915_execbuffer *eb, struct i915_request *rq,
+			  int err, bool last_parallel)
+{
+	struct intel_timeline * const tl = i915_request_timeline(rq);
+	struct i915_sched_attr attr = {};
+	struct i915_request *prev;
+
+	lockdep_assert_held(&tl->mutex);
+	lockdep_unpin_lock(&tl->mutex, rq->cookie);
+
+	trace_i915_request_add(rq);
+
+	prev = __i915_request_commit(rq);
+
+	/* Check that the context wasn't destroyed before submission */
+	if (likely(!intel_context_is_closed(eb->context))) {
+		attr = eb->gem_context->sched;
+	} else {
+		/* Serialise with context_close via the add_to_timeline */
+		i915_request_set_error_once(rq, -ENOENT);
+		__i915_request_skip(rq);
+		err = -ENOENT; /* override any transient errors */
+	}
+
+	if (intel_context_is_parallel(eb->context)) {
+		if (err) {
+			__i915_request_skip(rq);
+			set_bit(I915_FENCE_FLAG_SKIP_PARALLEL,
+				&rq->fence.flags);
+		}
+		if (last_parallel)
+			set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
+				&rq->fence.flags);
+	}
+
+	__i915_request_queue(rq, &attr);
+
+	/* Try to clean up the client's timeline after submitting the request */
+	if (prev)
+		retire_requests(tl, prev);
+
+	mutex_unlock(&tl->mutex);
+
+	return err;
+}
+
+static int eb_requests_add(struct i915_execbuffer *eb, int err)
+{
+	int i;
+
+	/*
+	 * We iterate in reverse order of creation to release timeline mutexes in
+	 * same order.
+	 */
+	for_each_batch_add_order(eb, i) {
+		struct i915_request *rq = eb->requests[i];
+
+		if (!rq)
+			continue;
+		err |= eb_request_add(eb, rq, err, i == 0);
+	}
+
+	return err;
+}
+
+static void eb_requests_get(struct i915_execbuffer *eb)
+{
+	unsigned int i;
+
+	for_each_batch_create_order(eb, i) {
+		if (!eb->requests[i])
+			break;
+
+		i915_request_get(eb->requests[i]);
+	}
+}
+
+static void eb_requests_put(struct i915_execbuffer *eb)
+{
+	unsigned int i;
+
+	for_each_batch_create_order(eb, i) {
+		if (!eb->requests[i])
+			break;
+
+		i915_request_put(eb->requests[i]);
+	}
+}
+
+static int
+eb_composite_fence_create(struct i915_execbuffer *eb)
+{
+	struct dma_fence_array *fence_array;
+	struct dma_fence **fences;
+	unsigned int i;
+
+	GEM_BUG_ON(!intel_context_is_parent(eb->context));
+
+	fences = kmalloc_array(eb->num_batches, sizeof(*fences), GFP_KERNEL);
+	if (!fences)
+		return -ENOMEM;
+
+	for_each_batch_create_order(eb, i) {
+		fences[i] = &eb->requests[i]->fence;
+		__set_bit(I915_FENCE_FLAG_COMPOSITE,
+			  &eb->requests[i]->fence.flags);
+	}
+
+	fence_array = dma_fence_array_create(eb->num_batches,
+					     fences,
+					     eb->context->parallel.fence_context,
+					     eb->context->parallel.seqno++,
+					     false);
+	if (!fence_array) {
+		kfree(fences);
+		return -ENOMEM;
+	}
+
+	/* Move ownership to the dma_fence_array created above */
+	for_each_batch_create_order(eb, i)
+		dma_fence_get(fences[i]);
+
+	eb->composite_fence = &fence_array->base;
+
+	return 0;
+}
+
+static int
+eb_fences_add(struct i915_execbuffer *eb, struct i915_request *rq)
+{
+	int err;
+
+	if (unlikely(eb->gem_context->syncobj)) {
+		struct dma_fence *fence;
+
+		fence = drm_syncobj_fence_get(eb->gem_context->syncobj);
+		err = i915_request_await_dma_fence(rq, fence);
+		dma_fence_put(fence);
+		if (err)
+			return err;
+	}
+
+	if (eb->fences) {
+		err = await_fence_array(eb, rq);
+		if (err)
+			return err;
+	}
+
+	if (intel_context_is_parallel(eb->context)) {
+		err = eb_composite_fence_create(eb);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static struct intel_context *
+eb_find_context(struct i915_execbuffer *eb, unsigned int context_number)
+{
+	struct intel_context *child;
+
+	if (likely(context_number == 0))
+		return eb->context;
+
+	for_each_child(eb->context, child)
+		if (!--context_number)
+			return child;
+
+	GEM_BUG_ON("Context not found");
+
+	return NULL;
+}
+
+static int eb_requests_create(struct i915_execbuffer *eb)
+{
+	unsigned int i;
+	int err;
+
+	for_each_batch_create_order(eb, i) {
+		/* Allocate a request for this batch buffer nice and early. */
+		eb->requests[i] = i915_request_create(eb_find_context(eb, i));
+		if (IS_ERR(eb->requests[i])) {
+			err = PTR_ERR(eb->requests[i]);
+			eb->requests[i] = NULL;
+			return err;
+		}
+
+		/*
+		 * Only the first request added (committed to backend) has to
+		 * take the in fences into account as all subsequent requests
+		 * will have fences inserted inbetween them.
+		 */
+		if (i + 1 == eb->num_batches) {
+			err = eb_fences_add(eb, eb->requests[i]);
+			if (err)
+				return err;
+		}
+
+		/*
+		 * Not really on stack, but we don't want to call
+		 * kfree on the batch_snapshot when we put it, so use the
+		 * _onstack interface.
+		 */
+		if (eb->batches[i])
+			eb->requests[i]->batch_res =
+				i915_vma_resource_get(eb->batches[i]->resource);
+	}
+
+	return 0;
+}
+
+static int
+i915_gem_do_execbuffer(struct drm_device *dev,
+		       struct drm_file *file,
+		       struct drm_i915_gem_execbuffer3 *args)
+{
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct i915_execbuffer eb;
+	int err;
+
+	BUILD_BUG_ON(__EXEC3_INTERNAL_FLAGS & ~__I915_EXEC3_UNKNOWN_FLAGS);
+
+	eb.i915 = i915;
+	eb.file = file;
+	eb.args = args;
+
+	eb.fences = NULL;
+	eb.num_fences = 0;
+
+	memset(eb.requests, 0, sizeof(struct i915_request *) *
+	       ARRAY_SIZE(eb.requests));
+	eb.composite_fence = NULL;
+
+	err = parse_timeline_fences(&eb);
+	if (err)
+		return err;
+
+	err = eb_select_context(&eb);
+	if (unlikely(err))
+		goto err_fences;
+
+	err = eb_select_engine(&eb);
+	if (unlikely(err))
+		goto err_context;
+
+	err = parse_batch_addresses(&eb);
+	if (unlikely(err))
+		goto err_engine;
+
+	i915_gem_vm_bind_lock(eb.context->vm);
+
+	err = eb_lookup_vmas(&eb);
+	if (err) {
+		eb_release_vmas(&eb, true);
+		goto err_vm_bind_lock;
+	}
+
+	i915_gem_ww_ctx_init(&eb.ww, true);
+
+	err = eb_validate_vmas(&eb);
+	if (err)
+		goto err_vma;
+
+	ww_acquire_done(&eb.ww.ctx);
+
+	err = eb_requests_create(&eb);
+	if (err) {
+		if (eb.requests[0])
+			goto err_request;
+		else
+			goto err_vma;
+	}
+
+	err = eb_submit(&eb);
+
+err_request:
+	eb_requests_get(&eb);
+	err = eb_requests_add(&eb, err);
+
+	if (eb.fences)
+		signal_fence_array(&eb, eb.composite_fence ?
+				   eb.composite_fence :
+				   &eb.requests[0]->fence);
+
+	if (unlikely(eb.gem_context->syncobj)) {
+		drm_syncobj_replace_fence(eb.gem_context->syncobj,
+					  eb.composite_fence ?
+					  eb.composite_fence :
+					  &eb.requests[0]->fence);
+	}
+
+	if (eb.composite_fence)
+		dma_fence_put(eb.composite_fence);
+
+	eb_requests_put(&eb);
+
+err_vma:
+	eb_release_vmas(&eb, true);
+	WARN_ON(err == -EDEADLK);
+	i915_gem_ww_ctx_fini(&eb.ww);
+err_vm_bind_lock:
+	i915_gem_vm_bind_unlock(eb.context->vm);
+err_engine:
+	eb_put_engine(&eb);
+err_context:
+	i915_gem_context_put(eb.gem_context);
+err_fences:
+	put_fence_array(eb.fences, eb.num_fences);
+	return err;
+}
+
+int
+i915_gem_execbuffer3_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file)
+{
+	struct drm_i915_gem_execbuffer3 *args = data;
+	int err;
+
+	if (args->flags & __I915_EXEC3_UNKNOWN_FLAGS)
+		return -EINVAL;
+
+	err = i915_gem_do_execbuffer(dev, file, args);
+
+	args->flags &= ~__I915_EXEC3_UNKNOWN_FLAGS;
+	return err;
+}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
index 28d6526e32ab..b7a1e9725a84 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
@@ -18,6 +18,8 @@ int i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file);
 int i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file);
+int i915_gem_execbuffer3_ioctl(struct drm_device *dev, void *data,
+			       struct drm_file *file);
 int i915_gem_get_aperture_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
 int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 776ab7844f60..4c13628d8663 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1834,6 +1834,7 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_GEM_INIT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER, drm_invalid_op, DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER2_WR, i915_gem_execbuffer2_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER3, i915_gem_execbuffer3_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_PIN, i915_gem_reject_pin_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_UNPIN, i915_gem_reject_pin_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_BUSY, i915_gem_busy_ioctl, DRM_RENDER_ALLOW),
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index ce1c6592b0d7..45cc97f9a424 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -472,6 +472,7 @@ typedef struct _drm_i915_sarea {
 #define DRM_I915_GEM_CREATE_EXT		0x3c
 #define DRM_I915_GEM_VM_BIND		0x3d
 #define DRM_I915_GEM_VM_UNBIND		0x3e
+#define DRM_I915_GEM_EXECBUFFER3	0x3f
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)
@@ -538,6 +539,7 @@ typedef struct _drm_i915_sarea {
 #define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
 #define DRM_IOCTL_I915_GEM_VM_BIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
 #define DRM_IOCTL_I915_GEM_VM_UNBIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_unbind)
+#define DRM_IOCTL_I915_GEM_EXECBUFFER3	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
 
 /* Allow drivers to submit batchbuffers directly to hardware, relying
  * on the security mechanisms provided by hardware.
@@ -1277,7 +1279,8 @@ struct drm_i915_gem_exec_fence {
 /*
  * See drm_i915_gem_execbuffer_ext_timeline_fences.
  */
-#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
+#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES  0
+#define DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES 0
 
 /*
  * This structure describes an array of drm_syncobj and associated points for
@@ -1499,6 +1502,68 @@ struct drm_i915_gem_timeline_fence {
 	__u64 value;
 };
 
+/**
+ * struct drm_i915_gem_execbuffer3 - Structure for DRM_I915_GEM_EXECBUFFER3
+ * ioctl.
+ *
+ * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and VM_BIND mode
+ * only works with this ioctl for submission.
+ * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
+ */
+struct drm_i915_gem_execbuffer3 {
+	/**
+	 * @ctx_id: Context id
+	 *
+	 * Only contexts with user engine map are allowed.
+	 */
+	__u32 ctx_id;
+
+	/**
+	 * @engine_idx: Engine index
+	 *
+	 * An index in the user engine map of the context specified by @ctx_id.
+	 */
+	__u32 engine_idx;
+
+	/**
+	 * @batch_address: Batch gpu virtual address/es.
+	 *
+	 * For normal submission, it is the gpu virtual address of the batch
+	 * buffer. For parallel submission, it is a pointer to an array of
+	 * batch buffer gpu virtual addresses with array size equal to the
+	 * number of (parallel) engines involved in that submission (See
+	 * struct i915_context_engines_parallel_submit).
+	 */
+	__u64 batch_address;
+
+	/** @flags: Currently reserved, MBZ */
+	__u64 flags;
+#define __I915_EXEC3_UNKNOWN_FLAGS (~0)
+
+	/** @rsvd1: Reserved, MBZ */
+	__u32 rsvd1;
+
+	/** @fence_count: Number of fences in @timeline_fences array. */
+	__u32 fence_count;
+
+	/**
+	 * @timeline_fences: Pointer to an array of timeline fences.
+	 *
+	 * Timeline fences are of format struct drm_i915_gem_timeline_fence.
+	 */
+	__u64 timeline_fences;
+
+	/** @rsvd2: Reserved, MBZ */
+	__u64 rsvd2;
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
+};
+
 struct drm_i915_gem_pin {
 	/** Handle of the buffer to be pinned. */
 	__u32 handle;
-- 
2.21.0.rc0.32.g243a4c7e27

