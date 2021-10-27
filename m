Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D947943D4F3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB00B6E928;
	Wed, 27 Oct 2021 21:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5846E91B;
 Wed, 27 Oct 2021 21:21:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230217444"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="230217444"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:36 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665154302"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:33 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Subject: [PATCH v3 14/17] drm/i915/dg2: Plane handling for Flat CCS and clear
 color
Date: Thu, 28 Oct 2021 02:53:36 +0530
Message-Id: <20211027212339.29259-15-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027212339.29259-1-ramalingam.c@intel.com>
References: <20211027212339.29259-1-ramalingam.c@intel.com>
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

From: Anshuman Gupta <anshuman.gupta@intel.com>

Handles the plane programing for flat ccs and clear color modifiers for
DG2

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  3 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  4 ++-
 drivers/gpu/drm/i915/display/intel_fb.c       | 30 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_fb.h       |  3 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |  6 ++--
 .../drm/i915/display/skl_universal_plane.c    | 21 ++++++++-----
 drivers/gpu/drm/i915/intel_pm.c               |  9 +++---
 7 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index f61a48e1a562..545784fb7bc9 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -355,7 +355,8 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
 		new_crtc_state->active_planes |= BIT(plane->id);
 
 	if (new_plane_state->uapi.visible &&
-	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
+	    intel_format_info_is_yuv_semiplanar(to_i915(fb->dev),
+						fb->format, fb->modifier))
 		new_crtc_state->nv12_planes |= BIT(plane->id);
 
 	if (new_plane_state->uapi.visible &&
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9b3913d73213..80626aec3747 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8595,7 +8595,9 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
 
 		/*
 		 * The layout of the fast clear color value expected by HW
-		 * (the DRM ABI requiring this value to be located in fb at offset 0 of plane#2):
+		 * (the DRM ABI requiring this value to be located in fb at
+		 * offset 0 of cc plane, plane#2 for non flat-ccs solutions and
+		 * plane#1 for flat-ccs based solutions):
 		 * - 4 x 4 bytes per-channel value
 		 *   (in surface type specific float/int format provided by the fb user)
 		 * - 8 bytes native color value used by the display
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 484ae1fd0e94..534018563cdb 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -427,7 +427,8 @@ bool intel_fb_plane_supports_modifier(struct intel_plane *plane, u64 modifier)
 	return false;
 }
 
-static bool format_is_yuv_semiplanar(const struct intel_modifier_desc *md,
+static bool format_is_yuv_semiplanar(const struct drm_i915_private *i915,
+				     const struct intel_modifier_desc *md,
 				     const struct drm_format_info *info)
 {
 	int yuv_planes;
@@ -435,7 +436,7 @@ static bool format_is_yuv_semiplanar(const struct intel_modifier_desc *md,
 	if (!info->is_yuv)
 		return false;
 
-	if (is_ccs_type_modifier(md, INTEL_CCS_ANY))
+	if (is_ccs_type_modifier(md, INTEL_CCS_ANY) && !!HAS_FLAT_CCS(i915))
 		yuv_planes = 4;
 	else
 		yuv_planes = 2;
@@ -451,16 +452,18 @@ static bool format_is_yuv_semiplanar(const struct intel_modifier_desc *md,
  * Returns:
  * %true if @info / @modifier is YUV semiplanar.
  */
-bool intel_format_info_is_yuv_semiplanar(const struct drm_format_info *info,
+bool intel_format_info_is_yuv_semiplanar(const struct drm_i915_private *i915,
+					 const struct drm_format_info *info,
 					 u64 modifier)
 {
-	return format_is_yuv_semiplanar(lookup_modifier(modifier), info);
+	return format_is_yuv_semiplanar(i915, lookup_modifier(modifier), info);
 }
 
-static u8 ccs_aux_plane_mask(const struct intel_modifier_desc *md,
+static u8 ccs_aux_plane_mask(const struct drm_i915_private *i915,
+			     const struct intel_modifier_desc *md,
 			     const struct drm_format_info *format)
 {
-	if (format_is_yuv_semiplanar(md, format))
+	if (format_is_yuv_semiplanar(i915, md, format))
 		return md->ccs.planar_aux_planes;
 	else
 		return md->ccs.packed_aux_planes;
@@ -478,7 +481,7 @@ bool intel_fb_is_ccs_aux_plane(const struct drm_framebuffer *fb, int color_plane
 {
 	const struct intel_modifier_desc *md = lookup_modifier(fb->modifier);
 
-	return ccs_aux_plane_mask(md, fb->format) & BIT(color_plane);
+	return ccs_aux_plane_mask(to_i915(fb->dev), md, fb->format) & BIT(color_plane);
 }
 
 /**
@@ -493,8 +496,11 @@ static bool intel_fb_is_gen12_ccs_aux_plane(const struct drm_framebuffer *fb, in
 {
 	const struct intel_modifier_desc *md = lookup_modifier(fb->modifier);
 
+	if (HAS_FLAT_CCS(to_i915(fb->dev)))
+		return false;
+
 	return check_modifier_display_ver_range(md, 12, 13) &&
-	       ccs_aux_plane_mask(md, fb->format) & BIT(color_plane);
+	       ccs_aux_plane_mask(to_i915(fb->dev), md, fb->format) & BIT(color_plane);
 }
 
 /**
@@ -524,8 +530,8 @@ static bool is_gen12_ccs_cc_plane(const struct drm_framebuffer *fb, int color_pl
 
 static bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane)
 {
-	return intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier) &&
-		color_plane == 1;
+	return intel_format_info_is_yuv_semiplanar(to_i915(fb->dev), fb->format,
+						   fb->modifier) && color_plane == 1;
 }
 
 bool is_surface_linear(const struct drm_framebuffer *fb, int color_plane)
@@ -590,10 +596,10 @@ int skl_main_to_aux_plane(const struct drm_framebuffer *fb, int main_plane)
 {
 	struct drm_i915_private *i915 = to_i915(fb->dev);
 
-	if (intel_fb_is_ccs_modifier(fb->modifier))
+	if (intel_fb_is_ccs_modifier(fb->modifier) && !HAS_FLAT_CCS(i915))
 		return main_to_ccs_plane(fb, main_plane);
 	else if (DISPLAY_VER(i915) < 11 &&
-		 intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
+		 intel_format_info_is_yuv_semiplanar(i915, fb->format, fb->modifier))
 		return 1;
 	else
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index 042ad81f8608..750f3f3a70b7 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -42,7 +42,8 @@ const struct drm_format_info *
 intel_fb_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
 
 bool
-intel_format_info_is_yuv_semiplanar(const struct drm_format_info *info,
+intel_format_info_is_yuv_semiplanar(const struct drm_i915_private *i915,
+				    const struct drm_format_info *info,
 				    u64 modifier);
 
 bool is_surface_linear(const struct drm_framebuffer *fb, int color_plane);
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index c2e94118566b..1bc0d98b252b 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -148,7 +148,7 @@ skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 		return 0;
 	}
 
-	if (format && intel_format_info_is_yuv_semiplanar(format, modifier) &&
+	if (format && intel_format_info_is_yuv_semiplanar(dev_priv, format, modifier) &&
 	    (src_h < SKL_MIN_YUV_420_SRC_H || src_w < SKL_MIN_YUV_420_SRC_W)) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "Planar YUV: src dimensions not met\n");
@@ -224,7 +224,7 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 
 	/* Pre-gen11 and SDR planes always need a scaler for planar formats. */
 	if (!icl_is_hdr_plane(dev_priv, intel_plane->id) &&
-	    fb && intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
+	    fb && intel_format_info_is_yuv_semiplanar(dev_priv, fb->format, fb->modifier))
 		need_scaler = true;
 
 	ret = skl_update_scaler(crtc_state, force_detach,
@@ -481,7 +481,7 @@ skl_program_plane_scaler(struct intel_plane *plane,
 				      0, INT_MAX);
 
 	/* TODO: handle sub-pixel coordinates */
-	if (intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier) &&
+	if (intel_format_info_is_yuv_semiplanar(dev_priv, fb->format, fb->modifier) &&
 	    !icl_is_hdr_plane(dev_priv, plane->id)) {
 		y_hphase = skl_scaler_calc_phase(1, hscale, false);
 		y_vphase = skl_scaler_calc_phase(1, vscale, false);
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 136b3f74a290..13cd95a7d827 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -823,8 +823,9 @@ static u32 icl_plane_ctl_flip(unsigned int reflect)
 static u32 adlp_plane_ctl_arb_slots(const struct intel_plane_state *plane_state)
 {
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	struct drm_i915_private *i915 = to_i915(fb->dev);
 
-	if (intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
+	if (intel_format_info_is_yuv_semiplanar(i915, fb->format, fb->modifier)) {
 		switch (fb->format->cpp[0]) {
 		case 2:
 			return PLANE_CTL_ARB_SLOTS(1);
@@ -1077,7 +1078,9 @@ skl_program_plane(struct intel_plane *plane,
 	intel_de_write_fw(dev_priv, PLANE_SIZE(pipe, plane_id),
 			  (src_h << 16) | src_w);
 
-	intel_de_write_fw(dev_priv, PLANE_AUX_DIST(pipe, plane_id), aux_dist);
+	/* FLAT CCS doesn't need to program AUX_DIST */
+	if (!HAS_FLAT_CCS(dev_priv))
+		intel_de_write_fw(dev_priv, PLANE_AUX_DIST(pipe, plane_id), aux_dist);
 
 	if (icl_is_hdr_plane(dev_priv, plane_id))
 		intel_de_write_fw(dev_priv, PLANE_CUS_CTL(pipe, plane_id),
@@ -1300,11 +1303,12 @@ static int skl_plane_check_dst_coordinates(const struct intel_crtc_state *crtc_s
 static int skl_plane_check_nv12_rotation(const struct intel_plane_state *plane_state)
 {
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	struct drm_i915_private *i915 = to_i915(fb->dev);
 	unsigned int rotation = plane_state->hw.rotation;
 	int src_w = drm_rect_width(&plane_state->uapi.src) >> 16;
 
 	/* Display WA #1106 */
-	if (intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier) &&
+	if (intel_format_info_is_yuv_semiplanar(i915, fb->format, fb->modifier) &&
 	    src_w & 3 &&
 	    (rotation == DRM_MODE_ROTATE_270 ||
 	     rotation == (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90))) {
@@ -1325,7 +1329,7 @@ static int skl_plane_max_scale(struct drm_i915_private *dev_priv,
 	 * FIXME need to properly check this later.
 	 */
 	if (DISPLAY_VER(dev_priv) >= 10 ||
-	    !intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
+	    !intel_format_info_is_yuv_semiplanar(dev_priv, fb->format, fb->modifier))
 		return 0x30000 - 1;
 	else
 		return 0x20000 - 1;
@@ -1493,8 +1497,9 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 	/*
 	 * CCS AUX surface doesn't have its own x/y offsets, we must make sure
 	 * they match with the main surface x/y offsets.
+	 * On DG2 with Flat-CCS, there's no aux plane on fb so skip this checking.
 	 */
-	if (intel_fb_is_ccs_modifier(fb->modifier)) {
+	if (intel_fb_is_ccs_modifier(fb->modifier) && !HAS_FLAT_CCS(dev_priv)) {
 		while (!skl_check_main_ccs_coordinates(plane_state, x, y,
 						       offset, aux_plane)) {
 			if (offset == 0)
@@ -1558,7 +1563,7 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 	offset = intel_plane_compute_aligned_offset(&x, &y,
 						    plane_state, uv_plane);
 
-	if (intel_fb_is_ccs_modifier(fb->modifier)) {
+	if (intel_fb_is_ccs_modifier(fb->modifier) && !HAS_FLAT_CCS(i915)) {
 		int ccs_plane = main_to_ccs_plane(fb, uv_plane);
 		u32 aux_offset = plane_state->view.color_plane[ccs_plane].offset;
 		u32 alignment = intel_surf_alignment(fb, uv_plane);
@@ -1662,7 +1667,7 @@ static int skl_check_plane_surface(struct intel_plane_state *plane_state)
 			return ret;
 	}
 
-	if (intel_format_info_is_yuv_semiplanar(fb->format,
+	if (intel_format_info_is_yuv_semiplanar(to_i915(fb->dev), fb->format,
 						fb->modifier)) {
 		ret = skl_check_nv12_aux_surface(plane_state);
 		if (ret)
@@ -1765,7 +1770,7 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 		plane_state->color_ctl = glk_plane_color_ctl(crtc_state,
 							     plane_state);
 
-	if (intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier) &&
+	if (intel_format_info_is_yuv_semiplanar(dev_priv, fb->format, fb->modifier) &&
 	    icl_is_hdr_plane(dev_priv, plane->id))
 		/* Enable and use MPEG-2 chroma siting */
 		plane_state->cus_ctl = PLANE_CUS_ENABLE |
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 1ac1af0a7f2d..b3d29ea9fe77 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -4926,7 +4926,8 @@ skl_plane_relative_data_rate(const struct intel_crtc_state *crtc_state,
 		return 0;
 
 	if (color_plane == 1 &&
-	    !intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
+	    !intel_format_info_is_yuv_semiplanar(to_i915(fb->dev), fb->format,
+						 fb->modifier))
 		return 0;
 
 	/*
@@ -5367,11 +5368,11 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	bool planar = intel_format_info_is_yuv_semiplanar(dev_priv, format, modifier);
 	u32 interm_pbpl;
 
 	/* only planar format has two planes */
-	if (color_plane == 1 &&
-	    !intel_format_info_is_yuv_semiplanar(format, modifier)) {
+	if (color_plane == 1 && !planar) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "Non planar format have single plane\n");
 		return -EINVAL;
@@ -5385,7 +5386,7 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 	wp->x_tiled = modifier == I915_FORMAT_MOD_X_TILED;
 	wp->rc_surface = modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
 			 modifier == I915_FORMAT_MOD_Yf_TILED_CCS;
-	wp->is_planar = intel_format_info_is_yuv_semiplanar(format, modifier);
+	wp->is_planar = planar;
 
 	wp->width = width;
 	if (color_plane == 1 && wp->is_planar)
-- 
2.20.1

