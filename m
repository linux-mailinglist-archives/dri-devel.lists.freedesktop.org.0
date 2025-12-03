Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F963C9E470
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E950B10E772;
	Wed,  3 Dec 2025 08:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8pD1RcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6356310E73E;
 Wed,  3 Dec 2025 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751287; x=1796287287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dkCiPo2A+WVZDUuOPgp7H6G72+R1CLBJgA/d0vllnXk=;
 b=a8pD1RcJCOzASBjbrhxTMq7yUaCRisAgp+/awKyyvvoQISwR0hzxtO52
 yD1F/QUnuuV+Peco+BtzoiblSlS11r4JFmrdwM7aczOQE2IpLNQ4tFS+8
 Xbea6aSu7nTKGw8Un43SWLLQ2+laj0XOjNCz/FPn1ojhllrd4uU41l3Mh
 NxpYX/MhLvajDB1vTs/hv9mUXqUMIBBxgKwWihRqxhlySc5QWSvJGfuJo
 w0PjpfxmwUQDbWu92rC2y5ty38NmX4YALwMmu1FKZ9YPXA2gbKFznLK0F
 4funmScfxTgjNVoh/B18gBRjgDgKnH0C5xcN3GDJO/XAtlXunY0PS/Uci g==;
X-CSE-ConnectionGUID: ItPJ3CpnSx6tDjcxqTA/Hw==
X-CSE-MsgGUID: 2rom8dC7SaW4GeDjsvrDFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66812231"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66812231"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:41:27 -0800
X-CSE-ConnectionGUID: sNd4sCprSN+BKusY41G2uA==
X-CSE-MsgGUID: h0ybrG22Tee16TGGk45uJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="217945638"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 00:41:23 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v8 14/15] drm/i915/color: Add 3D LUT to color pipeline
Date: Wed,  3 Dec 2025 14:22:10 +0530
Message-ID: <20251203085211.3663374-15-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203085211.3663374-1-uma.shankar@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add helpers to program the 3D LUT registers and arm them.

LUT_3D_READY in LUT_3D_CLT is cleared off by the HW once
the LUT buffer is loaded into it's internal working RAM.
So by the time we try to load/commit new values, we expect
it to be cleared off. If not, log an error and return
without writing new values. Do it only when writing with MMIO.
There is no way to read register within DSB execution.

v2:
- Add information regarding LUT_3D_READY to commit message (Jani)
- Log error instead of a drm_warn and return without committing changes
  if 3DLUT HW is not ready to accept new values.
- Refactor intel_color_crtc_has_3dlut()
  Also remove Gen10 check (Suraj)
v3:
- Addressed review comments (Suraj)

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c    | 78 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h    |  4 +
 .../drm/i915/display/intel_color_pipeline.c   | 29 +++++--
 .../drm/i915/display/intel_color_pipeline.h   |  3 +-
 .../drm/i915/display/intel_display_limits.h   |  1 +
 .../drm/i915/display/intel_display_types.h    |  2 +-
 drivers/gpu/drm/i915/display/intel_plane.c    |  2 +
 7 files changed, 112 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 08f3b5b47b8e..e7950655434b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4062,6 +4062,52 @@ xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_state *pla
 		xelpd_program_plane_post_csc_lut(dsb, plane_state);
 }
 
+static u32 glk_3dlut_10(const struct drm_color_lut32 *color)
+{
+	return REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, drm_color_lut32_extract(color->red, 10)) |
+		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, drm_color_lut32_extract(color->green, 10)) |
+		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, drm_color_lut32_extract(color->blue, 10));
+}
+
+static void glk_load_lut_3d(struct intel_dsb *dsb,
+			    struct intel_crtc *crtc,
+			    const struct drm_property_blob *blob)
+{
+	struct intel_display *display = to_intel_display(crtc->base.dev);
+	const struct drm_color_lut32 *lut = blob->data;
+	int i, lut_size = drm_color_lut32_size(blob);
+	enum pipe pipe = crtc->pipe;
+
+	if (!dsb && intel_de_read(display, LUT_3D_CTL(pipe)) & LUT_3D_READY) {
+		drm_err(display->drm, "[CRTC:%d:%s] 3D LUT not ready, not loading LUTs\n",
+			crtc->base.base.id, crtc->base.name);
+		return;
+	}
+
+	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe), LUT_3D_AUTO_INCREMENT);
+	for (i = 0; i < lut_size; i++)
+		intel_de_write_dsb(display, dsb, LUT_3D_DATA(pipe), glk_3dlut_10(&lut[i]));
+	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe), 0);
+}
+
+static void glk_lut_3d_commit(struct intel_dsb *dsb, struct intel_crtc *crtc, bool enable)
+{
+	struct intel_display *display = to_intel_display(crtc);
+	enum pipe pipe = crtc->pipe;
+	u32 val = 0;
+
+	if (!dsb && intel_de_read(display, LUT_3D_CTL(pipe)) & LUT_3D_READY) {
+		drm_err(display->drm, "[CRTC:%d:%s] 3D LUT not ready, not committing change\n",
+			crtc->base.base.id, crtc->base.name);
+		return;
+	}
+
+	if (enable)
+		val = LUT_3D_ENABLE | LUT_3D_READY | LUT_3D_BIND_PLANE_1;
+
+	intel_de_write_dsb(display, dsb, LUT_3D_CTL(pipe), val);
+}
+
 static const struct intel_color_funcs chv_color_funcs = {
 	.color_check = chv_color_check,
 	.color_commit_arm = i9xx_color_commit_arm,
@@ -4191,6 +4237,16 @@ static const struct intel_color_funcs ilk_color_funcs = {
 	.get_config = ilk_get_config,
 };
 
+void intel_color_plane_commit_arm(struct intel_dsb *dsb,
+				  const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
+
+	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
+		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
+}
+
 static void
 intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
 				  const struct intel_plane_state *plane_state)
