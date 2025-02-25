Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43CDA43668
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 08:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD9810E59B;
	Tue, 25 Feb 2025 07:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJoQ7m8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B095510E599;
 Tue, 25 Feb 2025 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740469719; x=1772005719;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=IN5jsbe1MEnXVAgOBGgxeyNBVXSCyxGak3TqxJpBphE=;
 b=OJoQ7m8U9du835RS7q3jFW83XEBZUwfi0Z5hYT4EL+Epgqlns0jOOJ89
 ngshyd71wvKzvVcGM9Vz71NPzOnqHQgstAV0sXCdslhzSo9CltHqmtTK4
 67henBY8h5JCEBN9tNSBbcTnJ7JpoXZjKklHcImD8VFG8EoLcW3Z/lXH5
 yfDlap7OmpoeZOweKB8RsEKMSzgsukqc/wbsEuWvB88Zq8hIYTDi/a5LJ
 3OVId9vEdKjPQ2ukiNbFfEov8HUSrzSsQzmLYO00IMZmQWxB39xptiyBI
 /uDFYmH2JZ1OtK2vmdyi4sV797dGsvwV42HTJo+OGo0EMBzw0PJk1iRNi Q==;
X-CSE-ConnectionGUID: GswgPWFYSPGN78uEipsrgA==
X-CSE-MsgGUID: 1xfWPbwyQjOa9GyyKe0AEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="63726921"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="63726921"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 23:48:38 -0800
X-CSE-ConnectionGUID: 5DWWgmN+QDaAJfa6TFUDgQ==
X-CSE-MsgGUID: kqzWqlCnRH6qc6X5NyR3BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116330881"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 24 Feb 2025 23:48:35 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 25 Feb 2025 13:03:53 +0530
Subject: [PATCH v7 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-asyn-v7-3-20b81122f4ce@intel.com>
References: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
In-Reply-To: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Arun R Murthy <arun.r.murthy@intel.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Naveen Kumar <naveen1.kumar@intel.com>
X-Mailer: b4 0.15-dev
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

Hook up the newly added plane function pointer
format_mod_supported_async to populate the modifiers/formats supported
by asynchronous flips.

v5: Correct the if condition for modifier support check (Chaitanya)
v6: Replace uint32_t/uint64_t with u32/u64 (Jani)
v7: Move plannar check from intel_async_flip_check_hw() to
intel_plane_format_mod_supported_async() (Ville)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 +++--
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 30 +++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++++-
 drivers/gpu/drm/i915/display/intel_display.c       | 11 ++------
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 +++-
 5 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 013295f66d56ec5e919b3a0c904034bf7985986a..6bd09adb8a30ba002ef334261d7638f398587a3e 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -820,7 +820,7 @@ unsigned int vlv_plane_min_alignment(struct intel_plane *plane,
 {
 	struct intel_display *display = to_intel_display(plane);
 
-	if (intel_plane_can_async_flip(plane, fb->modifier))
+	if (intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
 		return 256 * 1024;
 
 	/* FIXME undocumented so not sure what's actually needed */
@@ -844,7 +844,7 @@ static unsigned int g4x_primary_min_alignment(struct intel_plane *plane,
 {
 	struct intel_display *display = to_intel_display(plane);
 
-	if (intel_plane_can_async_flip(plane, fb->modifier))
+	if (intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
 		return 256 * 1024;
 
 	if (intel_scanout_needs_vtd_wa(display))
@@ -889,6 +889,7 @@ static const struct drm_plane_funcs i965_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = i965_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static const struct drm_plane_funcs i8xx_plane_funcs = {
@@ -898,6 +899,7 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = i8xx_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 struct intel_plane *
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 124cd9ddba0b96657a8166e613b93003e77e133c..4ebc40c914b72b8fe3118edb74d9bf95ab661b13 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -170,11 +170,39 @@ bool intel_plane_needs_physical(struct intel_plane *plane)
 		DISPLAY_INFO(i915)->cursor_needs_physical;
 }
 
-bool intel_plane_can_async_flip(struct intel_plane *plane, u64 modifier)
+bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
+				u64 modifier)
 {
+	struct intel_display *display = to_intel_display(plane);
+
+	if (DISPLAY_VER(display) <= 14 ?
+	    drm_format_info(format)->is_yuv :
+	    intel_format_info_is_yuv_semiplanar(drm_format_info(format),
+						modifier)) {
+		drm_dbg_kms(plane->base.dev,
+			    "[PLANE:%d:%s] Planar formats do not support async flips\n",
+			    plane->base.base.id, plane->base.name);
+		return false;
+	}
+
 	return plane->can_async_flip && plane->can_async_flip(modifier);
 }
 
+bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
+					    u32 format,
+					    u64 modifier)
+{
+	if (!plane->funcs->format_mod_supported(plane, format, modifier)) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANE:%d:%s] Planar format/modifier not in universal list\n",
+			    plane->base.id, plane->name);
+		return false;
+	}
+
+	return intel_plane_can_async_flip(to_intel_plane(plane),
+					format, modifier);
+}
+
 unsigned int intel_adjusted_rate(const struct drm_rect *src,
 				 const struct drm_rect *dst,
 				 unsigned int rate)
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
index 65edd88d28a9c532d6347fbd13b0f45698e9e5bb..0d1700bd5c6d7b1b3e4e7e6be760b548493d6846 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
@@ -21,7 +21,8 @@ enum plane_id;
 
 struct intel_plane *
 intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id plane_id);
-bool intel_plane_can_async_flip(struct intel_plane *plane, u64 modifier);
+bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
+				u64 modifier);
 unsigned int intel_adjusted_rate(const struct drm_rect *src,
 				 const struct drm_rect *dst,
 				 unsigned int rate);
