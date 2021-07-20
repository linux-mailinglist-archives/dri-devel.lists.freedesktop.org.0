Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5075E3D02EB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E046E53E;
	Tue, 20 Jul 2021 20:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE136E52E;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885380"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885380"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906099"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 39/42] drm/i915: Multi-batch execbuffer2
Date: Tue, 20 Jul 2021 13:57:59 -0700
Message-Id: <20210720205802.39610-40-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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

For contexts with width set to two or more, we add a mode to execbuf2
which implies there are N batch buffers in the buffer list, each of
which will be sent to one of the engines from the engine map array
(I915_CONTEXT_PARAM_ENGINES, I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT).

Those N batches can either be first N, or last N objects in the list as
controlled by the existing execbuffer2 flag.

The N batches will be submitted to consecutive engines from the previously
configured allowed engine array starting at index 0.

Input and output fences are fully supported, with the latter getting
signalled when all batch buffers have completed.

Last, it isn't safe for subsequent batches to touch any objects written
to by a multi-BB submission until all the batches in that submission
complete. As such all batches in a multi-BB submission must be combined
into a single composite fence and put into the dma reseveration excl
fence slot.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 263 +++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_context.c       |   5 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +
 drivers/gpu/drm/i915/i915_vma.c               |  13 +-
 drivers/gpu/drm/i915/i915_vma.h               |  16 +-
 5 files changed, 267 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index cf4288ce7141..1e3a8d9b965c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -252,6 +252,9 @@ struct i915_execbuffer {
 	struct eb_vma *batch; /** identity of the batch obj/vma */
 	struct i915_vma *trampoline; /** trampoline used for chaining */
 
+	/** used for excl fence in dma_resv objects when > 1 BB submitted */
+	struct dma_fence *composite_fence;
+
 	/* batch_index in vma list */
 	unsigned int batch_index;
 
@@ -367,11 +370,6 @@ static int eb_create(struct i915_execbuffer *eb)
 		eb->lut_size = -eb->buffer_count;
 	}
 
-	if (eb->args->flags & I915_EXEC_BATCH_FIRST)
-		eb->batch_index = 0;
-	else
-		eb->batch_index = eb->args->buffer_count - 1;
-
 	return 0;
 }
 
@@ -2241,7 +2239,7 @@ static int eb_relocate_parse(struct i915_execbuffer *eb)
 	return err;
 }
 
-static int eb_move_to_gpu(struct i915_execbuffer *eb, bool first)
+static int eb_move_to_gpu(struct i915_execbuffer *eb, bool first, bool last)
 {
 	const unsigned int count = eb->buffer_count;
 	unsigned int i = count;
@@ -2289,8 +2287,16 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb, bool first)
 		}
 
 		if (err == 0)
-			err = i915_vma_move_to_active(vma, eb->request,
-						      flags | __EXEC_OBJECT_NO_RESERVE);
+			err = _i915_vma_move_to_active(vma, eb->request,
+						       flags | __EXEC_OBJECT_NO_RESERVE,
+						       !last ?
+						       NULL :
+						       eb->composite_fence ?
+						       eb->composite_fence :
+						       &eb->request->fence,
+						       eb->composite_fence ?
+						       eb->composite_fence :
+						       &eb->request->fence);
 	}
 
 #ifdef CONFIG_MMU_NOTIFIER
@@ -2528,14 +2534,14 @@ static int eb_parse(struct i915_execbuffer *eb)
 }
 
 static int eb_submit(struct i915_execbuffer *eb, struct i915_vma *batch,
-		     bool first)
+		     bool first, bool last)
 {
 	int err;
 
 	if (intel_context_nopreempt(eb->context))
 		__set_bit(I915_FENCE_FLAG_NOPREEMPT, &eb->request->fence.flags);
 
-	err = eb_move_to_gpu(eb, first);
+	err = eb_move_to_gpu(eb, first, last);
 	if (err)
 		return err;
 
@@ -2748,7 +2754,7 @@ eb_select_legacy_ring(struct i915_execbuffer *eb)
 }
 
 static int
