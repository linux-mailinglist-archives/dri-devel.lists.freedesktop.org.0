Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D313B70E8B9
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F3B10E4FA;
	Tue, 23 May 2023 22:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4FF10E4F6;
 Tue, 23 May 2023 22:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=57zwD1axbZeVgvFNAd1cg0qF7agYjsObbyPzWnGaULo=; b=Gs0x1lsoTVf1frihqKQ4JLtKKw
 bDbLQBHRe9u/xyflKJCsNqpbdcI353DDbG5s+3XiSsinXi2K+gjSeocHwBYwxXWCVD9+n1dwg0rOA
 +k8gysEGv0R7QHZGF14JLCVXAtqFj39JdmS7rejyJuTacnC41VwaaizN33K3wVPU5UoaObmHk7Pyw
 ngIl4naN1GbUNef6z1kiBoTSrsXVH2SApb5QlCop1NuXrEkuBW8pDp5/YGb2Px5Dnwrca2/emQtq0
 08v3sKmlvqzEhF4ynA05wkASJUFbi1+Sdkw7bbRMNJr+V1FyVMn3iOsu7wDYD8gdCN77gbrPAiq2v
 UapD0abw==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aI0-00HEOv-8J; Wed, 24 May 2023 00:15:32 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 06/36] drm/amd/display: add CRTC driver-specific property for
 gamma TF
Date: Tue, 23 May 2023 21:14:50 -0100
Message-Id: <20230523221520.3115570-7-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523221520.3115570-1-mwen@igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hook up driver-specific atomic operations for managing AMD color
properties and create AMD driver-specific color management properties
and attach them according to HW capabilities defined by `struct
dc_color_caps`. Add enumerated transfer function property to DRM CRTC
gamma to convert to wire encoding with or without a user gamma LUT.
Enumerated TFs are not supported yet by the DRM color pipeline,
therefore, create a DRM enum list with the predefined TFs supported by
the AMD display driver.

Co-developed-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 36 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 22 ++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 72 ++++++++++++++++++-
 4 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 389396eac222..88af075e6c18 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1247,6 +1247,38 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 	return &amdgpu_fb->base;
 }
 
