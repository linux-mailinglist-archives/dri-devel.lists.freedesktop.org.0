Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771617ABBB7
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 00:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AAD10E71F;
	Fri, 22 Sep 2023 22:26:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB54F10E71C;
 Fri, 22 Sep 2023 22:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695421568; x=1726957568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LCANBnjaAoswsUKUrwhcqiP8H4hnrjumTy0L9PFJxYw=;
 b=lnphG5q8NWMNGBnVrRPtNoz/TYemh3wayQQfdx4P8zyvYPwDMIvjliM6
 0sc+k+QLi9ejxtrA+JeDt5xUwmJ7PGF5EYc2KuJuqw3q8kFIPEjVEbq7g
 q9Vm4ruXcOKGQGHjxR/4xdR4eS7cPvaDMZ+yBAI1sK4ppQATU7RfHuJfi
 7bmEFaPtkQMHbHfQggyKQDD6/cnMYg/cdQa0AcU12zcEflt6RZ/nF4Ihf
 ZcaGdsWxfRku1A76PM0INp9/y4eO18XsZ+TIFV7I6PJa97CP4nvKqxI0K
 A+OOqEThjTDbJrMIdf7xGaPKUBdlfn9VZc8Xt5E7B1KYnG+xL0GwsDlX6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="379836616"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="379836616"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 15:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078549552"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="1078549552"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2023 15:25:56 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/3] drm/i915/guc: Support new and improved engine busyness
Date: Fri, 22 Sep 2023 15:25:08 -0700
Message-ID: <20230922222510.2235213-2-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The GuC has been extended to support a much more friendly engine
busyness interface. So partition the old interface into a 'busy_v1'
space and add 'busy_v2' support alongside. And if v2 is available, use
that in preference to v1. Note that v2 provides extra features over
and above v1 which will be exposed via PMU in subsequent patches.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   4 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  82 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  55 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  23 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 381 ++++++++++++++----
 7 files changed, 427 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index a7e6775980043..40fd8f984d64b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -323,7 +323,7 @@ struct intel_engine_execlists_stats {
 	ktime_t start;
 };
 
-struct intel_engine_guc_stats {
+struct intel_engine_guc_stats_v1 {
 	/**
 	 * @running: Active state of the engine when busyness was last sampled.
 	 */
@@ -603,7 +603,7 @@ struct intel_engine_cs {
 	struct {
 		union {
 			struct intel_engine_execlists_stats execlists;
-			struct intel_engine_guc_stats guc;
+			struct intel_engine_guc_stats_v1 guc_v1;
 		};
 
 		/**
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index f359bef046e0b..c190a99a36c38 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -137,7 +137,9 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
 	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
 	INTEL_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
-	INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
+	INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF_V1 = 0x550A,
+	INTEL_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION_V2 = 0x550C,
+	INTEL_GUC_ACTION_SET_FUNCTION_ENGINE_UTILIZATION_V2 = 0x550D,
 	INTEL_GUC_ACTION_STATE_CAPTURE_NOTIFICATION = 0x8002,
 	INTEL_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
 	INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 6c392bad29c19..e6502ab5f049f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -226,45 +226,61 @@ struct intel_guc {
 	struct mutex send_mutex;
 
 	/**
-	 * @timestamp: GT timestamp object that stores a copy of the timestamp
-	 * and adjusts it for overflow using a worker.
+	 * @busy: Data used by the different versions of engine busyness implementations.
 	 */
-	struct {
-		/**
-		 * @lock: Lock protecting the below fields and the engine stats.
-		 */
-		spinlock_t lock;
-
-		/**
-		 * @gt_stamp: 64 bit extended value of the GT timestamp.
-		 */
-		u64 gt_stamp;
-
-		/**
-		 * @ping_delay: Period for polling the GT timestamp for
-		 * overflow.
-		 */
-		unsigned long ping_delay;
-
-		/**
-		 * @work: Periodic work to adjust GT timestamp, engine and
-		 * context usage for overflows.
-		 */
-		struct delayed_work work;
-
+	union {
 		/**
-		 * @shift: Right shift value for the gpm timestamp
+		 * @v1: Data used by v1 engine busyness implementation. Mostly a copy
+		 * of the GT timestamp extended to 64 bits and the worker for maintaining it.
 		 */
-		u32 shift;
+		struct {
+			/**
+			 * @lock: Lock protecting the below fields and the engine stats.
+			 */
+			spinlock_t lock;
+
+			/**
+			 * @gt_stamp: 64 bit extended value of the GT timestamp.
+			 */
+			u64 gt_stamp;
+
+			/**
+			 * @ping_delay: Period for polling the GT timestamp for
+			 * overflow.
+			 */
+			unsigned long ping_delay;
+
+			/**
+			 * @work: Periodic work to adjust GT timestamp, engine and
+			 * context usage for overflows.
+			 */
+			struct delayed_work work;
+
+			/**
+			 * @shift: Right shift value for the gpm timestamp
+			 */
+			u32 shift;
+
+			/**
+			 * @last_stat_jiffies: jiffies at last actual stats collection time
+			 * We use this timestamp to ensure we don't oversample the
+			 * stats because runtime power management events can trigger
+			 * stats collection at much higher rates than required.
+			 */
+			unsigned long last_stat_jiffies;
+		} v1;
 
 		/**
-		 * @last_stat_jiffies: jiffies at last actual stats collection time
-		 * We use this timestamp to ensure we don't oversample the
-		 * stats because runtime power management events can trigger
-		 * stats collection at much higher rates than required.
+		 * @v2: Data used by v2 engine busyness implementation - a memory object
+		 * that is filled in by the GuC and read by the driver.
 		 */
-		unsigned long last_stat_jiffies;
-	} timestamp;
+		struct {
+			/** @device_vma: object allocated to hold the device level busyness data */
+			struct i915_vma *device_vma;
+			/** @device_map: access object for @device_vma */
+			struct iosys_map device_map;
+		} v2;
+	} busy;
 
 	/**
 	 * @dead_guc_worker: Asynchronous worker thread for forcing a GuC reset.
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 63724e17829a7..1ce595d6816f7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -59,7 +59,10 @@ struct __guc_ads_blob {
 	struct guc_ads ads;
 	struct guc_policies policies;
 	struct guc_gt_system_info system_info;
-	struct guc_engine_usage engine_usage;
+	union {
+		struct guc_engine_usage v1;
+		struct guc_function_observation_data v2;
+	} engine_usage;
 	/* From here on, location is dynamic! Refer to above diagram. */
 	struct guc_mmio_reg regset[];
 } __packed;
@@ -948,18 +951,62 @@ void intel_guc_ads_reset(struct intel_guc *guc)
 	guc_ads_private_data_reset(guc);
 }
 
-u32 intel_guc_engine_usage_offset(struct intel_guc *guc)
+u32 intel_guc_engine_usage_offset_pf(struct intel_guc *guc)
 {
 	return intel_guc_ggtt_offset(guc, guc->ads_vma) +
 		offsetof(struct __guc_ads_blob, engine_usage);
 }
 
-struct iosys_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine)
+struct iosys_map intel_guc_engine_usage_record_map_v1(struct intel_engine_cs *engine)
 {
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	u8 guc_class = engine_class_to_guc_class(engine->class);
 	size_t offset = offsetof(struct __guc_ads_blob,
-				 engine_usage.engines[guc_class][ilog2(engine->logical_mask)]);
+				 engine_usage.v1.engines[guc_class][ilog2(engine->logical_mask)]);
 
 	return IOSYS_MAP_INIT_OFFSET(&guc->ads_map, offset);
 }