-eb_select_engine(struct i915_execbuffer *eb)
+eb_select_engine(struct i915_execbuffer *eb, unsigned int batch_number)
 {
 	struct intel_context *ce;
 	unsigned int idx;
@@ -2763,6 +2769,18 @@ eb_select_engine(struct i915_execbuffer *eb)
 	if (IS_ERR(ce))
 		return PTR_ERR(ce);
 
+	if (batch_number > 0) {
+		struct intel_context *parent = ce;
+
+		GEM_BUG_ON(!intel_context_is_parent(parent));
+
+		for_each_child(parent, ce)
+			if (!--batch_number)
+				break;
+		intel_context_put(parent);
+		intel_context_get(ce);
+	}
+
 	intel_gt_pm_get(ce->engine->gt);
 
 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
@@ -3155,13 +3173,49 @@ parse_execbuf2_extensions(struct drm_i915_gem_execbuffer2 *args,
 				    eb);
 }
 
+static int setup_composite_fence(struct i915_execbuffer *eb,
+				 struct dma_fence **out_fence,
+				 unsigned int num_batches)
+{
+	struct dma_fence_array *fence_array;
+	struct dma_fence **fences = kmalloc(num_batches * sizeof(*fences),
+					    GFP_KERNEL);
+	struct intel_context *parent = intel_context_to_parent(eb->context);
+	int i;
+
+	if (!fences)
+		return -ENOMEM;
+
+	for (i = 0; i < num_batches; ++i)
+		fences[i] = out_fence[i];
+
+	fence_array = dma_fence_array_create(num_batches,
+					     fences,
+					     parent->fence_context,
+					     ++parent->seqno,
+					     false);
+	if (!fence_array) {
+		kfree(fences);
+		return -ENOMEM;
+	}
+
+	/* Move ownership to the dma_fence_array created above */
+	for (i = 0; i < num_batches; ++i)
+		dma_fence_get(fences[i]);
+
+	eb->composite_fence = &fence_array->base;
+
+	return 0;
+}
+
 static int
 i915_gem_do_execbuffer(struct drm_device *dev,
 		       struct drm_file *file,
 		       struct drm_i915_gem_execbuffer2 *args,
 		       struct drm_i915_gem_exec_object2 *exec,
-		       int batch_index,
+		       unsigned int batch_index,
 		       unsigned int num_batches,
+		       unsigned int batch_number,
 		       struct dma_fence *in_fence,
 		       struct dma_fence *exec_fence,
 		       struct dma_fence **out_fence)
@@ -3170,6 +3224,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	struct i915_execbuffer eb;
 	struct i915_vma *batch;
 	int err;
+	bool first = batch_number == 0;
+	bool last = batch_number + 1 == num_batches;
 
 	BUILD_BUG_ON(__EXEC_INTERNAL_FLAGS & ~__I915_EXEC_ILLEGAL_FLAGS);
 	BUILD_BUG_ON(__EXEC_OBJECT_INTERNAL_FLAGS &
@@ -3194,6 +3250,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	eb.batch_start_offset = args->batch_start_offset;
 	eb.batch_len = args->batch_len;
 	eb.trampoline = NULL;
+	eb.composite_fence = NULL;
 
 	eb.fences = NULL;
 	eb.num_fences = 0;
@@ -3219,14 +3276,13 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	GEM_BUG_ON(!eb.lut_size);
 
 	eb.num_batches = num_batches;
-	if (batch_index >= 0)
-		eb.batch_index = batch_index;
+	eb.batch_index = batch_index;
 
 	err = eb_select_context(&eb);
 	if (unlikely(err))
 		goto err_destroy;
 
-	err = eb_select_engine(&eb);
+	err = eb_select_engine(&eb, batch_number);
 	if (unlikely(err))
 		goto err_context;
 
@@ -3282,6 +3338,10 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 			goto err_request;
 	}
 
+	if (last)
+		set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
+			&eb.request->fence.flags);
+
 	if (in_fence) {
 		err = i915_request_await_dma_fence(eb.request,
 						   in_fence);
@@ -3295,6 +3355,23 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 			goto err_request;
 	}
 
