Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9E153FE7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6EF6FA20;
	Thu,  6 Feb 2020 08:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3DF6E480;
 Thu,  6 Feb 2020 08:00:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so5931572wrh.5;
 Thu, 06 Feb 2020 00:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DxUeVHZUkslJRF3YJwYTDJ4JwIYeX3ifc5q95FenCpM=;
 b=U9Bh2G1wNTHFYyUbMuMxuX1ldsl6R3uof/NkCPf1cCQgtEAtc+vMNQiNRTj+WRWQBi
 3ZQo8LnYcGW1IZaE5Q5oF/tkX70C8ODrijHMSZ+mxgk8CH0pLjqm500KKcihe1crhCxe
 l9ZW7oQplDoraznAJX7kLuZDA/rY4DcsVdpyJls3H0xRavKCHFZTQiDdjegyfp8ISMOQ
 go6nYDcECCfa++bgtilGIRIrs9cYGdQ9qdoYTGjHTIR5inshKX7xvUK16W61ggwukmAK
 Vi7mssGX+gIK5crMg0Iom62Ze87RkGC2xqX0s32ZuQ4eONfiqGUzzYUI9irWJVD6FQTX
 B+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DxUeVHZUkslJRF3YJwYTDJ4JwIYeX3ifc5q95FenCpM=;
 b=YSipy2Wv3TVjfMugZ3SgRuNBmb/rtrP+n9g20mkkiOSB2uDBLmeplLnx5Q2nkLlrol
 ltvYsUImDvMVCoYL4j9raA5VnBfSsh5hk/iSTaAAuL7KFt5RV3e+3m/BlKLZz1tiMruv
 ZUsnzSZuoxFJe4UnuIcwPMIfs3pG2X1IundEqu4QkCaojhRtZusMVlAyErAr089Z50OP
 EiMqFnwwWj0e5Ny/30R1U0m6q0fZv6ZL+Npmjb4vuSETX74IwoflbiSkpgyewY8BbaYt
 oVUXgnhsANnGsBHh980jC5BFc9KHtOr7vQa7YcXnbDai807vi68UxMw3eSZrfIWSZ+4f
 auQQ==
X-Gm-Message-State: APjAAAVzjyJcJq3QbOqAykjrboW1HcqkCgRWUtO2CDl2dP0zG9ZMBSmY
 PfT4GRjvkbU3bJqieoeAt7h9kQkj+d8=
X-Google-Smtp-Source: APXvYqxfeqM4wI1HOLkb1iCVhZToLnyCqCkF6lwmCf+qAtkxikO/7EPl0JZiipGFNhu7ekDD0XZsFg==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr2319788wra.8.1580976026929;
 Thu, 06 Feb 2020 00:00:26 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:00:26 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 01/12] drm/i915/dp: convert to struct drm_device based
 logging macros.
Date: Thu,  6 Feb 2020 11:00:02 +0300
Message-Id: <20200206080014.13759-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206080014.13759-1-wambui.karugax@gmail.com>
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts various instances of the printk based drm logging macros to the
struct drm_device based logging macros in i915/display/intel_dp.c.
This also involves extracting the struct drm_i915_private device pointer
from various intel types to be used in the macros.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 320 +++++++++++++++---------
 1 file changed, 198 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f4dede6253f8..fab6e0af5d9d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -461,7 +461,8 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 		    !intel_dp_can_link_train_fallback_for_edp(intel_dp,
 							      intel_dp->common_rates[index - 1],
 							      lane_count)) {
-			DRM_DEBUG_KMS("Retrying Link training for eDP with same parameters\n");
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "Retrying Link training for eDP with same parameters\n");
 			return 0;
 		}
 		intel_dp->max_link_rate = intel_dp->common_rates[index - 1];
@@ -471,13 +472,15 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 		    !intel_dp_can_link_train_fallback_for_edp(intel_dp,
 							      intel_dp_max_common_rate(intel_dp),
 							      lane_count >> 1)) {
-			DRM_DEBUG_KMS("Retrying Link training for eDP with same parameters\n");
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "Retrying Link training for eDP with same parameters\n");
 			return 0;
 		}
 		intel_dp->max_link_rate = intel_dp_max_common_rate(intel_dp);
 		intel_dp->max_link_lane_count = lane_count >> 1;
 	} else {
-		DRM_ERROR("Link Training Unsuccessful\n");
+		drm_err(&dp_to_i915(intel_dp)->drm,
+			"Link Training Unsuccessful\n");
 		return -1;
 	}
 
@@ -564,8 +567,9 @@ static u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
 
 	max_slice_width = drm_dp_dsc_sink_max_slice_width(intel_dp->dsc_dpcd);
 	if (max_slice_width < DP_DSC_MIN_SLICE_WIDTH_VALUE) {
-		DRM_DEBUG_KMS("Unsupported slice width %d by DP DSC Sink device\n",
-			      max_slice_width);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Unsupported slice width %d by DP DSC Sink device\n",
+			    max_slice_width);
 		return 0;
 	}
 	/* Also take into account max slice width */