@@ -87,5 +88,8 @@ void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_plane_sta
 int intel_atomic_add_affected_planes(struct intel_atomic_state *state,
 				     struct intel_crtc *crtc);
 int intel_atomic_check_planes(struct intel_atomic_state *state);
+bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
+					    u32 format,
+					    u64 modifier);
 
 #endif /* __INTEL_ATOMIC_PLANE_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 065fdf6dbb88e3c4ac990b38e7f1575e0c9ca413..c9abe1412aef12d0eda17110431a57a06f3f5d20 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6188,7 +6188,8 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		if (!plane->async_flip)
 			continue;
 
-		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->modifier)) {
+		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format->format,
+		    new_plane_state->hw.fb->modifier)) {
 			drm_dbg_kms(&i915->drm,
 				    "[PLANE:%d:%s] Modifier 0x%llx does not support async flip\n",
 				    plane->base.base.id, plane->base.name,
@@ -6196,14 +6197,6 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 			return -EINVAL;
 		}
 
-		if (intel_format_info_is_yuv_semiplanar(new_plane_state->hw.fb->format,
-							new_plane_state->hw.fb->modifier)) {
-			drm_dbg_kms(&i915->drm,
-				    "[PLANE:%d:%s] Planar formats do not support async flips\n",
-				    plane->base.base.id, plane->base.name);
-			return -EINVAL;
-		}
-
 		/*
 		 * We turn the first async flip request into a sync flip
 		 * so that we can reconfigure the plane (eg. change modifier).
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index cd9762947f1de227a3abbcd61b7c7b0c9848e439..1b0cafe9b158c24e74bf46222ac23d2c933555a5 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -601,7 +601,7 @@ static u32 tgl_plane_min_alignment(struct intel_plane *plane,
 	 * Figure out what's going on here...
 	 */
 	if (display->platform.alderlake_p &&
-	    intel_plane_can_async_flip(plane, fb->modifier))
+	    intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
 		return mult * 16 * 1024;
 
 	switch (fb->modifier) {
@@ -2623,6 +2623,7 @@ static const struct drm_plane_funcs skl_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = skl_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static const struct drm_plane_funcs icl_plane_funcs = {
@@ -2632,6 +2633,7 @@ static const struct drm_plane_funcs icl_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = icl_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static const struct drm_plane_funcs tgl_plane_funcs = {
@@ -2641,6 +2643,7 @@ static const struct drm_plane_funcs tgl_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = tgl_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static void

-- 
2.25.1

