Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC078A5D6FC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1F510E6FA;
	Wed, 12 Mar 2025 07:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvT4/z1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0810E6FA;
 Wed, 12 Mar 2025 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763580; x=1773299580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7SPf+XLbs5RZvJvPQpG1WBJ4ZEoX/s2uuWDU5r8/liM=;
 b=bvT4/z1UaIx5HpTfd9S+k9Gw93s1GDfgKrOR6E0OlhDx+r0Lzp7jChYI
 etSRJWlZWhcx70j7LBq1Okn8mZX0t4EW++1yzvDemRRYgZldOjdRxA39L
 wSWjSArAf3fA+DJv4Jz4KJcE6+WAQZX8AkInYAcqmH3CHnzNCUxzvc5Ps
 czImGur0S0jNgz8M4q1pOGzzF/vmdE9zW3xXthARU7+WmeZ5aitj+l0TS
 64d5TqKryTCY+lGXkEkJhgFwnPHBZwL/tjLwNGahfbsjogT2+0fcjpGyX
 J7Mr3OYDLI+4M6+nyoODFuOxgBRJO4s5NQJA3TSmjiDTsvGKIQLv/+a3F Q==;
X-CSE-ConnectionGUID: o4iAbBRzTlmvYkvdZra+YA==
X-CSE-MsgGUID: IfP3beGXTxaKT/xOi/YUPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288801"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288801"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:12:59 -0700
X-CSE-ConnectionGUID: I00vQhe/RReZ+7dswe5esw==
X-CSE-MsgGUID: vpKgZA4wRc68PBfiqL7Y6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120367036"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:55 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 11/23] drm/i915/color: Create a transfer function color pipeline
Date: Wed, 12 Mar 2025 12:54:13 +0530
Message-ID: <20250312072425.3099205-12-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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
index 615f7bb9dc09..f86754cfbfef 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -30,6 +30,7 @@
 #include "intel_display_types.h"
 #include "intel_dsb.h"
 #include "intel_vrr.h"
+#include "skl_universal_plane.h"
 
 struct intel_color_funcs {
 	int (*color_check)(struct intel_atomic_state *state,
@@ -3937,6 +3938,139 @@ static const struct intel_color_funcs ilk_color_funcs = {
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
@@ -3976,6 +4110,47 @@ struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id
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

