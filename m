Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B38278703
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 14:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274FB6ECBF;
	Fri, 25 Sep 2020 12:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60C46ECBF;
 Fri, 25 Sep 2020 12:21:08 +0000 (UTC)
IronPort-SDR: vckpHeDmHUGIffMflxyGLHu5EN3aaMkX5fYqe39glJGa9f4xoBRsL3VePNdSAf/NOYKKasOuVK
 giMjiipl9q7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="149163878"
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="149163878"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 05:21:08 -0700
IronPort-SDR: thdUAS5lrAvQPv4zJ09Lp94bm13I+QwD6oBOBJf7RuZEReKFoJFbWBPaJW7WOmGL0PBgxR7x+l
 MZTaEaJhKDxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="383460385"
Received: from unknown (HELO linux-akn.iind.intel.com) ([10.223.34.148])
 by orsmga001.jf.intel.com with ESMTP; 25 Sep 2020 05:21:06 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC 4/7] drm/i915: Add support for starting FRL training for HDMI2.1
 via PCON
Date: Fri, 25 Sep 2020 17:43:37 +0530
Message-Id: <20200925121340.29497-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925121340.29497-1-ankit.k.nautiyal@intel.com>
References: <20200925121340.29497-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org, swati2.sharma@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds functions to start FRL training for an HDMI2.1 sink,
connected via a PCON as a DP branch device.
This patch also adds a new structure for storing frl training related
data, when FRL training is completed.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |   6 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 202 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h       |   2 +
 3 files changed, 210 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 3d4bf9b6a0a2..9a295a43b189 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1264,6 +1264,11 @@ struct intel_dp_compliance {
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
@@ -1312,6 +1317,7 @@ struct intel_dp {
 	unsigned long last_backlight_off;
 	ktime_t panel_power_off_time;
 
+	struct intel_dp_pcon_frl frl;
 	struct notifier_block edp_notifier;
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index bf1e9cf1c0f3..3a8e69e5bbfb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2869,6 +2869,9 @@ static void intel_dp_prepare(struct intel_encoder *encoder,
 			intel_dp->DP |= DP_PIPE_SEL_CHV(crtc->pipe);
 		else
 			intel_dp->DP |= DP_PIPE_SEL(crtc->pipe);
+
+		intel_dp->frl.is_trained = false;
+		intel_dp->frl.trained_rate_gbps = 0;
 	}
 }
 
@@ -3705,6 +3708,9 @@ static void intel_disable_dp(struct intel_atomic_state *state,
 	intel_edp_backlight_off(old_conn_state);
 	intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_OFF);
 	intel_edp_panel_off(intel_dp);
+
+	intel_dp->frl.is_trained = false;
+	intel_dp->frl.trained_rate_gbps = 0;
 }
 
 static void g4x_disable_dp(struct intel_atomic_state *state,
@@ -3799,6 +3805,202 @@ cpt_set_link_train(struct intel_dp *intel_dp,
 	intel_de_posting_read(dev_priv, intel_dp->output_reg);
 }
 
+static int intel_dp_get_max_rate_gbps(struct intel_dp *intel_dp)
+{
+	int max_link_clock, max_lanes, max_rate_khz, max_rate_gbps;
+
+	max_link_clock = intel_dp_max_link_rate(intel_dp);
+	max_lanes = intel_dp_max_lane_count(intel_dp);
+	max_rate_khz = intel_dp_max_data_rate(max_link_clock, max_lanes);
+	max_rate_gbps = 8 * DIV_ROUND_UP(max_rate_khz, 1000000);
+
+	return max_rate_gbps;
+}
+
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
+	int max_frl_mask = 0;
+
+	switch (max_frl) {
+	case 48:
+		max_frl_mask |= DP_PCON_FRL_BW_MASK_48GBPS;
+		break;
+	case 40:
+		max_frl_mask |= DP_PCON_FRL_BW_MASK_40GBPS;
+		break;
+	case 32:
+		max_frl_mask |= DP_PCON_FRL_BW_MASK_32GBPS;
+		break;
+	case 24:
+		max_frl_mask |= DP_PCON_FRL_BW_MASK_24GBPS;
+		break;
+	case 18:
+		max_frl_mask |= DP_PCON_FRL_BW_MASK_18GBPS;
+		break;
+	case 9:
+		max_frl_mask |= DP_PCON_FRL_BW_MASK_9GBPS;
+		break;
+	default:
+		max_frl_mask = 0;
+	}
+
+	return max_frl_mask;
+}
+
+static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
+{
+	struct intel_connector *intel_connector = intel_dp->attached_connector;
+	struct drm_connector *connector = &intel_connector->base;
+
+	return (connector->display_info.hdmi.max_frl_rate_per_lane *
+		connector->display_info.hdmi.max_lane);
+}
+
+static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
+{
+#define PCON_EXTENDED_TRAIN_MODE true
+#define PCON_CONCURRENT_MODE true
+#define PCON_SEQUENTIAL_MODE !PCON_CONCURRENT_MODE
+#define PCON_NORMAL_TRAIN_MODE !PCON_EXTENDED_TRAIN_MODE
+#define TIMEOUT_FRL_READY_MS 500
+#define TIMEOUT_HDMI_LINK_ACTIVE_MS 1000
+
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int max_frl, max_pcon_frl, max_sink_frl, max_rate_gbps, max_frl_edid, ret;
+	u8 max_frl_mask = 0, frl_trained_mask;
+	bool is_active;
+
+	ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
+	if (ret < 0)
+		return ret;
+
+	max_rate_gbps = intel_dp_get_max_rate_gbps(intel_dp);
+	drm_dbg(&i915->drm, "Source max rate = %d Gbps\n", max_rate_gbps);
+
+	max_pcon_frl = drm_dp_get_pcon_max_frl_bw(&intel_dp->aux,
+						  intel_dp->dpcd,
+						  intel_dp->downstream_ports);
+	drm_dbg(&i915->drm, "PCON max rate = %d Gbps\n", max_pcon_frl);
+
+	/* Double Check from HDMI SINK EDID */
+	max_frl_edid = intel_dp_hdmi_sink_max_frl(intel_dp);
+	drm_dbg(&i915->drm, "Sink max rate from EDID = %d Gbps\n", max_frl_edid);
+
+	max_sink_frl = drm_dp_get_hdmi_max_frl_bw(&intel_dp->aux);
+	drm_dbg(&i915->drm, "Sink max rate from PCON = %d Gbps\n", max_sink_frl);
+
+	/* TODO MAX SINK FRL from PCON is not enumerated. Using MAX FRL value
+	 * directly from EDID. Need to confirm from Spec.
+	 */
+	max_frl = min(max_rate_gbps, min(max_frl_edid, max_pcon_frl));
+
+	if (max_frl <= 0)
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
+	max_frl_mask = intel_dp_pcon_set_frl_mask(max_frl);
+	ret = drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl, PCON_SEQUENTIAL_MODE);
+	if (ret < 0)
+		return ret;
+	ret = drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_mask, PCON_NORMAL_TRAIN_MODE);
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
+	/*
+	 * Verify HDMI Link configuration shows FRL Mode.
+	 */
+	if (DP_PCON_HDMI_MODE_FRL != drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, &frl_trained_mask)) {
+		drm_dbg(&i915->drm, "HDMI couldn't be trained in FRL Mode\n");
+		return -EINVAL;
+	}
+	drm_dbg(&i915->drm, "MAX_FRL_MASK = %u, FRL_TRAINED_MASK = %u\n", max_frl_mask, frl_trained_mask);
+
+	/*
+	 * Read HDMI_LINK_STATUS_TRAINED 0x2005 bit 5
+	 * TODO: Details not mentioned in spec. Need to check.
+	 */
+
+	intel_dp->frl.trained_rate_gbps = intel_dp_pcon_get_frl_mask(frl_trained_mask);
+	intel_dp->frl.is_trained = true;
+	drm_dbg(&i915->drm, "FRL trained with : %d Gbps\n", intel_dp->frl.trained_rate_gbps);
+
+	return 0;
+}
+
+static bool intel_dp_is_frl_required(struct intel_dp *intel_dp)
+{
+	if (!intel_dp->frl.is_trained)
+		return true;
+	/*
+	 * #TODO check if the mode really required FRL or can work
+	 * with TMDS mode.
+	 */
+
+	return false;
+}
+
+static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp)
+{
+	if (drm_dp_is_branch(intel_dp->dpcd) &&
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
+	if (!intel_dp_is_hdmi_2_1_sink(intel_dp) ||
+	    !intel_dp_is_frl_required(intel_dp))
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
+	}
+
+	else
+		drm_dbg(&dev_priv->drm, "FRL training Completed\n");
+}
+
 static void
 g4x_set_link_train(struct intel_dp *intel_dp,
 		   u8 dp_train_pat)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 08a1c0aa8b94..d67ef2945064 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -139,4 +139,6 @@ void intel_ddi_update_pipe(struct intel_atomic_state *state,
 int intel_dp_init_hdcp(struct intel_digital_port *dig_port,
 		       struct intel_connector *intel_connector);
 
+void intel_dp_check_frl_training(struct intel_dp *intel_dp);
+
 #endif /* __INTEL_DP_H__ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
