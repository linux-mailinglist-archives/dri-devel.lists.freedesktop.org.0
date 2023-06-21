Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127F2737D1C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482CB10E401;
	Wed, 21 Jun 2023 08:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E242F10E3FA;
 Wed, 21 Jun 2023 08:10:51 +0000 (UTC)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35052B2A;
 Wed, 21 Jun 2023 10:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687335015;
 bh=mVBu98iqneDFuXVf4ZnlC1ZWG8aMUrHiTZitFjzREr4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CzqqvXbnP78XWfZ9tzVun2bQBVEAUO5wCvCqLGyhfWn6kleuYk6hAIYHIZJP8LKA/
 OxgcWz0oB6GlIaAa1AZUH55zWH4572tvYeTU+U/kaLppDc3gQVZrXqnT5S49j5eom2
 lV2LPMFOd+isPGszmxYR0U8g0hzvNDgAPQUV9hUY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC 3/9] drm/drm_color_mgmt: add 3D LUT props to DRM color mgmt
Date: Wed, 21 Jun 2023 10:10:25 +0200
Message-Id: <20230621081031.7876-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
References: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
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
Cc: Victoria Brekenfeld <victoria@system76.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mdaenzer@redhat.com,
 aleixpol@kde.org, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, tzimmermann@suse.de, sunpeng.li@amd.com,
 Sebastian Wick <sebastian.wick@redhat.com>, mripard@kernel.org,
 Melissa Wen <mwen@igalia.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 xaver.hugl@gmail.com, linux-renesas-soc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Melissa Wen <mwen@igalia.com>

Add 3D LUT for gammar correction using a 3D lookup table. The position
in the color correction pipeline where 3D LUT is applied depends on hw
design, being after CTM or gamma. If just after CTM, a shaper lut must
be set to shape the content for a non-linear space. That details should
be handled by the driver according to its color capabilities.

--
v3:
- refactor CRTC 3D LUT API to use Alex Hung proposal for planes

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 14 ++++++++++++++
 drivers/gpu/drm/drm_color_mgmt.c          | 19 +++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c           |  2 ++
 drivers/gpu/drm/drm_mode_config.c         |  7 +++++++
 include/drm/drm_crtc.h                    | 20 +++++++++++++++++++-
 include/drm/drm_mode_config.h             | 13 +++++++++++++
 include/drm/drm_mode_object.h             |  2 +-
 8 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index b75dcf2aa881..0d5ceb5c654c 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -143,6 +143,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 		drm_property_blob_get(state->ctm);
 	if (state->shaper_lut)
 		drm_property_blob_get(state->shaper_lut);
+	if (state->lut3d)
+		drm_property_blob_get(state->lut3d);
 	if (state->gamma_lut)
 		drm_property_blob_get(state->gamma_lut);
 
@@ -218,6 +220,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
 	drm_property_blob_put(state->degamma_lut);
 	drm_property_blob_put(state->ctm);
 	drm_property_blob_put(state->shaper_lut);
+	drm_property_blob_put(state->lut3d);
 	drm_property_blob_put(state->gamma_lut);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d006e4934ba2..1f02022e45b3 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -438,6 +438,16 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == config->lut3d_property) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+					&state->lut3d,
+					val,
+					-1, sizeof(struct drm_color_lut),
+					&replaced);
+		state->color_mgmt_changed |= replaced;
+		return ret;
+	} else if (property == config->lut3d_mode_property) {
+		state->lut3d_mode = val;
 	} else if (property == config->gamma_lut_property) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->gamma_lut,
@@ -491,6 +501,10 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->ctm) ? state->ctm->base.id : 0;
 	else if (property == config->shaper_lut_property)
 		*val = (state->shaper_lut) ? state->shaper_lut->base.id : 0;
+	else if (property == config->lut3d_property)
+		*val = (state->lut3d) ? state->lut3d->base.id : 0;
+	else if (property == config->lut3d_mode_property)
+		*val = state->lut3d_mode;
 	else if (property == config->gamma_lut_property)
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
 	else if (property == config->prop_out_fence_ptr)
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index cf6a998b4298..f92633b3b67e 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -87,6 +87,25 @@
  *	publish the largest size, and sub-sample smaller sized LUTs
  *	appropriately.
  *
