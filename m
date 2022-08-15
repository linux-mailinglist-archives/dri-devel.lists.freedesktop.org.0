Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC3C592B14
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 11:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F65493E56;
	Mon, 15 Aug 2022 08:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBC899B1E;
 Mon, 15 Aug 2022 08:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660553932; x=1692089932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kapcHkyC7y8mqS6moYZhKb0+WSlqVlr1MfjZzuO61OE=;
 b=RR++q50avsRQfFWfwifBC7BBzuRMvnG8WywGuEs4j+CVBMZA5d+KzZgN
 Br4aOFbZ/OMaSwmgTiCRpbYNFEcYrgXVo36SeO48svahmT8e+dYdZMmqT
 XFrEPRjs9/WWf/iQADd+P9E1FKTW4LHlh2kNtJ3f/JvcMcrIYvzHSL7Fw
 sUGZQhzQrDbvrb2tt9QjcqfCb714Dkq7S4gFsVGl4iFHVQ3FoTX5CpMne
 SU/7gYYnMl6bXO/pyFAVcDKlOvHbb/Ae19yv9d9GbPfQkIQBpSGjwqqGa
 hvh9mx6xoMTo7gso5NDPnDskMSp8WCI7SF8ALWqBsMzwHG6777kRFvOyX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="378209938"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="378209938"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:58:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="582813736"
Received: from abelova-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.50.172])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:58:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/dp: use drm_dp_phy_name() for logging
Date: Mon, 15 Aug 2022 11:58:35 +0300
Message-Id: <2d6a66eee3f45183d1b1351bfd667447e9a82129.1660553850.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1660553850.git.jani.nikula@intel.com>
References: <cover.1660553850.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the local intel_dp_phy_name() function, and replace with
drm_dp_phy_name(). This lets us drop a number of local buffers.

v2: Rebase

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 83 ++++++++-----------
 1 file changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 9feaf1a589f3..abe32fe3f744 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -37,17 +37,6 @@ static void intel_dp_reset_lttpr_count(struct intel_dp *intel_dp)
 				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = 0;
 }
 
-static const char *intel_dp_phy_name(enum drm_dp_phy dp_phy,
-				     char *buf, size_t buf_size)
-{
-	if (dp_phy == DP_PHY_DPRX)
-		snprintf(buf, buf_size, "DPRX");
-	else
-		snprintf(buf, buf_size, "LTTPR %d", dp_phy - DP_PHY_LTTPR1 + 1);
-
-	return buf;
-}
-
 static u8 *intel_dp_lttpr_phy_caps(struct intel_dp *intel_dp,
 				   enum drm_dp_phy dp_phy)
 {
@@ -60,20 +49,19 @@ static void intel_dp_read_lttpr_phy_caps(struct intel_dp *intel_dp,
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	u8 *phy_caps = intel_dp_lttpr_phy_caps(intel_dp, dp_phy);
-	char phy_name[10];
-
-	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
 
 	if (drm_dp_read_lttpr_phy_caps(&intel_dp->aux, dpcd, dp_phy, phy_caps) < 0) {
 		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
 			    "[ENCODER:%d:%s][%s] failed to read the PHY caps\n",
-			    encoder->base.base.id, encoder->base.name, phy_name);
+			    encoder->base.base.id, encoder->base.name,
+			    drm_dp_phy_name(dp_phy));
 		return;
 	}
 
 	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
 		    "[ENCODER:%d:%s][%s] PHY capabilities: %*ph\n",
-		    encoder->base.base.id, encoder->base.name, phy_name,
+		    encoder->base.base.id, encoder->base.name,
+		    drm_dp_phy_name(dp_phy),
 		    (int)sizeof(intel_dp->lttpr_phy_caps[0]),
 		    phy_caps);
 }
@@ -423,14 +411,13 @@ intel_dp_get_adjust_train(struct intel_dp *intel_dp,
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
-	char phy_name[10];
 	int lane;
 
 	if (intel_dp_is_uhbr(crtc_state)) {
 		drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s][%s] 128b/132b, lanes: %d, "
 			    "TX FFE request: " TRAIN_REQ_FMT "\n",
 			    encoder->base.base.id, encoder->base.name,
-			    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)),
+			    drm_dp_phy_name(dp_phy),
 			    crtc_state->lane_count,
 			    TRAIN_REQ_TX_FFE_ARGS(link_status));
 	} else {
@@ -438,7 +425,7 @@ intel_dp_get_adjust_train(struct intel_dp *intel_dp,
 			    "vswing request: " TRAIN_REQ_FMT ", "
 			    "pre-emphasis request: " TRAIN_REQ_FMT "\n",
 			    encoder->base.base.id, encoder->base.name,
-			    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)),
+			    drm_dp_phy_name(dp_phy),
 			    crtc_state->lane_count,
 			    TRAIN_REQ_VSWING_ARGS(link_status),
 			    TRAIN_REQ_PREEMPH_ARGS(link_status));
