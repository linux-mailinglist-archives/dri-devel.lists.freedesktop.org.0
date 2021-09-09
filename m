Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18384053B5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE3B6E87D;
	Thu,  9 Sep 2021 12:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416F16E87C;
 Thu,  9 Sep 2021 12:53:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="200979714"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="200979714"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:53:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="696310669"
Received: from okozlyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.52])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:53:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [PATCH v3 13/13] drm/i915/dg2: update link training for 128b/132b
Date: Thu,  9 Sep 2021 15:52:05 +0300
Message-Id: <98b4dd5a08322011eea675099514e93dcb8dd93e.1631191763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1631191763.git.jani.nikula@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The 128b/132b channel coding link training uses more straightforward TX
FFE preset values.

v2: Fix UHBR rate checks, use intel_dp_is_uhbr() helper

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      | 13 ++-
 .../drm/i915/display/intel_dp_link_training.c | 86 +++++++++++++------
 2 files changed, 70 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index d2b96b2efdfe..5805bdd6e1f2 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1398,11 +1398,16 @@ static int translate_signal_level(struct intel_dp *intel_dp,
 static int intel_ddi_dp_level(struct intel_dp *intel_dp,
 			      const struct intel_crtc_state *crtc_state)
 {
-	u8 train_set = intel_dp->train_set[0];
-	u8 signal_levels = train_set & (DP_TRAIN_VOLTAGE_SWING_MASK |
-					DP_TRAIN_PRE_EMPHASIS_MASK);
+	if (intel_dp_is_uhbr(crtc_state)) {
+		/* FIXME: We'll want independent presets for each lane. */
+		return intel_dp->train_set[0] & DP_TX_FFE_PRESET_VALUE_MASK;
+	} else {
+		u8 train_set = intel_dp->train_set[0];
+		u8 signal_levels = train_set & (DP_TRAIN_VOLTAGE_SWING_MASK |
+						DP_TRAIN_PRE_EMPHASIS_MASK);
 
-	return translate_signal_level(intel_dp, signal_levels);
+		return translate_signal_level(intel_dp, signal_levels);
+	}
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 4f116cd32846..c10f165d1aa2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -301,6 +301,24 @@ static u8 intel_dp_phy_preemph_max(struct intel_dp *intel_dp,
 	return preemph_max;
 }
 
+static void intel_dp_128b132b_adjust_train(struct intel_dp *intel_dp,
+					   const struct intel_crtc_state *crtc_state,
+					   const u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	int lane;
+	u8 tx_ffe = 0;
+
+	/*
+	 * FIXME: We'll want independent presets for each lane. See also
+	 * intel_ddi_dp_level() and intel_snps_phy_ddi_vswing_sequence().
+	 */
+	for (lane = 0; lane < crtc_state->lane_count; lane++)
+		tx_ffe = max(tx_ffe, drm_dp_get_adjust_tx_ffe_preset(link_status, lane));
+
+	for (lane = 0; lane < crtc_state->lane_count; lane++)
+		intel_dp->train_set[lane] = tx_ffe;
+}
+
 void
 intel_dp_get_adjust_train(struct intel_dp *intel_dp,
 			  const struct intel_crtc_state *crtc_state,
@@ -313,6 +331,11 @@ intel_dp_get_adjust_train(struct intel_dp *intel_dp,
 	u8 voltage_max;
 	u8 preemph_max;
 
+	if (intel_dp_is_uhbr(crtc_state)) {
+		intel_dp_128b132b_adjust_train(intel_dp, crtc_state, link_status);
+		return;
+	}
+
 	for (lane = 0; lane < crtc_state->lane_count; lane++) {
 		v = max(v, drm_dp_get_adjust_request_voltage(link_status, lane));
 		p = max(p, drm_dp_get_adjust_request_pre_emphasis(link_status, lane));
@@ -402,14 +425,21 @@ void intel_dp_set_signal_levels(struct intel_dp *intel_dp,
 	u8 train_set = intel_dp->train_set[0];
 	char phy_name[10];
 
-	drm_dbg_kms(&dev_priv->drm, "Using vswing level %d%s, pre-emphasis level %d%s, at %s\n",
-		    train_set & DP_TRAIN_VOLTAGE_SWING_MASK,
-		    train_set & DP_TRAIN_MAX_SWING_REACHED ? " (max)" : "",
-		    (train_set & DP_TRAIN_PRE_EMPHASIS_MASK) >>
-		    DP_TRAIN_PRE_EMPHASIS_SHIFT,
-		    train_set & DP_TRAIN_MAX_PRE_EMPHASIS_REACHED ?
-		    " (max)" : "",
-		    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)));
+	if (intel_dp_is_uhbr(crtc_state)) {
+		/* FIXME: We'll want independent presets for each lane. */
+		drm_dbg_kms(&dev_priv->drm, "%s: Using 128b/132b TX FFE preset %u\n",
+			    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)),
+			    train_set & DP_TX_FFE_PRESET_VALUE_MASK);
+	} else {
+		drm_dbg_kms(&dev_priv->drm, "%s: Using 8b/10b vswing level %d%s, pre-emphasis level %d%s\n",
+			    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)),
+			    train_set & DP_TRAIN_VOLTAGE_SWING_MASK,
+			    train_set & DP_TRAIN_MAX_SWING_REACHED ? " (max)" : "",
+			    (train_set & DP_TRAIN_PRE_EMPHASIS_MASK) >>
+			    DP_TRAIN_PRE_EMPHASIS_SHIFT,
+			    train_set & DP_TRAIN_MAX_PRE_EMPHASIS_REACHED ?
+			    " (max)" : "");
+	}
 
 	if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
 		intel_dp->set_signal_levels(intel_dp, crtc_state);