+	if (out_fence) {
+		/* Move ownership to caller (i915_gem_execbuffer2_ioctl) */
+		out_fence[batch_number] = dma_fence_get(&eb.request->fence);
+
+		/*
+		 * Need to create a composite fence (dma_fence_array,
+		 * eb.composite_fence) for the excl fence of the dma_resv
+		 * objects as each BB can write to the object. Since we create
+		 */
+		if (num_batches > 1 && last) {
+			err = setup_composite_fence(&eb, out_fence,
+						    num_batches);
+			if (err < 0)
+				goto err_request;
+		}
+	}
+
 	/*
 	 * Whilst this request exists, batch_obj will be on the
 	 * active_list, and so will hold the active reference. Only when this
@@ -3307,7 +3384,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		intel_gt_buffer_pool_mark_active(eb.batch_pool, eb.request);
 
 	trace_i915_request_queue(eb.request, eb.batch_flags);
-	err = eb_submit(&eb, batch, true);
+	err = eb_submit(&eb, batch, first, last);
 
 err_request:
 	i915_request_get(eb.request);
@@ -3316,8 +3393,14 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	if (eb.fences)
 		signal_fence_array(&eb);
 
-	if (!err && out_fence)
-		*out_fence = dma_fence_get(&eb.request->fence);
+	/*
+	 * Ownership of the composite fence (dma_fence_array,
+	 * eb.composite_fence) has been moved to the dma_resv objects these BB
+	 * write to in i915_vma_move_to_active. It is ok to release the creation
+	 * reference of this fence now.
+	 */
+	if (eb.composite_fence)
+		dma_fence_put(eb.composite_fence);
 
 	if (unlikely(eb.gem_context->syncobj)) {
 		drm_syncobj_replace_fence(eb.gem_context->syncobj,
@@ -3368,6 +3451,17 @@ static bool check_buffer_count(size_t count)
 	return !(count < 1 || count > INT_MAX || count > SIZE_MAX / sz - 1);
 }
 
+/* Release fences from the dma_fence_get in i915_gem_do_execbuffer. */
+static inline void put_out_fences(struct dma_fence **out_fences,
+				  unsigned int num_batches)
+{
+	int i;
+
+	for (i = 0; i < num_batches; ++i)
+		if (out_fences[i])
+			dma_fence_put(out_fences[i]);
+}
+
 int
 i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file)
@@ -3375,13 +3469,16 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_execbuffer2 *args = data;
 	struct drm_i915_gem_exec_object2 *exec2_list;
-	struct dma_fence **out_fence_p = NULL;
-	struct dma_fence *out_fence = NULL;
+	struct dma_fence **out_fences = NULL;
 	struct dma_fence *in_fence = NULL;
 	struct dma_fence *exec_fence = NULL;
 	int out_fence_fd = -1;
 	const size_t count = args->buffer_count;
 	int err;
