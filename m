Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908806EBFF8
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C1610E34A;
	Sun, 23 Apr 2023 14:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C9910E34A;
 Sun, 23 Apr 2023 14:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iBiuc4P8VmKXEvqKrXrkHjYNh/Y8fk7rr++PQPaLmzc=; b=GIDKrGFWjV2LVJfKwgRPiiS6x3
 gbHBG2Bm7wGkCLVsMtXx6H7ibDyL641Bk1ZcsxALGNewCyVQaxRZ6hQNqL0Gh8YXD+H/WFlwJB90M
 XRD2Urv0bhq6OoijHYQ+OsuOl3++mf9n6tFkjJY2anUTL7BzKWdz5jS+Zj1sQwV4UhJZJxvuRtnOF
 Hy56sb0sKVy1yyELsMyxudELZXIXDYYTEuBXTTeqfFNTuc4kUYZ7ElYd95Mst5lNJoUDgjIxCP2Ay
 kQkpat7fm7VidyfjwWBLCyLCvNz7qtfLD89aiI7C6BN7wUbaPq5ZGe8npr6QwPWyk1DORMdX5ZFqG
 6BY6dGCQ==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaS7-00ANVs-22; Sun, 23 Apr 2023 16:12:31 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 11/40] drm/amd/display: add plane degamma TF
 driver-private property
Date: Sun, 23 Apr 2023 13:10:23 -0100
Message-Id: <20230423141051.702990-12-mwen@igalia.com>
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
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Allow userspace to tell the kernel driver the input space and,
therefore, uses correct predefined transfer function (TF) to delinearize
content with or without LUT (using hardcoded curve caps).

Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  9 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  5 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 28 +++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 996c9c3fd471..24595906dab1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1317,6 +1317,15 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_degamma_lut_size_property = prop;
 
+	prop = drm_property_create_enum(adev_to_drm(adev),
+					DRM_MODE_PROP_ENUM,
+					"AMD_PLANE_DEGAMMA_TF",
+					drm_transfer_function_enum_list,
+					ARRAY_SIZE(drm_transfer_function_enum_list));
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_degamma_tf_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index d4e609a8b67e..ab9ce6f26c90 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -382,6 +382,11 @@ struct amdgpu_mode_info {
 	 * size of degamma LUT as supported by the driver (read-only).
 	 */
 	struct drm_property *plane_degamma_lut_size_property;
+	/**
+	 * @plane_degamma_tf_property: Predefined transfer function to
+	 * linearize content with or without LUT.
+	 */
+	struct drm_property *plane_degamma_tf_property;
 #endif
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b1d0c65d821d..005632c1c9ec 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -729,6 +729,13 @@ struct dm_plane_state {
 	 * The blob (if not NULL) is an array of &struct drm_color_lut.
 	 */
 	struct drm_property_blob *degamma_lut;
+	/**
+	 * @degamma_tf:
+	 *
+	 * Predefined transfer function to tell DC driver the input space to
+	 * linearize.
+	 */
+	enum drm_transfer_function degamma_tf;
 #endif
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 7b9d62c70b30..5b458cc0781c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1319,6 +1319,11 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
 
 	if (amdgpu_state)
 		__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
+
+#ifdef CONFIG_STEAM_DECK
+	if (amdgpu_state)
+		amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
+#endif
 }
 
 static struct drm_plane_state *
@@ -1450,6 +1455,19 @@ amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
 	return 0;
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
 static void
 dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 				      struct drm_plane *plane)
@@ -1460,6 +1478,9 @@ dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 		drm_object_attach_property(&plane->base,
 					   dm->adev->mode_info.plane_degamma_lut_size_property,
 					   MAX_COLOR_LUT_ENTRIES);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_degamma_tf_property,
+					   DRM_TRANSFER_FUNCTION_DEFAULT);
 	}
 }
 
@@ -1481,6 +1502,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 					&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == adev->mode_info.plane_degamma_tf_property) {
+		if (dm_plane_state->degamma_tf != val) {
+			dm_plane_state->degamma_tf = val;
+			dm_plane_state->base.color_mgmt_changed = 1;
+		}
 	} else {
 		drm_dbg_atomic(plane->dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
@@ -1505,6 +1531,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 	if (property == adev->mode_info.plane_degamma_lut_property) {
 		*val = (dm_plane_state->degamma_lut) ?
 			dm_plane_state->degamma_lut->base.id : 0;
+	} else if (property == adev->mode_info.plane_degamma_tf_property) {
+		*val = dm_plane_state->degamma_tf;
 	} else {
 		return -EINVAL;
 	}
-- 
2.39.2

