Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24663D6759
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 21:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EFA72C1A;
	Mon, 26 Jul 2021 19:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED6072BCA;
 Mon, 26 Jul 2021 19:08:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="234162117"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="234162117"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 12:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="566278214"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2021 12:08:50 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/15] drm/i915/guc/slpc: Enable SLPC and add related H2G
 events
Date: Mon, 26 Jul 2021 12:07:51 -0700
Message-Id: <20210726190800.26762-7-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add methods for interacting with GuC for enabling SLPC. Enable
SLPC after GuC submission has been established. GuC load will
fail if SLPC cannot be successfully initialized. Add various
helper methods to set/unset the parameters for SLPC. They can
be set using H2G calls or directly setting bits in the shared
data structure.

v2: Address several review comments, add new helpers for
decoding the SLPC min/max frequencies. Use masks instead of hardcoded
constants. (Michal W)

v3: Split global_state_to_string function, and check for positive
non-zero return value from intel_guc_send() (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 237 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   8 +
 3 files changed, 247 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index bae4e33db0f8..f5808d2acbca 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -45,6 +45,40 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc)
 	guc->slpc_selected = __guc_slpc_selected(guc);
 }
 
+static void slpc_mem_set_param(struct slpc_shared_data *data,
+				u32 id, u32 value)
+{
+	GEM_BUG_ON(id >= SLPC_MAX_OVERRIDE_PARAMETERS);
+	/*
+	 * When the flag bit is set, corresponding value will be read
+	 * and applied by slpc.
+	 */
+	data->override_params.bits[id >> 5] |= (1 << (id % 32));
+	data->override_params.values[id] = value;
+}
+
+static void slpc_mem_set_enabled(struct slpc_shared_data *data,
+				u8 enable_id, u8 disable_id)
+{
+	/*
+	 * Enabling a param involves setting the enable_id
+	 * to 1 and disable_id to 0.
+	 */
+	slpc_mem_set_param(data, enable_id, 1);
+	slpc_mem_set_param(data, disable_id, 0);
+}
+
+static void slpc_mem_set_disabled(struct slpc_shared_data *data,
+				u8 enable_id, u8 disable_id)
+{
+	/*
+	 * Disabling a param involves setting the enable_id
+	 * to 0 and disable_id to 1.
+	 */
+	slpc_mem_set_param(data, disable_id, 1);
+	slpc_mem_set_param(data, enable_id, 0);
+}
+
 static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
 {
 	struct intel_guc *guc = slpc_to_guc(slpc);
@@ -63,6 +97,129 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
 	return err;
 }
 
+static u32 slpc_get_state(struct intel_guc_slpc *slpc)
+{
+	struct slpc_shared_data *data;
+
+	GEM_BUG_ON(!slpc->vma);
+
+	drm_clflush_virt_range(slpc->vaddr, sizeof(u32));
+	data = slpc->vaddr;
+
+	return data->header.global_state;
+}
+
+static bool slpc_is_running(struct intel_guc_slpc *slpc)
+{
+	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
+}
+
+static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
+{
+	u32 request[] = {
+		INTEL_GUC_ACTION_SLPC_REQUEST,
+ 		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
+		offset,
+		0,
+	};
+	int ret;
+
+	ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
+
+	return ret > 0 ? -EPROTO : ret;
+}
+
+static int slpc_query_task_state(struct intel_guc_slpc *slpc)
+{
+	struct intel_guc *guc = slpc_to_guc(slpc);
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
+	int ret;
+
+	ret = guc_action_slpc_query(guc, shared_data_gtt_offset);
+	if (ret)
+		drm_err(&i915->drm, "Query task state data returned (%pe)\n",
+				ERR_PTR(ret));
+
+	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
+
+	return ret;
+}
+
+static const char *slpc_global_state_to_string(enum slpc_global_state state)
+{
+	const char *str = NULL;
+
+	switch (state) {
+	case SLPC_GLOBAL_STATE_NOT_RUNNING:
+		str = "not running";
+		break;
+	case SLPC_GLOBAL_STATE_INITIALIZING:
+		str = "initializing";
+		break;
+	case SLPC_GLOBAL_STATE_RESETTING:
+		str = "resetting";
+		break;
+	case SLPC_GLOBAL_STATE_RUNNING:
+		str = "running";
+		break;
+	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
+		str = "shutting down";
+		break;
+	case SLPC_GLOBAL_STATE_ERROR:
+		str = "error";
+		break;
+	default:
+		str = "unknown";
+		break;
+	}
+
+	return str;
+}
+
+static const char *slpc_get_state_string(struct intel_guc_slpc *slpc)
+{
+	return slpc_global_state_to_string(slpc_get_state(slpc));
+}
+
+static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
+{
+	u32 request[] = {
+		INTEL_GUC_ACTION_SLPC_REQUEST,
+		SLPC_EVENT(SLPC_EVENT_RESET, 2),
+		offset,
+		0,
+	};
+	int ret;
+
+	ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
+
+	return ret > 0 ? -EPROTO : ret;
+}
+
+static int slpc_reset(struct intel_guc_slpc *slpc)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	struct intel_guc *guc = slpc_to_guc(slpc);
+	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
+	int ret;
+
+	ret = guc_action_slpc_reset(guc, offset);
+
+	if (unlikely(ret < 0))
+		return ret;
+
+	if (!ret) {
+		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
+			drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
+				  slpc_get_state_string(slpc));
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
 int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 {
 	GEM_BUG_ON(slpc->vma);
@@ -70,6 +227,86 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 	return slpc_shared_data_init(slpc);
 }
 