@@ -503,13 +490,12 @@ intel_dp_program_link_training_pattern(struct intel_dp *intel_dp,
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	u8 train_pat = intel_dp_training_pattern_symbol(dp_train_pat);
-	char phy_name[10];
 
 	if (train_pat != DP_TRAINING_PATTERN_DISABLE)
 		drm_dbg_kms(&i915->drm,
 			    "[ENCODER:%d:%s][%s] Using DP training pattern TPS%c\n",
 			    encoder->base.base.id, encoder->base.name,
-			    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)),
+			    drm_dp_phy_name(dp_phy),
 			    dp_training_pattern_name(train_pat));
 
 	intel_dp->set_link_train(intel_dp, crtc_state, dp_train_pat);
@@ -546,13 +532,12 @@ void intel_dp_set_signal_levels(struct intel_dp *intel_dp,
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
-	char phy_name[10];
 
 	if (intel_dp_is_uhbr(crtc_state)) {
 		drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s][%s] 128b/132b, lanes: %d, "
 			    "TX FFE presets: " TRAIN_SET_FMT "\n",
 			    encoder->base.base.id, encoder->base.name,
-			    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)),
+			    drm_dp_phy_name(dp_phy),
 			    crtc_state->lane_count,
 			    TRAIN_SET_TX_FFE_ARGS(intel_dp->train_set));
 	} else {
@@ -560,7 +545,7 @@ void intel_dp_set_signal_levels(struct intel_dp *intel_dp,
 			    "vswing levels: " TRAIN_SET_FMT ", "
 			    "pre-emphasis levels: " TRAIN_SET_FMT "\n",
 			    encoder->base.base.id, encoder->base.name,
-			    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)),
+			    drm_dp_phy_name(dp_phy),
 			    crtc_state->lane_count,
 			    TRAIN_SET_VSWING_ARGS(intel_dp->train_set),
 			    TRAIN_SET_PREEMPH_ARGS(intel_dp->train_set));
@@ -732,12 +717,11 @@ intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy dp_phy,
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
-	char phy_name[10];
 
 	drm_dbg_kms(&i915->drm,
 		    "[ENCODER:%d:%s][%s] ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x%x adj_req2_3:0x%x\n",
 		    encoder->base.base.id, encoder->base.name,
-		    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)),
+		    drm_dp_phy_name(dp_phy),
 		    link_status[0], link_status[1], link_status[2],
 		    link_status[3], link_status[4], link_status[5]);
 }
@@ -757,21 +741,19 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 	int voltage_tries, cr_tries, max_cr_tries;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	bool max_vswing_reached = false;
-	char phy_name[10];
 	int delay_us;
 
 	delay_us = drm_dp_read_clock_recovery_delay(&intel_dp->aux,
 						    intel_dp->dpcd, dp_phy,
 						    intel_dp_is_uhbr(crtc_state));
 
-	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
-
 	/* clock recovery */
 	if (!intel_dp_reset_link_train(intel_dp, crtc_state, dp_phy,
 				       DP_TRAINING_PATTERN_1 |
 				       DP_LINK_SCRAMBLING_DISABLE)) {
 		drm_err(&i915->drm, "[ENCODER:%d:%s][%s] Failed to enable link training\n",
-			encoder->base.base.id, encoder->base.name, phy_name);
+			encoder->base.base.id, encoder->base.name,
+			drm_dp_phy_name(dp_phy));
 		return false;
 	}
 
@@ -795,14 +777,16 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, dp_phy,
 						     link_status) < 0) {
 			drm_err(&i915->drm, "[ENCODER:%d:%s][%s] Failed to get link status\n",
-				encoder->base.base.id, encoder->base.name, phy_name);
+				encoder->base.base.id, encoder->base.name,
+				drm_dp_phy_name(dp_phy));
 			return false;
 		}
 
 		if (drm_dp_clock_recovery_ok(link_status, crtc_state->lane_count)) {
 			drm_dbg_kms(&i915->drm,
 				    "[ENCODER:%d:%s][%s] Clock recovery OK\n",
-				    encoder->base.base.id, encoder->base.name, phy_name);
+				    encoder->base.base.id, encoder->base.name,
+				    drm_dp_phy_name(dp_phy));
 			return true;
 		}
 
@@ -810,7 +794,8 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 			intel_dp_dump_link_status(intel_dp, dp_phy, link_status);
 			drm_dbg_kms(&i915->drm,
 				    "[ENCODER:%d:%s][%s] Same voltage tried 5 times\n",
-				    encoder->base.base.id, encoder->base.name, phy_name);
+				    encoder->base.base.id, encoder->base.name,
+				    drm_dp_phy_name(dp_phy));
 			return false;
 		}
 
@@ -818,7 +803,8 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 			intel_dp_dump_link_status(intel_dp, dp_phy, link_status);
 			drm_dbg_kms(&i915->drm,
 				    "[ENCODER:%d:%s][%s] Max Voltage Swing reached\n",
-				    encoder->base.base.id, encoder->base.name, phy_name);
+				    encoder->base.base.id, encoder->base.name,
+				    drm_dp_phy_name(dp_phy));
 			return false;
 		}
 
