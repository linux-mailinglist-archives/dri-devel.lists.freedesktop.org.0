Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88083C2C6F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 03:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AE86EABE;
	Sat, 10 Jul 2021 01:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B30F6EABE;
 Sat, 10 Jul 2021 01:23:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="295443512"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="295443512"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 18:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="411439893"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 09 Jul 2021 18:23:30 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/16] drm/i915/guc/slpc: Add methods to set min/max frequency
Date: Fri,  9 Jul 2021 18:20:18 -0700
Message-Id: <20210710012026.19705-9-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
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

Add param set h2g helpers to set the min and max frequencies
for use by SLPC.

Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 94 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
 2 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index e579408d1c19..19cb26479942 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -106,6 +106,19 @@ static int slpc_send(struct intel_guc_slpc *slpc,
 	return intel_guc_send(guc, action, in_len);
 }
 
+static int host2guc_slpc_set_param(struct intel_guc_slpc *slpc,
+				   u32 id, u32 value)
+{
+	struct slpc_event_input data = {0};
+
+	data.header.value = SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2);
+	data.args[0] = id;
+	data.args[1] = value;
+
+	return slpc_send(slpc, &data, 4);
+}
+
+
 static bool slpc_running(struct intel_guc_slpc *slpc)
 {
 	struct slpc_shared_data *data;
@@ -134,6 +147,19 @@ static int host2guc_slpc_query_task_state(struct intel_guc_slpc *slpc)
 	return slpc_send(slpc, &data, 4);
 }
 
+static int slpc_set_param(struct intel_guc_slpc *slpc, u32 id, u32 value)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
+
+	if (host2guc_slpc_set_param(slpc, id, value)) {
+		drm_err(&i915->drm, "Unable to set param %x", id);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int slpc_read_task_state(struct intel_guc_slpc *slpc)
 {
 	return host2guc_slpc_query_task_state(slpc);
@@ -218,6 +244,74 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 	return slpc_shared_data_init(slpc);
 }
 
+/**
+ * intel_guc_slpc_max_freq_set() - Set max frequency limit for SLPC.
+ * @slpc: pointer to intel_guc_slpc.
+ * @val: encoded frequency
+ *
+ * This function will invoke GuC SLPC action to update the max frequency
+ * limit for slice and unslice.
+ *
+ * Return: 0 on success, non-zero error code on failure.
+ */
+int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
+{
+	int ret;
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	intel_wakeref_t wakeref;
+
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+
+	ret = slpc_set_param(slpc,
+		       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
+		       val);
+
+	if (ret) {
+		drm_err(&i915->drm,
+			"Set max frequency unslice returned %d", ret);
+		ret = -EIO;
+		goto done;
+	}
+
+done:
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
+	return ret;
+}
+
+/**
+ * intel_guc_slpc_min_freq_set() - Set min frequency limit for SLPC.
+ * @slpc: pointer to intel_guc_slpc.
+ * @val: encoded frequency
+ *
+ * This function will invoke GuC SLPC action to update the min frequency
+ * limit.
+ *
+ * Return: 0 on success, non-zero error code on failure.
+ */
+int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
+{
+	int ret;
+	struct intel_guc *guc = slpc_to_guc(slpc);
+	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	intel_wakeref_t wakeref;
+
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+
+	ret = slpc_set_param(slpc,
+		       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+		       val);
+	if (ret) {
+		drm_err(&i915->drm,
+			"Set min frequency for unslice returned %d", ret);
+		ret = -EIO;
+		goto done;
+	}
+
+done:
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
+	return ret;
+}
+
 /*
  * intel_guc_slpc_enable() - Start SLPC
  * @slpc: pointer to intel_guc_slpc.
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index a2643b904165..a473e1ea7c10 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -34,5 +34,7 @@ struct intel_guc_slpc {
 int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
 void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
+int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
+int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
 
 #endif
-- 
2.25.0