+static const struct drm_prop_enum_list drm_transfer_function_enum_list[] = {
+	{ DRM_TRANSFER_FUNCTION_DEFAULT, "Default" },
+	{ DRM_TRANSFER_FUNCTION_SRGB, "sRGB" },
+	{ DRM_TRANSFER_FUNCTION_BT709, "BT.709" },
+	{ DRM_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
+	{ DRM_TRANSFER_FUNCTION_LINEAR, "Linear" },
+	{ DRM_TRANSFER_FUNCTION_UNITY, "Unity" },
+	{ DRM_TRANSFER_FUNCTION_HLG, "HLG (Hybrid Log Gamma)" },
+	{ DRM_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
+	{ DRM_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
+	{ DRM_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
+};
+
+#ifdef AMD_PRIVATE_COLOR
+static int
+amdgpu_display_create_color_properties(struct amdgpu_device *adev)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_enum(adev_to_drm(adev),
+					DRM_MODE_PROP_ENUM,
+					"AMD_REGAMMA_TF",
+					drm_transfer_function_enum_list,
+					ARRAY_SIZE(drm_transfer_function_enum_list));
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.regamma_tf_property = prop;
+
+	return 0;
+}
+#endif
+
 const struct drm_mode_config_funcs amdgpu_mode_funcs = {
 	.fb_create = amdgpu_display_user_framebuffer_create,
 };
@@ -1323,6 +1355,10 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 			return -ENOMEM;
 	}
 
+#ifdef AMD_PRIVATE_COLOR
+	if (amdgpu_display_create_color_properties(adev))
+		return -ENOMEM;
+#endif
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index b8633df418d4..881446c51b36 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -344,6 +344,14 @@ struct amdgpu_mode_info {
 	int			disp_priority;
 	const struct amdgpu_display_funcs *funcs;
 	const enum drm_plane_type *plane_type;
+
+	/* Driver-private color mgmt props */
+
+	/* @regamma_tf_property: Transfer function for CRTC regamma
+	 * (post-blending). Possible values are defined by `enum
+	 * drm_transfer_function`.
+	 */
+	struct drm_property *regamma_tf_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 2e2413fd73a4..ad5ee28b83dc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -699,6 +699,20 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
 
 extern const struct amdgpu_ip_block_version dm_ip_block;
 
+enum drm_transfer_function {
+	DRM_TRANSFER_FUNCTION_DEFAULT,
+	DRM_TRANSFER_FUNCTION_SRGB,
+	DRM_TRANSFER_FUNCTION_BT709,
+	DRM_TRANSFER_FUNCTION_PQ,
+	DRM_TRANSFER_FUNCTION_LINEAR,
+	DRM_TRANSFER_FUNCTION_UNITY,
+	DRM_TRANSFER_FUNCTION_HLG,
+	DRM_TRANSFER_FUNCTION_GAMMA22,
+	DRM_TRANSFER_FUNCTION_GAMMA24,
+	DRM_TRANSFER_FUNCTION_GAMMA26,
+	DRM_TRANSFER_FUNCTION_MAX,
+};
+
 struct dm_plane_state {
 	struct drm_plane_state base;
 	struct dc_plane_state *dc_state;
@@ -726,6 +740,14 @@ struct dm_crtc_state {
 	struct dc_info_packet vrr_infopacket;
 
 	int abm_level;
+
+        /**
+	 * @regamma_tf:
+	 *
+	 * Pre-defined transfer function for converting internal FB -> wire
+	 * encoding.
+	 */
+	enum drm_transfer_function regamma_tf;
 };
 
 #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index e3762e806617..1eb279d341c5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -229,7 +229,6 @@ static void dm_crtc_destroy_state(struct drm_crtc *crtc,
 	if (cur->stream)
 		dc_stream_release(cur->stream);
 
-
 	__drm_atomic_helper_crtc_destroy_state(state);
 
 
@@ -263,6 +262,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	state->freesync_config = cur->freesync_config;
 	state->cm_has_degamma = cur->cm_has_degamma;
 	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
+	state->regamma_tf = cur->regamma_tf;
 	state->crc_skip_count = cur->crc_skip_count;
 	state->mpo_requested = cur->mpo_requested;
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
@@ -299,6 +299,69 @@ static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
 }
 #endif
 
+#ifdef AMD_PRIVATE_COLOR
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
+	if(adev->dm.dc->caps.color.mpc.ogam_ram)
+		drm_object_attach_property(&crtc->base,
+					   adev->mode_info.regamma_tf_property,
+					   DRM_TRANSFER_FUNCTION_DEFAULT);
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
+
+	if (property == adev->mode_info.regamma_tf_property) {
+		if (acrtc_state->regamma_tf != val) {
+			acrtc_state->regamma_tf = val;
+			acrtc_state->base.color_mgmt_changed |= 1;
+		}
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
+	if (property == adev->mode_info.regamma_tf_property)
+		*val = acrtc_state->regamma_tf;
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
@@ -317,6 +380,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 #if defined(CONFIG_DEBUG_FS)
 	.late_register = amdgpu_dm_crtc_late_register,
 #endif
+#ifdef AMD_PRIVATE_COLOR
+	.atomic_set_property = amdgpu_dm_atomic_crtc_set_property,
+	.atomic_get_property = amdgpu_dm_atomic_crtc_get_property,
+#endif
 };
 
 static void dm_crtc_helper_disable(struct drm_crtc *crtc)
@@ -480,6 +547,9 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
 
+#ifdef AMD_PRIVATE_COLOR
+	dm_crtc_additional_color_mgmt(&acrtc->base);
+#endif
 	return 0;
 
 fail:
-- 
2.39.2

