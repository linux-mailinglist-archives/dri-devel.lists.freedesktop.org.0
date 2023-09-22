Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F37ABBB6
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 00:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5278C10E71E;
	Fri, 22 Sep 2023 22:26:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413BF10E19F;
 Fri, 22 Sep 2023 22:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695421569; x=1726957569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iqhw/1Of57XlksORR0OgR1anmPoLPnmeUUJ27PoM/B4=;
 b=FkVfr7G8LGqA+QJyCwAurxEXz0B/Fs/hCiNDhGTY/+5aEnxFGbiBSYzI
 zfO2t/XE9wiRcNeDvlQd5l/YgD+zQHQdSHon5H3B4iHBgLWQkbYbun6Ms
 HgQjpV91aODmI3a1/owfxIJcMaobc+G9RbXc86OGHBa55JOe9tkTSPLAf
 PH/lI9h0viERkpgNXQx0yjiYwhDgKWRDW/X0821/i+nCcdxFlIthxsOWv
 iZvpRK24GRQFqaHkZrt1ob/RrdtPA2AVrADqP66mwcl9DVhmoHkDwQtkq
 LchhEPSZV/I/9c3azhZs26I1Bp122+juJ4GIz4XsDQnxd7Y41bhi9VU38 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="379836618"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="379836618"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 15:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078549558"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="1078549558"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2023 15:25:57 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/3] drm/i915/mtl: Add counters for engine busyness ticks
Date: Fri, 22 Sep 2023 15:25:10 -0700
Message-ID: <20230922222510.2235213-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
References: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

In new version of GuC engine busyness, GuC provides engine busyness
ticks as a 64 bit counter. Add a new counter to relay this value to the
user as is.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h        |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 16 +++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  | 12 ++++
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 67 ++++++++++++++-----
 drivers/gpu/drm/i915/i915_pmu.c               | 25 ++++++-
 drivers/gpu/drm/i915/i915_pmu.h               |  2 +-
 include/uapi/drm/i915_drm.h                   | 13 +++-
 8 files changed, 116 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index b58c30ac8ef02..57af7ec8ecd82 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -249,6 +249,7 @@ void intel_engine_dump_active_requests(struct list_head *requests,
 
 ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
 				   ktime_t *now);
+u64 intel_engine_get_busy_ticks(struct intel_engine_cs *engine);
 
 void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
 				  struct intel_context **ce, struct i915_request **rq);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 84a75c95f3f7d..1c9ffb1ae9889 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2426,6 +2426,22 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
 	return engine->busyness(engine, now);
 }
 
