Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82300A4299C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD05C10E499;
	Mon, 24 Feb 2025 17:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yn3S5gs+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7053410E494;
 Mon, 24 Feb 2025 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418029; x=1771954029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=loxp2Er5eT4/kkofmVW4jD3rYKVKi+wk/9DgzHKEzt0=;
 b=Yn3S5gs+91cxXzRj4HBVYDFX+W6HdsRQ/SFHuScUeYNzaj79lJhZ6oIo
 jRMfz2T/VZ+znM36ljLh2xunQLs53gLZQpbOJRqfLeT07iVx0jg415QlP
 VFriTL3elr7zMrOv4Y7UHXgGYOIFUGwu1kaC3UPb+NYlPPlWhzexCgvWi
 w76mH6ZqKD7SGb4nSCdXPAlqjOr80HUswu1C2pDPddCx7Q1t0FfP0bacz
 LldJPq/2Key/yI8HWBEFWL+bHE5S9RUyZ414UB7ytDBH3d0RSEA+QbFWy
 qhyR8ZNYZEr/L5Tgc/z2YWl5YTzn0syoCoFDAvdfwe9ZXTeMUQ9I+kgk5 A==;
X-CSE-ConnectionGUID: BWDxbjcWTCyLub1K/Esq8w==
X-CSE-MsgGUID: bayblnV5RhCWdGPtdBqmeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601751"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601751"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:27:09 -0800
X-CSE-ConnectionGUID: HQ937itzRbm1NDiNQVXQGQ==
X-CSE-MsgGUID: IXb8SFcKRWabLnG7Gd4i3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374149"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:27:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:27:03 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
Date: Mon, 24 Feb 2025 19:26:41 +0200
Message-ID: <20250224172645.15763-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 128 +++++++++++++++++-
 .../drm/i915/display/intel_dp_link_training.h |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   2 +-
 3 files changed, 128 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 2506996bf16d..8863fc2c44ff 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -738,11 +738,14 @@ static void intel_dp_update_downspread_ctrl(struct intel_dp *intel_dp,
 
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
@@ -764,12 +767,25 @@ void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
 	}
 }
 
+static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
+				     const struct intel_crtc_state *crtc_state,
+				     enum drm_dp_phy dp_phy);
+
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
@@ -1087,6 +1103,109 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
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
@@ -1372,6 +1491,11 @@ intel_dp_link_train_all_phys(struct intel_dp *intel_dp,
 		intel_dp->set_idle_link_train(intel_dp, crtc_state);
 	}
 
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
index 167e4a70ab12..d937143ed10f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -2109,7 +2109,7 @@ void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp)
 
 	intel_dp_link_training_set_mode(intel_dp, link_rate, false);
 	intel_dp_link_training_set_bw(intel_dp, link_bw, rate_select, lane_count,
-				      drm_dp_enhanced_frame_cap(intel_dp->dpcd));
+				      drm_dp_enhanced_frame_cap(intel_dp->dpcd), false);
 
 	intel_mst_set_probed_link_params(intel_dp, link_rate, lane_count);
 }
-- 
2.45.3

