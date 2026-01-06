Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A177CF96C2
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 17:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783B710E218;
	Tue,  6 Jan 2026 16:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="voJExWmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5A010E218
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 16:43:10 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1767717787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mg7xkbHFiTIb0EaR99sjUoEZxLHlfxayhWVLcb8JQa0=;
 b=voJExWmWZY5vC6VbAcLmlBLrCr4D94NwTF9ZPM+per4kzkPBJemnjZ/LZOZuUewG61cifF
 hwkQ33GQD6sKWCDTgoMBFSoZXpjLBtL80KXNKCrGpHj5TvK3P5epXj9JBoip57EElyfbmA
 aDdzUb9jfv0CDGNdu9FwUqcGHG+qkS0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 1/4] drm/drm_blend: Allow specifying blend mode default
Date: Tue,  6 Jan 2026 11:42:44 -0500
Message-Id: <20260106164247.472544-2-sean.anderson@linux.dev>
In-Reply-To: <20260106164247.472544-1-sean.anderson@linux.dev>
References: <20260106164247.472544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Not all devices support pre-multiplied blend mode. In these cases,
userspace cannot expect this mode to be the default, since the hardware
cannot produce it (and could not default to it before a blend mode
property existed). Therefore, add a variant of
drm_plane_create_blend_mode_property that allows specifying the default.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 drivers/gpu/drm/drm_blend.c | 22 ++++++++++------------
 include/drm/drm_blend.h     | 26 ++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6852d73c931c..fac0f1478385 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -546,12 +546,10 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_normalize_zpos);
 
 /**
- * drm_plane_create_blend_mode_property - create a new blend mode property
+ * drm_plane_create_blend_mode_default - create a new blend mode property
  * @plane: drm plane
- * @supported_modes: bitmask of supported modes, must include
- *		     BIT(DRM_MODE_BLEND_PREMULTI). Current DRM assumption is
- *		     that alpha is premultiplied, and old userspace can break if
- *		     the property defaults to anything else.
+ * @supported_modes: bitmask of supported modes, must include BIT(@def)
+ * @def: Default blend mode
  *
  * This creates a new property describing the blend mode.
  *
@@ -571,11 +569,11 @@ EXPORT_SYMBOL(drm_atomic_normalize_zpos);
  *	pre-multiplied and will do so when blending them to the background color
  *	values.
  *
- * RETURNS:
- * Zero for success or -errno
+ * Return: Zero for success or -errno
  */
-int drm_plane_create_blend_mode_property(struct drm_plane *plane,
-					 unsigned int supported_modes)
+int drm_plane_create_blend_mode_default(struct drm_plane *plane,
+					unsigned int supported_modes,
+					unsigned int def)
 {
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
@@ -590,7 +588,7 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	int i;
 
 	if (WARN_ON((supported_modes & ~valid_mode_mask) ||
-		    ((supported_modes & BIT(DRM_MODE_BLEND_PREMULTI)) == 0)))
+		    !(supported_modes & BIT(def))))
 		return -EINVAL;
 
 	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM,
@@ -615,9 +613,9 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 		}
 	}
 
-	drm_object_attach_property(&plane->base, prop, DRM_MODE_BLEND_PREMULTI);
+	drm_object_attach_property(&plane->base, prop, def);
 	plane->blend_mode_property = prop;
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+EXPORT_SYMBOL(drm_plane_create_blend_mode_default);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..244f0694d0a5 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -56,6 +56,28 @@ int drm_plane_create_zpos_immutable_property(struct drm_plane *plane,
 					     unsigned int zpos);
 int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
-int drm_plane_create_blend_mode_property(struct drm_plane *plane,
-					 unsigned int supported_modes);
+int drm_plane_create_blend_mode_default(struct drm_plane *plane,
+					unsigned int supported_modes,
+					unsigned int def);
+
+/**
+ * drm_plane_create_blend_mode_property - create a new blend mode property
+ * @plane: drm plane
+ * @supported_modes: bitmask of supported modes, must include
+ *		     BIT(DRM_MODE_BLEND_PREMULTI). Current DRM assumption is
+ *		     that alpha is premultiplied, and old userspace can break if
+ *		     the property defaults to anything else.
+ *
+ * This creates a new property describing the blend mode. See
+ * drm_plane_create_blend_mode_default() for details.
+ *
+ * Return: Zero for success or -errno
+ */
+static inline int
+drm_plane_create_blend_mode_property(struct drm_plane *plane,
+				     unsigned int supported_modes)
+{
+	return drm_plane_create_blend_mode_default(plane, supported_modes,
+						   DRM_MODE_BLEND_PREMULTI);
+}
 #endif
-- 
2.35.1.1320.gc452695387.dirty