+
+int intel_guc_engine_usage_record_map_v2(struct intel_guc *guc,
+					 struct intel_engine_cs *engine,
+					 u32 guc_vf,
+					 struct iosys_map *engine_map,
+					 struct iosys_map *global_map)
+{
+	size_t offset_global, offset_engine;
+	struct iosys_map *map;
+	u32 instance;
+	u8 guc_class;
+
+	if (engine) {
+		guc_class = engine_class_to_guc_class(engine->class);
+		instance = ilog2(engine->logical_mask);
+	}
+
+	if (guc_vf >= GUC_MAX_VF_COUNT) {
+		if (guc_vf != ~0U) {
+			guc_err(guc, "Out of range VF in busyness query: 0x%X\n", guc_vf);
+			return -EINVAL;
+		}
+
+		map = &guc->busy.v2.device_map;
+		offset_global = 0;
+
+		if (engine)
+			offset_engine = offsetof(struct guc_engine_observation_data,
+						 engine_data[guc_class][instance]);
+	} else {
+		map = &guc->ads_map;
+		offset_global = offsetof(struct __guc_ads_blob,
+					 engine_usage.v2.function_data[guc_vf]);
+		if (engine)
+			offset_engine = offsetof(struct __guc_ads_blob,
+						 engine_usage.v2.function_data[guc_vf].engine_data[guc_class][instance]);
+	}
+
+	*global_map = IOSYS_MAP_INIT_OFFSET(map, offset_global);
+	if (engine)
+		*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset_engine);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
index 1c64f4d6ea21e..75c9916c96ed4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
@@ -19,7 +19,12 @@ void intel_guc_ads_init_late(struct intel_guc *guc);
 void intel_guc_ads_reset(struct intel_guc *guc);
 void intel_guc_ads_print_policy_info(struct intel_guc *guc,
 				     struct drm_printer *p);
