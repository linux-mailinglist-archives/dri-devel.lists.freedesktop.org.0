Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4CC777D4B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE8110E586;
	Thu, 10 Aug 2023 16:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EFE10E581;
 Thu, 10 Aug 2023 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yk1fmgrMxRR+sDWoIK2EYoMphG2xAfewLHFq20bzWTQ=; b=MfSE3jHPG3ezhxfUJXuC/icQQS
 nBeeIvVbjftMicVqMhYluyV3weF6Jgz0/ToW8lFMRGd3aNY7zhjKL/XXPuOrDzWqGJLZsqNpIYhMJ
 x/qBcUMOsUgBJnFne0TjXhFUVmdZ3iPOVwamGSq5KnqKu071HUzUkEBDPAQIEhgVjDEBhwRKwOu+G
 wUBxhr2aslu1Jdvj+hEBBYz8Hwlf447QoI8AnRxm/bcf/Hs/NXFyLKZwNIRV9R2hwVqySvzuz21qx
 SD9oynyg43z+NU1cyLcoQoWAluQ+LDpqZ3bGpl2wF19yBHilpTzMkBmdKvAA9BnOn+lTsglf3cX8P
 8gyOdDiw==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU88Y-00GjYD-BM; Thu, 10 Aug 2023 18:03:46 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 13/34] drm/amd/display: add CRTC gamma TF driver-specific
 property
Date: Thu, 10 Aug 2023 15:02:53 -0100
Message-Id: <20230810160314.48225-14-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810160314.48225-1-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
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
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add AMD pre-defined transfer function property to default DRM CRTC
gamma to convert to wire encoding with or without a user gamma LUT.

v2:
- enable CRTC prop in the end of driver-specific prop sequence
- define inverse EOTFs as supported regamma TFs
- reword driver-specific function doc to remove shaper/3D LUT

Co-developed-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  5 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  8 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  7 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 72 +++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index fd0b7047d56b..abb871a912d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -407,6 +407,11 @@ struct amdgpu_mode_info {
 	 * with or without LUT.
 	 */
 	struct drm_property *plane_blend_tf_property;
+	/* @regamma_tf_property: Transfer function for CRTC regamma
+	 * (post-blending). Possible values are defined by `enum
+	 * amdgpu_transfer_function`.
+	 */
+	struct drm_property *regamma_tf_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b6fa271ab0dd..51471675c298 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -821,6 +821,14 @@ struct dm_crtc_state {
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
index 2d64332e6b80..841e0391f7fb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -273,6 +273,13 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
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
index 440fc0869a34..d746f0aa0f11 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -253,6 +253,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	state->freesync_config = cur->freesync_config;
 	state->cm_has_degamma = cur->cm_has_degamma;
 	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
+	state->regamma_tf = cur->regamma_tf;
 	state->crc_skip_count = cur->crc_skip_count;
 	state->mpo_requested = cur->mpo_requested;
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
@@ -289,6 +290,70 @@ static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
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
@@ -307,6 +372,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 #if defined(CONFIG_DEBUG_FS)
 	.late_register = amdgpu_dm_crtc_late_register,
 #endif
+#ifdef AMD_PRIVATE_COLOR
+	.atomic_set_property = amdgpu_dm_atomic_crtc_set_property,
+	.atomic_get_property = amdgpu_dm_atomic_crtc_get_property,
+#endif
 };
 
 static void dm_crtc_helper_disable(struct drm_crtc *crtc)
@@ -470,6 +539,9 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
 
+#ifdef AMD_PRIVATE_COLOR
+	dm_crtc_additional_color_mgmt(&acrtc->base);
+#endif
 	return 0;
 
 fail:
-- 
2.40.1

