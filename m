Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A46375B1D
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A201B6EDAB;
	Thu,  6 May 2021 18:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B866ED26;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: UGVUiPMdYq3KFJQAR4+h4FCg3msJxgdazCEWs4TF1Gnwij7mHwKpGyVV+TgG74LnQMHGN35T6j
 neCSVIRR9mgQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195457"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195457"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: Luo/fE7pypFuXYSNd1Qs2JUGre+sAi7ASoev7dEDGzS2qs1ivJUs8vYkpaVp0rmNvz3LDMJyQf
 uH02h6F0+CVA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583567"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 65/97] drm/i915: Reset GPU immediately if submission is
 disabled
Date: Thu,  6 May 2021 12:14:19 -0700
Message-Id: <20210506191451.77768-66-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If submission is disabled by the backend for any reason, reset the GPU
immediately in the heartbeat code.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 63 +++++++++++++++----
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |  4 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  9 +++
 drivers/gpu/drm/i915/i915_scheduler.c         |  6 ++
 drivers/gpu/drm/i915/i915_scheduler.h         |  6 ++
 drivers/gpu/drm/i915/i915_scheduler_types.h   |  3 +
 6 files changed, 78 insertions(+), 13 deletions(-)

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
index 8c093bc2d3a4..a5997d6b4aa4 100644
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
@@ -604,6 +605,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 		/* Reset called during driver load? GuC not yet initialised! */
 		return;
 
+	intel_gt_park_heartbeats(guc_to_gt(guc));
 	disable_submission(guc);
 	guc->interrupts.disable(guc);
 
@@ -889,6 +891,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 	atomic_set(&guc->outstanding_submission_g2h, 0);
 
 	enable_submission(guc);
+	intel_gt_unpark_heartbeats(guc_to_gt(guc));
 }
 
 /*
@@ -1856,6 +1859,11 @@ static int guc_resume(struct intel_engine_cs *engine)
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
@@ -2006,6 +2014,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 			return -ENOMEM;
 
 		guc->sched_engine->schedule = i915_schedule;
+		guc->sched_engine->disabled = guc_sched_engine_disabled;
 		guc->sched_engine->engine = engine;
 		tasklet_setup(&guc->sched_engine->tasklet,
 			      guc_submission_tasklet);
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 28d403a8d7d2..72a9bee3026f 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -440,6 +440,11 @@ void i915_sched_engine_free(struct kref *kref)
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
@@ -453,6 +458,7 @@ i915_sched_engine_create(unsigned int subclass)
 
 	sched_engine->queue = RB_ROOT_CACHED;
 	sched_engine->queue_priority_hint = INT_MIN;
+	sched_engine->disabled = default_disabled;
 
 	INIT_LIST_HEAD(&sched_engine->requests);
 	INIT_LIST_HEAD(&sched_engine->hold);
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index a78b1f50ecb4..ec8dfa87cbb6 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -116,4 +116,10 @@ sched_engine_active_unlock_bh(struct i915_sched_engine *sched_engine)
 	local_bh_enable(); /* restore softirq, and kick ksoftirqd! */
 }
 
+static inline bool
+i915_sched_engine_disabled(struct i915_sched_engine *sched_engine)
+{
+	return sched_engine->disabled(sched_engine);
+}
+
 #endif /* _I915_SCHEDULER_H_ */
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index 90b389ba661b..a7183792d110 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -141,6 +141,9 @@ struct i915_sched_engine {
 	/* Back pointer to engine */
 	struct intel_engine_cs *engine;
 
+	/* Schedule engine is disabled by backend */
+	bool	(*disabled)(struct i915_sched_engine *sched_engine);
+
 	/* Kick backend */
 	void	(*kick_backend)(const struct i915_request *rq,
 				int prio);
-- 
2.28.0

