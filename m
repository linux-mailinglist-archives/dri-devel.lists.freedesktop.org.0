Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62967847199
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 15:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018510E795;
	Fri,  2 Feb 2024 14:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIqS7u0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD61110E78E;
 Fri,  2 Feb 2024 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706882754; x=1738418754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LcgEwpmK4uiCtRdy7iqdYxD+i6whYEmb3fc4lfUxpY0=;
 b=eIqS7u0UfP8tcEnJHGlSiI2nXj0jweHoR8qeIueNACrm67n3d39gjMlW
 p+IkNgqxHj6Z9CXdqmIQ4+l06lYShLY9lr59T2DGflUgd2d5voO8LOkbO
 pOppcqFp0aKykrVcUB/oUHaIr2lnHOZRAW1nIOHp14N0TfPJqAs+aAxjq
 VZSHB/iXClnUyAuR2yIwi0K0mJimrdkiWICTY7ijOR4dKSKFJYUuPjj4u
 10jb/0ZACkPJsQ+yHeDSnNmPiwzWhJKtulGVbQqvWjJLdGRicqPU2zk3z
 DcWABOTve4obPlZABhxh+h4VvkRK9Iyj+AvqLHwSCUE6veJVFZnoH1/na g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17578439"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="17578439"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:05:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="23367490"
Received: from mmermeza-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.59.198])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:05:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [RFC 2/4] drm/i915/dp: refactor DP MST detection and configuration
Date: Fri,  2 Feb 2024 16:05:32 +0200
Message-Id: <d789334e1f31ba6eff1c7e2913e6a03cea8227e7.1706882591.git.jani.nikula@intel.com>
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

Currently we've split MST capability detection in two places,
intel_dp_can_mst() and intel_dp_configure_mst(). They check essentially
the same things.

Move bulk of the work, including logging, to intel_dp_can_mst() and
rename it intel_dp_mst_detect(). Set intel_dp->is_mst there to avoid
duplicate work.

Rename intel_dp_configure_mst() to intel_dp_mst_configure(), and only
set the topology manager state there.

The main functional difference is that the DP_MSTM_CAP DPCD register is
now only read once at detect, unconditionally, and the MST support is
always logged. Everything else should remain the same.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 36 ++++++++++---------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7af09f2c008d..e0b8ee6bde79 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4004,23 +4004,15 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 					   intel_dp->downstream_ports) == 0;
 }
 
-static bool
-intel_dp_can_mst(struct intel_dp *intel_dp)
+static bool intel_dp_mst_detect(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
+	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
 
-	return i915->display.params.enable_dp_mst &&
+	intel_dp->is_mst = i915->display.params.enable_dp_mst &&
 		intel_dp_mst_source_support(intel_dp) &&
-		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
-}
-
-static void
-intel_dp_configure_mst(struct intel_dp *intel_dp)
-{
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-	struct intel_encoder *encoder =
-		&dp_to_dig_port(intel_dp)->base;
-	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
+		sink_can_mst;
 
 	drm_dbg_kms(&i915->drm,
 		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
@@ -4029,14 +4021,14 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
 		    str_yes_no(sink_can_mst),
 		    str_yes_no(i915->display.params.enable_dp_mst));
 
-	if (!intel_dp_mst_source_support(intel_dp))
-		return;
-
-	intel_dp->is_mst = sink_can_mst &&
-		i915->display.params.enable_dp_mst;
+	return intel_dp->is_mst;
+}
 
-	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
-					intel_dp->is_mst);
+static void intel_dp_mst_configure(struct intel_dp *intel_dp)
+{
+	if (intel_dp_mst_source_support(intel_dp))
+		drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
+						intel_dp->is_mst);
 }
 
 static bool
@@ -5387,7 +5379,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 		connector_status_connected : connector_status_disconnected;
 	}
 
-	if (intel_dp_can_mst(intel_dp))
+	if (intel_dp_mst_detect(intel_dp))
 		return connector_status_connected;
 
 	/* If no HPD, poke DDC gently */
@@ -5706,7 +5698,7 @@ intel_dp_detect(struct drm_connector *connector,
 
 	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
 
-	intel_dp_configure_mst(intel_dp);
+	intel_dp_mst_configure(intel_dp);
 
 	/*
 	 * TODO: Reset link params when switching to MST mode, until MST
-- 
2.39.2

