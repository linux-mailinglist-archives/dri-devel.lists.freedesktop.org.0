Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E06AF0F32
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41ED10E6BC;
	Wed,  2 Jul 2025 09:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBshB7Hp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEB510E6B2;
 Wed,  2 Jul 2025 09:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447347; x=1782983347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SXYdcLzB6Zei7ZEMQTDQBLlgO2nrtA4VReuT80Icd4w=;
 b=UBshB7HpCyViJE6JN0J2bKy2ELVztJofHDRXv3FHnUvzYwpsQgJH4OU0
 I0zYB3N6ud/O5SW40tWWVrPCyjy9NHqYsBTucG0pfny1nZ0OtMJHXAGfx
 EdBn0icj4p+ABhU+Gv6btlVXQGq6zFlwcnn2vgGU7vjToToF4bAlCcWwg
 5p+X/iKaBIt+6AeDfp23eWksKzXBx79D5Ihf44GX2wyAvhnHjWdPm6FLj
 efwksvEHUpGiRlhR9gHOor89ARO+m8uYcRcIvzu6GLyGdVxCqP3/Nm0xN
 LYNfkVDJ8RTu6VjYwQecLm8yYx/Y73wsCam+DAGgL7/67N7gUVdtFEnN2 Q==;
X-CSE-ConnectionGUID: Wdf1bURFQqWrf7mI5cYjGw==
X-CSE-MsgGUID: 3J7zGLOvS1qi3DbYhiKOiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427264"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427264"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:09:07 -0700
X-CSE-ConnectionGUID: y1bCXgroTwWofNJCMcPamQ==
X-CSE-MsgGUID: JuSakTEqR8y2XCIoh9XijQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536828"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:09:02 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 23/24] drm/i915/color: Create color pipeline with multisegmented
 LUT
Date: Wed,  2 Jul 2025 14:49:35 +0530
Message-ID: <20250702091936.3004854-24-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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
 drivers/gpu/drm/i915/display/intel_color.c | 185 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |   1 +
 2 files changed, 186 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 689bc4f4ce25..cf2e1e3653b2 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4311,6 +4311,139 @@ static const struct intel_color_funcs ilk_color_funcs = {
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
 static void
 intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
@@ -4424,6 +4557,52 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
 	return 0;
 }
 
+int intel_plane_tf_multseg_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct intel_plane_colorop *colorop;
+	struct drm_device *dev = plane->dev;
+	int ret;
+	struct drm_colorop *prev_op;
+
+	colorop = intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);
+
+	ret = drm_plane_colorop_curve_1d_lut_multseg_init(dev, &colorop->base,
+							  plane, xelpd_degamma_hdr,
+							  sizeof(xelpd_degamma_hdr),
+							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
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
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, &colorop->base);
+
+	prev_op = &colorop->base;
+
+	colorop = intel_plane_colorop_create(CB_PLANE_POST_CSC_LUT);
+	ret = drm_plane_colorop_curve_1d_lut_multseg_init(dev, &colorop->base,
+							  plane, xelpd_gamma_hdr,
+							  sizeof(xelpd_gamma_hdr),
+							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, &colorop->base);
+
+	return 0;
+}
+
 int intel_plane_color_init(struct drm_plane *plane)
 {
 	struct drm_device *dev = plane->dev;
@@ -4448,6 +4627,12 @@ int intel_plane_color_init(struct drm_plane *plane)
 		return ret;
 	len++;
 
+	/* Create Pipeline with Multi-segmented LUT */
+	ret = intel_plane_tf_multseg_pipeline_init(plane, &pipelines[len]);
+	if (ret)
+		return ret;
+	len++;
+
 	/* Create COLOR_PIPELINE property and attach */
 	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
 					"COLOR_PIPELINE",
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 420d596dbbae..1808b64a6903 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -52,4 +52,5 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
 int intel_plane_color_init(struct drm_plane *plane);
 void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
 					const struct intel_plane_state *plane_state);
+int intel_plane_tf_multseg_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

