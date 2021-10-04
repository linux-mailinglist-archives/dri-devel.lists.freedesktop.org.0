Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3034219C9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F556EAC0;
	Mon,  4 Oct 2021 22:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A80E89339;
 Mon,  4 Oct 2021 22:11:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="225498453"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="225498453"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:35 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735552"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 26/26] drm/i915/execlists: Weak parallel submission support
 for execlists
Date: Mon,  4 Oct 2021 15:06:37 -0700
Message-Id: <20211004220637.14746-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004220637.14746-1-matthew.brost@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
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

A weak implementation of parallel submission (multi-bb execbuf IOCTL) for
execlists. Doing as little as possible to support this interface for
execlists - basically just passing submit fences between each request
generated and virtual engines are not allowed. This is on par with what
is there for the existing (hopefully soon deprecated) bonding interface.

We perma-pin these execlists contexts to align with GuC implementation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 10 ++--
 drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
 .../drm/i915/gt/intel_execlists_submission.c  | 56 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  2 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
 5 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 605440388988..732111457dd2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -536,10 +536,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	struct intel_engine_cs **siblings = NULL;
 	intel_engine_mask_t prev_mask;
 
-	/* FIXME: This is NIY for execlists */
-	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
-		return -ENODEV;
-
 	if (get_user(slot, &ext->engine_index))
 		return -EFAULT;
 
@@ -549,6 +545,12 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	if (get_user(num_siblings, &ext->num_siblings))
 		return -EFAULT;
 
+	if (!intel_uc_uses_guc_submission(&i915->gt.uc) && num_siblings != 1) {
+		drm_dbg(&i915->drm, "Only 1 sibling (%d) supported in non-GuC mode\n",
+			num_siblings);
+		return -EINVAL;
+	}
+
 	if (slot >= set->num_engines) {
 		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
 			slot, set->num_engines);
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index ee84259959d0..3fc1c5155fd4 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -79,7 +79,8 @@ static int intel_context_active_acquire(struct intel_context *ce)
 
 	__i915_active_acquire(&ce->active);
 
-	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
+	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine) ||
+	    intel_context_is_parallel(ce))
 		return 0;
 
 	/* Preallocate tracking nodes */
@@ -562,7 +563,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
 	 * Callers responsibility to validate that this function is used
 	 * correctly but we use GEM_BUG_ON here ensure that they do.
 	 */
-	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
 	GEM_BUG_ON(intel_context_is_pinned(parent));
 	GEM_BUG_ON(intel_context_is_child(parent));
 	GEM_BUG_ON(intel_context_is_pinned(child));
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 8d7f571029df..a747fbbf18b5 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -927,8 +927,7 @@ static void execlists_submit_ports(struct intel_engine_cs *engine)
 
 static bool ctx_single_port_submission(const struct intel_context *ce)
 {
-	return (IS_ENABLED(CONFIG_DRM_I915_GVT) &&
-		intel_context_force_single_submission(ce));
+	return intel_context_force_single_submission(ce);
 }
 
 static bool can_merge_ctx(const struct intel_context *prev,
@@ -2598,6 +2597,58 @@ static void execlists_context_cancel_request(struct intel_context *ce,
 				      current->comm);
 }
 
+static struct intel_context *
+execlists_create_parallel(struct intel_engine_cs **engines,
+			  unsigned int num_siblings,
+			  unsigned int width)
+{
+	struct intel_engine_cs **siblings = NULL;
+	struct intel_context *parent = NULL, *ce, *err;
+	int i, j;
+
+	GEM_BUG_ON(num_siblings != 1);
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
+		ce = intel_context_create(siblings[0]);
+		if (!ce) {
+			err = ERR_PTR(-ENOMEM);
+			goto unwind;
+		}
+
+		if (i == 0)
+			parent = ce;
+		else
+			intel_context_bind_parent_child(parent, ce);
+	}
+
+	parent->parallel.fence_context = dma_fence_context_alloc(1);
+
+	intel_context_set_nopreempt(parent);
+	intel_context_set_single_submission(parent);
+	for_each_child(parent, ce) {
+		intel_context_set_nopreempt(ce);
+		intel_context_set_single_submission(ce);
+	}
+
+	kfree(siblings);
+	return parent;
+
+unwind:
+	if (parent)
+		intel_context_put(parent);
+	kfree(siblings);
+	return err;
+}
+
 static const struct intel_context_ops execlists_context_ops = {
 	.flags = COPS_HAS_INFLIGHT,
 
@@ -2616,6 +2667,7 @@ static const struct intel_context_ops execlists_context_ops = {
 	.reset = lrc_reset,
 	.destroy = lrc_destroy,
 
+	.create_parallel = execlists_create_parallel,
 	.create_virtual = execlists_create_virtual,
 };
 
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 57339d5c1fc8..8137d0aabf99 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1065,6 +1065,8 @@ lrc_pin(struct intel_context *ce,
 
 void lrc_unpin(struct intel_context *ce)
 {
+	if (unlikely(ce->parallel.last_rq))
+		i915_request_put(ce->parallel.last_rq);
 	check_redzone((void *)ce->lrc_reg_state - LRC_STATE_OFFSET,
 		      ce->engine);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 05e8b199e4ce..1f077024c4b8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2961,8 +2961,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
 	GEM_BUG_ON(!intel_context_is_parent(ce));
 	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
 
-	if (ce->parallel.last_rq)
-		i915_request_put(ce->parallel.last_rq);
 	unpin_guc_id(guc, ce);
 	lrc_unpin(ce);
 }
-- 
2.32.0

