Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4963485293E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4871110E92F;
	Tue, 13 Feb 2024 06:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfQiH7pm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0781F10E92F;
 Tue, 13 Feb 2024 06:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806551; x=1739342551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F87/RNmv9vUWKz7+zpqh9rekZyIG53RK2FY1AL4GM+k=;
 b=cfQiH7pmF00mX0buw35WxwEBsZq6PRhphYS61GIzjc2erR9Gxuxf55e5
 RjUE+s9pG6saHZEJXgSn3HLmCjO+c9rk0jqimwzgIlgIMwIPqTtAEn/27
 0kJ9mi77TENOEiQAn7EWLaTBDgV/VgzL1xH7bGiA6KcycKykzVy7LjtgO
 U82S48dY2Pg70YfbSmzpWP5p8oECuBJBsqBgavtX3W8a3c6fOOSy0fcZs
 lrGIxJW3OZU7rf0FpWEehTB/NDOpIYQQK4TpFgijv1f7lZQth7Yp2S1xF
 z8eBe9MmFKuG2/JXPXjtJ137U+8j3IBr4ZPqFCPJes5wcC5swi3+1h3Yo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948077"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948077"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450506"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:42:23 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 17/28] drm/i915: Define segmented Lut and add capabilities to
 colorop
Date: Tue, 13 Feb 2024 12:18:24 +0530
Message-ID: <20240213064835.139464-18-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

This defines the lut segments and create the color pipeline

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index e223edbe4c13..223cd1ff7291 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3811,6 +3811,105 @@ static const struct intel_color_funcs ilk_color_funcs = {
 	.get_config = ilk_get_config,
 };
 
+static const struct drm_color_lut_range xelpd_degamma_hdr[] = {
+	/* segment 1 */
+	{
+		.flags = (DRM_MODE_LUT_REFLECT_NEGATIVE |
+				DRM_MODE_LUT_INTERPOLATE |
+				DRM_MODE_LUT_NON_DECREASING),
+		.count = 128,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 0, .end = (1 << 24) - 1,
+		.min = 0, .max = (1 << 24) - 1,
+	},
+	/* segment 2 */
+	{
+		.flags = (DRM_MODE_LUT_REFLECT_NEGATIVE |
+				DRM_MODE_LUT_INTERPOLATE |
+				DRM_MODE_LUT_REUSE_LAST |
+				DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 24) - 1, .end = 1 << 24,
+		.min = 0, .max = (1 << 27) - 1,
+	},
+	/* Segment 3 */
+	{
+		.flags = (DRM_MODE_LUT_REFLECT_NEGATIVE |
+				DRM_MODE_LUT_INTERPOLATE |
+				DRM_MODE_LUT_REUSE_LAST |
+				DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 1 << 24, .end = 3 << 24,
+		.min = 0, .max = (1 << 27) - 1,
+	},
+	/* Segment 4 */
+	{
+		.flags = (DRM_MODE_LUT_REFLECT_NEGATIVE |
+				DRM_MODE_LUT_INTERPOLATE |
+				DRM_MODE_LUT_REUSE_LAST |
+				DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 3 << 24, .end = 7 << 24,
+		.min = 0, .max = (1 << 27) - 1,
+	}
+};
+
+/* FIXME input bpc? */
+static const struct drm_color_lut_range xelpd_gamma_hdr[] = {
+	/*
+	 * ToDo: Add Segment 1
+	 * There is an optional fine segment added with 9 lut values
+	 * Will be added later
+	 */
+
+	/* segment 2 */
+	{
+		.flags = (DRM_MODE_LUT_REFLECT_NEGATIVE |
+				DRM_MODE_LUT_INTERPOLATE |
+				DRM_MODE_LUT_NON_DECREASING),
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 0, .end = (1 << 24) - 1,
+		.min = 0, .max = (1 << 24) - 1,
+	},
+	/* segment 3 */
+	{
+		.flags = (DRM_MODE_LUT_REFLECT_NEGATIVE |
+				DRM_MODE_LUT_INTERPOLATE |
+				DRM_MODE_LUT_REUSE_LAST |
+				DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 24) - 1, .end = 1 << 24,
+		.min = 0, .max = 1 << 24,
+	},
+	/* Segment 4 */
+	{
+		.flags = (DRM_MODE_LUT_REFLECT_NEGATIVE |
+				DRM_MODE_LUT_INTERPOLATE |
+				DRM_MODE_LUT_REUSE_LAST |
+				DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 1 << 24, .end = 3 << 24,
+		.min = 0, .max = (3 << 24),
+	},
+	/* Segment 5 */
+	{
+		.flags = (DRM_MODE_LUT_REFLECT_NEGATIVE |
+				DRM_MODE_LUT_INTERPOLATE |
+				DRM_MODE_LUT_REUSE_LAST |
+				DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 3 << 24, .end = 7 << 24,
+		.min = 0, .max = (7 << 24),
+	},
+};
+
 /* TODO: Move to another file */
 struct intel_plane_colorop *intel_colorop_alloc(void)
 {
@@ -3865,6 +3964,11 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
 	if (ret)
 		return ret;
 
+	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
+		drm_colorop_lutcaps_init(&colorop->base, plane, xelpd_degamma_hdr,
+					 sizeof(xelpd_degamma_hdr));
+	}
+
 	list->type = colorop->base.base.id;
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
 
@@ -3886,6 +3990,11 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
 	if (ret)
 		return ret;
 
+	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
+		drm_colorop_lutcaps_init(&colorop->base, plane, xelpd_gamma_hdr,
+					 sizeof(xelpd_gamma_hdr));
+	}
+
 	drm_colorop_set_next_property(prev_op, &colorop->base);
 
 	return 0;
-- 
2.42.0

