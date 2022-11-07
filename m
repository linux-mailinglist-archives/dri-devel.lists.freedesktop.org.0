Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997BA61EBC7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B83910E1FF;
	Mon,  7 Nov 2022 07:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C2410E1FC;
 Mon,  7 Nov 2022 07:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805646; x=1699341646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8WWx59un+2xFogGvnmYb5DwVKMit8ZUwOeNDliHSKSQ=;
 b=PK53qIivQTo6DhMeFQ5m5RmmvuZpK43TS5Lac2bNX6m2wBNISdryB6tX
 uTF6KzXZbCKatV9X9CeF7iLFPdVUy0NpdyazDCmjNzbr6ZeEtizPR40xu
 QaHehgRFrX1Xjf9sJeVrdumqATLsJVlUGhV67dLtYlvX45Gs2GIDS+qBb
 lPs5RbJpdg1pIA4vK5z1uA/Wc8YYAjNJKBGcjRiwFrb14c3/wvYHexoyD
 Z1NcE+bgvV4cCXKU3PlbrKRQ8vwPtOO3ry7MzWbos5LDvrIdxqldHlvsH
 JsuNuf6PKyUIdMzMa2ygX0ig9iOw8BWfeA/AQj/h19wLBrjUEskPh0SzB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463414"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463414"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767325"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767325"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:44 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 15/15] drm/i915/display/mtl: Add functions for FRL trainining
 state machine
