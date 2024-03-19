Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE887FA7C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C3B10E9A3;
	Tue, 19 Mar 2024 09:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkzchPRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACEA10F8C6;
 Tue, 19 Mar 2024 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839599; x=1742375599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cxb7URZcUmWNUpUlKVp4un/BRUoCxuTUAYBUhxCcaOA=;
 b=KkzchPRXG0wdhOD7VRXmrMnZgZxQ+l+3K6jIeGG4dMSOqLjKURBfNuQz
 auJv/0rjeAn1ktUCJvxuGitKBRmN3F9czqPTnPdlpSCgb6DGCEfrKIgzs
 dixguIzELoH4gMawmRBOqhUkYqk/LNtT9GFA9z4C9oRZtSY2xeou2Bk4Y
 crGK9sfhMUJGhbeON7NPHq1/viGm6qb/hm9kZMSyRkFOlB0WhnIkWKmZ9
 J59j5oKjcYO6kud8uOl0LB04epLcNgo7iD3cvF1eeGcACK0meejrZ2Kbd
 jV2omNksS0AljHB0lEFYWfpNPl8p0iVI8F4/yiHYnSOTZrb6n33DqCDOl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16238036"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="16238036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="13780661"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND v3 2/6] drm/i915/mst: improve debug logging of DP MST mode
 detect
Date: Tue, 19 Mar 2024 11:12:49 +0200
Message-Id: <db08536daec0a6062539319d71c10ee1277e3876.1710839496.git.jani.nikula@intel.com>
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

Rename intel_dp_can_mst() to intel_dp_mst_detect(), and move all DP MST
detect debug logging there. Debug log the sink's MST capability,
including single-stream sideband messaging support, and the decision
whether to enable MST mode or not. Do this regardless of whether we're
actually enabling MST or not.

We need to detect MST in intel_dp_detect_dpcd() before the earlier
returns, but try not to change the logic otherwise.

v2:
- Use "MST", "SST w/ sideband messaging", and "SST" for logging (Ville)
- Return MST mode from intel_dp_mst_detect()
- Do MST detect before early returns from intel_dp_detect_dpcd()

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 52 ++++++++++++++++++-------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 91c42949ac7e..9590c8c2c4f3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4039,31 +4039,50 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 					   intel_dp->downstream_ports) == 0;
 }
 
-static bool
-intel_dp_can_mst(struct intel_dp *intel_dp)
+static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
+{
+	if (mst_mode == DRM_DP_MST)
+		return "MST";
+	else if (mst_mode == DRM_DP_SST_SIDEBAND_MSG)
+		return "SST w/ sideband messaging";
+	else
+		return "SST";
+}
+
+static enum drm_dp_mst_mode
+intel_dp_mst_detect(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
+	enum drm_dp_mst_mode sink_mst_mode;
+	enum drm_dp_mst_mode mst_detect;
+
+	sink_mst_mode = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
+
+	if (i915->display.params.enable_dp_mst &&
+	    intel_dp_mst_source_support(intel_dp) &&
+	    sink_mst_mode == DRM_DP_MST)
+		mst_detect = DRM_DP_MST;
+	else
+		mst_detect = DRM_DP_SST;
 
-	return i915->display.params.enable_dp_mst &&
-		intel_dp_mst_source_support(intel_dp) &&
-		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
+	drm_dbg_kms(&i915->drm,
+		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
+		    encoder->base.base.id, encoder->base.name,
+		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
+		    intel_dp_mst_mode_str(sink_mst_mode),
+		    str_yes_no(i915->display.params.enable_dp_mst),
+		    intel_dp_mst_mode_str(mst_detect));
+
+	return mst_detect;
 }
 
 static void
 intel_dp_configure_mst(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-	struct intel_encoder *encoder =
-		&dp_to_dig_port(intel_dp)->base;
 	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
 
-	drm_dbg_kms(&i915->drm,
-		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
-		    encoder->base.base.id, encoder->base.name,
-		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
-		    str_yes_no(sink_can_mst),
-		    str_yes_no(i915->display.params.enable_dp_mst));
-
 	if (!intel_dp_mst_source_support(intel_dp))
 		return;
 
@@ -5352,6 +5371,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	enum drm_dp_mst_mode mst_detect;
 	u8 *dpcd = intel_dp->dpcd;
 	u8 type;
 
@@ -5363,6 +5383,8 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 	if (!intel_dp_get_dpcd(intel_dp))
 		return connector_status_disconnected;
 
+	mst_detect = intel_dp_mst_detect(intel_dp);
+
 	/* if there's no downstream port, we're done */
 	if (!drm_dp_is_branch(dpcd))
 		return connector_status_connected;
@@ -5374,7 +5396,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 		connector_status_connected : connector_status_disconnected;
 	}
 
-	if (intel_dp_can_mst(intel_dp))
+	if (mst_detect == DRM_DP_MST)
 		return connector_status_connected;
 
 	/* If no HPD, poke DDC gently */
-- 
2.39.2

