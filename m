Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D38C9BE4
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDA010E621;
	Mon, 20 May 2024 11:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/plTv85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F4D10E620;
 Mon, 20 May 2024 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716203081; x=1747739081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m0OO3guGnwmIPDOlhNCcDUXcWxObYQGDTsf296f2XA0=;
 b=Q/plTv85iOu6i+R+gjEXORDpWhVJllUCFzyu/TdKXyyF0SWFGWIpx6F8
 kOsDkeuR/k+wKsVUfkUxP7YHpIDAk8x+tjwiRld9C71jik8mlP+audvU8
 xM5U/hl0dJY+Vpm2OQ2YB4n/0/Ly59chce8oAwPjdLLszj6PJDIkq6wBT
 xInjj8fya3DZM9QfBtRKr5gwLQeYSDX0cbPgDRE3X6AqegH7OQ2zH2VeC
 PRiJC2XTm/tt7fbsqkiDJcE/qdjebt7kPA/3aQTD+7JiQo4tS8tdYdGD7
 GEi26IeIGIVOkpO0AlJOBqZYZCuzLjJatO0XEcom5+/FFsz5+adBwV5sG w==;
X-CSE-ConnectionGUID: H1RIU2E9RlGNdgPjW9amOg==
X-CSE-MsgGUID: 8foRxuYLTfaKLTI5g9+jxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="22996364"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="22996364"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 04:04:41 -0700
X-CSE-ConnectionGUID: OzeP5S3BR+6elWRCho+N0g==
X-CSE-MsgGUID: z/Uii+HcS9WSINHZYK/7vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="63723610"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa001.fm.intel.com with ESMTP; 20 May 2024 04:04:39 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 4/6] drm/i915/alpm: Add compute config for lobf
Date: Mon, 20 May 2024 16:18:20 +0530
Message-Id: <20240520104822.1116122-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240520104822.1116122-1-animesh.manna@intel.com>
References: <20240520104822.1116122-1-animesh.manna@intel.com>
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
index 7307e02277d6..c2334197e723 100644
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
+void intel_alpm_get_capability(struct intel_dp *intel_dp)
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
index c45d078e5a6b..45c07f023a63 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -10,9 +10,14 @@
 
 struct intel_dp;
 struct intel_crtc_state;
+struct drm_connector_state;
 
+void intel_alpm_get_capability(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
+void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
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
index c0a3b6d50681..61ee66ad8bd0 100644
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
@@ -6616,6 +6618,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 
 	intel_pps_init_late(intel_dp);
 
+	intel_alpm_get_capability(intel_dp);
+
 	return true;
 
 out_vdd_off:
-- 
2.29.0

