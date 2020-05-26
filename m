Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441EE1C8C53
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 15:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B330D6E9A8;
	Thu,  7 May 2020 13:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919026E9A8;
 Thu,  7 May 2020 13:27:28 +0000 (UTC)
IronPort-SDR: 2dtEbst4lx/LJWTT1RgFLN4k+XqFbZsU2AwCyYwLBJ8C1+ABq4yOPVbgPvY8TcajpGenLkjTvV
 cYdHBLDKq0Ew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 06:27:28 -0700
IronPort-SDR: zDrl4IQeUoD6vbWNlKxVwMP3oHmQpEWELmxd6RduSG7MdirJgGFhvEzdVpIAo4jChSCEWA2T5T
 Ank/hMhZ3aJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; d="scan'208";a="260528047"
Received: from plaurent-mobl.ger.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.251.84.89])
 by orsmga003.jf.intel.com with ESMTP; 07 May 2020 06:27:27 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 14/14] drm/i915/psr: Use new DP VSC SDP compute routine on
 PSR
Date: Thu,  7 May 2020 16:27:06 +0300
Message-Id: <20200507132706.2058969-15-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
References: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to use a common VSC SDP Colorimetry calculating code on PSR,
it uses a new psr vsc sdp compute routine.
Because PSR routine has its own scenario and timings of writing a VSC SDP,
the current PSR routine needs to have its own drm_dp_vsc_sdp structure
member variable on struct i915_psr.

In order to calculate colorimetry information, intel_psr_update()
function and intel_psr_enable() function extend a drm_connector_state
argument.

There are no changes to PSR mechanism.

v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
v4: Rebased
v8: Rebased
v10: When a PSR is enabled, it needs to add DP_SDP_VSC to
     infoframes.enable.
     It is needed for comparing between HW and pipe_state of VSC_SDP.
V11: If PSR is disabled by flag, it don't enable psr on pipe compute.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c |  4 +-
 drivers/gpu/drm/i915/display/intel_psr.c | 58 ++++++++----------------
 drivers/gpu/drm/i915/display/intel_psr.h |  6 ++-
 drivers/gpu/drm/i915/i915_drv.h          |  1 +
 4 files changed, 26 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index d88431ebb34e..b4d20b33b9fd 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3682,7 +3682,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
 		intel_dp_stop_link_train(intel_dp);
 
 	intel_edp_backlight_on(crtc_state, conn_state);
-	intel_psr_enable(intel_dp, crtc_state);
+	intel_psr_enable(intel_dp, crtc_state, conn_state);
 	intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
 	intel_edp_drrs_enable(intel_dp, crtc_state);
 
@@ -3865,7 +3865,7 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
 
 	intel_ddi_set_dp_msa(crtc_state, conn_state);
 
