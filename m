Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EE4C9E423
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0240310E744;
	Wed,  3 Dec 2025 08:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkOKx/gS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74C710E744;
 Wed,  3 Dec 2025 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751244; x=1796287244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDnhFxvikBbhTGJL8ex9E93dvimUf3iYQhhl+ug3iNY=;
 b=LkOKx/gS7k8zoiybLZCKpGBGRjKsqtMsSgYGkgJhtdP92FyfqlojATtO
 nlHzFfL1M/CLJPexX91Op9gOyEIzcr2It9xEuzl0fg0A/SzQN+p1WlZfU
 SDXjV0U1QPjXHHeaX3ut6Jy3zQewOSEGUouuuOBOHNu6nNbAeXVOFxUVr
 8yi/ggLiNUw9l4FXG6bJPagJUvG3ILDzVshiMyGUk70Ty7G2JTh+Dw9DX
 xVrU9DXaSNeWvpSsFLQFdWXJzf6j68n363+wCQnjLNxqZeUBVL+GQq6Jg
 fVJubLub4rviDRYjdLHajaG+tn6/4gWWuli1Z9aM/lPBvUSGkhDGN88MJ A==;
X-CSE-ConnectionGUID: McBbMuzER/+CxmfQK2VlXA==
X-CSE-MsgGUID: Ia0Su5wsR7yaKH94y4VXpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66812147"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66812147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:40:43 -0800
X-CSE-ConnectionGUID: 2MS8mOjEQCCopLUq7d6MWQ==
X-CSE-MsgGUID: usg029B/SBa9BEfFvaGzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="217945394"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 00:40:39 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v8 05/15] drm/i915/color: Add framework to program CSC
Date: Wed,  3 Dec 2025 14:22:01 +0530
Message-ID: <20251203085211.3663374-6-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203085211.3663374-1-uma.shankar@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
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

Add framework to program CSC. It enables copying of matrix from UAPI
to intel plane state. Also add helper functions which will eventually
program values to hardware.

Add a crtc state variable to track plane color change.

v2:
- Add crtc_state->plane_color_changed
- Improve comments (Suraj)
- s/intel_plane_*_color/intel_plane_color_* (Suraj)

v3:
- align parameters with open braces (Suraj)
- Improve commit message (Suraj)

v4:
- Re-arrange variable declaration (Suraj)

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c    | 21 ++++++++
 drivers/gpu/drm/i915/display/intel_color.h    |  4 +-
 .../drm/i915/display/intel_display_types.h    |  4 ++
 drivers/gpu/drm/i915/display/intel_plane.c    | 49 +++++++++++++++++++
 4 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index a217a67ceb43..33fe5c9b4663 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -87,6 +87,10 @@ struct intel_color_funcs {
 	 * Read config other than LUTs and CSCs, before them. Optional.
 	 */
 	void (*get_config)(struct intel_crtc_state *crtc_state);
+
+	/* Plane CSC*/
+	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
+				      const struct intel_plane_state *plane_state);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -3963,6 +3967,23 @@ static const struct intel_color_funcs ilk_color_funcs = {
 	.get_config = ilk_get_config,
 };
 
+static void
+intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
+				  const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+
+	if (display->funcs.color->load_plane_csc_matrix)
+		display->funcs.color->load_plane_csc_matrix(dsb, plane_state);
+}
+
+void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
+					const struct intel_plane_state *plane_state)
+{
+	if (plane_state->hw.ctm)
+		intel_color_load_plane_csc_matrix(dsb, plane_state);
+}
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index bf7a12ce9df0..8051c827a1d8 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -13,6 +13,7 @@ struct intel_crtc_state;
 struct intel_crtc;
 struct intel_display;
 struct intel_dsb;
+struct intel_plane_state;
 struct drm_property_blob;
 
 void intel_color_init_hooks(struct intel_display *display);
@@ -40,5 +41,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 			   const struct drm_property_blob *blob2,
 			   bool is_pre_csc_lut);
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
-
+void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
+					const struct intel_plane_state *plane_state);
 #endif /* __INTEL_COLOR_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 764053a59270..0f70240970c7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -646,6 +646,7 @@ struct intel_plane_state {
 		enum drm_color_encoding color_encoding;
 		enum drm_color_range color_range;
 		enum drm_scaling_filter scaling_filter;
+		struct drm_property_blob *ctm;
 	} hw;
 
 	struct i915_vma *ggtt_vma;
@@ -1391,6 +1392,9 @@ struct intel_crtc_state {
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
 	} alpm_state;
+
+	/* to track changes in plane color blocks */
+	bool plane_color_changed;
 };
 
 enum intel_pipe_crc_source {
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 7b7619d59251..01fd6ccc2aae 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -48,6 +48,7 @@
 #include "i9xx_plane_regs.h"
 #include "intel_cdclk.h"
 #include "intel_cursor.h"
+#include "intel_colorop.h"
 #include "intel_display_rps.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
@@ -340,6 +341,52 @@ intel_plane_copy_uapi_plane_damage(struct intel_plane_state *new_plane_state,
 		*damage = drm_plane_state_src(&new_uapi_plane_state->uapi);
 }
 
+static bool
+intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
+				 struct intel_colorop *intel_colorop,
+				 struct drm_property_blob *blob)
+{
+	if (intel_colorop->id == INTEL_PLANE_CB_CSC)
+		return drm_property_replace_blob(&plane_state->hw.ctm, blob);
+
+	return false;
+}
+
+static void
+intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
+					const struct intel_plane_state *from_plane_state,
+					struct intel_crtc *crtc)
+{
+	struct drm_colorop *iter_colorop, *colorop;
+	struct drm_colorop_state *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->uapi.state;
+	struct intel_colorop *intel_colorop;
+	struct drm_property_blob *blob;
+	struct intel_atomic_state *intel_atomic_state = to_intel_atomic_state(state);
+	struct intel_crtc_state *new_crtc_state = intel_atomic_state ?
+		intel_atomic_get_new_crtc_state(intel_atomic_state, crtc) : NULL;
+	bool changed = false;
+	int i = 0;
+
+	iter_colorop = plane_state->uapi.color_pipeline;
+
+	while (iter_colorop) {
+		for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+			if (new_colorop_state->colorop == iter_colorop) {
+				blob = new_colorop_state->bypass ? NULL : new_colorop_state->data;
+				intel_colorop = to_intel_colorop(colorop);
+				changed |= intel_plane_colorop_replace_blob(plane_state,
+									    intel_colorop,
+									    blob);
+			}
+		}
+		iter_colorop = iter_colorop->next;
+	}
+
+	if (new_crtc_state && changed)
+		new_crtc_state->plane_color_changed = true;
+}
+
 void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
 				       const struct intel_plane_state *from_plane_state,
 				       struct intel_crtc *crtc)
@@ -368,6 +415,8 @@ void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
 
 	plane_state->uapi.src = drm_plane_state_src(&from_plane_state->uapi);
 	plane_state->uapi.dst = drm_plane_state_dest(&from_plane_state->uapi);
+
+	intel_plane_color_copy_uapi_to_hw_state(plane_state, from_plane_state, crtc);
 }
 
 void intel_plane_copy_hw_state(struct intel_plane_state *plane_state,
-- 
2.50.1

