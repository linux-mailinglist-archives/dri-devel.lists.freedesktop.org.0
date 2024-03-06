Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5DF873896
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175571131FA;
	Wed,  6 Mar 2024 14:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbUVS7Jd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA851131FA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709734283; x=1741270283;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=UM9S6doqkrV1EBlIq8lNQPTcEdeSvt7o7nqtROtnkT4=;
 b=LbUVS7JdXOZ8l0AZtDoW8cao9wD/7xXKU0ERAPda2+xDNGa+enPZK1CD
 E3ShDdfHiqOCGlRddt6rM4q+2v7SFKtHH8GMNDJwWhbv7ZlUIm/34ntSm
 4o3heGX2BAYk9zz/thkIChufsCSiP0kO8j79JKLgBE43ngrpKbZUOocq6
 OdmTiGbOKk28SQpEpiic2J3I5ESeIY2OVxYeyqAfvvyP2zoJ+6fL6X2+K
 w5D1YpdiYb1U9JYytne0GenaDtislJaBhrn+APAPznPgZd+NczNksXEQX
 v23io9rkQHu1ZXT+Ym/3rEvXQOlSQ3fkSW6k1BZEptf8xEpwoMasbvcfZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15771799"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="15771799"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:20 -0800
X-ExtLoopCount2: 2 from 10.252.33.211
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14444346"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:18 -0800
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 06 Mar 2024 16:11:15 +0200
Resent-Message-ID: <87le6vxxfg.fsf@intel.com>
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Mailbox Transport; Wed, 6 Mar 2024 06:07:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 06:07:37 -0800
Received: from fmviesa002.fm.intel.com (10.60.135.142) by
 orsmsx601.amr.corp.intel.com (10.22.229.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 06:07:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="32915300"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211]) by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 06:07:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 "Arun R Murthy" <arun.r.murthy@intel.com>
Subject: [PATCH v3 4/6] drm/i915/mst: use the MST mode detected previously
Date: Wed, 6 Mar 2024 16:07:15 +0200
Message-ID: <687899161d4ba5030ed0b604c23906d97c8f17fc.1709733981.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709733981.git.jani.nikula@intel.com>
References: <cover.1709733981.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-MS-Exchange-Organization-Network-Message-Id: 7f8284f6-5930-4f5b-8b26-08dc3de6c73b
X-MS-Exchange-Organization-AuthSource: ORSMSX601.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Enterprise: 1.0
X-MS-Exchange-Organization-SCL: -1
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.9534009
X-MS-Exchange-Processed-By-BccFoldering: 15.01.2507.035
MIME-Version: 1.0
X-TUID: 0VoaU5t9ftrQ
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
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 21 ++++++++-----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e67cd5b02e84..1d3234f471c7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1798,6 +1798,7 @@ struct intel_dp {
 
 	bool is_mst;
 	int active_mst_links;
+	enum drm_dp_mst_mode mst_detect;
 
 	/* connector directly attached - won't be use for modeset in mst world */
 	struct intel_connector *attached_connector;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9c0fbd2eb62b..41f83d01a884 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4099,19 +4099,17 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
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
@@ -5392,7 +5390,6 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	enum drm_dp_mst_mode mst_detect;
 	u8 *dpcd = intel_dp->dpcd;
 	u8 type;
 
@@ -5404,7 +5401,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 	if (!intel_dp_get_dpcd(intel_dp))
 		return connector_status_disconnected;
 
-	mst_detect = intel_dp_mst_detect(intel_dp);
+	intel_dp->mst_detect = intel_dp_mst_detect(intel_dp);
 
 	/* if there's no downstream port, we're done */
 	if (!drm_dp_is_branch(dpcd))
@@ -5417,7 +5414,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 		connector_status_connected : connector_status_disconnected;
 	}
 
-	if (mst_detect == DRM_DP_MST)
+	if (intel_dp->mst_detect == DRM_DP_MST)
 		return connector_status_connected;
 
 	/* If no HPD, poke DDC gently */
@@ -5749,7 +5746,7 @@ intel_dp_detect(struct drm_connector *connector,
 
 	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
 
-	intel_dp_configure_mst(intel_dp);
+	intel_dp_mst_configure(intel_dp);
 
 	/*
 	 * TODO: Reset link params when switching to MST mode, until MST
-- 
2.39.2

