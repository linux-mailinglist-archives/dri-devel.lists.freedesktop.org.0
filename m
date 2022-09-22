Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E45E6CD4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 22:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC6010E20A;
	Thu, 22 Sep 2022 20:11:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF8410E137;
 Thu, 22 Sep 2022 20:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663877485; x=1695413485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CU5Wcl0b0KBmGymzboWBaRiBChb7Af6WxTHdA0EcGlk=;
 b=ZUefyqypQMIKR9vOv4MUyXZQ4norfReADKb28KHrWNHsg6KY8W/qQWht
 tasD7XgBaQ6X6F9mVE0shJs8XPNGjtJOcni1bePTry6I1CdSvt6bvQGVI
 zrqJxKACY8yC5GkKt0VdB0qx2XZo1YXCyFUbmb6avUiHvOLfCLIPhbdT8
 NJ3WHWgt5soslfQWiPTN+Ll0M6l2O4Ikx1noqOcunc3W1IJzk1DlWWZFY
 vA84KMqfJlg+1tgUigFfvyIv0dPHcmK3BKDeoLcGQGC2/8Y308jq/YSqz
 jMCfSehodQwTqFd1SW3sGJgsxbzNmMOTR61mk5hkNOs0C6CTYVn6DHmuz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280787665"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280787665"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 13:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="795245788"
Received: from relo-linux-5.jf.intel.com ([10.165.21.188])
 by orsmga005.jf.intel.com with ESMTP; 22 Sep 2022 13:11:24 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/1] drm/i915/guc: Enable compute scheduling on DG2
Date: Thu, 22 Sep 2022 13:12:09 -0700
Message-Id: <20220922201209.1446343-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922201209.1446343-1-John.C.Harrison@Intel.com>
References: <20220922201209.1446343-1-John.C.Harrison@Intel.com>
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

DG2 has issues. To work around one of these the GuC must schedule
apps in an exclusive manner across both RCS and CCS. That is, if a
context from app X is running on RCS then all CCS engines must sit
idle even if there are contexts from apps Y, Z, ... waiting to run. A
certain OS favours RCS to the total starvation of CCS. Linux does not.
Hence the GuC now has a scheduling policy setting to control this
abitration.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 22 +++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 93 +++++++++++++++++++
 4 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 29ef8afc8c2e4..f359bef046e0b 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -117,6 +117,7 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_ENTER_S_STATE = 0x501,
 	INTEL_GUC_ACTION_EXIT_S_STATE = 0x502,
 	INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE = 0x506,
+	INTEL_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV = 0x509,
 	INTEL_GUC_ACTION_SCHED_CONTEXT = 0x1000,
 	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET = 0x1001,
 	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
index 4a59478c3b5c4..58012edd4eb0e 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
@@ -81,10 +81,17 @@
 #define GUC_KLV_SELF_CFG_G2H_CTB_SIZE_KEY		0x0907
 #define GUC_KLV_SELF_CFG_G2H_CTB_SIZE_LEN		1u
 
+/*
+ * Global scheduling policy update keys.
+ */
+enum {
+	GUC_SCHEDULING_POLICIES_KLV_ID_RENDER_COMPUTE_YIELD	= 0x1001,
+};
+
 /*
  * Per context scheduling policy update keys.
  */
