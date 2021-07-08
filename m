Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F923BF2BC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 02:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47B66E213;
	Thu,  8 Jul 2021 00:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A606E209;
 Thu,  8 Jul 2021 00:12:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="231164550"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="231164550"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:12:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="411146618"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:12:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] INTEL_DII/NOT_UPSTREAM: drm/i915: Introduce set_parallel2
 extension
Date: Wed,  7 Jul 2021 17:30:18 -0700
Message-Id: <20210708003019.9213-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210708003019.9213-1-matthew.brost@intel.com>
References: <20210706222010.101522-1-matthew.brost@intel.com>
 <20210708003019.9213-1-matthew.brost@intel.com>
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
Cc: john.c.harrison@intel.com, Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on upstream feedback the set_parallel extension isn't suitable as
it looks a bit too much like the bonding extension. Introduce a
set_parallel2 extension which configures parallel submission in a single
extension and in a single slot. This compares to old set_parallel
extension which configured parallel submission across multiple slots.

Also remove the ability for the user to pass in the number of BBs in
the execbuf IOCTL. The number of BBs is now implied based on the width
of the context in the slot.

This patch is intended in enable UMDs for the upstream direction while
maintaining the old set_parallel extension to not break UMDs. Once UMDs
have been updated to use new extension the old one can be removed from
DII.

v2: Only enable parallel submission on engines set by user

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 190 +++++++++++++++++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 -
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  73 +++++--
 drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_context.h       |  11 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   4 +-
 drivers/gpu/drm/i915/i915_request.c           |   7 +-
 include/uapi/drm/i915_drm_prelim.h            | 115 +++++++++++
 9 files changed, 376 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 2e3c0bf09eff..c8da87dde1fa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -374,7 +374,6 @@ void i915_gem_context_release(struct kref *ref)
 	mutex_destroy(&ctx->engines_mutex);
 	mutex_destroy(&ctx->lut_mutex);
 	mutex_destroy(&ctx->mutex);
-	mutex_destroy(&ctx->parallel_submit);
 
 	kfree_rcu(ctx, rcu);
 }
@@ -699,8 +698,6 @@ __create_context(struct drm_i915_private *i915)
 	mutex_init(&ctx->mutex);
 	INIT_LIST_HEAD(&ctx->link);
 
-	mutex_init(&ctx->parallel_submit);
-
 	spin_lock_init(&ctx->stale.lock);
 	INIT_LIST_HEAD(&ctx->stale.engines);
 
@@ -1857,6 +1854,48 @@ static bool validate_parallel_engines_layout(const struct set_engines *set)
 	return true;
 }
 
