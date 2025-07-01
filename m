Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84FCAEF2AA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55C610E564;
	Tue,  1 Jul 2025 09:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EB+TKX7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DF210E56F;
 Tue,  1 Jul 2025 09:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360927; x=1782896927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iud1Xka6Y09V6CVttEtPQqYfq0sByzwo/IpirHmg39M=;
 b=EB+TKX7cRROKpRg3OdlDW+XFnEYAp/71b/3FS06d8o0Zk0dRv1eG0VDv
 5VwAuCHGcWbRVOsjsUxi1PIkGeVJ7z3yiK8kCwCePWBkfdVZRGIA9AJuM
 pyETd/NG8lnkjnYwgDhTY4VXO+RahBzmP6N7qSTBRVzsPHHcSl7Wo7tos
 IBO7Nw7sdxQGnbLpj2WsMsaYVF6zhUnWwH/0LoF/qoj6QtKvVdM94MT8N
 zV8PJ0b/qCXAfylZbyuZk/CiNPnVIcw76CHCOaeqdfl5NMHWa+bl1wpbk
 m65pd2FR9+hxNd7s/EiZb2buiQQjqCZvMn51ZW8HFWP5k7h+97yomGTgF w==;
X-CSE-ConnectionGUID: W+wLkvpbRY6JZMsR6bqnIQ==
X-CSE-MsgGUID: j+kBEbaKSYuiPqXiDWBbBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218552"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:08:47 -0700
X-CSE-ConnectionGUID: GLxKay9US2qYXzhs3m2nxw==
X-CSE-MsgGUID: Dc2y6gaZSjWHN78WDWyrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427248"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:08:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:08:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 13/19] drm/i915: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue,  1 Jul 2025 12:07:16 +0300
Message-ID: <20250701090722.13645-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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
index 30fa287ed6b0..1792f138b062 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2207,6 +2207,7 @@ static const struct drm_framebuffer_funcs intel_fb_funcs = {
 
 int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			   struct drm_gem_object *obj,
+			   const struct drm_format_info *info,
 			   struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct intel_display *display = to_intel_display(obj->dev);
@@ -2254,7 +2255,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err_frontbuffer_put;
 	}
 
-	drm_helper_mode_fill_fb_struct(display->drm, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(display->drm, fb, info, mode_cmd);
 
 	for (i = 0; i < fb->format->num_planes; i++) {
 		unsigned int stride_alignment;
@@ -2335,7 +2336,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	fb = intel_framebuffer_create(obj, &mode_cmd);
+	fb = intel_framebuffer_create(obj, info, &mode_cmd);
 	drm_gem_object_put(obj);
 
 	return fb;
@@ -2343,6 +2344,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 
 struct drm_framebuffer *
 intel_framebuffer_create(struct drm_gem_object *obj,
+			 const struct drm_format_info *info,
 			 struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct intel_framebuffer *intel_fb;
@@ -2352,7 +2354,7 @@ intel_framebuffer_create(struct drm_gem_object *obj,
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
index 8db3af36b2f2..210aee9ae88b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -62,7 +62,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	fb = intel_framebuffer_create(intel_bo_to_drm_bo(obj), &mode_cmd);
+	fb = intel_framebuffer_create(intel_bo_to_drm_bo(obj),
+				      drm_get_format_info(display->drm,
+							  mode_cmd.pixel_format,
+							  mode_cmd.modifier[0]),
+				      &mode_cmd);
 	i915_gem_object_put(obj);
 
 	return to_intel_framebuffer(fb);
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 2194d39a5c98..4246173ed311 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -289,7 +289,8 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 	mode_cmd.flags = DRM_MODE_FB_MODIFIERS;
 
 	if (intel_framebuffer_init(to_intel_framebuffer(fb),
-				   intel_bo_to_drm_bo(vma->obj), &mode_cmd)) {
+				   intel_bo_to_drm_bo(vma->obj),
+				   fb->format, &mode_cmd)) {
 		drm_dbg_kms(display->drm, "intel fb init failed\n");
 		goto err_vma;
 	}
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index b28a94df824f..fba9617a75a5 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -66,7 +66,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
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
index b2ede3af9345..dcbc4b2d3fd9 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -184,7 +184,7 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 		return false;
 
 	if (intel_framebuffer_init(to_intel_framebuffer(fb),
-				   &bo->ttm.base, &mode_cmd)) {
+				   &bo->ttm.base, fb->format, &mode_cmd)) {
 		drm_dbg_kms(&xe->drm, "intel fb init failed\n");
 		goto err_bo;
 	}
-- 
2.49.0