@@ -828,7 +814,8 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 		if (!intel_dp_update_link_train(intel_dp, crtc_state, dp_phy)) {
 			drm_err(&i915->drm,
 				"[ENCODER:%d:%s][%s] Failed to update link training\n",
-				encoder->base.base.id, encoder->base.name, phy_name);
+				encoder->base.base.id, encoder->base.name,
+				drm_dp_phy_name(dp_phy));
 			return false;
 		}
 
@@ -846,7 +833,8 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 	intel_dp_dump_link_status(intel_dp, dp_phy, link_status);
 	drm_err(&i915->drm,
 		"[ENCODER:%d:%s][%s] Failed clock recovery %d times, giving up!\n",
-		encoder->base.base.id, encoder->base.name, phy_name, max_cr_tries);
+		encoder->base.base.id, encoder->base.name,
+		drm_dp_phy_name(dp_phy), max_cr_tries);
 
 	return false;
 }
@@ -924,15 +912,12 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 	u32 training_pattern;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	bool channel_eq = false;
-	char phy_name[10];
 	int delay_us;
 
 	delay_us = drm_dp_read_channel_eq_delay(&intel_dp->aux,
 						intel_dp->dpcd, dp_phy,
 						intel_dp_is_uhbr(crtc_state));
 
-	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
-
 	training_pattern = intel_dp_training_pattern(intel_dp, crtc_state, dp_phy);
 	/* Scrambling is disabled for TPS2/3 and enabled for TPS4 */
 	if (training_pattern != DP_TRAINING_PATTERN_4)
@@ -944,7 +929,7 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 		drm_err(&i915->drm,
 			"[ENCODER:%d:%s][%s] Failed to start channel equalization\n",
 			encoder->base.base.id, encoder->base.name,
-			phy_name);
+			drm_dp_phy_name(dp_phy));
 		return false;
 	}
 
@@ -955,7 +940,8 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 						     link_status) < 0) {
 			drm_err(&i915->drm,
 				"[ENCODER:%d:%s][%s] Failed to get link status\n",
-				encoder->base.base.id, encoder->base.name, phy_name);
+				encoder->base.base.id, encoder->base.name,
+				drm_dp_phy_name(dp_phy));
 			break;
 		}
 
@@ -966,7 +952,8 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 			drm_dbg_kms(&i915->drm,
 				    "[ENCODER:%d:%s][%s] Clock recovery check failed, cannot "
 				    "continue channel equalization\n",
-				    encoder->base.base.id, encoder->base.name, phy_name);
+				    encoder->base.base.id, encoder->base.name,
+				    drm_dp_phy_name(dp_phy));
 			break;
 		}
 
@@ -975,7 +962,8 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 			channel_eq = true;
 			drm_dbg_kms(&i915->drm,
 				    "[ENCODER:%d:%s][%s] Channel EQ done. DP Training successful\n",
-				    encoder->base.base.id, encoder->base.name, phy_name);
+				    encoder->base.base.id, encoder->base.name,
+				    drm_dp_phy_name(dp_phy));
 			break;
 		}
 
@@ -985,7 +973,8 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 		if (!intel_dp_update_link_train(intel_dp, crtc_state, dp_phy)) {
 			drm_err(&i915->drm,
 				"[ENCODER:%d:%s][%s] Failed to update link training\n",
-				encoder->base.base.id, encoder->base.name, phy_name);
+				encoder->base.base.id, encoder->base.name,
+				drm_dp_phy_name(dp_phy));
 			break;
 		}
 	}
@@ -995,7 +984,8 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 		intel_dp_dump_link_status(intel_dp, dp_phy, link_status);
 		drm_dbg_kms(&i915->drm,
 			    "[ENCODER:%d:%s][%s] Channel equalization failed 5 times\n",
-			    encoder->base.base.id, encoder->base.name, phy_name);
+			    encoder->base.base.id, encoder->base.name,
+			    drm_dp_phy_name(dp_phy));
 	}
 
 	return channel_eq;
@@ -1070,7 +1060,6 @@ intel_dp_link_train_phy(struct intel_dp *intel_dp,
 {
 	struct intel_connector *connector = intel_dp->attached_connector;
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	char phy_name[10];
 	bool ret = false;
 
 	if (!intel_dp_link_training_clock_recovery(intel_dp, crtc_state, dp_phy))
@@ -1086,7 +1075,7 @@ intel_dp_link_train_phy(struct intel_dp *intel_dp,
 		    "[CONNECTOR:%d:%s][ENCODER:%d:%s][%s] Link Training %s at link rate = %d, lane count = %d\n",
 		    connector->base.base.id, connector->base.name,
 		    encoder->base.base.id, encoder->base.name,
-		    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)),
+		    drm_dp_phy_name(dp_phy),
 		    ret ? "passed" : "failed",
 		    crtc_state->port_clock, crtc_state->lane_count);
 
-- 
2.34.1

