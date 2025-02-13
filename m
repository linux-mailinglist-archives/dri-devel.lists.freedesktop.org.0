Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE0AA34047
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A50310EA9F;
	Thu, 13 Feb 2025 13:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSUIqgO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52B410EA9E;
 Thu, 13 Feb 2025 13:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739453189; x=1770989189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mM0Nb79O9rSA7GPOlC3NSzAO+zLVfgas1471J/kl0JE=;
 b=gSUIqgO+rNAr7bbKHPTIqlG+SVTgzBWYAtsmhF6CPT1/C/ZsNhb7YjHN
 CKgrqX2yXz8wjPJQDyrFuGhQGaDS7/43Tmyrq6Zit4LXCIft89HE67HvG
 k98qJlpwXuWzXDb7HUAEVxbRoQilXyvdMkSZdPEIfwDmaco2zI9ZxwV+O
 H/lPfWnEppX2aoigUTqGoTN//6klEm3Ae1zwqvjOIG+D6OBnwy17vo+Db
 w3b2xRa/fN9UmkBm+K9nWjhr0S3C20vdOTbOwJFJUqqRvJxyCc/mjiMs+
 jEaXi68xzjM7loCd1Tmm0g7YgUp8V8aCjIRI8w12ezZEXItw6fMroTuB9 Q==;
X-CSE-ConnectionGUID: 5adSJGHMTF2IpkF9PnTTig==
X-CSE-MsgGUID: YBqmJRUDSvW/cxsuZdabEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40025335"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40025335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:29 -0800
X-CSE-ConnectionGUID: +/DElHLITPuOwKo91C5Xew==
X-CSE-MsgGUID: 8PHfi9DARUqKbiq/T1hE9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113014237"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.251])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:26 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v8 2/7] drm/i915/display: update and store the plane damage
 clips
Date: Thu, 13 Feb 2025 15:25:53 +0200
Message-ID: <20250213132559.136815-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213132559.136815-1-vinod.govindapillai@intel.com>
References: <20250213132559.136815-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
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

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c | 29 ++++++++++++
 .../drm/i915/display/intel_display_types.h    |  2 +
 .../drm/i915/display/skl_universal_plane.c    | 46 ++++++++++++++++++-
 3 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 8a49d87d9bd9..2278412200fd 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -36,6 +36,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -117,6 +118,7 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 	intel_state->ggtt_vma = NULL;
 	intel_state->dpt_vma = NULL;
 	intel_state->flags = 0;
+	intel_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
 
 	/* add reference to fb */
 	if (intel_state->hw.fb)
@@ -322,6 +324,25 @@ static void intel_plane_clear_hw_state(struct intel_plane_state *plane_state)
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
@@ -691,6 +712,7 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
 	const struct intel_plane_state *old_plane_state =
 		intel_atomic_get_old_plane_state(state, plane);
 	const struct intel_plane_state *new_primary_crtc_plane_state;
+	const struct intel_plane_state *old_primary_crtc_plane_state;
 	struct intel_crtc *crtc = intel_crtc_for_pipe(display, plane->pipe);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
@@ -705,10 +727,17 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
 
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
index 6a82c6ade549..844f92ea4f45 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -697,6 +697,8 @@ struct intel_plane_state {
 	u64 ccval;
 
 	const char *no_fbc_reason;
+
+	struct drm_rect damage;
 };
 
 struct intel_initial_plane_config {
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index eb85d3d6cdc3..3e3c22a26357 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2260,6 +2260,44 @@ static void check_protection(struct intel_plane_state *plane_state)
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
@@ -2285,6 +2323,8 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 	if (ret)
 		return ret;
 
+	make_damage_viewport_relative(plane_state);
+
 	ret = skl_check_plane_surface(plane_state);
 	if (ret)
 		return ret;
@@ -2300,6 +2340,8 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 	if (ret)
 		return ret;
 
+	clip_damage(plane_state);
+
 	ret = skl_plane_check_nv12_rotation(plane_state);
 	if (ret)
 		return ret;
@@ -2307,8 +2349,10 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
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