-struct iosys_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine);
-u32 intel_guc_engine_usage_offset(struct intel_guc *guc);
+struct iosys_map intel_guc_engine_usage_record_map_v1(struct intel_engine_cs *engine);
+int intel_guc_engine_usage_record_map_v2(struct intel_guc *guc,
+					 struct intel_engine_cs *engine,
+					 u32 vf_idx,
+					 struct iosys_map *engine_map,
+					 struct iosys_map *global_map);
+u32 intel_guc_engine_usage_offset_pf(struct intel_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index b4d56eccfb1f0..91bbda8cf5370 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -44,9 +44,12 @@
 #define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
+#define GUC_MAX_OAG_COUNTERS		8
 
 #define GUC_DOORBELL_INVALID		256
 
+#define GUC_MAX_VF_COUNT		64
+
 /*
  * Work queue item header definitions
  *
@@ -431,7 +434,7 @@ struct guc_ads {
 	u32 reserved[14];
 } __packed;
 
-/* Engine usage stats */
+/* Engine usage stats - v1 */
 struct guc_engine_usage_record {
 	u32 current_context_index;
 	u32 last_switch_in_stamp;
@@ -444,6 +447,24 @@ struct guc_engine_usage {
 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
 } __packed;
 
+/* Engine usage stats - v2 */
+struct guc_engine_data {
+	u64 total_execution_ticks;
+	u64 reserved;
+} __packed;
+
+struct guc_engine_observation_data {
+	struct guc_engine_data engine_data[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
+	u64 oag_busy_data[GUC_MAX_OAG_COUNTERS];
+	u64 total_active_ticks;
+	u64 gt_timestamp;
+	u64 reserved1;
+} __packed;
+
+struct guc_function_observation_data {
+	struct guc_engine_observation_data function_data[GUC_MAX_VF_COUNT];
+} __packed;
+
 /* GuC logging structures */
 
 enum guc_log_buffer_type {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index cabdc645fcddb..88465d701c278 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1139,7 +1139,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 }
 
 /*
- * GuC stores busyness stats for each engine at context in/out boundaries. A
+ * GuC < 70.11.1 stores busyness stats for each engine at context in/out boundaries. A
  * context 'in' logs execution start time, 'out' adds in -> out delta to total.
  * i915/kmd accesses 'start', 'total' and 'context id' from memory shared with
  * GuC.
@@ -1161,23 +1161,23 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
  * 27 seconds for a gt clock frequency of 19.2 MHz).
  */
 
-#define WRAP_TIME_CLKS U32_MAX
-#define POLL_TIME_CLKS (WRAP_TIME_CLKS >> 3)
+#define BUSY_V1_WRAP_TIME_CLKS U32_MAX
+#define BUSY_V1_POLL_TIME_CLKS (BUSY_V1_WRAP_TIME_CLKS >> 3)
 
 static void
-__extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
+__busy_v1_extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
 {
-	u32 gt_stamp_hi = upper_32_bits(guc->timestamp.gt_stamp);
-	u32 gt_stamp_last = lower_32_bits(guc->timestamp.gt_stamp);
+	u32 gt_stamp_hi = upper_32_bits(guc->busy.v1.gt_stamp);
+	u32 gt_stamp_last = lower_32_bits(guc->busy.v1.gt_stamp);
 
 	if (new_start == lower_32_bits(*prev_start))
 		return;
 
 	/*
 	 * When gt is unparked, we update the gt timestamp and start the ping
-	 * worker that updates the gt_stamp every POLL_TIME_CLKS. As long as gt
+	 * worker that updates the gt_stamp every BUSY_V1_POLL_TIME_CLKS. As long as gt
 	 * is unparked, all switched in contexts will have a start time that is
-	 * within +/- POLL_TIME_CLKS of the most recent gt_stamp.
+	 * within +/- BUSY_V1_POLL_TIME_CLKS of the most recent gt_stamp.
 	 *
 	 * If neither gt_stamp nor new_start has rolled over, then the
 	 * gt_stamp_hi does not need to be adjusted, however if one of them has
@@ -1187,19 +1187,16 @@ __extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
 	 * gt_stamp_last rollover respectively.
 	 */
 	if (new_start < gt_stamp_last &&
-	    (new_start - gt_stamp_last) <= POLL_TIME_CLKS)
+	    (new_start - gt_stamp_last) <= BUSY_V1_POLL_TIME_CLKS)
 		gt_stamp_hi++;
 
 	if (new_start > gt_stamp_last &&
-	    (gt_stamp_last - new_start) <= POLL_TIME_CLKS && gt_stamp_hi)
+	    (gt_stamp_last - new_start) <= BUSY_V1_POLL_TIME_CLKS && gt_stamp_hi)
 		gt_stamp_hi--;
 
 	*prev_start = ((u64)gt_stamp_hi << 32) | new_start;
 }
 
-#define record_read(map_, field_) \
-	iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
-
 /*
  * GuC updates shared memory and KMD reads it. Since this is not synchronized,
  * we run into a race where the value read is inconsistent. Sometimes the
@@ -1211,12 +1208,15 @@ __extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
  * values. The upper bound is set to 6 attempts and may need to be tuned as per
  * any new occurences.
  */
-static void __get_engine_usage_record(struct intel_engine_cs *engine,
-				      u32 *last_in, u32 *id, u32 *total)
+static void __busy_v1_get_engine_usage_record(struct intel_engine_cs *engine,
+					      u32 *last_in, u32 *id, u32 *total)
 {
-	struct iosys_map rec_map = intel_guc_engine_usage_record_map(engine);
+	struct iosys_map rec_map = intel_guc_engine_usage_record_map_v1(engine);
 	int i = 0;
 
+#define record_read(map_, field_) \
+	iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
+
 	do {
 		*last_in = record_read(&rec_map, last_switch_in_stamp);
 		*id = record_read(&rec_map, current_context_index);
@@ -1227,21 +1227,23 @@ static void __get_engine_usage_record(struct intel_engine_cs *engine,
 		    record_read(&rec_map, total_runtime) == *total)
 			break;
 	} while (++i < 6);
+
+#undef record_read
 }
 
-static void guc_update_engine_gt_clks(struct intel_engine_cs *engine)
+static void busy_v1_guc_update_engine_gt_clks(struct intel_engine_cs *engine)
 {
-	struct intel_engine_guc_stats *stats = &engine->stats.guc;
+	struct intel_engine_guc_stats_v1 *stats = &engine->stats.guc_v1;
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	u32 last_switch, ctx_id, total;
 
-	lockdep_assert_held(&guc->timestamp.lock);
+	lockdep_assert_held(&guc->busy.v1.lock);
 
-	__get_engine_usage_record(engine, &last_switch, &ctx_id, &total);
+	__busy_v1_get_engine_usage_record(engine, &last_switch, &ctx_id, &total);
 
 	stats->running = ctx_id != ~0U && last_switch;
 	if (stats->running)
-		__extend_last_switch(guc, &stats->start_gt_clk, last_switch);
+		__busy_v1_extend_last_switch(guc, &stats->start_gt_clk, last_switch);
 
 	/*
 	 * Instead of adjusting the total for overflow, just add the
@@ -1253,7 +1255,7 @@ static void guc_update_engine_gt_clks(struct intel_engine_cs *engine)
 	}
 }
 
-static u32 gpm_timestamp_shift(struct intel_gt *gt)
+static u32 busy_v1_gpm_timestamp_shift(struct intel_gt *gt)
 {
 	intel_wakeref_t wakeref;
 	u32 reg, shift;
@@ -1267,24 +1269,24 @@ static u32 gpm_timestamp_shift(struct intel_gt *gt)
 	return 3 - shift;
 }
 
-static void guc_update_pm_timestamp(struct intel_guc *guc, ktime_t *now)
+static void busy_v1_guc_update_pm_timestamp(struct intel_guc *guc, ktime_t *now)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	u32 gt_stamp_lo, gt_stamp_hi;
 	u64 gpm_ts;
 
-	lockdep_assert_held(&guc->timestamp.lock);
+	lockdep_assert_held(&guc->busy.v1.lock);
 
-	gt_stamp_hi = upper_32_bits(guc->timestamp.gt_stamp);
+	gt_stamp_hi = upper_32_bits(guc->busy.v1.gt_stamp);
 	gpm_ts = intel_uncore_read64_2x32(gt->uncore, MISC_STATUS0,
-					  MISC_STATUS1) >> guc->timestamp.shift;
+					  MISC_STATUS1) >> guc->busy.v1.shift;
 	gt_stamp_lo = lower_32_bits(gpm_ts);
 	*now = ktime_get();
 
-	if (gt_stamp_lo < lower_32_bits(guc->timestamp.gt_stamp))
+	if (gt_stamp_lo < lower_32_bits(guc->busy.v1.gt_stamp))
 		gt_stamp_hi++;
 
-	guc->timestamp.gt_stamp = ((u64)gt_stamp_hi << 32) | gt_stamp_lo;
+	guc->busy.v1.gt_stamp = ((u64)gt_stamp_hi << 32) | gt_stamp_lo;
 }
 
 /*
@@ -1292,9 +1294,9 @@ static void guc_update_pm_timestamp(struct intel_guc *guc, ktime_t *now)
  * gt clocks. The *now parameter is retained to return the cpu time at which the
  * busyness was sampled.
  */
-static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
+static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 {
-	struct intel_engine_guc_stats stats_saved, *stats = &engine->stats.guc;
+	struct intel_engine_guc_stats_v1 stats_saved, *stats = &engine->stats.guc_v1;
 	struct i915_gpu_error *gpu_error = &engine->i915->gpu_error;
 	struct intel_gt *gt = engine->gt;
 	struct intel_guc *guc = &gt->uc.guc;
@@ -1303,7 +1305,7 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 	u32 reset_count;
 	bool in_reset;
 
-	spin_lock_irqsave(&guc->timestamp.lock, flags);
+	spin_lock_irqsave(&guc->busy.v1.lock, flags);
 
 	/*
 	 * If a reset happened, we risk reading partially updated engine
@@ -1326,43 +1328,43 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 	 */
 	if (!in_reset && intel_gt_pm_get_if_awake(gt)) {
 		stats_saved = *stats;
-		gt_stamp_saved = guc->timestamp.gt_stamp;
+		gt_stamp_saved = guc->busy.v1.gt_stamp;
 		/*
 		 * Update gt_clks, then gt timestamp to simplify the 'gt_stamp -
 		 * start_gt_clk' calculation below for active engines.
 		 */
-		guc_update_engine_gt_clks(engine);
-		guc_update_pm_timestamp(guc, now);
+		busy_v1_guc_update_engine_gt_clks(engine);
+		busy_v1_guc_update_pm_timestamp(guc, now);
 		intel_gt_pm_put_async(gt);
 		if (i915_reset_count(gpu_error) != reset_count) {
 			*stats = stats_saved;
-			guc->timestamp.gt_stamp = gt_stamp_saved;
+			guc->busy.v1.gt_stamp = gt_stamp_saved;
 		}
 	}
 
 	total = intel_gt_clock_interval_to_ns(gt, stats->total_gt_clks);
 	if (stats->running) {
-		u64 clk = guc->timestamp.gt_stamp - stats->start_gt_clk;
+		u64 clk = guc->busy.v1.gt_stamp - stats->start_gt_clk;
 
 		total += intel_gt_clock_interval_to_ns(gt, clk);
 	}
 
-	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
+	spin_unlock_irqrestore(&guc->busy.v1.lock, flags);
 
 	return ns_to_ktime(total);
 }
 
-static void guc_enable_busyness_worker(struct intel_guc *guc)
+static void busy_v1_guc_enable_worker(struct intel_guc *guc)
 {
-	mod_delayed_work(system_highpri_wq, &guc->timestamp.work, guc->timestamp.ping_delay);
+	mod_delayed_work(system_highpri_wq, &guc->busy.v1.work, guc->busy.v1.ping_delay);
 }
 
-static void guc_cancel_busyness_worker(struct intel_guc *guc)
+static void busy_v1_guc_cancel_worker(struct intel_guc *guc)
 {
-	cancel_delayed_work_sync(&guc->timestamp.work);
+	cancel_delayed_work_sync(&guc->busy.v1.work);
 }
 
-static void __reset_guc_busyness_stats(struct intel_guc *guc)
+static void __busy_v1_reset_guc_busyness_stats(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_engine_cs *engine;
@@ -1370,20 +1372,20 @@ static void __reset_guc_busyness_stats(struct intel_guc *guc)
 	unsigned long flags;
 	ktime_t unused;
 
-	guc_cancel_busyness_worker(guc);
+	busy_v1_guc_cancel_worker(guc);
 
-	spin_lock_irqsave(&guc->timestamp.lock, flags);
+	spin_lock_irqsave(&guc->busy.v1.lock, flags);
 
-	guc_update_pm_timestamp(guc, &unused);
+	busy_v1_guc_update_pm_timestamp(guc, &unused);
 	for_each_engine(engine, gt, id) {
-		guc_update_engine_gt_clks(engine);
-		engine->stats.guc.prev_total = 0;
+		busy_v1_guc_update_engine_gt_clks(engine);
+		engine->stats.guc_v1.prev_total = 0;
 	}
 
-	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
+	spin_unlock_irqrestore(&guc->busy.v1.lock, flags);
 }
 
-static void __update_guc_busyness_stats(struct intel_guc *guc)
+static void __busy_v1_update_guc_busyness_stats(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_engine_cs *engine;
@@ -1391,25 +1393,34 @@ static void __update_guc_busyness_stats(struct intel_guc *guc)
 	unsigned long flags;
 	ktime_t unused;
 
-	guc->timestamp.last_stat_jiffies = jiffies;
+	guc->busy.v1.last_stat_jiffies = jiffies;
 
-	spin_lock_irqsave(&guc->timestamp.lock, flags);
+	spin_lock_irqsave(&guc->busy.v1.lock, flags);
 
-	guc_update_pm_timestamp(guc, &unused);
+	busy_v1_guc_update_pm_timestamp(guc, &unused);
 	for_each_engine(engine, gt, id)
-		guc_update_engine_gt_clks(engine);
+		busy_v1_guc_update_engine_gt_clks(engine);
 
-	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
+	spin_unlock_irqrestore(&guc->busy.v1.lock, flags);
 }
 
-static void __guc_context_update_stats(struct intel_context *ce)
+static void __busy_v1_guc_context_update_stats(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 	unsigned long flags;
 
-	spin_lock_irqsave(&guc->timestamp.lock, flags);
+	spin_lock_irqsave(&guc->busy.v1.lock, flags);
+	lrc_update_runtime(ce);
+	spin_unlock_irqrestore(&guc->busy.v1.lock, flags);
+}
+
+static void __busy_v2_guc_context_update_stats(struct intel_context *ce)
+{
+	/*
+	 * Need to ping periodically?
+	 * Won't work for long running though, because relies on a context switch?!
+	 */
 	lrc_update_runtime(ce);
-	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
 }
 
 static void guc_context_update_stats(struct intel_context *ce)
@@ -1417,14 +1428,18 @@ static void guc_context_update_stats(struct intel_context *ce)
 	if (!intel_context_pin_if_active(ce))
 		return;
 
-	__guc_context_update_stats(ce);
+	if (GUC_SUBMIT_VER(ce_to_guc(ce)) < MAKE_GUC_VER(1, 3, 1))
+		__busy_v1_guc_context_update_stats(ce);
+	else
+		__busy_v2_guc_context_update_stats(ce);
+
 	intel_context_unpin(ce);
 }
 
-static void guc_timestamp_ping(struct work_struct *wrk)
+static void busy_v1_guc_timestamp_ping(struct work_struct *wrk)
 {
 	struct intel_guc *guc = container_of(wrk, typeof(*guc),
-					     timestamp.work.work);
+					     busy.v1.work.work);
 	struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_context *ce;
@@ -1443,7 +1458,7 @@ static void guc_timestamp_ping(struct work_struct *wrk)
 		return;
 
 	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
-		__update_guc_busyness_stats(guc);
+		__busy_v1_update_guc_busyness_stats(guc);
 
 	/* adjust context stats for overflow */
 	xa_for_each(&guc->context_lookup, index, ce)
@@ -1451,14 +1466,164 @@ static void guc_timestamp_ping(struct work_struct *wrk)
 
 	intel_gt_reset_unlock(gt, srcu);
 
-	guc_enable_busyness_worker(guc);
+	busy_v1_guc_enable_worker(guc);
 }
 
