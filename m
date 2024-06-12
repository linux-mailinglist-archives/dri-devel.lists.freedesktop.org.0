Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5144A905D15
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 22:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6F310E910;
	Wed, 12 Jun 2024 20:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRnmyAi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FB510E909;
 Wed, 12 Jun 2024 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718225250; x=1749761250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zsOm0IWUWoiwup0vU7dw0K3WZ4SDih+DF4AZv9LIzuY=;
 b=SRnmyAi3Nxg4E8SUFWJEP9fEHtB81MCWRzENXgaHUW0i/cNk1vHQCIi2
 Ray51cT06IN681qoi+8YqLr9RFetFJj3f8FJJr3FmpQ2ySY338OYIr8fs
 KUsV0RywY/fvPgOMfAm4Sw1obWrCybgTzExXcsscNFPS04S5pHLqUW+Dw
 WF8iWMQTiVHchc07x/0TchHNgUinDXwbUfraJM0pmWc5G1iNmdCMYLpgb
 gfULAX+dUUXE4UrflXYfDF97+sQS7SG+Mb6s7Djacja7OKkSdkh/kW663
 +Z1rvVnSMrF5xEpgPMWYqINtwcRSTCjIKv+y/j65YGvuhcYJlalVCP3GZ Q==;
X-CSE-ConnectionGUID: i5Jrr6AwQTqzErZ+soXdRg==
X-CSE-MsgGUID: PqEUWc1iRtqUipDoL+pUGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14976573"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14976573"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:47:28 -0700
X-CSE-ConnectionGUID: JQwnsXGbT+udSn4ktHZc5Q==
X-CSE-MsgGUID: /Gk+yPFsS8q1+OeUwS6r2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39863954"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 13:47:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 23:47:25 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2 4/9] drm/i915: Introduce fb->min_alignment
Date: Wed, 12 Jun 2024 23:47:07 +0300
Message-ID: <20240612204712.31404-5-ville.syrjala@linux.intel.com>
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

Different planes could have different alignment requirements
even for the same format/modifier. Collect the alignment
requirements across all planes capable of scanning out the
fb such that the alignment is satisfactory to all those
planes.

So far this was sort of handle by making sure intel_surf_alignment()
declares the superset of all planes' alignment requirements,
but maintaining that manually is annoying. So we're going to move
towards each plane declaring only its own requirements, and thus
we need code to generate the superset.

v2: Drop the borked per-plane vma optimization (Imre)
    Assert that the plane's declared alignment is POT (Imre)

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_fb.c       | 29 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |  5 ++--
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 18 +-----------
 4 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0c165572fbd0..af7cc3d6c82b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -146,6 +146,8 @@ struct intel_framebuffer {
 	};
 
 	struct i915_address_space *dpt_vm;
+
+	unsigned int min_alignment;
 };
 
 enum intel_hotplug_state {
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index b3a48754a417..0abb80972885 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -11,6 +11,7 @@
 
 #include "gem/i915_gem_object.h"
 #include "i915_drv.h"
+#include "intel_atomic_plane.h"
 #include "intel_display.h"
 #include "intel_display_types.h"
 #include "intel_dpt.h"
@@ -1617,6 +1618,32 @@ bool intel_fb_supports_90_270_rotation(const struct intel_framebuffer *fb)
 	       fb->base.modifier == I915_FORMAT_MOD_Yf_TILED;
 }
 
+static unsigned int intel_fb_min_alignment(const struct drm_framebuffer *fb)
+{
+	struct drm_i915_private *i915 = to_i915(fb->dev);
+	struct intel_plane *plane;
+	unsigned int min_alignment = 0;
+
+	for_each_intel_plane(&i915->drm, plane) {
+		unsigned int plane_min_alignment;
+
+		if (!drm_plane_has_format(&plane->base, fb->format->format, fb->modifier))
+			continue;
+
+		plane_min_alignment = plane->min_alignment(plane, fb, 0);
+
+		drm_WARN_ON(&i915->drm, plane_min_alignment &&
+			    !is_power_of_2(plane_min_alignment));
+
+		if (intel_plane_needs_physical(plane))
+			continue;
+
+		min_alignment = max(min_alignment, plane_min_alignment);
+	}
+
+	return min_alignment;
+}
+
 int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *fb)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(&fb->base);
@@ -1699,6 +1726,8 @@ int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *
 		return -EINVAL;
 	}
 
+	fb->min_alignment = intel_fb_min_alignment(&fb->base);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 9b0f1ea41b70..575b271e012b 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -233,10 +233,9 @@ void intel_fb_unpin_vma(struct i915_vma *vma, unsigned long flags)
 static unsigned int
 intel_plane_fb_min_alignment(const struct intel_plane_state *plane_state)
 {
-	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	const struct intel_framebuffer *fb = to_intel_framebuffer(plane_state->hw.fb);
 
-	return plane->min_alignment(plane, fb, 0);
+	return fb->min_alignment;
 }
 
 static unsigned int
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 6e5f88f20482..49a1ac4f5491 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -47,7 +47,6 @@
 #include "gem/i915_gem_object.h"
 
 #include "i915_drv.h"
-#include "intel_crtc.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
@@ -173,21 +172,6 @@ static const struct fb_ops intelfb_ops = {
 
 __diag_pop();
 
-static unsigned int intel_fbdev_min_alignment(const struct drm_framebuffer *fb)
-{
-	struct drm_i915_private *i915 = to_i915(fb->dev);
-	struct intel_plane *plane;
-	struct intel_crtc *crtc;
-
-	crtc = intel_first_crtc(i915);
-	if (!crtc)
-		return 0;
-
-	plane = to_intel_plane(crtc->base.primary);
-
-	return plane->min_alignment(plane, fb, 0);
-}
-
 static int intelfb_create(struct drm_fb_helper *helper,
 			  struct drm_fb_helper_surface_size *sizes)
 {
@@ -245,7 +229,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	 * BIOS is suitable for own access.
 	 */
 	vma = intel_fb_pin_to_ggtt(&fb->base, &view,
-				   intel_fbdev_min_alignment(&fb->base), 0,
+				   fb->min_alignment, 0,
 				   false, &flags);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
-- 
2.44.2

