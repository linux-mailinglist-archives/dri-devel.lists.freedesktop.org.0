Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2AB3D02FD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A528F6E58A;
	Tue, 20 Jul 2021 20:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189D26E520;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885375"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885375"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906086"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 27/42] drm/i915: Connect UAPI to GuC multi-lrc interface
Date: Tue, 20 Jul 2021 13:57:47 -0700
Message-Id: <20210720205802.39610-28-matthew.brost@intel.com>
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

Introduce 'set parallel submit' extension to connect UAPI to GuC
multi-lrc interface. Kernel doc in new uAPI should explain it all.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 157 +++++++++++++++++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |   8 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |  12 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   6 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  12 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 111 +++++++++++--
 include/uapi/drm/i915_drm.h                   | 118 +++++++++++++
 9 files changed, 407 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index d87a4c6da5bc..805fbcde03ea 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -519,9 +519,149 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
 	return 0;
 }
 
+static int
+set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
+				      void *data)
+{
+	struct i915_context_engines_parallel_submit __user *ext =
+		container_of_user(base, typeof(*ext), base);
+	const struct set_proto_ctx_engines *set = data;
+	struct drm_i915_private *i915 = set->i915;
+	u64 flags;
+	int err = 0, n, i, j;
+	u16 slot, width, num_siblings;
+	struct intel_engine_cs **siblings = NULL;
+	intel_engine_mask_t prev_mask;
+
+	/* Disabling for now */
+	return -ENODEV;
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
+	if (slot >= set->num_engines) {
+		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
+			slot, set->num_engines);
+		return -EINVAL;
+	}
+
+	if (set->engines[slot].type != I915_GEM_ENGINE_TYPE_INVALID) {
+		drm_dbg(&i915->drm,
+			"Invalid placement[%d], already occupied\n", slot);
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
+	if (width < 2) {
+		drm_dbg(&i915->drm, "Width (%d) < 2 \n", width);
+		return -EINVAL;
+	}
+
+	if (num_siblings < 1) {
+		drm_dbg(&i915->drm, "Number siblings (%d) < 1 \n",
+			num_siblings);
+		return -EINVAL;
+	}
+
+	siblings = kmalloc_array(num_siblings * width,
+				 sizeof(*siblings),
+				 GFP_KERNEL);
+	if (!siblings)
+		return -ENOMEM;
+
+	/* Create contexts / engines */
+	for (i = 0; i < width; ++i) {
+		intel_engine_mask_t current_mask = 0;
+		struct i915_engine_class_instance prev_engine;
+
+		for (j = 0; j < num_siblings; ++j) {
+			struct i915_engine_class_instance ci;
+			n = i * num_siblings + j;
+
+			if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
+				err = -EFAULT;
+				goto out_err;
+			}
+
+			siblings[n] =
+				intel_engine_lookup_user(i915, ci.engine_class,
+							 ci.engine_instance);
+			if (!siblings[n]) {
+				drm_dbg(&i915->drm,
+					"Invalid sibling[%d]: { class:%d, inst:%d }\n",
+					n, ci.engine_class, ci.engine_instance);
+				err = -EINVAL;
+				goto out_err;
+			}
+
+			if (n) {
+				if (prev_engine.engine_class !=
+				    ci.engine_class) {
+					drm_dbg(&i915->drm,
+						"Mismatched class %d, %d\n",
+						prev_engine.engine_class,
+						ci.engine_class);
+					err = -EINVAL;
+					goto out_err;
+				}
+			}
+
+			prev_engine = ci;
+			current_mask |= siblings[n]->logical_mask;
+		}
+
+		if (i > 0) {
+			if (current_mask != prev_mask << 1) {
+				drm_dbg(&i915->drm,
+					"Non contiguous logical mask 0x%x, 0x%x\n",
+					prev_mask, current_mask);
+				err = -EINVAL;
+				goto out_err;
+			}
+		}
+		prev_mask = current_mask;
+	}
+
+	set->engines[slot].type = I915_GEM_ENGINE_TYPE_PARALLEL;
+	set->engines[slot].num_siblings = num_siblings;
+	set->engines[slot].width = width;
+	set->engines[slot].siblings = siblings;
+
+	return 0;
+
+out_err:
+	kfree(siblings);
+
+	return err;
+}
+
 static const i915_user_extension_fn set_proto_ctx_engines_extensions[] = {
 	[I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_proto_ctx_engines_balance,
 	[I915_CONTEXT_ENGINES_EXT_BOND] = set_proto_ctx_engines_bond,
+	[I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT] =
+		set_proto_ctx_engines_parallel_submit,
 };
 
 static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
@@ -942,7 +1082,7 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 
 	e = alloc_engines(num_engines);
 	for (n = 0; n < num_engines; n++) {
-		struct intel_context *ce;
+		struct intel_context *ce, *child;
 		int ret;
 
 		switch (pe[n].type) {
@@ -952,7 +1092,13 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 
 		case I915_GEM_ENGINE_TYPE_BALANCED:
 			ce = intel_engine_create_virtual(pe[n].siblings,
-							 pe[n].num_siblings);
+							 pe[n].num_siblings, 0);
+			break;
+
+		case I915_GEM_ENGINE_TYPE_PARALLEL:
+			ce = intel_engine_create_parallel(pe[n].siblings,
+							  pe[n].num_siblings,
+							  pe[n].width);
 			break;
 
 		case I915_GEM_ENGINE_TYPE_INVALID:
@@ -973,6 +1119,13 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 			err = ERR_PTR(ret);
 			goto free_engines;
 		}
+		for_each_child(ce, child) {
+			ret = intel_context_set_gem(child, ctx, pe->sseu);
+			if (ret) {
+				err = ERR_PTR(ret);
+				goto free_engines;
+			}
+		}
 	}
 	e->num_engines = num_engines;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 94c03a97cb77..7b096d83bca1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -78,6 +78,9 @@ enum i915_gem_engine_type {
 
 	/** @I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set */
 	I915_GEM_ENGINE_TYPE_BALANCED,
+
+	/** @I915_GEM_ENGINE_TYPE_PARALLEL: A parallel engine set */
+	I915_GEM_ENGINE_TYPE_PARALLEL,
 };
 
 /**
@@ -108,6 +111,9 @@ struct i915_gem_proto_engine {
 	/** @num_siblings: Number of balanced siblings */
 	unsigned int num_siblings;
 
