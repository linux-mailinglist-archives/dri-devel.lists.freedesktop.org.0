Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDED42B16D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 02:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407F06EA01;
	Wed, 13 Oct 2021 00:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E52F6EA01;
 Wed, 13 Oct 2021 00:56:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="224747755"
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; d="scan'208";a="224747755"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 17:56:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; d="scan'208";a="441446330"
Received: from orsosgc001.jf.intel.com ([10.165.21.154])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 17:56:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: john.c.harrison@intel.com, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 daniel.vetter@ffwll.ch, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/i915/pmu: Connect engine busyness stats from GuC to
 pmu
Date: Tue, 12 Oct 2021 17:56:25 -0700
Message-Id: <20211013005625.54770-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211013005625.54770-1-umesh.nerlige.ramappa@intel.com>
References: <20211013005625.54770-1-umesh.nerlige.ramappa@intel.com>
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

With GuC handling scheduling, i915 is not aware of the time that a
context is scheduled in and out of the engine. Since i915 pmu relies on
this info to provide engine busyness to the user, GuC shares this info
with i915 for all engines using shared memory. For each engine, this
info contains:

- total busyness: total time that the context was running (total)
- id: id of the running context (id)
- start timestamp: timestamp when the context started running (start)

At the time (now) of sampling the engine busyness, if the id is valid
(!= ~0), and start is non-zero, then the context is considered to be
active and the engine busyness is calculated using the below equation

	engine busyness = total + (now - start)

All times are obtained from the gt clock base. For inactive contexts,
engine busyness is just equal to the total.

The start and total values provided by GuC are 32 bits and wrap around
in a few minutes. Since perf pmu provides busyness as 64 bit
monotonically increasing values, there is a need for this implementation
to account for overflows and extend the time to 64 bits before returning
busyness to the user. In order to do that, a worker runs periodically at
frequency = 1/8th the time it takes for the timestamp to wrap. As an
example, that would be once in 27 seconds for a gt clock frequency of
19.2 MHz.

Note:
There might be an overaccounting of busyness due to the fact that GuC
may be updating the total and start values while kmd is reading them.
(i.e kmd may read the updated total and the stale start). In such a
case, user may see higher busyness value followed by smaller ones which
would eventually catch up to the higher value.

v2: (Tvrtko)
- Include details in commit message
- Move intel engine busyness function into execlist code
- Use union inside engine->stats
- Use natural type for ping delay jiffies
- Drop active_work condition checks
- Use for_each_engine if iterating all engines
- Drop seq locking, use spinlock at guc level to update engine stats
- Document worker specific details

v3: (Tvrtko/Umesh)
- Demarcate guc and execlist stat objects with comments
- Document known over-accounting issue in commit
- Provide a consistent view of guc state
- Add hooks to gt park/unpark for guc busyness
- Stop/start worker in gt park/unpark path
- Drop inline
- Move spinlock and worker inits to guc initialization
- Drop helpers that are called only once

v4: (Tvrtko/Matt/Umesh)
- Drop addressed opens from commit message
- Get runtime pm in ping, remove from the park path
- Use cancel_delayed_work_sync in disable_submission path
- Update stats during reset prepare
- Skip ping if reset in progress
- Explicitly name execlists and guc stats objects
- Since disable_submission is called from many places, move resetting
  stats to intel_guc_submission_reset_prepare

v5: (Tvrtko)
- Add a trylock helper that does not sleep and synchronize PMU event
  callbacks and worker with gt reset

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  28 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  33 ++-
 .../drm/i915/gt/intel_execlists_submission.c  |  34 +++
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   2 +
 drivers/gpu/drm/i915/gt/intel_reset.c         |  16 ++
 drivers/gpu/drm/i915/gt/intel_reset.h         |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  30 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  21 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  13 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 267 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   2 +
 drivers/gpu/drm/i915/i915_reg.h               |   2 +
 14 files changed, 427 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 38436f4b5706..6b783fdcba2a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1873,23 +1873,6 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 	intel_engine_print_breadcrumbs(engine, m);
 }
 
