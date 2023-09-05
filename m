Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A7B7920D6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9005C10E450;
	Tue,  5 Sep 2023 07:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48F510E450;
 Tue,  5 Sep 2023 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693900031; x=1725436031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FNfyllmYjin3Q1SquF+RPP95fFxTmwe32gndHedBWiI=;
 b=M51fGPychEhnMsH4X14b7J0tyNbaPZ7/Kqyo81Y4m97tZOxUYRJ4bRpU
 y/dt3mZ4z3S6vOAJ47KmdefESWwTUtwmR2nvKmU/EibnWr25VA1dLlkYo
 YqlLwWRyQSm53UWyd39NCXk1iu4Q5c+vdtlX0gG0l6BjuWIWU3C8w+1X9
 WIlxroLQXZrnS65R+az0sSIeKxbqzzg+itgp/eNjY7cS531Y6ZQw0/45b
 OVUkqKXwSsPqKR1DJwhz+AI7tDy0PGPEhb71ihcnIiyGvvH/jlKi2eLCW
 9KAJDb03wMEZOIoQRQfhaIPtQ/9ENOZHANlvfIyRnETz5VU02H2HYXj2d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="443133690"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="443133690"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 00:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="855878517"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="855878517"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2023 00:47:08 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/6] drm/i915/panelreplay: enable/disable panel replay
Date: Tue,  5 Sep 2023 13:05:50 +0530
Message-Id: <20230905073551.958368-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20230905073551.958368-1-animesh.manna@intel.com>
References: <20230905073551.958368-1-animesh.manna@intel.com>
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
Cc: jani.nikula@intel.com, jouni.hogander@intel.com,
 Animesh Manna <animesh.manna@intel.com>, arun.r.murthy@intel.com
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

Note: Initial plan is to enable panel replay in  full-screen live active
frame update mode. In a incremental approach panel replay will be enabled
in selctive update mode if there is any gap in curent implementation.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 65 ++++++++++++++-----
 2 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 4022d6d8281a..b1383988b656 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1696,6 +1696,7 @@ struct intel_psr {
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
 	bool sink_panel_replay_support;
+	bool panel_replay_enabled;
 	u32 dc3co_exitline;
 	u32 dc3co_exit_delay;
 	struct delayed_work dc3co_work;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 4e9c126a47ff..5cbf08a4c94c 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -606,8 +606,14 @@ static void intel_psr_enable_sink(struct intel_dp *intel_dp)
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 	u8 dpcd_val = DP_PSR_ENABLE;
 
-	/* Enable ALPM at sink for psr2 */
+	if (intel_dp->psr.panel_replay_enabled) {
+		drm_dp_dpcd_writeb(&intel_dp->aux, PANEL_REPLAY_CONFIG,
+				   DP_PANEL_REPLAY_ENABLE);
+		return;
+	}
+
 	if (intel_dp->psr.psr2_enabled) {
+		/* Enable ALPM at sink for psr2 */
 		drm_dp_dpcd_writeb(&intel_dp->aux, DP_RECEIVER_ALPM_CONFIG,
 				   DP_ALPM_ENABLE |
 				   DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE);
@@ -757,6 +763,14 @@ static int psr2_block_count(struct intel_dp *intel_dp)
 	return psr2_block_count_lines(intel_dp) / 4;
 }
 
+static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+
+	intel_de_rmw(dev_priv, TRANS_DP2_CTL(intel_dp->psr.transcoder), 0,
+		     TRANS_DP2_PANEL_REPLAY_ENABLE);
+}
+
 static void hsw_activate_psr2(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
@@ -1320,18 +1334,23 @@ void intel_psr_get_config(struct intel_encoder *encoder,
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
 
@@ -1368,8 +1387,10 @@ static void intel_psr_activate(struct intel_dp *intel_dp)
 
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
@@ -1547,6 +1568,7 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	drm_WARN_ON(&dev_priv->drm, intel_dp->psr.enabled);
 
 	intel_dp->psr.psr2_enabled = crtc_state->has_psr2;
+	intel_dp->psr.panel_replay_enabled = crtc_state->has_panel_replay;
 	intel_dp->psr.busy_frontbuffer_bits = 0;
 	intel_dp->psr.pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
 	intel_dp->psr.transcoder = crtc_state->cpu_transcoder;
@@ -1562,8 +1584,12 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
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
@@ -1592,7 +1618,10 @@ static void intel_psr_exit(struct intel_dp *intel_dp)
 		return;
 	}
 
-	if (intel_dp->psr.psr2_enabled) {
+	if (intel_dp->psr.panel_replay_enabled) {
+		intel_de_rmw(dev_priv, TRANS_DP2_CTL(intel_dp->psr.transcoder),
+			     TRANS_DP2_PANEL_REPLAY_ENABLE, 0);
+	} else if (intel_dp->psr.psr2_enabled) {
 		tgl_disallow_dc3co_on_psr2_exit(intel_dp);
 
 		val = intel_de_rmw(dev_priv, EDP_PSR2_CTL(cpu_transcoder),
@@ -1641,8 +1670,11 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
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
@@ -1675,6 +1707,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 		drm_dp_dpcd_writeb(&intel_dp->aux, DP_RECEIVER_ALPM_CONFIG, 0);
 
 	intel_dp->psr.enabled = false;
+	intel_dp->psr.panel_replay_enabled = false;
 	intel_dp->psr.psr2_enabled = false;
 	intel_dp->psr.psr2_sel_fetch_enabled = false;
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
@@ -2244,7 +2277,7 @@ static void _intel_psr_post_plane_update(const struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
 	struct intel_encoder *encoder;
 
-	if (!crtc_state->has_psr)
+	if (!(crtc_state->has_psr || crtc_state->has_panel_replay))
 		return;
 
 	for_each_intel_encoder_mask_with_psr(state->base.dev, encoder,
@@ -2291,7 +2324,7 @@ void intel_psr_post_plane_update(const struct intel_atomic_state *state)
 	struct intel_crtc *crtc;
 	int i;
 
-	if (!HAS_PSR(dev_priv))
+	if (!(HAS_PSR(dev_priv) || HAS_DP20(dev_priv)))
 		return;
 
 	for_each_new_intel_crtc_in_state(state, crtc, crtc_state, i)
-- 
2.29.0

