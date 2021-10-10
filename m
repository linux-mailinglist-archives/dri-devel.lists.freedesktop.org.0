Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D8F428142
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 14:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163456E301;
	Sun, 10 Oct 2021 12:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220866E2F2;
 Sun, 10 Oct 2021 12:34:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10132"; a="224140867"
X-IronPort-AV: E=Sophos;i="5.85,362,1624345200"; d="scan'208";a="224140867"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2021 05:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,362,1624345200"; d="scan'208";a="658297885"
Received: from amanna.iind.intel.com ([10.223.74.76])
 by orsmga005.jf.intel.com with ESMTP; 10 Oct 2021 05:34:05 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, mika.kahola@intel.com, jani.nikula@intel.com,
 manasi.d.navare@intel.com, jose.souza@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 3/5] drm/i915/panelreplay: Initializaton and compute config
 for panel replay
Date: Sun, 10 Oct 2021 17:40:37 +0530
Message-Id: <20211010121039.14725-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211010121039.14725-1-animesh.manna@intel.com>
References: <20211010121039.14725-1-animesh.manna@intel.com>
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

As panel replay feature similar to PSR feature of EDP panel, so currently
utilized existing psr framework for panel replay.

v1: RFC version.
v2: optimized code, pr_enabled and pr_dpcd variable removed. [Jose]
v3:
- code comments improved. [Jani]
- dpcd_readb used instead of dpcd_read. [Jani]
- panel-repaplay init/compute functions moved inside respective psr
function. [Jani]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  2 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 43 +++++++++++++----
 drivers/gpu/drm/i915/display/intel_psr.c      | 48 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_psr.h      |  3 ++
 4 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 39e11eaec1a3..48f7d676ed2c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1070,6 +1070,7 @@ struct intel_crtc_state {
 	bool req_psr2_sdp_prior_scanline;
 	u32 dc3co_exitline;
 	u16 su_y_granularity;
+	bool has_panel_replay;
 	struct drm_dp_vsc_sdp psr_vsc;
 
 	/*
@@ -1531,6 +1532,7 @@ struct intel_psr {
 	bool irq_aux_error;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
+	bool sink_panel_replay_support;
 	u32 dc3co_exitline;
 	u32 dc3co_exit_delay;
 	struct delayed_work dc3co_work;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 10fda20a5bd8..f58a7b72be14 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1587,12 +1587,22 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
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
@@ -1701,6 +1711,21 @@ void intel_dp_compute_psr_vsc_sdp(struct intel_dp *intel_dp,
 			vsc->revision = 0x4;
 			vsc->length = 0xe;
 		}
+	} else if (intel_dp->psr.enabled && !intel_dp_is_edp(intel_dp)) {
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
@@ -2749,10 +2774,10 @@ static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
 	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
 
 	/*
-	 * Only revision 0x5 supports Pixel Encoding/Colorimetry Format as
-	 * per DP 1.4a spec.
+	 * Revision 0x5 and 0x7 supports Pixel Encoding/Colorimetry Format as
+	 * per DP 1.4a spec and DP 2.0 spec respectively.
 	 */
-	if (vsc->revision != 0x5)
+	if (vsc->revision != 0x5 || vsc->revision != 0x7)
 		goto out;
 
 	/* VSC SDP Payload for DB16 through DB18 */
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 7a205fd5023b..91c2efe2f3ad 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -933,6 +933,21 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 	return true;
 }
 
+void intel_panel_replay_compute_config(struct intel_dp *intel_dp,
+				       struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	if (!intel_dp->psr.sink_panel_replay_support)
+		return;
+
+	crtc_state->has_panel_replay = true;
+	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
+
+	if (HAS_PSR2_SEL_FETCH(i915))
+		intel_psr2_sel_fetch_config_valid(intel_dp, crtc_state);
+}
+
 void intel_psr_compute_config(struct intel_dp *intel_dp,
 			      struct intel_crtc_state *crtc_state,
 			      struct drm_connector_state *conn_state)
@@ -942,6 +957,8 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 		&crtc_state->hw.adjusted_mode;
 	int psr_setup_time;
 
+	intel_panel_replay_compute_config(intel_dp, crtc_state);
+
 	/*
 	 * Current PSR panels dont work reliably with VRR enabled
 	 * So if VRR is enabled, do not enable PSR.
@@ -2170,6 +2187,35 @@ void intel_psr_flush(struct drm_i915_private *dev_priv,
 	}
 }
 
+/**
+ * intel_panel_replay_init - Check for sink and source capability.
+ * @intel_dp: Intel DP
+ *
+ * This function is called after the initializing connector.
+ * (the initializing of connector treats the handling of connector capabilities)
+ * And it initializes basic panel replay stuff for each DP Encoder.
+ */
+void intel_panel_replay_init(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	u8 pr_dpcd = 0;
+
+	if (!(HAS_DP20(dev_priv) && HAS_PANEL_REPLAY(dev_priv)))
+		return;
+
+	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP, &pr_dpcd);
+
+	if (!(pr_dpcd & PANEL_REPLAY_SUPPORT)) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "Panel replay is not supported by panel\n");
+		return;
+	}
+
+	drm_dbg_kms(&dev_priv->drm,
+		    "Panel replay is supported by panel\n");
+	intel_dp->psr.sink_panel_replay_support = true;
+}
+
 /**
  * intel_psr_init - Init basic PSR work and mutex.
  * @intel_dp: Intel DP
@@ -2183,6 +2229,8 @@ void intel_psr_init(struct intel_dp *intel_dp)
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
+	intel_panel_replay_init(intel_dp);
+
 	if (!HAS_PSR(dev_priv))
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index facffbacd357..c9d1c1f0b470 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -32,6 +32,7 @@ void intel_psr_flush(struct drm_i915_private *dev_priv,
 		     unsigned frontbuffer_bits,
 		     enum fb_op_origin origin);
 void intel_psr_init(struct intel_dp *intel_dp);
+void intel_panel_replay_init(struct intel_dp *intel_dp);
 void intel_psr_compute_config(struct intel_dp *intel_dp,
 			      struct intel_crtc_state *crtc_state,
 			      struct drm_connector_state *conn_state);
@@ -52,5 +53,7 @@ void intel_psr2_disable_plane_sel_fetch(struct intel_plane *plane,
 					const struct intel_crtc_state *crtc_state);
 void intel_psr_pause(struct intel_dp *intel_dp);
 void intel_psr_resume(struct intel_dp *intel_dp);
+void intel_panel_replay_compute_config(struct intel_dp *intel_dp,
+				       struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_PSR_H__ */
-- 
2.29.0

