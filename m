Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31BE86B23B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A1110E995;
	Wed, 28 Feb 2024 14:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPy4V+ze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5409C10E995;
 Wed, 28 Feb 2024 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709131527; x=1740667527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l8wW4BFy7UHEYsdHX3DNsBLprplcW8NPmSPaVEnAK5o=;
 b=EPy4V+zeBDfoTtnqjZ7FxViQd2b963PS6dQVKdkYGsZ6fIZy6Z+95VCx
 la2pyvvmdYoxmrybfCZSR1FdLvY2D694vQjuT0So63kYRo0JjrRYaCTLa
 hkDz3/uYvD4u2Zb+oTAFLv04FF8rQ8oga9fzQXdw6wfiegPHJW6ypVHhJ
 8i0CdtfMWL3thR8Gx9HEqyfToc4MfepYuY3lb1nhCfzofOpk/mEpj95oc
 N7Hgun8M2ZCYYbMN0N+rZ3flxYaYYtFEd82fANzTGbM6SU1oYSqJRqIPx
 AuDUbLlvbWYbKQNwUNjpfDQUgjLi0sLWk0QufzFkGvHkEwYeuBQj8LsLT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7356157"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7356157"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:45:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7663332"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2024 06:45:25 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v12 8/8] drm/i915/display: Read/Write AS sdp only when
 sink/source has enabled
Date: Wed, 28 Feb 2024 20:08:23 +0530
Message-Id: <20240228143823.2762595-9-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
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
 drivers/gpu/drm/i915/display/intel_ddi.c | 4 ++++
 drivers/gpu/drm/i915/display/intel_dp.c  | 4 ++++
 drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bea441590204..89b8d50f12c6 100644
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
 
+	if (intel_dp_as_sdp_supported(intel_dp))
+		intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
+
 	intel_audio_codec_get_config(encoder, pipe_config);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2ec1f923a5a0..8304ef912767 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4276,6 +4276,7 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK |
 			 VIDEO_DIP_ENABLE_AS_ADL;
 	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
 	if (!enable && HAS_DSC(dev_priv))
@@ -4293,6 +4294,9 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 
 	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_VSC);
 
+	if (intel_dp_as_sdp_supported(intel_dp))
+		intel_write_dp_sdp(encoder, crtc_state, DP_SDP_ADAPTIVE_SYNC);
+
 	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 668927524f23..d24a42902e69 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -214,6 +214,10 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 	intel_de_write(dev_priv, TRANS_VRR_VMAX(cpu_transcoder), crtc_state->vrr.vmax - 1);
 	intel_de_write(dev_priv, TRANS_VRR_CTL(cpu_transcoder), trans_vrr_ctl(crtc_state));
 	intel_de_write(dev_priv, TRANS_VRR_FLIPLINE(cpu_transcoder), crtc_state->vrr.flipline - 1);
+
+	if (crtc_state->vrr.vsync_end && crtc_state->vrr.vsync_start)
+		intel_de_write(dev_priv, TRANS_VRR_VSYNC(cpu_transcoder),
+			       crtc_state->vrr.vsync_end << 16 | crtc_state->vrr.vsync_start);
 }
 
 void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
-- 
2.25.1

