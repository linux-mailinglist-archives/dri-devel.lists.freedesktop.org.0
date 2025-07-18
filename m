Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931EFB0A3C9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF71410E997;
	Fri, 18 Jul 2025 12:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLspaNs9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABF110E994;
 Fri, 18 Jul 2025 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752840128; x=1784376128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sCC3Nk+RQK7MtU+n4PiMaCXaAi/bWradDAy6oKCFzT0=;
 b=BLspaNs91ViknZwLqUULxVHV/QfBovEQvn/1oTBqeVOMMQ+YuEKyvWy+
 QFnen9fgFENP9zhWHnE/7Z64bG3UjosVTsNbpdhenKNYPQIdrwdhwlUoi
 FtMz25Fl6EVYKV7LIxGr+VLiB58J6+26+0C7H3bKYbnRuCcKh9BqLHZPl
 NlWPmN86J1K882ztDoQO/3PgD8E0DT/pJeYnPWtS8DY1XrGM8GlQ0zwnH
 r+QxkHGT5+H7BmWQSxhcpJaQTOGcfgem3+Cw8Z2+gkYvfzH7yAUixpEim
 d28lqsI01PI27wa3Gq9WHKEJ+cIIYWWVE4GhNDliExwlvIIkIt2u9OlrR w==;
X-CSE-ConnectionGUID: TgCXhf8wQf6WeWmrJbInpA==
X-CSE-MsgGUID: MV+N4TZ5R26ZvXxEPuisFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54345519"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54345519"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 05:02:08 -0700
X-CSE-ConnectionGUID: oi5ECObgR36Y9qPv8EZvpw==
X-CSE-MsgGUID: +KAmjANKR26Ya0T3O7/2Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="163674685"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.63])
 by orviesa005.jf.intel.com with SMTP; 18 Jul 2025 05:02:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Jul 2025 15:02:05 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2 3/4] drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
Date: Fri, 18 Jul 2025 15:01:53 +0300
Message-ID: <20250718120154.15492-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250718120154.15492-1-ville.syrjala@linux.intel.com>
References: <20250718120154.15492-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Implement the POST_LT_ADJ_REQ sequence, which should be used
to further fine tune the link if TPS4 is not supported.
The POST_LT_ADJ_REQ sequence will be performed after
the normal link training has succeeded.

Only the final hop between the last LTTPR and DPRX will
perform the POST_LT_ADJ_REQ adjustment. The earlier hops
will use TPS4 instead since it's mandatory for LTTPRs.

start The sequence will terminate when the sink clears the
"in progress" flag, the vswing/pre-emphasis values have
changed six times, or the vswing/pre-emphasis values have
remained unchanged for 200 ms.

