Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771443DBFA7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6256F493;
	Fri, 30 Jul 2021 20:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C177A6F48C;
 Fri, 30 Jul 2021 20:21:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="276939732"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="276939732"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 13:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="499741627"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 30 Jul 2021 13:21:56 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Subject: [PATCH 07/14] drm/i915/guc/slpc: Add methods to set min/max frequency
Date: Fri, 30 Jul 2021 13:21:12 -0700
Message-Id: <20210730202119.23810-8-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210730202119.23810-1-vinay.belgaumkar@intel.com>
References: <20210730202119.23810-1-vinay.belgaumkar@intel.com>
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

Add param set h2g helpers to set the min and max frequencies
for use by SLPC.

v2: Address review comments (Michal W)
v3: Check for positive error code (Michal W)
v4: Print generic error in set_param (Michal W)

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 89 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
 2 files changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index f26cf07ec87b..2635feb59576 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -111,6 +111,21 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
 	return data->header.global_state;
 }
 
+static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
+{
+	u32 request[] = {
+		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
+		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
+		id,
+		value,
+	};
+	int ret;
+
+	ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
+
+	return ret > 0 ? -EPROTO : ret;
+}
+
 static bool slpc_is_running(struct intel_guc_slpc *slpc)
 {
 	return slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING;
@@ -148,6 +163,22 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
 	return ret;
 }
 
+static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
+{
+	struct intel_guc *guc = slpc_to_guc(slpc);
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	int ret;
+
+	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
+
+	ret = guc_action_slpc_set_param(guc, id, value);
+	if (ret)
+		drm_err(&i915->drm, "Failed to set param %d to %u (%pe)\n",
+			id, value, ERR_PTR(ret));
+
+	return ret;
+}
+
 static const char *slpc_global_state_to_string(enum slpc_global_state state)
 {
 	switch (state) {
@@ -231,6 +262,64 @@ static void slpc_shared_data_reset(struct slpc_shared_data *data)
 			      SLPC_PARAM_TASK_DISABLE_DCC);
 }
 
+/**
+ * intel_guc_slpc_set_max_freq() - Set max frequency limit for SLPC.
+ * @slpc: pointer to intel_guc_slpc.
+ * @val: frequency (MHz)
+ *
+ * This function will invoke GuC SLPC action to update the max frequency
+ * limit for unslice.
+ *
+ * Return: 0 on success, non-zero error code on failure.
+ */
+int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	intel_wakeref_t wakeref;
+	int ret;
+
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
+		ret = slpc_set_param(slpc,
+				     SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
+				     val);
+
+		/* Return standardized err code for sysfs calls */
+		if (ret)
+			ret = -EIO;
+	}
+
+	return ret;
+}
+
+/**
+ * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
+ * @slpc: pointer to intel_guc_slpc.
+ * @val: frequency (MHz)
+ *
+ * This function will invoke GuC SLPC action to update the min unslice
+ * frequency.
+ *
+ * Return: 0 on success, non-zero error code on failure.
+ */
+int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	intel_wakeref_t wakeref;
+	int ret;
+
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
+		ret = slpc_set_param(slpc,
+				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+				     val);
+
+		/* Return standardized err code for sysfs calls */
+		if (ret)
+			ret = -EIO;
+	}
+
+	return ret;
+}
+
 /*
  * intel_guc_slpc_enable() - Start SLPC
  * @slpc: pointer to intel_guc_slpc.
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index bc139682ad0f..788d87ff7b58 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -29,5 +29,7 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
 void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
+int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
+int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
 
 #endif
-- 
2.25.0

