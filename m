Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602CECCEC34
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C1710EEC5;
	Fri, 19 Dec 2025 07:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFnIbkz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174C510EEC5;
 Fri, 19 Dec 2025 07:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766128436; x=1797664436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KHMu71kyC0VM3N79TmVUz4uq1wPEJQQ/JaRcW4RKNNk=;
 b=CFnIbkz6YRmAnTRQG7l0k2qwkWFCLe+lXZ1wfL3B5bns1g8SYN2qnkif
 uECE6WR+m4m+bkW+po9zlKAHYk0BfxejoVcH5YEfNlQGWbtIUzXUIkp9b
 J7ed+vJ+utTRarFPiCNPy2ZKOZh9cLxMJFjFjJsaVyVxES6MmsCMp/wiq
 20rx13C8hcysyUVybtMfWT4JIjimRaMjC0MDTW1Cr3/xdiUS4DUbWxtp0
 NfD8XrmGXstFVKyOihR4+Hs+zoIVf/z3M2hj/mR3p+SQ7T/rjYmZg1Ejr
 moO3/hAKq9Yi9GiEAN1YLr1VOmbrUK3g+SzEZZ7TXETOs4N101edAsvkG Q==;
X-CSE-ConnectionGUID: lDmuK0F5ReOjCA7JeVysNQ==
X-CSE-MsgGUID: 7RChxYVmQ8WLNWceZyAoMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93562433"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93562433"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:13:55 -0800
X-CSE-ConnectionGUID: W0Dgvq5nQhimftZHzf6Mrw==
X-CSE-MsgGUID: 4ozuw8mXR426Lj8hQ6Xy6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222209599"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 23:13:51 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH 13/13] drm/i915/color: Add failure handling in plane color
 pipeline init
Date: Fri, 19 Dec 2025 12:26:14 +0530
Message-Id: <20251219065614.190834-14-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
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

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../drm/i915/display/intel_color_pipeline.c   | 142 ++++++++++++------
 1 file changed, 100 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 8fecc53540ba..035ec3f022cd 100644
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
 
@@ -18,69 +21,124 @@ static const struct drm_colorop_funcs intel_colorop_funcs = {
 };
 
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
+		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane,
+						   &intel_colorop_funcs, 17,
+						   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+						   true);
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
+	}
 
 	if (ret)
-		return ret;
+		goto cleanup;
 
-	list->type = colorop->base.base.id;
+	if (prev)
+		drm_colorop_set_next_property(&prev->base, &colorop->base);
 
-	/* TODO: handle failures and clean up */
-	prev_op = &colorop->base;
+	return colorop;
 
-	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
-	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, &intel_colorop_funcs,
-					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		return ret;
+cleanup:
+	intel_colorop_destroy(&colorop->base);
+	return ERR_PTR(ret);
+}
 
-	drm_colorop_set_next_property(prev_op, &colorop->base);
-	prev_op = &colorop->base;
+static
+int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list,
+				     enum pipe pipe)
+{
+	struct drm_device *dev = plane->dev;
+	struct intel_display *display = to_intel_display(dev);
+	struct intel_colorop *colorop[MAX_COLOROP];
+	int ret = 0;
+	int i = 0;
 
-	if (DISPLAY_VER(display) >= 35 &&
-	    intel_color_crtc_has_3dlut(display, pipe) &&
-	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
-		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
+	colorop[i] = intel_color_pipeline_plane_add_colorop(plane, NULL,
+							    INTEL_PLANE_CB_PRE_CSC_LUT);
+
+	if (IS_ERR(colorop[i])) {
+		ret = PTR_ERR(colorop[i]);
+		goto cleanup;
+	}
+	i++;
 
-		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane,
-						   &intel_colorop_funcs, 17,
-						   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
-						   true);
-		if (ret)
-			return ret;
 
-		drm_colorop_set_next_property(prev_op, &colorop->base);
+	colorop[i] = intel_color_pipeline_plane_add_colorop(plane, colorop[i - 1],
+							    INTEL_PLANE_CB_CSC);
 
-		prev_op = &colorop->base;
+	if (IS_ERR(colorop[i])) {
+		ret = PTR_ERR(colorop[i]);
+		goto cleanup;
 	}
 
-	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, &intel_colorop_funcs,
-						  PLANE_GAMMA_SIZE,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
-						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		return ret;
+	i++;
 
-	drm_colorop_set_next_property(prev_op, &colorop->base);
+	if (DISPLAY_VER(display) >= 35 &&
+	    intel_color_crtc_has_3dlut(display, pipe) &&
+	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
+		colorop[i] = intel_color_pipeline_plane_add_colorop(plane, colorop[i - 1],
+								    INTEL_PLANE_CB_3DLUT);
+
+		if (IS_ERR(colorop[i])) {
+			ret = PTR_ERR(colorop[i]);
+			goto cleanup;
+		}
+		i++;
+	}
 
-	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", list->type);
+	colorop[i] = intel_color_pipeline_plane_add_colorop(plane, colorop[i - 1],
+							    INTEL_PLANE_CB_POST_CSC_LUT);
+	if (IS_ERR(colorop[i])) {
+		ret = PTR_ERR(colorop[i]);
+		goto cleanup;
+	}
+	i++;
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

