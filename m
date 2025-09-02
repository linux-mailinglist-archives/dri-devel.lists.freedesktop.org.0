Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EBBB3FA4D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B5810E617;
	Tue,  2 Sep 2025 09:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QLqWswT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DC510E614
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756805287;
 bh=YtwElPS8aR4gW4cx1Fi4f1c2ZQrNeyC9qjC7zQ2lfzM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QLqWswT/plgp0WihKxXmc8Ek7MMT+Bv87dJrvqF7XJTaTKd3VbFvZ0fRjzzRp10Ou
 +81ctYoi0IN98HhTQP+pYTFSN/5wDzNXBl+EyANuCrkPbnOR2JTcd8pvtw328KTuQY
 XAYLHfJcI8750dVd0WKks/seZkLXC0jZbzxQYSIlBcSccN6sL/lzOKjPnnmfBxnY02
 /fh0r4S08W3Z0whRPFKj/AISBrBnhMzHG2Dz++2bjo0JSiMNPEWvCn66TimZx6LYcn
 72EOXt3RVBt5kJnBwtuZl2yWoQKZsrMS+FzeC6xC3Lu0LxKj7DfZWaMuOwxO8qOuou
 28YSy7OXmP3Jg==
Received: from localhost (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 0E23617E12B9;
 Tue,  2 Sep 2025 11:28:07 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Sep 2025 12:27:56 +0300
Subject: [PATCH 1/2] drm: Add CRTC background color property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-rk3588-bgcolor-v1-1-fd97df91d89f@collabora.com>
References: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
In-Reply-To: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
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
help of a dedicated drm_argb64() utility macro.  Individual color
components can be extracted with desired precision using the
corresponding DRM_ARGB64_*() macros.

Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++++
 drivers/gpu/drm/drm_blend.c               | 37 +++++++++++++++++++++++++++----
 drivers/gpu/drm/drm_mode_config.c         |  6 +++++
 include/drm/drm_blend.h                   |  4 +++-
 include/drm/drm_crtc.h                    | 12 ++++++++++
 include/drm/drm_mode_config.h             |  5 +++++
 include/uapi/drm/drm_mode.h               | 30 +++++++++++++++++++++++++
 8 files changed, 94 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..359264cf467c5270b77f0b04548073bc92cb812e 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -75,6 +75,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
 				     struct drm_crtc *crtc)
 {
 	crtc_state->crtc = crtc;
+	crtc_state->background_color = drm_argb64(0xffff, 0, 0, 0);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e25878c953b9b41539c8566d55c6d9..a447cb119aaa6cd11348be77b39f342a1386836d 100644
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
 
@@ -452,6 +454,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->ctm) ? state->ctm->base.id : 0;
 	else if (property == config->gamma_lut_property)
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
+	else if (property == config->background_color_property)
+		*val = state->background_color;
 	else if (property == config->prop_out_fence_ptr)
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6852d73c931ce32e62062e2b8f8c5e38612d5210..5a287d12685b007a2732f510f62675f500e53727 100644
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
@@ -207,6 +203,23 @@
  *
  * Drivers can set up this property for a plane by calling
  * drm_plane_create_scaling_filter_property
+ *
+ * The property extensions described above all apply to the plane.  Drivers
+ * may also expose the following crtc property extension:
+ *
+ * BACKGROUND_COLOR:
+ *	Background color is set via drm_crtc_attach_background_color_property().
+ *	It controls the ARGB color of a full-screen layer that exists below all
+ *	planes.  This color will be used for pixels not covered by any plane and
+ *	may also be blended with plane contents as allowed by a plane's alpha
+ *	values.  The background color defaults to black, and is assumed to be
+ *	black for drivers that do not expose this property.  Although background
+ *	color isn't a plane, it is assumed that the color provided here
+ *	undergoes the same pipe-level degamma/CSC/gamma transformations that
+ *	planes undergo.  Note that the color value provided here includes an
+ *	alpha channel, hence non-opaque background color values are allowed, but
+ *	are generally only honored in special cases (e.g. when a memory
+ *	writeback connector is in use).
  */
 
 /**
@@ -621,3 +634,19 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
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
+ * drm_argb64().
+ */
+void drm_crtc_attach_background_color_property(struct drm_crtc *crtc)
+{
+	drm_object_attach_property(&crtc->base,
+				   crtc->dev->mode_config.background_color_property,
+				   drm_argb64(0xffff, 0, 0, 0));
+}
+EXPORT_SYMBOL(drm_crtc_attach_background_color_property);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 25f376869b3a41d47bbe72b0df3e35cad142f3e6..6d70bfab45ca2bb81ed3ca1940fd1cd85e8cc58e 100644
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
index 88bdfec3bd8848acd1ef5742aaaa23483b332a2e..c7e888767c81c2745cd3cce88c10db4bbe305d1e 100644
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
index caa56e039da2a748cf40ebf45b37158acda439d9..4653dacc1077b9ed8fb4cf27cc84530ba1706f6a 100644
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
+	 * of a plane.  The value here should be built using drm_argb64(), while
+	 * the individual color components can be extracted with desired
+	 * precision via the DRM_ARGB64_*() macros.
+	 */
+	u64 background_color;
+
 	/**
 	 * @target_vblank:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 2e848b816218584eb077ed887bf97705f012a622..ea422afec5c4108a223dc872e1b6835ffc596cc3 100644
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
index a122bea2559387576150236e3a88f99c24ad3138..4bd6a8ca8868109bcbe21f9f6e9864519c9d03ec 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1363,6 +1363,36 @@ struct drm_mode_closefb {
 	__u32 pad;
 };
 
+/*
+ * Put 16-bit ARGB values into a standard 64-bit representation that
+ * can be used for ioctl parameters, inter-driver communication, etc.
+ */
+static inline __u64
+drm_argb64(__u16 alpha, __u16 red, __u16 green, __u16 blue)
+{
+	return (__u64)alpha << 48 | (__u64)red << 32 | (__u64)green << 16 | blue;
+}
+
+/*
+ * Extract the specified number of least-significant bits of a specific
+ * color component from a standard 64-bit ARGB value.
+ */
+#define DRM_ARGB64_COMP(c, shift, numlsb) \
+	((__u16)(((c) >> (shift)) & ((1UL << (numlsb) % 17) - 1)))
+#define DRM_ARGB64_ALPHA_LSB(c, numlsb) DRM_ARGB64_COMP(c, 48, numlsb)
+#define DRM_ARGB64_RED_LSB(c, numlsb)   DRM_ARGB64_COMP(c, 32, numlsb)
+#define DRM_ARGB64_GREEN_LSB(c, numlsb) DRM_ARGB64_COMP(c, 16, numlsb)
+#define DRM_ARGB64_BLUE_LSB(c, numlsb)  DRM_ARGB64_COMP(c, 0, numlsb)
+
+/*
+ * Convenience wrappers to extract all 16 bits of a specific color
+ * component from a standard 64-bit ARGB value.
+ */
+#define DRM_ARGB64_ALPHA(c)		DRM_ARGB64_ALPHA_LSB(c, 16)
+#define DRM_ARGB64_RED(c)		DRM_ARGB64_RED_LSB(c, 16)
+#define DRM_ARGB64_GREEN(c)		DRM_ARGB64_GREEN_LSB(c, 16)
+#define DRM_ARGB64_BLUE(c)		DRM_ARGB64_BLUE_LSB(c, 16)
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.51.0

