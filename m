Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87994020F5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476FF89D8D;
	Mon,  6 Sep 2021 21:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4521089D86;
 Mon,  6 Sep 2021 21:01:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="219732477"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="219732477"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362351"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:46 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v2 19/22] drm/i915/xelpd: Define and Initialize Plane Gamma Lut
 range
Date: Tue,  7 Sep 2021 03:09:01 +0530
Message-Id: <20210906213904.27918-20-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
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

Define the structure with XE_LPD gamma lut ranges. HDR and SDR planes
have different capabilities, implemented respective structure for
the HDR planes. Degamma and GAMMA has same Lut caps for SDR planes,
extended the same.

Initialize the mode range caps as well.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 112 ++++++++++++++++++---
 1 file changed, 99 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index e9c80ed41466..b4cad5c92c85 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2247,7 +2247,7 @@ static const struct drm_color_lut_range d13_degamma_hdr[] = {
 };
 
  /* FIXME input bpc? */
-static const struct drm_color_lut_range d13_degamma_sdr[] = {
+static const struct drm_color_lut_range d13_gamma_degamma_sdr[] = {
 	/* segment 1 */
 	{
 		.flags = (DRM_MODE_LUT_GAMMA |
@@ -2297,6 +2297,63 @@ static const struct drm_color_lut_range d13_degamma_sdr[] = {
 	},
 };
 
+ /* FIXME input bpc? */
+static const struct drm_color_lut_range d13_gamma_hdr[] = {
+	/*
+	 * ToDo: Add Segment 1
+	 * There is an optional fine segment added with 9 lut values
+	 * Will be added later
+	 */
+
+	/* segment 2 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 0, .end = (1 << 24) - 1,
+		.min = 0, .max = (1 << 24) - 1,
+	},
+	/* segment 3 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 24) - 1, .end = 1 << 24,
+		.min = 0, .max = 1 << 24,
+	},
+	/* Segment 4 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 1 << 24, .end = 3 << 24,
+		.min = 0, .max = (3 << 24),
+	},
+	/* Segment 5 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 3 << 24, .end = 7 << 24,
+		.min = 0, .max = (7 << 24),
+	},
+};
+
 static void d13_program_plane_degamma_lut(const struct drm_plane_state *state,
 					  struct drm_color_lut_ext *degamma_lut,
 					  u32 offset)
@@ -2406,26 +2463,55 @@ int intel_plane_color_init(struct drm_plane *plane)
 		ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "no degamma",
 								   NULL, 0,
 								   LUT_TYPE_DEGAMMA);
-		if (icl_is_hdr_plane(dev_priv, to_intel_plane(plane)->id))
+		if (ret)
+			return ret;
+
+		ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "no gamma",
+								   NULL, 0,
+								   LUT_TYPE_GAMMA);
+		if (ret)
+			return ret;
+
+		if (icl_is_hdr_plane(dev_priv, to_intel_plane(plane)->id)) {
 			ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "plane degamma",
 									   d13_degamma_hdr,
 									   sizeof(d13_degamma_hdr),
 									   LUT_TYPE_DEGAMMA);
-		else
-			ret = drm_plane_color_add_gamma_degamma_mode_range(plane,
-									   "plane degamma",
-									   d13_degamma_sdr,
-									   sizeof(d13_degamma_sdr),
+			if (ret)
+				return ret;
+
+			ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "plane gamma",
+									   d13_gamma_hdr,
+									   sizeof(d13_gamma_hdr),
+									   LUT_TYPE_GAMMA);
+			if (ret)
+				return ret;
+		} else {
+			ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "plane degamma",
+									   d13_gamma_degamma_sdr,
+									   sizeof(d13_gamma_degamma_sdr),
 									   LUT_TYPE_DEGAMMA);
+			if (ret)
+				return ret;
+
+			ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "plane gamma",
+									   d13_gamma_degamma_sdr,
+									   sizeof(d13_gamma_degamma_sdr),
+									   LUT_TYPE_GAMMA);
+			if (ret)
+				return ret;
+		}
+	}
 
-		dev_priv->display.load_plane_luts = d13_plane_load_luts;
-		dev_priv->display.load_plane_csc_matrix = icl_load_plane_csc_matrix;
+	dev_priv->display.load_plane_luts = d13_plane_load_luts;
+	dev_priv->display.load_plane_csc_matrix = icl_load_plane_csc_matrix;
 
-		drm_plane_attach_degamma_properties(plane);
+	drm_plane_attach_degamma_properties(plane);
 
-		if (icl_is_hdr_plane(dev_priv, to_intel_plane(plane)->id))
-			drm_plane_attach_ctm_property(plane);
-	}
+	if (icl_is_hdr_plane(dev_priv, to_intel_plane(plane)->id))
+		drm_plane_attach_ctm_property(plane);
+
+	drm_plane_attach_gamma_properties(plane);
 
 	return ret;
 }
-- 
2.26.2

