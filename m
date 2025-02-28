Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFEBA49559
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA1110EC3D;
	Fri, 28 Feb 2025 09:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjpe/ubX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5304A10EC38;
 Fri, 28 Feb 2025 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740735513; x=1772271513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AJ9Ni6NXPbPBQh/LX+irw/w8DHIQxobHYegrdwYtk4M=;
 b=cjpe/ubXqebHa9+SNstTHsJJUXUU7i5Ps4ydIJTBE3AbAilxp+s4gaJN
 E9l5AvkSYnAk67YI/AlFyko8e+EyYkBFcnvCaTaquby99/yGGeSQtBhpe
 i96nSiBIMCwtHbGDPD6eOcDwPw0oBRuuNmu+V1QevDbYNNoJ/o2gH4jZi
 Ubc+Si7DCMRN/qwMIgTFghMol1vXxbRmX5unW2/qUHLzjfh3k3/WrEPpQ
 O6NZ8cm+EISKQcRL+hCKCqqZzWzxRA0UhEt3OH0UBuBxWTCDN1SoKhsHk
 +Rohkhpn1MSvs7zDmN6Z6rgF32MvejfNdOmSF4RvJl3ywtJXRFdV+vhAz g==;
X-CSE-ConnectionGUID: jehAC0oRQn2HarxKfP310g==
X-CSE-MsgGUID: 7dEXFgxIT+i4b4NMjkRX3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52293076"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52293076"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:33 -0800
X-CSE-ConnectionGUID: p8t6H/nsS/SqB9KKKv+8zg==
X-CSE-MsgGUID: FDO+AIG0SO2tY6UP/gGYJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154466471"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:30 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, jani.saarinen@intel.com
Subject: [PATCH v10 3/9] drm/i915/display: update and store the plane damage
 clips
Date: Fri, 28 Feb 2025 11:37:56 +0200
Message-ID: <20250228093802.27091-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228093802.27091-1-vinod.govindapillai@intel.com>
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Userspace can pass damage area clips per plane to track
changes in a plane and some display components can utilze
these damage clips for efficiently handling use cases like
FBC, PSR etc. A merged damage area is generated and its
coordinates are updated relative to viewport and HW and
stored in the plane_state. This merged damage areas will be
used for FBC dirty rect support in xe3 in the follow-up
patch.

Big thanks to Ville Syrjala for his contribuitions in shaping
up of this series.

v1: - Move damage_merged helper to cover bigjoiner case and use
    the correct plane state for damage find helper (Ville)
    - Damage handling code under HAS_FBC_DIRTY_RECT() so the
    the related part will be executed only for xe3+
    - Changed dev_priv to i915 in one of the functions

v2: - damage reported is stored in the plane state after coords
      adjustmentments irrespective of fbc dirty rect support.
    - Damage to be empty in case of plane not visible (Ville)
    - Handle fb could be NULL and plane not visible cases (Ville)

v3: - No need to empty damage in case disp ver < 12 (Ville)
    - update to the patch subject

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c | 29 ++++++++++++
 .../drm/i915/display/intel_display_types.h    |  2 +
 .../drm/i915/display/skl_universal_plane.c    | 46 ++++++++++++++++++-
 3 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 05dcfa3bea73..1a3db29d4e60 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -36,6 +36,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -131,6 +132,7 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 	intel_state->ggtt_vma = NULL;
 	intel_state->dpt_vma = NULL;
 	intel_state->flags = 0;
+	intel_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
 
 	/* add reference to fb */
 	if (intel_state->hw.fb)
@@ -336,6 +338,25 @@ static void intel_plane_clear_hw_state(struct intel_plane_state *plane_state)
 	memset(&plane_state->hw, 0, sizeof(plane_state->hw));
 }
 
+static void
+intel_plane_copy_uapi_plane_damage(struct intel_plane_state *new_plane_state,
+				   const struct intel_plane_state *old_uapi_plane_state,
+				   const struct intel_plane_state *new_uapi_plane_state)
+{
+	struct intel_display *display = to_intel_display(new_plane_state);
+	struct drm_rect *damage = &new_plane_state->damage;
+
+	/* damage property tracking enabled from display version 12 onwards */
+	if (DISPLAY_VER(display) < 12)
+		return;
+
+	if (!drm_atomic_helper_damage_merged(&old_uapi_plane_state->uapi,
+					     &new_uapi_plane_state->uapi,
+					     damage))
+		/* Incase helper fails, mark whole plane region as damage */
+		*damage = drm_plane_state_src(&new_uapi_plane_state->uapi);
+}
+
 void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
 				       const struct intel_plane_state *from_plane_state,
 				       struct intel_crtc *crtc)