-static int guc_action_enable_usage_stats(struct intel_guc *guc)
+static int busy_v1_guc_action_enable_usage_stats(struct intel_guc *guc)
 {
-	u32 offset = intel_guc_engine_usage_offset(guc);
+	u32 offset = intel_guc_engine_usage_offset_pf(guc);
 	u32 action[] = {
-		INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF,
+		INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF_V1,
+		offset,
+		0,
+	};
+
+	return intel_guc_send(guc, action, ARRAY_SIZE(action));
+}
+
+/*
+ * GuC >= 70.11.1 maintains busyness counters in a shared memory buffer for each
+ * engine on a continuous basis. The counters are all 64bits and count in clock
+ * ticks. The values are updated on context switch events and periodically on a
+ * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but
+ * with the caveat that GuC is not a real-time OS so best effort only).
+ *
+ * In addition to an engine active time count, there is also a total time count.
+ * For native, this is only a free-running GT timestamp counter. For PF/VF,
+ * there is also a function active counter - how many ticks the VF or PF has had
+ * available for execution.
+ *
+ * Note that the counters should only be used as ratios of each other for
+ * a calculating a percentage. No guarantees are made about frequencies for
+ * conversions to wall time, etc.
+ *
+ * ticks_engine:   clock ticks for which engine was active
+ * ticks_function: clock ticks owned by this VF
+ * ticks_gt:       total clock ticks
+ *
+ * native engine busyness: ticks_engine / ticks_gt
+ * VF/PF engine busyness:  ticks_engine / ticks_function
+ * VF/PF engine ownership: ticks_function / ticks_gt
+ */
+
+static u32 guc_engine_usage_offset_v2_device(struct intel_guc *guc)
+{
+	return intel_guc_ggtt_offset(guc, guc->busy.v2.device_vma);
+}
+
+static int guc_busy_v2_alloc_device(struct intel_guc *guc)
+{
+	size_t size = sizeof(struct guc_engine_observation_data);
+	void *busy_v2_ptr;
+	int ret;
+
+	/*
+	 * When I915_WA_FORCE_SMEM_OBJECT is enabled we normally create objects
+	 * in SMEM but guc_ads is not accessed by the host and it has
+	 * requirement that physical pages are contiguous in memory for this
+	 * vma. Hence always create guc_ads object in LMEM.
+	 */
+	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->busy.v2.device_vma, &busy_v2_ptr);
+	if (ret)
+		return ret;
+
+	if (i915_gem_object_is_lmem(guc->busy.v2.device_vma->obj))
+		iosys_map_set_vaddr_iomem(&guc->busy.v2.device_map, (void __iomem *)busy_v2_ptr);
+	else
+		iosys_map_set_vaddr(&guc->busy.v2.device_map, busy_v2_ptr);
+
+	return 0;
+}
+
+static void guc_busy_v2_free_device(struct intel_guc *guc)
+{
+	i915_vma_unpin_and_release(&guc->busy.v2.device_vma, I915_VMA_RELEASE_MAP);
+	iosys_map_clear(&guc->busy.v2.device_map);
+
+	guc->busy.v2.device_vma = NULL;
+}
+
+static void __busy_v2_get_engine_usage_record(struct intel_guc *guc,
+					      struct intel_engine_cs *engine,
+					      u64 *_ticks_engine, u64 *_ticks_function,
+					      u64 *_ticks_gt)
+{
+	struct iosys_map rec_map_engine, rec_map_global;
+	u64 ticks_engine, ticks_function, ticks_gt;
+	int i = 0, ret;
+
+	ret = intel_guc_engine_usage_record_map_v2(guc, engine, ~0U,
+						   &rec_map_engine, &rec_map_global);
+	if (ret) {
+		ticks_engine = 0;
+		ticks_function = 0;
+		ticks_gt = 0;
+		goto done;
+	}
+
+#define record_read_engine(map_, field_) \
+	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
+#define record_read_global(map_, field_) \
+	iosys_map_rd_field(map_, 0, struct guc_engine_observation_data, field_)
+
+	do {
+		if (engine)
+			ticks_engine = record_read_engine(&rec_map_engine, total_execution_ticks);
+		ticks_function = record_read_global(&rec_map_global, total_active_ticks);
+		ticks_gt = record_read_global(&rec_map_global, gt_timestamp);
+
+		if (engine && (record_read_engine(&rec_map_engine, total_execution_ticks) !=
+			       ticks_engine))
+			continue;
+
+		if (record_read_global(&rec_map_global, total_active_ticks) == ticks_function &&
+		    record_read_global(&rec_map_global, gt_timestamp) == ticks_gt)
+			break;
+	} while (++i < 6);
+
+#undef record_read_engine
+#undef record_read_global
+
+done:
+	if (_ticks_engine)
+		*_ticks_engine = ticks_engine;
+	if (_ticks_function)
+		*_ticks_function = ticks_function;
+	if (_ticks_gt)
+		*_ticks_gt = ticks_gt;
+}
+
+static ktime_t busy_v2_guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
+{
+	struct intel_gt *gt = engine->gt;
+	struct intel_guc *guc = &gt->uc.guc;
+	u64 ticks_engine;
+	u64 total;
+
+	__busy_v2_get_engine_usage_record(guc, engine, &ticks_engine, NULL, NULL);
+
+	total = intel_gt_clock_interval_to_ns(gt, ticks_engine);
+
+	return ns_to_ktime(total);
+}
+
+static int busy_v2_guc_action_enable_usage_stats_device(struct intel_guc *guc)
+{
+	u32 offset = guc_engine_usage_offset_v2_device(guc);
+	u32 action[] = {
+		INTEL_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION_V2,
+		offset,
+		0,
+	};
+
+	return intel_guc_send(guc, action, ARRAY_SIZE(action));
+}
+
+static int busy_v2_guc_action_enable_usage_stats_function(struct intel_guc *guc)
+{
+	u32 offset = intel_guc_engine_usage_offset_pf(guc);
+	u32 action[] = {
+		INTEL_GUC_ACTION_SET_FUNCTION_ENGINE_UTILIZATION_V2,
 		offset,
 		0,
 	};
@@ -1472,26 +1637,40 @@ static int guc_init_engine_stats(struct intel_guc *guc)
 	intel_wakeref_t wakeref;
 	int ret;
 
-	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
-		ret = guc_action_enable_usage_stats(guc);
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 3, 1)) {
+		with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
+			ret = busy_v1_guc_action_enable_usage_stats(guc);
+
+		if (ret == 0)
+			busy_v1_guc_enable_worker(guc);
+	} else {
+		with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
+			ret = busy_v2_guc_action_enable_usage_stats_device(guc);
+
+			if (ret == 0)
+				ret = busy_v2_guc_action_enable_usage_stats_function(guc);
+		}
+	}
 
 	if (ret)
 		guc_err(guc, "Failed to enable usage stats: %pe\n", ERR_PTR(ret));
