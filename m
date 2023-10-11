Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33207C51DC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 13:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186CD10E704;
	Wed, 11 Oct 2023 11:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE30610E6F7;
 Wed, 11 Oct 2023 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697023388; x=1728559388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3PlcZ+KXmYr6lyTmOmxQbQeufX4W2MnX4UYkSHUTVlY=;
 b=mhNWbFfglzMb6xK8vqH0F7Rr3ItRX3okK2t6dB9dW4L95L5z+yGIN5kD
 28jmdMPDu+0vYfYhD7T3NTIe/VfFRY224BnBwxnb2HMqp90Cg1QhT4bLZ
 22CgplHCsb7qx7Bo9UPp8d1o1529f+JW5JQOsSmvoeAR0wgQD4VrqBzj1
 GHgIccdAlx15FZlZ/oGh9y45nfbgNecGwlMaMvNsZT3nzJbzsydVKwIm/
 dRxqL7AIJZ3pjmqkgLdBU2m210BDa1nVWWl6cfTKBChaRIsiSVt+fdEPg
 3+kULYw1NsV1vupaESKPOrHeTvreSoenmaD27MjxZPH9GD2u2eow4S6Z2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387482677"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="387482677"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 04:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877630929"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="877630929"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga004.jf.intel.com with ESMTP; 11 Oct 2023 04:21:43 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 5/6] drm/i915/panelreplay: enable/disable panel replay
Date: Wed, 11 Oct 2023 16:39:35 +0530
Message-Id: <20231011110936.1851563-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231011110936.1851563-1-animesh.manna@intel.com>
References: <20231011110936.1851563-1-animesh.manna@intel.com>
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
 Arun R Murthy <arun.r.murthy@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TRANS_DP2_CTL register is programmed to enable panel replay from source
and sink is enabled through panel replay dpcd configuration address.

Bspec: 1407940617

v1: Initial version.
v2:
- Use pr_* flags instead psr_* flags. [Jouni]
- Remove intel_dp_is_edp check as edp1.5 also has panel replay. [Jouni]

v3: Cover letter updated and selective fetch condition check is added
before updating its bit in PSR2_MAN_TRK_CTL register. [Jouni]

v4: Selective fetch related PSR2_MAN_TRK_CTL programmming dropped. [Jouni]

v5: Added PSR2_MAN_TRK_CTL programming as needed for Continuous Full
Frame (CFF) update.

v6: Rebased on latest.

