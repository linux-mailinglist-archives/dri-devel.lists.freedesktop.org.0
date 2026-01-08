Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C78D01E79
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D96510E6E7;
	Thu,  8 Jan 2026 09:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHoH9+BL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C65D10E6D8;
 Thu,  8 Jan 2026 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767865521; x=1799401521;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=4jAlYxAscT7C/zQSTx751Vyh002V5FhzKQdJw9Eg35w=;
 b=mHoH9+BLvM9Be4GtDbeHlifoOWwZNayuqdCiRJRT8KEng/gvf+b4ZHnf
 8XoMURlePa44qWn4wU/XIB0iYIJiUcunIeVklJmqa8Gc55m8tCibuTOTL
 c+JvrvhKT+EsrRGw90Kue11yvxOFFgp62zbUYAxIorkdnNpJHPc76pqBN
 1EwyH+oTQoLOxO4SbF6xFVWdqVy9PLjilrs6K2UL/bhCdxtreGjDOi3a+
 f8NDYjv57W+c84EHRLrI5fsnxLDUhLRvdSmlTNo/cqBhwYYo8u6Z6Tdv5
 e3X1v1Ov8Fzsunr3PWBxABIrNcRk2hE4b/1Op4ifVWLzXKbjeUsvTodq9 Q==;
X-CSE-ConnectionGUID: w2DEJsT2REKzRgQoLB+/NA==
X-CSE-MsgGUID: MUMp8E4uRgGHn2P7bSzSaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72876583"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="72876583"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:45:19 -0800
X-CSE-ConnectionGUID: yZ3watvpQoOC3vMoKLuJ0w==
X-CSE-MsgGUID: UxmA5GXdTpCS2fQRqlSmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208232153"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 01:45:13 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 08 Jan 2026 15:13:25 +0530
Subject: [PATCH [RFC] v3 4/7] drm/atomic: Move the plane property check for
 async flip to atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-async-v3-4-e7730c3fe9ff@intel.com>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
In-Reply-To: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 andrealmeid@igalia.com, naveen1.kumar@intel.com, ville.syrjala@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
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

For async flip on aplane there should be no property change except the
fb id. This check was done in the set_property. Move this check to
atomic_check(). This will work for both plane property async_flip and
the legacy DRM_MODE_PAGE_FLIP_ASYNC flag.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic.c      | 120 +++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_atomic_uapi.c |  57 ------------------
 2 files changed, 118 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 52738b80ddbeb124896f6124df5628e2ac27faa4..fc938ea467e239edd6be77b7467c45ac8c8379fd 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -31,6 +31,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
@@ -397,10 +398,27 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_get_crtc_state);
 