+ * “LUT3D”:
+ *	Blob property to set the 3D LUT mapping pixel data after the color
+ *	transformation matrix and before gamma 1D lut correction. The
+ *	data is interpreted as an array of &struct drm_color_lut elements.
+ *	Hardware might choose not to use the full precision of the LUT
+ *	elements.
+ *
+ *	Setting this to NULL (blob property value set to 0) means a the output
+ *	color is identical to the input color. This is generally the driver
+ *	boot-up state too. Drivers can access this blob through
+ *	&drm_crtc_state.gamma_lut.
+ *
+ * “LUT3D_MODE”:
+ *	Enum property to give the mode of the 3D lookup table to be set on the
+ *	LUT3D property. A mode specifies size, stride, bit depth and color
+ *	format and depends on the underlying hardware). If drivers support
+ *	multiple 3D LUT modes, they should be declared in a array of
+ *	drm_color_lut3d_mode and they will be advertised as an enum.
+ *
  * “GAMMA_LUT”:
  *	Blob property to set the gamma lookup table (LUT) mapping pixel data
  *	after the transformation matrix to data sent to the connector. The
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index a4ecb25fcfa0..fd76de50bb79 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -964,6 +964,8 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
 		replaced |= drm_property_replace_blob(&crtc_state->shaper_lut,
 						      NULL);
+		replaced |= drm_property_replace_blob(&crtc_state->lut3d,
+						      NULL);
 		replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
 						      gamma_lut);
 
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index e288bc4815ab..b82a7cb2a8f7 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -367,6 +367,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.shaper_lut_size_property = prop;
 
+	prop = drm_property_create(dev,
+			DRM_MODE_PROP_BLOB,
+			"LUT3D", 0);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.lut3d_property = prop;
+
 	prop = drm_property_create(dev,
 			DRM_MODE_PROP_BLOB,
 			"GAMMA_LUT", 0);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 7f289e0153aa..805a50c36a70 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -152,7 +152,7 @@ struct drm_crtc_state {
 	bool zpos_changed : 1;
 	/**
 	 * @color_mgmt_changed: Color management properties have changed
-	 * (@shaper_lut, @gamma_lut, @degamma_lut or @ctm). Used by
+	 * (@shaper_lut, @lut3d, @gamma_lut, @degamma_lut or @ctm). Used by
 	 * the atomic helpers and drivers to steer the atomic commit control
 	 * flow.
 	 */
@@ -289,6 +289,24 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *shaper_lut;
 
+	/**
+	 * @lut3d:
+	 *
+	 * 3D Lookup table for converting pixel data. Position where it takes
+	 * place depends on hw design, after @ctm or @gamma_lut. See
+	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array of
+	 * &struct drm_color_lut.
+	 */
+	struct drm_property_blob *lut3d;
+
+	/**
+	 * @lut3d_mode:
+	 * This is a blob_id and exposes the platform capabilities wrt
+	 * various 3dlut. This also helps user select a 3dlut mode amongst
+	 * the supported ones.
+	 */
+	u32 lut3d_mode;
+
 	/**
 	 * @target_vblank:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 0ad06ec8abec..0baf6354f757 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -820,6 +820,19 @@ struct drm_mode_config {
 	 */
 	struct drm_property *shaper_lut_size_property;
 
+	/**
+	 * @lut3d_property: Optional CRTC property to set the 3D LUT used to
+	 * convert colors; before or after gamma conversion depends on hw
+	 * design. A shaper LUT can be used to delinearize content before apply
+	 * 3D LUT correction.
+	 */
+	struct drm_property *lut3d_property;
+	/**
+	 * @lut3d_mode_property: Optional CRTC property to describe 3D LUT modes
+	 * supported by the driver.
+	 */
+	struct drm_property *lut3d_mode_property;
+
 	/**
 	 * @gamma_lut_property: Optional CRTC property to set the LUT used to
 	 * convert the colors, after the CTM matrix, to the gamma space of the
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index 5e75b51936e6..d39ee21f26db 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -60,7 +60,7 @@ struct drm_mode_object {
 	void (*free_cb)(struct kref *kref);
 };
 
-#define DRM_OBJECT_MAX_PROPERTY 26
+#define DRM_OBJECT_MAX_PROPERTY 28
 /**
  * struct drm_object_properties - property tracking for &drm_mode_object
  */
-- 
2.40.1

