Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601192AECA5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 10:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F268889FD1;
	Wed, 11 Nov 2020 09:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE4D89FD1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 09:07:44 +0000 (UTC)
Date: Wed, 11 Nov 2020 09:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605085662;
 bh=kJ5QlfxvypAUrtheNanFUIjqbAE4u25pXZe2qlqJZ3k=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=X8Tl1f2Clzffg4PVyDGsbq3rc4eRFfgKthimHcRh3ev+km8T9lAt8j/xZkzXBc5+P
 PbIZWyiMKZupXLAvi1AUn3Lcg5LgNGsiSCfSe7PFkl4pcw77HH2HD3UJAEK2pLOl0u
 DZ3B9szf0vXqKkgeUvonJI8N3gjQHPXZf52WSDrsmcHmonswS1emnA3hYDCdg8ERBX
 6dEuULEveTYQWmpwdfy07l0fjiKkkNDXHTwjrI0OnXjmf/4Xp1TvuO0+7Bt7lPpVpB
 fU8ac50cXokkhJe4lzmA8Ow+XKl/Yp0ah4S9wjq6EINX1pNLwZ9Rn5C7yllJa4MrI+
 B6rPPtNQ/FVcw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 1/2] drm: convert drm_atomic_uapi.c to new debug helpers
Message-ID: <FpVdsmqIh7IkH7YIwBjmp5ict1qi4NZlwHrIps@cp4-web-034.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Migrate from DRM_DEBUG_ATOMIC to drm_dbg_atomic.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 113 +++++++++++++++++-------------
 1 file changed, 66 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ef82009035e6..efab3d518891 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -85,13 +85,15 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 
 		drm_mode_copy(&state->mode, mode);
 		state->enable = true;
-		DRM_DEBUG_ATOMIC("Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
-				 mode->name, crtc->base.id, crtc->name, state);
+		drm_dbg_atomic(crtc->dev,
+			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
+			       mode->name, crtc->base.id, crtc->name, state);
 	} else {
 		memset(&state->mode, 0, sizeof(state->mode));
 		state->enable = false;
-		DRM_DEBUG_ATOMIC("Set [NOMODE] for [CRTC:%d:%s] state %p\n",
-				 crtc->base.id, crtc->name, state);
+		drm_dbg_atomic(crtc->dev,
+			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
+			       crtc->base.id, crtc->name, state);
 	}
 
 	return 0;
@@ -128,31 +130,35 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
 		int ret;
 
 		if (blob->length != sizeof(struct drm_mode_modeinfo)) {
-			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] bad mode blob length: %zu\n",
-					 crtc->base.id, crtc->name,
-					 blob->length);
+			drm_dbg_atomic(crtc->dev,
+				       "[CRTC:%d:%s] bad mode blob length: %zu\n",
+				       crtc->base.id, crtc->name,
+				       blob->length);
 			return -EINVAL;
 		}
 
 		ret = drm_mode_convert_umode(crtc->dev,
 					     &state->mode, blob->data);
 		if (ret) {
-			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
-					 crtc->base.id, crtc->name,
-					 ret, drm_get_mode_status_name(state->mode.status));
+			drm_dbg_atomic(crtc->dev,
+				       "[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
+				       crtc->base.id, crtc->name,
+				       ret, drm_get_mode_status_name(state->mode.status));
 			drm_mode_debug_printmodeline(&state->mode);
 			return -EINVAL;
 		}
 
 		state->mode_blob = drm_property_blob_get(blob);
 		state->enable = true;
-		DRM_DEBUG_ATOMIC("Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
-				 state->mode.name, crtc->base.id, crtc->name,
-				 state);
+		drm_dbg_atomic(crtc->dev,
+			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
+			       state->mode.name, crtc->base.id, crtc->name,
+			       state);
 	} else {
 		state->enable = false;
-		DRM_DEBUG_ATOMIC("Set [NOMODE] for [CRTC:%d:%s] state %p\n",
-				 crtc->base.id, crtc->name, state);
+		drm_dbg_atomic(crtc->dev,
+			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
+			       crtc->base.id, crtc->name, state);
 	}
 
 	return 0;
@@ -202,12 +208,14 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
 	}
 
 	if (crtc)
-		DRM_DEBUG_ATOMIC("Link [PLANE:%d:%s] state %p to [CRTC:%d:%s]\n",
-				 plane->base.id, plane->name, plane_state,
-				 crtc->base.id, crtc->name);
+		drm_dbg_atomic(plane->dev,
+			       "Link [PLANE:%d:%s] state %p to [CRTC:%d:%s]\n",
+			       plane->base.id, plane->name, plane_state,
+			       crtc->base.id, crtc->name);
 	else