@@ -583,7 +587,8 @@ static u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
 			return valid_dsc_slicecount[i];
 	}
 
-	DRM_DEBUG_KMS("Unsupported Slice Count %d\n", min_slice_count);
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "Unsupported Slice Count %d\n", min_slice_count);
 	return 0;
 }
 
@@ -1827,15 +1832,15 @@ static void intel_dp_print_rates(struct intel_dp *intel_dp)
 
 	snprintf_int_array(str, sizeof(str),
 			   intel_dp->source_rates, intel_dp->num_source_rates);
-	DRM_DEBUG_KMS("source rates: %s\n", str);
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm, "source rates: %s\n", str);
 
 	snprintf_int_array(str, sizeof(str),
 			   intel_dp->sink_rates, intel_dp->num_sink_rates);
-	DRM_DEBUG_KMS("sink rates: %s\n", str);
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm, "sink rates: %s\n", str);
 
 	snprintf_int_array(str, sizeof(str),
 			   intel_dp->common_rates, intel_dp->num_common_rates);
-	DRM_DEBUG_KMS("common rates: %s\n", str);
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm, "common rates: %s\n", str);
 }
 
 int
@@ -1949,7 +1954,8 @@ intel_dp_adjust_compliance_config(struct intel_dp *intel_dp,
 		limits->min_bpp = limits->max_bpp = bpp;
 		pipe_config->dither_force_disable = bpp == 6 * 3;
 
-		DRM_DEBUG_KMS("Setting pipe_bpp to %d\n", bpp);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Setting pipe_bpp to %d\n", bpp);
 	}
 
 	/* Use values requested by Compliance Test Request */
@@ -2077,7 +2083,8 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
 
 	line_buf_depth = drm_dp_dsc_sink_line_buf_depth(intel_dp->dsc_dpcd);
 	if (!line_buf_depth) {
-		DRM_DEBUG_KMS("DSC Sink Line Buffer Depth invalid\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "DSC Sink Line Buffer Depth invalid\n");
 		return -EINVAL;
 	}
 
@@ -2219,6 +2226,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 {
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct link_config_limits limits;
 	int common_len;
 	int ret;
@@ -2252,11 +2260,11 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 
 	intel_dp_adjust_compliance_config(intel_dp, pipe_config, &limits);
 
-	DRM_DEBUG_KMS("DP link computation with max lane count %i "
-		      "max rate %d max bpp %d pixel clock %iKHz\n",
-		      limits.max_lane_count,
-		      intel_dp->common_rates[limits.max_clock],
-		      limits.max_bpp, adjusted_mode->crtc_clock);
+	drm_dbg_kms(&i915->drm, "DP link computation with max lane count %i "
+		    "max rate %d max bpp %d pixel clock %iKHz\n",
+		    limits.max_lane_count,
+		    intel_dp->common_rates[limits.max_clock],
+		    limits.max_bpp, adjusted_mode->crtc_clock);
 
 	/*
 	 * Optimize for slow and wide. This is the place to add alternative
@@ -2265,7 +2273,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 	ret = intel_dp_compute_link_config_wide(intel_dp, pipe_config, &limits);
 
 	/* enable compression if the mode doesn't fit available BW */
-	DRM_DEBUG_KMS("Force DSC en = %d\n", intel_dp->force_dsc_en);
+	drm_dbg_kms(&i915->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
 	if (ret || intel_dp->force_dsc_en) {
 		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
 						  conn_state, &limits);
@@ -2274,26 +2282,29 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 	}
 
 	if (pipe_config->dsc.compression_enable) {
-		DRM_DEBUG_KMS("DP lane count %d clock %d Input bpp %d Compressed bpp %d\n",
-			      pipe_config->lane_count, pipe_config->port_clock,
-			      pipe_config->pipe_bpp,
-			      pipe_config->dsc.compressed_bpp);
-
-		DRM_DEBUG_KMS("DP link rate required %i available %i\n",
-			      intel_dp_link_required(adjusted_mode->crtc_clock,
-						     pipe_config->dsc.compressed_bpp),
-			      intel_dp_max_data_rate(pipe_config->port_clock,
-						     pipe_config->lane_count));
+		drm_dbg_kms(&i915->drm,
+			    "DP lane count %d clock %d Input bpp %d Compressed bpp %d\n",
+			    pipe_config->lane_count, pipe_config->port_clock,
+			    pipe_config->pipe_bpp,
+			    pipe_config->dsc.compressed_bpp);
+
+		drm_dbg_kms(&i915->drm,
+			    "DP link rate required %i available %i\n",
+			    intel_dp_link_required(adjusted_mode->crtc_clock,
+						   pipe_config->dsc.compressed_bpp),
+			    intel_dp_max_data_rate(pipe_config->port_clock,
+						   pipe_config->lane_count));
 	} else {
-		DRM_DEBUG_KMS("DP lane count %d clock %d bpp %d\n",
-			      pipe_config->lane_count, pipe_config->port_clock,
-			      pipe_config->pipe_bpp);
+		drm_dbg_kms(&i915->drm, "DP lane count %d clock %d bpp %d\n",
+			    pipe_config->lane_count, pipe_config->port_clock,
+			    pipe_config->pipe_bpp);
 
-		DRM_DEBUG_KMS("DP link rate required %i available %i\n",
-			      intel_dp_link_required(adjusted_mode->crtc_clock,
-						     pipe_config->pipe_bpp),
-			      intel_dp_max_data_rate(pipe_config->port_clock,
-						     pipe_config->lane_count));
+		drm_dbg_kms(&i915->drm,
+			    "DP link rate required %i available %i\n",
+			    intel_dp_link_required(adjusted_mode->crtc_clock,
+						   pipe_config->pipe_bpp),
+			    intel_dp_max_data_rate(pipe_config->port_clock,
+						   pipe_config->lane_count));
 	}
 	return 0;
 }
@@ -2319,7 +2330,8 @@ intel_dp_ycbcr420_config(struct intel_dp *intel_dp,
 	/* YCBCR 420 output conversion needs a scaler */
 	ret = skl_update_scaler_crtc(crtc_state);
 	if (ret) {
-		DRM_DEBUG_KMS("Scaler allocation for output failed\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Scaler allocation for output failed\n");
 		return ret;
 	}
 
@@ -2621,13 +2633,14 @@ static void wait_panel_status(struct intel_dp *intel_dp,
 
 static void wait_panel_on(struct intel_dp *intel_dp)
 {
-	DRM_DEBUG_KMS("Wait for panel power on\n");
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm, "Wait for panel power on\n");
 	wait_panel_status(intel_dp, IDLE_ON_MASK, IDLE_ON_VALUE);
 }
 
 static void wait_panel_off(struct intel_dp *intel_dp)
 {
-	DRM_DEBUG_KMS("Wait for panel power off time\n");
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "Wait for panel power off time\n");
 	wait_panel_status(intel_dp, IDLE_OFF_MASK, IDLE_OFF_VALUE);
 }
 
@@ -2636,7 +2649,8 @@ static void wait_panel_power_cycle(struct intel_dp *intel_dp)
 	ktime_t panel_power_on_time;
 	s64 panel_power_off_duration;
 
-	DRM_DEBUG_KMS("Wait for panel power cycle\n");
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "Wait for panel power cycle\n");
 
 	/* take the difference of currrent time and panel power off time
 	 * and then make panel wait for t11_t12 if needed. */
