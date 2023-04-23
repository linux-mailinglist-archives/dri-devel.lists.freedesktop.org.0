Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A936F6EBFEE
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2682610E3CC;
	Sun, 23 Apr 2023 14:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E881B10E34A;
 Sun, 23 Apr 2023 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MWZg+O3y0ybUoSZE+Ev3495R/hqyYOtAGPPhQThmk+k=; b=eKogjPhFWjQrXoV0+AGmU9qjw8
 PUliAB3kyiGVgAeZD4mlaf5PKFpNtKs6eEDKgQdS8ZeedNSOpdQgBQ+QBgerpCOI8Ge8S3PZPwmIT
 SeyLbi1vMoTOW9YbNyrZETehq4zce1WQcAne90PaVEOdnQcdUSUSet7zWxt5hofFsLSbA4pnJ0unk
 6EJL9EPWo7OEXsseSP/lRFG4H7RR9Un3WjFhQTaAkNE5if5/KqDIBgZU9kWi5/QuXFx9RLEvDCv5r
 JFWzDbiLfVyV01yucJsZRjsLFVeya8DHAx7QuB1KWd3zZcBj5GmgsyZyR+jQU65eE8MZ74IE9nvwq
 z+ZfQy9Q==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaRk-00ANVs-LA; Sun, 23 Apr 2023 16:12:08 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 05/40] drm/amd/display: add shaper LUT driver-private props
Date: Sun, 23 Apr 2023 13:10:17 -0100
Message-Id: <20230423141051.702990-6-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
MIME-Version: 1.0
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CRTC shaper LUT shapes the content after blending, i.e., de-linearizes
or normalizes space before applying a 3D LUT color correction. In the
next patch, we add CRTC 3D LUT property to DRM color management after
this shaper LUT and before the current CRTC gamma LUT.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  28 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  14 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  17 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 122 +++++++++++++++++-
 4 files changed, 179 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 8632ab695a6c..44c22cb87dde 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1247,6 +1247,30 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 	return &amdgpu_fb->base;
 }
 
+#ifdef CONFIG_STEAM_DECK
+static int
+amdgpu_display_create_color_properties(struct amdgpu_device *adev)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(adev_to_drm(adev),
+				   DRM_MODE_PROP_BLOB,
+				   "AMD_SHAPER_LUT", 0);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.shaper_lut_property = prop;
+
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 DRM_MODE_PROP_IMMUTABLE,
+					 "AMD_SHAPER_LUT_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.shaper_lut_size_property = prop;
+
+	return 0;
+}
+#endif
+
 const struct drm_mode_config_funcs amdgpu_mode_funcs = {
 	.fb_create = amdgpu_display_user_framebuffer_create,
 };
@@ -1323,6 +1347,10 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 			return -ENOMEM;
 	}
 