-	else
-		guc_enable_busyness_worker(guc);
 
 	return ret;
 }
 
 static void guc_fini_engine_stats(struct intel_guc *guc)
 {
-	guc_cancel_busyness_worker(guc);
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 3, 1))
+		busy_v1_guc_cancel_worker(guc);
 }
 
 void intel_guc_busyness_park(struct intel_gt *gt)
 {
 	struct intel_guc *guc = &gt->uc.guc;
 
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 3, 1))
+		return;
+
 	if (!guc_submission_initialized(guc))
 		return;
 
@@ -1500,19 +1679,19 @@ void intel_guc_busyness_park(struct intel_gt *gt)
 	 * and causes an unclaimed register access warning. Cancel the worker
 	 * synchronously here.
 	 */
-	guc_cancel_busyness_worker(guc);
+	busy_v1_guc_cancel_worker(guc);
 
 	/*
 	 * Before parking, we should sample engine busyness stats if we need to.
 	 * We can skip it if we are less than half a ping from the last time we
 	 * sampled the busyness stats.
 	 */
-	if (guc->timestamp.last_stat_jiffies &&
-	    !time_after(jiffies, guc->timestamp.last_stat_jiffies +
-			(guc->timestamp.ping_delay / 2)))
+	if (guc->busy.v1.last_stat_jiffies &&
+	    !time_after(jiffies, guc->busy.v1.last_stat_jiffies +
+			(guc->busy.v1.ping_delay / 2)))
 		return;
 
