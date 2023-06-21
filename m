Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF7B737D1D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3871B10E400;
	Wed, 21 Jun 2023 08:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F53310E3FA;
 Wed, 21 Jun 2023 08:10:50 +0000 (UTC)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 722A3A4C;
 Wed, 21 Jun 2023 10:10:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687335014;
 bh=ThZXeOv85mMNQ0BFghMgTes+iyHPvjygMO8QFqUqz0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uAG8/AiOyTikQyVl8SvtF4OwFf7udehYiR9VWWkJFA1FZxrz3xPO137/xM+HQxkbL
 kNj3GM+SLLp0QZYZgzpUcuRYeGoOQq5w7GqxMOEeF8Kx1BzZ5sdhUn2zVc5cxrwjG6
 QCeNePGNgYOrlajY9su7cHkJkBfFGy2yQhzO3jg8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC 2/9] drm/drm_color_mgmt: add shaper LUT to color mgmt properties
Date: Wed, 21 Jun 2023 10:10:24 +0200
Message-Id: <20230621081031.7876-3-jacopo.mondi@ideasonboard.com>
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

Shaper LUT is used to shape the content after blending, i.e.,
de-linearize or normalize space before applying a 3D LUT color
correction. In the next patch, we add 3D LUT property to DRM color
management after this shaper LUT and before the current gamma LUT.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  4 ++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 10 ++++++++++
 drivers/gpu/drm/drm_color_mgmt.c          | 18 ++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c           |  3 +++
 drivers/gpu/drm/drm_mode_config.c         | 14 ++++++++++++++
 include/drm/drm_crtc.h                    | 14 ++++++++++++--
 include/drm/drm_mode_config.h             | 12 ++++++++++++
 include/drm/drm_mode_object.h             |  2 +-
 8 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..b75dcf2aa881 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -141,8 +141,11 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 		drm_property_blob_get(state->degamma_lut);
 	if (state->ctm)
 		drm_property_blob_get(state->ctm);
+	if (state->shaper_lut)
+		drm_property_blob_get(state->shaper_lut);
 	if (state->gamma_lut)
 		drm_property_blob_get(state->gamma_lut);
+
 	state->mode_changed = false;
 	state->active_changed = false;
 	state->planes_changed = false;
@@ -214,6 +217,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
 	drm_property_blob_put(state->mode_blob);
 	drm_property_blob_put(state->degamma_lut);
 	drm_property_blob_put(state->ctm);
+	drm_property_blob_put(state->shaper_lut);
 	drm_property_blob_put(state->gamma_lut);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d867e7f9f2cd..d006e4934ba2 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -430,6 +430,14 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == config->shaper_lut_property) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+					&state->shaper_lut,
+					val,
+					-1, sizeof(struct drm_color_lut),
+					&replaced);
+		state->color_mgmt_changed |= replaced;
+		return ret;
 	} else if (property == config->gamma_lut_property) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->gamma_lut,
@@ -481,6 +489,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->degamma_lut) ? state->degamma_lut->base.id : 0;
 	else if (property == config->ctm_property)
 		*val = (state->ctm) ? state->ctm->base.id : 0;
+	else if (property == config->shaper_lut_property)
+		*val = (state->shaper_lut) ? state->shaper_lut->base.id : 0;
 	else if (property == config->gamma_lut_property)
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
 	else if (property == config->prop_out_fence_ptr)
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index d021497841b8..cf6a998b4298 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -69,6 +69,24 @@
  *	boot-up state too. Drivers can access the blob for the color conversion
  *	matrix through &drm_crtc_state.ctm.
  *
+ * “SHAPER_LUT”:
+ *	Blob property to set the shaper lut shaping pixel data after the color
+ *	transformation matrix and before applying 3D Lookup Table (3D LUT). It
+ *	can be used to delinearize content to get an effective 3D LUT mapping.
+ *	The data is interpreted as an array of &struct drm_color_lut elements.
+ *
+ *	Setting this to NULL (blob property value set to 0) means the output
+ *	color is identical to the input color. This is generally the driver
+ *	boot-up state too. Drivers can access this blob through
+ *	&drm_crtc_state.gamma_lut.
+ *
+ * “SHAPER_LUT_SIZE”:
+ *	Unsigned range property to give the size of the shaper lookup table to
+ *	be set on the SHAPER_LUT property (the size depends on the underlying
+ *	hardware). If drivers support multiple LUT sizes then they should
+ *	publish the largest size, and sub-sample smaller sized LUTs
+ *	appropriately.
+ *
  * “GAMMA_LUT”:
  *	Blob property to set the gamma lookup table (LUT) mapping pixel data
  *	after the transformation matrix to data sent to the connector. The
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 9978147bbc8a..a4ecb25fcfa0 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -962,8 +962,11 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 		replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
 						      NULL);
 		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
+		replaced |= drm_property_replace_blob(&crtc_state->shaper_lut,
+						      NULL);
 		replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
 						      gamma_lut);
+
 		crtc_state->color_mgmt_changed |= replaced;
 	}
 
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 87eb591fe9b5..e288bc4815ab 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -353,6 +353,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.ctm_property = prop;
 
+	prop = drm_property_create(dev,
+			DRM_MODE_PROP_BLOB,
+			"SHAPER_LUT", 0);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.shaper_lut_property = prop;
+
+	prop = drm_property_create_range(dev,
+			DRM_MODE_PROP_IMMUTABLE,
+			"SHAPER_LUT_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.shaper_lut_size_property = prop;
+
 	prop = drm_property_create(dev,
 			DRM_MODE_PROP_BLOB,
 			"GAMMA_LUT", 0);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8e1cbc75143e..7f289e0153aa 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -152,8 +152,9 @@ struct drm_crtc_state {
 	bool zpos_changed : 1;
 	/**
 	 * @color_mgmt_changed: Color management properties have changed
-	 * (@gamma_lut, @degamma_lut or @ctm). Used by the atomic helpers and
-	 * drivers to steer the atomic commit control flow.
+	 * (@shaper_lut, @gamma_lut, @degamma_lut or @ctm). Used by
+	 * the atomic helpers and drivers to steer the atomic commit control
+	 * flow.
 	 */
 	bool color_mgmt_changed : 1;
 
@@ -279,6 +280,15 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @shaper_lut:
+	 *
+	 * Lookup table used to de-linearize pixel data for gamma correction.
+	 * See drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array
+	 * of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *shaper_lut;
+
 	/**
 	 * @target_vblank:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 973119a9176b..0ad06ec8abec 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -808,6 +808,18 @@ struct drm_mode_config {
 	 * degamma LUT.
 	 */
 	struct drm_property *ctm_property;
+
+	/**
+	 * @shaper_lut_property: Optional CRTC property to set the shaper LUT used to
+	 * convert colors before 3D LUT conversion.
+	 */
+	struct drm_property *shaper_lut_property;
+	/**
+	 * @shaper_lut_size_property: Optional CRTC property for the size of the
+	 * shaper LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *shaper_lut_size_property;
+
 	/**
 	 * @gamma_lut_property: Optional CRTC property to set the LUT used to
 	 * convert the colors, after the CTM matrix, to the gamma space of the
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index 912f1e415685..5e75b51936e6 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -60,7 +60,7 @@ struct drm_mode_object {
 	void (*free_cb)(struct kref *kref);
 };
 
-#define DRM_OBJECT_MAX_PROPERTY 24
+#define DRM_OBJECT_MAX_PROPERTY 26
 /**
  * struct drm_object_properties - property tracking for &drm_mode_object
  */
-- 
2.40.1

