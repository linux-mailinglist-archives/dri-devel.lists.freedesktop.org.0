Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ACE905D21
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 22:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEB610E914;
	Wed, 12 Jun 2024 20:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HC+AWnne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635A310E916;
 Wed, 12 Jun 2024 20:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718225296; x=1749761296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGZusBJQdkRGz9VUBgZrA+n6GODjsiAnbkIjFXgRm4s=;
 b=HC+AWnnefR/6r4pG77vo9JxdeEh+Lj0recKhxgvIN0GeiE7zSTZDZko1
 cnjhaNEo/d2DvBSgfXttKTlKpfKEaoBTrtCC1rzbR/9r314swc7nRriZK
 gycySepxEZFyMWhTlHCPTVCDKuesv/UHM6L4J59FYW4eJ+9kHelqTJbs/
 pDfntYReuQC5ch/VCo45Fa9f5UaIjdWuIW5P2QHnm62vaedSXcmF31F6m
 rHoqYCHv7kAPyqL1XzYbKggat+JXJCvGNYbzIaT8ISZQj/YLjRs58pKmh
 nWygu57xK6CssQBg4Ii5BewvWf3XFxfKKw/lQwDdTurpxiSRQ66Ji7eNF w==;
X-CSE-ConnectionGUID: HTqiihS1Rd2Ma1+w7wRhvQ==
X-CSE-MsgGUID: rQlokhHGQlutfCcFC7o1cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14976660"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14976660"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:47:44 -0700
X-CSE-ConnectionGUID: 27Y3ydLaS2qX5RVBwgBJyQ==
X-CSE-MsgGUID: CoriZQcaQouXiqHJqbIT6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39863973"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 13:47:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 23:47:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2 9/9] drm/i915: Nuke the TGL+ chroma plane tile row
 alignment stuff
Date: Wed, 12 Jun 2024 23:47:12 +0300
Message-ID: <20240612204712.31404-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
References: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
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

I don't think the display hardware really has such chroma
plane tile row alignment requirements as outlined in
commit d156135e6a54 ("drm/i915/tgl: Make sure a semiplanar
UV plane is tile row size aligned")

Bspec had the same exact thing to say about earlier hardware
as well, but we never cared and things work just fine.

The one thing mentioned in that commit that is definitely
true however is the fence alignment issue. But we don't
deal with that on earlier hardware either. We do have code
to deal with that issue for the first color plane, but not
the chroma planes. So I think if we did want to check this
more extensively we should do it in the same places where
we already check the first color plane (namely
convert_plane_offset_to_xy() and intel_fb_bo_framebuffer_init()).

Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c            | 12 +-----------
 drivers/gpu/drm/i915/display/intel_fb.h            |  1 -
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 14 --------------
 3 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index a11c1cf6f548..f23547a88b1f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -585,12 +585,6 @@ static bool is_gen12_ccs_cc_plane(const struct drm_framebuffer *fb, int color_pl
 	return intel_fb_rc_ccs_cc_plane(fb) == color_plane;
 }
 
-bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane)
-{
-	return intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier) &&
-		color_plane == 1;
-}
-
 bool is_surface_linear(const struct drm_framebuffer *fb, int color_plane)
 {
 	return fb->modifier == DRM_FORMAT_MOD_LINEAR ||
@@ -1020,11 +1014,7 @@ static int intel_fb_offset_to_xy(int *x, int *y,
 	struct drm_i915_private *i915 = to_i915(fb->dev);
 	unsigned int height, alignment, unused;
 
-	if (DISPLAY_VER(i915) >= 12 &&
-	    !intel_fb_needs_pot_stride_remap(to_intel_framebuffer(fb)) &&
-	    is_semiplanar_uv_plane(fb, color_plane))
-		alignment = intel_tile_row_size(fb, color_plane);
-	else if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
+	if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
 		alignment = intel_tile_size(i915);
 	else
 		alignment = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index 1b1fef2dc39a..6dee0c8b7f22 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -34,7 +34,6 @@ bool intel_fb_is_ccs_modifier(u64 modifier);
 bool intel_fb_is_rc_ccs_cc_modifier(u64 modifier);
 bool intel_fb_is_mc_ccs_modifier(u64 modifier);
 
-bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane);
 bool intel_fb_is_ccs_aux_plane(const struct drm_framebuffer *fb, int color_plane);
 int intel_fb_rc_ccs_cc_plane(const struct drm_framebuffer *fb);
 
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index a1c4778cf656..ba5a628b4757 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -515,20 +515,6 @@ static u32 tgl_plane_min_alignment(struct intel_plane *plane,
 	if (intel_fb_is_ccs_aux_plane(fb, color_plane))
 		return mult * 4 * 1024;
 
-	if (is_semiplanar_uv_plane(fb, color_plane)) {
-		if (intel_fb_uses_dpt(fb))
-			return 512 * 4 * 1024;
-
-		/*
-		 * TODO: cross-check wrt. the bspec stride in bytes * 64 bytes
-		 * alignment for linear UV planes on all platforms.
-		 */
-		if (fb->modifier == DRM_FORMAT_MOD_LINEAR)
-			return 256 * 1024;
-
-		return intel_tile_row_size(fb, color_plane);
-	}
-
 	switch (fb->modifier) {
 	case DRM_FORMAT_MOD_LINEAR:
 	case I915_FORMAT_MOD_X_TILED:
-- 
2.44.2