-	__update_guc_busyness_stats(guc);
+	__busy_v1_update_guc_busyness_stats(guc);
 }
 
 void intel_guc_busyness_unpark(struct intel_gt *gt)
@@ -1521,13 +1700,16 @@ void intel_guc_busyness_unpark(struct intel_gt *gt)
 	unsigned long flags;
 	ktime_t unused;
 
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 3, 1))
+		return;
+
 	if (!guc_submission_initialized(guc))
 		return;
 
-	spin_lock_irqsave(&guc->timestamp.lock, flags);
-	guc_update_pm_timestamp(guc, &unused);
-	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
-	guc_enable_busyness_worker(guc);
+	spin_lock_irqsave(&guc->busy.v1.lock, flags);
+	busy_v1_guc_update_pm_timestamp(guc, &unused);
+	spin_unlock_irqrestore(&guc->busy.v1.lock, flags);
+	busy_v1_guc_enable_worker(guc);
 }
 
 static inline bool
@@ -1590,7 +1772,9 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	intel_gt_park_heartbeats(guc_to_gt(guc));
 	disable_submission(guc);
 	guc->interrupts.disable(guc);
-	__reset_guc_busyness_stats(guc);
+
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 3, 1))
+		__busy_v1_reset_guc_busyness_stats(guc);
 
 	/* Flush IRQ handler */
 	spin_lock_irq(guc_to_gt(guc)->irq_lock);
