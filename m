Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CA36EBFEC
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16FA10E3C8;
	Sun, 23 Apr 2023 14:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6790310E3BC;
 Sun, 23 Apr 2023 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bm3Geo0t068sVPmTEYcYCE9oJGTq0xUkld/+z+807H0=; b=B1NZFih/nsbd8wN6emS12XMH6n
 cwfjEmV3Y44Dz3/Jj7ajJQ/7sbm69ggsPB1k5wAAeN0ByvwkioyXOW6e+ROOXLqvS5Fspi704K85n
 z+HQDTm53njLaBKNoTVb/TByZQ5C8JeVPvNR1IMFkNNu1QCT8vxEMWEi27nofoUNZZqYP48++6puT
 PyoEa9gUMyzc6wPhuEj6wxGZDC0ffLsJ8oUwacWdtHxZifgKqubO+L94NfMh7hBY1xND4hh6w2lmA
 acVUfeUsfjyMas0hFFMbpfHUpU5ImuCoznCUlPt/Gam7swjP8337OZHbrF989Pxb1NEMNx3yivn9r
 Xz+mnWFQ==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaRn-00ANVs-ED; Sun, 23 Apr 2023 16:12:11 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 06/40] drm/amd/display: add 3D LUT driver-private props
Date: Sun, 23 Apr 2023 13:10:18 -0100
Message-Id: <20230423141051.702990-7-mwen@igalia.com>
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

Add CRTC 3D LUT for gamma correction using a 3D lookup table. A shaper
lut must be set to shape the content for a non-linear space. That
details should be handled by the driver according to HW color
capabilities.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 11 ++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 13 ++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 20 +++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 44c22cb87dde..2abe5fe87c10 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1267,6 +1267,20 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.shaper_lut_size_property = prop;
 
+	prop = drm_property_create(adev_to_drm(adev),
+				   DRM_MODE_PROP_BLOB,
+				   "AMD_LUT3D", 0);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.lut3d_property = prop;
+
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 DRM_MODE_PROP_IMMUTABLE,
+					 "AMD_LUT3D_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.lut3d_size_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 1fd3497af3b5..205fa4f5bea7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -357,6 +357,17 @@ struct amdgpu_mode_info {
 	 * post-blending shaper LUT as supported by the driver (read-only).
 	 */
 	struct drm_property *shaper_lut_size_property;
+	/**
+	 * lut3d_property: CRTC property to set post-blending 3D LUT gamma
+	 * correction; a shaper LUT can be used before applying 3D LUT to
+	 * delinearize content.
+	 */
+	struct drm_property *lut3d_property;
+	/**
+	 * @lut3d_size_property: CRTC property for the size of post-blending 3D
+	 * LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *lut3d_size_property;
 #endif
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index de63455896cc..09c3e1858b56 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -742,6 +742,15 @@ struct dm_crtc_state {
 	 * of &struct drm_color_lut.
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
 #endif
 };
 
@@ -804,6 +813,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 
+/* 3D LUT max size is 17x17x17 */
+#define MAX_COLOR_3DLUT_ENTRIES 4913
+#define MAX_COLOR_3DLUT_BITDEPTH 12
+/* 1D LUT degamma, regamma and shaper*/
 #define MAX_COLOR_LUT_ENTRIES 4096
 /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
 #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 503433e5cb38..0e1280228e6e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -231,6 +231,7 @@ static void dm_crtc_destroy_state(struct drm_crtc *crtc,
 
 #ifdef CONFIG_STEAM_DECK
 	drm_property_blob_put(cur->shaper_lut);
+	drm_property_blob_put(cur->lut3d);
 #endif
 	__drm_atomic_helper_crtc_destroy_state(state);
 
@@ -270,9 +271,12 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
 #ifdef CONFIG_STEAM_DECK
 	state->shaper_lut = cur->shaper_lut;
+	state->lut3d = cur->lut3d;
 
 	if (state->shaper_lut)
 		drm_property_blob_get(state->shaper_lut);
+	if (state->lut3d)
+		drm_property_blob_get(state->lut3d);
 #endif
 	return &state->base;
 }
@@ -326,6 +330,11 @@ dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
 		drm_object_attach_property(&crtc->base,
 					   adev->mode_info.shaper_lut_size_property,
 					   MAX_COLOR_LUT_ENTRIES);
+		drm_object_attach_property(&crtc->base,
+					   adev->mode_info.lut3d_property, 0);
+		drm_object_attach_property(&crtc->base,
+					   adev->mode_info.lut3d_size_property,
+					   MAX_COLOR_3DLUT_ENTRIES);
 	}
 }
 
@@ -381,6 +390,14 @@ amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
 					&replaced);
 		acrtc_state->base.color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == adev->mode_info.lut3d_property) {
+		ret = atomic_replace_property_blob_from_id(crtc->dev,
+					&acrtc_state->lut3d,
+					val,
+					-1, sizeof(struct drm_color_lut),
+					&replaced);
+		acrtc_state->base.color_mgmt_changed |= replaced;
+		return ret;
 	} else {
 		drm_dbg_atomic(crtc->dev,
 			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
@@ -404,6 +421,9 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
 	if (property == adev->mode_info.shaper_lut_property)
 		*val = (acrtc_state->shaper_lut) ?
 			acrtc_state->shaper_lut->base.id : 0;
+	else if (property == adev->mode_info.lut3d_property)
+		*val = (acrtc_state->lut3d) ?
+			acrtc_state->lut3d->base.id : 0;
 	else
 		return -EINVAL;
 
-- 
2.39.2

