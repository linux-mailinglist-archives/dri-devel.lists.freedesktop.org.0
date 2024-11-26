Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39FD9D984E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0A210E895;
	Tue, 26 Nov 2024 13:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kp6GuxVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB8210E895;
 Tue, 26 Nov 2024 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627221; x=1764163221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dvt9nPhwYxirlPzB89ZD89M5ICiTjtJEJQn1/rNgLZA=;
 b=kp6GuxVt6ZkPrdOKq14ZP+iH5fc1EhgxpbWhHoSkIC7LJ0DZoaAqM5+c
 Za1mVd88jij01pFpzWfwp/BeEUX0u0GLXh2uwpk1c+Sym+Yxwvf6yOfS5
 r/L0JcpwuUsEoKQCJQxYiPpWREtaXLVso8AD2AC/cBuZzY5E8eOSaxUkM
 gLo0VsQg4yPGhAPIHzq1rZHQIiQFosvxQzDLadryU1Wp8kXISUeLB2qo0
 kc9H2qVnQm1o+h+EJDEVZXKUYFBpGfGRqJWuwhB2LbP4NEIt/PjUrQnQ9
 IyG8UvrlAkWPniTLi20raYWJtJQL7HLdwzpdo6eiEjE06aF6/Q2sSG050 w==;
X-CSE-ConnectionGUID: FjbjO3UWSs6OUYItpiHlew==
X-CSE-MsgGUID: 04ZTcDTaR8ipAD1XixkKoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170274"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170274"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:20 -0800
X-CSE-ConnectionGUID: QMzDFRwrSH6i6lHS66DgtQ==
X-CSE-MsgGUID: CH2J2C1dSru4QQA1hlQImg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874777"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:16 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 13/25] drm/i915/color: Create a transfer function color pipeline
Date: Tue, 26 Nov 2024 18:57:18 +0530
Message-ID: <20241126132730.1192571-14-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add a color pipeline with three colorops in the sequence

	1D LUT MULTSEG - CTM - 1D LUT MULTSEG

This pipeline can be used to do any color space conversion or HDR
tone mapping

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 175 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |   3 +
 2 files changed, 178 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 29a2463cbe7f..ba4c4ff6c9d5 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -28,6 +28,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dsb.h"
+#include "skl_universal_plane.h"
 
 struct intel_color_funcs {
 	int (*color_check)(struct intel_atomic_state *state,
@@ -3910,6 +3911,139 @@ static const struct intel_color_funcs ilk_color_funcs = {
 	.get_config = ilk_get_config,
 };
 
+static const struct drm_color_lut_range xelpd_degamma_hdr[] = {
+	/* segment 1 */
+	{
+		.flags = (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
+			  DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
+		.count = 128,
+		.start = 0, .end = (1 << 24) - 1,
+		.norm_factor = (1 << 24),
+		.precision = {
+			.intp = 0,
+			.fracp = 24,
+		},
+	},
+	/* segment 2 */
+	{
+		.flags = (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
+			  DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
+		.count = 1,
+		.start = (1 << 24), .end = (1 << 24),
+		.norm_factor = (1 << 24),
+		.precision = {
+			.intp = 3,
+			.fracp = 24,
+		},
+	},
+	/* Segment 3 */
+	{
+		.flags = (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
+			  DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
+		.count = 1,
+		.start = 3 * (1 << 24), .end = 3 * (1 << 24),
+		.norm_factor = (1 << 24),
+		.precision = {
+			.intp = 3,
+			.fracp = 24,
+		},
+	},
+	/* Segment 4 */
+	{
+		.flags = (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
+			  DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
+		.count = 1,
+		.start = 7 * (1 << 24), .end = 7 * (1 << 24),
+		.norm_factor = (1 << 24),
+		.precision = {
+			.intp = 3,
+			.fracp = 24,
+		},
+	}
+};
+
+/* FIXME input bpc? */
+static const struct drm_color_lut_range xelpd_gamma_hdr[] = {
+	/* segment 1 */
+	{
+		.flags = (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
+			  DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
+		.count = 9,
+		.start = 0, .end = 8,
+		.norm_factor = 8 * 32,
+		.precision = {
+			.intp = 0,
+			.fracp = 24,
+		},
+	},
+	/* segment 2 */
+	{
+		.flags = (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
+			  DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
+		.count = 30,
+		.start = 8 * 2, .end = 8 * (32 - 1),
+		.norm_factor = 8 * 32,
+		.precision = {
+			.intp = 0,
+			.fracp = 24,
+		},
+	},
+	/* segment 3 */
+	{
+		.flags = (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
+			  DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
+		.count = 1,
+		.start = 8 * 32, .end = 8 * 32,
+		.norm_factor = 8 * 32,
+		.precision = {
+			.intp = 3,
+			.fracp = 24,
+		},
+	},
+	/* segment 4 */
+	{
+		.flags = (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
+			  DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
+		.count = 1,
+		.start = 3 * 8 * 32, .end = 3 * 8 * 32,
+		.norm_factor = 8 * 32,
+		.precision = {
+			.intp = 3,
+			.fracp = 24,
+		},
+	},
+	/* segment 5 */
+	{
+		.flags = (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE |
+			  DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
+			  DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
+		.count = 1,
+		.start = 7 * 8 * 32, .end = 7 * 8 * 32,
+		.norm_factor = 8 * 32,
+		.precision = {
+			.intp = 3,
+			.fracp = 24,
+		},
+	},
+};
+
 /* TODO: Move to another file */
 struct intel_plane_colorop *intel_colorop_alloc(void)
 {
@@ -3949,6 +4083,47 @@ struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id
 	return colorop;
 }
 
+int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct intel_plane_colorop *colorop;
+	struct drm_device *dev = plane->dev;
+	int ret;
+	struct drm_colorop *prev_op;
+
+	colorop = intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);
+
+	ret = drm_colorop_curve_1d_lut_multseg_init(dev, &colorop->base,
+						    plane, xelpd_degamma_hdr,
+						    sizeof(xelpd_degamma_hdr), true);
+	if (ret)
+		return ret;
+
+	list->type = colorop->base.base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
+
+	/* TODO: handle failures and clean up*/
+	prev_op = &colorop->base;
+
+	colorop = intel_plane_colorop_create(CB_PLANE_CSC);
+	ret = drm_colorop_ctm_3x3_init(dev, &colorop->base, plane, true);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, &colorop->base);
+	prev_op = &colorop->base;
+
+	colorop = intel_plane_colorop_create(CB_PLANE_POST_CSC_LUT);
+	ret = drm_colorop_curve_1d_lut_multseg_init(dev, &colorop->base,
+						    plane, xelpd_gamma_hdr,
+						    sizeof(xelpd_gamma_hdr), true);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, &colorop->base);
+
+	return 0;
+}
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index a9f229e37317..abbc41d730a9 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -14,6 +14,8 @@ struct intel_crtc;
 struct intel_display;
 struct intel_dsb;
 struct drm_property_blob;
+struct drm_plane;
+struct drm_prop_enum_list;
 enum intel_color_block;
 
 void intel_color_init_hooks(struct intel_display *display);
@@ -41,5 +43,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 struct intel_plane_colorop *intel_colorop_alloc(void);
 struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
+int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