@@ -565,18 +595,21 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 			return true;
 		}
 
-		if (voltage_tries == 5) {
-			drm_dbg_kms(&i915->drm,
-				    "Same voltage tried 5 times\n");
-			return false;
-		}
+		/* FIXME: 128b/132b needs better abstractions here. */
+		if (!intel_dp_is_uhbr(crtc_state)) {
+			if (voltage_tries == 5) {
+				drm_dbg_kms(&i915->drm,
+					    "Same voltage tried 5 times\n");
+				return false;
+			}
 
-		if (max_vswing_reached) {
-			drm_dbg_kms(&i915->drm, "Max Voltage Swing reached\n");
-			return false;
-		}
+			if (max_vswing_reached) {
+				drm_dbg_kms(&i915->drm, "Max Voltage Swing reached\n");
+				return false;
+			}
 
-		voltage = intel_dp->train_set[0] & DP_TRAIN_VOLTAGE_SWING_MASK;
+			voltage = intel_dp->train_set[0] & DP_TRAIN_VOLTAGE_SWING_MASK;
+		}
 
 		/* Update training set as requested by target */
 		intel_dp_get_adjust_train(intel_dp, crtc_state, dp_phy,
@@ -587,14 +620,17 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 			return false;
 		}
 
-		if ((intel_dp->train_set[0] & DP_TRAIN_VOLTAGE_SWING_MASK) ==
-		    voltage)
-			++voltage_tries;
-		else
-			voltage_tries = 1;
+		/* FIXME: 128b/132b needs better abstractions here. */
+		if (!intel_dp_is_uhbr(crtc_state)) {
+			if ((intel_dp->train_set[0] & DP_TRAIN_VOLTAGE_SWING_MASK) ==
+			    voltage)
+				++voltage_tries;
+			else
+				voltage_tries = 1;
 
-		if (intel_dp_link_max_vswing_reached(intel_dp, crtc_state))
-			max_vswing_reached = true;
+			if (intel_dp_link_max_vswing_reached(intel_dp, crtc_state))
+				max_vswing_reached = true;
+		}
 
 	}
 	drm_err(&i915->drm,
-- 
2.30.2