+	/** @width: Width of each sibling */
+	unsigned int width;
+
 	/** @siblings: Balanced siblings */
 	struct intel_engine_cs **siblings;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 5f165851e0df..5912eb291bad 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -55,9 +55,13 @@ struct intel_context_ops {
 	void (*reset)(struct intel_context *ce);
 	void (*destroy)(struct kref *kref);
 
-	/* virtual engine/context interface */
+	/* virtual/parallel engine/context interface */
 	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
-						unsigned int count);
+						unsigned int count,
+						unsigned long flags);
+	struct intel_context *(*create_parallel)(struct intel_engine_cs **engines,
+						 unsigned int num_siblings,
+						 unsigned int width);
 	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
 					       unsigned int sibling);
 };
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 04ce7a3e1d82..38e8b9c2567e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -279,9 +279,19 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
 	return intel_engine_has_preemption(engine);
 }
 
+#define FORCE_VIRTUAL	BIT(0)
 struct intel_context *
 intel_engine_create_virtual(struct intel_engine_cs **siblings,
-			    unsigned int count);
+			    unsigned int count, unsigned long flags);
+
+static inline struct intel_context *
+intel_engine_create_parallel(struct intel_engine_cs **engines,
+			     unsigned int num_engines,
+			     unsigned int width)
+{
+	GEM_BUG_ON(!engines[0]->cops->create_parallel);
+	return engines[0]->cops->create_parallel(engines, num_engines, width);
+}
 
 static inline bool
 intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 1ce112fefcf5..bbc5df0ce534 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1866,16 +1866,16 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
 
 struct intel_context *
 intel_engine_create_virtual(struct intel_engine_cs **siblings,
-			    unsigned int count)
+			    unsigned int count, unsigned long flags)
 {
 	if (count == 0)
 		return ERR_PTR(-EINVAL);
 
-	if (count == 1)
+	if (count == 1 && !(flags & FORCE_VIRTUAL))
 		return intel_context_create(siblings[0]);
 
 	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
-	return siblings[0]->cops->create_virtual(siblings, count);
+	return siblings[0]->cops->create_virtual(siblings, count, flags);
 }
 
 struct i915_request *
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index f278744fd4d0..87ce28320098 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -195,7 +195,8 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
 }
 
 static struct intel_context *
-execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
+execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
+			 unsigned long flags);
 
 static struct i915_request *
 __active_request(const struct intel_timeline * const tl,
@@ -3729,7 +3730,8 @@ static void virtual_submit_request(struct i915_request *rq)
 }
 
 static struct intel_context *
-execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
+execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
+			 unsigned long flags)
 {
 	struct virtual_engine *ve;
 	unsigned int n;
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 59cf8afc6d6f..5c1b01032753 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -3727,7 +3727,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
 	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
 
 	for (n = 0; n < nctx; n++) {
-		ve[n] = intel_engine_create_virtual(siblings, nsibling);
+		ve[n] = intel_engine_create_virtual(siblings, nsibling, 0);
 		if (IS_ERR(ve[n])) {
 			err = PTR_ERR(ve[n]);
 			nctx = n;
@@ -3923,7 +3923,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
 	 * restrict it to our desired engine within the virtual engine.
 	 */
 
-	ve = intel_engine_create_virtual(siblings, nsibling);
+	ve = intel_engine_create_virtual(siblings, nsibling, 0);
 	if (IS_ERR(ve)) {
 		err = PTR_ERR(ve);
 		goto out_close;
@@ -4054,7 +4054,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
 		i915_request_add(rq);
 	}
 
-	ce = intel_engine_create_virtual(siblings, nsibling);
+	ce = intel_engine_create_virtual(siblings, nsibling, 0);
 	if (IS_ERR(ce)) {
 		err = PTR_ERR(ce);
 		goto out;
@@ -4106,7 +4106,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
 
 	/* XXX We do not handle oversubscription and fairness with normal rq */
 	for (n = 0; n < nsibling; n++) {
-		ce = intel_engine_create_virtual(siblings, nsibling);
+		ce = intel_engine_create_virtual(siblings, nsibling, 0);
 		if (IS_ERR(ce)) {
 			err = PTR_ERR(ce);
 			goto out;
@@ -4208,7 +4208,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
 	if (err)
 		goto out_scratch;
 
-	ve = intel_engine_create_virtual(siblings, nsibling);
+	ve = intel_engine_create_virtual(siblings, nsibling, 0);
 	if (IS_ERR(ve)) {
 		err = PTR_ERR(ve);
 		goto out_scratch;
@@ -4348,7 +4348,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
 	if (igt_spinner_init(&spin, gt))
 		return -ENOMEM;
 
-	ve = intel_engine_create_virtual(siblings, nsibling);
+	ve = intel_engine_create_virtual(siblings, nsibling, 0);
 	if (IS_ERR(ve)) {
 		err = PTR_ERR(ve);
 		goto out_spin;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 81a5439de924..326cb4fc8a9d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -82,7 +82,8 @@
  */
 
 static struct intel_context *
-guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
+guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
+		   unsigned long flags);
 
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
@@ -2494,8 +2495,6 @@ static void guc_context_post_unpin(struct intel_context *ce)
 	__guc_context_post_unpin(ce);
 }
 
-/* Future patches will use this function */
-__attribute__ ((unused))
 static int guc_parent_context_pre_pin(struct intel_context *ce,
 				      struct i915_gem_ww_ctx *ww)
 {
@@ -2539,8 +2538,6 @@ static int guc_parent_context_pre_pin(struct intel_context *ce,
 	return err;
 }
 
-/* Future patches will use this function */
-__attribute__ ((unused))
 static void guc_parent_context_post_unpin(struct intel_context *ce)
 {
 	struct intel_context *child;
@@ -2556,8 +2553,6 @@ static void guc_parent_context_post_unpin(struct intel_context *ce)
 	}
 }
 
-/* Future patches will use this function */
-__attribute__ ((unused))
 static int guc_parent_context_pin(struct intel_context *ce)
 {
 	int ret, i = 0, j = 0;
@@ -2603,8 +2598,6 @@ static int guc_parent_context_pin(struct intel_context *ce)
 	return ret;
 }
 
-/* Future patches will use this function */
-__attribute__ ((unused))
 static void guc_parent_context_unpin(struct intel_context *ce)
 {
 	struct intel_context *child;
@@ -3017,8 +3010,6 @@ static void destroy_worker_func(struct work_struct *w)
 		intel_gt_pm_unpark_work_add(gt, destroy_worker);
 }
 
-/* Future patches will use this function */
-__attribute__ ((unused))
 static void guc_child_context_destroy(struct kref *kref)
 {
 	__guc_context_destroy(container_of(kref, struct intel_context, ref));
@@ -3236,6 +3227,11 @@ static void remove_from_context(struct i915_request *rq)
 	i915_request_notify_execute_cb_imm(rq);
 }
 
+static struct intel_context *
+guc_create_parallel(struct intel_engine_cs **engines,
+		    unsigned int num_siblings,
+		    unsigned int width);
+
 static const struct intel_context_ops guc_context_ops = {
 	.alloc = guc_context_alloc,
 
@@ -3257,6 +3253,7 @@ static const struct intel_context_ops guc_context_ops = {
 	.destroy = guc_context_destroy,
 
 	.create_virtual = guc_create_virtual,
+	.create_parallel = guc_create_parallel,
 };
 
 static void __guc_signal_context_fence(struct intel_context *ce)
@@ -3745,6 +3742,91 @@ static void guc_retire_inflight_request_prio(struct i915_request *rq)
 	spin_unlock(&ce->guc_active.lock);
 }
 
+static const struct intel_context_ops virtual_parent_context_ops = {
+	.alloc = guc_virtual_context_alloc,
+
+	.pre_pin = guc_parent_context_pre_pin,
+	.pin = guc_parent_context_pin,
+	.unpin = guc_parent_context_unpin,
+	.post_unpin = guc_parent_context_post_unpin,
+
+	.ban = guc_context_ban,
+
+	.enter = guc_virtual_context_enter,
+	.exit = guc_virtual_context_exit,
+
+	.sched_disable = guc_context_sched_disable,
+
+	.destroy = guc_context_destroy,
+
+	.get_sibling = guc_virtual_get_sibling,
+};
+
+static const struct intel_context_ops virtual_child_context_ops = {
+	.alloc = guc_virtual_context_alloc,
+
+	.enter = guc_virtual_context_enter,
+	.exit = guc_virtual_context_exit,
+
+	.destroy = guc_child_context_destroy,
+};
+
+static struct intel_context *
+guc_create_parallel(struct intel_engine_cs **engines,
+		    unsigned int num_siblings,
+		    unsigned int width)
+{
+	struct intel_engine_cs **siblings = NULL;
+	struct intel_context *parent = NULL, *ce, *err;
+	int i, j;
+	int ret;
+
+	siblings = kmalloc_array(num_siblings,
+				 sizeof(*siblings),
+				 GFP_KERNEL);
+	if (!siblings)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < width; ++i) {
+		for (j = 0; j < num_siblings; ++j)
+			siblings[j] = engines[i * num_siblings + j];
+
+		ce = intel_engine_create_virtual(siblings, num_siblings,
+						 FORCE_VIRTUAL);
+		if (!ce) {
+			err = ERR_PTR(-ENOMEM);
+			goto unwind;
+		}
+
+		if (i == 0) {
+			parent = ce;
+		} else {
+			intel_context_bind_parent_child(parent, ce);
+			ret = intel_context_alloc_state(ce);
+			if (ret) {
+				err = ERR_PTR(ret);
+				goto unwind;
+			}
+		}
+	}
+
+	parent->ops = &virtual_parent_context_ops;
+	for_each_child(parent, ce)
+		ce->ops = &virtual_child_context_ops;
+
+	kfree(siblings);
+	return parent;
+
+unwind:
+	if (parent) {
+		for_each_child(parent, ce)
+			intel_context_put(ce);
+		intel_context_put(parent);
+	}
+	kfree(siblings);
+	return err;
+}
+
 static void sanitize_hwsp(struct intel_engine_cs *engine)
 {
 	struct intel_timeline *tl;
@@ -4540,7 +4622,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 }
 
 static struct intel_context *
-guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
+guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
+		   unsigned long flags)
 {
 	struct guc_virtual_engine *ve;
 	struct intel_guc *guc;
@@ -4553,7 +4636,9 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 		return ERR_PTR(-ENOMEM);
 
 	guc = &siblings[0]->gt->uc.guc;
-	sched_engine = guc_to_sched_engine(guc, GUC_SUBMIT_ENGINE_SINGLE_LRC);
+	sched_engine = guc_to_sched_engine(guc, (flags & FORCE_VIRTUAL) ?
+					   GUC_SUBMIT_ENGINE_MULTI_LRC :
+					   GUC_SUBMIT_ENGINE_SINGLE_LRC);
 
 	ve->base.i915 = siblings[0]->i915;
 	ve->base.gt = siblings[0]->gt;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index b617f98598f8..162a4f340d3b 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1777,6 +1777,7 @@ struct drm_i915_gem_context_param {
  * Extensions:
  *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE)
  *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
+ *   i915_context_engines_parallel_submit (I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)
  */
 #define I915_CONTEXT_PARAM_ENGINES	0xa
 
@@ -2002,6 +2003,122 @@ struct i915_context_engines_bond {
 	struct i915_engine_class_instance engines[N__]; \
 } __attribute__((packed)) name__
 
+/**
+ * struct i915_context_engines_parallel_submit - Configure engine for
+ * parallel submission.
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
+ * interface.
+ *
+ * .. code-block:: none
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
+struct i915_context_engines_parallel_submit {
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
+
+} __packed;
+
+
 /**
  * DOC: Context Engine Map uAPI
  *
@@ -2061,6 +2178,7 @@ struct i915_context_param_engines {
 	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
 #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
 #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
+#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
 	struct i915_engine_class_instance engines[0];
 } __attribute__((packed));
 
-- 
2.28.0