@@ -3003,7 +3017,7 @@ void intel_edp_backlight_on(const struct intel_crtc_state *crtc_state,
 	if (!intel_dp_is_edp(intel_dp))
 		return;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm, "\n");
 
 	intel_panel_enable_backlight(crtc_state, conn_state);
 	_intel_edp_backlight_on(intel_dp);
@@ -3041,7 +3055,7 @@ void intel_edp_backlight_off(const struct drm_connector_state *old_conn_state)
 	if (!intel_dp_is_edp(intel_dp))
 		return;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm, "\n");
 
 	_intel_edp_backlight_off(intel_dp);
 	intel_panel_disable_backlight(old_conn_state);
@@ -3064,8 +3078,9 @@ static void intel_edp_backlight_power(struct intel_connector *connector,
 	if (is_enabled == enable)
 		return;
 
-	DRM_DEBUG_KMS("panel power control backlight %s\n",
-		      enable ? "enable" : "disable");
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "panel power control backlight %s\n",
+		    enable ? "enable" : "disable");
 
 	if (enable)
 		_intel_edp_backlight_on(intel_dp);
@@ -3183,8 +3198,9 @@ void intel_dp_sink_set_decompression_state(struct intel_dp *intel_dp,
 	ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_DSC_ENABLE,
 				 enable ? DP_DECOMPRESSION_EN : 0);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Failed to %s sink decompression state\n",
-			      enable ? "enable" : "disable");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Failed to %s sink decompression state\n",
+			    enable ? "enable" : "disable");
 }
 
 /* If the sink supports it, try to set the power state appropriately */
@@ -3222,8 +3238,9 @@ void intel_dp_sink_dpms(struct intel_dp *intel_dp, int mode)
 	}
 
 	if (ret != 1)