Tested-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 124 +++++++++++++++++-
 .../drm/i915/display/intel_dp_link_training.h |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   2 +-
 3 files changed, 124 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 344b74109a83..1a9e28f1ca76 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -740,11 +740,14 @@ static void intel_dp_update_downspread_ctrl(struct intel_dp *intel_dp,
 
 void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
 				   int link_bw, int rate_select, int lane_count,
-				   bool enhanced_framing)
+				   bool enhanced_framing, bool post_lt_adj_req)
 {
 	if (enhanced_framing)
 		lane_count |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 
+	if (post_lt_adj_req)
+		lane_count |= DP_POST_LT_ADJ_REQ_GRANTED;
+
 	if (link_bw) {
 		/* DP and eDP v1.3 and earlier link bw set method. */
 		u8 link_config[] = { link_bw, lane_count };
@@ -823,12 +826,21 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
 	return DP_TRAINING_PATTERN_2;
 }
 
+static bool intel_dp_use_post_lt_adj_req(struct intel_dp *intel_dp,
+					 const struct intel_crtc_state *crtc_state)
+{
+	return intel_dp->set_idle_link_train &&
+		drm_dp_post_lt_adj_req_supported(intel_dp->dpcd) &&
+		intel_dp_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX) != DP_TRAINING_PATTERN_4;
+}
+
 static void intel_dp_update_link_bw_set(struct intel_dp *intel_dp,
 					const struct intel_crtc_state *crtc_state,
 					u8 link_bw, u8 rate_select)
 {
 	intel_dp_link_training_set_bw(intel_dp, link_bw, rate_select, crtc_state->lane_count,
-				      crtc_state->enhanced_framing);
+				      crtc_state->enhanced_framing,
+				      intel_dp_use_post_lt_adj_req(intel_dp, crtc_state));
 }
 
 /*
@@ -1089,6 +1101,109 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 	return channel_eq;
 }
 
+static bool
+intel_dp_post_lt_adj_req(struct intel_dp *intel_dp,
+			 const struct intel_crtc_state *crtc_state)
+{
+	u8 link_status[DP_LINK_STATUS_SIZE];
+	unsigned long deadline;
+	bool timeout = false;
+	bool success = false;
+	int changes = 0;
+
+	if (!intel_dp_use_post_lt_adj_req(intel_dp, crtc_state))
+		return true;
+
+	if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, DP_PHY_DPRX,
+					     link_status) < 0) {
+		lt_err(intel_dp, DP_PHY_DPRX, "Failed to get link status\n");
+		return false;
+	}
+
+	deadline = jiffies + msecs_to_jiffies_timeout(200);
+
+	for (;;) {
+		/* Make sure clock is still ok */
+		if (!drm_dp_clock_recovery_ok(link_status,
+					      crtc_state->lane_count)) {
+			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
+			lt_dbg(intel_dp, DP_PHY_DPRX,
+			       "Clock recovery check failed, cannot continue POST_LT_ADJ_REQ\n");
+			break;
+		}
+
+		if (!drm_dp_channel_eq_ok(link_status,
+					  crtc_state->lane_count)) {
+			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
+			lt_dbg(intel_dp, DP_PHY_DPRX, "Channel EQ check failed. cannot continue POST_LT_ADJ_REQ\n");
+			break;
+		}
+
+		if (!drm_dp_post_lt_adj_req_in_progress(link_status)) {
+			success = true;
+			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
+			lt_dbg(intel_dp, DP_PHY_DPRX,
+			       "POST_LT_ADJ_REQ done (%d changes). DP Training successful\n", changes);
+			break;
+		}
+
+		if (changes == 6) {
+			success = true;
+			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
+			lt_dbg(intel_dp, DP_PHY_DPRX,
+			       "POST_LT_ADJ_REQ limit reached (%d changes). DP Training successful\n", changes);
+			break;
+		}
+
+		if (timeout) {
+			success = true;
+			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
+			lt_dbg(intel_dp, DP_PHY_DPRX,
+			       "POST_LT_ADJ_REQ timeout reached (%d changes). DP Training successful\n", changes);
+			break;
+		}
+
+		fsleep(5000);
+
+		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, DP_PHY_DPRX,
+						     link_status) < 0) {
+			lt_err(intel_dp, DP_PHY_DPRX, "Failed to get link status\n");
+			break;
+		}
+
+		/* Update training set as requested by target */
+		if (intel_dp_get_adjust_train(intel_dp, crtc_state, DP_PHY_DPRX, link_status)) {
+			deadline = jiffies + msecs_to_jiffies_timeout(200);
+			changes++;
+
+			if (!intel_dp_update_link_train(intel_dp, crtc_state, DP_PHY_DPRX)) {
+				lt_err(intel_dp, DP_PHY_DPRX, "Failed to update link training\n");
+				break;
+			}
+		} else if (time_after(jiffies, deadline)) {
+			timeout = true;
+		}
+	}
+
+	return success;
+}
+
+static void intel_dp_stop_post_lt_adj_req(struct intel_dp *intel_dp,
+					  const struct intel_crtc_state *crtc_state)
+{
+	u8 lane_count;
+
+	if (!intel_dp_use_post_lt_adj_req(intel_dp, crtc_state))
+		return;
+
+	/* clear DP_POST_LT_ADJ_REQ_GRANTED */
+	lane_count = crtc_state->lane_count;
+	if (crtc_state->enhanced_framing)
+		lane_count |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
+
+	drm_dp_dpcd_writeb(&intel_dp->aux, DP_LANE_COUNT_SET, lane_count);
+}
+
 static bool intel_dp_disable_dpcd_training_pattern(struct intel_dp *intel_dp,
 						   enum drm_dp_phy dp_phy)
 {
@@ -1381,6 +1496,11 @@ intel_dp_link_train_all_phys(struct intel_dp *intel_dp,
 	intel_dp_disable_dpcd_training_pattern(intel_dp, DP_PHY_DPRX);
 	intel_dp->set_idle_link_train(intel_dp, crtc_state);
 
+	if (ret)
+		ret = intel_dp_post_lt_adj_req(intel_dp, crtc_state);
+
+	intel_dp_stop_post_lt_adj_req(intel_dp, crtc_state);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
index 1ba22ed6db08..33dcbde6a408 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
@@ -21,7 +21,7 @@ void intel_dp_link_training_set_mode(struct intel_dp *intel_dp,
 				     int link_rate, bool is_vrr);
 void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
 				   int link_bw, int rate_select, int lane_count,
-				   bool enhanced_framing);
+				   bool enhanced_framing, bool post_lt_adj_req);
 
 bool intel_dp_get_adjust_train(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 74497c9a0554..fc3ecb3e8dae 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -2091,7 +2091,7 @@ void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp)
 
 	intel_dp_link_training_set_mode(intel_dp, link_rate, false);
 	intel_dp_link_training_set_bw(intel_dp, link_bw, rate_select, lane_count,
-				      drm_dp_enhanced_frame_cap(intel_dp->dpcd));
+				      drm_dp_enhanced_frame_cap(intel_dp->dpcd), false);
 
 	intel_mst_set_probed_link_params(intel_dp, link_rate, lane_count);
 }
-- 
2.49.0

