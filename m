Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A6E8D3F8F
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 22:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CC8112DD9;
	Wed, 29 May 2024 20:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/FixQB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D5710E8EA;
 Wed, 29 May 2024 20:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717014252; x=1748550252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nTb7Bze2Ffr7HTMJUvXp4FZg41Qx0WCK4tJK1hBxGaM=;
 b=h/FixQB1nObsWiSkaJuQ9Iu4wD9XL2kZm4/jUIeDVG1BIVWFBc1Yaq9j
 LlLNM1iq1b9W7bip8cCjC81Xft4IRbd13RCDUBbOIfClmrnWPCkrTMg8N
 POnXEVufJ7pZj4FbXSD7Q6ZXqEc2FRnsZLOJJDFcFXtA69xLR5EkG2KEs
 SL1onwbnJHjTvlnuu0VekV7bUsuZm14+ZTVBKIqI/XHBQdxNcABhAVjQg
 Ic3rY9nzFDhlmKf26q2uVQ16fSTFw17tJi1iu6M7xvKQskE9hMe1gytGH
 gy/Iv3vVLU1LOB/s/ZwrndvOokMVstSal59geNMqw4Ps3C8h3spvIpAHS g==;
X-CSE-ConnectionGUID: GoAaLt55SrmF3g1WDhMRvw==
X-CSE-MsgGUID: Ue9LiEC5SDC8xAQQExlCsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13397241"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13397241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 13:24:11 -0700
X-CSE-ConnectionGUID: IYeIyodQQBWYoKgWwgCqWw==
X-CSE-MsgGUID: behX2p/eQ3ao0Aovi9yVAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="66760002"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa001.fm.intel.com with ESMTP; 29 May 2024 13:24:08 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v7 4/6] drm/i915/alpm: Add compute config for lobf
Date: Thu, 30 May 2024 01:37:40 +0530
Message-Id: <20240529200742.1694401-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240529200742.1694401-1-animesh.manna@intel.com>
References: <20240529200742.1694401-1-animesh.manna@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Link Off Between Active Frames, is a new feature for eDP
that allows the panel to go to lower power state after
transmission of data. This is a feature on top of ALPM, AS SDP.
Add compute config during atomic-check phase.

v1: RFC version.
v2: Add separate flag for auxless-alpm. [Jani]
v3:
- intel_dp->lobf_supported replaced with crtc_state->has_lobf. [Jouni]
- Add DISPLAY_VER() check. [Jouni]
- Modify function name of get_aux_less_status. [Jani]
v4: Add enum alpm_mode to hold the aux-wake/less capability.
v5: Add alpm_dpcd to intel_dp and use aux_wake_supported()/
aux_less_wake_supported() instead of enum alpm_mode. [Jouni]

Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 61 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  5 ++
 .../drm/i915/display/intel_display_types.h    |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++
 4 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 7307e02277d6..3ac5986b4ad9 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -11,6 +11,26 @@
 #include "intel_dp_aux.h"
 #include "intel_psr_regs.h"
 
+static bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp)
+{
+	return intel_dp->alpm_dpcd & DP_ALPM_CAP;
+}
+
+static bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp)
+{
+	return intel_dp->alpm_dpcd & DP_ALPM_AUX_LESS_CAP;
+}
+
+void intel_alpm_init_dpcd(struct intel_dp *intel_dp)
+{
+	u8 dpcd;
+
+	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP, &dpcd) < 0)
+		return;
+
+	intel_dp->alpm_dpcd = dpcd;
+}
+
 /*
  * See Bspec: 71632 for the table
  *
@@ -243,6 +263,47 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 	return true;
 }
 
+void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int waketime_in_lines, first_sdp_position;
+	int context_latency, guardband;
+
+	if (!intel_dp_is_edp(intel_dp))
+		return;
+
+	if (DISPLAY_VER(i915) < 20)
+		return;
+
+	if (!intel_dp_as_sdp_supported(intel_dp))
+		return;
+
+	if (crtc_state->has_psr)
+		return;
+
+	if (!(intel_alpm_aux_wake_supported(intel_dp) ||
+	      intel_alpm_aux_less_wake_supported(intel_dp)))
+		return;
+
+	if (!intel_alpm_compute_params(intel_dp, crtc_state))
+		return;
+
+	context_latency = adjusted_mode->crtc_vblank_start - adjusted_mode->crtc_vdisplay;
+	guardband = adjusted_mode->crtc_vtotal -
+		    adjusted_mode->crtc_vdisplay - context_latency;
+	first_sdp_position = adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vsync_start;
+	if (intel_alpm_aux_less_wake_supported(intel_dp))
+		waketime_in_lines = intel_dp->alpm_parameters.io_wake_lines;
+	else
+		waketime_in_lines = intel_dp->alpm_parameters.fast_wake_lines;
+
+	crtc_state->has_lobf = (context_latency + guardband) >
+		(first_sdp_position + waketime_in_lines);
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index c45d078e5a6b..e586e8a01b10 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -10,9 +10,14 @@
 
 struct intel_dp;
 struct intel_crtc_state;
+struct drm_connector_state;
 
+void intel_alpm_init_dpcd(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
+void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state);
 void intel_alpm_configure(struct intel_dp *intel_dp);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f03b598638d7..012ff9e18b54 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1410,6 +1410,9 @@ struct intel_crtc_state {
 
 	/* for loading single buffered registers during vblank */
 	struct drm_vblank_work vblank_work;
+
+	/* LOBF flag */
+	bool has_lobf;
 };
 
 enum intel_pipe_crc_source {
@@ -1846,6 +1849,8 @@ struct intel_dp {
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
 	} alpm_parameters;
+
+	u8 alpm_dpcd;
 };
 
 enum lspcon_vendor {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4fa977f1e6c4..fd054e16850d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -48,6 +48,7 @@
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
+#include "intel_alpm.h"
 #include "intel_atomic.h"
 #include "intel_audio.h"
 #include "intel_backlight.h"
@@ -3000,6 +3001,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	intel_vrr_compute_config(pipe_config, conn_state);
 	intel_dp_compute_as_sdp(intel_dp, pipe_config);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
+	intel_alpm_lobf_compute_config(intel_dp, pipe_config, conn_state);
 	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
@@ -6513,6 +6515,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	 */
 	intel_hpd_enable_detection(encoder);
 
+	intel_alpm_init_dpcd(intel_dp);
+
 	/* Cache DPCD and EDID for edp. */
 	has_dpcd = intel_edp_init_dpcd(intel_dp, intel_connector);
 
-- 
2.29.0

