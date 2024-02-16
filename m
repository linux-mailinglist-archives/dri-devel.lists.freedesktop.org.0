Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F5B857F45
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C811A10E97B;
	Fri, 16 Feb 2024 14:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+1F6CSF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455E410E25A;
 Fri, 16 Feb 2024 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708093537; x=1739629537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jIfEFUUTsxYJUUibRRO1tc7Mz47Gcu0e5uXjm5KBEPY=;
 b=Z+1F6CSF1PcdqBWcz9zwC03QfbAcELmrkVjqFRsoAw4QUqC9PzhX0g9W
 1pkWeQETVvZcY1Xvqx1Wgx07elDuYa25+yubWkHtfTN57GpaCc3ZwDVu0
 Ie534LO3RfbxHeu3bmN4B6xz4jzz7bgJLM1ZPWCetCNkVB+nWWFRS6O7C
 xGdLCMRCUTqpKPcgK7zCO4j69QVND8n9OsF6FYfNcwKNqa1zxdMX9kYtz
 uafkbReyoqB0AunQGadl4T8LJAtuozNuAH0YmlEI4avsioIinym2AnUct
 kmPZkrA3b8DTAsJoyfKY+7EwKQwphVccFpECvsgKmrzufhRbh1FodtEc9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2372052"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2372052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 06:25:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="34639176"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 16 Feb 2024 06:25:35 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH 6/6] drm/i915/display: Read/Write AS sdp only when sink/source
 has enabled
Date: Fri, 16 Feb 2024 19:48:28 +0530
Message-Id: <20240216141828.1884193-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240216141828.1884193-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240216141828.1884193-1-mitulkumar.ajitkumar.golani@intel.com>
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

Write/Read Adaptive sync SDP only when Sink and Source is enabled
for the same. Also along with write TRANS_VRR_VSYNC values.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c          |  4 ++++
 .../gpu/drm/i915/display/intel_display_device.h   |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c           | 15 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h           |  1 +
 drivers/gpu/drm/i915/display/intel_vrr.c          |  7 +++++++
 5 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bea441590204..68cd49193d03 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3926,6 +3926,7 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 	/* XXX: DSI transcoder paranoia */
 	if (drm_WARN_ON(&dev_priv->drm, transcoder_is_dsi(cpu_transcoder)))
@@ -3972,6 +3973,9 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
 	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
 	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
 
+	if (HAS_AS_SDP(dev_priv) && intel_dp_sink_as_sdp_supported(intel_dp))
+		intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
+
 	intel_audio_codec_get_config(encoder, pipe_config);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index fe4268813786..6399fbc6c738 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -68,6 +68,7 @@ struct drm_printer;
 #define HAS_TRANSCODER(i915, trans)	((DISPLAY_RUNTIME_INFO(i915)->cpu_transcoder_mask & \
 					  BIT(trans)) != 0)
 #define HAS_VRR(i915)			(DISPLAY_VER(i915) >= 11)
+#define HAS_AS_SDP(i915)		(DISPLAY_VER(i915) >= 13)
 #define INTEL_NUM_PIPES(i915)		(hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
 #define I915_HAS_HOTPLUG(i915)		(DISPLAY_INFO(i915)->has_hotplug)
 #define OVERLAY_NEEDS_PHYSICAL(i915)	(DISPLAY_INFO(i915)->overlay_needs_physical)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0759266e7bfb..5bd99fa8f200 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -119,6 +119,17 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 	return dig_port->base.type == INTEL_OUTPUT_EDP;
 }
 
+bool
+intel_dp_sink_as_sdp_supported(struct intel_dp *intel_dp)
+{
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+
+	if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
+		return -EIO;
+
+	return drm_dp_as_sdp_supported(&intel_dp->aux, dpcd);
+}
+
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
 
 /* Is link rate UHBR and thus 128b/132b? */
@@ -4330,6 +4341,7 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK |
 			 VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
 	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
 	if (!enable && HAS_DSC(dev_priv))
@@ -4347,6 +4359,9 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 
 	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_VSC);
 
+	if (HAS_AS_SDP(dev_priv) && intel_dp_sink_as_sdp_supported(intel_dp))
+		intel_write_dp_sdp(encoder, crtc_state, DP_SDP_ADAPTIVE_SYNC);
+
 	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 530cc97bc42f..09ab313af896 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -180,5 +180,6 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
 					struct link_config_limits *limits);
 
 void intel_dp_get_dsc_sink_cap(u8 dpcd_rev, struct intel_connector *connector);
+bool intel_dp_sink_as_sdp_supported(struct intel_dp *intel_dp);
 
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 2fa0004d00c7..86729e145991 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -192,6 +192,9 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	bool is_as_sdp_enabled = intel_de_read(dev_priv,
+					       HSW_TVIDEO_DIP_CTL(cpu_transcoder)) &
+					       VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
 
 	/*
 	 * TRANS_SET_CONTEXT_LATENCY with VRR enabled
@@ -210,6 +213,10 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 	intel_de_write(dev_priv, TRANS_VRR_VMAX(cpu_transcoder), crtc_state->vrr.vmax - 1);
 	intel_de_write(dev_priv, TRANS_VRR_CTL(cpu_transcoder), trans_vrr_ctl(crtc_state));
 	intel_de_write(dev_priv, TRANS_VRR_FLIPLINE(cpu_transcoder), crtc_state->vrr.flipline - 1);
+
+	if (is_as_sdp_enabled)
+		intel_de_write(dev_priv, TRANS_VRR_VSYNC(cpu_transcoder),
+			       crtc_state->vrr.vsync_end << 16 | crtc_state->vrr.vsync_start);
 }
 
 void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
-- 
2.25.1

