Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC85550D77
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 00:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4C4112EC6;
	Sun, 19 Jun 2022 22:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F3F112EC1;
 Sun, 19 Jun 2022 22:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VMeVt5GgYN2uaIeRHzX920KYm0jgkAHAMZxXnkIML9g=; b=pgQQkfDDzmwa2hg8Z7zrwiIhkQ
 wMmfbvfFzlMe66OlOjqFDW79xCsmyWoJyhS82MDkL2zH0CYn8MoO6M8wKt5n+PcIc+nq2bTNkLdcj
 Zo5bn9/2UywUwjqugOIqMm7bwyDNwJZU+kxpuJWDm0aPyjgyK1ExtHXW08et06pnQgsudJHfChqYn
 qZvqOHE+ZYE0VU4SWgreeMnuT5rpJsmWbqiKzuH67dtaHsenAE5mRHCAmr8dDyp5bv9krE0e7jbvz
 G9UqN5M5QSpru5Dl1trqd6rPd5BpkmYQilPUpiVzEr+eX7PopgoAezZYUgUJfe52dn+zK+vCm1uN/
 7WD0ukjQ==;
Received: from [195.77.82.244] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1o33TC-005lHy-8P; Mon, 20 Jun 2022 00:32:39 +0200
From: Melissa Wen <mwen@igalia.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
Subject: [RFC PATCH 4/5] drm/drm_color_mgmt: add 3D LUT to color mgmt
 properties
Date: Sun, 19 Jun 2022 21:31:03 -0100
Message-Id: <20220619223104.667413-5-mwen@igalia.com>
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

Add 3D LUT for gammar correction using a 3D lookup table.  The position
in the color correction pipeline where 3D LUT is applied depends on hw
design, being after CTM or gamma. If just after CTM, a shaper lut must
be set to shape the content for a non-linear space. That details should
be handled by the driver according to its color capabilities.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  3 ++
 drivers/gpu/drm/drm_atomic_uapi.c         | 14 +++++-
 drivers/gpu/drm/drm_color_mgmt.c          | 58 +++++++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c           |  2 +
 drivers/gpu/drm/drm_mode_config.c         | 14 ++++++
 include/drm/drm_color_mgmt.h              |  4 ++
 include/drm/drm_crtc.h                    | 12 ++++-
 include/drm/drm_mode_config.h             | 13 +++++
 8 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index cf0545bb6e00..64800bc41365 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -141,6 +141,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 		drm_property_blob_get(state->ctm);
 	if (state->shaper_lut)
 		drm_property_blob_get(state->shaper_lut);
+	if (state->lut3d)
+		drm_property_blob_get(state->lut3d);
 	if (state->gamma_lut)
 		drm_property_blob_get(state->gamma_lut);
 
@@ -216,6 +218,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
 	drm_property_blob_put(state->degamma_lut);
 	drm_property_blob_put(state->ctm);
 	drm_property_blob_put(state->shaper_lut);
+	drm_property_blob_put(state->lut3d);
 	drm_property_blob_put(state->gamma_lut);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 6468f2a080bc..1896c0422f73 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -472,6 +472,14 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
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
 	} else if (property == config->gamma_lut_property) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->gamma_lut,
@@ -523,10 +531,12 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->degamma_lut) ? state->degamma_lut->base.id : 0;
 	else if (property == config->ctm_property)
 		*val = (state->ctm) ? state->ctm->base.id : 0;
-	else if (property == config->gamma_lut_property)
-		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
 	else if (property == config->shaper_lut_property)
 		*val = (state->shaper_lut) ? state->shaper_lut->base.id : 0;
+	else if (property == config->lut3d_property)
+		*val = (state->lut3d) ? state->lut3d->base.id : 0;
+	else if (property == config->gamma_lut_property)
+		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
 	else if (property == config->prop_out_fence_ptr)
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 4f57dc60fe03..696fe1e37801 100644
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
+ * “LUT3D_SIZE”:
+ *	Unsigned range property to give the size of the 3D lookup table to be
+ *	set on the LUT3D property (the size depends on the underlying
+ *	hardware). If drivers support multiple LUT sizes then they should
+ *	publish the largest size, and sub-sample smaller sized LUTs
+ *	appropriately.
+ *
  * “GAMMA_LUT”:
  *	Blob property to set the gamma lookup table (LUT) mapping pixel data
  *	after the transformation matrix to data sent to the connector. The