-static ktime_t __intel_engine_get_busy_time(struct intel_engine_cs *engine,
-					    ktime_t *now)
-{
-	struct intel_engine_execlists_stats *stats = &engine->stats.execlists;
-	ktime_t total = stats->total;
-
-	/*
-	 * If the engine is executing something at the moment
-	 * add it to the total.
-	 */
-	*now = ktime_get();
-	if (READ_ONCE(stats->active))
-		total = ktime_add(total, ktime_sub(*now, stats->start));
-
-	return total;
-}
-
 /**
  * intel_engine_get_busy_time() - Return current accumulated engine busyness
  * @engine: engine to report on
@@ -1899,16 +1882,7 @@ static ktime_t __intel_engine_get_busy_time(struct intel_engine_cs *engine,
  */
 ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
 {
-	struct intel_engine_execlists_stats *stats = &engine->stats.execlists;
-	unsigned int seq;
-	ktime_t total;
-
-	do {
-		seq = read_seqcount_begin(&stats->lock);
-		total = __intel_engine_get_busy_time(engine, now);
-	} while (read_seqcount_retry(&stats->lock, seq));
-
-	return total;
+	return engine->busyness(engine, now);
 }
 
 struct intel_context *
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index b820a2c1124e..9300c65d6675 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -284,6 +284,28 @@ struct intel_engine_execlists_stats {
 	ktime_t start;
 };
 
