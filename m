Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F89873895
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F54B1131F8;
	Wed,  6 Mar 2024 14:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0wTghI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82108113200
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709734273; x=1741270273;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=FinDMKi+L6Iwzy74F8fAuZtebaLiOZkrqdqrv5Z+2uI=;
 b=B0wTghI8yPAe+QVDB+xGYNFV0G5peiuE7ysmoSp/Z1udOOEX4NM3eSTQ
 UYr3d816uLg7dIMGWYO+v0cYt+ReAzjG3qko7t48aUtUcWwS2kC3jreFP
 k7pbcpFthO5sT0Cav+xKiXBobVuQ+CWTZJcP+WV6cg+gf/u1TfVZa8JPD
 LotLaOlDoT40Pi+k7RtnmRElq35IXVRzxGVWK1j92GuDTrl2E6Pew4hb8
 IECLEj868k5BTEXC3DB/E4CkMn6ed5UAqLAHN36EIVpqYl3wBUGlNmGPl
 bAD78e3+qrDhwiTQJkSsozuoL+JHHpi5FBTyzks4vZHRibPm12wWBvXjl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4465511"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4465511"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:12 -0800
X-ExtLoopCount2: 2 from 10.252.33.211
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14429431"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:11 -0800
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 06 Mar 2024 16:11:09 +0200
Resent-Message-ID: <87plw7xxfm.fsf@intel.com>
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Mailbox Transport; Wed, 6 Mar 2024 06:07:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 06:07:33 -0800
Received: from fmviesa002.fm.intel.com (10.60.135.142) by
 orsmsx601.amr.corp.intel.com (10.22.229.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 06:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="32915276"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211]) by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 06:07:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 "Arun R Murthy" <arun.r.murthy@intel.com>
Subject: [PATCH v3 3/6] drm/i915/mst: abstract choosing the MST mode to use
Date: Wed, 6 Mar 2024 16:07:14 +0200
Message-ID: <a40b3f640de57bb59892f532aac22f471312d87f.1709733981.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709733981.git.jani.nikula@intel.com>
References: <cover.1709733981.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-MS-Exchange-Organization-Network-Message-Id: fc53e422-6387-4689-68e0-08dc3de6c512
X-MS-Exchange-Organization-AuthSource: ORSMSX601.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Enterprise: 1.0
X-MS-Exchange-Organization-SCL: -1
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.8255566
X-MS-Exchange-Processed-By-BccFoldering: 15.01.2507.035
MIME-Version: 1.0
X-TUID: 9aidiSjaWEXd
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
index cef65a300154..9c0fbd2eb62b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4057,6 +4057,24 @@ static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
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
@@ -4067,12 +4085,7 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
 
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

