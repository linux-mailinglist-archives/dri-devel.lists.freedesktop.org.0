Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667B87FA81
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14EC10F8D0;
	Tue, 19 Mar 2024 09:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOohO7Vw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3452310F8C6;
 Tue, 19 Mar 2024 09:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839602; x=1742375602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uEnxxBcYarf6pcSSJg8Nz2+LJRhxdjrvPWnMHKFGcFQ=;
 b=IOohO7VwPDGQ6rPz7PUJNQEFR/CTRIny5JZGp7NwNpqRJNDLpzG1ukoQ
 8JmN+E6ezBNfd1mgTLi2x2fPJ7BXPRPnIzQQ9zGj40qCbrSy7DFhiLkCS
 Q1gRp9FQhdfaGVfUaZIgrfusnlnEd/RCf3Dd9hdZaMXc3udHlZonpDELu
 7car+Sj19Txg8VHbNeTPfZRB+j4MplJ80gUPXeMgH/IEKhCG1gtUyWRmC
 zbwwC0MiDSrpRHVo71oi+bW6RBRkB/0moQpy11kOOTc7EtvTT5wAbznXT
 mvuUIR+mB4xiFgbzSPNuYE3FBNIWtA09JIL1x207MLTdi5Dyur05kU0Wo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16238049"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="16238049"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="13780690"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND v3 4/6] drm/i915/mst: use the MST mode detected previously
Date: Tue, 19 Mar 2024 11:12:51 +0200
Message-Id: <93a48df9a77e1138bb28e645fae3f9c79b094cc7.1710839496.git.jani.nikula@intel.com>
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

Drop the duplicate read of DP_MSTM_CAP DPCD register, and the duplicate
logic for choosing MST mode, and store the chosen mode in struct
intel_dp. Rename intel_dp_configure_mst() to intel_dp_mst_configure()
while at it.

v2: Rebase on drm_dp_mst_detect() returning the mode, not bool

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 21 ++++++++-----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8b9860cefaae..8a35fb6b2ade 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1804,6 +1804,7 @@ struct intel_dp {
 
 	bool is_mst;
 	int active_mst_links;
+	enum drm_dp_mst_mode mst_detect;
 
 	/* connector directly attached - won't be use for modeset in mst world */
 	struct intel_connector *attached_connector;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 127b5a89502d..e2f77855e4a0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4091,19 +4091,17 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
 }
 
 static void
-intel_dp_configure_mst(struct intel_dp *intel_dp)
+intel_dp_mst_configure(struct intel_dp *intel_dp)
 {
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
-
 	if (!intel_dp_mst_source_support(intel_dp))
 		return;
 
-	intel_dp->is_mst = sink_can_mst &&
-		i915->display.params.enable_dp_mst;
+	intel_dp->is_mst = intel_dp->mst_detect != DRM_DP_SST;
 
-	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
-					intel_dp->is_mst);
+	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr, intel_dp->is_mst);
+
+	/* Avoid stale info on the next detect cycle. */
+	intel_dp->mst_detect = DRM_DP_SST;
 }
 
 static bool
@@ -5384,7 +5382,6 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	enum drm_dp_mst_mode mst_detect;
 	u8 *dpcd = intel_dp->dpcd;
 	u8 type;
 
@@ -5396,7 +5393,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 	if (!intel_dp_get_dpcd(intel_dp))
 		return connector_status_disconnected;
 
-	mst_detect = intel_dp_mst_detect(intel_dp);
+	intel_dp->mst_detect = intel_dp_mst_detect(intel_dp);
 
 	/* if there's no downstream port, we're done */
 	if (!drm_dp_is_branch(dpcd))
@@ -5409,7 +5406,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 		connector_status_connected : connector_status_disconnected;
 	}
 
-	if (mst_detect == DRM_DP_MST)
+	if (intel_dp->mst_detect == DRM_DP_MST)
 		return connector_status_connected;
 
 	/* If no HPD, poke DDC gently */
@@ -5741,7 +5738,7 @@ intel_dp_detect(struct drm_connector *connector,
 
 	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
 
-	intel_dp_configure_mst(intel_dp);
+	intel_dp_mst_configure(intel_dp);
 
 	/*
 	 * TODO: Reset link params when switching to MST mode, until MST
-- 
2.39.2

