Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D333FB3E5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 12:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B037A89E03;
	Mon, 30 Aug 2021 10:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1114989DC9;
 Mon, 30 Aug 2021 10:29:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="218257267"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="218257267"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="518730567"
Received: from anikolae-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.249.47.21])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 5/5] drm/i915/edp: use MSO pixel overlap from DisplayID data
Date: Mon, 30 Aug 2021 13:29:03 +0300
Message-Id: <121e15f220be6fa4d511caeb4f5c452f8fe725f1.1630319138.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1630319138.git.jani.nikula@intel.com>
References: <cover.1630319138.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Now that we have MSO pixel overlap in display info, use it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8e75543334c2..0d7c9eadca08 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2459,6 +2459,8 @@ static void intel_edp_mso_mode_fixup(struct intel_connector *connector,
 static void intel_edp_mso_init(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct intel_connector *connector = intel_dp->attached_connector;
+	struct drm_display_info *info = &connector->base.display_info;
 	u8 mso;
 
 	if (intel_dp->edp_dpcd[0] < DP_EDP_14)
@@ -2477,8 +2479,9 @@ static void intel_edp_mso_init(struct intel_dp *intel_dp)
 	}
 
 	if (mso) {
-		drm_dbg_kms(&i915->drm, "Sink MSO %ux%u configuration\n",
-			    mso, drm_dp_max_lane_count(intel_dp->dpcd) / mso);
+		drm_dbg_kms(&i915->drm, "Sink MSO %ux%u configuration, pixel overlap %u\n",
+			    mso, drm_dp_max_lane_count(intel_dp->dpcd) / mso,
+			    info->mso_pixel_overlap);
 		if (!HAS_MSO(i915)) {
 			drm_err(&i915->drm, "No source MSO support, disabling\n");
 			mso = 0;
@@ -2486,7 +2489,7 @@ static void intel_edp_mso_init(struct intel_dp *intel_dp)
 	}
 
 	intel_dp->mso_link_count = mso;
-	intel_dp->mso_pixel_overlap = 0; /* FIXME: read from DisplayID v2.0 */
+	intel_dp->mso_pixel_overlap = mso ? info->mso_pixel_overlap : 0;
 }
 
 static bool
-- 
2.20.1