+static u32 slpc_decode_min_freq(struct intel_guc_slpc *slpc)
+{
+	struct slpc_shared_data *data = slpc->vaddr;
+
+	GEM_BUG_ON(!slpc->vma);
+
+	return	DIV_ROUND_CLOSEST(
+		REG_FIELD_GET(SLPC_MIN_UNSLICE_FREQ_MASK,
+			data->task_state_data.freq) *
+		GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
+}
+
+static u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
+{
+	struct slpc_shared_data *data = slpc->vaddr;
+
+	GEM_BUG_ON(!slpc->vma);
+
+	return	DIV_ROUND_CLOSEST(
+		REG_FIELD_GET(SLPC_MAX_UNSLICE_FREQ_MASK,
+			data->task_state_data.freq) *
+		GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
+}
+
+/*
+ * intel_guc_slpc_enable() - Start SLPC
+ * @slpc: pointer to intel_guc_slpc.
+ *
+ * SLPC is enabled by setting up the shared data structure and
+ * sending reset event to GuC SLPC. Initial data is setup in
+ * intel_guc_slpc_init. Here we send the reset event. We do
+ * not currently need a slpc_disable since this is taken care
+ * of automatically when a reset/suspend occurs and the GuC
+ * CTB is destroyed.
+ *
+ * Return: 0 on success, non-zero error code on failure.
+ */
+int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	struct slpc_shared_data *data;
+	int ret;
+
+	GEM_BUG_ON(!slpc->vma);
+
+	memset(slpc->vaddr, 0, sizeof(struct slpc_shared_data));
+
+	data = slpc->vaddr;
+	data->header.size = sizeof(struct slpc_shared_data);
+
+	/* Enable only GTPERF task, disable others */
+	slpc_mem_set_enabled(data, SLPC_PARAM_TASK_ENABLE_GTPERF,
+				SLPC_PARAM_TASK_DISABLE_GTPERF);
+
+	slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_BALANCER,
+				SLPC_PARAM_TASK_DISABLE_BALANCER);
+
+	slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_DCC,
+				SLPC_PARAM_TASK_DISABLE_DCC);
+
+	ret = slpc_reset(slpc);
+	if (unlikely(ret < 0)) {
+		drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
+				ERR_PTR(ret));
+		return ret;
+	}
+
+	drm_info(&i915->drm, "GuC SLPC: enabled\n");
+
+	slpc_query_task_state(slpc);
+
+	/* min and max frequency limits being used by SLPC */
+	drm_info(&i915->drm, "SLPC min freq: %u Mhz, max is %u Mhz\n",
+			slpc_decode_min_freq(slpc),
+			slpc_decode_max_freq(slpc));
+
+
+	return 0;
+}
+
 void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
 {
 	if (!slpc->vma)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
index edcf4c05bd9f..f14f81821a51 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -6,6 +6,8 @@
 #ifndef _INTEL_GUC_SLPC_TYPES_H_
 #define _INTEL_GUC_SLPC_TYPES_H_
 
+#define SLPC_RESET_TIMEOUT_MS 5
+
 struct intel_guc_slpc {
 	struct i915_vma *vma;
 	struct slpc_shared_data *vaddr;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index e6bd9406c7b2..b98c14f8c229 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -506,6 +506,12 @@ static int __uc_init_hw(struct intel_uc *uc)
 		 "submission",
 		 enableddisabled(intel_uc_uses_guc_submission(uc)));
 
+	if (intel_uc_uses_guc_slpc(uc)) {
+		ret = intel_guc_slpc_enable(&guc->slpc);
+		if (ret)
+			goto err_submission;
+	}
+
 	if (intel_uc_uses_huc(uc)) {
 		drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
 			 intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
@@ -520,6 +526,8 @@ static int __uc_init_hw(struct intel_uc *uc)
 	/*
 	 * We've failed to load the firmware :(
 	 */
+err_submission:
+	intel_guc_submission_disable(guc);
 err_log_capture:
 	__uc_capture_load_err_log(uc);
 err_out:
-- 
2.25.0