-		DRM_DEBUG_ATOMIC("Link [PLANE:%d:%s] state %p to [NOCRTC]\n",
-				 plane->base.id, plane->name, plane_state);
+		drm_dbg_atomic(plane->dev,
+			       "Link [PLANE:%d:%s] state %p to [NOCRTC]\n",
+			       plane->base.id, plane->name, plane_state);
 
 	return 0;
 }
@@ -230,12 +238,14 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 	struct drm_plane *plane = plane_state->plane;
 
 	if (fb)
-		DRM_DEBUG_ATOMIC("Set [FB:%d] for [PLANE:%d:%s] state %p\n",
-				 fb->base.id, plane->base.id, plane->name,
-				 plane_state);
+		drm_dbg_atomic(plane->dev,
+			       "Set [FB:%d] for [PLANE:%d:%s] state %p\n",
+			       fb->base.id, plane->base.id, plane->name,
+			       plane_state);
 	else
-		DRM_DEBUG_ATOMIC("Set [NOFB] for [PLANE:%d:%s] state %p\n",
-				 plane->base.id, plane->name, plane_state);
+		drm_dbg_atomic(plane->dev,
+			       "Set [NOFB] for [PLANE:%d:%s] state %p\n",
+			       plane->base.id, plane->name, plane_state);
 
 	drm_framebuffer_assign(&plane_state->fb, fb);
 }
@@ -324,13 +334,15 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 		drm_connector_get(conn_state->connector);
 		conn_state->crtc = crtc;
 
-		DRM_DEBUG_ATOMIC("Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
-				 connector->base.id, connector->name,
-				 conn_state, crtc->base.id, crtc->name);
+		drm_dbg_atomic(crtc->dev,
+			       "Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
+			       connector->base.id, connector->name,
+			       conn_state, crtc->base.id, crtc->name);
 	} else {
-		DRM_DEBUG_ATOMIC("Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
-				 connector->base.id, connector->name,
-				 conn_state);
+		drm_dbg_atomic(crtc->dev,
+			       "Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
+			       connector->base.id, connector->name,
+			       conn_state);
 	}
 
 	return 0;
@@ -474,9 +486,10 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
-		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
-				 crtc->base.id, crtc->name,
-				 property->base.id, property->name);
+		drm_dbg_atomic(crtc->dev,
+			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
+			       crtc->base.id, crtc->name,
+			       property->base.id, property->name);
 		return -EINVAL;
 	}
 
@@ -570,8 +583,9 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->pixel_blend_mode = val;
 	} else if (property == plane->rotation_property) {
 		if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK)) {
-			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] bad rotation bitmask: 0x%llx\n",
-					 plane->base.id, plane->name, val);
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] bad rotation bitmask: 0x%llx\n",
+				       plane->base.id, plane->name, val);
 			return -EINVAL;
 		}
 		state->rotation = val;
@@ -595,9 +609,10 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
 	} else {
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
-				 plane->base.id, plane->name,
-				 property->base.id, property->name);
+		drm_dbg_atomic(plane->dev,
+			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
+			       plane->base.id, plane->name,
+			       property->base.id, property->name);
 		return -EINVAL;
 	}
 
@@ -665,17 +680,20 @@ static int drm_atomic_set_writeback_fb_for_connector(
 		struct drm_framebuffer *fb)
 {
 	int ret;
+	struct drm_connector *conn = conn_state->connector;
 
 	ret = drm_writeback_set_fb(conn_state, fb);
 	if (ret < 0)
 		return ret;
 
 	if (fb)
-		DRM_DEBUG_ATOMIC("Set [FB:%d] for connector state %p\n",
-				 fb->base.id, conn_state);
+		drm_dbg_atomic(conn->dev,
+			       "Set [FB:%d] for connector state %p\n",
+			       fb->base.id, conn_state);
 	else
-		DRM_DEBUG_ATOMIC("Set [NOFB] for connector state %p\n",
-				 conn_state);
+		drm_dbg_atomic(conn->dev,
+			       "Set [NOFB] for connector state %p\n",
+			       conn_state);
 
 	return 0;
 }
@@ -782,9 +800,10 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
 	} else {
-		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]]\n",
-				 connector->base.id, connector->name,
-				 property->base.id, property->name);
+		drm_dbg_atomic(connector->dev,
+			       "[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]]\n",
+			       connector->base.id, connector->name,
+			       property->base.id, property->name);
 		return -EINVAL;
 	}
 
@@ -1282,7 +1301,7 @@ static void complete_signaling(struct drm_device *dev,
 		/* If this fails log error to the user */
 		if (fence_state[i].out_fence_ptr &&
 		    put_user(-1, fence_state[i].out_fence_ptr))
-			DRM_DEBUG_ATOMIC("Couldn't clear out_fence_ptr\n");
+			drm_dbg_atomic(dev, "Couldn't clear out_fence_ptr\n");
 	}
 
 	kfree(fence_state);
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