-enum  {
+enum {
 	GUC_CONTEXT_POLICIES_KLV_ID_EXECUTION_QUANTUM			= 0x2001,
 	GUC_CONTEXT_POLICIES_KLV_ID_PREEMPTION_TIMEOUT			= 0x2002,
 	GUC_CONTEXT_POLICIES_KLV_ID_SCHEDULING_PRIORITY			= 0x2003,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 323b055e5db97..e7a7fb450f442 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -290,6 +290,25 @@ struct guc_update_context_policy {
 	struct guc_klv_generic_dw_t klv[GUC_CONTEXT_POLICIES_KLV_NUM_IDS];
 } __packed;
 
+/* Format of the UPDATE_SCHEDULING_POLICIES H2G data packet */
+struct guc_update_scheduling_policy_header {
+	u32 action;
+} __packed;
+
+/*
+ * Can't dynmically allocate memory for the scheduling policy KLV because
+ * it will be sent from within the reset path. Need a fixed size lump on
+ * the stack instead :(.
+ *
+ * Currently, there is only one KLV defined, which has 1 word of KL + 2 words of V.
+ */
+#define MAX_SCHEDULING_POLICY_SIZE 3
+
+struct guc_update_scheduling_policy {
+	struct guc_update_scheduling_policy_header header;
+	u32 data[MAX_SCHEDULING_POLICY_SIZE];
+} __packed;
+
 #define GUC_POWER_UNSPECIFIED	0
 #define GUC_POWER_D0		1
 #define GUC_POWER_D1		2
@@ -298,6 +317,9 @@ struct guc_update_context_policy {
 
 /* Scheduling policy settings */
 
+#define GLOBAL_SCHEDULE_POLICY_RC_YIELD_DURATION	100	/* in ms */
+#define GLOBAL_SCHEDULE_POLICY_RC_YIELD_RATIO		50	/* in percent */
+
 #define GLOBAL_POLICY_MAX_NUM_WI 15
 
 /* Don't reset an engine upon preemption failure */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 22ba66e48a9b0..f09f530198f4d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4177,6 +4177,98 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 	return 0;
 }
 
+struct scheduling_policy {
+	/* internal data */
+	u32 max_words, num_words;
+	u32 count;
+	/* API data */
+	struct guc_update_scheduling_policy h2g;
+};
+
+static u32 __guc_scheduling_policy_action_size(struct scheduling_policy *policy)
+{
+	u32 *start = (void *)&policy->h2g;
+	u32 *end = policy->h2g.data + policy->num_words;
+	size_t delta = end - start;
+
+	return delta;
+}
+
+static struct scheduling_policy *__guc_scheduling_policy_start_klv(struct scheduling_policy *policy)
+{
+	policy->h2g.header.action = INTEL_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV;
+	policy->max_words = ARRAY_SIZE(policy->h2g.data);
+	policy->num_words = 0;
+	policy->count = 0;
+
+	return policy;
+}
+
+static void __guc_scheduling_policy_add_klv(struct scheduling_policy *policy,
+					    u32 action, u32 *data, u32 len)
+{
+	u32 *klv_ptr = policy->h2g.data + policy->num_words;
+
+	GEM_BUG_ON((policy->num_words + 1 + len) > policy->max_words);
+	*(klv_ptr++) = FIELD_PREP(GUC_KLV_0_KEY, action) |
+		       FIELD_PREP(GUC_KLV_0_LEN, len);
+	memcpy(klv_ptr, data, sizeof(u32) * len);
+	policy->num_words += 1 + len;
+	policy->count++;
+}
+
+static int __guc_action_set_scheduling_policies(struct intel_guc *guc,
+						struct scheduling_policy *policy)
+{
+	int ret;
+
+	ret = intel_guc_send(guc, (u32 *)&policy->h2g,
+			     __guc_scheduling_policy_action_size(policy));
+	if (ret < 0)
+		return ret;
+
+	if (ret != policy->count) {
+		drm_warn(&guc_to_gt(guc)->i915->drm, "GuC global scheduler policy processed %d of %d KLVs!",
+			 ret, policy->count);
+		if (ret > policy->count)
+			return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int guc_init_global_schedule_policy(struct intel_guc *guc)
+{
+	struct scheduling_policy policy;
+	struct intel_gt *gt = guc_to_gt(guc);
+	intel_wakeref_t wakeref;
+	int ret = 0;
+
+	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 3, 0))
+		return 0;
+
+	__guc_scheduling_policy_start_klv(&policy);
+
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
+		u32 yield[] = {
+			GLOBAL_SCHEDULE_POLICY_RC_YIELD_DURATION,
+			GLOBAL_SCHEDULE_POLICY_RC_YIELD_RATIO,
+		};
+
+		__guc_scheduling_policy_add_klv(&policy,
+						GUC_SCHEDULING_POLICIES_KLV_ID_RENDER_COMPUTE_YIELD,
+						yield, ARRAY_SIZE(yield));
+
+		ret = __guc_action_set_scheduling_policies(guc, &policy);
+		if (ret)
+			i915_probe_error(gt->i915,
+					 "Failed to configure global scheduling policies: %pe!\n",
+					 ERR_PTR(ret));
+	}
+
+	return ret;
+}
+
 void intel_guc_submission_enable(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -4189,6 +4281,7 @@ void intel_guc_submission_enable(struct intel_guc *guc)
 
 	guc_init_lrc_mapping(guc);
 	guc_init_engine_stats(guc);
+	guc_init_global_schedule_policy(guc);
 }
 
 void intel_guc_submission_disable(struct intel_guc *guc)
-- 
2.37.3