+/**
+ * intel_engine_get_busy_ticks() - Return current accumulated engine busyness
+ * ticks
+ * @engine: engine to report on
+ *
+ * Returns accumulated ticks @engine was busy since engine stats were enabled.
+ */
+u64 intel_engine_get_busy_ticks(struct intel_engine_cs *engine)
+{
+	if (!engine->busyness_ticks ||
+	    !(engine->flags & I915_ENGINE_SUPPORTS_TICKS_STATS))
+		return 0;
+
+	return engine->busyness_ticks(engine);
+}
+
 struct intel_context *
 intel_engine_create_virtual(struct intel_engine_cs **siblings,
 			    unsigned int count, unsigned long flags)
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 40fd8f984d64b..a88d40c74d604 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -548,6 +548,11 @@ struct intel_engine_cs {
 	ktime_t		(*busyness)(struct intel_engine_cs *engine,
 				    ktime_t *now);
 
+	/*
+	 * Get engine busyness ticks
+	 */
+	u64		(*busyness_ticks)(struct intel_engine_cs *engine);
+
 	struct intel_engine_execlists execlists;
 
 	/*
@@ -574,6 +579,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
 #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
 #define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
+#define I915_ENGINE_SUPPORTS_TICKS_STATS   BIT(13)
 	unsigned int flags;
 
 	/*
@@ -649,6 +655,12 @@ intel_engine_supports_stats(const struct intel_engine_cs *engine)
 	return engine->flags & I915_ENGINE_SUPPORTS_STATS;
 }
 
+static inline bool
+intel_engine_supports_tick_stats(const struct intel_engine_cs *engine)
+{
+	return engine->flags & I915_ENGINE_SUPPORTS_TICKS_STATS;
+}
+
 static inline bool
 intel_engine_has_preemption(const struct intel_engine_cs *engine)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index dcedff41a825f..69eb610b5ab0a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -100,6 +100,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
 		MAP(HAS_PREEMPTION, PREEMPTION),
 		MAP(HAS_SEMAPHORES, SEMAPHORES),
 		MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
+		MAP(SUPPORTS_TICKS_STATS, ENGINE_BUSY_TICKS_STATS),
 #undef MAP
 	};
 	struct intel_engine_cs *engine;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0c1fee5360777..71749fb9ad35b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1289,12 +1289,7 @@ static void busy_v1_guc_update_pm_timestamp(struct intel_guc *guc, ktime_t *now)
 	guc->busy.v1.gt_stamp = ((u64)gt_stamp_hi << 32) | gt_stamp_lo;
 }
 
-/*
- * Unlike the execlist mode of submission total and active times are in terms of
- * gt clocks. The *now parameter is retained to return the cpu time at which the
- * busyness was sampled.
- */
-static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
+static u64 __busy_v1_guc_engine_busyness_ticks(struct intel_engine_cs *engine, ktime_t *now_out)
 {
 	struct intel_engine_guc_stats_v1 stats_saved, *stats = &engine->stats.guc_v1;
 	struct i915_gpu_error *gpu_error = &engine->i915->gpu_error;
@@ -1304,6 +1299,7 @@ static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
 	unsigned long flags;
 	u32 reset_count;
 	bool in_reset;
+	ktime_t now;
 
 	spin_lock_irqsave(&guc->busy.v1.lock, flags);
 
@@ -1318,7 +1314,7 @@ static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
 	reset_count = i915_reset_count(gpu_error);
 	in_reset = test_bit(I915_RESET_BACKOFF, &gt->reset.flags);
 
-	*now = ktime_get();
+	now = ktime_get();
 
 	/*
 	 * The active busyness depends on start_gt_clk and gt_stamp.
@@ -1334,7 +1330,7 @@ static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
 		 * start_gt_clk' calculation below for active engines.
 		 */
 		busy_v1_guc_update_engine_gt_clks(engine);
-		busy_v1_guc_update_pm_timestamp(guc, now);
+		busy_v1_guc_update_pm_timestamp(guc, &now);
 		intel_gt_pm_put_async(gt);
 		if (i915_reset_count(gpu_error) != reset_count) {
 			*stats = stats_saved;
@@ -1342,16 +1338,37 @@ static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
 		}
 	}
 
-	total = intel_gt_clock_interval_to_ns(gt, stats->total_gt_clks);
+	total = stats->total_gt_clks;
 	if (stats->running) {
 		u64 clk = guc->busy.v1.gt_stamp - stats->start_gt_clk;
 
-		total += intel_gt_clock_interval_to_ns(gt, clk);
+		total += clk;
 	}
 
 	spin_unlock_irqrestore(&guc->busy.v1.lock, flags);
 
-	return ns_to_ktime(total);
+	if (now_out)
+		*now_out = now;
+
+	return total;
+}
+
+/*
+ * Unlike the execlist mode of submission total and active times are in terms of
+ * gt clocks. The *now parameter is retained to return the cpu time at which the
+ * busyness was sampled.
+ */
+static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
+{
+	u64 ticks = __busy_v1_guc_engine_busyness_ticks(engine, now);
+	u64 ns = intel_gt_clock_interval_to_ns(engine->gt, ticks);
+
+	return ns_to_ktime(ns);
+}
+
+static u64 busy_v1_guc_engine_busyness_ticks(struct intel_engine_cs *engine)
+{
+	return __busy_v1_guc_engine_busyness_ticks(engine, NULL);
 }
 
 static void busy_v1_guc_enable_worker(struct intel_guc *guc)
