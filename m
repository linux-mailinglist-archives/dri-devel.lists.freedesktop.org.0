Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3783D1379
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABF06EB6E;
	Wed, 21 Jul 2021 16:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530596EB6E;
 Wed, 21 Jul 2021 16:12:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="297028261"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="297028261"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 09:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="564787012"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2021 09:12:25 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/14] drm/i915/guc/slpc: Enable SLPC and add related H2G
 events
Date: Wed, 21 Jul 2021 09:11:12 -0700
Message-Id: <20210721161120.24610-7-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
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

This patch also removes the GEM_BUG_ON from guc_submission_disable().
The assumption when that was added was there would be no wakerefs
when it would be called. However, if we fail to enable slpc, we will
still be holding a wakeref.

v2: Address several review comments, add new helpers for
decoding the slpc min/max frequencies. Use masks instead of hardcoded
constants. (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 206 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   2 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   4 -
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +
 4 files changed, 218 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index a99d727b5bf0..48db2a8f67d1 100644
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
@@ -63,6 +97,116 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
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
+
+ 	return intel_guc_send(guc, request, ARRAY_SIZE(request));
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
+static const char *slpc_state_string(struct intel_guc_slpc *slpc)
+{
+	const char *str = NULL;
+	u32 state = slpc_get_state(slpc);
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
+static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
+{
+	u32 request[] = {
+		INTEL_GUC_ACTION_SLPC_REQUEST,
+		SLPC_EVENT(SLPC_EVENT_RESET, 2),
+		offset,
+		0,
+	};
+
+ 	return intel_guc_send(guc, request, ARRAY_SIZE(request));
+}
+
+static int slpc_reset(struct intel_guc_slpc *slpc)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	struct intel_guc *guc = slpc_to_guc(slpc);
+	u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
+	int ret;
+
+	ret = guc_action_slpc_reset(guc, shared_data_gtt_offset);
+
+	if (!ret) {
+		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
+			drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
+				  slpc_state_string(slpc));
+			return -EIO;
+		}
+	}
+
+	return ret;
+}
+
 int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 {
 	GEM_BUG_ON(slpc->vma);
@@ -70,6 +214,30 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 	return slpc_shared_data_init(slpc);
 }
 
+u32 slpc_decode_min_freq(struct intel_guc_slpc *slpc)
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
+u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
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
 /*
  * intel_guc_slpc_enable() - Start SLPC
  * @slpc: pointer to intel_guc_slpc.
@@ -85,6 +253,44 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
  */
 int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 {
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
+	if (ret) {
+		drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
+				ERR_PTR(ret));
+		return ret;
+	}
+
+	drm_info(&i915->drm, "SLPC state: %s\n", slpc_state_string(slpc));
+
+	slpc_query_task_state(slpc);
+
+	/* min and max frequency limits being used by SLPC */
+	drm_info(&i915->drm, "SLPC min freq: %u Mhz, max is %u Mhz\n",
+			slpc_decode_min_freq(slpc),
+			slpc_decode_max_freq(slpc));
+
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
index 214a449e78f2..c417992b1346 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -9,6 +9,8 @@
 #include <linux/types.h>
 #include "abi/guc_actions_slpc_abi.h"
 
+#define SLPC_RESET_TIMEOUT_MS 5
+
 struct intel_guc_slpc {
 
 	struct i915_vma *vma;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9083bd4adb22..142e44dc5bf1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2506,10 +2506,6 @@ void intel_guc_submission_enable(struct intel_guc *guc)
 
 void intel_guc_submission_disable(struct intel_guc *guc)
 {
-	struct intel_gt *gt = guc_to_gt(guc);
-
-	GEM_BUG_ON(gt->awake); /* GT should be parked first */
-
 	/* Note: By the time we're here, GuC may have already been reset */
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index e6bd9406c7b2..3f2aa83c5c45 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -506,6 +506,14 @@ static int __uc_init_hw(struct intel_uc *uc)
 		 "submission",
 		 enableddisabled(intel_uc_uses_guc_submission(uc)));
 
+	if (intel_uc_uses_guc_slpc(uc)) {
+		ret = intel_guc_slpc_enable(&guc->slpc);
+		if (ret)
+			goto err_submission;
+		drm_info(&i915->drm, "GuC SLPC %s\n",
+			 enableddisabled(intel_uc_uses_guc_slpc(uc)));
+	}
+
 	if (intel_uc_uses_huc(uc)) {
 		drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
 			 intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
@@ -520,6 +528,8 @@ static int __uc_init_hw(struct intel_uc *uc)
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