+struct intel_engine_guc_stats {
+	/**
+	 * @running: Active state of the engine when busyness was last sampled.
+	 */
+	bool running;
+
+	/**
+	 * @prev_total: Previous value of total runtime clock cycles.
+	 */
+	u32 prev_total;
+
+	/**
+	 * @total_gt_clks: Total gt clock cycles this engine was busy.
+	 */
+	u64 total_gt_clks;
+
+	/**
+	 * @start_gt_clk: GT clock time of last idle to active transition.
+	 */
+	u64 start_gt_clk;
+};
+
 struct intel_engine_cs {
 	struct drm_i915_private *i915;
 	struct intel_gt *gt;
@@ -459,6 +481,12 @@ struct intel_engine_cs {
 	void		(*add_active_request)(struct i915_request *rq);
 	void		(*remove_active_request)(struct i915_request *rq);
 
+	/*
+	 * Get engine busyness and the time at which the busyness was sampled.
+	 */
+	ktime_t		(*busyness)(struct intel_engine_cs *engine,
+				    ktime_t *now);
+
 	struct intel_engine_execlists execlists;
 
 	/*
@@ -508,7 +536,10 @@ struct intel_engine_cs {
 	u32 (*get_cmd_length_mask)(u32 cmd_header);
 
 	struct {
-		struct intel_engine_execlists_stats execlists;
+		union {
+			struct intel_engine_execlists_stats execlists;
+			struct intel_engine_guc_stats guc;
+		};
 
 		/**
 		 * @rps: Utilisation at last RPS sampling.
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 73a79c2acd3a..e8ffcf36f6f4 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3292,6 +3292,38 @@ static void execlists_release(struct intel_engine_cs *engine)
 	lrc_fini_wa_ctx(engine);
 }
 
+static ktime_t __execlists_engine_busyness(struct intel_engine_cs *engine,
+					   ktime_t *now)
+{
+	struct intel_engine_execlists_stats *stats = &engine->stats.execlists;
+	ktime_t total = stats->total;
+
+	/*
+	 * If the engine is executing something at the moment
+	 * add it to the total.
+	 */
+	*now = ktime_get();
+	if (READ_ONCE(stats->active))
+		total = ktime_add(total, ktime_sub(*now, stats->start));
+
+	return total;
+}
+
+static ktime_t execlists_engine_busyness(struct intel_engine_cs *engine,
+					 ktime_t *now)
+{
+	struct intel_engine_execlists_stats *stats = &engine->stats.execlists;
+	unsigned int seq;
+	ktime_t total;
+
+	do {
+		seq = read_seqcount_begin(&stats->lock);
+		total = __execlists_engine_busyness(engine, now);
+	} while (read_seqcount_retry(&stats->lock, seq));
+
+	return total;
+}
+
 static void
 logical_ring_default_vfuncs(struct intel_engine_cs *engine)
 {
@@ -3348,6 +3380,8 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
 		engine->emit_bb_start = gen8_emit_bb_start;
 	else
 		engine->emit_bb_start = gen8_emit_bb_start_noarb;
+
+	engine->busyness = execlists_engine_busyness;
 }
 
 static void logical_ring_default_irqs(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 524eaf678790..b4a8594bc46c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -86,6 +86,7 @@ static int __gt_unpark(struct intel_wakeref *wf)
 	intel_rc6_unpark(&gt->rc6);
 	intel_rps_unpark(&gt->rps);
 	i915_pmu_gt_unparked(i915);
+	intel_guc_busyness_unpark(gt);
 
 	intel_gt_unpark_requests(gt);
 	runtime_begin(gt);
@@ -104,6 +105,7 @@ static int __gt_park(struct intel_wakeref *wf)
 	runtime_end(gt);
 	intel_gt_park_requests(gt);
 
+	intel_guc_busyness_park(gt);
 	i915_vma_parked(gt);
 	i915_pmu_gt_parked(i915);
 	intel_rps_park(&gt->rps);
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 91200c43951f..ac12163c3639 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1389,6 +1389,22 @@ void intel_gt_handle_error(struct intel_gt *gt,
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
 }
 
+bool intel_gt_reset_trylock_no_wait(struct intel_gt *gt, int *srcu)
+{
+	int reset_in_progress;
+
+	might_lock(&gt->reset.backoff_srcu);
+	cant_sleep();
+
+	rcu_read_lock();
+	reset_in_progress = test_bit(I915_RESET_BACKOFF, &gt->reset.flags);
+	if (!reset_in_progress)
+		*srcu = srcu_read_lock(&gt->reset.backoff_srcu);
+	rcu_read_unlock();
+
+	return reset_in_progress;
+}
+
 int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
 {
 	might_lock(&gt->reset.backoff_srcu);
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
index adc734e67387..4f5f4c00c54f 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset.h
@@ -38,6 +38,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine,
 
 void __i915_request_reset(struct i915_request *rq, bool guilty);
 
+bool __must_check intel_gt_reset_trylock_no_wait(struct intel_gt *gt, int *srcu);
 int __must_check intel_gt_reset_trylock(struct intel_gt *gt, int *srcu);
 void intel_gt_reset_unlock(struct intel_gt *gt, int tag);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 8ff582222aff..ff1311d4beff 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -143,6 +143,7 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
 	INTEL_GUC_ACTION_RESET_CLIENT = 0x5507,
+	INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
 	INTEL_GUC_ACTION_LIMIT
 };
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 5dd174babf7a..3c3d48c7d5de 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -104,6 +104,8 @@ struct intel_guc {
 	u32 ads_regset_size;
 	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
 	u32 ads_golden_ctxt_size;
+	/** @ads_engine_usage_size: size of engine usage in the ADS */
+	u32 ads_engine_usage_size;
 
 	/** @lrc_desc_pool: object allocated to hold the GuC LRC descriptor pool */
 	struct i915_vma *lrc_desc_pool;
@@ -138,6 +140,34 @@ struct intel_guc {
 
 	/** @send_mutex: used to serialize the intel_guc_send actions */
 	struct mutex send_mutex;
+
+	/**
+	 * @timestamp: GT timestamp object that stores a copy of the timestamp
+	 * and adjusts it for overflow using a worker.
+	 */
+	struct {
+		/**
+		 * @lock: Lock protecting the below fields and the engine stats.
+		 */
+		spinlock_t lock;
+
+		/**
+		 * @gt_stamp: 64 bit extended value of the GT timestamp.
+		 */
+		u64 gt_stamp;
+
+		/**
+		 * @ping_delay: Period for polling the GT timestamp for
+		 * overflow.
+		 */
+		unsigned long ping_delay;
+
+		/**
+		 * @work: Periodic work to adjust GT timestamp, engine and
+		 * context usage for overflows.
+		 */
+		struct delayed_work work;
+	} timestamp;
 };
 
 static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 2c6ea64af7ec..ca9ab53999d5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -26,6 +26,8 @@
  *      | guc_policies                          |
  *      +---------------------------------------+
  *      | guc_gt_system_info                    |
+ *      +---------------------------------------+
+ *      | guc_engine_usage                      |
  *      +---------------------------------------+ <== static
  *      | guc_mmio_reg[countA] (engine 0.0)     |
  *      | guc_mmio_reg[countB] (engine 0.1)     |
@@ -47,6 +49,7 @@ struct __guc_ads_blob {
 	struct guc_ads ads;
 	struct guc_policies policies;
 	struct guc_gt_system_info system_info;
+	struct guc_engine_usage engine_usage;
 	/* From here on, location is dynamic! Refer to above diagram. */
 	struct guc_mmio_reg regset[0];
 } __packed;
@@ -628,3 +631,21 @@ void intel_guc_ads_reset(struct intel_guc *guc)
 
 	guc_ads_private_data_reset(guc);
 }
+
+u32 intel_guc_engine_usage_offset(struct intel_guc *guc)
+{
+	struct __guc_ads_blob *blob = guc->ads_blob;
+	u32 base = intel_guc_ggtt_offset(guc, guc->ads_vma);
+	u32 offset = base + ptr_offset(blob, engine_usage);
+
+	return offset;
+}
+
+struct guc_engine_usage_record *intel_guc_engine_usage(struct intel_engine_cs *engine)
+{
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct __guc_ads_blob *blob = guc->ads_blob;
+	u8 guc_class = engine_class_to_guc_class(engine->class);
+
+	return &blob->engine_usage.engines[guc_class][engine->instance];
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
index 3d85051d57e4..e74c110facff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
@@ -6,8 +6,11 @@
 #ifndef _INTEL_GUC_ADS_H_
 #define _INTEL_GUC_ADS_H_
 
+#include <linux/types.h>
+
 struct intel_guc;
 struct drm_printer;
+struct intel_engine_cs;
 
 int intel_guc_ads_create(struct intel_guc *guc);
 void intel_guc_ads_destroy(struct intel_guc *guc);
@@ -15,5 +18,7 @@ void intel_guc_ads_init_late(struct intel_guc *guc);
 void intel_guc_ads_reset(struct intel_guc *guc);
 void intel_guc_ads_print_policy_info(struct intel_guc *guc,
 				     struct drm_printer *p);
+struct guc_engine_usage_record *intel_guc_engine_usage(struct intel_engine_cs *engine);
+u32 intel_guc_engine_usage_offset(struct intel_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index fa4be13c8854..7c9c081670fc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -294,6 +294,19 @@ struct guc_ads {
 	u32 reserved[15];
 } __packed;
 
+/* Engine usage stats */
+struct guc_engine_usage_record {
+	u32 current_context_index;
+	u32 last_switch_in_stamp;
+	u32 reserved0;
+	u32 total_runtime;
+	u32 reserved1[4];
+} __packed;
+
+struct guc_engine_usage {
+	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
+} __packed;
+
 /* GuC logging structures */
 
 enum guc_log_buffer_type {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ba0de35f6323..0c2e4d8d8ec3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -12,6 +12,7 @@
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_engine_heartbeat.h"
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_clock_utils.h"
 #include "gt/intel_gt_irq.h"
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_gt_requests.h"
@@ -20,6 +21,7 @@
 #include "gt/intel_mocs.h"
 #include "gt/intel_ring.h"
 
+#include "intel_guc_ads.h"
 #include "intel_guc_submission.h"
 
 #include "i915_drv.h"
@@ -750,6 +752,262 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
+/*
+ * GuC stores busyness stats for each engine at context in/out boundaries. A
+ * context 'in' logs execution start time, 'out' adds in -> out delta to total.
+ * i915/kmd accesses 'start', 'total' and 'context id' from memory shared with
+ * GuC.
+ *
+ * __i915_pmu_event_read samples engine busyness. When sampling, if context id
+ * is valid (!= ~0) and start is non-zero, the engine is considered to be
+ * active. For an active engine total busyness = total + (now - start), where
+ * 'now' is the time at which the busyness is sampled. For inactive engine,
+ * total busyness = total.
+ *
+ * All times are captured from GUCPMTIMESTAMP reg and are in gt clock domain.
+ *
+ * The start and total values provided by GuC are 32 bits and wrap around in a
+ * few minutes. Since perf pmu provides busyness as 64 bit monotonically
+ * increasing ns values, there is a need for this implementation to account for
+ * overflows and extend the GuC provided values to 64 bits before returning
+ * busyness to the user. In order to do that, a worker runs periodically at
+ * frequency = 1/8th the time it takes for the timestamp to wrap (i.e. once in
+ * 27 seconds for a gt clock frequency of 19.2 MHz).
+ */
+
+#define WRAP_TIME_CLKS U32_MAX
+#define POLL_TIME_CLKS (WRAP_TIME_CLKS >> 3)
+
+static void
+__extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
+{
+	u32 gt_stamp_hi = upper_32_bits(guc->timestamp.gt_stamp);
+	u32 gt_stamp_last = lower_32_bits(guc->timestamp.gt_stamp);
+
+	if (new_start == lower_32_bits(*prev_start))
+		return;
+
+	if (new_start < gt_stamp_last &&
+	    (new_start - gt_stamp_last) <= POLL_TIME_CLKS)
+		gt_stamp_hi++;
+
+	if (new_start > gt_stamp_last &&
+	    (gt_stamp_last - new_start) <= POLL_TIME_CLKS && gt_stamp_hi)
+		gt_stamp_hi--;
+
+	*prev_start = ((u64)gt_stamp_hi << 32) | new_start;
+}
+
+static void guc_update_engine_gt_clks(struct intel_engine_cs *engine)
+{
+	struct guc_engine_usage_record *rec = intel_guc_engine_usage(engine);
+	struct intel_engine_guc_stats *stats = &engine->stats.guc;
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	u32 last_switch = rec->last_switch_in_stamp;
+	u32 ctx_id = rec->current_context_index;
+	u32 total = rec->total_runtime;
+
+	lockdep_assert_held(&guc->timestamp.lock);
+
+	stats->running = ctx_id != ~0U && last_switch;
+	if (stats->running)
+		__extend_last_switch(guc, &stats->start_gt_clk, last_switch);
+
+	/*
+	 * Instead of adjusting the total for overflow, just add the
+	 * difference from previous sample stats->total_gt_clks
+	 */
+	if (total && total != ~0U) {
+		stats->total_gt_clks += (u32)(total - stats->prev_total);
+		stats->prev_total = total;
+	}
+}
+
+static void guc_update_pm_timestamp(struct intel_guc *guc)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	u32 gt_stamp_now, gt_stamp_hi;
+
+	lockdep_assert_held(&guc->timestamp.lock);
+
+	gt_stamp_hi = upper_32_bits(guc->timestamp.gt_stamp);
+	gt_stamp_now = intel_uncore_read(gt->uncore, GUCPMTIMESTAMP);
+
+	if (gt_stamp_now < lower_32_bits(guc->timestamp.gt_stamp))
+		gt_stamp_hi++;
+
+	guc->timestamp.gt_stamp = ((u64)gt_stamp_hi << 32) | gt_stamp_now;
+}
+
+/*
+ * Unlike the execlist mode of submission total and active times are in terms of
+ * gt clocks. The *now parameter is retained to return the cpu time at which the
+ * busyness was sampled.
+ */
+static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
+{
+	struct intel_engine_guc_stats *stats = &engine->stats.guc;
+	struct intel_gt *gt = engine->gt;
+	struct intel_guc *guc = &gt->uc.guc;
+	unsigned long flags;
+	bool reset_in_progress;
+	u64 total;
+	int srcu;
+
+	/*
+	 * If a reset is in progress, we risk reading partially updated
+	 * engine busyness from GuC, so we just use the driver stored
+	 * copy of busyness. Synchronize with gt reset lock to achieve
+	 * this.
+	 */
+	reset_in_progress = intel_gt_reset_trylock_no_wait(gt, &srcu);
+
+	/* 
+	 * The order of taking the reset lock first and then the
+	 * timestamp lock is intentional to avoid lock inversion related
+	 * issues.
+	 */
+	spin_lock_irqsave(&guc->timestamp.lock, flags);
+
+	*now = ktime_get();
+
+	/*
+	 * The active busyness depends on start_gt_clk and gt_stamp.
+	 * gt_stamp is updated by i915 only when gt is awake and the
+	 * start_gt_clk is derived from GuC state. To get a consistent
+	 * view of activity, we query the GuC state only if gt is awake.
+	 */
+	if (intel_gt_pm_get_if_awake(gt) && !reset_in_progress) {
+		guc_update_engine_gt_clks(engine);
+		guc_update_pm_timestamp(guc);
+		intel_gt_pm_put_async(gt);
+	}
+
+	total = intel_gt_clock_interval_to_ns(gt, stats->total_gt_clks);
+	if (stats->running) {
+		u64 clk = guc->timestamp.gt_stamp - stats->start_gt_clk;
+
+		total += intel_gt_clock_interval_to_ns(gt, clk);
+	}
+
+	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
+	if (!reset_in_progress)
+		intel_gt_reset_unlock(gt, srcu);
+
+	return ns_to_ktime(total);
+}
+
+static void __reset_guc_busyness_stats(struct intel_guc *guc)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+	unsigned long flags;
+
+	cancel_delayed_work_sync(&guc->timestamp.work);
+
+	spin_lock_irqsave(&guc->timestamp.lock, flags);
+
+	guc_update_pm_timestamp(guc);
+	for_each_engine(engine, gt, id) {
+		guc_update_engine_gt_clks(engine);
+		engine->stats.guc.prev_total = 0;
+	}
+
+	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
+}
+
+static void __update_guc_busyness_stats(struct intel_guc *guc)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	guc_update_pm_timestamp(guc);
+	for_each_engine(engine, gt, id)
+		guc_update_engine_gt_clks(engine);
+}
+
+static void guc_timestamp_ping(struct work_struct *wrk)
+{
+	struct intel_guc *guc = container_of(wrk, typeof(*guc),
+					     timestamp.work.work);
+	struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
+	struct intel_gt *gt = guc_to_gt(guc);
+	intel_wakeref_t wakeref;
+	unsigned long flags;
+	int srcu, ret;
+
+	/*
+	 * Synchronize with gt reset to make sure the worker does not
+	 * corrupt the engine/guc stats.
+	 */
+	ret = intel_gt_reset_trylock(gt, &srcu);
+	if (ret)
+		return;
+
+	spin_lock_irqsave(&guc->timestamp.lock, flags);
+
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
+		__update_guc_busyness_stats(guc);
+
+	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
+
+	intel_gt_reset_unlock(gt, srcu);
+
+	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
+			 guc->timestamp.ping_delay);
+}
+
+static int guc_action_enable_usage_stats(struct intel_guc *guc)
+{
+	u32 offset = intel_guc_engine_usage_offset(guc);
+	u32 action[] = {
+		INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF,
+		offset,
+		0,
+	};
+
+	return intel_guc_send(guc, action, ARRAY_SIZE(action));
+}
+
+static void guc_init_engine_stats(struct intel_guc *guc)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	intel_wakeref_t wakeref;
+
+	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
+			 guc->timestamp.ping_delay);
+
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
+		int ret = guc_action_enable_usage_stats(guc);
+
+		if (ret)
+			drm_err(&gt->i915->drm,
+				"Failed to enable usage stats: %d!\n", ret);
+	}
+}
+
+void intel_guc_busyness_park(struct intel_gt *gt)
+{
+	struct intel_guc *guc = &gt->uc.guc;
+	unsigned long flags;
+
+	cancel_delayed_work(&guc->timestamp.work);
+
+	spin_lock_irqsave(&guc->timestamp.lock, flags);
+	__update_guc_busyness_stats(guc);
+	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
+}
+
+void intel_guc_busyness_unpark(struct intel_gt *gt)
+{
+	struct intel_guc *guc = &gt->uc.guc;
+
+	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
+			 guc->timestamp.ping_delay);
+}
+
 static inline bool
 submission_disabled(struct intel_guc *guc)
 {
@@ -809,6 +1067,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	intel_gt_park_heartbeats(guc_to_gt(guc));
 	disable_submission(guc);
 	guc->interrupts.disable(guc);
+	__reset_guc_busyness_stats(guc);
 
 	/* Flush IRQ handler */
 	spin_lock_irq(&guc_to_gt(guc)->irq_lock);
@@ -1132,6 +1391,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
  */
 int intel_guc_submission_init(struct intel_guc *guc)
 {
+	struct intel_gt *gt = guc_to_gt(guc);
 	int ret;
 
 	if (guc->lrc_desc_pool)
@@ -1152,6 +1412,10 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->guc_id_list);
 	ida_init(&guc->guc_ids);
 
+	spin_lock_init(&guc->timestamp.lock);
+	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
+	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
+
 	return 0;
 }
 
