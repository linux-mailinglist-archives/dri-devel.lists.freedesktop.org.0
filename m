Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74A7ADFED
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242E710E2F6;
	Mon, 25 Sep 2023 19:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033FF10E2FA;
 Mon, 25 Sep 2023 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DbXt4692IRkO9VgS+j7Nad1JNnwUOFsLU7u7M7R4whk=; b=Z6eDFEpppKeXZoDZESN3mpWQPy
 kwnI3O0khtk7yGwGHh4cmpnKX3fLKX14VSg/eG+iARVG34NHloHsAhwO4UWRofTjGeAKX22RAqnNd
 XccG/Hh2QbobqWDO68x4kSpBYDhKrXslpoTewVNRfc1KamRrV4nbB9wL7eOgcJNpVStoQ55iaq+4Q
 6vzIwaC+EG11x4cYCRmInDyIZ0shO62y37Pb91vNF7wCBaSyfRr6Ynq5RpoLiLG14l2MpIXJ/ciwN
 6930ML+ZvOXUfV7hJhtCbaE8HGdw3+NKMfH2UhxL3QgwUdjO+5r4s7/vCeWQpgi8JtMi5u+v5TB2Q
 XoZ9W+PA==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkrak-008GsG-UA; Mon, 25 Sep 2023 21:50:03 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 12/32] drm/amd/display: add CRTC gamma TF driver-specific
 property
Date: Mon, 25 Sep 2023 18:49:12 -0100
Message-Id: <20230925194932.1329483-13-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925194932.1329483-1-mwen@igalia.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
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

Add AMD pre-defined transfer function property to default DRM CRTC
gamma to convert to wire encoding with or without a user gamma LUT.
There is no post-blending regamma ROM for pre-defined TF. When setting
blend TF (!= Identity) and LUT at the same time, the color module will
combine the pre-defined TF and the custom LUT values into the LUT that's
actually programmed.

v2:
- enable CRTC prop in the end of driver-specific prop sequence
- define inverse EOTFs as supported regamma TFs
- reword driver-specific function doc to remove shaper/3D LUT

v3:
- spell out TF+LUT behavior in the commit and comments (Harry)

Co-developed-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  7 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  8 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  7 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 72 +++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index f333102845b7..2587847ae318 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -423,6 +423,13 @@ struct amdgpu_mode_info {
 	 * from a combination of pre-defined TF and the custom 1D LUT).
 	 */
 	struct drm_property *plane_blend_tf_property;
+	/* @regamma_tf_property: Transfer function for CRTC regamma
+	 * (post-blending). Possible values are defined by `enum
+	 * amdgpu_transfer_function`. There is no regamma ROM, but we can use
+	 * AMD color modules to program LUT parameters from predefined TF (or
+	 * from a combination of pre-defined TF and the custom 1D LUT).
+	 */
+	struct drm_property *regamma_tf_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 0d6f7b0f47bc..0140f4fb903e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -825,6 +825,14 @@ struct dm_crtc_state {
 	struct dc_info_packet vrr_infopacket;
 
 	int abm_level;
+
+        /**
+	 * @regamma_tf:
+	 *
+	 * Pre-defined transfer function for converting internal FB -> wire
+	 * encoding.
+	 */
+	enum amdgpu_transfer_function regamma_tf;
 };
 
 #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index b76d1eb82267..c9bfb80e9073 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -271,6 +271,13 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_blend_tf_property = prop;
 
+	prop = amdgpu_create_tf_property(adev_to_drm(adev),
+					 "AMD_CRTC_REGAMMA_TF",
+					 amdgpu_inv_eotf);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.regamma_tf_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index fb51ec4f8d31..128e37ed5397 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -260,6 +260,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	state->freesync_config = cur->freesync_config;
 	state->cm_has_degamma = cur->cm_has_degamma;
 	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
+	state->regamma_tf = cur->regamma_tf;
 	state->crc_skip_count = cur->crc_skip_count;
 	state->mpo_requested = cur->mpo_requested;
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
@@ -296,6 +297,70 @@ static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
 }
 #endif
 
+#ifdef AMD_PRIVATE_COLOR
+/**
+ * drm_crtc_additional_color_mgmt - enable additional color properties
+ * @crtc: DRM CRTC
+ *
+ * This function lets the driver enable post-blending CRTC regamma transfer
+ * function property in addition to DRM CRTC gamma LUT. Default value means
+ * linear transfer function, which is the default CRTC gamma LUT behaviour
+ * without this property.
+ */
+static void
+dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+
+	if(adev->dm.dc->caps.color.mpc.ogam_ram)
+		drm_object_attach_property(&crtc->base,
+					   adev->mode_info.regamma_tf_property,
+					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
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
@@ -314,6 +379,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 #if defined(CONFIG_DEBUG_FS)
 	.late_register = amdgpu_dm_crtc_late_register,
 #endif
+#ifdef AMD_PRIVATE_COLOR
+	.atomic_set_property = amdgpu_dm_atomic_crtc_set_property,
+	.atomic_get_property = amdgpu_dm_atomic_crtc_get_property,
+#endif
 };
 
 static void dm_crtc_helper_disable(struct drm_crtc *crtc)
@@ -477,6 +546,9 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
 
+#ifdef AMD_PRIVATE_COLOR
+	dm_crtc_additional_color_mgmt(&acrtc->base);
+#endif
 	return 0;
 
 fail:
-- 
2.40.1