@@ -1607,6 +1624,16 @@ static ktime_t busy_v2_guc_engine_busyness(struct intel_engine_cs *engine, ktime
 	return ns_to_ktime(total);
 }
 
+static u64 busy_v2_guc_engine_busyness_ticks(struct intel_engine_cs *engine)
+{
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	u64 ticks_engine;
+
+	__busy_v2_get_engine_usage_record(guc, engine, &ticks_engine, NULL, NULL);
+
+	return ticks_engine;
+}
+
 static u64 busy_v1_intel_guc_total_active_ticks(struct intel_guc *guc)
 {
 	return guc->busy.v1.gt_stamp;
@@ -4480,12 +4507,20 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 		engine->emit_flush = gen12_emit_flush_xcs;
 	}
 	engine->set_default_submission = guc_set_default_submission;
-	if (GUC_SUBMIT_VER(&engine->gt->uc.guc) < MAKE_GUC_VER(1, 3, 1))
-		engine->busyness = busy_v1_guc_engine_busyness;
-	else
-		engine->busyness = busy_v2_guc_engine_busyness;
+	if (GUC_SUBMIT_VER(&engine->gt->uc.guc) < MAKE_GUC_VER(1, 3, 1)) {
+		if (GRAPHICS_VER_FULL(engine->i915) < IP_VER(12, 70))
+			engine->busyness = busy_v1_guc_engine_busyness;
+		engine->busyness_ticks = busy_v1_guc_engine_busyness_ticks;
+	} else {
+		if (GRAPHICS_VER_FULL(engine->i915) < IP_VER(12, 70))
+			engine->busyness = busy_v2_guc_engine_busyness;
+		engine->busyness_ticks = busy_v2_guc_engine_busyness_ticks;
+	}
+
+	if (engine->busyness)
+		engine->flags |= I915_ENGINE_SUPPORTS_STATS;
 
-	engine->flags |= I915_ENGINE_SUPPORTS_STATS;
+	engine->flags |= I915_ENGINE_SUPPORTS_TICKS_STATS;
 	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
 	engine->flags |= I915_ENGINE_HAS_TIMESLICES;
 
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 4f52636eb4a80..1b859556644f6 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -26,7 +26,8 @@
 #define ENGINE_SAMPLE_MASK \
 	(BIT(I915_SAMPLE_BUSY) | \
 	 BIT(I915_SAMPLE_WAIT) | \
-	 BIT(I915_SAMPLE_SEMA))
+	 BIT(I915_SAMPLE_SEMA) | \
+	 BIT(I915_SAMPLE_BUSY_TICKS))
 
 static cpumask_t i915_pmu_cpumask;
 static unsigned int i915_pmu_target_cpu = -1;
@@ -161,8 +162,11 @@ static bool pmu_needs_timer(struct i915_pmu *pmu)
 	 * Also there is software busyness tracking available we do not
 	 * need the timer for I915_SAMPLE_BUSY counter.
 	 */
