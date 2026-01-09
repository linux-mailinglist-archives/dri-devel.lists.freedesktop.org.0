Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDFED07E93
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706C210E82D;
	Fri,  9 Jan 2026 08:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHpBdh4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204110E82D;
 Fri,  9 Jan 2026 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948219; x=1799484219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iK45lZ/ahOR/QOYtn7T6DOAqWFpf47Y7fcJK0nr+txc=;
 b=GHpBdh4yYsoaSeXbP/bbpCCh9/JUsDRCpTCFaUgCmfuAxHebAGXaHGml
 V37tkl7pGCGcPqkzK08aHRUr6WKlgDLpZz6scC2AV3ERo15+SJKQcKZDR
 a3HY7qb8JhogK5wx5MBFDLuYMz+rdvbY0Xnug3xPpt1y5iX6i+1JOrO4+
 Cmy479Z2lKF+ygrm0tTEJVU9oTqX/hYyIr+PBuvO8ja4Rrv+nXSC55vjF
 p2zC02n5sXFwpxGZ4kSWfzATGkxtuZ0aGMOzq6wOX9c/r85cdDejzm5L5
 e3eb5uL3hCznG1PgdHK9f0Btg39l0+QEIHLA3TeRHqITeEefNbhIyZG6u g==;
X-CSE-ConnectionGUID: bfDf8mKuQKGw/ifcZToFZA==
X-CSE-MsgGUID: sYZIwS+/TE6lIldXCmowsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69241452"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69241452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:43:39 -0800
X-CSE-ConnectionGUID: JHHyLiAlQHKmKIUFIN6yRA==
X-CSE-MsgGUID: BxB5Q64ETbyBdME3Yk9Ndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="240924601"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 00:43:35 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 09/13] drm/i915/display: Hook up intel_colorop_destroy
Date: Fri,  9 Jan 2026 13:47:24 +0530
Message-Id: <20260109081728.478844-10-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
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

i915 embeds struct drm_colorop inside struct intel_colorop, so the
default drm_colorop_destroy() helper cannot be used. Add an
intel_colorop_destroy() helper that performs common DRM cleanup and
frees intel_colorop object.

This ensures correct teardown of plane color pipeline objects.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 13 +++++++++----
 drivers/gpu/drm/i915/display/intel_colorop.c        |  6 ++++++
 drivers/gpu/drm/i915/display/intel_colorop.h        |  1 +
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index d3d73d60727c..8fecc53540ba 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -13,6 +13,10 @@
 #define PLANE_DEGAMMA_SIZE 128
 #define PLANE_GAMMA_SIZE 32
 
+static const struct drm_colorop_funcs intel_colorop_funcs = {
+	.destroy = intel_colorop_destroy,
+};
+
 static
 int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list,
 				     enum pipe pipe)
@@ -25,7 +29,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 
 	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
 
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, NULL,
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, &intel_colorop_funcs,
 						  PLANE_DEGAMMA_SIZE,
 						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
@@ -39,7 +43,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	prev_op = &colorop->base;
 
 	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
-	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, NULL,
+	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, &intel_colorop_funcs,
 					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		return ret;
@@ -52,7 +56,8 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
 		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
 
-		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, NULL, 17,
+		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane,
+						   &intel_colorop_funcs, 17,
 						   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 						   true);
 		if (ret)
@@ -64,7 +69,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	}
 
 	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, NULL,
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, &intel_colorop_funcs,
 						  PLANE_GAMMA_SIZE,
 						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
diff --git a/drivers/gpu/drm/i915/display/intel_colorop.c b/drivers/gpu/drm/i915/display/intel_colorop.c
index 1d84933f05aa..9e54f51cfad8 100644
--- a/drivers/gpu/drm/i915/display/intel_colorop.c
+++ b/drivers/gpu/drm/i915/display/intel_colorop.c
@@ -35,3 +35,9 @@ struct intel_colorop *intel_colorop_create(enum intel_color_block id)
 
 	return colorop;
 }
+
+void intel_colorop_destroy(struct drm_colorop *colorop)
+{
+	drm_colorop_cleanup(colorop);
+	kfree(to_intel_colorop(colorop));
+}
diff --git a/drivers/gpu/drm/i915/display/intel_colorop.h b/drivers/gpu/drm/i915/display/intel_colorop.h
index 9276eee6e75a..638baf67d98d 100644
--- a/drivers/gpu/drm/i915/display/intel_colorop.h
+++ b/drivers/gpu/drm/i915/display/intel_colorop.h
@@ -13,5 +13,6 @@ struct intel_colorop;
 struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop);
 struct intel_colorop *intel_colorop_alloc(void);
 struct intel_colorop *intel_colorop_create(enum intel_color_block id);
+void intel_colorop_destroy(struct drm_colorop *colorop);
 
 #endif /* __INTEL_COLOROP_H__ */
-- 
2.25.1

