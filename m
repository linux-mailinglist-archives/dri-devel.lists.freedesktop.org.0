Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697F375B42
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4656EE10;
	Thu,  6 May 2021 18:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6243A6ED83;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: nrL1u7iIB6bfAW7uir+72m5JEaaSi6UOhw5sMnYzDs/gsaxhTasFRMHuvXDk3cUIRCjeWM3cCp
 aWupDUhqEbbg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195461"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195461"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: YNP9Or8geQ8w4UZqP/xGTRFGl8hkPpLcTBzbFk3XKaJ3Njy3Gu76uyKZBQgDNk0XtkpAKbLOHd
 9Uu6AepORC9A==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583606"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 76/97] drm/i915/guc: Hook GuC scheduling policies up
Date: Thu,  6 May 2021 12:14:30 -0700
Message-Id: <20210506191451.77768-77-matthew.brost@intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

Use the official driver default scheduling policies for configuring
the GuC scheduler rather than a bunch of hardcoded values.

Signed-off-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Jose Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 44 ++++++++++++++++++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++--
 4 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index bba53e3b39b9..16cc8453b01c 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -461,6 +461,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_IS_VIRTUAL       BIT(5)
 #define I915_ENGINE_HAS_RELATIVE_MMIO BIT(6)
 #define I915_ENGINE_REQUIRES_CMD_PARSER BIT(7)
+#define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
 	unsigned int flags;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 10b48b9f7603..266358d04bfc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -271,6 +271,8 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 
 void intel_guc_find_hung_context(struct intel_engine_cs *engine);
 
+int intel_guc_global_policies_update(struct intel_guc *guc);
+
 void intel_guc_submission_reset_prepare(struct intel_guc *guc);
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
 void intel_guc_submission_reset_finish(struct intel_guc *guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 179ab658d2b5..b37473bc8fff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -80,14 +80,54 @@ static u32 guc_ads_blob_size(struct intel_guc *guc)
 	       guc_ads_private_data_size(guc);
 }
 
-static void guc_policies_init(struct guc_policies *policies)
+static void guc_policies_init(struct intel_guc *guc, struct guc_policies *policies)
 {
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
+
 	policies->dpc_promote_time = GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
 	policies->max_num_work_items = GLOBAL_POLICY_MAX_NUM_WI;
+
 	policies->global_flags = 0;
+	if (i915->params.reset < 2)
+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
 	policies->is_valid = 1;
 }
 
+static int guc_action_policies_update(struct intel_guc *guc, u32 policy_offset)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
+		policy_offset
+	};
+
+	return intel_guc_send(guc, action, ARRAY_SIZE(action));
+}
+
+int intel_guc_global_policies_update(struct intel_guc *guc)
+{
+	struct __guc_ads_blob *blob = guc->ads_blob;
+	struct intel_gt *gt = guc_to_gt(guc);
+	intel_wakeref_t wakeref;
+	int ret;
+
+	if (!blob)
+		return -ENOTSUPP;
+
+	GEM_BUG_ON(!blob->ads.scheduler_policies);
+
+	guc_policies_init(guc, &blob->policies);
+
+	if (!intel_guc_is_ready(guc))
+		return 0;
+
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
+		ret = guc_action_policies_update(guc, blob->ads.scheduler_policies);
+
+	return ret;
+}
+
 static void guc_mapping_table_init(struct intel_gt *gt,
 				   struct guc_gt_system_info *system_info)
 {
@@ -284,7 +324,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	u8 engine_class, guc_class;
 
 	/* GuC scheduling policies */
-	guc_policies_init(&blob->policies);
+	guc_policies_init(guc, &blob->policies);
 
 	/*
 	 * GuC expects a per-engine-class context image and size
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ad3d2326a81d..a9fb31370c61 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -872,6 +872,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 	GEM_WARN_ON(atomic_read(&guc->outstanding_submission_g2h));
 	atomic_set(&guc->outstanding_submission_g2h, 0);
 
+	intel_guc_global_policies_update(guc);
 	enable_submission(guc);
 	intel_gt_unpark_heartbeats(guc_to_gt(guc));
 }
@@ -1160,8 +1161,12 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 {
 	desc->policy_flags = 0;
 
-	desc->execution_quantum = CONTEXT_POLICY_DEFAULT_EXECUTION_QUANTUM_US;
-	desc->preemption_timeout = CONTEXT_POLICY_DEFAULT_PREEMPTION_TIME_US;
+	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
+		desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE;
+
+	/* NB: For both of these, zero means disabled. */
+	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
+	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 }
 
 static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
@@ -1942,13 +1947,13 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 	engine->set_default_submission = guc_set_default_submission;
 
 	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
+	engine->flags |= I915_ENGINE_HAS_TIMESLICES;
 
 	/*
 	 * TODO: GuC supports timeslicing and semaphores as well, but they're
 	 * handled by the firmware so some minor tweaks are required before
 	 * enabling.
 	 *
-	 * engine->flags |= I915_ENGINE_HAS_TIMESLICES;
 	 * engine->flags |= I915_ENGINE_HAS_SEMAPHORES;
 	 */
 
-- 
2.28.0

