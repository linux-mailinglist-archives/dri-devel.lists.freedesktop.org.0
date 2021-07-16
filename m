Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A53E3CBD51
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EB76EA40;
	Fri, 16 Jul 2021 19:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F116E9EC;
 Fri, 16 Jul 2021 19:59:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596734"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596734"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238977"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/51] drm/i915: Reset GPU immediately if submission is
 disabled
Date: Fri, 16 Jul 2021 13:17:00 -0700
Message-Id: <20210716201724.54804-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If submission is disabled by the backend for any reason, reset the GPU
immediately in the heartbeat code as the backend can't be reenabled
until the GPU is reset.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 63 +++++++++++++++----
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |  4 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  9 +++
 drivers/gpu/drm/i915/i915_scheduler.c         |  6 ++
 drivers/gpu/drm/i915/i915_scheduler.h         |  6 ++
 drivers/gpu/drm/i915/i915_scheduler_types.h   |  5 ++
 6 files changed, 80 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index b6a305e6a974..a8495364d906 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -70,12 +70,30 @@ static void show_heartbeat(const struct i915_request *rq,
 {
 	struct drm_printer p = drm_debug_printer("heartbeat");
 
-	intel_engine_dump(engine, &p,
-			  "%s heartbeat {seqno:%llx:%lld, prio:%d} not ticking\n",
-			  engine->name,
-			  rq->fence.context,
-			  rq->fence.seqno,
-			  rq->sched.attr.priority);
+	if (!rq) {
+		intel_engine_dump(engine, &p,
+				  "%s heartbeat not ticking\n",
+				  engine->name);
+	} else {
+		intel_engine_dump(engine, &p,
+				  "%s heartbeat {seqno:%llx:%lld, prio:%d} not ticking\n",
+				  engine->name,
+				  rq->fence.context,
+				  rq->fence.seqno,
+				  rq->sched.attr.priority);
+	}
+}
+
+static void
+reset_engine(struct intel_engine_cs *engine, struct i915_request *rq)
+{
+	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
+		show_heartbeat(rq, engine);
+
+	intel_gt_handle_error(engine->gt, engine->mask,
+			      I915_ERROR_CAPTURE,
+			      "stopped heartbeat on %s",
+			      engine->name);
 }
 
 static void heartbeat(struct work_struct *wrk)
@@ -102,6 +120,11 @@ static void heartbeat(struct work_struct *wrk)
 	if (intel_gt_is_wedged(engine->gt))
 		goto out;
 
+	if (i915_sched_engine_disabled(engine->sched_engine)) {
+		reset_engine(engine, engine->heartbeat.systole);
+		goto out;
+	}
+
 	if (engine->heartbeat.systole) {
 		long delay = READ_ONCE(engine->props.heartbeat_interval_ms);
 
@@ -139,13 +162,7 @@ static void heartbeat(struct work_struct *wrk)
 			engine->sched_engine->schedule(rq, &attr);
 			local_bh_enable();
 		} else {
-			if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
-				show_heartbeat(rq, engine);
-
-			intel_gt_handle_error(engine->gt, engine->mask,
-					      I915_ERROR_CAPTURE,
-					      "stopped heartbeat on %s",
-					      engine->name);
+			reset_engine(engine, rq);
 		}
 
 		rq->emitted_jiffies = jiffies;
@@ -194,6 +211,26 @@ void intel_engine_park_heartbeat(struct intel_engine_cs *engine)
 		i915_request_put(fetch_and_zero(&engine->heartbeat.systole));
 }
 
