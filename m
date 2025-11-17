Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F311C6697E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 00:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425D510E403;
	Mon, 17 Nov 2025 23:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cIDw35Ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B797310E3FE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 23:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763423544;
 bh=TO4Q2w3DQU4y2yCP5EtzYi233sbVx1lxi/LEp43Lwxc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cIDw35EpHbretKZiT6jByIAZFjmN00bxDWefoyNufV8H8Rsa3eiQNkbRKNhZ/2d8r
 hqmcvMFJvKtnfY+SsYx1CMjrFtFeEuoVx6uwHfPvqrFrQojGdOUFsSi57C3yalKCg4
 w/dJdIWbzkvHygdagvG95jLSA60S2bslHOh9tgzge+xbAXpNyCv3e6AcxKrV5qu1ld
 35xwcXqe+J9bjiGATWRulpTKmK1o2b8IpdI1juJk1JbpGV82VrMShsc5ESZ4MabeuL
 Tn+58Gw37Yj4+bQeuazF8KkqAyMyrjEMjUh2xZBiH3z3aTDzQYM0FuC5qjYjTjQPUp
 +rCRbpOjKyiyw==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D4E2E17E1389;
 Tue, 18 Nov 2025 00:52:23 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 18 Nov 2025 01:52:00 +0200
Subject: [PATCH v3 2/4] drm: Add CRTC background color property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-rk3588-bgcolor-v3-2-a2cc909428ea@collabora.com>
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
In-Reply-To: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
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

Some display controllers can be hardware programmed to show non-black
colors for pixels that are either not covered by any plane or are
exposed through transparent regions of higher planes.  This feature can
help reduce memory bandwidth usage, e.g. in compositors managing a UI
with a solid background color while using smaller planes to render the
remaining content.

To support this capability, introduce the BACKGROUND_COLOR standard DRM
mode property, which can be attached to a CRTC through the
drm_crtc_attach_background_color_property() helper function.

Additionally, define a 64-bit ARGB format value to be built with the
help of a couple of dedicated DRM_ARGB64_PREP*() helpers.  Individual
color components can be extracted with desired precision using the
corresponding DRM_ARGB64_GET*() macros.

Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_blend.c               | 39 ++++++++++++++++--
 drivers/gpu/drm/drm_mode_config.c         |  6 +++
 include/drm/drm_blend.h                   |  4 +-
 include/drm/drm_crtc.h                    | 12 ++++++
 include/drm/drm_mode_config.h             |  5 +++
 include/uapi/drm/drm_mode.h               | 67 +++++++++++++++++++++++++++++++
 8 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7142e163e618..fc93ef6eebc4 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -75,6 +75,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
 				     struct drm_crtc *crtc)
 {
 	crtc_state->crtc = crtc;
+	crtc_state->background_color = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index b2cb5ae5a139..211541d753ce 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -407,6 +407,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == config->background_color_property) {
+		state->background_color = val;
 	} else if (property == config->prop_out_fence_ptr) {
 		s32 __user *fence_ptr = u64_to_user_ptr(val);
 
@@ -454,6 +456,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->ctm) ? state->ctm->base.id : 0;
 	else if (property == config->gamma_lut_property)
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
+	else if (property == config->background_color_property)
+		*val = state->background_color;
 	else if (property == config->prop_out_fence_ptr)
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6852d73c931c..f249af2a11af 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -191,10 +191,6 @@
  *		 plane does not expose the "alpha" property, then this is
  *		 assumed to be 1.0
  *
- * Note that all the property extensions described here apply either to the
- * plane or the CRTC (e.g. for the background color, which currently is not
- * exposed and assumed to be black).
- *
  * SCALING_FILTER:
  *     Indicates scaling filter to be used for plane scaler
  *
@@ -207,6 +203,25 @@
  *
  * Drivers can set up this property for a plane by calling
  * drm_plane_create_scaling_filter_property
+ *
+ * The property extensions described above all apply to the plane.  Drivers
+ * may also expose the following crtc property extension:
+ *
+ * BACKGROUND_COLOR:
+ *	Background color is set up with drm_crtc_attach_background_color_property(),
+ *	and expects a 64-bit ARGB value following DRM_FORMAT_ARGB16161616, as
+ *	generated by the DRM_ARGB64_PREP*() helpers. It controls the color of a
+ *	full-screen layer that exists below all planes. This color will be used
+ *	for pixels not covered by any plane and may also be blended with plane
+ *	contents as allowed by a plane's alpha values.
+ *	The background color defaults to black, and is assumed to be black for
+ *	drivers that do not expose this property. Although background color
+ *	isn't a plane, it is assumed that the color provided here undergoes the
+ *	CRTC degamma/CSC/gamma transformations applied after the planes blending.
+ *	Note that the color value includes an alpha channel, hence non-opaque
+ *	background color values are allowed, but since physically transparent
+ *	monitors do not (yet) exists, the final alpha value may not reach the
+ *	video sink or it may simply ignore it.
  */
 
 /**
@@ -621,3 +636,19 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+/**
+ * drm_crtc_attach_background_color_property - attach background color property
+ * @crtc: drm crtc
+ *
+ * Attaches the background color property to @crtc.  The property defaults to
+ * solid black and will accept 64-bit ARGB values in the format generated by
+ * DRM_ARGB64_PREP*() helpers.
+ */
+void drm_crtc_attach_background_color_property(struct drm_crtc *crtc)
+{
+	drm_object_attach_property(&crtc->base,
+				   crtc->dev->mode_config.background_color_property,
+				   DRM_ARGB64_PREP(0xffff, 0, 0, 0));
+}
+EXPORT_SYMBOL(drm_crtc_attach_background_color_property);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 25f376869b3a..6d70bfab45ca 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -375,6 +375,12 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.gamma_lut_size_property = prop;
 