@@ -204,6 +223,45 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
 
+/**
+ * drm_crtc_enable_lut3d - enable 3D LUT properties
+ * @crtc: DRM CRTC
+ * @shaper_lut_size: the size of shaper lut
+ * @lut3d_size: the size of 3D lut
+ *
+ * This function lets the driver enable the 3D LUT color correction property
+ * on a CRTC. This includes 3D LUT and also a shaper LUT, if set. The shaper
+ * LUT property is only attached if its size is not 0 and 3D LUT is set, being
+ * therefore optional.
+ */
+void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
+			   uint shaper_lut_size,
+			   uint lut3d_size)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	if (!lut3d_size)
+		return;
+
+	drm_object_attach_property(&crtc->base,
+				   config->lut3d_property, 0);
+	drm_object_attach_property(&crtc->base,
+				   config->lut3d_size_property,
+				   lut3d_size);
+	if (!shaper_lut_size)
+		return;
+
+	drm_object_attach_property(&crtc->base,
+				   config->shaper_lut_property, 0);
+	drm_object_attach_property(&crtc->base,
+				   config->shaper_lut_size_property,
+				   lut3d_size);
+
+}
+EXPORT_SYMBOL(drm_crtc_enable_lut3d);
+
+
 /**
  * drm_mode_crtc_set_gamma_size - set the gamma table size
  * @crtc: CRTC to set the gamma table size for
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index bdd33817d968..358c528c7c80 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1069,6 +1069,8 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
 		replaced |= drm_property_replace_blob(&crtc_state->shaper_lut,
 						      NULL);
+		replaced |= drm_property_replace_blob(&crtc_state->lut3d,
+						      NULL);
 		replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
 						      gamma_lut);
 
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 4ba2a95b88e8..5458a7dfbe63 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -364,6 +364,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.shaper_lut_size_property = prop;
 
+	prop = drm_property_create(dev,
+			DRM_MODE_PROP_BLOB,
+			"LUT3D", 0);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.lut3d_property = prop;
+
+	prop = drm_property_create_range(dev,
+			DRM_MODE_PROP_IMMUTABLE,
+			"LUT3D_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.lut3d_size_property = prop;
+
 	prop = drm_property_create(dev,
 			DRM_MODE_PROP_BLOB,
 			"GAMMA_LUT", 0);
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 81c298488b0c..a4f054e0108f 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -59,6 +59,10 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				bool has_ctm,
 				uint gamma_lut_size);
 
+void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
+			   uint shaper_lut_size,
+			   uint lut3d_size);
+
 int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
 				 int gamma_size);
 
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index a318d5feb44b..c22ffcc4d7aa 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -165,7 +165,7 @@ struct drm_crtc_state {
 	bool zpos_changed : 1;
 	/**
 	 * @color_mgmt_changed: Color management properties have changed
-	 * (@shaper_lut, @gamma_lut, @degamma_lut or @ctm). Used by
+	 * (@shaper_lut, @lut3d, @gamma_lut, @degamma_lut or @ctm). Used by
 	 * the atomic helpers and drivers to steer the atomic commit control
 	 * flow.
 	 */
@@ -298,6 +298,16 @@ struct drm_crtc_state {
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
 	/**
 	 * @target_vblank:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 2df7e171add9..87280694e70d 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -812,6 +812,19 @@ struct drm_mode_config {
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
+	 * @lut3d_size_property: Optional CRTC property for the size of the
+	 * 3D LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *lut3d_size_property;
+
 	/**
 	 * @gamma_lut_property: Optional CRTC property to set the LUT used to
 	 * convert the colors, after the CTM matrix, to the gamma space of the
-- 
2.35.1

