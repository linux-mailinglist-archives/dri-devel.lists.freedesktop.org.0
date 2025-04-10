Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82CAA849FD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B2F10EA40;
	Thu, 10 Apr 2025 16:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3lbC/6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7252D10EA27;
 Thu, 10 Apr 2025 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302816; x=1775838816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PmguOkX5CoWvcdRwTwthjtOwHpq4qSLwgvSi95cO3uk=;
 b=J3lbC/6cBb3u0vR0U29niZ5yRhx7yFnpyQiI73Vuzohs+5KDPsKTi7hU
 6NQ+JlieaH5HSDXkmim0wxwzyCIGD76i9/Dfsmdqjt0vmnF3APFvc9UY2
 06Vvn5nPmMYwcrocq5Z8KtdkujvWGkqZJ4BxoD418LSkWK+4E7pyHDAzW
 r+dljqgVSxHsHRh2CFvROBEV9iVUnf/TvDLZzrWjLb7JjIQRjO/1AkzAx
 0bdKO9Us8Ta/8BGnfLXy7Uxm/uTVHNsNIxvWm8WhgOlg7NpvYdDc0EgsF
 D7/9x0ClNojDwKKSE/d4IR7i7frqndymmrnOjhVN1NRCLHNkAqXQ+5TVb A==;
X-CSE-ConnectionGUID: Cr2v7W57TAua/Q6wdAlAYA==
X-CSE-MsgGUID: 3b+5BlXxReutrc6rLGtNsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220108"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:33:36 -0700
X-CSE-ConnectionGUID: kPxM8unjQEqThD44IWRDBA==
X-CSE-MsgGUID: Da/jW9OzRBeM3bRd7reMBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129362"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:33 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 13/19] drm/i915: Pass along the format info from .fb_create()
 to drm_helper_mode_fill_fb_struct()
Date: Thu, 10 Apr 2025 19:32:12 +0300
Message-ID: <20250410163218.15130-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
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

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

For the fbdev case a manual drm_get_format_info() lookup
is needed.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c            | 8 +++++---
 drivers/gpu/drm/i915/display/intel_fb.h            | 2 ++
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      | 6 +++++-
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 3 ++-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        | 6 +++++-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      | 2 +-
 6 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 80a90bf1c75c..7f6aae33bd0b 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2206,6 +2206,7 @@ static const struct drm_framebuffer_funcs intel_fb_funcs = {
 
 int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			   struct drm_gem_object *obj,
+			   const struct drm_format_info *info,
 			   struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct intel_display *display = to_intel_display(obj->dev);
@@ -2253,7 +2254,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err_frontbuffer_put;
 	}
 
-	drm_helper_mode_fill_fb_struct(display->drm, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(display->drm, fb, info, mode_cmd);
 
 	for (i = 0; i < fb->format->num_planes; i++) {
 		unsigned int stride_alignment;
@@ -2334,7 +2335,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	fb = intel_framebuffer_create(obj, &mode_cmd);
+	fb = intel_framebuffer_create(obj, info, &mode_cmd);
 	drm_gem_object_put(obj);
 
 	return fb;
@@ -2342,6 +2343,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 
 struct drm_framebuffer *
 intel_framebuffer_create(struct drm_gem_object *obj,
+			 const struct drm_format_info *info,
 			 struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct intel_framebuffer *intel_fb;
@@ -2351,7 +2353,7 @@ intel_framebuffer_create(struct drm_gem_object *obj,
 	if (!intel_fb)
 		return ERR_PTR(-ENOMEM);
 
-	ret = intel_framebuffer_init(intel_fb, obj, mode_cmd);
+	ret = intel_framebuffer_init(intel_fb, obj, info, mode_cmd);
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index 00181c4a67dc..403b8b63721a 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -102,9 +102,11 @@ void intel_add_fb_offsets(int *x, int *y,
 
 int intel_framebuffer_init(struct intel_framebuffer *ifb,
 			   struct drm_gem_object *obj,
+			   const struct drm_format_info *info,
 			   struct drm_mode_fb_cmd2 *mode_cmd);
 struct drm_framebuffer *
 intel_framebuffer_create(struct drm_gem_object *obj,
+			 const struct drm_format_info *info,
 			 struct drm_mode_fb_cmd2 *mode_cmd);
 struct drm_framebuffer *
 intel_user_framebuffer_create(struct drm_device *dev,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
index 4991c35a2632..dd81d3fdda40 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -61,7 +61,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	fb = intel_framebuffer_create(intel_bo_to_drm_bo(obj), &mode_cmd);
+	fb = intel_framebuffer_create(intel_bo_to_drm_bo(obj),
+				      drm_get_format_info(dev,
+							  mode_cmd.pixel_format,
+							  mode_cmd.modifier[0]),
+				      &mode_cmd);
 	i915_gem_object_put(obj);
 
 	return to_intel_framebuffer(fb);
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index b0c4892775ce..6ce61c5befc9 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -286,7 +286,8 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 	mode_cmd.flags = DRM_MODE_FB_MODIFIERS;
 
 	if (intel_framebuffer_init(to_intel_framebuffer(fb),
-				   intel_bo_to_drm_bo(vma->obj), &mode_cmd)) {
+				   intel_bo_to_drm_bo(vma->obj),
+				   fb->format, &mode_cmd)) {
 		drm_dbg_kms(display->drm, "intel fb init failed\n");
 		goto err_vma;
 	}
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 267f31697343..7b7a2439be61 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -65,7 +65,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 		goto err;
 	}
 
-	fb = intel_framebuffer_create(&obj->ttm.base, &mode_cmd);
+	fb = intel_framebuffer_create(&obj->ttm.base,
+				      drm_get_format_info(dev,
+							  mode_cmd.pixel_format,
+							  mode_cmd.modifier[0]),
+				      &mode_cmd);
 	if (IS_ERR(fb)) {
 		xe_bo_unpin_map_no_vm(obj);
 		goto err;
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 6502b8274173..bfeba5d57309 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -187,7 +187,7 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 		return false;
 
 	if (intel_framebuffer_init(to_intel_framebuffer(fb),
-				   &bo->ttm.base, &mode_cmd)) {
+				   &bo->ttm.base, fb->format, &mode_cmd)) {
 		drm_dbg_kms(&xe->drm, "intel fb init failed\n");
 		goto err_bo;
 	}
-- 
2.49.0

