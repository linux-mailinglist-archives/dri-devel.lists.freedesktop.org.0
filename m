Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2D7E5115
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 08:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1499710E707;
	Wed,  8 Nov 2023 07:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D579510E482;
 Wed,  8 Nov 2023 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699428930; x=1730964930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zlkZb3CkPJJOyUFT0H5H7m/kGWj1qs9+9MaL0HK5gcY=;
 b=azdqe2YpAv1jKsVGsasHipNmrDiWn7Qv4zAosaWqHa5joGWtsugE0WIy
 TIcAy/a8oo2k37mdCG6LwWXXKxG5P2qB2Bd9GBfi7okxHX0gG9JQudKdK
 AeMz5x8cMrSEoNgkBsZRjxb4j9wOUR514v0AmJiZIFXh2w4+2DiOb0lb2
 NahqdMt33/osiOLwbPUBSvYpY63wfwQkGmrJgSToPPR79omye3ebOT4N6
 uFiXLGcyuKlatyqKWcA/wHBtXT+UIyBOrmEx6fSCJAjYN96llSEys2B0a
 i8SIXo2iWQr52qW8PeEzn3BbT7CxuLsE+xYzjYGr7zNdojpCLEeZy7pXL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8360267"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="8360267"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 23:35:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="906689581"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="906689581"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2023 23:35:27 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 3/6] drm/i915/panelreplay: Initializaton and compute config
 for panel replay
Date: Wed,  8 Nov 2023 12:53:00 +0530
Message-Id: <20231108072303.3414118-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231108072303.3414118-1-animesh.manna@intel.com>
References: <20231108072303.3414118-1-animesh.manna@intel.com>
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modify existing PSR implementation to enable panel replay feature of DP 2.0
which is similar to PSR feature of EDP panel. There is different DPCD
address to check panel capability compare to PSR and vsc sdp header
is different.

v1: Initial version.
v2:
- Set source_panel_replay_support flag under HAS_PANEL_REPLAY()
condition check. [Jouni]
- Code restructured around intel_panel_replay_init
and renamed to intel_panel_replay_init_dpcd. [Jouni]
- Remove the initial code modification around has_psr2 flag. [Jouni]
- Add CAN_PANEL_REPLAY() in intel_encoder_can_psr which is used to
enable in intel_psr_post_plane_update. [Jouni]
v3:
- Initialize both psr and panel-replay. [Jouni]
- Initialize both panel replay and psr if detected. [Jouni]
- Refactoring psr function by introducing _psr_compute_config(). [Jouni]
- Add check for !is_edp while deriving source_panel_replay_support. [Jouni]
- Enable panel replay dpcd initialization in a separate patch. [Jouni]

v4:
- HAS_PANEL_REPLAY() check not needed during sink capability check. [Jouni]
- Set either panel replay source support or psr. [Jouni]

v5:
- HAS_PANEL_REPLAY() removed and use HAS_DP20() instead. [Jouni]
- Move psr related code to intel_psr.c. [Jani]
- Reset sink_panel_replay_support flag during disconnection. [Jani]

