Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D34020DF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C2F89D43;
	Mon,  6 Sep 2021 21:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB57D89D00;
 Mon,  6 Sep 2021 21:01:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747441"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747441"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362198"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:11 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v2 07/22] drm/i915/xelpd: Enable plane color features
Date: Tue,  7 Sep 2021 03:08:49 +0530
Message-Id: <20210906213904.27918-8-uma.shankar@intel.com>
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

Enable and initialize plane color features.
Also initialize the color features of HDR planes.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_color.h |  2 ++
 drivers/gpu/drm/i915/i915_drv.h            |  3 +++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 6403bd74324b..2307a2e4d73d 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -25,6 +25,7 @@
 #include "intel_color.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include <drm/drm_plane.h>
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
 
@@ -2093,7 +2094,6 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 }
 
  /* FIXME input bpc? */
-__maybe_unused
 static const struct drm_color_lut_range d13_degamma_hdr[] = {
 	/* segment 1 */
 	{
@@ -2144,6 +2144,26 @@ static const struct drm_color_lut_range d13_degamma_hdr[] = {
 	},
 };
 
+int intel_plane_color_init(struct drm_plane *plane)
+{
+	struct drm_i915_private *dev_priv = to_i915(plane->dev);
+	int ret = 0;
+
+	if (DISPLAY_VER(dev_priv) >= 13) {
+		drm_plane_create_color_mgmt_properties(plane->dev, plane, 2);
+		ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "no degamma",
+								   NULL, 0,
+								   LUT_TYPE_DEGAMMA);
+		ret = drm_plane_color_add_gamma_degamma_mode_range(plane, "plane degamma",
+								   d13_degamma_hdr,
+								   sizeof(d13_degamma_hdr),
+								   LUT_TYPE_DEGAMMA);
+		drm_plane_attach_degamma_properties(plane);
+	}
+
+	return ret;
+}
+
 void intel_color_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 173727aaa24d..b8850bb1b0c9 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -10,6 +10,7 @@
 
 struct intel_crtc_state;
 struct intel_crtc;
+struct drm_plane;
 struct drm_property_blob;
 
 void intel_color_init(struct intel_crtc *crtc);
@@ -21,5 +22,6 @@ int intel_color_get_gamma_bit_precision(const struct intel_crtc_state *crtc_stat
 bool intel_color_lut_equal(struct drm_property_blob *blob1,
 			   struct drm_property_blob *blob2,
 			   u32 gamma_mode, u32 bit_precision);
+int intel_plane_color_init(struct drm_plane *plane);
 
 #endif /* __INTEL_COLOR_H__ */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index be2392bbcecc..a937a20e4c49 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -391,6 +391,9 @@ struct drm_i915_display_funcs {
 	 */
 	void (*load_luts)(const struct intel_crtc_state *crtc_state);
 	void (*read_luts)(struct intel_crtc_state *crtc_state);
+	/* Add Plane Color callbacks */
+	void (*load_plane_csc_matrix)(const struct drm_plane_state *plane_state);
+	void (*load_plane_luts)(const struct drm_plane_state *plane_state);
 };
 
 
-- 
2.26.2

