Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF63DB0F1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 04:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232376F380;
	Fri, 30 Jul 2021 02:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DCE6F37F;
 Fri, 30 Jul 2021 02:01:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="200186026"
X-IronPort-AV: E=Sophos;i="5.84,280,1620716400"; d="scan'208";a="200186026"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 19:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,280,1620716400"; d="scan'208";a="664637680"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga006.fm.intel.com with ESMTP; 29 Jul 2021 19:01:50 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/14] drm/i915/guc/slpc: Cache platform frequency limits
Date: Thu, 29 Jul 2021 19:01:04 -0700
Message-Id: <20210730020107.31415-12-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210730020107.31415-1-vinay.belgaumkar@intel.com>
References: <20210730020107.31415-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cache rp0, rp1 and rpn platform limits into SLPC structure
for range checking while setting min/max frequencies.

Also add "soft" limits which keep track of frequency changes
made from userland. These are initially set to platform min
and max.

v2: Address review comments (Michal W)
v3: Formatting (Michal W)
v4: Add separate function to parse rp values (Michal W)
v5: Perform range checking for set min/max (Michal W)
v6: checkpatch() and rename static functions (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 114 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   9 ++
 drivers/gpu/drm/i915/i915_reg.h               |   3 +
 3 files changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index ebabc84d4e39..c46eb404371e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -96,6 +96,9 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 		return err;
 	}
 
+	slpc->max_freq_softlimit = 0;
+	slpc->min_freq_softlimit = 0;
+
 	return err;
 }
 
@@ -126,6 +129,17 @@ static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
 	return ret > 0 ? -EPROTO : ret;
 }
 
+static int guc_action_slpc_unset_param(struct intel_guc *guc, u8 id)
+{
+	u32 request[] = {
+		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
+		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
+		id,
+	};
+
+	return intel_guc_send(guc, request, ARRAY_SIZE(request));
+}
+
 static bool slpc_is_running(struct intel_guc_slpc *slpc)
 {
 	return slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING;
@@ -179,6 +193,16 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
 	return ret;
 }
 
+static int slpc_unset_param(struct intel_guc_slpc *slpc,
+			    u8 id)
+{
+	struct intel_guc *guc = slpc_to_guc(slpc);
+
+	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
+
+	return guc_action_slpc_unset_param(guc, id);
+}
+
 static const char *slpc_global_state_to_string(enum slpc_global_state state)
 {
 	switch (state) {
@@ -300,6 +324,11 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
 	intel_wakeref_t wakeref;
 	int ret;
 
+	if (val < slpc->min_freq ||
+	    val > slpc->rp0_freq ||
+	    val < slpc->min_freq_softlimit)
+		return -EINVAL;
+
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		ret = slpc_set_param(slpc,
 				     SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
@@ -310,6 +339,8 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
 			ret = -EIO;
 	}
 
+	slpc->max_freq_softlimit = val;
+
 	return ret;
 }
 
@@ -356,6 +387,11 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 	intel_wakeref_t wakeref;
 	int ret;
 
+	if (val < slpc->min_freq ||
+	    val > slpc->rp0_freq ||
+	    val > slpc->max_freq_softlimit)
+		return -EINVAL;
+
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		ret = slpc_set_param(slpc,
 				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
@@ -366,6 +402,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 			ret = -EIO;
 	}
 
+	slpc->min_freq_softlimit = val;
+
 	return ret;
 }
 
@@ -411,6 +449,71 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
 			 GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
 }
 
+static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
+{
+	int ret = 0;
+
+	/*
+	 * Softlimits are initially equivalent to platform limits
+	 * unless they have deviated from defaults, in which case,
+	 * we retain the values and set min/max accordingly.
+	 */
+	if (!slpc->max_freq_softlimit)
+		slpc->max_freq_softlimit = slpc->rp0_freq;
+	else if (slpc->max_freq_softlimit != slpc->rp0_freq)
+		ret = intel_guc_slpc_set_max_freq(slpc,
+						  slpc->max_freq_softlimit);
+
+	if (!slpc->min_freq_softlimit)
+		slpc->min_freq_softlimit = slpc->min_freq;
+	else if (slpc->min_freq_softlimit != slpc->min_freq)
+		ret = intel_guc_slpc_set_min_freq(slpc,
+						  slpc->min_freq_softlimit);
+
+	return ret;
+}
+
+static void slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
+{
+	/* A failure here does not affect the algorithm in a fatal way */
+	if (ignore) {
+		slpc_set_param(slpc,
+			       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
+			       ignore);
+		slpc_set_param(slpc,
+			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+			       slpc->min_freq);
+	} else {
+		slpc_unset_param(slpc,
+				 SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
+		slpc_unset_param(slpc,
+				 SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
+	}
+}
+
+static void slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
+{
+	/* Force SLPC to used platform rp0 */
+	slpc_set_param(slpc,
+		       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
+		       slpc->rp0_freq);
+}
+
+static void slpc_get_rp_values(struct intel_guc_slpc *slpc)
+{
+	u32 rp_state_cap;
+
+	rp_state_cap = intel_uncore_read(slpc_to_gt(slpc)->uncore,
+					 GEN6_RP_STATE_CAP);
+
+	slpc->rp0_freq = REG_FIELD_GET(RP0_CAP_MASK, rp_state_cap) *
+					GT_FREQUENCY_MULTIPLIER;
+	slpc->rp1_freq = REG_FIELD_GET(RP1_CAP_MASK, rp_state_cap) *
+					GT_FREQUENCY_MULTIPLIER;
+	slpc->min_freq = REG_FIELD_GET(RPN_CAP_MASK, rp_state_cap) *
+					GT_FREQUENCY_MULTIPLIER;
+}
+
 /*
  * intel_guc_slpc_enable() - Start SLPC
  * @slpc: pointer to intel_guc_slpc.
@@ -446,6 +549,17 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	intel_guc_pm_intrmsk_enable(&i915->gt);
 
+	slpc_get_rp_values(slpc);
+
+	/* Ignore efficient freq and set min/max to platform min/max */
+	slpc_ignore_eff_freq(slpc, true);
+	slpc_use_fused_rp0(slpc);
+
+	ret = slpc_set_softlimits(slpc);
+	if (ret)
+		drm_err(&i915->drm, "Failed to set SLPC softlimits (%pe)\n",
+			ERR_PTR(ret));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
index 3cefe19b17b2..41d13527666f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -15,6 +15,15 @@ struct intel_guc_slpc {
 	struct slpc_shared_data *vaddr;
 	bool supported;
 	bool selected;
+
+	/* platform frequency limits */
+	u32 min_freq;
+	u32 rp0_freq;
+	u32 rp1_freq;
+
+	/* frequency softlimits */
+	u32 min_freq_softlimit;
+	u32 max_freq_softlimit;
 };
 
 #endif
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 5603377e06ca..f3a445f79a36 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4109,6 +4109,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define BXT_GT_PERF_STATUS      _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x7070)
 #define GEN6_RP_STATE_LIMITS	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
 #define GEN6_RP_STATE_CAP	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
+#define   RP0_CAP_MASK		REG_GENMASK(7, 0)
+#define   RP1_CAP_MASK		REG_GENMASK(15, 8)
+#define   RPN_CAP_MASK		REG_GENMASK(23, 16)
 #define BXT_RP_STATE_CAP        _MMIO(0x138170)
 #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
 
-- 
2.25.0

