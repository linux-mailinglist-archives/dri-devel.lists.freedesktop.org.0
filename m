Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E12DBABD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 06:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9ED89D86;
	Wed, 16 Dec 2020 05:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B1589E1B;
 Wed, 16 Dec 2020 05:37:55 +0000 (UTC)
IronPort-SDR: q8rs1T/zrMCnML0B+4PwhudD5SUdBp3yo69VMtVnl+wV405zlrFg03DUXqm2CC5eUuCKHRinD5
 4y6tbQjWakbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="172437332"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="172437332"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 21:37:55 -0800
IronPort-SDR: TAn2k8lpMLDH5dtCpPdTrPKMJpIV7yxzmcUMv1j+aJwkHI3PEyKz+OmFeHhFGa9/Ytl3/fkjhz
 QWA65/8G1c8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="556647130"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2020 21:37:53 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 09/15] drm/i915: Add support for starting FRL training for
 HDMI2.1 via PCON
Date: Wed, 16 Dec 2020 11:01:15 +0530
Message-Id: <20201216053121.18819-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
References: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
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
Cc: swati2.sharma@intel.com, airlied@linux.ie, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds functions to start FRL training for an HDMI2.1 sink,
connected via a PCON as a DP branch device.
This patch also adds a new structure for storing frl training related
data, when FRL training is completed.

v2: As suggested by Uma Shankar:
-renamed couple of variables for better clarity
-tweaked the macros used for correct semantics for true/false
-fixed other styling issues.

v3: Completed the TODO for condition for going to FRL mode.
Modified the condition to determine the required FRL b/w
based only on the Pcon and Sink's max FRL values.
Moved the frl structure initialization to intel_dp_init_connector().

v4: Fixed typo in initialization of frl structure.

v5: Always use FRL if its possible, instead of enabling only for
higher modes as done in v3.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com> (v2)
---
 .../drm/i915/display/intel_display_types.h    |   7 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 151 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h       |   2 +
 3 files changed, 160 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c88d2b918d9f..daecff9783ea 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1339,6 +1339,11 @@ struct intel_dp_compliance {
 	u8 test_lane_count;
 };
 