Note: Initial plan is to enable panel replay in  full-screen live active
frame update mode. In a incremental approach panel replay will be enabled
in selctive update mode if there is any gap in curent implementation.

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  7 ++-
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 63 ++++++++++++++-----
 3 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9151d5add960..16f98a7a5f20 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2717,10 +2717,15 @@ static void intel_ddi_pre_enable_dp(struct intel_atomic_state *state,
 				    const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
-	if (HAS_DP20(dev_priv))
+	if (HAS_DP20(dev_priv)) {
 		intel_dp_128b132b_sdp_crc16(enc_to_intel_dp(encoder),
 					    crtc_state);
+		if (crtc_state->has_panel_replay)
+			drm_dp_dpcd_writeb(&intel_dp->aux, PANEL_REPLAY_CONFIG,
+					   DP_PANEL_REPLAY_ENABLE);
+	}
 
 	if (DISPLAY_VER(dev_priv) >= 14)
 		mtl_ddi_pre_enable_dp(state, encoder, crtc_state, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 95b318f7b2b8..d8f35054bc11 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1704,6 +1704,7 @@ struct intel_psr {
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
 	bool sink_panel_replay_support;
+	bool panel_replay_enabled;
 	u32 dc3co_exitline;
 	u32 dc3co_exit_delay;
 	struct delayed_work dc3co_work;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index a2e0637c53fb..80de831c2f60 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -608,8 +608,11 @@ static void intel_psr_enable_sink(struct intel_dp *intel_dp)
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 	u8 dpcd_val = DP_PSR_ENABLE;
 
-	/* Enable ALPM at sink for psr2 */
+	if (intel_dp->psr.panel_replay_enabled)
+		return;
+
 	if (intel_dp->psr.psr2_enabled) {
+		/* Enable ALPM at sink for psr2 */
 		drm_dp_dpcd_writeb(&intel_dp->aux, DP_RECEIVER_ALPM_CONFIG,
 				   DP_ALPM_ENABLE |
 				   DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE);
@@ -759,6 +762,17 @@ static int psr2_block_count(struct intel_dp *intel_dp)
 	return psr2_block_count_lines(intel_dp) / 4;
 }
 
+static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+
+	intel_de_rmw(dev_priv, PSR2_MAN_TRK_CTL(intel_dp->psr.transcoder),
+		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME);
+
+	intel_de_rmw(dev_priv, TRANS_DP2_CTL(intel_dp->psr.transcoder), 0,
+		     TRANS_DP2_PANEL_REPLAY_ENABLE);
+}
+
 static void hsw_activate_psr2(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
@@ -1323,18 +1337,23 @@ void intel_psr_get_config(struct intel_encoder *encoder,
 		return;
 
 	intel_dp = &dig_port->dp;
-	if (!CAN_PSR(intel_dp))
+	if (!(CAN_PSR(intel_dp) || CAN_PANEL_REPLAY(intel_dp)))
 		return;
 
 	mutex_lock(&intel_dp->psr.lock);
 	if (!intel_dp->psr.enabled)
 		goto unlock;
 
-	/*
-	 * Not possible to read EDP_PSR/PSR2_CTL registers as it is
-	 * enabled/disabled because of frontbuffer tracking and others.
-	 */
-	pipe_config->has_psr = true;
+	if (intel_dp->psr.panel_replay_enabled) {
+		pipe_config->has_panel_replay = true;
+	} else {
+		/*
+		 * Not possible to read EDP_PSR/PSR2_CTL registers as it is
+		 * enabled/disabled because of frontbuffer tracking and others.
+		 */
+		pipe_config->has_psr = true;
+	}
+
 	pipe_config->has_psr2 = intel_dp->psr.psr2_enabled;
 	pipe_config->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
 
@@ -1371,8 +1390,10 @@ static void intel_psr_activate(struct intel_dp *intel_dp)
 
 	lockdep_assert_held(&intel_dp->psr.lock);
 
-	/* psr1 and psr2 are mutually exclusive.*/
-	if (intel_dp->psr.psr2_enabled)
+	/* psr1, psr2 and panel-replay are mutually exclusive.*/
+	if (intel_dp->psr.panel_replay_enabled)
+		dg2_activate_panel_replay(intel_dp);
+	else if (intel_dp->psr.psr2_enabled)
 		hsw_activate_psr2(intel_dp);
 	else
 		hsw_activate_psr1(intel_dp);
@@ -1550,6 +1571,7 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	drm_WARN_ON(&dev_priv->drm, intel_dp->psr.enabled);
 
 	intel_dp->psr.psr2_enabled = crtc_state->has_psr2;
+	intel_dp->psr.panel_replay_enabled = crtc_state->has_panel_replay;
 	intel_dp->psr.busy_frontbuffer_bits = 0;
 	intel_dp->psr.pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
 	intel_dp->psr.transcoder = crtc_state->cpu_transcoder;
@@ -1565,8 +1587,12 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	if (!psr_interrupt_error_check(intel_dp))
 		return;
 
-	drm_dbg_kms(&dev_priv->drm, "Enabling PSR%s\n",
-		    intel_dp->psr.psr2_enabled ? "2" : "1");
+	if (intel_dp->psr.panel_replay_enabled)
+		drm_dbg_kms(&dev_priv->drm, "Enabling Panel Replay\n");
+	else
+		drm_dbg_kms(&dev_priv->drm, "Enabling PSR%s\n",
+			    intel_dp->psr.psr2_enabled ? "2" : "1");
+
 	intel_write_dp_vsc_sdp(encoder, crtc_state, &crtc_state->psr_vsc);
 	intel_snps_phy_update_psr_power_state(dev_priv, phy, true);
 	intel_psr_enable_sink(intel_dp);
@@ -1595,7 +1621,10 @@ static void intel_psr_exit(struct intel_dp *intel_dp)
 		return;
 	}
 
-	if (intel_dp->psr.psr2_enabled) {
+	if (intel_dp->psr.panel_replay_enabled) {
+		intel_de_rmw(dev_priv, TRANS_DP2_CTL(intel_dp->psr.transcoder),
+			     TRANS_DP2_PANEL_REPLAY_ENABLE, 0);
+	} else if (intel_dp->psr.psr2_enabled) {
 		tgl_disallow_dc3co_on_psr2_exit(intel_dp);
 
 		val = intel_de_rmw(dev_priv, EDP_PSR2_CTL(cpu_transcoder),
@@ -1644,8 +1673,11 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	if (!intel_dp->psr.enabled)
 		return;
 
-	drm_dbg_kms(&dev_priv->drm, "Disabling PSR%s\n",
-		    intel_dp->psr.psr2_enabled ? "2" : "1");
+	if (intel_dp->psr.panel_replay_enabled)
+		drm_dbg_kms(&dev_priv->drm, "Disabling Panel Replay\n");
+	else
+		drm_dbg_kms(&dev_priv->drm, "Disabling PSR%s\n",
+			    intel_dp->psr.psr2_enabled ? "2" : "1");
 
 	intel_psr_exit(intel_dp);
 	intel_psr_wait_exit_locked(intel_dp);
@@ -1678,6 +1710,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 		drm_dp_dpcd_writeb(&intel_dp->aux, DP_RECEIVER_ALPM_CONFIG, 0);
 
 	intel_dp->psr.enabled = false;
+	intel_dp->psr.panel_replay_enabled = false;
 	intel_dp->psr.psr2_enabled = false;
 	intel_dp->psr.psr2_sel_fetch_enabled = false;
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
@@ -2249,7 +2282,7 @@ void intel_psr_post_plane_update(struct intel_atomic_state *state,
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_encoder *encoder;
 
-	if (!crtc_state->has_psr)
+	if (!(crtc_state->has_psr || crtc_state->has_panel_replay))
 		return;
 
 	for_each_intel_encoder_mask_with_psr(state->base.dev, encoder,
-- 
2.29.0