@@ -1922,7 +2106,6 @@ static void reset_fail_worker_func(struct work_struct *w);
  */
 int intel_guc_submission_init(struct intel_guc *guc)
 {
-	struct intel_gt *gt = guc_to_gt(guc);
 	int ret;
 
 	if (guc->submission_initialized)
@@ -1941,12 +2124,23 @@ int intel_guc_submission_init(struct intel_guc *guc)
 		goto destroy_pool;
 	}
 
-	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
-	guc->timestamp.shift = gpm_timestamp_shift(gt);
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 3, 1)) {
+		struct intel_gt *gt = guc_to_gt(guc);
+
+		guc->busy.v1.ping_delay = (BUSY_V1_POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
+		guc->busy.v1.shift = busy_v1_gpm_timestamp_shift(gt);
+	} else {
+		ret = guc_busy_v2_alloc_device(guc);
+		if (ret)
+			goto destroy_bitmap;
+	}
+
 	guc->submission_initialized = true;
 
 	return 0;
 
+destroy_bitmap:
+	bitmap_free(guc->submission_state.guc_ids_bitmap);
 destroy_pool:
 	guc_lrc_desc_pool_destroy_v69(guc);
 
@@ -1962,6 +2156,8 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 	guc_lrc_desc_pool_destroy_v69(guc);
 	i915_sched_engine_put(guc->sched_engine);
 	bitmap_free(guc->submission_state.guc_ids_bitmap);
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 3, 1))
+		guc_busy_v2_free_device(guc);
 	guc->submission_initialized = false;
 }
 