+	prop = drm_property_create_range(dev, 0,
+					 "BACKGROUND_COLOR", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.background_color_property = prop;
+
 	prop = drm_property_create(dev,
 				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
 				   "IN_FORMATS", 0);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..c7e888767c81 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -31,8 +31,9 @@
 #define DRM_MODE_BLEND_COVERAGE		1
 #define DRM_MODE_BLEND_PIXEL_NONE	2
 
-struct drm_device;
 struct drm_atomic_state;
+struct drm_crtc;
+struct drm_device;
 struct drm_plane;
 
 static inline bool drm_rotation_90_or_270(unsigned int rotation)
@@ -58,4 +59,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
+void drm_crtc_attach_background_color_property(struct drm_crtc *crtc);
 #endif
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66278ffeebd6..d99a74258d3d 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -274,6 +274,18 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @background_color:
+	 *
+	 * RGB value representing the pipe's background color.  The background
+	 * color (aka "canvas color") of a pipe is the color that will be used
+	 * for pixels not covered by a plane, or covered by transparent pixels
+	 * of a plane.  The value here should be built using DRM_ARGB64_PREP*()
+	 * helpers, while the individual color components can be extracted with
+	 * desired precision via the DRM_ARGB64_GET*() macros.
+	 */
+	u64 background_color;
+
 	/**
 	 * @target_vblank:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 2e848b816218..ea422afec5c4 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -814,6 +814,11 @@ struct drm_mode_config {
 	 * gamma LUT as supported by the driver (read-only).
 	 */
 	struct drm_property *gamma_lut_size_property;
+	/**
+	 * @background_color_property: Optional CRTC property to set the
+	 * background color.
+	 */
+	struct drm_property *background_color_property;
 
 	/**
 	 * @suggested_x_property: Optional connector property with a hint for
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 1e0e02a79b5c..63b9489fd582 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -27,6 +27,8 @@
 #ifndef _DRM_MODE_H
 #define _DRM_MODE_H
 
+#include <linux/const.h>
+
 #include "drm.h"
 
 #if defined(__cplusplus)
@@ -1411,6 +1413,71 @@ struct drm_mode_closefb {
 	__u32 pad;
 };
 
+/*
+ * Put 16-bit ARGB values into a standard 64-bit representation that can be
+ * used for ioctl parameters, inter-driver communication, etc.
+ *
+ * If the component values being provided contain less than 16 bits of
+ * precision, use a conversion ratio to get a better color approximation.
+ * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
+ * the input and output precision, respectively.
+ */
+#define __DRM_ARGB64_PREP(c, shift)					\
+	(((__u64)(c) & 0xffffU) << (shift))
+
+#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)(				\
+{									\
+	__u16 mask = (1U << (bpc)) - 1;					\
+	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
+						0xffffU, mask);		\
+	__DRM_ARGB64_PREP(conv, shift);					\
+}									\
+)
+
+#define DRM_ARGB64_PREP_BPC(alpha, red, green, blue, bpc)(		\
+{									\
+	__typeof__(bpc) __bpc = bpc;					\
+	__DRM_ARGB64_PREP_BPC(alpha, 48, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(red,   32, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(green, 16, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(blue,   0, __bpc);			\
+}									\
+)
+
+#define DRM_ARGB64_PREP(alpha, red, green, blue)			\
+	(__DRM_ARGB64_PREP(alpha, 48) |					\
+	 __DRM_ARGB64_PREP(red,   32) |					\
+	 __DRM_ARGB64_PREP(green, 16) |					\
+	 __DRM_ARGB64_PREP(blue,   0))
+
+/*
+ * Extract the specified color component from a standard 64-bit ARGB value.
+ *
+ * If the requested precision is less than 16 bits, make use of a conversion
+ * ratio calculated as (2^bpc - 1) / (2^16 - 1), where bpc and 16 are the
+ * output and input precision, respectively.
+ */
+#define __DRM_ARGB64_GET(c, shift)					\
+	((__u16)(((__u64)(c) >> (shift)) & 0xffffU))
+
+#define __DRM_ARGB64_GET_BPC(c, shift, bpc)(				\
+{									\
+	__u16 comp = __DRM_ARGB64_GET(c, shift);			\
+	__KERNEL_DIV_ROUND_CLOSEST(comp * ((1U << (bpc)) - 1),		\
+				   0xffffU);				\
+}									\
+)
+
+#define DRM_ARGB64_GETA_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 48, bpc)
+#define DRM_ARGB64_GETR_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 32, bpc)
+#define DRM_ARGB64_GETG_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 16, bpc)
+#define DRM_ARGB64_GETB_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 0, bpc)
+
+#define DRM_ARGB64_GETA(c)		__DRM_ARGB64_GET(c, 48)
+#define DRM_ARGB64_GETR(c)		__DRM_ARGB64_GET(c, 32)
+#define DRM_ARGB64_GETG(c)		__DRM_ARGB64_GET(c, 16)
+#define DRM_ARGB64_GETB(c)		__DRM_ARGB64_GET(c, 0)
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.51.2

