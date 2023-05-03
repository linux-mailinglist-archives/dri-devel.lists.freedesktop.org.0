Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4916F573C
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 13:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5580210E26C;
	Wed,  3 May 2023 11:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD8210E273;
 Wed,  3 May 2023 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683113823; x=1714649823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1PMdQmhqZUW+eX+e+Ev1od5i5BqvzAJKGHXHLzYzh38=;
 b=oBgVzhQxxOp/hjoXZu1ZDRJVQ3DFjEIO4cTOfLd8rewZT3IlsrAvWNik
 aDArhIT+o2p1rtRwpzbvRHkoCJyYgj1DalO6vGkslbnlAFyc7iwwdCtdp
 kVP5YEije+pG8f2/Vj8AdTXzNkVRpUaoIHhhI3RH1O+UDSmg1p8PXddNs
 C00pfpkeue2LczXAhtZR8Z8Bjf8xFKE7HV4aQzGVCTwsndzmMxf22b9KM
 G4RWYcIBZxDevsN6PpIfdZmMh5+B5vA8daVq8iMoO+n2HkhT07Mw5x6Gk
 aHGbPGrC1KtTPUTXpAjzj6tI38UKNgWZvrjakoFTcKYa22++yghMQIk7j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="337771001"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="337771001"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 04:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="699335201"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="699335201"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 03 May 2023 04:37:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 May 2023 14:36:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/11] drm/i915: Introduce crtc_state->enhanced_framing
Date: Wed,  3 May 2023 14:36:59 +0300
Message-Id: <20230503113659.16305-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502143906.2401-9-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-9-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Track DP enhanced framing properly in the crtc state instead
of relying just on the cached DPCD everywhere, and hook it
up into the state check and dump.