+/*
+ * Engine must be same class and form a logically contiguous mask.
+ *
+ * FIXME: Logical mask check not 100% correct but good enough for the PoC
+ */
+static bool __validate_parallel_engines_layout(struct drm_i915_private *i915,
+					       struct intel_context *parent)
+{
+	u8 engine_class = parent->engine->class;
+	u8 num_siblings = hweight_long(parent->engine->logical_mask);
+	struct intel_context *child;
+	intel_engine_mask_t logical_mask = parent->engine->logical_mask;
+
+	for_each_child(parent, child) {
+		if (child->engine->class != engine_class) {
+			drm_dbg(&i915->drm, "Class mismatch: %u, %u",
+				engine_class, child->engine->class);
+			return false;
+		}
+		if (hweight_long(child->engine->logical_mask) != num_siblings) {
+			drm_dbg(&i915->drm, "Sibling mismatch: %u, %lu",
+				num_siblings,
+				hweight_long(child->engine->logical_mask));
+			return false;
+		}
+		if (logical_mask & child->engine->logical_mask) {
+			drm_dbg(&i915->drm, "Overlapping logical mask: 0x%04x, 0x%04x",
+				logical_mask, child->engine->logical_mask);
+			return false;
+		}
+		logical_mask |= child->engine->logical_mask;
+	}
+
+	if (!is_power_of_2((logical_mask >> (ffs(logical_mask) - 1)) + 1)) {
+		drm_dbg(&i915->drm, "Non-contiguous logical mask: 0x%04x",
+			logical_mask);
+		return false;
+	}
+
+	return true;
+}
+
 static int
 set_engines__parallel_submit(struct i915_user_extension __user *base, void *data)
 {
@@ -2009,11 +2048,156 @@ set_engines__parallel_submit(struct i915_user_extension __user *base, void *data
 	return err;
 }
 
+static int
+set_engines__parallel2_submit(struct i915_user_extension __user *base,
+			      void *data)
+{
+	struct prelim_drm_i915_context_engines_parallel2_submit __user *ext =
+		container_of_user(base, typeof(*ext), base);
+	const struct set_engines *set = data;
+	struct drm_i915_private *i915 = set->ctx->i915;
+	struct intel_context *parent, *child, *ce;
+	u64 flags;
+	int err = 0, n, i, j;
+	u16 slot, width, num_siblings;
+	struct intel_engine_cs **siblings = NULL;
+
+	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
+		return -ENODEV;
+
+	if (get_user(slot, &ext->engine_index))
+		return -EFAULT;
+
+	if (get_user(width, &ext->width))
+		return -EFAULT;
+
+	if (get_user(num_siblings, &ext->num_siblings))
+		return -EFAULT;
+
+	if (slot >= set->engines->num_engines) {
+		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
+			slot, set->engines->num_engines);
+		return -EINVAL;
+	}
+
+	parent = set->engines->engines[slot];
+	if (parent) {
+		drm_dbg(&i915->drm, "Context index[%d] not NULL\n", slot);
+		return -EINVAL;
+	}
+
+	if (get_user(flags, &ext->flags))
+		return -EFAULT;
+
+	if (flags) {
+		drm_dbg(&i915->drm, "Unknown flags 0x%02llx", flags);
+		return -EINVAL;
+	}
+
+	for (n = 0; n < ARRAY_SIZE(ext->mbz64); n++) {
+		err = check_user_mbz(&ext->mbz64[n]);
+		if (err)
+			return err;
+	}
+
+	if (width < 1) {
+		drm_dbg(&i915->drm, "Width (%d) < 1 \n", width);
+		return -EINVAL;
+	}
+
+	if (num_siblings < 1) {
+		drm_dbg(&i915->drm, "Number siblings (%d) < 1 \n",
+			num_siblings);
+		return -EINVAL;
+	}
+
+	siblings = kmalloc_array(num_siblings,
+				 sizeof(*siblings),
+				 GFP_KERNEL);
+	if (!siblings)
+		return -ENOMEM;
+
+	mutex_lock(&set->ctx->mutex);
+
+	/* Create contexts / engines */
+	for (i = 0; i < width; ++i) {
+		for (j = 0; j < num_siblings; ++j) {
+			struct i915_engine_class_instance ci;
+
+			if (copy_from_user(&ci, &ext->engines[i * num_siblings + j],
+					   sizeof(ci))) {
+				err = -EFAULT;
+				goto out_err;
+			}
+
+			siblings[j] = intel_engine_lookup_user(i915,
+							       ci.engine_class,
+							       ci.engine_instance);
+			if (!siblings[j]) {
+				drm_dbg(&i915->drm,
+					"Invalid sibling[%d]: { class:%d, inst:%d }\n",
+					n, ci.engine_class, ci.engine_instance);
+				err = -EINVAL;
+				goto out_err;
+			}
+		}
+
+		ce = intel_engine_create_virtual(siblings, num_siblings,
+						 FORCE_VIRTUAL);
+		if (IS_ERR(ce)) {
+			err = PTR_ERR(ce);
+			goto out_err;
+		}
+		intel_context_set_gem(ce, set->ctx);
+
+		if (i == 0) {
+			parent = ce;
+			__set_bit(CONTEXT_NO_PREEMPT_MID_BATCH, &ce->flags);
+		} else {
+			intel_context_bind_parent_child(parent, ce);
+			err = intel_context_alloc_state(ce);
+			if (err)
+				goto out_err;
+		}
+	}
+
+	if (!__validate_parallel_engines_layout(i915, parent)) {
+		drm_dbg(&i915->drm, "Invalidate parallel context layout");
+		err = -EINVAL;
+		goto out_err;
+	}
+
+	intel_guc_configure_parent_context(parent);
+	if (cmpxchg(&set->engines->engines[slot], NULL, parent)) {
+		err = -EEXIST;
+		goto out_err;
+	}
+
+	kfree(siblings);
+	mutex_unlock(&set->ctx->mutex);
+
+	return 0;
+
+out_err:
+	if (parent) {
+		for_each_child(parent, child)
+			intel_context_put(child);
+		intel_context_put(parent);
+		set->engines->engines[slot] = NULL;
+	}
+	kfree(siblings);
+	mutex_unlock(&set->ctx->mutex);
+
+	return err;
+}
+
 static const i915_user_extension_fn set_engines__extensions[] = {
 	[I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_engines__load_balance,
 	[I915_CONTEXT_ENGINES_EXT_BOND] = set_engines__bond,
 	[PRELIM_I915_USER_EXT_MASK(PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)] =
 		set_engines__parallel_submit,
+	[PRELIM_I915_USER_EXT_MASK(PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL2_SUBMIT)] =
+		set_engines__parallel2_submit,
 };
 
 static int
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 4f5785c7528b..0c79000e95fe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -194,12 +194,6 @@ struct i915_gem_context {
 	 */
 	u64 fence_context;
 
-	/**
-	 * @parallel_submit: Ensure only 1 parallel submission is happening on
-	 * this context at a time.
-	 */
-	struct mutex parallel_submit;
-
 	/**
 	 * @seqno: Seqno when using when a parallel context.
 	 */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index d3f70899e7ab..2253336e9791 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1633,7 +1633,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
 		goto err_unmap;
 
 	if (engine == eb->context->engine &&
-	    !i915_gem_context_is_parallel(eb->gem_context)) {
+	    !intel_context_is_parallel(eb->context)) {
 		rq = i915_request_create(eb->context);
 	} else {
 		struct intel_context *ce = eb->reloc_context;
@@ -1727,7 +1727,7 @@ static u32 *reloc_gpu(struct i915_execbuffer *eb,
 		struct intel_engine_cs *engine = eb->engine;
 
 		if (!reloc_can_use_engine(engine) ||
-		    i915_gem_context_is_parallel(eb->gem_context)) {
+		    intel_context_is_parallel(eb->context)) {
 			engine = engine->gt->engine_class[COPY_ENGINE_CLASS][0];
 			if (!engine)
 				return ERR_PTR(-ENODEV);
@@ -3223,7 +3223,7 @@ eb_select_legacy_ring(struct i915_execbuffer *eb)
 }
 
 static int
-eb_select_engine(struct i915_execbuffer *eb)
+eb_select_engine(struct i915_execbuffer *eb, unsigned int batch_number)
 {
 	struct intel_context *ce;
 	unsigned int idx;
@@ -3238,6 +3238,16 @@ eb_select_engine(struct i915_execbuffer *eb)
 	if (IS_ERR(ce))
 		return PTR_ERR(ce);
 
+	if (batch_number > 0 &&
+	    !i915_gem_context_is_parallel(eb->gem_context)) {
+		struct intel_context *parent = ce;
+		for_each_child(parent, ce)
+			if (!--batch_number)
+				break;
+		intel_context_put(parent);
+		intel_context_get(ce);
+	}
+
 	intel_gt_pm_get(ce->engine->gt);
 
 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
@@ -3562,7 +3572,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	if (unlikely(err))
 		goto err_destroy;
 
-	err = eb_select_engine(&eb);
+	err = eb_select_engine(&eb, batch_number);
 	if (unlikely(err))
 		goto err_context;
 
@@ -3751,6 +3761,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	const size_t count = args->buffer_count;
 	unsigned int num_batches, i;
 	int err, start_context;
+	bool is_parallel = false;
+	struct intel_context *parent = NULL;
 
 	if (!check_buffer_count(count)) {
 		drm_dbg(&i915->drm, "execbuf2 with %zd buffers\n", count);
@@ -3782,15 +3794,35 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			I915_EXEC_NUMBER_BB_LSB) +
 		       ((args->flags & PRELIM_I915_EXEC_NUMBER_BB_MASK) >>
 			PRELIM_I915_EXEC_NUMBER_BB_LSB)) + 1;
-	if (i915_gem_context_is_parallel(ctx)) {
-		if (num_batches > count ||
-		    start_context + num_batches > ctx->width) {
-			err = -EINVAL;
-			goto err_context;
+
+	if (i915_gem_context_user_engines(ctx)) {
+		parent = i915_gem_context_get_engine(ctx, start_context);
+		if (IS_ERR(parent)) {
+			i915_gem_context_put(ctx);
+			return PTR_ERR(parent);
 		}
 
-		if (i915_gem_context_is_bb_preempt_boundary(ctx) &&
-		    (start_context || num_batches != ctx->width)) {
+		is_parallel = i915_gem_context_is_parallel(ctx) ||
+			intel_context_is_parallel(parent);
+		if (i915_gem_context_is_parallel(ctx)) {
+			if (num_batches > count ||
+			    start_context + num_batches > ctx->width) {
+				err = -EINVAL;
+				goto err_context;
+			}
+
+			if (i915_gem_context_is_bb_preempt_boundary(ctx) &&
+			    (start_context || num_batches != ctx->width)) {
+				err = -EINVAL;
+				goto err_context;
+			}
+		} else if (intel_context_is_parallel(parent)) {
+			if (num_batches != 1)
+				return -EINVAL;
+			num_batches = parent->guc_number_children + 1;
+			if (num_batches > count)
+				return -EINVAL;
+		} else if(num_batches > 1) {
 			err = -EINVAL;
 			goto err_context;
 		}
@@ -3827,8 +3859,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	 * properly, also this is needed to create an excl fence for an dma buf
 	 * objects these BBs touch.
 	 */
-	if (args->flags & I915_EXEC_FENCE_OUT ||
-	    i915_gem_context_is_parallel(ctx)) {
+	if (args->flags & I915_EXEC_FENCE_OUT || is_parallel) {
 		out_fences = kcalloc(num_batches, sizeof(*out_fences),
 				     GFP_KERNEL);
 		if (!out_fences) {
@@ -3874,8 +3905,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	 * in intel_context sequence, thus only 1 submission can happen at a
 	 * time.
 	 */
-	if (i915_gem_context_is_parallel(ctx))
-		mutex_lock(&ctx->parallel_submit);
+	if (is_parallel)
+		mutex_lock(&parent->parallel_submit);
 
 	err = i915_gem_do_execbuffer(dev, file, args, exec2_list,
 				     args->flags & I915_EXEC_BATCH_FIRST ?
@@ -3889,8 +3920,10 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 				     &ww);
 
 	for (i = 1; err == 0 && i < num_batches; i++) {
-		args->flags &= ~I915_EXEC_RING_MASK;
-		args->flags |= start_context + i;
+		if (i915_gem_context_is_parallel(ctx)) {
+			args->flags &= ~I915_EXEC_RING_MASK;
+			args->flags |= start_context + i;
+		}
 		args->batch_len = 0;
 
 		err = i915_gem_do_execbuffer(dev, file, args, exec2_list,
@@ -3905,8 +3938,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 					     &ww);
 	}
 
-	if (i915_gem_context_is_parallel(ctx))
-		mutex_unlock(&ctx->parallel_submit);
+	if (is_parallel)
+		mutex_unlock(&parent->parallel_submit);
 
 	/*
 	 * Now that we have begun execution of the batchbuffer, we ignore
@@ -4009,6 +4042,8 @@ end:;
 	dma_fence_put(in_fence);
 err_context:
 	i915_gem_context_put(ctx);
+	if (parent)
+		intel_context_put(parent);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 84ce1f4d3051..2e45c128ee0b 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -460,6 +460,7 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	INIT_LIST_HEAD(&ce->signals);
 
 	mutex_init(&ce->pin_mutex);
+	mutex_init(&ce->parallel_submit);
 
 	spin_lock_init(&ce->guc_state.lock);
 	INIT_LIST_HEAD(&ce->guc_state.fences);
@@ -491,6 +492,7 @@ void intel_context_fini(struct intel_context *ce)
 			intel_context_put(child);
 
 	mutex_destroy(&ce->pin_mutex);
+	mutex_destroy(&ce->parallel_submit);
 	i915_active_fini(&ce->active);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index fc2da541d633..5ae6cc7374c8 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -52,6 +52,11 @@ static inline bool intel_context_is_parent(struct intel_context *ce)
 	return !!ce->guc_number_children;
 }
 
+static inline bool intel_context_is_parallel(struct intel_context *ce)
+{
+	return intel_context_is_child(ce) || intel_context_is_parent(ce);
+}
+
 /* Only should be called directly by selftests */
 void __intel_context_bind_parent_child(struct intel_context *parent,
 				       struct intel_context *child);
@@ -204,6 +209,12 @@ static inline bool intel_context_is_barrier(const struct intel_context *ce)
 	return test_bit(CONTEXT_BARRIER_BIT, &ce->flags);
 }
 
+static inline bool
+intel_context_is_no_preempt_mid_batch(const struct intel_context *ce)
+{
+	return test_bit(CONTEXT_NO_PREEMPT_MID_BATCH, &ce->flags);
+}
+
 static inline bool intel_context_is_closed(const struct intel_context *ce)
 {
 	return test_bit(CONTEXT_CLOSED_BIT, &ce->flags);
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 44bc13ee9f8b..74c23c34ee50 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -114,6 +114,7 @@ struct intel_context {
 #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
 #define CONTEXT_NOPREEMPT		8
 #define CONTEXT_LRCA_DIRTY		9
+#define CONTEXT_NO_PREEMPT_MID_BATCH	10
 
 	struct {
 		u64 timeout_us;
@@ -239,6 +240,9 @@ struct intel_context {
 
 	/* Last request submitted on a parent */
 	struct i915_request *last_rq;
+
+	/* Parallel submit mutex */
+	struct mutex parallel_submit;
 };
 
 #endif /* __INTEL_CONTEXT_TYPES__ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index c9e873f075a7..2b2c243ffd16 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -798,8 +798,7 @@ static inline int rq_prio(const struct i915_request *rq)
 
 static inline bool is_multi_lrc(struct intel_context *ce)
 {
-	return intel_context_is_child(ce) ||
-		intel_context_is_parent(ce);
+	return intel_context_is_parallel(ce);
 }
 
 static inline bool is_multi_lrc_rq(struct i915_request *rq)
@@ -3458,6 +3457,7 @@ void intel_guc_configure_parent_context(struct intel_context *ce)
 		bb_preempt_boundary =
 			i915_gem_context_is_bb_preempt_boundary(ctx);
 	rcu_read_unlock();
+	bb_preempt_boundary |= intel_context_is_no_preempt_mid_batch(ce);
 	if (bb_preempt_boundary) {
 		ce->emit_bb_start = emit_bb_start_parent_bb_preempt_boundary;
 		ce->emit_fini_breadcrumb =
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 092e9d892c30..76fa06f06947 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1606,14 +1606,9 @@ i915_request_await_object(struct i915_request *to,
 	return ret;
 }
 
-static inline bool is_parallel(struct intel_context *ce)
-{
-	return intel_context_is_child(ce) || intel_context_is_parent(ce);
-}
-
 static inline bool is_parallel_rq(struct i915_request *rq)
 {
-	return is_parallel(rq->context);
+	return intel_context_is_parallel(rq->context);
 }
 
 static inline struct intel_context *request_to_parent(struct i915_request *rq)
diff --git a/include/uapi/drm/i915_drm_prelim.h b/include/uapi/drm/i915_drm_prelim.h
index a885c14585aa..6d5d7eb54813 100644
--- a/include/uapi/drm/i915_drm_prelim.h
+++ b/include/uapi/drm/i915_drm_prelim.h
@@ -370,9 +370,124 @@ struct prelim_i915_context_engines_parallel_submit {
 } __attribute__ ((packed));
 #define i915_context_engines_parallel_submit prelim_i915_context_engines_parallel_submit
 
+/**
+ * struct prelim_drm_i915_context_engines_parallel2_submit - Configure engine
+ * for parallel submission.
+ *
+ * Setup a slot in the context engine map to allow multiple BBs to be submitted
+ * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
+ * in parallel. Multiple hardware contexts are created internally in the i915
+ * run these BBs. Once a slot is configured for N BBs only N BBs can be
+ * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
+ * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL knows how
+ * many BBs there are based on the slot's configuration. The N BBs are the last
+ * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
+ *
+ * The default placement behavior is to create implicit bonds between each
+ * context if each context maps to more than 1 physical engine (e.g. context is
+ * a virtual engine). Also we only allow contexts of same engine class and these
+ * contexts must be in logically contiguous order. Examples of the placement
+ * behavior described below. Lastly, the default is to not allow BBs to
+ * preempted mid BB rather insert coordinated preemption on all hardware
+ * contexts between each set of BBs. Flags may be added in the future to change
+ * both of these default behaviors.
+ *
+ * Returns -EINVAL if hardware context placement configuration is invalid or if
+ * the placement configuration isn't supported on the platform / submission
+ * interface.
+ * Returns -ENODEV if extension isn't supported on the platform / submission
+ * inteface.
+ *
+ * .. code-block::
+ *
+ *	Example 1 pseudo code:
+ *	CS[X] = generic engine of same class, logical instance X
+ *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
+ *	set_engines(INVALID)
+ *	set_parallel(engine_index=0, width=2, num_siblings=1,
+ *		     engines=CS[0],CS[1])
+ *
+ *	Results in the following valid placement:
+ *	CS[0], CS[1]
+ *
+ *	Example 2 pseudo code:
+ *	CS[X] = generic engine of same class, logical instance X
+ *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
+ *	set_engines(INVALID)
+ *	set_parallel(engine_index=0, width=2, num_siblings=2,
+ *		     engines=CS[0],CS[2],CS[1],CS[3])
+ *
+ *	Results in the following valid placements:
+ *	CS[0], CS[1]
+ *	CS[2], CS[3]
+ *
+ *	This can also be thought of as 2 virtual engines described by 2-D array
+ *	in the engines the field with bonds placed between each index of the
+ *	virtual engines. e.g. CS[0] is bonded to CS[1], CS[2] is bonded to
+ *	CS[3].
+ *	VE[0] = CS[0], CS[2]
+ *	VE[1] = CS[1], CS[3]
+ *
+ *	Example 3 pseudo code:
+ *	CS[X] = generic engine of same class, logical instance X
+ *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
+ *	set_engines(INVALID)
+ *	set_parallel(engine_index=0, width=2, num_siblings=2,
+ *		     engines=CS[0],CS[1],CS[1],CS[3])
+ *
+ *	Results in the following valid and invalid placements:
+ *	CS[0], CS[1]
+ *	CS[1], CS[3] - Not logical contiguous, return -EINVAL
+ */
+struct prelim_drm_i915_context_engines_parallel2_submit {
+	/**
+	 * @base: base user extension.
+	 */
+	struct i915_user_extension base;
+
+	/**
+	 * @engine_index: slot for parallel engine
+	 */
+	__u16 engine_index;
+
+	/**
+	 * @width: number of contexts per parallel engine
+	 */
+	__u16 width;
+
+	/**
+	 * @num_siblings: number of siblings per context
+	 */
+	__u16 num_siblings;
+
+	/**
+	 * @mbz16: reserved for future use; must be zero
+	 */
+	__u16 mbz16;
+
+	/**
+	 * @flags: all undefined flags must be zero, currently not defined flags
+	 */
+	__u64 flags;
+
+	/**
+	 * @mbz64: reserved for future use; must be zero
+	 */
+	__u64 mbz64[3];
+
+	/**
+	 * @engines: 2-d array of engine instances to configure parallel engine
+	 *
+	 * length = width (i) * num_siblings (j)
+	 * index = j + i * num_siblings
+	 */
+	struct i915_engine_class_instance engines[0];
+} __attribute__ ((packed));
+
 struct prelim_i915_context_param_engines {
 #define PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT (PRELIM_I915_USER_EXT | 2) /* see prelim_i915_context_engines_parallel_submit */
 #define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
+#define PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL2_SUBMIT (PRELIM_I915_USER_EXT | 3) /* see prelim_i915_context_engines_parallel2_submit */
 };
 
 enum prelim_drm_i915_gem_memory_class {