+	struct i915_gem_context *ctx;
+	struct intel_context *parent = NULL;
+	unsigned int num_batches = 1, i;
+	bool is_parallel = false;
 
 	if (!check_buffer_count(count)) {
 		drm_dbg(&i915->drm, "execbuf2 with %zd buffers\n", count);
@@ -3404,10 +3501,39 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		return err;
 
+	ctx = i915_gem_context_lookup(file->driver_priv, args->rsvd1);
+	if (unlikely(IS_ERR(ctx)))
+		return PTR_ERR(ctx);
+
+	if (i915_gem_context_user_engines(ctx)) {
+		parent = i915_gem_context_get_engine(ctx, args->flags &
+						     I915_EXEC_RING_MASK);
+		if (IS_ERR(parent)) {
+			err = PTR_ERR(parent);
+			goto err_context;
+		}
+
+		if (intel_context_is_parent(parent)) {
+			if (args->batch_len) {
+				err = -EINVAL;
+				goto err_context;
+			}
+
+			num_batches = parent->guc_number_children + 1;
+			if (num_batches > count) {
+				i915_gem_context_put(ctx);
+				goto err_parent;
+			}
+			is_parallel = true;
+		}
+	}
+
 	if (args->flags & I915_EXEC_FENCE_IN) {
 		in_fence = sync_file_get_fence(lower_32_bits(args->rsvd2));
-		if (!in_fence)
-			return -EINVAL;
+		if (!in_fence) {
+			err = -EINVAL;
+			goto err_parent;
+		}
 	}
 
 	if (args->flags & I915_EXEC_FENCE_SUBMIT) {
@@ -3423,15 +3549,28 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	if (args->flags & I915_EXEC_FENCE_OUT) {
-		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
-		if (out_fence_fd < 0) {
-			err = out_fence_fd;
+	/*
+	 * We always allocate out fences when doing multi-BB submission as
+	 * this is required to create an excl fence for any dma buf objects
+	 * these BBs touch.
+	 */
+	if (args->flags & I915_EXEC_FENCE_OUT || is_parallel) {
+		out_fences = kcalloc(num_batches, sizeof(*out_fences),
+				     GFP_KERNEL);
+		if (!out_fences) {
+			err = -ENOMEM;
 			goto err_out_fence;
 		}
-		out_fence_p = &out_fence;
+		if (args->flags & I915_EXEC_FENCE_OUT) {
+			out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
+			if (out_fence_fd < 0) {
+				err = out_fence_fd;
+				goto err_out_fence;
+			}
+		}
 	}
 
+
 	/* Allocate extra slots for use by the command parser */
 	exec2_list = kvmalloc_array(count + 2, eb_element_size(),
 				    __GFP_NOWARN | GFP_KERNEL);
@@ -3449,8 +3588,35 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 		goto err_copy;
 	}
 
-	err = i915_gem_do_execbuffer(dev, file, args, exec2_list, -1, 1,
-				     in_fence, exec_fence, out_fence_p);
+	/*
+	 * Downstream submission code expects all parallel submissions to occur
+	 * in intel_context sequence, thus only 1 submission can happen at a
+	 * time.
+	 */
+	if (is_parallel)
+		mutex_lock(&parent->parallel_submit);
+
+	err = i915_gem_do_execbuffer(dev, file, args, exec2_list,
+				     args->flags & I915_EXEC_BATCH_FIRST ?
+				     0 : count - num_batches,
+				     num_batches,
+				     0,
+				     in_fence,
+				     exec_fence,
+				     out_fences);
+
+	for (i = 1; err == 0 && i < num_batches; i++)
+		err = i915_gem_do_execbuffer(dev, file, args, exec2_list,
+					     args->flags & I915_EXEC_BATCH_FIRST ?
+					     i : count - num_batches + i,
+					     num_batches,
+					     i,
+					     NULL,
+					     NULL,
+					     out_fences);
+
+	if (is_parallel)
+		mutex_unlock(&parent->parallel_submit);
 
 	/*
 	 * Now that we have begun execution of the batchbuffer, we ignore
@@ -3491,8 +3657,31 @@ end:;
 	}
 
 	if (!err && out_fence_fd >= 0) {
+		struct dma_fence *out_fence = NULL;
 		struct sync_file *sync_fence;
 
+		if (is_parallel) {
+			struct dma_fence_array *fence_array;
+
+			/*
+			 * The dma_fence_array now owns out_fences (from
+			 * dma_fence_get in i915_gem_do_execbuffer) assuming
+			 * successful creation of dma_fence_array.
+			 */
+			fence_array = dma_fence_array_create(num_batches,
+							     out_fences,
+							     parent->fence_context,
+							     ++parent->seqno,
+							     false);
+			if (!fence_array)
+				goto put_out_fences;
+
+			out_fence = &fence_array->base;
+			out_fences = NULL;
+		} else {
+			out_fence = out_fences[0];
+		}
+
 		sync_fence = sync_file_create(out_fence);
 		if (sync_fence) {
 			fd_install(out_fence_fd, sync_fence->file);
@@ -3500,9 +3689,15 @@ end:;
 			args->rsvd2 |= (u64)out_fence_fd << 32;
 			out_fence_fd = -1;
 		}
+
+		/*
+		 * The sync_file now owns out_fence, drop the creation
+		 * reference.
+		 */
 		dma_fence_put(out_fence);
-	} else if (out_fence) {
-		dma_fence_put(out_fence);
+	} else if (out_fences) {
+put_out_fences:
+		put_out_fences(out_fences, num_batches);
 	}
 
 	args->flags &= ~__I915_EXEC_UNKNOWN_FLAGS;
@@ -3513,9 +3708,15 @@ end:;
 	if (out_fence_fd >= 0)
 		put_unused_fd(out_fence_fd);
 err_out_fence:
+	kfree(out_fences);
 	dma_fence_put(exec_fence);
 err_exec_fence:
 	dma_fence_put(in_fence);
+err_parent:
+	if (parent)
+		intel_context_put(parent);
+err_context:
+	i915_gem_context_put(ctx);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 35f5d28c7465..ab69ba9bb9aa 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -475,6 +475,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	ce->guc_id = GUC_INVALID_LRC_ID;
 	INIT_LIST_HEAD(&ce->guc_id_link);
 
+	mutex_init(&ce->parallel_submit);
+	ce->fence_context = dma_fence_context_alloc(1);
+
 	i915_sw_fence_init(&ce->guc_blocked, sw_fence_dummy_notify);
 	i915_sw_fence_commit(&ce->guc_blocked);
 
@@ -497,6 +500,8 @@ void intel_context_fini(struct intel_context *ce)
 		for_each_child_safe(ce, child, next)
 			intel_context_put(child);
 
+	mutex_destroy(&ce->parallel_submit);
+
 	mutex_destroy(&ce->pin_mutex);
 	i915_active_fini(&ce->active);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 4886e107c1f8..e5d4cc113358 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -235,6 +235,15 @@ struct intel_context {
 
 	/* Last request submitted on a parent */
 	struct i915_request *last_rq;
+
+	/* Parallel submission mutex */
+	struct mutex parallel_submit;
+
+	/* Fence context for parallel submission */
+	u64 fence_context;
+
+	/* Seqno for parallel submission */
+	u32 seqno;
 };
 
 #endif /* __INTEL_CONTEXT_TYPES__ */
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 5b9dce0f443b..e0d4d1162db5 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1238,9 +1238,11 @@ int __i915_vma_move_to_active(struct i915_vma *vma, struct i915_request *rq)
 	return i915_active_add_request(&vma->active, rq);
 }
 
