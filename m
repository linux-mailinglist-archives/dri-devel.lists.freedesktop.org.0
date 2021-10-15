Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02242FF00
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 01:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A9B6E3F9;
	Fri, 15 Oct 2021 23:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1B36E3F9;
 Fri, 15 Oct 2021 23:47:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="208119185"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="208119185"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 16:47:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="481876928"
Received: from orsosgc001.jf.intel.com ([10.165.21.154])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 16:47:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: john.c.harrison@intel.com, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 daniel.vetter@ffwll.ch, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/i915/pmu: Add a name to the execlists stats
Date: Fri, 15 Oct 2021 16:47:04 -0700
Message-Id: <20211015234705.12392-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
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

In preparation for GuC pmu stats, add a name to the execlists stats
structure so that it can be differentiated from the GuC stats.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 14 +++---
 drivers/gpu/drm/i915/gt/intel_engine_stats.h | 33 +++++++------
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 52 +++++++++++---------
 3 files changed, 53 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 2ae57e4656a3..38436f4b5706 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -361,7 +361,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 		DRIVER_CAPS(i915)->has_logical_contexts = true;
 
 	ewma__engine_latency_init(&engine->latency);
-	seqcount_init(&engine->stats.lock);
+	seqcount_init(&engine->stats.execlists.lock);
 
 	ATOMIC_INIT_NOTIFIER_HEAD(&engine->context_status_notifier);
 
@@ -1876,15 +1876,16 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 static ktime_t __intel_engine_get_busy_time(struct intel_engine_cs *engine,
 					    ktime_t *now)
 {
-	ktime_t total = engine->stats.total;
+	struct intel_engine_execlists_stats *stats = &engine->stats.execlists;
+	ktime_t total = stats->total;
 
 	/*
 	 * If the engine is executing something at the moment
 	 * add it to the total.
 	 */
 	*now = ktime_get();
-	if (READ_ONCE(engine->stats.active))
-		total = ktime_add(total, ktime_sub(*now, engine->stats.start));
+	if (READ_ONCE(stats->active))
+		total = ktime_add(total, ktime_sub(*now, stats->start));
 
 	return total;
 }
@@ -1898,13 +1899,14 @@ static ktime_t __intel_engine_get_busy_time(struct intel_engine_cs *engine,
  */
 ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
 {
+	struct intel_engine_execlists_stats *stats = &engine->stats.execlists;
 	unsigned int seq;
 	ktime_t total;
 
 	do {
-		seq = read_seqcount_begin(&engine->stats.lock);
+		seq = read_seqcount_begin(&stats->lock);
 		total = __intel_engine_get_busy_time(engine, now);
-	} while (read_seqcount_retry(&engine->stats.lock, seq));
+	} while (read_seqcount_retry(&stats->lock, seq));
 
 	return total;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_stats.h b/drivers/gpu/drm/i915/gt/intel_engine_stats.h
index 24fbdd94351a..8e762d683e50 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_stats.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_stats.h
@@ -15,45 +15,46 @@
 
 static inline void intel_engine_context_in(struct intel_engine_cs *engine)
 {
+	struct intel_engine_execlists_stats *stats = &engine->stats.execlists;
 	unsigned long flags;
 
-	if (engine->stats.active) {
-		engine->stats.active++;
+	if (stats->active) {
+		stats->active++;
 		return;
 	}
 
 	/* The writer is serialised; but the pmu reader may be from hardirq */
 	local_irq_save(flags);
-	write_seqcount_begin(&engine->stats.lock);
+	write_seqcount_begin(&stats->lock);
 
-	engine->stats.start = ktime_get();
-	engine->stats.active++;
+	stats->start = ktime_get();
+	stats->active++;
 
-	write_seqcount_end(&engine->stats.lock);
+	write_seqcount_end(&stats->lock);
 	local_irq_restore(flags);
 
-	GEM_BUG_ON(!engine->stats.active);
+	GEM_BUG_ON(!stats->active);
 }
 
 static inline void intel_engine_context_out(struct intel_engine_cs *engine)
 {
+	struct intel_engine_execlists_stats *stats = &engine->stats.execlists;
 	unsigned long flags;
 
-	GEM_BUG_ON(!engine->stats.active);
-	if (engine->stats.active > 1) {
-		engine->stats.active--;
+	GEM_BUG_ON(!stats->active);
+	if (stats->active > 1) {
+		stats->active--;
 		return;
 	}
 
 	local_irq_save(flags);
-	write_seqcount_begin(&engine->stats.lock);
+	write_seqcount_begin(&stats->lock);
 
-	engine->stats.active--;
-	engine->stats.total =
-		ktime_add(engine->stats.total,
-			  ktime_sub(ktime_get(), engine->stats.start));
+	stats->active--;
+	stats->total = ktime_add(stats->total,
+				 ktime_sub(ktime_get(), stats->start));
 
-	write_seqcount_end(&engine->stats.lock);
+	write_seqcount_end(&stats->lock);
 	local_irq_restore(flags);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 9167ce52487c..b820a2c1124e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -257,6 +257,33 @@ struct intel_engine_execlists {
 
 #define INTEL_ENGINE_CS_MAX_NAME 8
 
+struct intel_engine_execlists_stats {
+	/**
+	 * @active: Number of contexts currently scheduled in.
+	 */
+	unsigned int active;
+
+	/**
+	 * @lock: Lock protecting the below fields.
+	 */
+	seqcount_t lock;
+
+	/**
+	 * @total: Total time this engine was busy.
+	 *
+	 * Accumulated time not counting the most recent block in cases where
+	 * engine is currently busy (active > 0).
+	 */
+	ktime_t total;
+
+	/**
+	 * @start: Timestamp of the last idle to active transition.
+	 *
+	 * Idle is defined as active == 0, active is active > 0.
+	 */
+	ktime_t start;
+};
+
 struct intel_engine_cs {
 	struct drm_i915_private *i915;
 	struct intel_gt *gt;
@@ -481,30 +508,7 @@ struct intel_engine_cs {
 	u32 (*get_cmd_length_mask)(u32 cmd_header);
 
 	struct {
-		/**
-		 * @active: Number of contexts currently scheduled in.
-		 */
-		unsigned int active;
-
-		/**
-		 * @lock: Lock protecting the below fields.
-		 */
-		seqcount_t lock;
-
-		/**
-		 * @total: Total time this engine was busy.
-		 *
-		 * Accumulated time not counting the most recent block in cases
-		 * where engine is currently busy (active > 0).
-		 */
-		ktime_t total;
-
-		/**
-		 * @start: Timestamp of the last idle to active transition.
-		 *
-		 * Idle is defined as active == 0, active is active > 0.
-		 */
-		ktime_t start;
+		struct intel_engine_execlists_stats execlists;
 
 		/**
 		 * @rps: Utilisation at last RPS sampling.
-- 
2.20.1