-	if (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
+	if ((i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS) ||
+	    (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_TICKS_STATS)) {
 		enable &= ~BIT(I915_SAMPLE_BUSY);
+		enable &= ~BIT(I915_SAMPLE_BUSY_TICKS);
+	}
 
 	/*
 	 * If some bits remain it means we need the sampling timer running.
@@ -362,7 +366,8 @@ static void engine_sample(struct intel_engine_cs *engine, unsigned int period_ns
 		add_sample(&pmu->sample[I915_SAMPLE_SEMA], period_ns);
 
 	/* No need to sample when busy stats are supported. */
-	if (intel_engine_supports_stats(engine))
+	if (intel_engine_supports_stats(engine) ||
+	    intel_engine_supports_tick_stats(engine))
 		return;
 
 	/*
@@ -519,6 +524,13 @@ engine_event_status(struct intel_engine_cs *engine,
 {
 	switch (sample) {
 	case I915_SAMPLE_BUSY:
+		if (!intel_engine_supports_stats(engine))
+			return -ENODEV;
+		break;
+	case I915_SAMPLE_BUSY_TICKS:
+		if (!intel_engine_supports_tick_stats(engine))
+			return -ENODEV;
+		break;
 	case I915_SAMPLE_WAIT:
 		break;
 	case I915_SAMPLE_SEMA:
@@ -651,6 +663,9 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
 
 			val = ktime_to_ns(intel_engine_get_busy_time(engine,
 								     &unused));
+		} else if (sample == I915_SAMPLE_BUSY_TICKS &&
+			   intel_engine_supports_tick_stats(engine)) {
+			val = intel_engine_get_busy_ticks(engine);
 		} else {
 			val = engine->pmu.sample[sample].cur;
 		}
@@ -1000,6 +1015,7 @@ create_event_attributes(struct i915_pmu *pmu)
 		__engine_event(I915_SAMPLE_BUSY, "busy"),
 		__engine_event(I915_SAMPLE_SEMA, "sema"),
 		__engine_event(I915_SAMPLE_WAIT, "wait"),
+		__engine_event(I915_SAMPLE_BUSY_TICKS, "busy-ticks"),
 	};
 	unsigned int count = 0;
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
@@ -1103,6 +1119,9 @@ create_event_attributes(struct i915_pmu *pmu)
 								engine->uabi_instance,
 								engine_events[i].sample));
 
+			if (engine_events[i].sample == I915_SAMPLE_BUSY_TICKS)
+				continue;
+
 			str = kasprintf(GFP_KERNEL, "%s-%s.unit",
 					engine->name, engine_events[i].name);
 			if (!str)
diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
index 41af038c37388..72a9c71944f8d 100644
--- a/drivers/gpu/drm/i915/i915_pmu.h
+++ b/drivers/gpu/drm/i915/i915_pmu.h
@@ -49,7 +49,7 @@ enum {
 	(I915_ENGINE_SAMPLE_COUNT + \
 	 I915_PMU_MAX_GT * __I915_PMU_TRACKED_EVENT_COUNT)
 
-#define I915_ENGINE_SAMPLE_COUNT (I915_SAMPLE_SEMA + 1)
+#define I915_ENGINE_SAMPLE_COUNT (I915_SAMPLE_BUSY_TICKS + 1)
 
 struct i915_pmu_sample {
 	u64 cur;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index e26dd27ff4a5f..8ae98c1bda0ea 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -257,7 +257,8 @@ struct i915_engine_class_instance {
 enum drm_i915_pmu_engine_sample {
 	I915_SAMPLE_BUSY = 0,
 	I915_SAMPLE_WAIT = 1,
-	I915_SAMPLE_SEMA = 2
+	I915_SAMPLE_SEMA = 2,
+	I915_SAMPLE_BUSY_TICKS = 3,
 };
 
 #define I915_PMU_SAMPLE_BITS (4)
@@ -274,6 +275,9 @@ enum drm_i915_pmu_engine_sample {
 #define I915_PMU_ENGINE_BUSY(class, instance) \
 	__I915_PMU_ENGINE(class, instance, I915_SAMPLE_BUSY)
 
+#define I915_PMU_ENGINE_BUSY_TICKS(class, instance) \
+	__I915_PMU_ENGINE(class, instance, I915_SAMPLE_BUSY_TICKS)
+
 #define I915_PMU_ENGINE_WAIT(class, instance) \
 	__I915_PMU_ENGINE(class, instance, I915_SAMPLE_WAIT)
 
@@ -651,7 +655,14 @@ typedef struct drm_i915_irq_wait {
 #define   I915_SCHEDULER_CAP_PRIORITY	(1ul << 1)
 #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
 #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
+/*
+ * BUSY_STATS is deprecated on platforms with GuC based submission and will nt
+ * be available at all on newer platforms. It has accuracy issues due to the
+ * conversions from tick counts to wall time.
+ * BUSY_TICKS_STATS should be used instead.
+ */
 #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
+#define   I915_SCHEDULER_CAP_ENGINE_BUSY_TICKS_STATS	(1ul << 5)
 /*
  * Indicates the 2k user priority levels are statically mapped into 3 buckets as
  * follows:
-- 
2.41.0

