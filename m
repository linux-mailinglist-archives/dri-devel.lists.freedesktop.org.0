Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3B58CFBC9
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 10:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866BE10EF96;
	Mon, 27 May 2024 08:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+8OM10E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108A510F27F;
 Mon, 27 May 2024 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716799390; x=1748335390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0x/+z7syYYn83jfs+kAXEyN5E4meWgaIr8f+zb0ZFzI=;
 b=N+8OM10EkFSQw9vm6HEkOg3nOD7KT4not6Q1zP18QfmsRxywNWiGKc1E
 M/dXnt07hmNbubWUEIgyYIckQc0taDAVXy1/DQebpYOKKC5bcVQL0hdxT
 D19CUt2Y6bDwy8x89uiSfhqR/KDKKgkEqjqkgX4tdotZ6Pw+5zHLlQ3fo
 0RQAjAW8AHUDMhFbOkeM2dJRZWwHjM1tPT3WGQeMgvgaVAyq/HLt5GIy3
 q9+FlXjXoHsJTeKQVDTHnHJRl1FUKGCQhjiH15wDtI/IiFDW2AAjGkbz1
 W1SNoKEfhasfW7Fs/RrtYEHGRKE+aIc5Yr2xBaYD2oQ6byMdV9rfyLKaT Q==;
X-CSE-ConnectionGUID: RzcpAgqGTM+/E9+b29OnnA==
X-CSE-MsgGUID: bbcBkoshQumeASt0g2vFHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13049008"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="13049008"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 01:43:02 -0700
X-CSE-ConnectionGUID: kIAeW5j0T6Cp8YXKBztdVQ==
X-CSE-MsgGUID: oQPL6HLzTU280PDoGz32eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34676848"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa008.fm.intel.com with ESMTP; 27 May 2024 01:43:00 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v6 4/6] drm/i915/alpm: Add compute config for lobf
Date: Mon, 27 May 2024 13:56:34 +0530
Message-Id: <20240527082636.1519057-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240527082636.1519057-1-animesh.manna@intel.com>
References: <20240527082636.1519057-1-animesh.manna@intel.com>
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
index 0ad6134ba94e..d77a9f22b5c6 100644
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
@@ -1845,6 +1848,8 @@ struct intel_dp {
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
 	} alpm_parameters;
+
+	u8 alpm_dpcd;
 };
 
 enum lspcon_vendor {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c0a3b6d50681..71ff258c183d 100644
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
@@ -6512,6 +6514,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	 */
 	intel_hpd_enable_detection(encoder);
 
+	intel_alpm_init_dpcd(intel_dp);
+
 	/* Cache DPCD and EDID for edp. */
 	has_dpcd = intel_edp_init_dpcd(intel_dp, intel_connector);
 
-- 
2.29.0

