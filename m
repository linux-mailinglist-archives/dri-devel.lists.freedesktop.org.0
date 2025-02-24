Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF05DA4299E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35ED10E494;
	Mon, 24 Feb 2025 17:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bz4YRS+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA0910E4A4;
 Mon, 24 Feb 2025 17:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418031; x=1771954031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IzCopLV9Q+AMdzq8n4dN9//3yqdNrmf+RrF/jnmgHSU=;
 b=Bz4YRS+YGBMwq/FqV79XjywYxlMuM01ZyKUkeNQTL9BjooS+kA/oS05S
 2qcdHwg+tdgmYYS60nidjl5Z0tuDoQiapmvIRMVK+9eb8LVrEAnRstJ8B
 /o9/DFqCunx2NWtIWfeLP4t9+58VU7bX0HuCcsMVC7dTcNcqxTs9YbRC3
 y0exIVdq4bBJ9vzICBuTa03v/7I/XlVcyYsX7Qq7KpeiYOd2bFQSJ1dMT
 Bick5rp87GGsYPRFWTn7TxGLoG21mAqvMjXwPavEKyOMsZUPrfhH/hONr
 d9ftgRGIB+OYCMl93ODgd78DtBwD6WmFVbsDwWk6dKjwTQlE3ABFGZJtk A==;
X-CSE-ConnectionGUID: 8+HSVXvGRSmzM38SreYz+A==
X-CSE-MsgGUID: 0kZJVaonQo2icLcJhENyWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601758"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601758"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:27:11 -0800
X-CSE-ConnectionGUID: zD1Vmf1rSoKHbXEjeDi5EQ==
X-CSE-MsgGUID: 6jcqOWyMSx24B7VisHzwYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374183"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:27:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:27:06 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/i915/dp: Move intel_dp_training_pattern()
Date: Mon, 24 Feb 2025 19:26:42 +0200
Message-ID: <20250224172645.15763-7-ville.syrjala@linux.intel.com>
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

Move intel_dp_training_pattern() upwards to avoid the forward
declaration for the POST_LT_ADJ_REQ stuff.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 112 +++++++++---------
 1 file changed, 54 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 8863fc2c44ff..f208b947ef92 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -767,9 +767,62 @@ void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
 	}
 }
 
+/*
+ * Pick Training Pattern Sequence (TPS) for channel equalization. 128b/132b TPS2
+ * for UHBR+, TPS4 for HBR3 or for 1.4 devices that support it, TPS3 for HBR2 or
+ * 1.2 devices that support it, TPS2 otherwise.
+ */
 static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
 				     const struct intel_crtc_state *crtc_state,
-				     enum drm_dp_phy dp_phy);
+				     enum drm_dp_phy dp_phy)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	bool source_tps3, sink_tps3, source_tps4, sink_tps4;
+
+	/* UHBR+ use separate 128b/132b TPS2 */
+	if (intel_dp_is_uhbr(crtc_state))
+		return DP_TRAINING_PATTERN_2;
+
+	/*
+	 * TPS4 support is mandatory for all downstream devices that
+	 * support HBR3. There are no known eDP panels that support
+	 * TPS4 as of Feb 2018 as per VESA eDP_v1.4b_E1 specification.
+	 * LTTPRs must support TPS4.
+	 */
+	source_tps4 = intel_dp_source_supports_tps4(display);
+	sink_tps4 = dp_phy != DP_PHY_DPRX ||
+		    drm_dp_tps4_supported(intel_dp->dpcd);
+	if (source_tps4 && sink_tps4) {
+		return DP_TRAINING_PATTERN_4;
+	} else if (crtc_state->port_clock == 810000) {
+		if (!source_tps4)
+			lt_dbg(intel_dp, dp_phy,
+			       "8.1 Gbps link rate without source TPS4 support\n");
+		if (!sink_tps4)
+			lt_dbg(intel_dp, dp_phy,
+			       "8.1 Gbps link rate without sink TPS4 support\n");
+	}
+
+	/*
+	 * TPS3 support is mandatory for downstream devices that
+	 * support HBR2. However, not all sinks follow the spec.
+	 */
+	source_tps3 = intel_dp_source_supports_tps3(display);
+	sink_tps3 = dp_phy != DP_PHY_DPRX ||
+		    drm_dp_tps3_supported(intel_dp->dpcd);
+	if (source_tps3 && sink_tps3) {
+		return  DP_TRAINING_PATTERN_3;
+	} else if (crtc_state->port_clock >= 540000) {
+		if (!source_tps3)
+			lt_dbg(intel_dp, dp_phy,
+			       ">=5.4/6.48 Gbps link rate without source TPS3 support\n");
+		if (!sink_tps3)
+			lt_dbg(intel_dp, dp_phy,
+			       ">=5.4/6.48 Gbps link rate without sink TPS3 support\n");
+	}
+
+	return DP_TRAINING_PATTERN_2;
+}
 
 static bool intel_dp_use_post_lt_adj_req(struct intel_dp *intel_dp,
 					 const struct intel_crtc_state *crtc_state)
