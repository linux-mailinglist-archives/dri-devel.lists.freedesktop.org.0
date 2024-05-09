Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572B28C0B28
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 07:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7902910E2DF;
	Thu,  9 May 2024 05:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBG3Nnbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BFC10E2DD;
 Thu,  9 May 2024 05:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715233682; x=1746769682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=izTjNzoZf6r7P9GJeaDivZUnzJ6Wkys2HdQj6n8Erwg=;
 b=XBG3NnbikE8HjkIb7SxtK6yCbOopIwuyDQlfILlf+/2VRI7nWv0XJLJH
 zKzarOKl0yHNFF2qyVeNkxQm7R+kWGPDD/Tf++Z+ZqpNl4lfo2Pdv/KF6
 kKGCsyhwWaJvb+0QsUnf1roigPpURbePqcyQxekAMMdRZpq8LQ6R0faci
 qBh5F/9rBkT7x0FJBvQkUc9rbqhGZbEm9NGM4jGV6MB+tySIRAlottp5R
 PJzrnV7daUrUf/lu6XavekTciFV/is2TAqa9IedUWFbDgpdDn4AchQ5rv
 /BqnuWC5w5sjDxS4DqgMgoFgRnp2W5S1N6/La7JdcqaKwim0lPwiReRDS Q==;
X-CSE-ConnectionGUID: jwC0BT7fRMWVM95pM5WnZA==
X-CSE-MsgGUID: pj6589LvQTm1AIu8YnDJog==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28645992"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="28645992"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:48:01 -0700
X-CSE-ConnectionGUID: msP54HzgTLGnN1QeJlQ44w==
X-CSE-MsgGUID: YGu1ympgRE2gV1SS232lFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33817632"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 08 May 2024 22:47:59 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 4/6] drm/i915/alpm: Add compute config for lobf
Date: Thu,  9 May 2024 11:01:53 +0530
Message-Id: <20240509053155.327071-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240509053155.327071-1-animesh.manna@intel.com>
References: <20240509053155.327071-1-animesh.manna@intel.com>
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

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 58 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  5 ++
 .../drm/i915/display/intel_display_types.h    | 11 ++++
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++
 4 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index ee6c2a959f09..5979eab1f2e0 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -11,6 +11,23 @@
 #include "intel_dp_aux.h"
 #include "intel_psr_regs.h"
 
+enum alpm_mode intel_alpm_get_capability(struct intel_dp *intel_dp)
+{
+	u8 alpm_caps = 0;
+
+	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP,
+			      &alpm_caps) != 1)
+		return ALPM_INVALID;
+
+	if (alpm_caps & DP_ALPM_CAP)
+		return ALPM_AUX_WAKE;
+
+	if (alpm_caps & DP_ALPM_AUX_LESS_CAP)
+		return ALPM_AUX_LESS;
+
+	return ALPM_NOT_SUPPORTED;
+}
+
 /*
  * See Bspec: 71632 for the table
  *
@@ -242,6 +259,47 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 	return true;
 }
 
+void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
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
+	if (intel_dp->alpm_parameters.mode == ALPM_INVALID ||
+	    intel_dp->alpm_parameters.mode == ALPM_NOT_SUPPORTED)
+		return;
+
+	if (!intel_alpm_compute_params(intel_dp, crtc_state))
+		return;
+
+	context_latency = adjusted_mode->crtc_vblank_start - adjusted_mode->crtc_vdisplay;
+	guardband = adjusted_mode->crtc_vtotal -
+		    adjusted_mode->crtc_vdisplay - context_latency;
+	first_sdp_position = adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vsync_start;
+	if (intel_dp->alpm_parameters.mode == ALPM_AUX_LESS)
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
index c45d078e5a6b..80c8a66b34af 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -10,9 +10,14 @@
 
 struct intel_dp;
 struct intel_crtc_state;
+struct drm_connector_state;
 
+enum alpm_mode intel_alpm_get_capability(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
+void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state);
 void intel_alpm_configure(struct intel_dp *intel_dp);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e81fd71ce57b..79e9e543020b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1405,6 +1405,9 @@ struct intel_crtc_state {
 
 	/* for loading single buffered registers during vblank */
 	struct drm_vblank_work vblank_work;
+
+	/* LOBF flag */
+	bool has_lobf;
 };
 
 enum intel_pipe_crc_source {
@@ -1715,6 +1718,13 @@ struct intel_psr {
 	u8 entry_setup_frames;
 };
 
+enum alpm_mode {
+	ALPM_INVALID,
+	ALPM_AUX_WAKE,
+	ALPM_AUX_LESS,
+	ALPM_NOT_SUPPORTED
+};
+
 struct intel_dp {
 	i915_reg_t output_reg;
 	u32 DP;
@@ -1835,6 +1845,7 @@ struct intel_dp {
 		u8 fast_wake_lines;
 
 		/* LNL and beyond */
+		enum alpm_mode mode;
 		u8 check_entry_lines;
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 486361eb0070..df423a33f6fc 100644
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
+	intel_alpm_compute_lobf_config(intel_dp, pipe_config, conn_state);
 	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
@@ -6615,6 +6617,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 
 	intel_pps_init_late(intel_dp);
 
+	intel_dp->alpm_parameters.mode = intel_alpm_get_capability(intel_dp);
+
 	return true;
 
 out_vdd_off:
-- 
2.29.0

