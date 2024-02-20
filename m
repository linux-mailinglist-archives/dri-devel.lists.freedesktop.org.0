Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F4585C811
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3644710E568;
	Tue, 20 Feb 2024 21:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ez0fjHhL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3724589E59;
 Tue, 20 Feb 2024 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463915; x=1739999915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8S32TuC+EqCJuEiL4XDRHj5bj0T2Qs7L7nF8LW5qB8=;
 b=Ez0fjHhLzSXlk0pavRcQ8MGkDIhZ4WDyjhCg/K7nFiC9GylDKF724CbF
 c+wJnI3lzgHOP97LBLmNtv4Lh+avtoS2Hdj8v4FoR8jIip5aD/P+vV8Z+
 uYnX2TVagzSA3AUUzFJ5FcCCIDxjMXjRtvp3H3ERkwLsz1dvnukD+wseF
 YSeoH0Tfb6nBxpn1ckPEmDg1XEsJ10C5zy6aVOkGBPNR/u4v9Jhw8wQ2h
 retGr1bf25WvB4llx1eHZLlmlPNKpyP3X/QnIP5+z3jSle3QyJw8zUbK+
 uMSOiUy8fA8mOlKTnE9gpIHvWrw/7gp8ATycImhmIo0BxlJnpDGgAHXYT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738661"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738661"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061604"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:33 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 09/21] drm/i915/dp: Factor out intel_dp_read_dprx_caps()
Date: Tue, 20 Feb 2024 23:18:29 +0200
Message-Id: <20240220211841.448846-10-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
MIME-Version: 1.0
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

Factor out a function to read the sink's DPRX capabilities used by a
follow-up patch enabling the DP tunnel BW allocation mode.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 30 +++++++++++++++----
 .../drm/i915/display/intel_dp_link_training.h |  1 +
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 7b140cbf8dd31..fb84ca98bb7ab 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -162,6 +162,28 @@ static int intel_dp_init_lttpr(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEI
 	return lttpr_count;
 }
 
+int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	if (intel_dp_is_edp(intel_dp))
+		return 0;
+
+	/*
+	 * Detecting LTTPRs must be avoided on platforms with an AUX timeout
+	 * period < 3.2ms. (see DP Standard v2.0, 2.11.2, 3.6.6.1).
+	 */
+	if (DISPLAY_VER(i915) >= 10 && !IS_GEMINILAKE(i915))
+		if (drm_dp_dpcd_probe(&intel_dp->aux,
+				      DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV))
+			return -EIO;
+
+	if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
+		return -EIO;
+
+	return 0;
+}
+
 /**
  * intel_dp_init_lttpr_and_dprx_caps - detect LTTPR and DPRX caps, init the LTTPR link training mode
  * @intel_dp: Intel DP struct
@@ -192,12 +214,10 @@ int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp)
 	if (!intel_dp_is_edp(intel_dp) &&
 	    (DISPLAY_VER(i915) >= 10 && !IS_GEMINILAKE(i915))) {
 		u8 dpcd[DP_RECEIVER_CAP_SIZE];
+		int err = intel_dp_read_dprx_caps(intel_dp, dpcd);
 
-		if (drm_dp_dpcd_probe(&intel_dp->aux, DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV))
-			return -EIO;
-
-		if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
-			return -EIO;
+		if (err != 0)
+			return err;
 
 		lttpr_count = intel_dp_init_lttpr(intel_dp, dpcd);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
index 2c8f2775891b0..19836a8a4f904 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
@@ -11,6 +11,7 @@
 struct intel_crtc_state;
 struct intel_dp;
 
+int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp);
 
 void intel_dp_get_adjust_train(struct intel_dp *intel_dp,
-- 
2.39.2