-		DRM_DEBUG_KMS("failed to %s sink power state\n",
-			      mode == DRM_MODE_DPMS_ON ? "enable" : "disable");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "failed to %s sink power state\n",
+			    mode == DRM_MODE_DPMS_ON ? "enable" : "disable");
 }
 
 static bool cpt_dp_port_selected(struct drm_i915_private *dev_priv,
@@ -4319,20 +4336,22 @@ intel_dp_extended_receiver_capabilities(struct intel_dp *intel_dp)
 
 	if (drm_dp_dpcd_read(&intel_dp->aux, DP_DP13_DPCD_REV,
 			     &dpcd_ext, sizeof(dpcd_ext)) != sizeof(dpcd_ext)) {
-		DRM_ERROR("DPCD failed read at extended capabilities\n");
+		drm_err(&dp_to_i915(intel_dp)->drm,
+			"DPCD failed read at extended capabilities\n");
 		return;
 	}
 
 	if (intel_dp->dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
-		DRM_DEBUG_KMS("DPCD extended DPCD rev less than base DPCD rev\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "DPCD extended DPCD rev less than base DPCD rev\n");
 		return;
 	}
 
 	if (!memcmp(intel_dp->dpcd, dpcd_ext, sizeof(dpcd_ext)))
 		return;
 
-	DRM_DEBUG_KMS("Base DPCD: %*ph\n",
-		      (int)sizeof(intel_dp->dpcd), intel_dp->dpcd);
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm, "Base DPCD: %*ph\n",
+		    (int)sizeof(intel_dp->dpcd), intel_dp->dpcd);
 
 	memcpy(intel_dp->dpcd, dpcd_ext, sizeof(dpcd_ext));
 }
@@ -4346,7 +4365,8 @@ intel_dp_read_dpcd(struct intel_dp *intel_dp)
 
 	intel_dp_extended_receiver_capabilities(intel_dp);
 
-	DRM_DEBUG_KMS("DPCD: %*ph\n", (int) sizeof(intel_dp->dpcd), intel_dp->dpcd);
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm, "DPCD: %*ph\n",
+		    (int)sizeof(intel_dp->dpcd), intel_dp->dpcd);
 
 	return intel_dp->dpcd[DP_DPCD_REV] != 0;
 }
@@ -4378,20 +4398,23 @@ static void intel_dp_get_dsc_sink_cap(struct intel_dp *intel_dp)
 		if (drm_dp_dpcd_read(&intel_dp->aux, DP_DSC_SUPPORT,
 				     intel_dp->dsc_dpcd,
 				     sizeof(intel_dp->dsc_dpcd)) < 0)
-			DRM_ERROR("Failed to read DPCD register 0x%x\n",
-				  DP_DSC_SUPPORT);
+			drm_err(&dp_to_i915(intel_dp)->drm,
+				"Failed to read DPCD register 0x%x\n",
+				DP_DSC_SUPPORT);
 
-		DRM_DEBUG_KMS("DSC DPCD: %*ph\n",
-			      (int)sizeof(intel_dp->dsc_dpcd),
-			      intel_dp->dsc_dpcd);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm, "DSC DPCD: %*ph\n",
+			    (int)sizeof(intel_dp->dsc_dpcd),
+			    intel_dp->dsc_dpcd);
 
 		/* FEC is supported only on DP 1.4 */
 		if (!intel_dp_is_edp(intel_dp) &&
 		    drm_dp_dpcd_readb(&intel_dp->aux, DP_FEC_CAPABILITY,
 				      &intel_dp->fec_capable) < 0)
-			DRM_ERROR("Failed to read FEC DPCD register\n");
+			drm_err(&dp_to_i915(intel_dp)->drm,
+				"Failed to read FEC DPCD register\n");
 
-		DRM_DEBUG_KMS("FEC CAPABILITY: %x\n", intel_dp->fec_capable);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "FEC CAPABILITY: %x\n", intel_dp->fec_capable);
 	}
 }
 
@@ -4568,10 +4591,11 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
 		&dp_to_dig_port(intel_dp)->base;
 	bool sink_can_mst = intel_dp_sink_can_mst(intel_dp);
 
-	DRM_DEBUG_KMS("[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
-		      encoder->base.base.id, encoder->base.name,
-		      yesno(intel_dp->can_mst), yesno(sink_can_mst),
-		      yesno(i915_modparams.enable_dp_mst));
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
+		    encoder->base.base.id, encoder->base.name,
+		    yesno(intel_dp->can_mst), yesno(sink_can_mst),
+		    yesno(i915_modparams.enable_dp_mst));
 
 	if (!intel_dp->can_mst)
 		return;
