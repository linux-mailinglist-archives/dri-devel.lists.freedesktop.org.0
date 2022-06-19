Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E49550D74
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 00:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52D1112EC3;
	Sun, 19 Jun 2022 22:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA14112EC1;
 Sun, 19 Jun 2022 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xYy+B0EYyXJqj3PSzsn1daBxOJOCoTCFjWURuGWQBKs=; b=ZNBPH2BoEe81Rkwh9ZzXySFaVd
 1Mjy7bZIhLIj+X8rrfkHEsLsCAJLgEvVcr+Jbu6MU9sVRuCZDb2Rmh58c5uTIstrBz7aABuGLGoZY
 gaasR2QwviAHYVdyL0DklZstYOs6tFh67ubdm9/813933tfUvvdqRSkPiA4RDAp8b543S7paJSsuS
 Ko8w5rkDkzr2qWGPxafXCMJi90BW0az3z5C6wUH/fq3Z5YgkPmP/AB1xFRf7/vhokeZPxrwThdOn/
 oYdr4B/fogTNI25B397ZEAAeSEf+SMaz8a9t2IoR0te9fJtCdvvlozlWw+9T9P+fqkc9g4fYDKlBo
 qu+3a6eA==;
Received: from [195.77.82.244] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1o33T3-005lHy-PS; Mon, 20 Jun 2022 00:32:31 +0200
From: Melissa Wen <mwen@igalia.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
Subject: [RFC PATCH 3/5] drm/drm_color_mgmt: add shaper LUT to color mgmt
 properties
Date: Sun, 19 Jun 2022 21:31:02 -0100
Message-Id: <20220619223104.667413-4-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619223104.667413-1-mwen@igalia.com>
References: <20220619223104.667413-1-mwen@igalia.com>
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
Cc: alex.hung@amd.com, amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Shaper LUT is used to shape the contect after blending, i.e.,
de-linearize space before applying 3D LUT color correction. In the next
patch, we are adding 3D LUT property to DRM color mgmt.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 10 ++++++++
 drivers/gpu/drm/drm_color_mgmt.c          | 31 ++++++++++++++++++-----
 drivers/gpu/drm/drm_fb_helper.c           |  3 +++
 drivers/gpu/drm/drm_mode_config.c         | 14 ++++++++++
 include/drm/drm_crtc.h                    | 14 ++++++++--
 include/drm/drm_mode_config.h             | 12 +++++++++
 7 files changed, 79 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index ddcf5c2c8e6a..cf0545bb6e00 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -139,8 +139,11 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
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
@@ -212,6 +215,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
 	drm_property_blob_put(state->mode_blob);
 	drm_property_blob_put(state->degamma_lut);
 	drm_property_blob_put(state->ctm);
+	drm_property_blob_put(state->shaper_lut);
 	drm_property_blob_put(state->gamma_lut);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9781722519c3..6468f2a080bc 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -464,6 +464,14 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
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
@@ -517,6 +525,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->ctm) ? state->ctm->base.id : 0;
 	else if (property == config->gamma_lut_property)
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
+	else if (property == config->shaper_lut_property)
+		*val = (state->shaper_lut) ? state->shaper_lut->base.id : 0;
 	else if (property == config->prop_out_fence_ptr)
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..4f57dc60fe03 100644
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
@@ -149,13 +167,12 @@ EXPORT_SYMBOL(drm_color_ctm_s31_32_to_qm_n);
  * @has_ctm: whether to attach ctm_property for CSC matrix
  * @gamma_lut_size: the size of the gamma lut (after CSC)
  *
- * This function lets the driver enable the color correction
- * properties on a CRTC. This includes 3 degamma, csc and gamma
- * properties that userspace can set and 2 size properties to inform
- * the userspace of the lut sizes. Each of the properties are
- * optional. The gamma and degamma properties are only attached if
- * their size is not 0 and ctm_property is only attached if has_ctm is
- * true.
+ * This function lets the driver enable the color correction properties on a
+ * CRTC. This includes 3 properties (degamma, csc and gamma) that
+ * userspace can set and 2 size properties to inform the userspace of the lut
+ * sizes. Each of the properties are optional. The gamma and degamma
+ * properties are only attached if their size is not 0 and ctm_property is only
+ * attached if has_ctm is true.
  */
 void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				uint degamma_lut_size,
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index ed43b987d306..bdd33817d968 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1067,8 +1067,11 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
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
index 37b4b9f0e468..4ba2a95b88e8 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -350,6 +350,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
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
index 13eeba2a750a..a318d5feb44b 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -165,8 +165,9 @@ struct drm_crtc_state {
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
 
@@ -288,6 +289,15 @@ struct drm_crtc_state {
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
index 91ca575a78de..2df7e171add9 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -800,6 +800,18 @@ struct drm_mode_config {
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
-- 
2.35.1