@@ -2797,7 +2993,10 @@ static void guc_context_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
-	__guc_context_update_stats(ce);
+	if (GUC_SUBMIT_VER(ce_to_guc(ce)) < MAKE_GUC_VER(1, 3, 1))
+		__busy_v1_guc_context_update_stats(ce);
+	else
+		__busy_v2_guc_context_update_stats(ce);
 	unpin_guc_id(guc, ce);
 	lrc_unpin(ce);
 
@@ -4257,7 +4456,10 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 		engine->emit_flush = gen12_emit_flush_xcs;
 	}
 	engine->set_default_submission = guc_set_default_submission;
-	engine->busyness = guc_engine_busyness;
+	if (GUC_SUBMIT_VER(&engine->gt->uc.guc) < MAKE_GUC_VER(1, 3, 1))
+		engine->busyness = busy_v1_guc_engine_busyness;
+	else
+		engine->busyness = busy_v2_guc_engine_busyness;
 
 	engine->flags |= I915_ENGINE_SUPPORTS_STATS;
 	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
@@ -4501,7 +4703,8 @@ int intel_guc_submission_enable(struct intel_guc *guc)
 /* Note: By the time we're here, GuC may have already been reset */
 void intel_guc_submission_disable(struct intel_guc *guc)
 {
-	guc_cancel_busyness_worker(guc);
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 3, 1))
+		busy_v1_guc_cancel_worker(guc);
 
 	/* Semaphore interrupt disable and route to host */
 	guc_route_semaphores(guc, false);
@@ -4557,8 +4760,10 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
 	INIT_WORK(&guc->submission_state.reset_fail_worker,
 		  reset_fail_worker_func);
 
-	spin_lock_init(&guc->timestamp.lock);
-	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 3, 1)) {
+		spin_lock_init(&guc->busy.v1.lock);
+		INIT_DELAYED_WORK(&guc->busy.v1.work, busy_v1_guc_timestamp_ping);
+	}
 
 	guc->submission_state.sched_disable_delay_ms = SCHED_DISABLE_DELAY_MS;
 	guc->submission_state.num_guc_ids = GUC_MAX_CONTEXT_ID;
-- 
2.41.0

