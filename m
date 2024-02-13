Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715F3852F55
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4019F10E53E;
	Tue, 13 Feb 2024 11:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9lXj5V6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1389C10E520;
 Tue, 13 Feb 2024 11:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707823878; x=1739359878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3YJxBGnaG8HakIiKuKobXHkmRuQ6+zc2S0zuBDQF4Ac=;
 b=e9lXj5V6HdUMZqmd4G74qM7+xZ48JU0jQYFTs/8SMKHv4CvwwNmUyctS
 0mzhRzY2TiBbT/hqOTH8UqkiWOi7XE7OvpTrEVtSJQjsusDZK5rjwDpLJ
 TX15BaLd0PQLruhEgMPJczAU4irlcAa+RHlyz/2akmDq0tvAh+4qlgc4f
 6q/8vrUGvt0NgslL6msjSzOANmnlmV9IgKsjoRWrti6Lj3+3xmuHa/Wh4
 eEWyE8zR4ENHqLVkiwWR0zLEejGQhJY6RcC2L8a0ECODIeCkDSQbSBNVD
 OrsbBzvVrIIv54wXOFPhQDcLVmz0p/mB3qZFOtfVuRk3wxbU9u3c2si7U w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1965666"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1965666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7607616"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 2/6] drm/i915/mst: improve debug logging of DP MST mode
 detect
Date: Tue, 13 Feb 2024 13:30:57 +0200
Message-Id: <26cddf53e9f7697fc422d19e14bfaf215d6548a6.1707823736.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707823736.git.jani.nikula@intel.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
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

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 45 +++++++++++++++++--------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a1c304f451bd..944f566525dd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4007,31 +4007,48 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 					   intel_dp->downstream_ports) == 0;
 }
 
+static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
+{
+	if (mst_mode == DRM_DP_SST_SIDEBAND_MSG)
+		return "single-stream sideband messaging";
+	else
+		return str_yes_no(mst_mode == DRM_DP_MST);
+}
+
 static bool
-intel_dp_can_mst(struct intel_dp *intel_dp)
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
+	return mst_detect != DRM_DP_SST;
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
 
@@ -5390,7 +5407,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 		connector_status_connected : connector_status_disconnected;
 	}
 
-	if (intel_dp_can_mst(intel_dp))
+	if (intel_dp_mst_detect(intel_dp))
 		return connector_status_connected;
 
 	/* If no HPD, poke DDC gently */
-- 
2.39.2

