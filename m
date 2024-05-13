Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B758C469A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 20:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6928A10E8EE;
	Mon, 13 May 2024 17:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LH6ZI5en";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE23010E8DD;
 Mon, 13 May 2024 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715623194; x=1747159194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vaw26t/HbV69Yr3r8K9cZvu23WLFIbFsCiMN4mrTprE=;
 b=LH6ZI5enGaDkKFZBtuWIyAHMmLOxRO61fvaeNUmO2f1FhN4pKmNAwhZ9
 pWQl/7BpLWFrC4iDKTNIhd3lptGF1gi95PcVmQ/AnZi+bOy+cAKMBEmfe
 2g8+gVl3vBjHkt8qdMDVfg42mq6++LUVl2oosQoBKgaV9Z59EoE8K8knD
 8qdgqrbraZEGRszV+dGvlgTP1kvICbyE+rV5Q0VVdVc7u9A7Jb2UFD6u+
 Wnbb18QfcZtZAwuRd408PsGZZPdZvGStyuxhdSGMepidb3Srx58VuRo7j
 xB4ERlT0Iba8qh2jsmkb585H9/any0teZqnfxQp038TMCiCvrCqHatMt9 w==;
X-CSE-ConnectionGUID: S++Iz5IbQyekOrdgkK/CbQ==
X-CSE-MsgGUID: N2Pd9xC3TaqhIFAcc1x1sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14517947"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="14517947"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:59:53 -0700
X-CSE-ConnectionGUID: MQnALK3GQ3+Ts6bV7kwtQA==
X-CSE-MsgGUID: cQ+ZqCvpRuWWDNLgFXoPzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30395182"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 May 2024 10:59:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 May 2024 20:59:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/i915: Introduce plane->min_alignment() vfunc
Date: Mon, 13 May 2024 20:59:36 +0300
Message-ID: <20240513175942.12910-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Different hardware generations have different scanout alignment
requirements. Introduce a new vfunc that will allow us to
make that distinction without horrible if-ladders.

For now we directly plug in the existing intel_surf_alignment()
and intel_cursor_alignment() functions.

For fbdev we (temporarily) introduce intel_fbdev_min_alignment()
that simply queries the alignment from the primary plane of
the first crtc.