@@ -705,6 +726,7 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
 	const struct intel_plane_state *old_plane_state =
 		intel_atomic_get_old_plane_state(state, plane);
 	const struct intel_plane_state *new_primary_crtc_plane_state;
+	const struct intel_plane_state *old_primary_crtc_plane_state;
 	struct intel_crtc *crtc = intel_crtc_for_pipe(display, plane->pipe);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
@@ -719,10 +741,17 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
 
 		new_primary_crtc_plane_state =
 			intel_atomic_get_new_plane_state(state, primary_crtc_plane);
+		old_primary_crtc_plane_state =
+			intel_atomic_get_old_plane_state(state, primary_crtc_plane);
 	} else {
 		new_primary_crtc_plane_state = new_plane_state;
+		old_primary_crtc_plane_state = old_plane_state;
 	}
 
+	intel_plane_copy_uapi_plane_damage(new_plane_state,
+					   old_primary_crtc_plane_state,
+					   new_primary_crtc_plane_state);
+
 	intel_plane_copy_uapi_to_hw_state(new_plane_state,
 					  new_primary_crtc_plane_state,
 					  crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 4440521e3e9e..ec6ea9f2d9e7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -692,6 +692,8 @@ struct intel_plane_state {
 	u64 ccval;
 
 	const char *no_fbc_reason;
+
+	struct drm_rect damage;
 };
 
 struct intel_initial_plane_config {
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 3488c7ae6d8a..9564e991ef9f 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2270,6 +2270,44 @@ static void check_protection(struct intel_plane_state *plane_state)
 		!plane_state->decrypt;
 }
 
+static void
+make_damage_viewport_relative(struct intel_plane_state *plane_state)
+{
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	const struct drm_rect *src = &plane_state->uapi.src;
+	unsigned int rotation = plane_state->hw.rotation;
+	struct drm_rect *damage = &plane_state->damage;
+
+	if (!drm_rect_visible(damage))
+		return;
+
+	if (!fb || !plane_state->uapi.visible) {
+		plane_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
+		return;
+	}
+
+	if (drm_rotation_90_or_270(rotation)) {
+		drm_rect_rotate(damage, fb->width, fb->height,
+				DRM_MODE_ROTATE_270);
+		drm_rect_translate(damage, -(src->y1 >> 16), -(src->x1 >> 16));
+	} else {
+		drm_rect_translate(damage, -(src->x1 >> 16), -(src->y1 >> 16));
+	}
+}
+
+static void clip_damage(struct intel_plane_state *plane_state)
+{
+	struct drm_rect *damage = &plane_state->damage;
+	struct drm_rect src;
+
+	if (!drm_rect_visible(damage))
+		return;
+
+	drm_rect_fp_to_int(&src, &plane_state->uapi.src);
+	drm_rect_translate(damage, src.x1, src.y1);
+	drm_rect_intersect(damage, &src);
+}
+
 static int skl_plane_check(struct intel_crtc_state *crtc_state,
 			   struct intel_plane_state *plane_state)
 {
@@ -2295,6 +2333,8 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 	if (ret)
 		return ret;
 
+	make_damage_viewport_relative(plane_state);
+
 	ret = skl_check_plane_surface(plane_state);
 	if (ret)
 		return ret;
@@ -2310,6 +2350,8 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 	if (ret)
 		return ret;
 
+	clip_damage(plane_state);
+
 	ret = skl_plane_check_nv12_rotation(plane_state);
 	if (ret)
 		return ret;
@@ -2317,8 +2359,10 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 	check_protection(plane_state);
 
 	/* HW only has 8 bits pixel precision, disable plane if invisible */
-	if (!(plane_state->hw.alpha >> 8))
+	if (!(plane_state->hw.alpha >> 8)) {
 		plane_state->uapi.visible = false;
+		plane_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
+	}
 
 	plane_state->ctl = skl_plane_ctl(crtc_state, plane_state);
 
-- 
2.43.0