@@ -4211,6 +4267,26 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
 		display->funcs.color->load_plane_luts(dsb, plane_state);
 }
 
+bool
+intel_color_crtc_has_3dlut(struct intel_display *display, enum pipe pipe)
+{
+	if (DISPLAY_VER(display) >= 12)
+		return pipe == PIPE_A || pipe == PIPE_B;
+	else
+		return false;
+}
+
+static void
+intel_color_load_3dlut(struct intel_dsb *dsb,
+		       const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
+
+	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
+		glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d);
+}
+
 void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
 					const struct intel_plane_state *plane_state)
 {
@@ -4218,6 +4294,8 @@ void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
 		intel_color_load_plane_csc_matrix(dsb, plane_state);
 	if (plane_state->hw.degamma_lut || plane_state->hw.gamma_lut)
 		intel_color_load_plane_luts(dsb, plane_state);
+	if (plane_state->hw.lut_3d)
+		intel_color_load_3dlut(dsb, plane_state);
 }
 
 void intel_color_crtc_init(struct intel_crtc *crtc)
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 8051c827a1d8..c21b9bdf7bb8 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -15,6 +15,7 @@ struct intel_display;
 struct intel_dsb;
 struct intel_plane_state;
 struct drm_property_blob;
+enum pipe;
 
 void intel_color_init_hooks(struct intel_display *display);
 int intel_color_init(struct intel_display *display);
@@ -43,4 +44,7 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
 					const struct intel_plane_state *plane_state);
+void intel_color_plane_commit_arm(struct intel_dsb *dsb,
+				  const struct intel_plane_state *plane_state);
+bool intel_color_crtc_has_3dlut(struct intel_display *display, enum pipe pipe);
 #endif /* __INTEL_COLOR_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 489d470cd011..942d9b9c93ce 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2025 Intel Corporation
  */
+#include "intel_color.h"
 #include "intel_colorop.h"
 #include "intel_color_pipeline.h"
 #include "intel_de.h"
@@ -13,12 +14,14 @@
 #define PLANE_GAMMA_SIZE 32
 
 static
-int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
+int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list,
+				     enum pipe pipe)
 {
-	struct intel_colorop *colorop;
 	struct drm_device *dev = plane->dev;
-	int ret;
+	struct intel_display *display = to_intel_display(dev);
 	struct drm_colorop *prev_op;
+	struct intel_colorop *colorop;
+	int ret;
 
 	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
 
@@ -36,6 +39,22 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	/* TODO: handle failures and clean up */
 	prev_op = &colorop->base;
 
+	if (DISPLAY_VER(display) >= 35 &&
+	    intel_color_crtc_has_3dlut(display, pipe) &&
+	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
+		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
+
+		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, 17,
+						   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+						   true);
+		if (ret)
+			return ret;
+
+		drm_colorop_set_next_property(prev_op, &colorop->base);
+
+		prev_op = &colorop->base;
+	}
+
 	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
 	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
 					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
@@ -58,7 +77,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	return 0;
 }
 
-int intel_color_pipeline_plane_init(struct drm_plane *plane)
+int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
 {
 	struct drm_device *dev = plane->dev;
 	struct intel_display *display = to_intel_display(dev);
@@ -71,7 +90,7 @@ int intel_color_pipeline_plane_init(struct drm_plane *plane)
 		return 0;
 
 	/* Add pipeline consisting of transfer functions */
-	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
+	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
 	if (ret)
 		return ret;
 	len++;
diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.h b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
index 7f1d32bc9202..a457d306da7f 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.h
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
@@ -7,7 +7,8 @@
 #define __INTEL_COLOR_PIPELINE_H__
 
 struct drm_plane;
+enum pipe;
 
-int intel_color_pipeline_plane_init(struct drm_plane *plane);
+int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe);
 
 #endif /* __INTEL_COLOR_PIPELINE_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index 55fd574ba313..cb3c9c665c44 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -142,6 +142,7 @@ enum intel_color_block {
 	INTEL_PLANE_CB_PRE_CSC_LUT,
 	INTEL_PLANE_CB_CSC,
 	INTEL_PLANE_CB_POST_CSC_LUT,
+	INTEL_PLANE_CB_3DLUT,
 
 	INTEL_CB_MAX
 };
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 499ed3685e21..3c08ef5bb611 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -646,7 +646,7 @@ struct intel_plane_state {
 		enum drm_color_encoding color_encoding;
 		enum drm_color_range color_range;
 		enum drm_scaling_filter scaling_filter;
-		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut;
+		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut, *lut_3d;
 	} hw;
 
 	struct i915_vma *ggtt_vma;
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index a73ce9ce3214..36849cd56c02 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -352,6 +352,8 @@ intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
 		return	drm_property_replace_blob(&plane_state->hw.degamma_lut, blob);
 	else if (intel_colorop->id == INTEL_PLANE_CB_POST_CSC_LUT)
 		return drm_property_replace_blob(&plane_state->hw.gamma_lut, blob);
+	else if (intel_colorop->id == INTEL_PLANE_CB_3DLUT)
+		return	drm_property_replace_blob(&plane_state->hw.lut_3d, blob);
 
 	return false;
 }
-- 
2.50.1