@@ -971,63 +1024,6 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 	return false;
 }
 
-/*
- * Pick Training Pattern Sequence (TPS) for channel equalization. 128b/132b TPS2
- * for UHBR+, TPS4 for HBR3 or for 1.4 devices that support it, TPS3 for HBR2 or
- * 1.2 devices that support it, TPS2 otherwise.
- */
-static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
-				     const struct intel_crtc_state *crtc_state,
-				     enum drm_dp_phy dp_phy)
-{
-	struct intel_display *display = to_intel_display(intel_dp);
-	bool source_tps3, sink_tps3, source_tps4, sink_tps4;
-
-	/* UHBR+ use separate 128b/132b TPS2 */
-	if (intel_dp_is_uhbr(crtc_state))
-		return DP_TRAINING_PATTERN_2;
-
-	/*
-	 * TPS4 support is mandatory for all downstream devices that
-	 * support HBR3. There are no known eDP panels that support
-	 * TPS4 as of Feb 2018 as per VESA eDP_v1.4b_E1 specification.
-	 * LTTPRs must support TPS4.
-	 */
-	source_tps4 = intel_dp_source_supports_tps4(display);
-	sink_tps4 = dp_phy != DP_PHY_DPRX ||
-		    drm_dp_tps4_supported(intel_dp->dpcd);
-	if (source_tps4 && sink_tps4) {
-		return DP_TRAINING_PATTERN_4;
-	} else if (crtc_state->port_clock == 810000) {
-		if (!source_tps4)
-			lt_dbg(intel_dp, dp_phy,
-			       "8.1 Gbps link rate without source TPS4 support\n");
-		if (!sink_tps4)
-			lt_dbg(intel_dp, dp_phy,
-			       "8.1 Gbps link rate without sink TPS4 support\n");
-	}
-
-	/*
-	 * TPS3 support is mandatory for downstream devices that
-	 * support HBR2. However, not all sinks follow the spec.
-	 */
-	source_tps3 = intel_dp_source_supports_tps3(display);
-	sink_tps3 = dp_phy != DP_PHY_DPRX ||
-		    drm_dp_tps3_supported(intel_dp->dpcd);
-	if (source_tps3 && sink_tps3) {
-		return  DP_TRAINING_PATTERN_3;
-	} else if (crtc_state->port_clock >= 540000) {
-		if (!source_tps3)
-			lt_dbg(intel_dp, dp_phy,
-			       ">=5.4/6.48 Gbps link rate without source TPS3 support\n");
-		if (!sink_tps3)
-			lt_dbg(intel_dp, dp_phy,
-			       ">=5.4/6.48 Gbps link rate without sink TPS3 support\n");
-	}
-
-	return DP_TRAINING_PATTERN_2;
-}
-
 /*
  * Perform the link training channel equalization phase on the given DP PHY
  * using one of training pattern 2, 3 or 4 depending on the source and
-- 
2.45.3

