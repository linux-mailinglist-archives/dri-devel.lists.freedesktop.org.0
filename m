Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B43BF84B7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 21:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2310E335;
	Tue, 21 Oct 2025 19:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1IJso3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F8010E0B4;
 Tue, 21 Oct 2025 19:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761075915; x=1792611915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BRCnPODu29XU9B452PQdMw6Ts3ntcbmAv+CwuRI3vIU=;
 b=B1IJso3Ml6zHh8YK4vdrFcoM7Z90yq7ylynQxKhB60KU/MHMXqNUxWm4
 Tgt9HusFUGU8mjeIEgghSQlxVkTfat9KyVHgVvjosCgWdf8PSZcRCsLTw
 4I2AAy3I9QhYEqZxYiKqm+i/QUSnQNHdW+rnGYEeMgrZcDYcmodEZidSb
 4UjrAkmqtfWpg+rv5/5leofLQqv0KyBNmdsuS8Y1zC7NKAuzJO7zsD5B+
 FgecoEMH2jAYyPdbWCzOO5xARJNReXm8TVH9SXHXExsRX0h463xoS4m+7
 g0tZgSasmWTU3PwBoHFNCM6D+ul9j3HJacp0tju0IjqQ4X3wOTX+9Eys9 A==;
X-CSE-ConnectionGUID: GwXk5/yZTQe2ZCphECTwog==
X-CSE-MsgGUID: Ij0I+TccRTqw+QYvbfzSbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74333109"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="74333109"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:15 -0700
X-CSE-ConnectionGUID: CeAJNkc5Se2x97WRR9JuJA==
X-CSE-MsgGUID: k+WA0DLjTCSm07HzbC3IeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="187943686"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.214])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:13 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH 3/5] drm/i915/dumb: Move the display dumb buffer stuff into
 the display code
Date: Tue, 21 Oct 2025 22:44:53 +0300
Message-ID: <20251021194455.24297-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
References: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

In preparation for handling the DRM_MODE_DUMB_CURSOR flag, move
the current display specific (mainly remapping) dumb buffer
handling to the display code.

We'll still need to provide some kind of non-display codepath
as well since at least some igts use dumb buffers even on devices
without display support.

Cc: Daniel Stone <daniels@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  8 +++
 drivers/gpu/drm/i915/display/intel_display.h |  3 ++
 drivers/gpu/drm/i915/display/intel_plane.c   | 32 ++++++++++++
 drivers/gpu/drm/i915/display/intel_plane.h   |  4 ++
 drivers/gpu/drm/i915/gem/i915_gem_create.c   | 55 ++++++++++----------
 5 files changed, 74 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a8b4619de347..bd4317291ba5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -569,6 +569,14 @@ u32 intel_plane_fb_max_stride(struct drm_device *drm,
 				 DRM_MODE_ROTATE_0);
 }
 
+int intel_display_dumb_create(struct drm_device *drm,
+			      struct drm_mode_create_dumb *args)
+{
+	struct intel_display *display = to_intel_display(drm);
+
+	return intel_plane_dumb_create(display, args);
+}
+
 void intel_set_plane_visible(struct intel_crtc_state *crtc_state,
 			     struct intel_plane_state *plane_state,
 			     bool visible)
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index fc2ef92ccf68..1d978f441b47 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -34,6 +34,7 @@ struct drm_atomic_state;
 struct drm_device;
 struct drm_display_mode;
 struct drm_encoder;
+struct drm_mode_create_dumb;
 struct drm_modeset_acquire_ctx;
 struct intel_atomic_state;
 struct intel_crtc;
@@ -404,6 +405,8 @@ void intel_link_compute_m_n(u16 bpp, int nlanes,
 			    struct intel_link_m_n *m_n);
 u32 intel_plane_fb_max_stride(struct drm_device *drm,
 			      u32 pixel_format, u64 modifier);