@@ -4756,18 +4780,21 @@ intel_dp_setup_hdr_metadata_infoframe_sdp(struct intel_dp *intel_dp,
 
 	ret = drm_hdmi_infoframe_set_hdr_metadata(&drm_infoframe, conn_state);
 	if (ret) {
-		DRM_DEBUG_KMS("couldn't set HDR metadata in infoframe\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "couldn't set HDR metadata in infoframe\n");
 		return;
 	}
 
 	len = hdmi_drm_infoframe_pack_only(&drm_infoframe, buf, sizeof(buf));
 	if (len < 0) {
-		DRM_DEBUG_KMS("buffer size is smaller than hdr metadata infoframe\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "buffer size is smaller than hdr metadata infoframe\n");
 		return;
 	}
 
 	if (len != infoframe_size) {
-		DRM_DEBUG_KMS("wrong static hdr metadata size\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "wrong static hdr metadata size\n");
 		return;
 	}
 
@@ -4856,7 +4883,8 @@ static u8 intel_dp_autotest_link_training(struct intel_dp *intel_dp)
 				   &test_lane_count);
 
 	if (status <= 0) {
-		DRM_DEBUG_KMS("Lane count read failed\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Lane count read failed\n");
 		return DP_TEST_NAK;
 	}
 	test_lane_count &= DP_MAX_LANE_COUNT_MASK;
@@ -4864,7 +4892,8 @@ static u8 intel_dp_autotest_link_training(struct intel_dp *intel_dp)
 	status = drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_LINK_RATE,
 				   &test_link_bw);
 	if (status <= 0) {
-		DRM_DEBUG_KMS("Link Rate read failed\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Link Rate read failed\n");
 		return DP_TEST_NAK;
 	}
 	test_link_rate = drm_dp_bw_code_to_link_rate(test_link_bw);
@@ -4882,6 +4911,7 @@ static u8 intel_dp_autotest_link_training(struct intel_dp *intel_dp)
 
 static u8 intel_dp_autotest_video_pattern(struct intel_dp *intel_dp)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	u8 test_pattern;
 	u8 test_misc;
 	__be16 h_width, v_height;
@@ -4891,7 +4921,7 @@ static u8 intel_dp_autotest_video_pattern(struct intel_dp *intel_dp)
 	status = drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_PATTERN,
 				   &test_pattern);
 	if (status <= 0) {
-		DRM_DEBUG_KMS("Test pattern read failed\n");
+		drm_dbg_kms(&i915->drm, "Test pattern read failed\n");
 		return DP_TEST_NAK;
 	}
 	if (test_pattern != DP_COLOR_RAMP)
@@ -4900,21 +4930,21 @@ static u8 intel_dp_autotest_video_pattern(struct intel_dp *intel_dp)
 	status = drm_dp_dpcd_read(&intel_dp->aux, DP_TEST_H_WIDTH_HI,
 				  &h_width, 2);
 	if (status <= 0) {
-		DRM_DEBUG_KMS("H Width read failed\n");
+		drm_dbg_kms(&i915->drm, "H Width read failed\n");
 		return DP_TEST_NAK;
 	}
 
 	status = drm_dp_dpcd_read(&intel_dp->aux, DP_TEST_V_HEIGHT_HI,
 				  &v_height, 2);
 	if (status <= 0) {
-		DRM_DEBUG_KMS("V Height read failed\n");
+		drm_dbg_kms(&i915->drm, "V Height read failed\n");
 		return DP_TEST_NAK;
 	}
 
 	status = drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_MISC0,
 				   &test_misc);
 	if (status <= 0) {
-		DRM_DEBUG_KMS("TEST MISC read failed\n");
+		drm_dbg_kms(&i915->drm, "TEST MISC read failed\n");
 		return DP_TEST_NAK;
 	}
 	if ((test_misc & DP_TEST_COLOR_FORMAT_MASK) != DP_COLOR_FORMAT_RGB)
@@ -4959,9 +4989,10 @@ static u8 intel_dp_autotest_edid(struct intel_dp *intel_dp)
 		 */
 		if (intel_dp->aux.i2c_nack_count > 0 ||
 			intel_dp->aux.i2c_defer_count > 0)
-			DRM_DEBUG_KMS("EDID read had %d NACKs, %d DEFERs\n",
-				      intel_dp->aux.i2c_nack_count,
-				      intel_dp->aux.i2c_defer_count);
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "EDID read had %d NACKs, %d DEFERs\n",
+				    intel_dp->aux.i2c_nack_count,
+				    intel_dp->aux.i2c_defer_count);
 		intel_dp->compliance.test_data.edid = INTEL_DP_RESOLUTION_FAILSAFE;
 	} else {
 		struct edid *block = intel_connector->detect_edid;
@@ -4973,7 +5004,8 @@ static u8 intel_dp_autotest_edid(struct intel_dp *intel_dp)
 
 		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TEST_EDID_CHECKSUM,
 				       block->checksum) <= 0)
-			DRM_DEBUG_KMS("Failed to write EDID checksum\n");
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "Failed to write EDID checksum\n");
 
 		test_result = DP_TEST_ACK | DP_TEST_EDID_CHECKSUM_WRITE;
 		intel_dp->compliance.test_data.edid = INTEL_DP_RESOLUTION_PREFERRED;