+#ifdef CONFIG_STEAM_DECK
+	if (amdgpu_display_create_color_properties(adev))
+		return -ENOMEM;
+#endif
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index b8633df418d4..1fd3497af3b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -344,6 +344,20 @@ struct amdgpu_mode_info {
 	int			disp_priority;
 	const struct amdgpu_display_funcs *funcs;
 	const enum drm_plane_type *plane_type;
+
+	/* Driver-private color mgmt props */
+#ifdef CONFIG_STEAM_DECK
+	/**
+	 * @shaper_lut_property: CRTC property to set post-blending shaper LUT
+	 * that converts content before 3D LUT gamma correction.
+	 */
+	struct drm_property *shaper_lut_property;
+	/**
+	 * @shaper_lut_size_property: CRTC property for the size of
+	 * post-blending shaper LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *shaper_lut_size_property;
+#endif
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 2e2413fd73a4..de63455896cc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -726,6 +726,23 @@ struct dm_crtc_state {
 	struct dc_info_packet vrr_infopacket;
 
 	int abm_level;
+
+#ifdef CONFIG_STEAM_DECK
+	/* AMD driver-private color mgmt pipeline
+	 *
+	 * DRM provides CRTC degamma/ctm/gamma color mgmt features, but AMD HW
+	 * has a larger set of post-blending color calibration features, as
+	 * below:
+	 */
+	/**
+	 * @shaper_lut:
+	 *
+	 * Lookup table used to de-linearize pixel data for gamma correction.
+	 * See drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array
+	 * of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *shaper_lut;
+#endif
 };
 
 #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index e3762e806617..503433e5cb38 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -229,7 +229,9 @@ static void dm_crtc_destroy_state(struct drm_crtc *crtc,
 	if (cur->stream)
 		dc_stream_release(cur->stream);
 
-
+#ifdef CONFIG_STEAM_DECK
+	drm_property_blob_put(cur->shaper_lut);
+#endif
 	__drm_atomic_helper_crtc_destroy_state(state);
 
 
@@ -266,7 +268,12 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	state->crc_skip_count = cur->crc_skip_count;
 	state->mpo_requested = cur->mpo_requested;
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
+#ifdef CONFIG_STEAM_DECK
+	state->shaper_lut = cur->shaper_lut;
 
+	if (state->shaper_lut)
+		drm_property_blob_get(state->shaper_lut);
+#endif
 	return &state->base;
 }
 
@@ -299,6 +306,111 @@ static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
 }
 #endif
 
+#ifdef CONFIG_STEAM_DECK
+/**
+ * drm_crtc_additional_color_mgmt - enable additional color properties
+ * @crtc: DRM CRTC
+ *
+ * This function lets the driver enable the 3D LUT color correction property
+ * on a CRTC. This includes shaper LUT, 3D LUT and regamma TF. The shaper
+ * LUT and 3D LUT property is only attached if its size is not 0.
+ */
+static void
+dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+
+	if (adev->dm.dc->caps.color.mpc.num_3dluts) {
+		drm_object_attach_property(&crtc->base,
+					   adev->mode_info.shaper_lut_property, 0);
+		drm_object_attach_property(&crtc->base,
+					   adev->mode_info.shaper_lut_size_property,
+					   MAX_COLOR_LUT_ENTRIES);
+	}
+}
+
+static int
+atomic_replace_property_blob_from_id(struct drm_device *dev,
+					 struct drm_property_blob **blob,
+					 uint64_t blob_id,
+					 ssize_t expected_size,
+					 ssize_t expected_elem_size,
+					 bool *replaced)
+{
+	struct drm_property_blob *new_blob = NULL;
+
+	if (blob_id != 0) {
+		new_blob = drm_property_lookup_blob(dev, blob_id);
+		if (new_blob == NULL)
+			return -EINVAL;
+
+		if (expected_size > 0 &&
+		    new_blob->length != expected_size) {
+			drm_property_blob_put(new_blob);
+			return -EINVAL;
+		}
+		if (expected_elem_size > 0 &&
+		    new_blob->length % expected_elem_size != 0) {
+			drm_property_blob_put(new_blob);
+			return -EINVAL;
+		}
+	}
+
+	*replaced |= drm_property_replace_blob(blob, new_blob);
+	drm_property_blob_put(new_blob);
+
+	return 0;
+}
+
+static int
+amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
+				   struct drm_crtc_state *state,
+				   struct drm_property *property,
+				   uint64_t val)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(state);
+	bool replaced = false;
+	int ret;
+
+	if (property == adev->mode_info.shaper_lut_property) {
+		ret = atomic_replace_property_blob_from_id(crtc->dev,
+					&acrtc_state->shaper_lut,
+					val,
+					-1, sizeof(struct drm_color_lut),
+					&replaced);
+		acrtc_state->base.color_mgmt_changed |= replaced;
+		return ret;
+	} else {
+		drm_dbg_atomic(crtc->dev,
+			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
+			       crtc->base.id, crtc->name,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
+				   const struct drm_crtc_state *state,
+				   struct drm_property *property,
+				   uint64_t *val)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(state);
+
+	if (property == adev->mode_info.shaper_lut_property)
+		*val = (acrtc_state->shaper_lut) ?
+			acrtc_state->shaper_lut->base.id : 0;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+#endif
+
 /* Implemented only the options currently available for the driver */
 static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.reset = dm_crtc_reset_state,
@@ -317,6 +429,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 #if defined(CONFIG_DEBUG_FS)
 	.late_register = amdgpu_dm_crtc_late_register,
 #endif
+#ifdef CONFIG_STEAM_DECK
+	.atomic_set_property = amdgpu_dm_atomic_crtc_set_property,
+	.atomic_get_property = amdgpu_dm_atomic_crtc_get_property,
+#endif
 };
 
 static void dm_crtc_helper_disable(struct drm_crtc *crtc)
@@ -477,9 +593,11 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
 	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,
 				   true, MAX_COLOR_LUT_ENTRIES);
-
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
 
+#ifdef CONFIG_STEAM_DECK
+	dm_crtc_additional_color_mgmt(&acrtc->base);
+#endif
 	return 0;
 
 fail:
-- 
2.39.2

