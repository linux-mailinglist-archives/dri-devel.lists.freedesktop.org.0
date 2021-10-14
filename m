Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1DE42DCE6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660BA6EB58;
	Thu, 14 Oct 2021 15:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68D36EB3C;
 Thu, 14 Oct 2021 15:01:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227650978"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="227650978"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 08:01:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="492032991"
Received: from rwambsga-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.251.210.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 08:01:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 3/3] drm/i915/dp: use new link training delay helpers
Date: Thu, 14 Oct 2021 18:00:59 +0300
Message-Id: <20211014150059.28957-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014150059.28957-1-jani.nikula@intel.com>
References: <20211014150059.28957-1-jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new link training delay helpers, fixing the delays for
128b/132b.

For existing 8b/10b functionality, this will cause additional 1-byte
DPCD reads for LTTPR delays instead of using the cached values. It's
just too complicated to combine generic helpers with local caching in a
sensible way.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 38 +++++++------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 85676c953e0a..a72f2dc93718 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -683,15 +683,6 @@ intel_dp_prepare_link_train(struct intel_dp *intel_dp,
 	return true;
 }
 
-static void intel_dp_link_training_clock_recovery_delay(struct intel_dp *intel_dp,
-							enum drm_dp_phy dp_phy)
-{
-	if (dp_phy == DP_PHY_DPRX)
-		drm_dp_link_train_clock_recovery_delay(&intel_dp->aux, intel_dp->dpcd);
-	else
-		drm_dp_lttpr_link_train_clock_recovery_delay();
-}
-
 static bool intel_dp_adjust_request_changed(const struct intel_crtc_state *crtc_state,
 					    const u8 old_link_status[DP_LINK_STATUS_SIZE],
 					    const u8 new_link_status[DP_LINK_STATUS_SIZE])
@@ -750,6 +741,11 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	bool max_vswing_reached = false;
 	char phy_name[10];
+	int delay_us;
+
+	delay_us = drm_dp_read_clock_recovery_delay(&intel_dp->aux,
+						    intel_dp->dpcd, dp_phy,
+						    intel_dp_is_uhbr(crtc_state));
 
 	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
 
@@ -777,7 +773,7 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 
 	voltage_tries = 1;
 	for (cr_tries = 0; cr_tries < max_cr_tries; ++cr_tries) {
-		intel_dp_link_training_clock_recovery_delay(intel_dp, dp_phy);
+		usleep_range(delay_us, 2 * delay_us);
 
 		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, dp_phy,
 						     link_status) < 0) {
@@ -895,19 +891,6 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
 	return DP_TRAINING_PATTERN_2;
 }
 
-static void
-intel_dp_link_training_channel_equalization_delay(struct intel_dp *intel_dp,
-						  enum drm_dp_phy dp_phy)
-{
-	if (dp_phy == DP_PHY_DPRX) {
-		drm_dp_link_train_channel_eq_delay(&intel_dp->aux, intel_dp->dpcd);
-	} else {
-		const u8 *phy_caps = intel_dp_lttpr_phy_caps(intel_dp, dp_phy);
-
-		drm_dp_lttpr_link_train_channel_eq_delay(&intel_dp->aux, phy_caps);
-	}
-}
-
 /*
  * Perform the link training channel equalization phase on the given DP PHY
  * using one of training pattern 2, 3 or 4 depending on the source and
@@ -925,6 +908,11 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	bool channel_eq = false;
 	char phy_name[10];
+	int delay_us;
+
+	delay_us = drm_dp_read_channel_eq_delay(&intel_dp->aux,
+						intel_dp->dpcd, dp_phy,
+						intel_dp_is_uhbr(crtc_state));
 
 	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
 
@@ -944,8 +932,8 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 	}
 
 	for (tries = 0; tries < 5; tries++) {
-		intel_dp_link_training_channel_equalization_delay(intel_dp,
-								  dp_phy);
+		usleep_range(delay_us, 2 * delay_us);
+
 		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, dp_phy,
 						     link_status) < 0) {
 			drm_err(&i915->drm,
-- 
2.30.2