v6: return statement restored which is removed by misatke. [Jouni]
v7: cosmetic changes. [Arun]

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../drm/i915/display/intel_display_types.h    | 14 +---
 drivers/gpu/drm/i915/display/intel_dp.c       | 49 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 84 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_psr.h      |  7 ++
 5 files changed, 117 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 92f06d67fd1e..6806605bd534 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1208,6 +1208,7 @@ struct intel_crtc_state {
 	bool has_psr2;
 	bool enable_psr2_sel_fetch;
 	bool req_psr2_sdp_prior_scanline;
+	bool has_panel_replay;
 	bool wm_level_disabled;
 	u32 dc3co_exitline;
 	u16 su_y_granularity;
@@ -1705,6 +1706,8 @@ struct intel_psr {
 	bool irq_aux_error;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
+	bool source_panel_replay_support;
+	bool sink_panel_replay_support;
 	u32 dc3co_exitline;
 	u32 dc3co_exit_delay;
 	struct delayed_work dc3co_work;
@@ -1991,17 +1994,6 @@ dp_to_lspcon(struct intel_dp *intel_dp)
 
 #define dp_to_i915(__intel_dp) to_i915(dp_to_dig_port(__intel_dp)->base.base.dev)
 
-#define CAN_PSR(intel_dp) ((intel_dp)->psr.sink_support && \
-			   (intel_dp)->psr.source_support)
-
-static inline bool intel_encoder_can_psr(struct intel_encoder *encoder)
-{
-	if (!intel_encoder_is_dp(encoder))
-		return false;
-
-	return CAN_PSR(enc_to_intel_dp(encoder));
-}
-
 static inline struct intel_digital_port *
 hdmi_to_dig_port(struct intel_hdmi *intel_hdmi)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 5391b2a83405..8260fa638aa6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2439,12 +2439,22 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 
-	/*
-	 * Prepare VSC Header for SU as per DP 1.4 spec, Table 2-118
-	 * VSC SDP supporting 3D stereo, PSR2, and Pixel Encoding/
-	 * Colorimetry Format indication.
-	 */
-	vsc->revision = 0x5;
+	if (crtc_state->has_panel_replay) {
+		/*
+		 * Prepare VSC Header for SU as per DP 2.0 spec, Table 2-223
+		 * VSC SDP supporting 3D stereo, Panel Replay, and Pixel
+		 * Encoding/Colorimetry Format indication.
+		 */
+		vsc->revision = 0x7;
+	} else {
+		/*
+		 * Prepare VSC Header for SU as per DP 1.4 spec, Table 2-118
+		 * VSC SDP supporting 3D stereo, PSR2, and Pixel Encoding/
+		 * Colorimetry Format indication.
+		 */
+		vsc->revision = 0x5;
+	}
+
 	vsc->length = 0x13;
 
 	/* DP 1.4a spec, Table 2-120 */
@@ -2553,6 +2563,21 @@ void intel_dp_compute_psr_vsc_sdp(struct intel_dp *intel_dp,
 			vsc->revision = 0x4;
 			vsc->length = 0xe;
 		}
+	} else if (crtc_state->has_panel_replay) {
+		if (intel_dp->psr.colorimetry_support &&
+		    intel_dp_needs_vsc_sdp(crtc_state, conn_state)) {
+			/* [Panel Replay with colorimetry info] */
+			intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
+							 vsc);
+		} else {
+			/*
+			 * [Panel Replay without colorimetry info]
+			 * Prepare VSC Header for SU as per DP 2.0 spec, Table 2-223
+			 * VSC SDP supporting 3D stereo + Panel Replay.
+			 */
+			vsc->revision = 0x6;
+			vsc->length = 0x10;
+		}
 	} else {
 		/*
 		 * [PSR1]
@@ -3865,11 +3890,16 @@ static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
 	sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
 	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
 
+	if (vsc->revision == 0x6) {
+		sdp->db[0] = 1;
+		sdp->db[3] = 1;
+	}
+
 	/*
-	 * Only revision 0x5 supports Pixel Encoding/Colorimetry Format as
-	 * per DP 1.4a spec.
+	 * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
+	 * Format as per DP 1.4a spec and DP 2.0 respectively.
 	 */
-	if (vsc->revision != 0x5)
+	if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
 		goto out;
 
 	/* VSC SDP Payload for DB16 through DB18 */
@@ -5409,6 +5439,7 @@ intel_dp_detect(struct drm_connector *connector,
 	if (status == connector_status_disconnected) {
 		memset(&intel_dp->compliance, 0, sizeof(intel_dp->compliance));
 		memset(intel_connector->dp.dsc_dpcd, 0, sizeof(intel_connector->dp.dsc_dpcd));
+		intel_dp->psr.sink_panel_replay_support = false;
 
 		if (intel_dp->is_mst) {
 			drm_dbg_kms(&dev_priv->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index de608c8ee7b9..47ec2a47ad24 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -43,6 +43,7 @@
 #include "intel_dpio_phy.h"
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
+#include "intel_psr.h"
 #include "intel_vdsc.h"
 #include "skl_scaler.h"
 
@@ -436,6 +437,8 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
 	intel_ddi_compute_min_voltage_level(dev_priv, pipe_config);
 
+	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 627d82164933..3ffdeb451a83 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -173,6 +173,15 @@
  * irrelevant for normal operation.
  */
 
+bool intel_encoder_can_psr(struct intel_encoder *encoder)
+{
+	if (intel_encoder_is_dp(encoder) || encoder->type == INTEL_OUTPUT_DP_MST)
+		return CAN_PSR(enc_to_intel_dp(encoder)) ||
+		       CAN_PANEL_REPLAY(enc_to_intel_dp(encoder));
+	else
+		return false;
+}
+
 static bool psr_global_enabled(struct intel_dp *intel_dp)
 {
 	struct intel_connector *connector = intel_dp->attached_connector;
@@ -475,6 +484,25 @@ static void intel_dp_get_su_granularity(struct intel_dp *intel_dp)
 	intel_dp->psr.su_y_granularity = y;
 }
 
+static void _panel_replay_init_dpcd(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	u8 pr_dpcd = 0;
+
+	intel_dp->psr.sink_panel_replay_support = false;
+	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP, &pr_dpcd);
+
+	if (!(pr_dpcd & DP_PANEL_REPLAY_SUPPORT)) {
+		drm_dbg_kms(&i915->drm,
+			    "Panel replay is not supported by panel\n");
+		return;
+	}
+
+	drm_dbg_kms(&i915->drm,
+		    "Panel replay is supported by panel\n");
+	intel_dp->psr.sink_panel_replay_support = true;
+}
+
 static void _psr_init_dpcd(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 =
@@ -524,12 +552,13 @@ static void _psr_init_dpcd(struct intel_dp *intel_dp)
 
 void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 {
+	_panel_replay_init_dpcd(intel_dp);
+
 	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
 			 sizeof(intel_dp->psr_dpcd));
 
 	if (intel_dp->psr_dpcd[0])
 		_psr_init_dpcd(intel_dp);
-	/* TODO: Add PR case here */
 
 	if (intel_dp->psr.sink_psr2_support) {
 		intel_dp->psr.colorimetry_support =
@@ -1271,13 +1300,11 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 	return false;
 }
 
-void intel_psr_compute_config(struct intel_dp *intel_dp,
-			      struct intel_crtc_state *crtc_state,
-			      struct drm_connector_state *conn_state)
+static bool _psr_compute_config(struct intel_dp *intel_dp,
+				struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-	const struct drm_display_mode *adjusted_mode =
-		&crtc_state->hw.adjusted_mode;
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	u8 entry_setup_frames;
 
 	/*
@@ -1285,10 +1312,30 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 	 * So if VRR is enabled, do not enable PSR.
 	 */
 	if (crtc_state->vrr.enable)
-		return;
+		return false;
 
 	if (!CAN_PSR(intel_dp))
-		return;
+		return false;
+
+	entry_setup_frames = intel_psr_entry_setup_frames(intel_dp, adjusted_mode);
+
+	if (entry_setup_frames >= 0) {
+		intel_dp->psr.entry_setup_frames = entry_setup_frames;
+	} else {
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR condition failed: PSR setup timing not met\n");
+		return false;
+	}
+
+	return true;
+}
+
+void intel_psr_compute_config(struct intel_dp *intel_dp,
+			      struct intel_crtc_state *crtc_state,
+			      struct drm_connector_state *conn_state)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 
 	if (!psr_global_enabled(intel_dp)) {
 		drm_dbg_kms(&dev_priv->drm, "PSR disabled by flag\n");
@@ -1307,17 +1354,11 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 		return;
 	}
 
-	entry_setup_frames = intel_psr_entry_setup_frames(intel_dp, adjusted_mode);
-
-	if (entry_setup_frames >= 0) {
-		intel_dp->psr.entry_setup_frames = entry_setup_frames;
-	} else {
-		drm_dbg_kms(&dev_priv->drm,
-			    "PSR condition failed: PSR setup timing not met\n");
-		return;
-	}
+	if (CAN_PANEL_REPLAY(intel_dp))
+		crtc_state->has_panel_replay = true;
+	else
+		crtc_state->has_psr = _psr_compute_config(intel_dp, crtc_state);
 
-	crtc_state->has_psr = true;
 	crtc_state->has_psr2 = intel_psr2_config_valid(intel_dp, crtc_state);
 
 	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
@@ -2750,7 +2791,7 @@ void intel_psr_init(struct intel_dp *intel_dp)
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
-	if (!HAS_PSR(dev_priv))
+	if (!(HAS_PSR(dev_priv) || HAS_DP20(dev_priv)))
 		return;
 
 	/*
@@ -2768,7 +2809,10 @@ void intel_psr_init(struct intel_dp *intel_dp)
 		return;
 	}
 
-	intel_dp->psr.source_support = true;
+	if (HAS_DP20(dev_priv) && !intel_dp_is_edp(intel_dp))
+		intel_dp->psr.source_panel_replay_support = true;
+	else
+		intel_dp->psr.source_support = true;
 
 	/* Set link_standby x link_off defaults */
 	if (DISPLAY_VER(dev_priv) < 12)
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index bf35f42df6bc..6a1f4573852b 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -21,6 +21,13 @@ struct intel_encoder;
 struct intel_plane;
 struct intel_plane_state;
 
+#define CAN_PSR(intel_dp) ((intel_dp)->psr.sink_support && \
+			   (intel_dp)->psr.source_support)
+
+#define CAN_PANEL_REPLAY(intel_dp) ((intel_dp)->psr.sink_panel_replay_support && \
+				    (intel_dp)->psr.source_panel_replay_support)
+
+bool intel_encoder_can_psr(struct intel_encoder *encoder);
 void intel_psr_init_dpcd(struct intel_dp *intel_dp);
 void intel_psr_pre_plane_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc);
-- 
2.29.0