+void intel_gt_unpark_heartbeats(struct intel_gt *gt)
+{
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	for_each_engine(engine, gt, id)
+		if (intel_engine_pm_is_awake(engine))
+			intel_engine_unpark_heartbeat(engine);
+
+}
+
+void intel_gt_park_heartbeats(struct intel_gt *gt)
+{
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	for_each_engine(engine, gt, id)
+		intel_engine_park_heartbeat(engine);
+}
+
 void intel_engine_init_heartbeat(struct intel_engine_cs *engine)
 {
 	INIT_DELAYED_WORK(&engine->heartbeat.work, heartbeat);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
index a488ea3e84a3..5da6d809a87a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
@@ -7,6 +7,7 @@
 #define INTEL_ENGINE_HEARTBEAT_H
 
 struct intel_engine_cs;
+struct intel_gt;
 
 void intel_engine_init_heartbeat(struct intel_engine_cs *engine);
 
@@ -16,6 +17,9 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
 void intel_engine_park_heartbeat(struct intel_engine_cs *engine);
 void intel_engine_unpark_heartbeat(struct intel_engine_cs *engine);
 
+void intel_gt_park_heartbeats(struct intel_gt *gt);
+void intel_gt_unpark_heartbeats(struct intel_gt *gt);
+
 int intel_engine_pulse(struct intel_engine_cs *engine);
 int intel_engine_flush_barriers(struct intel_engine_cs *engine);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0f5823922369..2cbf9847b055 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -10,6 +10,7 @@
 #include "gt/intel_breadcrumbs.h"
 #include "gt/intel_context.h"
 #include "gt/intel_engine_pm.h"
+#include "gt/intel_engine_heartbeat.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_irq.h"
 #include "gt/intel_gt_pm.h"
@@ -601,6 +602,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 		/* Reset called during driver load? GuC not yet initialised! */
 		return;
 
+	intel_gt_park_heartbeats(guc_to_gt(guc));
 	disable_submission(guc);
 	guc->interrupts.disable(guc);
 
@@ -886,6 +888,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 	atomic_set(&guc->outstanding_submission_g2h, 0);
 
 	enable_submission(guc);
+	intel_gt_unpark_heartbeats(guc_to_gt(guc));
 }
 
 /*
@@ -1850,6 +1853,11 @@ static int guc_resume(struct intel_engine_cs *engine)
 	return 0;
 }
 
+static bool guc_sched_engine_disabled(struct i915_sched_engine *sched_engine)
+{
+	return !sched_engine->tasklet.callback;
+}
+
 static void guc_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = guc_submit_request;
@@ -2011,6 +2019,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 			return -ENOMEM;
 
 		guc->sched_engine->schedule = i915_schedule;
+		guc->sched_engine->disabled = guc_sched_engine_disabled;
 		guc->sched_engine->private_data = guc;
 		guc->sched_engine->destroy = guc_sched_engine_destroy;
 		tasklet_setup(&guc->sched_engine->tasklet,
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 4fceda96deed..8766a8643469 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -440,6 +440,11 @@ static void default_destroy(struct kref *kref)
 	kfree(sched_engine);
 }
 
+static bool default_disabled(struct i915_sched_engine *sched_engine)
+{
+	return false;
+}
+
 struct i915_sched_engine *
 i915_sched_engine_create(unsigned int subclass)
 {
@@ -454,6 +459,7 @@ i915_sched_engine_create(unsigned int subclass)
 	sched_engine->queue = RB_ROOT_CACHED;
 	sched_engine->queue_priority_hint = INT_MIN;
 	sched_engine->destroy = default_destroy;
+	sched_engine->disabled = default_disabled;
 
 	INIT_LIST_HEAD(&sched_engine->requests);
 	INIT_LIST_HEAD(&sched_engine->hold);
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 3c9504e9f409..f4d9811ade5b 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -96,4 +96,10 @@ void i915_request_show_with_schedule(struct drm_printer *m,
 				     const char *prefix,
 				     int indent);
 
+static inline bool
+i915_sched_engine_disabled(struct i915_sched_engine *sched_engine)
+{
+	return sched_engine->disabled(sched_engine);
+}
+
 #endif /* _I915_SCHEDULER_H_ */
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index 00384e2c5273..eaef233e9080 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -168,6 +168,11 @@ struct i915_sched_engine {
 	 */
 	void	(*destroy)(struct kref *kref);
 
+	/**
+	 * @disabled: check if backend has disabled submission
+	 */
+	bool	(*disabled)(struct i915_sched_engine *sched_engine);
+
 	/**
 	 * @kick_backend: kick backend after a request's priority has changed
 	 */
-- 
2.28.0

