Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D44020DE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6284989D2F;
	Mon,  6 Sep 2021 21:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6C289D42;
 Mon,  6 Sep 2021 21:01:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747456"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362207"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:14 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v2 08/22] drm/i915/xelpd: Add color capabilities of SDR planes
Date: Tue,  7 Sep 2021 03:08:50 +0530
Message-Id: <20210906213904.27918-9-uma.shankar@intel.com>
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

Add the Color capabilities of SDR planes.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 67 ++++++++++++++++++++--
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 2307a2e4d73d..fd0bfdf85703 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -25,6 +25,7 @@
 #include "intel_color.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include "intel_sprite.h"
 #include <drm/drm_plane.h>
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -2144,6 +2145,57 @@ static const struct drm_color_lut_range d13_degamma_hdr[] = {
 	},
 };
 
+ /* FIXME input bpc? */
+static const struct drm_color_lut_range d13_degamma_sdr[] = {
+	/* segment 1 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 32,
+		.input_bpc = 16, .output_bpc = 16,
+		.start = 0, .end = (1 << 16) - (1 << 16) / 33,
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 2 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 16, .output_bpc = 16,
+		.start = (1 << 16) - (1 << 16) / 33, .end = 1 << 16,
+		.min = 0, .max = 1 << 16,
+	},
+	/* Segment 3 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 16, .output_bpc = 16,
+		.start = 1 << 16, .end = 3 << 16,
+		.min = 0, .max = (8 << 16) - 1,
+	},
+	/* Segment 4 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 16, .output_bpc = 16,
+		.start = 3 << 16, .end = 7 << 16,
+		.min = 0, .max = (8 << 16) - 1,
+	},
+};
+
 int intel_plane_color_init(struct drm_plane *plane)
 {
 	struct drm_i915_private *dev_priv = to_i915(plane->dev);
@@ -2154,10 +2206,17 @@ int intel_plane_color_init(struct drm_plane *plane)
 		ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "no degamma",
 								   NULL, 0,
 								   LUT_TYPE_DEGAMMA);
-		ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "plane degamma",
-								   d13_degamma_hdr,
-								   sizeof(d13_degamma_hdr),
-								   LUT_TYPE_DEGAMMA);
+		if (icl_is_hdr_plane(dev_priv, to_intel_plane(plane)->id))
+			ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "plane degamma",
+									   d13_degamma_hdr,
+									   sizeof(d13_degamma_hdr),
+									   LUT_TYPE_DEGAMMA);
+		else
+			ret = drm_plane_color_add_gamma_degamma_mode_range(plane,
+									   "plane degamma",
+									   d13_degamma_sdr,
+									   sizeof(d13_degamma_sdr),
+									   LUT_TYPE_DEGAMMA);
 		drm_plane_attach_degamma_properties(plane);
 	}
 
-- 
2.26.2