@@ -4999,29 +5031,35 @@ static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
 
 	status = drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_REQUEST, &request);
 	if (status <= 0) {
-		DRM_DEBUG_KMS("Could not read test request from sink\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Could not read test request from sink\n");
 		goto update_status;
 	}
 
 	switch (request) {
 	case DP_TEST_LINK_TRAINING:
-		DRM_DEBUG_KMS("LINK_TRAINING test requested\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "LINK_TRAINING test requested\n");
 		response = intel_dp_autotest_link_training(intel_dp);
 		break;
 	case DP_TEST_LINK_VIDEO_PATTERN:
-		DRM_DEBUG_KMS("TEST_PATTERN test requested\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "TEST_PATTERN test requested\n");
 		response = intel_dp_autotest_video_pattern(intel_dp);
 		break;
 	case DP_TEST_LINK_EDID_READ:
-		DRM_DEBUG_KMS("EDID test requested\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "EDID test requested\n");
 		response = intel_dp_autotest_edid(intel_dp);
 		break;
 	case DP_TEST_LINK_PHY_TEST_PATTERN:
-		DRM_DEBUG_KMS("PHY_PATTERN test requested\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "PHY_PATTERN test requested\n");
 		response = intel_dp_autotest_phy_pattern(intel_dp);
 		break;
 	default:
-		DRM_DEBUG_KMS("Invalid test request '%02x'\n", request);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Invalid test request '%02x'\n", request);
 		break;
 	}
 
@@ -5031,7 +5069,8 @@ static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
 update_status:
 	status = drm_dp_dpcd_writeb(&intel_dp->aux, DP_TEST_RESPONSE, response);
 	if (status <= 0)
-		DRM_DEBUG_KMS("Could not write test response to sink\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Could not write test response to sink\n");
 }
 
 static int
@@ -5053,12 +5092,14 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 			/* check link status - esi[10] = 0x200c */
 			if (intel_dp->active_mst_links > 0 &&
 			    !drm_dp_channel_eq_ok(&esi[10], intel_dp->lane_count)) {
-				DRM_DEBUG_KMS("channel EQ not ok, retraining\n");
+				drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+					    "channel EQ not ok, retraining\n");
 				intel_dp_start_link_train(intel_dp);
 				intel_dp_stop_link_train(intel_dp);
 			}
 
-			DRM_DEBUG_KMS("got esi %3ph\n", esi);
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "got esi %3ph\n", esi);
 			ret = drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
 
 			if (handled) {
@@ -5074,7 +5115,8 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 
 				bret = intel_dp_get_sink_irq_esi(intel_dp, esi);
 				if (bret == true) {
-					DRM_DEBUG_KMS("got esi2 %3ph\n", esi);
+					drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+						    "got esi2 %3ph\n", esi);
 					goto go_again;
 				}
 			} else
@@ -5082,7 +5124,8 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 
 			return ret;
 		} else {
-			DRM_DEBUG_KMS("failed to get ESI - device may have failed\n");
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "failed to get ESI - device may have failed\n");
 			intel_dp->is_mst = false;
 			drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
 							intel_dp->is_mst);
@@ -5261,7 +5304,8 @@ static void intel_dp_check_service_irq(struct intel_dp *intel_dp)
 		intel_hdcp_handle_cp_irq(intel_dp->attached_connector);
 
 	if (val & DP_SINK_SPECIFIC_IRQ)
-		DRM_DEBUG_DRIVER("Sink specific irq unhandled\n");
+		drm_dbg(&dp_to_i915(intel_dp)->drm,
+			"Sink specific irq unhandled\n");
 }
 
 /*
@@ -5375,7 +5419,8 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 	}
 
 	/* Anything else is out of spec, warn and ignore */
-	DRM_DEBUG_KMS("Broken DP branch device, ignoring\n");
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "Broken DP branch device, ignoring\n");
 	return connector_status_disconnected;
 }
 
@@ -5853,8 +5898,9 @@ intel_dp_connector_register(struct drm_connector *connector)
 
 	i915_debugfs_connector_add(connector);
 
-	DRM_DEBUG_KMS("registering %s bus for %s\n",
-		      intel_dp->aux.name, connector->kdev->kobj.name);
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "registering %s bus for %s\n",
+		    intel_dp->aux.name, connector->kdev->kobj.name);
 
 	intel_dp->aux.dev = connector->kdev;
 	ret = drm_dp_aux_register(&intel_dp->aux);
@@ -5954,8 +6000,9 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
 	dpcd_ret = drm_dp_dpcd_write(&intel_dig_port->dp.aux, DP_AUX_HDCP_AN,
 				     an, DRM_HDCP_AN_LEN);
 	if (dpcd_ret != DRM_HDCP_AN_LEN) {
-		DRM_DEBUG_KMS("Failed to write An over DP/AUX (%zd)\n",
-			      dpcd_ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Failed to write An over DP/AUX (%zd)\n",
+			    dpcd_ret);
 		return dpcd_ret >= 0 ? -EIO : dpcd_ret;
 	}
 
@@ -5971,17 +6018,20 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
 				rxbuf, sizeof(rxbuf),
 				DP_AUX_CH_CTL_AUX_AKSV_SELECT);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Write Aksv over DP/AUX failed (%d)\n", ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Write Aksv over DP/AUX failed (%d)\n", ret);
 		return ret;
 	} else if (ret == 0) {
-		DRM_DEBUG_KMS("Aksv write over DP/AUX was empty\n");
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Aksv write over DP/AUX was empty\n");
 		return -EIO;
 	}
 
 	reply = (rxbuf[0] >> 4) & DP_AUX_NATIVE_REPLY_MASK;
 	if (reply != DP_AUX_NATIVE_REPLY_ACK) {
-		DRM_DEBUG_KMS("Aksv write: no DP_AUX_NATIVE_REPLY_ACK %x\n",
-			      reply);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Aksv write: no DP_AUX_NATIVE_REPLY_ACK %x\n",
+			    reply);
 		return -EIO;
 	}
 	return 0;