Date: Mon,  7 Nov 2022 12:50:45 +0530
Message-Id: <20221107072045.628895-16-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for FRL Link training state and transition
to different states during FRL Link training.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c  |   2 +
 drivers/gpu/drm/i915/display/intel_hdmi.c | 383 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.h |   2 +
 3 files changed, 387 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index cb0d19b6ee56..4b1b8a18863e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2514,6 +2514,8 @@ static void intel_ddi_pre_enable_hdmi(struct intel_atomic_state *state,
 
 	intel_ddi_enable_pipe_clock(encoder, crtc_state);
 
+	intel_hdmi_start_frl(encoder, crtc_state);
+
 	dig_port->set_infoframes(encoder,
 				 crtc_state->has_infoframe,
 				 crtc_state, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9e8ee6d5bc5d..6553763306ff 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3285,3 +3285,386 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 
 	return 0;
 }
+
+static
+bool is_flt_ready(struct intel_encoder *encoder)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
+	struct i2c_adapter *adapter =
+		intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
+
+	return drm_scdc_read_status_flags(adapter) & SCDC_FLT_READY;
+}
+
+static
+bool intel_hdmi_frl_prepare_lts2(struct intel_encoder *encoder,
+				 const struct intel_crtc_state *crtc_state,
+				 int ffe_level)
+{
+#define TIMEOUT_FLT_READY_MS  250
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
+	struct i2c_adapter *adapter =
+		intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
+	bool flt_ready = false;
+	int frl_rate;
+	int frl_lanes;
+
+	frl_rate = crtc_state->frl.required_rate;
+	frl_lanes = crtc_state->frl.required_lanes;
+
+	if (!frl_rate || !frl_lanes)
+		return false;
+
+	/*
+	 * POLL for FRL ready : READ SCDC 0x40 Bit 6 FLT ready
+	 * #TODO Check if 250 msec is required
+	 */
+	wait_for(flt_ready = is_flt_ready(encoder) == true,
+		 TIMEOUT_FLT_READY_MS);
+
+	if (!flt_ready) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "HDMI sink not ready for FRL in %d\n",
+			    TIMEOUT_FLT_READY_MS);
+
+		return false;
+	}
+
+	/*
+	 * #TODO As per spec, during prepare phase LTS2, the TXFFE to be
+	 * programmed to be 0 for each lane in the PHY registers.
+	 */
+
+	if (drm_scdc_config_frl(adapter, frl_rate, frl_lanes, ffe_level) < 0) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "Failed to write SCDC config regs for FRL\n");
+
+		return false;
+	}
+
+	return flt_ready;
+}
+
+enum frl_lt_status {
+	FRL_TRAINING_PASSED,
+	FRL_CHANGE_RATE,
+	FRL_TRAIN_CONTINUE,
+	FRL_TRAIN_RETRAIN,
+	FRL_TRAIN_STOP,
+};
+
+static
+u8 get_frl_update_flag(struct intel_encoder *encoder)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
+	struct i2c_adapter *adapter =
+		intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
+
+	return drm_scdc_read_update_flags(adapter);
+}
+
+static
+int get_link_training_patterns(struct intel_encoder *encoder,
+			       enum drm_scdc_frl_ltp ltp[4])
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
+	struct i2c_adapter *adapter =
+		intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
+
+	return drm_scdc_get_ltp(adapter, ltp);
+}
+
+static enum frl_lt_status
+intel_hdmi_train_lanes(struct intel_encoder *encoder,
+		       const struct intel_crtc_state *crtc_state,
+		       int ffe_level)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	enum transcoder trans = crtc_state->cpu_transcoder;
+	enum drm_scdc_frl_ltp ltp[4];
+	int num_lanes = crtc_state->frl.required_lanes;
+	int lane;
+
+	/*
+	 * LTS3 Link Training in Progress.
+	 * Section 6.4.2.3 Table 6-34.
+	 *
+	 * Transmit link training pattern as requested by the sink
+	 * for a specific rate.
+	 * Source keep on Polling on FLT update flag and keep
+	 * repeating patterns till timeout or request for new rate,
+	 * or training is successful.
+	 */
+	if (!(get_frl_update_flag(encoder) & SCDC_FLT_UPDATE))
+		return FRL_TRAIN_CONTINUE;
+
+	if (get_link_training_patterns(encoder, ltp) < 0)
+		return FRL_TRAIN_STOP;
+
+	if (ltp[0] == ltp[1] && ltp[1] == ltp[2]) {
+		if (num_lanes == 3 || (num_lanes == 4 && ltp[2] == ltp[3])) {
+			if (ltp[0] == SCDC_FRL_NO_LTP)
+				return FRL_TRAINING_PASSED;
+			if (ltp[0] == SCDC_FRL_CHNG_RATE)
+				return FRL_CHANGE_RATE;
+		}
+	}
+
+	for (lane = 0; lane < num_lanes; lane++) {
+		if (ltp[lane] >= SCDC_FRL_LTP1 && ltp[lane] <= SCDC_FRL_LTP8)
+			/* write the LTP for the lane*/
+			intel_de_write(dev_priv, TRANS_HDMI_FRL_TRAIN(trans),
+				       TRANS_HDMI_FRL_LTP(ltp[lane], lane));
+		else if (ltp[lane] == SCDC_FRL_CHNG_FFE) {
+			/*
+			 * #TODO Update TxFFE for the lane
+			 *
+			 * Read the existing TxFFE for the lane, from PHY regs.
+			 * If TxFFE is already at FFE_level (i.e. max level)
+			 * then Set TXFFE0 for the lane.
+			 * Otherwise increment TxFFE for the lane.
+			 */
+		}
+	}
+
+	return FRL_TRAIN_CONTINUE;
+}
+
+static int
+clear_scdc_update_flags(struct intel_encoder *encoder, u8 flags)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
+	struct i2c_adapter *adapter =
+		intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
+
+	return drm_scdc_clear_update_flags(adapter, flags);
+}
+
+static enum frl_lt_status
+frl_train_complete_ltsp(struct intel_encoder *encoder,
+			const struct intel_crtc_state *crtc_state)
+{
+#define FLT_UPDATE_TIMEOUT_MS 200
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	enum transcoder trans = crtc_state->cpu_transcoder;
+	u32 buf;
+	u8 update_flag = 0;
+
+	/*
+	 * Start FRL transmission with only Gap Characters, with Scrambing,
+	 * Reed Solomon FEC, and Super block structure.
+	 */
+	buf = intel_de_read(dev_priv, TRANS_HDMI_FRL_CFG(trans));
+	intel_de_write(dev_priv, TRANS_HDMI_FRL_CFG(trans),
+		       buf | TRANS_HDMI_FRL_TRAINING_COMPLETE);
+
+	/* Clear SCDC FLT_UPDATE by writing 1 */
+	if (clear_scdc_update_flags(encoder, SCDC_FLT_UPDATE) < 0)
+		return FRL_TRAIN_STOP;
+
+	wait_for((update_flag = get_frl_update_flag(encoder)) &
+		 (SCDC_FRL_START | SCDC_FLT_UPDATE), FLT_UPDATE_TIMEOUT_MS);
+
+	if (update_flag & SCDC_FRL_START)
+		return FRL_TRAINING_PASSED;
+
+	if (update_flag & SCDC_FLT_UPDATE) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "FRL update received for retraining the lanes\n");
+		clear_scdc_update_flags(encoder, SCDC_FLT_UPDATE);
+
+		return FRL_TRAIN_RETRAIN;
+	}
+
+	drm_err(&dev_priv->drm, "FRL TRAINING: FRL update timedout\n");
+
+	return FRL_TRAIN_STOP;
+}
+
+static enum frl_lt_status
+intel_hdmi_frl_train_lts3(struct intel_encoder *encoder,
+			  const struct intel_crtc_state *crtc_state,
+			  int ffe_level)
+{
+/*
+ * Time interval specified for link training HDMI2.1 Spec:
+ * Sec 6.4.2.1 Table 6-31
+ */
+#define FLT_TIMEOUT_MS 200
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	enum frl_lt_status status;
+	enum transcoder trans = crtc_state->cpu_transcoder;
+	u32 buf;
+
+	buf = intel_de_read(dev_priv, TRANS_HDMI_FRL_CFG(trans));
+	intel_de_write(dev_priv, TRANS_HDMI_FRL_CFG(trans),
+		       buf | TRANS_HDMI_FRL_ENABLE);
+
+#define done ((status = intel_hdmi_train_lanes(encoder, crtc_state, ffe_level)) != FRL_TRAIN_CONTINUE)
+	wait_for(done, FLT_TIMEOUT_MS);
+
+	/* TIMEDOUT */
+	if (status == FRL_TRAIN_CONTINUE) {
+		drm_err(&dev_priv->drm, "FRL TRAINING: FLT TIMEDOUT\n");
+
+		return FRL_TRAIN_STOP;
+	}
+
+	if (status != FRL_TRAINING_PASSED)
+		return status;
+
+	return frl_train_complete_ltsp(encoder, crtc_state);
+}
+
+static void intel_hdmi_frl_ltsl(struct intel_encoder *encoder,
+				const struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
+	struct i2c_adapter *adapter =
+		intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
+	int lanes = crtc_state->frl.required_lanes;
+
+	/* Clear flags */
+	drm_scdc_config_frl(adapter, 0, lanes, 0);
+	drm_scdc_clear_update_flags(adapter, SCDC_FLT_UPDATE);
+}
+
+static bool get_next_frl_rate(int *curr_rate_gbps, int max_sink_rate)
+{
+	int valid_rate[] =  {48, 40, 32, 24, 18, 9};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(valid_rate); i++) {
+		if (max_sink_rate < valid_rate[i])
+			continue;
+
+		if (*curr_rate_gbps < valid_rate[i]) {
+			*curr_rate_gbps = valid_rate[i];
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int get_ffe_level(int rate_gbps)
+{
+	/*
+	 * #TODO check for FFE_LEVEL to be programmed
+	 *
+	 * Should start with max ffe_levels supported by source. MAX can be 3.
+	 * Currently setting ffe_level = 0.
+	 */
+	return 0;
+}
+
+/*
+ * intel_hdmi_start_frl - Start FRL training for HDMI2.1 sink
+ *
+ */
+void intel_hdmi_start_frl(struct intel_encoder *encoder,
+			  const struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
+	struct intel_hdmi *intel_hdmi = &dig_port->hdmi;
+	struct intel_connector *intel_connector = intel_hdmi->attached_connector;
+	struct drm_connector *connector = &intel_connector->base;
+	int *rate;
+	int max_rate = crtc_state->dsc.compression_enable ? intel_hdmi->max_dsc_frl_rate :
+							intel_hdmi->max_frl_rate;
+	int req_rate = crtc_state->frl.required_lanes * crtc_state->frl.required_rate;
+	int ffe_level = get_ffe_level(req_rate);
+	enum transcoder trans = crtc_state->cpu_transcoder;
+	enum frl_lt_status status;
+	u32 buf = 0;
+
+	if (DISPLAY_VER(dev_priv) < 14)
+		return;
+
+	if (!crtc_state->frl.enable)
+		goto ltsl_tmds_mode;
+
+	if (intel_hdmi->frl.trained &&
+	    intel_hdmi->frl.rate_gbps >= req_rate &&
+	    intel_hdmi->frl.ffe_level == ffe_level) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "[CONNECTOR:%d:%s] FRL Already trained with rate=%d, ffe_level=%d\n",
+			    connector->base.id, connector->name,
+			    req_rate, ffe_level);
+
+		return;
+	}
+
+	intel_hdmi_reset_frl_config(intel_hdmi);
+
+	if (!intel_hdmi_frl_prepare_lts2(encoder, crtc_state, ffe_level))
+		status = FRL_TRAIN_STOP;
+	else
+		status = intel_hdmi_frl_train_lts3(encoder, crtc_state, ffe_level);
+
+	switch (status) {
+	case FRL_TRAINING_PASSED:
+		intel_hdmi->frl.trained = true;
+		intel_hdmi->frl.rate_gbps = req_rate;
+		intel_hdmi->frl.ffe_level = ffe_level;
+		drm_dbg_kms(&dev_priv->drm,
+			    "[CONNECTOR:%d:%s] FRL Training Passed with rate=%d, ffe_level=%d\n",
+			    connector->base.id, connector->name,
+			    req_rate, ffe_level);
+
+		return;
+	case FRL_TRAIN_STOP:
+		/*
+		 * Cannot go with FRL transmission.
+		 * Reset FRL rates so during next modeset TMDS mode will be
+		 * selected.
+		 */
+		if (crtc_state->dsc.compression_enable)
+			intel_hdmi->max_dsc_frl_rate = 0;
+		else
+			intel_hdmi->max_frl_rate = 0;
+		break;
+	case FRL_CHANGE_RATE:
+		/*
+		 * Sink request for change of FRL rate.
+		 * Set FRL rates for the connector with lower rate.
+		 */
+		if (crtc_state->dsc.compression_enable)
+			rate = &intel_hdmi->max_dsc_frl_rate;
+		else
+			rate = &intel_hdmi->max_frl_rate;
+		if (!get_next_frl_rate(rate, max_rate))
+			*rate = 0;
+		break;
+	case FRL_TRAIN_RETRAIN:
+		/*
+		 * For Retraining with same rate, we send a uevent to userspace.
+		 * TODO Need to check how many times we can retry.
+		 */
+		fallthrough;
+	default:
+		break;
+	}
+
+ltsl_tmds_mode:
+	intel_hdmi_frl_ltsl(encoder, crtc_state);
+	buf = intel_de_read(dev_priv, TRANS_HDMI_FRL_CFG(trans));
+	intel_de_write(dev_priv, TRANS_HDMI_FRL_CFG(trans),
+		       buf & ~(TRANS_HDMI_FRL_ENABLE | TRANS_HDMI_FRL_TRAINING_COMPLETE));
+
+	if (crtc_state->frl.enable && !intel_hdmi->frl.trained) {
+		drm_err(&dev_priv->drm,
+			"[CONNECTOR:%d:%s] FRL Training Failed with rate=%d, ffe_level=%d\n",
+			connector->base.id, connector->name,
+			req_rate, ffe_level);
+		/* Send event to user space, to try with next rate or fall back to TMDS */
+		schedule_work(&intel_connector->modeset_retry_work);
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index 774dda2376ed..a0a5c3159079 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -54,5 +54,7 @@ int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
 				  int src_max_slices, int src_max_slice_width,
 				  int hdmi_max_slices, int hdmi_throughput);
 int intel_hdmi_dsc_get_slice_height(int vactive);
+void intel_hdmi_start_frl(struct intel_encoder *encoder,
+			  const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_HDMI_H__ */
-- 
2.25.1

