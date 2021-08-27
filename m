Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 124CA3F9A21
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A606E94A;
	Fri, 27 Aug 2021 13:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496006E937;
 Fri, 27 Aug 2021 13:30:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="278971005"
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="278971005"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 06:30:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="528312583"
Received: from aleenaha-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.228.247])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 06:30:47 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [PATCH] drm/i915: Handle Intel igfx + Intel dgfx hybrid graphics setup
Date: Fri, 27 Aug 2021 14:30:39 +0100
Message-Id: <20210827133039.287075-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In short this makes i915 work for hybrid setups (DRI_PRIME=1 with Mesa)
when rendering is done on Intel dgfx and scanout/composition on Intel
igfx.

Before this patch the driver was not quite ready for that setup, mainly
because it was able to emit a semaphore wait between the two GPUs, which
results in deadlocks because semaphore target location in HWSP is neither
shared between the two, nor mapped in both GGTT spaces.

To fix it the patch adds an additional check to a couple of relevant code
paths in order to prevent using semaphores for inter-engine
synchronisation between different driver instances.

Patch also moves singly used i915_gem_object_last_write_engine to be
private in its only calling unit (debugfs), while modifying it to only
show activity belonging to the respective driver instance.

What remains in this problem space is the question of the GEM busy ioctl.
We have a somewhat ambigous comment there saying only status of native
fences will be reported, which could be interpreted as either i915, or
native to the drm fd. For now I have decided to leave that as is, meaning
any i915 instance activity continues to be reported.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 17 ----------------
 drivers/gpu/drm/i915/i915_debugfs.c        | 23 +++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_request.c        |  7 ++++++-
 drivers/gpu/drm/i915/i915_request.h        |  1 +
 4 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..3043fcbd31bd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -503,23 +503,6 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
 	i915_gem_object_unpin_pages(obj);
 }
 
-static inline struct intel_engine_cs *
-i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
-{
-	struct intel_engine_cs *engine = NULL;
-	struct dma_fence *fence;
-
-	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
-	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
-	return engine;
-}
-
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 					 unsigned int cache_level);
 void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 04351a851586..2f49ff0e8c21 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -135,6 +135,27 @@ static const char *stringify_vma_type(const struct i915_vma *vma)
 	return "ppgtt";
 }
 
+static struct intel_engine_cs *
+last_write_engine(struct drm_i915_private *i915,
+		  struct drm_i915_gem_object *obj)
+{
+	struct intel_engine_cs *engine = NULL;
+	struct dma_fence *fence;
+
+	rcu_read_lock();
+	fence = dma_resv_get_excl_unlocked(obj->base.resv);
+	rcu_read_unlock();
+
+	if (fence &&
+	    !dma_fence_is_signaled(fence) &&
+	    dma_fence_is_i915(fence) &&
+	    to_request(fence)->i915 == i915)
+		engine = to_request(fence)->engine;
+	dma_fence_put(fence);
+
+	return engine;
+}
+
 void
 i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 {
@@ -230,7 +251,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 	if (i915_gem_object_is_framebuffer(obj))
 		seq_printf(m, " (fb)");
 
-	engine = i915_gem_object_last_write_engine(obj);
+	engine = last_write_engine(dev_priv, obj);
 	if (engine)
 		seq_printf(m, " (%s)", engine->name);
 }
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..d2dec669d262 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -900,6 +900,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 	 * hold the intel_context reference. In execlist mode the request always
 	 * eventually points to a physical engine so this isn't an issue.
 	 */
+	rq->i915 = tl->gt->i915;
 	rq->context = intel_context_get(ce);
 	rq->engine = ce->engine;
 	rq->ring = ce->ring;
@@ -1160,6 +1161,9 @@ emit_semaphore_wait(struct i915_request *to,
 	const intel_engine_mask_t mask = READ_ONCE(from->engine)->mask;
 	struct i915_sw_fence *wait = &to->submit;
 
+	if (to->i915 != from->i915)
+		goto await_fence;
+
 	if (!intel_context_use_semaphores(to->context))
 		goto await_fence;
 
@@ -1263,7 +1267,8 @@ __i915_request_await_execution(struct i915_request *to,
 	 * immediate execution, and so we must wait until it reaches the
 	 * active slot.
 	 */
-	if (intel_engine_has_semaphores(to->engine) &&
+	if (to->i915 == from->i915 &&
+	    intel_engine_has_semaphores(to->engine) &&
 	    !i915_request_has_initial_breadcrumb(to)) {
 		err = __emit_semaphore_wait(to, from, from->fence.seqno - 1);
 		if (err < 0)
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 1bc1349ba3c2..61a2ad6f1f1c 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -163,6 +163,7 @@ enum {
  */
 struct i915_request {
 	struct dma_fence fence;
+	struct drm_i915_private *i915;
 	spinlock_t lock;
 
 	/**
-- 
2.30.2