@@ -2606,7 +2870,9 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 		engine->emit_flush = gen12_emit_flush_xcs;
 	}
 	engine->set_default_submission = guc_set_default_submission;
+	engine->busyness = guc_engine_busyness;
 
+	engine->flags |= I915_ENGINE_SUPPORTS_STATS;
 	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
 	engine->flags |= I915_ENGINE_HAS_TIMESLICES;
 
@@ -2705,6 +2971,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 void intel_guc_submission_enable(struct intel_guc *guc)
 {
 	guc_init_lrc_mapping(guc);
+	guc_init_engine_stats(guc);
 }
 
 void intel_guc_submission_disable(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index c7ef44fa0c36..5a95a9f0a8e3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -28,6 +28,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
 				    struct i915_request *hung_rq,
 				    struct drm_printer *m);
+void intel_guc_busyness_park(struct intel_gt *gt);
+void intel_guc_busyness_unpark(struct intel_gt *gt);
 
 bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index a897f4abea0c..9aee08425382 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2664,6 +2664,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define   RING_WAIT		(1 << 11) /* gen3+, PRBx_CTL */
 #define   RING_WAIT_SEMAPHORE	(1 << 10) /* gen6+ */
 
+#define GUCPMTIMESTAMP          _MMIO(0xC3E8)
+
 /* There are 16 64-bit CS General Purpose Registers per-engine on Gen8+ */
 #define GEN8_RING_CS_GPR(base, n)	_MMIO((base) + 0x600 + (n) * 8)
 #define GEN8_RING_CS_GPR_UDW(base, n)	_MMIO((base) + 0x600 + (n) * 8 + 4)
-- 
2.20.1

