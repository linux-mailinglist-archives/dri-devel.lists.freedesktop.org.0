Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F21C3D9A06
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE496E314;
	Thu, 29 Jul 2021 00:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DD96E243;
 Thu, 29 Jul 2021 00:16:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="212500656"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="212500656"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 17:16:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="456666796"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 17:16:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/i915: Check if engine has heartbeat when closing a
 context
Date: Wed, 28 Jul 2021 17:34:00 -0700
Message-Id: <20210729003400.151864-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210729003400.151864-1-matthew.brost@intel.com>
References: <20210729003400.151864-1-matthew.brost@intel.com>
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

If an engine associated with a context does not have a heartbeat, ban it
immediately. This is needed for GuC submission as a idle pulse doesn't
kick the context off the hardware where it then can check for a
heartbeat and ban the context.

This patch also updates intel_engine_has_heartbeat to be a vfunc as we
now need to call this function on execlists virtual engines too.  

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
 drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
 drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++-----------------
 .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
 6 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 9c3672bac0e2..b8e01c5ba9e5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1090,8 +1090,9 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
 	 */
 	for_each_gem_engine(ce, engines, it) {
 		struct intel_engine_cs *engine;
+		bool local_ban = ban || !intel_engine_has_heartbeat(ce->engine);
 
-		if (ban && intel_context_ban(ce, NULL))
+		if (local_ban && intel_context_ban(ce, NULL))
 			continue;
 
 		/*
@@ -1104,7 +1105,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
 		engine = active_engine(ce);
 
 		/* First attempt to gracefully cancel the context */
-		if (engine && !__cancel_engine(engine) && ban)
+		if (engine && !__cancel_engine(engine) && local_ban)
 			/*
 			 * If we are unable to send a preemptive pulse to bump
 			 * the context from the GPU, we have to resort to a full
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index e54351a170e2..65f2eb2a78e4 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -55,6 +55,8 @@ struct intel_context_ops {
 	void (*reset)(struct intel_context *ce);
 	void (*destroy)(struct kref *kref);
 
+	bool (*has_heartbeat)(const struct intel_engine_cs *engine);
+
 	/* virtual engine/context interface */
 	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
 						unsigned int count);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index c2a5640ae055..1b11a808acc4 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -283,28 +283,11 @@ struct intel_context *
 intel_engine_create_virtual(struct intel_engine_cs **siblings,
 			    unsigned int count);
 
-static inline bool
-intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
-{
-	/*
-	 * For non-GuC submission we expect the back-end to look at the
-	 * heartbeat status of the actual physical engine that the work
-	 * has been (or is being) scheduled on, so we should only reach
-	 * here with GuC submission enabled.
-	 */
-	GEM_BUG_ON(!intel_engine_uses_guc(engine));
-
-	return intel_guc_virtual_engine_has_heartbeat(engine);
-}
-
 static inline bool
 intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
 {
-	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
-		return false;
-
-	if (intel_engine_is_virtual(engine))
-		return intel_virtual_engine_has_heartbeat(engine);
+	if (engine->cops->has_heartbeat)
+		return engine->cops->has_heartbeat(engine);
 	else
 		return READ_ONCE(engine->props.heartbeat_interval_ms);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index de5f9c86b9a4..18005b5546b6 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3619,6 +3619,18 @@ virtual_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
 	return ve->siblings[sibling];
 }
 
+static bool virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
+{
+	struct intel_engine_cs *engine;
+	intel_engine_mask_t tmp, mask = ve->mask;
+
+	for_each_engine_masked(engine, ve->gt, mask, tmp)
+		if (READ_ONCE(engine->props.heartbeat_interval_ms))
+			return true;
+
+	return false;
+}
+
 static const struct intel_context_ops virtual_context_ops = {
 	.flags = COPS_HAS_INFLIGHT,
 
@@ -3634,6 +3646,8 @@ static const struct intel_context_ops virtual_context_ops = {
 	.enter = virtual_context_enter,
 	.exit = virtual_context_exit,
 
+	.has_heartbeat = virtual_engine_has_heartbeat,
+
 	.destroy = virtual_context_destroy,
 
 	.get_sibling = virtual_get_sibling,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 89ff0e4b4bc7..ae70bff3605f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2168,6 +2168,8 @@ static int guc_virtual_context_alloc(struct intel_context *ce)
 	return lrc_alloc(ce, engine);
 }
 
+static bool guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
+
 static const struct intel_context_ops virtual_guc_context_ops = {
 	.alloc = guc_virtual_context_alloc,
 
@@ -2183,6 +2185,8 @@ static const struct intel_context_ops virtual_guc_context_ops = {
 	.enter = guc_virtual_context_enter,
 	.exit = guc_virtual_context_exit,
 
+	.has_heartbeat = guc_virtual_engine_has_heartbeat,
+
 	.sched_disable = guc_context_sched_disable,
 
 	.destroy = guc_context_destroy,
@@ -3029,7 +3033,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 	return ERR_PTR(err);
 }
 
-bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
+static bool guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
 {
 	struct intel_engine_cs *engine;
 	intel_engine_mask_t tmp, mask = ve->mask;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index c7ef44fa0c36..c2afc3b88fd8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -29,8 +29,6 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
 				    struct i915_request *hung_rq,
 				    struct drm_printer *m);
 
-bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
-
 int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
 				   atomic_t *wait_var,
 				   bool interruptible,
-- 
2.28.0

