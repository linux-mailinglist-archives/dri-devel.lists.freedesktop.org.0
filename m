Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2593D0310
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2D96E5A3;
	Tue, 20 Jul 2021 20:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25C46E532;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885381"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885381"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:18 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906102"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 42/42] drm/i915/execlists: Parallel submission support for
 execlists
Date: Tue, 20 Jul 2021 13:58:02 -0700
Message-Id: <20210720205802.39610-43-matthew.brost@intel.com>
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

A weak implmentation of parallel submission (multi-bb execbuf IOCTL) for
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
 drivers/gpu/drm/i915/gt/intel_context_types.h |   2 +
 .../drm/i915/gt/intel_execlists_submission.c  | 196 ++++++++++++++++++
 4 files changed, 204 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 23befe264f35..8b595ec006a7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -533,9 +533,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	struct intel_engine_cs **siblings = NULL;
 	intel_engine_mask_t prev_mask;
 
-	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
-		return -ENODEV;
-
 	if (get_user(slot, &ext->engine_index))
 		return -EFAULT;
 
@@ -545,6 +542,12 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
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
index ab69ba9bb9aa..5187a75d4e04 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -637,7 +637,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
 	 * Callers responsibility to validate that this function is used
 	 * correctly but we use GEM_BUG_ON here ensure that they do.
 	 */
-	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
 	GEM_BUG_ON(intel_context_is_pinned(parent));
 	GEM_BUG_ON(intel_context_is_child(parent));
 	GEM_BUG_ON(intel_context_is_pinned(child));
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index e5d4cc113358..f66f54820c93 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -116,6 +116,8 @@ struct intel_context {
 #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
 #define CONTEXT_NOPREEMPT		8
 #define CONTEXT_LRCA_DIRTY		9
+#define CONTEXT_PIN_TO_PARENT		10
+#define CONTEXT_PIN_CHILDREN		11
 
 	struct {
 		u64 timeout_us;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 87ce28320098..f25e0af8b184 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2551,6 +2551,201 @@ static void execlists_context_cancel_request(struct intel_context *ce,
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
+	__set_bit(CONTEXT_NOPREEMPT, &parent->flags);
+	for_each_child(parent, ce)
+		__set_bit(CONTEXT_NOPREEMPT, &ce->flags);
+
+	parent->ops = &parent_context_ops;
+	for_each_child(parent, ce)
+		ce->ops = &child_context_ops;
+
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
 
@@ -2569,6 +2764,7 @@ static const struct intel_context_ops execlists_context_ops = {
 	.reset = lrc_reset,
 	.destroy = lrc_destroy,
 
+	.create_parallel = execlists_create_parallel,
 	.create_virtual = execlists_create_virtual,
 };
 
-- 
2.28.0