+int intel_display_dumb_create(struct drm_device *drm,
+			      struct drm_mode_create_dumb *args);
 enum drm_mode_status
 intel_mode_valid_max_plane_size(struct intel_display *display,
 				const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 78329deb395a..f12f8300a7c4 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -1705,3 +1705,35 @@ int intel_plane_atomic_check(struct intel_atomic_state *state)
 
 	return 0;
 }
+
+int intel_plane_dumb_create(struct intel_display *display,
+			    struct drm_mode_create_dumb *args)
+{
+	int cpp = DIV_ROUND_UP(args->bpp, 8);
+	u32 format;
+
+	switch (cpp) {
+	case 1:
+		format = DRM_FORMAT_C8;
+		break;
+	case 2:
+		format = DRM_FORMAT_RGB565;
+		break;
+	case 4:
+		format = DRM_FORMAT_XRGB8888;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	args->pitch = ALIGN(args->width * cpp, 64);
+
+	/* align stride to page size so that we can remap */
+	if (args->pitch > intel_plane_fb_max_stride(display->drm, format,
+						    DRM_FORMAT_MOD_LINEAR))
+		args->pitch = ALIGN(args->pitch, 4096);
+
+	args->size = mul_u32_u32(args->pitch, args->height);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_plane.h b/drivers/gpu/drm/i915/display/intel_plane.h
index 4e99df9de3e8..d27991acd97f 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_plane.h
@@ -8,12 +8,14 @@
 
 #include <linux/types.h>
 
+struct drm_mode_create_dumb;
 struct drm_plane;
 struct drm_property;
 struct drm_rect;
 struct intel_atomic_state;
 struct intel_crtc;
 struct intel_crtc_state;
+struct intel_display;
 struct intel_dsb;
 struct intel_plane;
 struct intel_plane_state;
@@ -87,5 +89,7 @@ int intel_plane_atomic_check(struct intel_atomic_state *state);
 bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
 					    u32 format,
 					    u64 modifier);
+int intel_plane_dumb_create(struct intel_display *display,
+			    struct drm_mode_create_dumb *args);
 
 #endif /* __INTEL_PLANE_H__ */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index c3e6a325872d..6ce46b0f7eec 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -169,39 +169,38 @@ i915_gem_dumb_create(struct drm_file *file,
 		     struct drm_device *dev,
 		     struct drm_mode_create_dumb *args)
 {
+	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_object *obj;
 	struct intel_memory_region *mr;
 	enum intel_memory_type mem_type;
-	int cpp = DIV_ROUND_UP(args->bpp, 8);
-	u32 format;
-
-	switch (cpp) {
-	case 1:
-		format = DRM_FORMAT_C8;
-		break;
-	case 2:
-		format = DRM_FORMAT_RGB565;
-		break;
-	case 4:
-		format = DRM_FORMAT_XRGB8888;
-		break;
-	default:
-		return -EINVAL;
+
+	if (i915->display) {
+		int ret;
+
+		ret = intel_display_dumb_create(dev, args);
+		if (ret)
+			return ret;
+	} else {
+		int cpp = DIV_ROUND_UP(args->bpp, 8);
+
+		switch (cpp) {
+		case 1:
+		case 2:
+		case 4:
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		/* have to work out size/pitch and return them */
+		args->pitch = ALIGN(args->width * cpp, 64);
+
+		if (args->pitch < args->width)
+			return -EINVAL;
+
+		args->size = mul_u32_u32(args->pitch, args->height);
 	}
 
-	/* have to work out size/pitch and return them */
-	args->pitch = ALIGN(args->width * cpp, 64);
-
-	/* align stride to page size so that we can remap */
-	if (args->pitch > intel_plane_fb_max_stride(dev, format,
-						    DRM_FORMAT_MOD_LINEAR))
-		args->pitch = ALIGN(args->pitch, 4096);
-
-	if (args->pitch < args->width)
-		return -EINVAL;
-
-	args->size = mul_u32_u32(args->pitch, args->height);
-
 	mem_type = INTEL_MEMORY_SYSTEM;
 	if (HAS_LMEM(to_i915(dev)))
 		mem_type = INTEL_MEMORY_LOCAL;
-- 
2.49.1