-	intel_psr_update(intel_dp, crtc_state);
+	intel_psr_update(intel_dp, crtc_state, conn_state);
 	intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
 	intel_edp_drrs_enable(intel_dp, crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index a0569fdfeb16..dcb2dcde0078 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -30,6 +30,7 @@
 #include "intel_display_types.h"
 #include "intel_psr.h"
 #include "intel_sprite.h"
+#include "intel_hdmi.h"
 
 /**
  * DOC: Panel Self Refresh (PSR/SRD)
@@ -357,39 +358,6 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 	}
 }
 
-static void intel_psr_setup_vsc(struct intel_dp *intel_dp,
-				const struct intel_crtc_state *crtc_state)
-{
-	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-	struct dp_sdp psr_vsc;
-
-	if (dev_priv->psr.psr2_enabled) {
-		/* Prepare VSC Header for SU as per EDP 1.4 spec, Table 6.11 */
-		memset(&psr_vsc, 0, sizeof(psr_vsc));
-		psr_vsc.sdp_header.HB0 = 0;
-		psr_vsc.sdp_header.HB1 = 0x7;
-		if (dev_priv->psr.colorimetry_support) {
-			psr_vsc.sdp_header.HB2 = 0x5;
-			psr_vsc.sdp_header.HB3 = 0x13;
-		} else {
-			psr_vsc.sdp_header.HB2 = 0x4;
-			psr_vsc.sdp_header.HB3 = 0xe;
-		}
-	} else {
-		/* Prepare VSC packet as per EDP 1.3 spec, Table 3.10 */
-		memset(&psr_vsc, 0, sizeof(psr_vsc));
-		psr_vsc.sdp_header.HB0 = 0;
-		psr_vsc.sdp_header.HB1 = 0x7;
-		psr_vsc.sdp_header.HB2 = 0x2;
-		psr_vsc.sdp_header.HB3 = 0x8;
-	}
-
-	intel_dig_port->write_infoframe(&intel_dig_port->base,
-					crtc_state,
-					DP_SDP_VSC, &psr_vsc, sizeof(psr_vsc));
-}
-
 static void hsw_psr_setup_aux(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
@@ -756,6 +724,8 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 	if (intel_dp != dev_priv->psr.dp)
 		return;
 
+	 if (!psr_global_enabled(dev_priv))
+		return;
 	/*
 	 * HSW spec explicitly says PSR is tied to port A.
 	 * BDW+ platforms have a instance of PSR registers per transcoder but
@@ -798,6 +768,7 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 
 	crtc_state->has_psr = true;
 	crtc_state->has_psr2 = intel_psr2_config_valid(intel_dp, crtc_state);
+	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
 }
 
 static void intel_psr_activate(struct intel_dp *intel_dp)
@@ -880,9 +851,12 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 }
 
 static void intel_psr_enable_locked(struct drm_i915_private *dev_priv,
-				    const struct intel_crtc_state *crtc_state)
+				    const struct intel_crtc_state *crtc_state,
+				    const struct drm_connector_state *conn_state)
 {
 	struct intel_dp *intel_dp = dev_priv->psr.dp;
+	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
+	struct intel_encoder *encoder = &intel_dig_port->base;
 	u32 val;
 
 	drm_WARN_ON(&dev_priv->drm, dev_priv->psr.enabled);
@@ -921,7 +895,9 @@ static void intel_psr_enable_locked(struct drm_i915_private *dev_priv,
 
 	drm_dbg_kms(&dev_priv->drm, "Enabling PSR%s\n",
 		    dev_priv->psr.psr2_enabled ? "2" : "1");
-	intel_psr_setup_vsc(intel_dp, crtc_state);
+	intel_dp_compute_psr_vsc_sdp(intel_dp, crtc_state, conn_state,
+				     &dev_priv->psr.vsc);
+	intel_write_dp_vsc_sdp(encoder, crtc_state, &dev_priv->psr.vsc);
 	intel_psr_enable_sink(intel_dp);
 	intel_psr_enable_source(intel_dp, crtc_state);
 	dev_priv->psr.enabled = true;
@@ -933,11 +909,13 @@ static void intel_psr_enable_locked(struct drm_i915_private *dev_priv,
  * intel_psr_enable - Enable PSR
  * @intel_dp: Intel DP
  * @crtc_state: new CRTC state
+ * @conn_state: new CONNECTOR state
  *
  * This function can only be called after the pipe is fully trained and enabled.
  */
 void intel_psr_enable(struct intel_dp *intel_dp,
-		      const struct intel_crtc_state *crtc_state)
+		      const struct intel_crtc_state *crtc_state,
+		      const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
@@ -958,7 +936,7 @@ void intel_psr_enable(struct intel_dp *intel_dp,
 		goto unlock;
 	}
 
-	intel_psr_enable_locked(dev_priv, crtc_state);
+	intel_psr_enable_locked(dev_priv, crtc_state, conn_state);
 
 unlock:
 	mutex_unlock(&dev_priv->psr.lock);
@@ -1091,13 +1069,15 @@ static void psr_force_hw_tracking_exit(struct drm_i915_private *dev_priv)
  * intel_psr_update - Update PSR state
  * @intel_dp: Intel DP
  * @crtc_state: new CRTC state
+ * @conn_state: new CONNECTOR state
  *
  * This functions will update PSR states, disabling, enabling or switching PSR
  * version when executing fastsets. For full modeset, intel_psr_disable() and
  * intel_psr_enable() should be called instead.
  */
 void intel_psr_update(struct intel_dp *intel_dp,
-		      const struct intel_crtc_state *crtc_state)
+		      const struct intel_crtc_state *crtc_state,
+		      const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 	struct i915_psr *psr = &dev_priv->psr;
@@ -1134,7 +1114,7 @@ void intel_psr_update(struct intel_dp *intel_dp,
 		intel_psr_disable_locked(intel_dp);
 
 	if (enable)
-		intel_psr_enable_locked(dev_priv, crtc_state);
+		intel_psr_enable_locked(dev_priv, crtc_state, conn_state);
 
 unlock:
 	mutex_unlock(&dev_priv->psr.lock);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 274fc6bb6221..b4515186d5f4 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -17,11 +17,13 @@ struct intel_dp;
 #define CAN_PSR(dev_priv) (HAS_PSR(dev_priv) && dev_priv->psr.sink_support)
 void intel_psr_init_dpcd(struct intel_dp *intel_dp);
 void intel_psr_enable(struct intel_dp *intel_dp,
-		      const struct intel_crtc_state *crtc_state);
+		      const struct intel_crtc_state *crtc_state,
+		      const struct drm_connector_state *conn_state);
 void intel_psr_disable(struct intel_dp *intel_dp,
 		       const struct intel_crtc_state *old_crtc_state);
 void intel_psr_update(struct intel_dp *intel_dp,
-		      const struct intel_crtc_state *crtc_state);
+		      const struct intel_crtc_state *crtc_state,
+		      const struct drm_connector_state *conn_state);
 int intel_psr_debug_set(struct drm_i915_private *dev_priv, u64 value);
 void intel_psr_invalidate(struct drm_i915_private *dev_priv,
 			  unsigned frontbuffer_bits,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 6af69555733e..82ebd7774a1d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -510,6 +510,7 @@ struct i915_psr {
 	u32 dc3co_exit_delay;
 	struct delayed_work dc3co_work;
 	bool force_mode_changed;
+	struct drm_dp_vsc_sdp vsc;
 };
 
 #define QUIRK_LVDS_SSC_DISABLE (1<<1)
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