+static int drm_atomic_crtc_async_check(const struct drm_crtc_state *old_crtc_state,
+				       const struct drm_crtc_state *new_crtc_state)
+{
+	struct drm_crtc *crtc = new_crtc_state->crtc;
+
+	if (!new_crtc_state->async_flip)
+		return 0;
+
+	if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
+		drm_dbg_kms(crtc->dev, "[CRTC:%d:%s] modeset required\n",
+			    crtc->base.id, crtc->name);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 				 const struct drm_crtc_state *new_crtc_state)
 {
 	struct drm_crtc *crtc = new_crtc_state->crtc;
+	int ret = 0;
 
 	/* NOTE: we explicitly don't enforce constraints such as primary
 	 * layer covering entire screen, since that is something we want
@@ -455,7 +473,9 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 		return -EINVAL;
 	}
 
-	return 0;
+	ret = drm_atomic_crtc_async_check(old_crtc_state, new_crtc_state);
+
+	return ret;
 }
 
 static void drm_atomic_crtc_print_state(struct drm_printer *p,
@@ -691,6 +711,96 @@ plane_switching_crtc(const struct drm_plane_state *old_plane_state,
 	return true;
 }
 
+static int drm_atomic_plane_async_check(const struct drm_plane_state *old_plane_state,
+					const struct drm_plane_state *new_plane_state)
+{
+	struct drm_plane *plane = new_plane_state->plane;
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = crtc->state;
+
+	if (!new_plane_state->async_flip)
+		return 0;
+
+	/*
+	 * If its the first async flip then certain properties like modifier/pixel can
+	 * change and will be considered as a sync flip itself
+	 */
+	if (!old_plane_state->async_flip)
+		return 0;
+
+	/* For async flip on a plane there should be no change apart from fb id */
+	if (new_crtc_state->active) {
+		drm_dbg_kms(plane->dev, "[CRTC:%d:%s] not active\n",
+			    crtc->base.id, crtc->name);
+		return -EINVAL;
+	}
+
+	if (old_plane_state->fb->modifier != new_plane_state->fb->modifier) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANE:%d:%s] Modifier cannot be changed in async flip\n",
+			    plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if (old_plane_state->fb->format != new_plane_state->fb->format) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANE:%d:%s] Pixel format cannot be changed in async flip\n",
+			    plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if (old_plane_state->rotation != new_plane_state->rotation) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANE:%d:%s] Rotation cannot be changed in async flip\n",
+			    plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if (!drm_rect_equals(&old_plane_state->src, &new_plane_state->src) ||
+	    !drm_rect_equals(&old_plane_state->dst, &new_plane_state->dst)) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANE:%d:%s] Size/co-ordinates cannot be changed in async flip\n",
+			    plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if (old_plane_state->alpha != new_plane_state->alpha) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANES:%d:%s] Alpha value cannot be changed in async flip\n",
+			    plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if (old_plane_state->pixel_blend_mode != new_plane_state->pixel_blend_mode) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANE:%d:%s] Pixel blend mode cannot be changed in async flip\n",
+			    plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if (old_plane_state->color_encoding != new_plane_state->color_encoding) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANE:%d:%s] Color encoding cannot be changed in async flip\n",
+			    plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if (old_plane_state->color_range != new_plane_state->color_range) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANE:%d:%s] Color range cannot be changed in async flip\n",
+			    plane->base.id, plane->name);
+		return -EINVAL;
+	}
+	if (old_plane_state->scaling_filter != new_plane_state->scaling_filter) {
+		drm_dbg_kms(plane->dev,
+			    "[PLANE:%d:%s] Scaling filter cannot be changed in async flip\n",
+			    plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * drm_atomic_plane_check - check plane state
  * @old_plane_state: old plane state to check
@@ -707,9 +817,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	struct drm_plane *plane = new_plane_state->plane;
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	const struct drm_framebuffer *fb = new_plane_state->fb;
+	const struct drm_plane_helper_funcs *helper_private = plane->helper_private;
 	unsigned int fb_width, fb_height;
 	struct drm_mode_rect *clips;
 	uint32_t num_clips;
+	int ret = 0;
 
 	/* either *both* CRTC and FB must be set, or neither */
 	if (crtc && !fb) {
@@ -809,7 +921,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		return -EINVAL;
 	}
 
-	return 0;
+	drm_atomic_plane_async_check(old_plane_state, new_plane_state);
+	if (helper_private && helper_private->atomic_async_check)
+		ret = helper_private->atomic_async_check(plane, new_plane_state->state,	true);
+
+	return ret;
 }
 
 static void drm_atomic_colorop_print_state(struct drm_printer *p,
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index eb4d7146f1f92eec58aba99ce6f5b678c0959b66..7b8e3b6ca3a5a93d3afbb923f20dacbd21cfc08b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -28,7 +28,6 @@
  */
 
 #include <drm/drm_atomic.h>
-#include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
@@ -1142,19 +1141,6 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
 	return ret;
 }
 
-static int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint64_t prop_value,
-					 struct drm_property *prop)
-{
-	if (ret != 0 || old_val != prop_value) {
-		drm_dbg_atomic(prop->dev,
-			       "[PROP:%d:%s] No prop can be changed during async flip\n",
-			       prop->base.id, prop->name);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 int drm_atomic_set_property(struct drm_atomic_state *state,
 			    struct drm_file *file_priv,
 			    struct drm_mode_object *obj,
@@ -1163,7 +1149,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			    bool async_flip)
 {
 	struct drm_mode_object *ref;
-	u64 old_val;
 	int ret;
 
 	if (!drm_property_change_valid_get(prop, prop_value, &ref))
@@ -1180,13 +1165,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
-		if (async_flip) {
-			ret = drm_atomic_connector_get_property(connector, connector_state,
-								prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			break;
-		}
-
 		ret = drm_atomic_connector_set_property(connector,
 				connector_state, file_priv,
 				prop, prop_value);
@@ -1203,13 +1181,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
-		if (async_flip) {
-			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
-							   prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			break;
-		}
-
 		ret = drm_atomic_crtc_set_property(crtc,
 				crtc_state, prop, prop_value);
 		break;
@@ -1218,7 +1189,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		struct drm_plane *plane = obj_to_plane(obj);
 		struct drm_plane_state *plane_state;
 		struct drm_mode_config *config = &plane->dev->mode_config;
-		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
 
 		plane_state = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state)) {
@@ -1226,33 +1196,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
-		if (async_flip) {
-			/* no-op changes are always allowed */
-			ret = drm_atomic_plane_get_property(plane, plane_state,
-							    prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-
-			/* fail everything that isn't no-op or a pure flip */
-			if (ret && prop != config->prop_fb_id &&
-			    prop != config->prop_in_fence_fd &&
-			    prop != config->prop_fb_damage_clips) {
-				break;
-			}
-
-			if (ret && plane->type != DRM_PLANE_TYPE_PRIMARY) {
-				/* ask the driver if this non-primary plane is supported */
-				if (plane_funcs && plane_funcs->atomic_async_check)
-					ret = plane_funcs->atomic_async_check(plane, state, true);
-
-				if (ret) {
-					drm_dbg_atomic(prop->dev,
-						       "[PLANE:%d:%s] does not support async flips\n",
-						       obj->id, plane->name);
-					break;
-				}
-			}
-		}
-
 		ret = drm_atomic_plane_set_property(plane,
 				plane_state, file_priv,
 				prop, prop_value);

-- 
2.25.1