TODO: someone will need to fix xe's alignment handling

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  8 ++--
 drivers/gpu/drm/i915/display/intel_cursor.c   |  2 +
 .../drm/i915/display/intel_display_types.h    |  3 ++
 drivers/gpu/drm/i915/display/intel_fb.c       | 22 +++++-----
 drivers/gpu/drm/i915/display/intel_fb.h       |  7 +++-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   | 40 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_fb_pin.h   |  3 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 21 +++++++++-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  2 +
 .../drm/i915/display/skl_universal_plane.c    | 11 +++--
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  3 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  4 +-
 12 files changed, 89 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index ea4d8ba55ad8..85dbf5b950e2 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -224,8 +224,8 @@ static u32 i9xx_plane_ctl(const struct intel_crtc_state *crtc_state,
 
 int i9xx_check_plane_surface(struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	int src_x, src_y, src_w;
 	u32 offset;
@@ -266,7 +266,7 @@ int i9xx_check_plane_surface(struct intel_plane_state *plane_state)
 	 * despite them not using the linear offset anymore.
 	 */
 	if (DISPLAY_VER(dev_priv) >= 4 && fb->modifier == I915_FORMAT_MOD_X_TILED) {
-		unsigned int alignment = intel_surf_alignment(fb, 0);
+		unsigned int alignment = plane->min_alignment(plane, fb, 0);
 		int cpp = fb->format->cpp[0];
 
 		while ((src_x + src_w) * cpp > plane_state->view.color_plane[0].mapping_stride) {
@@ -867,6 +867,8 @@ intel_primary_plane_create(struct drm_i915_private *dev_priv, enum pipe pipe)
 			plane->max_stride = ilk_primary_max_stride;
 	}
 
+	plane->min_alignment = intel_surf_alignment;
+
 	if (IS_I830(dev_priv) || IS_I845G(dev_priv)) {
 		plane->update_arm = i830_plane_update_arm;
 	} else {
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 2118b87ccb10..026975f569a7 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -896,6 +896,8 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 		cursor->check_plane = i9xx_check_cursor;
 	}
 
+	cursor->min_alignment = intel_cursor_alignment;
+
 	cursor->cursor.base = ~0;
 	cursor->cursor.cntl = ~0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index fec3de25ea54..40d6e5f4c350 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1550,6 +1550,9 @@ struct intel_plane {
 	int (*max_height)(const struct drm_framebuffer *fb,
 			  int color_plane,
 			  unsigned int rotation);
+	unsigned int (*min_alignment)(struct intel_plane *plane,
+				      const struct drm_framebuffer *fb,
+				      int color_plane);
 	unsigned int (*max_stride)(struct intel_plane *plane,
 				   u32 pixel_format, u64 modifier,
 				   unsigned int rotation);
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index b6638726949d..3f3a9cd534f4 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -775,8 +775,12 @@ bool intel_fb_uses_dpt(const struct drm_framebuffer *fb)
 		intel_fb_modifier_uses_dpt(to_i915(fb->dev), fb->modifier);
 }
 
-unsigned int intel_cursor_alignment(const struct drm_i915_private *i915)
+unsigned int intel_cursor_alignment(struct intel_plane *plane,
+				    const struct drm_framebuffer *fb,
+				    int color_plane)
 {
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+
 	if (IS_I830(i915))
 		return 16 * 1024;
 	else if (IS_I85X(i915))
@@ -800,10 +804,11 @@ static unsigned int intel_linear_alignment(const struct drm_i915_private *dev_pr
 		return 0;
 }
 
-unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
+unsigned int intel_surf_alignment(struct intel_plane *plane,
+				  const struct drm_framebuffer *fb,
 				  int color_plane)
 {
-	struct drm_i915_private *dev_priv = to_i915(fb->dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 
 	if (intel_fb_uses_dpt(fb)) {
 		/* AUX_DIST needs only 4K alignment */
@@ -1098,17 +1103,12 @@ u32 intel_plane_compute_aligned_offset(int *x, int *y,
 				       const struct intel_plane_state *state,
 				       int color_plane)
 {
-	struct intel_plane *intel_plane = to_intel_plane(state->uapi.plane);
-	struct drm_i915_private *i915 = to_i915(intel_plane->base.dev);
+	struct intel_plane *plane = to_intel_plane(state->uapi.plane);
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb = state->hw.fb;
 	unsigned int rotation = state->hw.rotation;
 	unsigned int pitch = state->view.color_plane[color_plane].mapping_stride;
-	unsigned int alignment;
-
-	if (intel_plane->id == PLANE_CURSOR)
-		alignment = intel_cursor_alignment(i915);
-	else
-		alignment = intel_surf_alignment(fb, color_plane);
+	unsigned int alignment = plane->min_alignment(plane, fb, color_plane);
 
 	return intel_compute_aligned_offset(i915, x, y, fb, color_plane,
 					    pitch, rotation, alignment);
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index 23db6628f53e..86c01a3ce81e 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -60,8 +60,11 @@ unsigned int intel_tile_height(const struct drm_framebuffer *fb, int color_plane
 unsigned int intel_tile_row_size(const struct drm_framebuffer *fb, int color_plane);
 unsigned int intel_fb_align_height(const struct drm_framebuffer *fb,
 				   int color_plane, unsigned int height);
-unsigned int intel_cursor_alignment(const struct drm_i915_private *i915);
-unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
+unsigned int intel_cursor_alignment(struct intel_plane *plane,
+				    const struct drm_framebuffer *fb,
+				    int color_plane);
+unsigned int intel_surf_alignment(struct intel_plane *plane,
+				  const struct drm_framebuffer *fb,
 				  int color_plane);
 
 void intel_fb_plane_get_subsampling(int *hsub, int *vsub,
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 1acc11fa19f4..9b0f1ea41b70 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -103,8 +103,9 @@ intel_fb_pin_to_dpt(const struct drm_framebuffer *fb,
 
 struct i915_vma *
 intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
-		     bool phys_cursor,
 		     const struct i915_gtt_view *view,
+		     unsigned int alignment,
+		     unsigned int phys_alignment,
 		     bool uses_fence,
 		     unsigned long *out_flags)
 {
@@ -113,7 +114,6 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	intel_wakeref_t wakeref;
 	struct i915_gem_ww_ctx ww;
-	unsigned int alignment;
 	struct i915_vma *vma;
 	unsigned int pinctl;
 	int ret;
@@ -121,10 +121,6 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
 	if (drm_WARN_ON(dev, !i915_gem_object_is_framebuffer(obj)))
 		return ERR_PTR(-EINVAL);
 
-	if (phys_cursor)
-		alignment = intel_cursor_alignment(dev_priv);
-	else
-		alignment = intel_surf_alignment(fb, 0);
 	if (drm_WARN_ON(dev, alignment && !is_power_of_2(alignment)))
 		return ERR_PTR(-EINVAL);
 
@@ -162,8 +158,8 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
 	i915_gem_ww_ctx_init(&ww, true);
 retry:
 	ret = i915_gem_object_lock(obj, &ww);
-	if (!ret && phys_cursor)
-		ret = i915_gem_object_attach_phys(obj, alignment);
+	if (!ret && phys_alignment)
+		ret = i915_gem_object_attach_phys(obj, phys_alignment);
 	else if (!ret && HAS_LMEM(dev_priv))
 		ret = i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM_0);
 	if (!ret)
@@ -234,6 +230,27 @@ void intel_fb_unpin_vma(struct i915_vma *vma, unsigned long flags)
 	i915_vma_put(vma);
 }
 
+static unsigned int
+intel_plane_fb_min_alignment(const struct intel_plane_state *plane_state)
+{
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
+
+	return plane->min_alignment(plane, fb, 0);
+}
+
+static unsigned int
+intel_plane_fb_min_phys_alignment(const struct intel_plane_state *plane_state)
+{
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
+
+	if (!intel_plane_needs_physical(plane))
+		return 0;
+
+	return plane->min_alignment(plane, fb, 0);
+}
+
 int intel_plane_pin_fb(struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
@@ -242,8 +259,9 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state)
 	struct i915_vma *vma;
 
 	if (!intel_fb_uses_dpt(&fb->base)) {
-		vma = intel_fb_pin_to_ggtt(&fb->base, intel_plane_needs_physical(plane),
-					   &plane_state->view.gtt,
+		vma = intel_fb_pin_to_ggtt(&fb->base, &plane_state->view.gtt,
+					   intel_plane_fb_min_alignment(plane_state),
+					   intel_plane_fb_min_phys_alignment(plane_state),
 					   intel_plane_uses_fence(plane_state),
 					   &plane_state->flags);
 		if (IS_ERR(vma))
@@ -261,7 +279,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state)
 			plane_state->phys_dma_addr =
 				i915_gem_object_get_dma_address(intel_fb_obj(&fb->base), 0);
 	} else {
-		unsigned int alignment = intel_surf_alignment(&fb->base, 0);
+		unsigned int alignment = intel_plane_fb_min_alignment(plane_state);
 
 		vma = intel_dpt_pin_to_ggtt(fb->dpt_vm, alignment / 512);
 		if (IS_ERR(vma))
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.h b/drivers/gpu/drm/i915/display/intel_fb_pin.h
index 3f8245edcd15..ac0319b53af0 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.h
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.h
@@ -15,8 +15,9 @@ struct i915_gtt_view;
 
 struct i915_vma *
 intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
-		     bool phys_cursor,
 		     const struct i915_gtt_view *view,
+		     unsigned int alignment,
+		     unsigned int phys_alignment,
 		     bool uses_fence,
 		     unsigned long *out_flags);
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 5ad0b4c8a0fd..ff685aebbd1a 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -46,6 +46,7 @@
 #include "gem/i915_gem_mman.h"
 
 #include "i915_drv.h"
+#include "intel_crtc.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
@@ -171,6 +172,21 @@ static const struct fb_ops intelfb_ops = {
 
 __diag_pop();
 
+static unsigned int intel_fbdev_min_alignment(const struct drm_framebuffer *fb)
+{
+	struct drm_i915_private *i915 = to_i915(fb->dev);
+	struct intel_plane *plane;
+	struct intel_crtc *crtc;
+
+	crtc = intel_first_crtc(i915);
+	if (!crtc)
+		return 0;
+
+	plane = to_intel_plane(crtc->base.primary);
+
+	return plane->min_alignment(plane, fb, 0);
+}
+
 static int intelfb_create(struct drm_fb_helper *helper,
 			  struct drm_fb_helper_surface_size *sizes)
 {
@@ -227,8 +243,9 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	 * This also validates that any existing fb inherited from the
 	 * BIOS is suitable for own access.
 	 */
-	vma = intel_fb_pin_to_ggtt(&fb->base, false,
-				   &view, false, &flags);
+	vma = intel_fb_pin_to_ggtt(&fb->base, &view,
+				   intel_fbdev_min_alignment(&fb->base), 0,
+				   false, &flags);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		goto out_unlock;
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 36a253a19c74..1727d98d1339 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1623,6 +1623,8 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 		}
 	}
 
+	plane->min_alignment = intel_surf_alignment;
+
 	if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_B) {
 		supported_rotations =
 			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 7b79704fa674..27782f5060ad 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1615,11 +1615,12 @@ skl_check_main_ccs_coordinates(struct intel_plane_state *plane_state,
 			       int main_x, int main_y, u32 main_offset,
 			       int ccs_plane)
 {
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	int aux_x = plane_state->view.color_plane[ccs_plane].x;
 	int aux_y = plane_state->view.color_plane[ccs_plane].y;
 	u32 aux_offset = plane_state->view.color_plane[ccs_plane].offset;
-	unsigned int alignment = intel_surf_alignment(fb, ccs_plane);
+	unsigned int alignment = plane->min_alignment(plane, fb, ccs_plane);
 	int hsub;
 	int vsub;
 
@@ -1663,7 +1664,7 @@ int skl_calc_main_surface_offset(const struct intel_plane_state *plane_state,
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	int aux_plane = skl_main_to_aux_plane(fb, 0);
 	u32 aux_offset = plane_state->view.color_plane[aux_plane].offset;
-	unsigned int alignment = intel_surf_alignment(fb, 0);
+	unsigned int alignment = plane->min_alignment(plane, fb, 0);
 	int w = drm_rect_width(&plane_state->uapi.src) >> 16;
 
 	intel_add_fb_offsets(x, y, plane_state, 0);
@@ -1719,7 +1720,7 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 	int min_width = intel_plane_min_width(plane, fb, 0, rotation);
 	int max_width = intel_plane_max_width(plane, fb, 0, rotation);
 	int max_height = intel_plane_max_height(plane, fb, 0, rotation);
-	unsigned int alignment = intel_surf_alignment(fb, 0);
+	unsigned int alignment = plane->min_alignment(plane, fb, 0);
 	int aux_plane = skl_main_to_aux_plane(fb, 0);
 	u32 offset;
 	int ret;
@@ -1808,7 +1809,7 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 
 	if (ccs_plane) {
 		u32 aux_offset = plane_state->view.color_plane[ccs_plane].offset;
-		unsigned int alignment = intel_surf_alignment(fb, uv_plane);
+		unsigned int alignment = plane->min_alignment(plane, fb, uv_plane);
 
 		if (offset > aux_offset)
 			offset = intel_plane_adjust_aligned_offset(&x, &y,
@@ -2366,6 +2367,8 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	else
 		plane->max_stride = skl_plane_max_stride;
 
+	plane->min_alignment = intel_surf_alignment;
+
 	if (DISPLAY_VER(dev_priv) >= 11) {
 		plane->update_noarm = icl_plane_update_noarm;
 		plane->update_arm = icl_plane_update_arm;
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 36e15c4961c1..0319941b7e1e 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -334,8 +334,9 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 struct i915_vma *
 intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
-		     bool phys_cursor,
 		     const struct i915_gtt_view *view,
+		     unsigned int alignment,
+		     unsigned int phys_alignment,
 		     bool uses_fence,
 		     unsigned long *out_flags)
 {
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 9eaa29e733e1..a9d6c31cb683 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -211,8 +211,8 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	intel_fb_fill_view(to_intel_framebuffer(fb),
 			   plane_state->uapi.rotation, &plane_state->view);
 
-	vma = intel_fb_pin_to_ggtt(fb, false, &plane_state->view.gtt,
-				   false, &plane_state->flags);
+	vma = intel_fb_pin_to_ggtt(fb, &plane_state->view.gtt,
+				   0, 0, false, &plane_state->flags);
 	if (IS_ERR(vma))
 		goto nofb;
 
-- 
2.43.2