+struct intel_dp_pcon_frl {
+	bool is_trained;
+	int trained_rate_gbps;
+};
+
 struct intel_dp {
 	i915_reg_t output_reg;
 	u32 DP;
@@ -1461,6 +1466,8 @@ struct intel_dp {
 
 	bool hobl_failed;
 	bool hobl_active;
+
+	struct intel_dp_pcon_frl frl;
 };
 
 enum lspcon_vendor {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 660b4bd2280a..1fdcb7672ad0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3883,6 +3883,8 @@ static void intel_disable_dp(struct intel_atomic_state *state,
 	intel_edp_backlight_off(old_conn_state);
 	intel_dp_set_power(intel_dp, DP_SET_POWER_D3);
 	intel_edp_panel_off(intel_dp);
+	intel_dp->frl.is_trained = false;
+	intel_dp->frl.trained_rate_gbps = 0;
 }
 
 static void g4x_disable_dp(struct intel_atomic_state *state,
@@ -3978,6 +3980,152 @@ cpt_set_link_train(struct intel_dp *intel_dp,
 	intel_de_posting_read(dev_priv, intel_dp->output_reg);
 }
 
+static int intel_dp_pcon_get_frl_mask(u8 frl_bw_mask)
+{
+	int bw_gbps[] = {9, 18, 24, 32, 40, 48};
+	int i;
+
+	for (i = ARRAY_SIZE(bw_gbps) - 1; i >= 0; i--) {
+		if (frl_bw_mask & (1 << i))
+			return bw_gbps[i];
+	}
+	return 0;
+}
+
+static int intel_dp_pcon_set_frl_mask(int max_frl)
+{
+
+	switch (max_frl) {
+	case 48:
+		return DP_PCON_FRL_BW_MASK_48GBPS;
+	case 40:
+		return DP_PCON_FRL_BW_MASK_40GBPS;
+	case 32:
+		return DP_PCON_FRL_BW_MASK_32GBPS;
+	case 24:
+		return DP_PCON_FRL_BW_MASK_24GBPS;
+	case 18:
+		return DP_PCON_FRL_BW_MASK_18GBPS;
+	case 9:
+		return DP_PCON_FRL_BW_MASK_9GBPS;
+	}
+
+	return 0;
+}
+
+static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
+{
+	struct intel_connector *intel_connector = intel_dp->attached_connector;
+	struct drm_connector *connector = &intel_connector->base;
+
+	return (connector->display_info.hdmi.max_frl_rate_per_lane *
+		connector->display_info.hdmi.max_lanes);
+}
+
+static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
+{
+#define PCON_EXTENDED_TRAIN_MODE (1 > 0)
+#define PCON_CONCURRENT_MODE (1 > 0)
+#define PCON_SEQUENTIAL_MODE !PCON_CONCURRENT_MODE
+#define PCON_NORMAL_TRAIN_MODE !PCON_EXTENDED_TRAIN_MODE
+#define TIMEOUT_FRL_READY_MS 500
+#define TIMEOUT_HDMI_LINK_ACTIVE_MS 1000
+
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int max_frl_bw, max_pcon_frl_bw, max_edid_frl_bw, ret;
+	u8 max_frl_bw_mask = 0, frl_trained_mask;
+	bool is_active;
+
+	ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
+	if (ret < 0)
+		return ret;
+
+	max_pcon_frl_bw = intel_dp->dfp.pcon_max_frl_bw;
+	drm_dbg(&i915->drm, "PCON max rate = %d Gbps\n", max_pcon_frl_bw);
+
+	max_edid_frl_bw = intel_dp_hdmi_sink_max_frl(intel_dp);
+	drm_dbg(&i915->drm, "Sink max rate from EDID = %d Gbps\n", max_edid_frl_bw);
+
+	max_frl_bw = min(max_edid_frl_bw, max_pcon_frl_bw);
+
+	if (max_frl_bw <= 0)
+		return -EINVAL;
+
+	ret = drm_dp_pcon_frl_prepare(&intel_dp->aux, false);
+	if (ret < 0)
+		return ret;
+	/* Wait for PCON to be FRL Ready */
+	wait_for(is_active = drm_dp_pcon_is_frl_ready(&intel_dp->aux) == true, TIMEOUT_FRL_READY_MS);
+
+	if (!is_active)
+		return -ETIMEDOUT;
+
+	max_frl_bw_mask = intel_dp_pcon_set_frl_mask(max_frl_bw);
+	ret = drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl_bw, PCON_SEQUENTIAL_MODE);
+	if (ret < 0)
+		return ret;
+	ret = drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_bw_mask, PCON_NORMAL_TRAIN_MODE);
+	if (ret < 0)
+		return ret;
+	ret = drm_dp_pcon_frl_enable(&intel_dp->aux);
+	if (ret < 0)
+		return ret;
+	/*
+	 * Wait for FRL to be completed
+	 * Check if the HDMI Link is up and active.
+	 */
+	wait_for(is_active = drm_dp_pcon_hdmi_link_active(&intel_dp->aux) == true, TIMEOUT_HDMI_LINK_ACTIVE_MS);
+
+	if (!is_active)
+		return -ETIMEDOUT;
+
+	/* Verify HDMI Link configuration shows FRL Mode */
+	if (DP_PCON_HDMI_MODE_FRL != drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, &frl_trained_mask)) {
+		drm_dbg(&i915->drm, "HDMI couldn't be trained in FRL Mode\n");
+		return -EINVAL;
+	}
+	drm_dbg(&i915->drm, "MAX_FRL_MASK = %u, FRL_TRAINED_MASK = %u\n", max_frl_bw_mask, frl_trained_mask);
+
+	intel_dp->frl.trained_rate_gbps = intel_dp_pcon_get_frl_mask(frl_trained_mask);
+	intel_dp->frl.is_trained = true;
+	drm_dbg(&i915->drm, "FRL trained with : %d Gbps\n", intel_dp->frl.trained_rate_gbps);
+
+	return 0;
+}
+
+static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp)
+{
+	if (drm_dp_is_branch(intel_dp->dpcd) &&
+	    intel_dp->has_hdmi_sink &&
+	    intel_dp_hdmi_sink_max_frl(intel_dp) > 0)
+		return true;
+
+	return false;
+}
+
+void intel_dp_check_frl_training(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+
+	/* Always go for FRL training if supported */
+	if (!intel_dp_is_hdmi_2_1_sink(intel_dp) ||
+	    intel_dp->frl.is_trained)
+		return;
+
+	if (intel_dp_pcon_start_frl_training(intel_dp) < 0) {
+		int ret, mode;
+
+		drm_dbg(&dev_priv->drm, "Couldnt set FRL mode, continuing with TMDS mode\n");
+		ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
+		mode = drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, NULL);
+
+		if (ret < 0 || mode != DP_PCON_HDMI_MODE_TMDS)
+			drm_dbg(&dev_priv->drm, "Issue with PCON, cannot set TMDS mode\n");
+	} else {
+		drm_dbg(&dev_priv->drm, "FRL training Completed\n");
+	}
+}
+
 static void
 g4x_set_link_train(struct intel_dp *intel_dp,
 		   const struct intel_crtc_state *crtc_state,
@@ -8202,6 +8350,9 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 			       (temp & ~0xf) | 0xd);
 	}
 
+	intel_dp->frl.is_trained = false;
+	intel_dp->frl.trained_rate_gbps = 0;
+
 	return true;
 
 fail:
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index b871a09b6901..58b76a20459c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -144,4 +144,6 @@ bool intel_dp_initial_fastset_check(struct intel_encoder *encoder,
 void intel_dp_sync_state(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *crtc_state);
 
+void intel_dp_check_frl_training(struct intel_dp *intel_dp);
+
 #endif /* __INTEL_DP_H__ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