-int i915_vma_move_to_active(struct i915_vma *vma,
-			    struct i915_request *rq,
-			    unsigned int flags)
+int _i915_vma_move_to_active(struct i915_vma *vma,
+			     struct i915_request *rq,
+			     unsigned int flags,
+			     struct dma_fence *shared_fence,
+			     struct dma_fence *excl_fence)
 {
 	struct drm_i915_gem_object *obj = vma->obj;
 	int err;
@@ -1261,7 +1263,7 @@ int i915_vma_move_to_active(struct i915_vma *vma,
 			intel_frontbuffer_put(front);
 		}
 
-		dma_resv_add_excl_fence(vma->resv, &rq->fence);
+		dma_resv_add_excl_fence(vma->resv, excl_fence);
 		obj->write_domain = I915_GEM_DOMAIN_RENDER;
 		obj->read_domains = 0;
 	} else {
@@ -1271,7 +1273,8 @@ int i915_vma_move_to_active(struct i915_vma *vma,
 				return err;
 		}
 
-		dma_resv_add_shared_fence(vma->resv, &rq->fence);
+		if (shared_fence)
+			dma_resv_add_shared_fence(vma->resv, shared_fence);
 		obj->write_domain = 0;
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index eca452a9851f..297587c9f303 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -57,9 +57,19 @@ static inline bool i915_vma_is_active(const struct i915_vma *vma)
 
 int __must_check __i915_vma_move_to_active(struct i915_vma *vma,
 					   struct i915_request *rq);
-int __must_check i915_vma_move_to_active(struct i915_vma *vma,
-					 struct i915_request *rq,
-					 unsigned int flags);
+
+int __must_check _i915_vma_move_to_active(struct i915_vma *vma,
+					  struct i915_request *rq,
+					  unsigned int flags,
+					  struct dma_fence *shared_fence,
+					  struct dma_fence *excl_fence);
+static inline int __must_check
+i915_vma_move_to_active(struct i915_vma *vma,
+			struct i915_request *rq,
+			unsigned int flags)
+{
+	return _i915_vma_move_to_active(vma, rq, flags, &rq->fence, &rq->fence);
+}
 
 #define __i915_vma_flags(v) ((unsigned long *)&(v)->flags.counter)
 
-- 
2.28.0

