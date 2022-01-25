Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A549B9A9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 18:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109CD10E331;
	Tue, 25 Jan 2022 17:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006D410E2CE;
 Tue, 25 Jan 2022 17:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643130467; x=1674666467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6M0cWK8lXCk2PyGoH3F7+612m1IXuHYZkAir0Aj4avM=;
 b=nXBrM7V/flJQj9469Po8f197MJVkq9VWPdbfU3gVNqKbXMyM7ysSfgvs
 M9TDjhAVRy7LxXicPki/9hd6ZdmLiJ5YCZO2zMnlsQlD4Jsf8oYUxL3sS
 HzSutZ1OAiBL0EIPOyloBYugMhfMPHcrG2pD+FzTGUokZNXumjKd6xvFU
 C+kP5/0SGhEcaxmhky3n2UVy7wO6d+h6tbj+xiAgD3SGsCJw9ZTWy9rEe
 WsVh0mTmYwxjrfDDAb3YOSH9axC/HAxfl0FilFmhi3Q8gz6aS6G0qOIQn
 SLCVT49/u4UTpl57+153H8X8LA5DduUQq9R535n+felB1atKqJpV1Ye2L Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="227025745"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="227025745"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 09:04:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="627998747"
Received: from skirillo-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.32.77])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 09:04:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/8] drm/i915/dp: add 128b/132b support to link status checks
Date: Tue, 25 Jan 2022 19:03:44 +0200
Message-Id: <adf22e5c64d4fd45a48086ec140663a83b30444d.1643130139.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643130139.git.jani.nikula@intel.com>
References: <cover.1643130139.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abstract link status check to a function that takes 128b/132b and 8b/10b
into account, and use it. Also dump link status on failures.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 39 ++++++++++++++-----
 .../drm/i915/display/intel_dp_link_training.c |  2 +-
 .../drm/i915/display/intel_dp_link_training.h |  4 ++
 3 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4d4579a301f6..80fedd0e6212 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3628,6 +3628,32 @@ static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
 			    "Could not write test response to sink\n");
 }
 
+static bool intel_dp_link_ok(struct intel_dp *intel_dp,
+			     u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
+	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	bool uhbr = intel_dp->link_rate >= 1000000;
+	bool ok;
+
+	if (uhbr)
+		ok = drm_dp_128b132b_lane_channel_eq_done(link_status,
+							  intel_dp->lane_count);
+	else
+		ok = drm_dp_channel_eq_ok(link_status, intel_dp->lane_count);
+
+	if (ok)
+		return true;
+
+	intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
+	drm_dbg_kms(&i915->drm,
+		    "[ENCODER:%d:%s] %s link not ok, retraining\n",
+		    encoder->base.base.id, encoder->base.name,
+		    uhbr ? "128b/132b" : "8b/10b");
+
+	return false;
+}
+
 static void
 intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
 {
@@ -3658,14 +3684,7 @@ static bool intel_dp_mst_link_status(struct intel_dp *intel_dp)
 		return false;
 	}
 
-	if (!drm_dp_channel_eq_ok(link_status, intel_dp->lane_count)) {
-		drm_dbg_kms(&i915->drm,
-			    "[ENCODER:%d:%s] channel EQ not ok, retraining\n",
-			    encoder->base.base.id, encoder->base.name);
-		return false;
-	}
-
-	return true;
+	return intel_dp_link_ok(intel_dp, link_status);
 }
 
 /**
@@ -3779,8 +3798,8 @@ intel_dp_needs_link_retrain(struct intel_dp *intel_dp)
 					intel_dp->lane_count))
 		return false;
 
-	/* Retrain if Channel EQ or CR not ok */
-	return !drm_dp_channel_eq_ok(link_status, intel_dp->lane_count);
+	/* Retrain if link not ok */
+	return !intel_dp_link_ok(intel_dp, link_status);
 }
 
 static bool intel_dp_has_connector(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 8bb6a296f421..1e41a560204a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -712,7 +712,7 @@ static bool intel_dp_adjust_request_changed(const struct intel_crtc_state *crtc_
 	return false;
 }
 
-static void
+void
 intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy dp_phy,
 			  const u8 link_status[DP_LINK_STATUS_SIZE])
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
index dbfb15705aaa..dc1556b46b85 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
@@ -29,6 +29,10 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
 void intel_dp_stop_link_train(struct intel_dp *intel_dp,
 			      const struct intel_crtc_state *crtc_state);
 
+void
+intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy dp_phy,
+			  const u8 link_status[DP_LINK_STATUS_SIZE]);
+
 /* Get the TPSx symbol type of the value programmed to DP_TRAINING_PATTERN_SET */
 static inline u8 intel_dp_training_pattern_symbol(u8 pattern)
 {
-- 
2.30.2

