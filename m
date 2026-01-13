Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7520ED182FE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D1B10E4D6;
	Tue, 13 Jan 2026 10:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0Ku9f1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBCF10E4D2;
 Tue, 13 Jan 2026 10:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768301366; x=1799837366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oqLWbR9Oz7S8nDmc4UEf/Rds8P7J6rSEEerhxG5PTCY=;
 b=Z0Ku9f1dfB4tMLCszSn3TNMOPhgHCkvB0L5VPv2Kh8mYBGk56uwAFmRi
 IVOynAbz3U3hrhgnuhZjRn/ZuACP+NsEHkPhlpStcFJoMExA/jv6tA8MB
 pzPaOF18b4hpIkCdYmGCoy3qkIouNtkSkdUspCaVRvl449lFqxbLOIt+2
 pCDOUv7Nv9iCRUqKl8EI/erLhdR4i0a284kcwHifQSmEukMbhJVoXuePL
 evJhZZxu9e2Rl94zt9rxLLaL4ZPvR/0lavuZDWd5P9Gvd56++briVuC1U
 +0Hl5tRnWbmHNfdgHgBM/PSozLwTxCPpdcqu6CyEAKuLkcYV75mxccO2u Q==;
X-CSE-ConnectionGUID: WxH02pk7Ss6Ofi6GxHzDBA==
X-CSE-MsgGUID: pH53U5YrQb+JdFaiVn6wYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87165275"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="87165275"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:49:26 -0800
X-CSE-ConnectionGUID: +q8KG43ZS16W/iRavnLvzA==
X-CSE-MsgGUID: HqZ36w8BRuONwKkJ84lKNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227554702"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 02:49:22 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 13/13] drm/i915/color: Add failure handling in plane color
 pipeline init
Date: Tue, 13 Jan 2026 15:53:03 +0530
Message-Id: <20260113102303.724205-14-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The plane color pipeline initialization built up multiple colorop blocks
inline, but did not reliably clean up partially constructed pipelines
when an intermediate step failed. This could lead to leaked colorop
objects and fragile error handling as the pipeline grows.

Refactor the pipeline construction to use a common helper for adding
colorop blocks. This centralizes allocation, initialization, and
teardown logic, allowing the caller to reliably unwind all previously
created colorops on failure.

v2:
 - Refactor code to avoid repetition (Suraj)

v3:
 - s/nvl/xe3plpd (Suraj)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_color_pipeline.c   | 164 +++++++++++++-----
 1 file changed, 117 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 8fecc53540ba..6cf8080ee800 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -2,6 +2,8 @@
 /*
  * Copyright © 2025 Intel Corporation
  */
+#include <drm/drm_print.h>
+
 #include "intel_color.h"
 #include "intel_colorop.h"
 #include "intel_color_pipeline.h"
@@ -10,6 +12,7 @@
 #include "skl_universal_plane.h"
 
 #define MAX_COLOR_PIPELINES 1
+#define MAX_COLOROP 4
 #define PLANE_DEGAMMA_SIZE 128
 #define PLANE_GAMMA_SIZE 32
 
@@ -17,70 +20,137 @@ static const struct drm_colorop_funcs intel_colorop_funcs = {
 	.destroy = intel_colorop_destroy,
 };
 
+/*
+ * 3DLUT can be bound to all three HDR planes. However, even with the latest
+ * color pipeline UAPI, there is no good way to represent a HW block which
+ * can be shared/attached at different stages of the pipeline. So right now,
+ * we expose 3DLUT only attached with the primary plane.
+ *
+ * That way we don't confuse the userspace with opaque commit failures
+ * on trying to enable it on multiple planes which would otherwise make
+ * the pipeline totally unusable.
+ */
+static const enum intel_color_block xe3plpd_primary_plane_pipeline[] = {
+	INTEL_PLANE_CB_PRE_CSC_LUT,
+	INTEL_PLANE_CB_CSC,
+	INTEL_PLANE_CB_3DLUT,
+	INTEL_PLANE_CB_POST_CSC_LUT,
+};
+
+static const enum intel_color_block hdr_plane_pipeline[] = {
+	INTEL_PLANE_CB_PRE_CSC_LUT,
+	INTEL_PLANE_CB_CSC,
+	INTEL_PLANE_CB_POST_CSC_LUT,
+};
+
+static bool plane_has_3dlut(struct intel_display *display, enum pipe pipe,
+			    struct drm_plane *plane)
+{
+	return (DISPLAY_VER(display) >= 35 &&
+		intel_color_crtc_has_3dlut(display, pipe) &&
+		plane->type == DRM_PLANE_TYPE_PRIMARY);
+}
+
 static
