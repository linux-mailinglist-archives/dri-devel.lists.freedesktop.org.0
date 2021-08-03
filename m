Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431BA3DF798
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AE16E956;
	Tue,  3 Aug 2021 22:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0766E918;
 Tue,  3 Aug 2021 22:11:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="193393493"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="193393493"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512752"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 45/46] drm/i915/execlists: Weak parallel submission support
 for execlists
Date: Tue,  3 Aug 2021 15:29:42 -0700
Message-Id: <20210803222943.27686-46-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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
execlists. Basically doing as little as possible to support this
interface for execlists - basically just passing submit fences between
each request generated and virtual engines are not allowed. This is on
par with what is there for the existing (hopefully soon deprecated)
bonding interface.

As with the GuC implementation the pinning interface laying is broken.
This will get cleaned up once the pre_pin / post_unpin laying violations
get fixed. Rather than try to fix it here, just do what the GuC is doing
in the meantime.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   9 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |   1 -
 .../drm/i915/gt/intel_execlists_submission.c  | 201 +++++++++++++++++-
 3 files changed, 205 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ac886b82796d..b199d59bd2c4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -529,9 +529,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	struct intel_engine_cs **siblings = NULL;
 	intel_engine_mask_t prev_mask;
 
-	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
-		return -ENODEV;
-
 	if (get_user(slot, &ext->engine_index))
 		return -EFAULT;
 
@@ -541,6 +538,12 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
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
index 2c07f5f22c94..8e90a4a0b7b0 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -627,7 +627,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
 	 * Callers responsibility to validate that this function is used
 	 * correctly but we use GEM_BUG_ON here ensure that they do.
 	 */
-	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
 	GEM_BUG_ON(intel_context_is_pinned(parent));
 	GEM_BUG_ON(intel_context_is_child(parent));
 	GEM_BUG_ON(intel_context_is_pinned(child));
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 769480e026bb..5e0f4983de75 100644
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
@@ -2602,6 +2601,203 @@ static void execlists_context_cancel_request(struct intel_context *ce,
 				      current->comm);
 }
 
+static int execlists_parent_context_pre_pin(struct intel_context *ce,
+					    struct i915_gem_ww_ctx *ww)
+{
+	struct intel_context *child;
+	int err, i = 0, j = 0;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	for_each_child(ce, child) {
+		err = i915_active_acquire(&child->active);
+		if (unlikely(err))
+			goto unwind_active;
+		++i;
+	}
+
+	for_each_child(ce, child) {
+		err = __execlists_context_pre_pin(child, child->engine, ww);
+		if (unlikely(err))
+			goto unwind_pre_pin;
+		++j;
+	}
+
+	err = __execlists_context_pre_pin(ce, ce->engine, ww);
+	if (unlikely(err))
+		goto unwind_pre_pin;
+
+	return 0;
+
+unwind_pre_pin:
+	for_each_child(ce, child) {
+		if (!j--)
+			break;
+		lrc_post_unpin(child);
+	}
+
+unwind_active:
+	for_each_child(ce, child) {
+		if (!i--)
+			break;
+		i915_active_release(&child->active);
+	}
+
+	return err;
+}
+
+static void execlists_parent_context_post_unpin(struct intel_context *ce)
+{
+	struct intel_context *child;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	for_each_child(ce, child)
+		lrc_post_unpin(child);
+	lrc_post_unpin(ce);
+
+	for_each_child(ce, child) {
+		intel_context_get(child);
+		i915_active_release(&child->active);
+		intel_context_put(child);
+	}
+}
+
+static int execlists_parent_context_pin(struct intel_context *ce)
+{
+	int ret, i = 0, j = 0;
+	struct intel_context *child;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	for_each_child(ce, child) {
+		ret = lrc_pin(child, child->engine);
+		if (unlikely(ret))
+			goto unwind_pin;
+		++i;
+	}
+	ret = lrc_pin(ce, ce->engine);
+	if (unlikely(ret))
+		goto unwind_pin;
+
+	return 0;
+
+unwind_pin:
+	for_each_child(ce, child) {
+		if (++j > i)
+			break;
+		lrc_unpin(child);
+	}
+
+	return ret;
+}
+
+static void execlists_parent_context_unpin(struct intel_context *ce)
+{
+	struct intel_context *child;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	for_each_child(ce, child)
+		lrc_unpin(child);
+	lrc_unpin(ce);
+}
+
+static const struct intel_context_ops parent_context_ops = {
+	.flags = COPS_HAS_INFLIGHT,
+
+	.alloc = execlists_context_alloc,
+
+	.cancel_request = execlists_context_cancel_request,
+
+	.pre_pin = execlists_parent_context_pre_pin,
+	.pin = execlists_parent_context_pin,
+	.unpin = execlists_parent_context_unpin,
+	.post_unpin = execlists_parent_context_post_unpin,
+
+	.enter = intel_context_enter_engine,
+	.exit = intel_context_exit_engine,
+
+	.destroy = lrc_destroy,
+};
+
+static const struct intel_context_ops child_context_ops = {
+	.flags = COPS_HAS_INFLIGHT,
+
+	.alloc = execlists_context_alloc,
+
+	.cancel_request = execlists_context_cancel_request,
+
+	.enter = intel_context_enter_engine,
+	.exit = intel_context_exit_engine,
+
+	.destroy = lrc_destroy,
+};
+
+static struct intel_context *
+execlists_create_parallel(struct intel_engine_cs **engines,
+			  unsigned int num_siblings,
+			  unsigned int width)
+{
+	struct intel_engine_cs **siblings = NULL;
+	struct intel_context *parent = NULL, *ce, *err;
+	int i, j;
+	int ret;
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
+	intel_context_set_nopreempt(parent);
+	intel_context_set_single_submission(parent);
+	for_each_child(parent, ce) {
+		intel_context_set_nopreempt(ce);
+		intel_context_set_single_submission(ce);
+	}
+
+	parent->ops = &parent_context_ops;
+	for_each_child(parent, ce)
+		ce->ops = &child_context_ops;
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
 static const struct intel_context_ops execlists_context_ops = {
 	.flags = COPS_HAS_INFLIGHT,
 
@@ -2620,6 +2816,7 @@ static const struct intel_context_ops execlists_context_ops = {
 	.reset = lrc_reset,
 	.destroy = lrc_destroy,
 
+	.create_parallel = execlists_create_parallel,
 	.create_virtual = execlists_create_virtual,
 };
 
-- 
2.28.0