@@ -5990,11 +6040,13 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
 static int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
 				   u8 *bksv)
 {
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	ssize_t ret;
 	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
 			       DRM_HDCP_KSV_LEN);
 	if (ret != DRM_HDCP_KSV_LEN) {
-		DRM_DEBUG_KMS("Read Bksv from DP/AUX failed (%zd)\n", ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Read Bksv from DP/AUX failed (%zd)\n", ret);
 		return ret >= 0 ? -EIO : ret;
 	}
 	return 0;
@@ -6003,6 +6055,7 @@ static int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
 static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
 				      u8 *bstatus)
 {
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	ssize_t ret;
 	/*
 	 * For some reason the HDMI and DP HDCP specs call this register
@@ -6012,7 +6065,8 @@ static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
 	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BINFO,
 			       bstatus, DRM_HDCP_BSTATUS_LEN);
 	if (ret != DRM_HDCP_BSTATUS_LEN) {
-		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
 		return ret >= 0 ? -EIO : ret;
 	}
 	return 0;
@@ -6022,12 +6076,14 @@ static
 int intel_dp_hdcp_read_bcaps(struct intel_digital_port *intel_dig_port,
 			     u8 *bcaps)
 {
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	ssize_t ret;
 
 	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BCAPS,
 			       bcaps, 1);
 	if (ret != 1) {
-		DRM_DEBUG_KMS("Read bcaps from DP/AUX failed (%zd)\n", ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Read bcaps from DP/AUX failed (%zd)\n", ret);
 		return ret >= 0 ? -EIO : ret;
 	}
 
@@ -6053,11 +6109,13 @@ static
 int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *intel_dig_port,
 				u8 *ri_prime)
 {
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	ssize_t ret;
 	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_RI_PRIME,
 			       ri_prime, DRM_HDCP_RI_LEN);
 	if (ret != DRM_HDCP_RI_LEN) {
-		DRM_DEBUG_KMS("Read Ri' from DP/AUX failed (%zd)\n", ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Read Ri' from DP/AUX failed (%zd)\n", ret);
 		return ret >= 0 ? -EIO : ret;
 	}
 	return 0;
@@ -6067,12 +6125,14 @@ static
 int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *intel_dig_port,
 				 bool *ksv_ready)
 {
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	ssize_t ret;
 	u8 bstatus;
 	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
 			       &bstatus, 1);
 	if (ret != 1) {
-		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
 		return ret >= 0 ? -EIO : ret;
 	}
 	*ksv_ready = bstatus & DP_BSTATUS_READY;
@@ -6083,19 +6143,21 @@ static
 int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *intel_dig_port,
 				int num_downstream, u8 *ksv_fifo)
 {
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	ssize_t ret;
 	int i;
 
 	/* KSV list is read via 15 byte window (3 entries @ 5 bytes each) */
 	for (i = 0; i < num_downstream; i += 3) {
 		size_t len = min(num_downstream - i, 3) * DRM_HDCP_KSV_LEN;
-		ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
+		ret = drm_dp_dpcd_read(&intel_dp->aux,
 				       DP_AUX_HDCP_KSV_FIFO,
 				       ksv_fifo + i * DRM_HDCP_KSV_LEN,
 				       len);
 		if (ret != len) {
-			DRM_DEBUG_KMS("Read ksv[%d] from DP/AUX failed (%zd)\n",
-				      i, ret);
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "Read ksv[%d] from DP/AUX failed (%zd)\n",
+				    i, ret);
 			return ret >= 0 ? -EIO : ret;
 		}
 	}