-int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list,
-				     enum pipe pipe)
+struct intel_colorop *intel_color_pipeline_plane_add_colorop(struct drm_plane *plane,
+							     struct intel_colorop *prev,
+							     enum intel_color_block id)
 {
 	struct drm_device *dev = plane->dev;
-	struct intel_display *display = to_intel_display(dev);
-	struct drm_colorop *prev_op;
 	struct intel_colorop *colorop;
 	int ret;
 
-	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
-
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, &intel_colorop_funcs,
-						  PLANE_DEGAMMA_SIZE,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
-						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
-
-	if (ret)
-		return ret;
-
-	list->type = colorop->base.base.id;
-
-	/* TODO: handle failures and clean up */
-	prev_op = &colorop->base;
-
-	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
-	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, &intel_colorop_funcs,
-					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		return ret;
-
-	drm_colorop_set_next_property(prev_op, &colorop->base);
-	prev_op = &colorop->base;
-
-	if (DISPLAY_VER(display) >= 35 &&
-	    intel_color_crtc_has_3dlut(display, pipe) &&
-	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
-		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
-
+	colorop = intel_colorop_create(id);
+
+	if (IS_ERR(colorop))
+		return colorop;
+
+	switch (id) {
+	case INTEL_PLANE_CB_PRE_CSC_LUT:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev,
+							  &colorop->base, plane,
+							  &intel_colorop_funcs,
+							  PLANE_DEGAMMA_SIZE,
+							  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		break;
+	case INTEL_PLANE_CB_CSC:
+		ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
+						     &intel_colorop_funcs,
+						     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		break;
+	case INTEL_PLANE_CB_3DLUT:
 		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane,
 						   &intel_colorop_funcs, 17,
 						   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 						   true);
-		if (ret)
-			return ret;
-
-		drm_colorop_set_next_property(prev_op, &colorop->base);
-
-		prev_op = &colorop->base;
+		break;
+	case INTEL_PLANE_CB_POST_CSC_LUT:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
+							  &intel_colorop_funcs,
+							  PLANE_GAMMA_SIZE,
+							  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		break;
+	default:
+		drm_err(plane->dev, "Invalid colorop id [%d]", id);
+		ret = -EINVAL;
 	}
 
-	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, &intel_colorop_funcs,
-						  PLANE_GAMMA_SIZE,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
-						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
-		return ret;
+		goto cleanup;
 
-	drm_colorop_set_next_property(prev_op, &colorop->base);
+	if (prev)
+		drm_colorop_set_next_property(&prev->base, &colorop->base);
 
-	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", list->type);
+	return colorop;
+
+cleanup:
+	intel_colorop_destroy(&colorop->base);
+	return ERR_PTR(ret);
+}
+
+static
+int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list,
+				     enum pipe pipe)
+{
+	struct drm_device *dev = plane->dev;
+	struct intel_display *display = to_intel_display(dev);
+	struct intel_colorop *colorop[MAX_COLOROP];
+	struct intel_colorop *prev = NULL;
+	const enum intel_color_block *pipeline;
+	int pipeline_len;
+	int ret = 0;
+	int i;
+
+	if (plane_has_3dlut(display, pipe, plane)) {
+		pipeline = xe3plpd_primary_plane_pipeline;
+		pipeline_len = ARRAY_SIZE(xe3plpd_primary_plane_pipeline);
+	} else {
+		pipeline = hdr_plane_pipeline;
+		pipeline_len = ARRAY_SIZE(hdr_plane_pipeline);
+	}
+
+	for (i = 0; i < pipeline_len; i++) {
+		colorop[i] = intel_color_pipeline_plane_add_colorop(plane, prev,
+								    pipeline[i]);
+		if (IS_ERR(colorop[i])) {
+			ret = PTR_ERR(colorop[i]);
+			goto cleanup;
+		}
+
+		prev = colorop[i];
+	}
+
+	list->type = colorop[0]->base.base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop[0]->base.base.id);
 
 	return 0;
+
+cleanup:
+	while (--i >= 0)
+		intel_colorop_destroy(&colorop[i]->base);
+	return ret;
 }
 
 int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
-- 
2.25.1

