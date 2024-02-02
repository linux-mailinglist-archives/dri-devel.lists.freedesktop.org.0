Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0199084719B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 15:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C265510E7BD;
	Fri,  2 Feb 2024 14:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcJGTMuE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137A210E7BD
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706882757; x=1738418757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k48VdJ+0gi1xdaapRMNts+4beB4WGygr5VeuYu8ozUg=;
 b=LcJGTMuE1vTnw7hQbI0yuAUaq13tw++ZTlaafm+M63xzAQ6+xiy9kBKe
 UYTR4VKHqZgBLHBz1RkKYxhHifj74bqpPmEGkzQvtd09w5l0N2lOdTgQf
 9ZiL+PKgswQ+7To3r1an+EkarfAjqkqSeMY7AKWa8hgBmNjLwNEuZxHUw
 qC/6xEXhUCsYbY7dpMB3RaTmT85aVul6p6qXyaGvziiY4VJidkypYLfl6
 /v6fQ3BwU/mgDCV4TDp6Uu0HiyYEnN8bfINMZ/V+bwWmuksXydGXmtX+C
 B7avMrUWxSdakmv9VeZqAcokqe3HpZ2/CdeqOEQ71ah/JQo88wEO+2Gtv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="81173"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="81173"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:05:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="80976"
Received: from mmermeza-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.59.198])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:05:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [RFC 3/4] drm/i915/mst: improve debug logging of DP MST mode detect
Date: Fri,  2 Feb 2024 16:05:33 +0200
Message-Id: <5285d255ef60c53a308140feb4bc5d931d829d5d.1706882591.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706882590.git.jani.nikula@intel.com>
References: <cover.1706882590.git.jani.nikula@intel.com>
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

Debug log the sink's MST capability, including single-stream sideband
messaging support, and the decision whether to enable MST mode or not.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e0b8ee6bde79..4dd9c50226d1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4008,18 +4008,27 @@ static bool intel_dp_mst_detect(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
+	enum drm_dp_mst_mode sink_mst_mode;
+	const char *mst_mode_str;
+
+	sink_mst_mode = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
+
+	if (sink_mst_mode == DP_MST_SIDEBAND_MSG)
+		mst_mode_str = "single-stream sideband messaging";
+	else
+		mst_mode_str = str_yes_no(sink_mst_mode == DP_MST_CAPABLE);
 
 	intel_dp->is_mst = i915->display.params.enable_dp_mst &&
 		intel_dp_mst_source_support(intel_dp) &&
-		sink_can_mst;
+		sink_mst_mode == DP_MST_CAPABLE;
 
 	drm_dbg_kms(&i915->drm,
-		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
+		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
 		    encoder->base.base.id, encoder->base.name,
 		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
-		    str_yes_no(sink_can_mst),
-		    str_yes_no(i915->display.params.enable_dp_mst));
+		    mst_mode_str,
+		    str_yes_no(i915->display.params.enable_dp_mst),
+		    str_yes_no(intel_dp->is_mst));
 
 	return intel_dp->is_mst;
 }
-- 
2.39.2