@@ -6106,6 +6168,7 @@ static
 int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig_port,
 				    int i, u32 *part)
 {
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	ssize_t ret;
 
 	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
@@ -6115,7 +6178,8 @@ int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig_port,
 			       DP_AUX_HDCP_V_PRIME(i), part,
 			       DRM_HDCP_V_PRIME_PART_LEN);
 	if (ret != DRM_HDCP_V_PRIME_PART_LEN) {
-		DRM_DEBUG_KMS("Read v'[%d] from DP/AUX failed (%zd)\n", i, ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Read v'[%d] from DP/AUX failed (%zd)\n", i, ret);
 		return ret >= 0 ? -EIO : ret;
 	}
 	return 0;
@@ -6132,13 +6196,15 @@ int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
 static
 bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
 {
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	ssize_t ret;
 	u8 bstatus;
 
 	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
 			       &bstatus, 1);
 	if (ret != 1) {
-		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
 		return false;
 	}
 
@@ -6213,13 +6279,15 @@ static inline
 int intel_dp_hdcp2_read_rx_status(struct intel_digital_port *intel_dig_port,
 				  u8 *rx_status)
 {
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	ssize_t ret;
 
 	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
 			       DP_HDCP_2_2_REG_RXSTATUS_OFFSET, rx_status,
 			       HDCP_2_2_DP_RXSTATUS_LEN);
 	if (ret != HDCP_2_2_DP_RXSTATUS_LEN) {
-		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
 		return ret >= 0 ? -EIO : ret;
 	}
 
@@ -6230,6 +6298,7 @@ static
 int hdcp2_detect_msg_availability(struct intel_digital_port *intel_dig_port,
 				  u8 msg_id, bool *msg_ready)
 {
+	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
 	u8 rx_status;
 	int ret;
 
@@ -6252,7 +6321,7 @@ int hdcp2_detect_msg_availability(struct intel_digital_port *intel_dig_port,
 			*msg_ready = true;
 		break;
 	default:
-		DRM_ERROR("Unidentified msg_id: %d\n", msg_id);
+		drm_err(&i915->drm, "Unidentified msg_id: %d\n", msg_id);
 		return -EINVAL;
 	}
 
@@ -6294,8 +6363,9 @@ intel_dp_hdcp2_wait_for_msg(struct intel_digital_port *intel_dig_port,
 	}
 
 	if (ret)
-		DRM_DEBUG_KMS("msg_id %d, ret %d, timeout(mSec): %d\n",
-			      hdcp2_msg_data->msg_id, ret, timeout);
+		drm_dbg_kms(&dp_to_i915(dp)->drm,
+			    "msg_id %d, ret %d, timeout(mSec): %d\n",
+			    hdcp2_msg_data->msg_id, ret, timeout);
 
 	return ret;
 }
@@ -6381,6 +6451,7 @@ static
 int intel_dp_hdcp2_read_msg(struct intel_digital_port *intel_dig_port,
 			    u8 msg_id, void *buf, size_t size)
 {
+	struct intel_dp *dp = &intel_dig_port->dp;
 	unsigned int offset;
 	u8 *byte = buf;
 	ssize_t ret, bytes_to_recv, len;
@@ -6414,7 +6485,8 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *intel_dig_port,
 		ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, offset,
 				       (void *)byte, len);
 		if (ret < 0) {
-			DRM_DEBUG_KMS("msg_id %d, ret %zd\n", msg_id, ret);
+			drm_dbg_kms(&dp_to_i915(dp)->drm,
+				    "msg_id %d, ret %zd\n", msg_id, ret);
 			return ret;
 		}
 
@@ -6618,16 +6690,18 @@ intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool long_hpd)
 		 * would end up in an endless cycle of
 		 * "vdd off -> long hpd -> vdd on -> detect -> vdd off -> ..."
 		 */
-		DRM_DEBUG_KMS("ignoring long hpd on eDP [ENCODER:%d:%s]\n",
-			      intel_dig_port->base.base.base.id,
-			      intel_dig_port->base.base.name);
+		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+			    "ignoring long hpd on eDP [ENCODER:%d:%s]\n",
+			    intel_dig_port->base.base.base.id,
+			    intel_dig_port->base.base.name);
 		return IRQ_HANDLED;
 	}
 
-	DRM_DEBUG_KMS("got hpd irq on [ENCODER:%d:%s] - %s\n",
-		      intel_dig_port->base.base.base.id,
-		      intel_dig_port->base.base.name,
-		      long_hpd ? "long" : "short");
+	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+		    "got hpd irq on [ENCODER:%d:%s] - %s\n",
+		    intel_dig_port->base.base.base.id,
+		    intel_dig_port->base.base.name,
+		    long_hpd ? "long" : "short");
 
 	if (long_hpd) {
 		intel_dp->reset_link_params = true;
@@ -6640,8 +6714,10 @@ intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool long_hpd)
 			 * If we were in MST mode, and device is not
 			 * there, get out of MST mode
 			 */
-			DRM_DEBUG_KMS("MST device may have disappeared %d vs %d\n",
-				      intel_dp->is_mst, intel_dp->mst_mgr.mst_state);
+			drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
+				    "MST device may have disappeared %d vs %d\n",
+				    intel_dp->is_mst,
+				    intel_dp->mst_mgr.mst_state);
 			intel_dp->is_mst = false;
 			drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
 							intel_dp->is_mst);
@@ -6774,7 +6850,7 @@ intel_pps_verify_state(struct intel_dp *intel_dp)
 
 	if (hw.t1_t3 != sw->t1_t3 || hw.t8 != sw->t8 || hw.t9 != sw->t9 ||
 	    hw.t10 != sw->t10 || hw.t11_t12 != sw->t11_t12) {
-		DRM_ERROR("PPS state mismatch\n");
+		drm_err(&dp_to_i915(intel_dp)->drm, "PPS state mismatch\n");
 		intel_pps_dump_state("sw", sw);
 		intel_pps_dump_state("hw", &hw);
 	}
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
