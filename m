Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31F46EBFFF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E283210E266;
	Sun, 23 Apr 2023 14:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE10910E3D8;
 Sun, 23 Apr 2023 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XleRtpzB51Ir3Pboj9ghwngNAd/+A1lioslQSwoJ2AI=; b=nB3+YRio3j5L9kqpSuTn+k+r52
 h88OqMdUI9lBq+LKN8jeTUo+3ZE5NDSNgAUJIK6BsePJbE8DCj4yQ29mvmXCw6JfdVH+es5zHRrV1
 S9+k9CgCO9OOtW0XDhjT2Gw8U6ILT0rpTDrdyDsi00eaHo+maBrJiQoIk+U0pIYBkrajxBpEWpVGY
 +DZXDkAA8EnEckKEaVfjt/N6kgdpSdepGCl3U/m5BUWNH4p32u3u4O/gBilOnIn5lNRJR0DC7uc/8
 j7G0jjng7h/Kq8CAQ1lcan7ue7ieW0xRZosJkAbZKMeBbTtJRru6NRL6w6yWtR5xD6ngvycvpg/P1
 whC++FNw==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaSF-00ANVs-BW; Sun, 23 Apr 2023 16:12:39 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 13/40] drm/amd/display: add plane 3D LUT driver-private
 properties
Date: Sun, 23 Apr 2023 13:10:25 -0100
Message-Id: <20230423141051.702990-14-mwen@igalia.com>
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

Add 3D LUT property for plane gamma correction using a 3D lookup table.
3D LUT is more effective when applying in non-linear space, therefore,
userpace may need one 1D LUT (shaper) before it to delinearize content
and another 1D LUT after 3D LUT (blend) to linearize content again for
blending. The next patches add these 1D LUTs to the plane color mgmt
pipeline.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 10 ++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  5 ++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 24 +++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index dd658f162f6f..8d4726978c6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1332,6 +1332,20 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_hdr_mult_property = prop;
 
+	prop = drm_property_create(adev_to_drm(adev),
+				   DRM_MODE_PROP_BLOB,
+				   "AMD_PLANE_LUT3D", 0);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_lut3d_property = prop;
+
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 DRM_MODE_PROP_IMMUTABLE,
+					 "AMD_PLANE_LUT3D_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_lut3d_size_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 65a9d62ffbe4..9d9dac26edfc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -391,6 +391,16 @@ struct amdgpu_mode_info {
 	 * @plane_hdr_mult_property:
 	 */
 	struct drm_property *plane_hdr_mult_property;
+	/**
+	 * @plane_lut3d_property: Plane property for gamma correction using a
+	 * 3D LUT (pre-blending).
+	 */
+	struct drm_property *plane_lut3d_property;
+	/**
+	 * @plane_degamma_lut_size_property: Plane property to define the max
+	 * size of 3D LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *plane_lut3d_size_property;
 #endif
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index bb7307b9cfd5..b0ba0279dc25 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -748,6 +748,11 @@ struct dm_plane_state {
 	 * S31.32 sign-magnitude.
 	 */
 	__u64 hdr_mult;
+	/**
+	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
+	 * &struct drm_color_lut.
+	 */
+	struct drm_property_blob *lut3d;
 #endif
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 57169dae8b3d..0e418e161b0b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1347,7 +1347,10 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 #ifdef CONFIG_STEAM_DECK
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
+	if (dm_plane_state->lut3d)
+		drm_property_blob_get(dm_plane_state->lut3d);
 #endif
+
 	return &dm_plane_state->base;
 }
 
@@ -1416,7 +1419,9 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
 #ifdef CONFIG_STEAM_DECK
 	drm_property_blob_put(dm_plane_state->degamma_lut);
+	drm_property_blob_put(dm_plane_state->lut3d);
 #endif
+
 	if (dm_plane_state->dc_state)
 		dc_plane_state_release(dm_plane_state->dc_state);
 
@@ -1488,6 +1493,14 @@ dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 	drm_object_attach_property(&plane->base,
 				   dm->adev->mode_info.plane_hdr_mult_property,
 				   AMDGPU_HDR_MULT_DEFAULT);
+
+	if (dm->dc->caps.color.dpp.hw_3d_lut) {
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_lut3d_property, 0);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_lut3d_size_property,
+					   MAX_COLOR_3DLUT_ENTRIES);
+	}
 }
 
 static int
@@ -1518,6 +1531,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 			dm_plane_state->hdr_mult = val;
 			dm_plane_state->base.color_mgmt_changed = 1;
 		}
+	} else if (property == adev->mode_info.plane_lut3d_property) {
+		ret = amdgpu_dm_replace_property_blob_from_id(plane->dev,
+					&dm_plane_state->lut3d,
+					val,
+					-1, sizeof(struct drm_color_lut),
+					&replaced);
+		dm_plane_state->base.color_mgmt_changed |= replaced;
+		return ret;
 	} else {
 		drm_dbg_atomic(plane->dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
@@ -1546,6 +1567,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = dm_plane_state->degamma_tf;
 	} else if (property == adev->mode_info.plane_hdr_mult_property) {
 		*val = dm_plane_state->hdr_mult;
+	} else 	if (property == adev->mode_info.plane_lut3d_property) {
+		*val = (dm_plane_state->lut3d) ?
+			dm_plane_state->lut3d->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
-- 
2.39.2