v2: Actually set enhanced_framing in .compute_config()

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/g4x_dp.c                 | 10 ++++++++--
 drivers/gpu/drm/i915/display/intel_crt.c              |  2 ++
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c  |  5 +++--
 drivers/gpu/drm/i915/display/intel_ddi.c              | 11 +++++++++--
 drivers/gpu/drm/i915/display/intel_display.c          |  1 +
 drivers/gpu/drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c               |  3 +++
 drivers/gpu/drm/i915/display/intel_dp_link_training.c |  2 +-
 8 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index 920d570f7594..534546ea7d0b 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -141,7 +141,7 @@ static void intel_dp_prepare(struct intel_encoder *encoder,
 
 		intel_de_rmw(dev_priv, TRANS_DP_CTL(crtc->pipe),
 			     TRANS_DP_ENH_FRAMING,
-			     drm_dp_enhanced_frame_cap(intel_dp->dpcd) ?
+			     pipe_config->enhanced_framing ?
 			     TRANS_DP_ENH_FRAMING : 0);
 	} else {
 		if (IS_G4X(dev_priv) && pipe_config->limited_color_range)
@@ -153,7 +153,7 @@ static void intel_dp_prepare(struct intel_encoder *encoder,
 			intel_dp->DP |= DP_SYNC_VS_HIGH;
 		intel_dp->DP |= DP_LINK_TRAIN_OFF;
 
-		if (drm_dp_enhanced_frame_cap(intel_dp->dpcd))
+		if (pipe_config->enhanced_framing)
 			intel_dp->DP |= DP_ENHANCED_FRAMING;
 
 		if (IS_CHERRYVIEW(dev_priv))
@@ -351,6 +351,9 @@ static void intel_dp_get_config(struct intel_encoder *encoder,
 		u32 trans_dp = intel_de_read(dev_priv,
 					     TRANS_DP_CTL(crtc->pipe));
 
+		if (trans_dp & TRANS_DP_ENH_FRAMING)
+			pipe_config->enhanced_framing = true;
+
 		if (trans_dp & TRANS_DP_HSYNC_ACTIVE_HIGH)
 			flags |= DRM_MODE_FLAG_PHSYNC;
 		else
@@ -361,6 +364,9 @@ static void intel_dp_get_config(struct intel_encoder *encoder,
 		else
 			flags |= DRM_MODE_FLAG_NVSYNC;
 	} else {
+		if (tmp & DP_ENHANCED_FRAMING)
+			pipe_config->enhanced_framing = true;
+
 		if (tmp & DP_SYNC_HS_HIGH)
 			flags |= DRM_MODE_FLAG_PHSYNC;
 		else
diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 13519f78cf9f..52af64aa9953 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -449,6 +449,8 @@ static int hsw_crt_compute_config(struct intel_encoder *encoder,
 	/* FDI must always be 2.7 GHz */
 	pipe_config->port_clock = 135000 * 2;
 
+	pipe_config->enhanced_framing = true;
+
 	adjusted_mode->crtc_clock = lpt_iclkip(pipe_config);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 91242ffe0768..14db2b481ff1 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -257,8 +257,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		intel_dump_m_n_config(pipe_config, "dp m2_n2",
 				      pipe_config->lane_count,
 				      &pipe_config->dp_m2_n2);
-		drm_dbg_kms(&i915->drm, "fec: %s\n",
-			    str_enabled_disabled(pipe_config->fec_enable));
+		drm_dbg_kms(&i915->drm, "fec: %s, enhanced framing: %s\n",
+			    str_enabled_disabled(pipe_config->fec_enable),
+			    str_enabled_disabled(pipe_config->enhanced_framing));
 	}
 
 	drm_dbg_kms(&i915->drm, "framestart delay: %d, MSA timing delay: %d\n",
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4246133950fd..51ae1aad7cc7 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3434,7 +3434,7 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 		dp_tp_ctl |= DP_TP_CTL_MODE_MST;
 	} else {
 		dp_tp_ctl |= DP_TP_CTL_MODE_SST;
-		if (drm_dp_enhanced_frame_cap(intel_dp->dpcd))
+		if (crtc_state->enhanced_framing)
 			dp_tp_ctl |= DP_TP_CTL_ENHANCED_FRAME_ENABLE;
 	}
 	intel_de_write(dev_priv, dp_tp_ctl_reg(encoder, crtc_state), dp_tp_ctl);
@@ -3491,7 +3491,7 @@ static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 		dp_tp_ctl |= DP_TP_CTL_MODE_MST;
 	} else {
 		dp_tp_ctl |= DP_TP_CTL_MODE_SST;
-		if (drm_dp_enhanced_frame_cap(intel_dp->dpcd))
+		if (crtc_state->enhanced_framing)
 			dp_tp_ctl |= DP_TP_CTL_ENHANCED_FRAME_ENABLE;
 	}
 	intel_de_write(dev_priv, dp_tp_ctl_reg(encoder, crtc_state), dp_tp_ctl);
@@ -3725,6 +3725,10 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 		intel_cpu_transcoder_get_m2_n2(crtc, cpu_transcoder,
 					       &pipe_config->dp_m2_n2);
 
+		pipe_config->enhanced_framing =
+			intel_de_read(dev_priv, dp_tp_ctl_reg(encoder, pipe_config)) &
+			DP_TP_CTL_ENHANCED_FRAME_ENABLE;
+
 		if (DISPLAY_VER(dev_priv) >= 11)
 			pipe_config->fec_enable =
 				intel_de_read(dev_priv,
@@ -3741,6 +3745,9 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 		if (!HAS_DP20(dev_priv)) {
 			/* FDI */
 			pipe_config->output_types |= BIT(INTEL_OUTPUT_ANALOG);
+			pipe_config->enhanced_framing =
+				intel_de_read(dev_priv, dp_tp_ctl_reg(encoder, pipe_config)) &
+				DP_TP_CTL_ENHANCED_FRAME_ENABLE;
 			break;
 		}
 		fallthrough; /* 128b/132b */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3d3483e6f836..b95eb031abf2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5226,6 +5226,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_BOOL(hdmi_scrambling);
 	PIPE_CONF_CHECK_BOOL(hdmi_high_tmds_clock_ratio);
 	PIPE_CONF_CHECK_BOOL(has_infoframe);
+	PIPE_CONF_CHECK_BOOL(enhanced_framing);
 	PIPE_CONF_CHECK_BOOL(fec_enable);
 
 	PIPE_CONF_CHECK_BOOL_INCOMPLETE(has_audio);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 96a3183675be..9ea96eb19ddd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1338,6 +1338,8 @@ struct intel_crtc_state {
 	u16 linetime;
 	u16 ips_linetime;
 
+	bool enhanced_framing;
+
 	/* Forward Error correction State */
 	bool fec_enable;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9ac199444155..9b44ba99fd1d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2214,6 +2214,9 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	pipe_config->limited_color_range =
 		intel_dp_limited_color_range(pipe_config, conn_state);
 
+	pipe_config->enhanced_framing =
+		drm_dp_enhanced_frame_cap(intel_dp->dpcd);
+
 	if (pipe_config->dsc.compression_enable)
 		output_bpp = pipe_config->dsc.compressed_bpp;
 	else
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index e92c62bcc9b8..47a212a84fec 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -659,7 +659,7 @@ intel_dp_update_link_bw_set(struct intel_dp *intel_dp,
 	/* Write the link configuration data */
 	link_config[0] = link_bw;
 	link_config[1] = crtc_state->lane_count;
-	if (drm_dp_enhanced_frame_cap(intel_dp->dpcd))
+	if (crtc_state->enhanced_framing)
 		link_config[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 	drm_dp_dpcd_write(&intel_dp->aux, DP_LINK_BW_SET, link_config, 2);
 
-- 
2.39.2

