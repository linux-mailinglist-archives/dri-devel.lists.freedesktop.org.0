Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5300F87FA7D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935E110F8C6;
	Tue, 19 Mar 2024 09:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+eZ6mEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CF510E9A3;
 Tue, 19 Mar 2024 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839600; x=1742375600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QW2G6vt92kulcuug5EW/kWZXYcw6c1uzVk7Zu4n7uEE=;
 b=a+eZ6mEOPILt9SPvLAh3pPUhJlRyRuSBfoznKSQZrtPtYCcvrZTtLPhl
 W5AL5ARgBvN6EW1ceoYMg3JJhRA0Ajc3QZVU7eLjuHaX/3woILAvK6a29
 Anzy1+xmLCQe95LfrcWr2MMj8hkY/IrTK63B1xbhpbgFuZidk06uFoSfZ
 3fP59VwJMdQjt+jSCaW7JGVirFvoWK4KvJmr/9QpOP2CD+GLO8TKAEaxn
 cx+CzznvVwEPhOmtw5/lH9fGXRG0v1B/FxVynRQ8QJebhvAvU2pvGjNuJ
 T2qhhLrh6f1+c2Zhm+mFyLwS5ypC4jg8x3KVcROeSMZqfv/MGubtbw7db Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16238044"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="16238044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="13780680"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND v3 3/6] drm/i915/mst: abstract choosing the MST mode to use
Date: Tue, 19 Mar 2024 11:12:50 +0200
Message-Id: <f626144f10b03d4609ff38a29bac013ecf3aca4e.1710839496.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710839496.git.jani.nikula@intel.com>
References: <cover.1710839496.git.jani.nikula@intel.com>
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

Clarify the conditions for choosing the MST mode to use by adding a new
function intel_dp_mst_mode_choose(). This also prepares for being able
to extend the MST modes to single-stream sideband messaging.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9590c8c2c4f3..127b5a89502d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4049,6 +4049,24 @@ static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
 		return "SST";
 }
 
+static enum drm_dp_mst_mode
+intel_dp_mst_mode_choose(struct intel_dp *intel_dp,
+			 enum drm_dp_mst_mode sink_mst_mode)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	if (!i915->display.params.enable_dp_mst)
+		return DRM_DP_SST;
+
+	if (!intel_dp_mst_source_support(intel_dp))
+		return DRM_DP_SST;
+
+	if (sink_mst_mode == DRM_DP_SST_SIDEBAND_MSG)
+		return DRM_DP_SST;
+
+	return sink_mst_mode;
+}
+
 static enum drm_dp_mst_mode
 intel_dp_mst_detect(struct intel_dp *intel_dp)
 {
@@ -4059,12 +4077,7 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
 
 	sink_mst_mode = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
 
-	if (i915->display.params.enable_dp_mst &&
-	    intel_dp_mst_source_support(intel_dp) &&
-	    sink_mst_mode == DRM_DP_MST)
-		mst_detect = DRM_DP_MST;
-	else
-		mst_detect = DRM_DP_SST;
+	mst_detect = intel_dp_mst_mode_choose(intel_dp, sink_mst_mode);
 
 	drm_dbg_kms(&i915->drm,
 		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
-- 
2.39.2

