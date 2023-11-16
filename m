Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44C7EE7D2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205F310E6AD;
	Thu, 16 Nov 2023 19:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0520A10E6A0;
 Thu, 16 Nov 2023 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1kIE9lV9JDKZ/PJtLlPIXXL1Vq0+BqOSNa80aAuh+2Q=; b=oh5dWDOlNIHCPTMWyYFuf6XNjT
 xQq98GEYm4LvHriCUNdwxzVNVP1rFOxuvOZb7KmorKOAKkabQ1nVrLi5fRApW4ApuU7IMMaW35Zmt
 v1hueXa6ZLImXu4sZoFaXp9Qd8t8kF6v0KOXATcKrhKlEYxbeRSjdIlp1wrQ3q966vcbr+sPkvU8O
 1ehA3khsS492QiabTT4OXAAyU7O1O2A9asQk4GlUh49QOki/nNRuQ7+QTkJO3abc/3qkzGpv01117
 DkqvvicrjReM/2nNBMARSJUxiqNpWA4Lh4pTsvEHjA4IAwmserLQIGVNoV66q2qB4czn24Aq9S8aM
 ZQBgDSTw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVW-0048Yy-0Y; Thu, 16 Nov 2023 20:58:34 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 08/32] drm/amd/display: add plane HDR multiplier
 driver-specific property
Date: Thu, 16 Nov 2023 18:57:48 -0100
Message-Id: <20231116195812.906115-9-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
nits for SDR content. So if you want, 203 nits for SDR content, pass in
(203.0 / 80.0).

v4:
- comment about the PQ TF need for L-to-NL (from Harry's review)

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h        |  4 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h   | 17 +++++++++++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c |  6 ++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 13 +++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 50572fe27ab0..ee67c5adf0f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -360,6 +360,10 @@ struct amdgpu_mode_info {
 	 * to go from scanout/encoded values to linear values.
 	 */
 	struct drm_property *plane_degamma_tf_property;
+	/**
+	 * @plane_hdr_mult_property:
+	 */
+	struct drm_property *plane_hdr_mult_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 98f7267d5ee7..38163b7084fa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -54,6 +54,9 @@
 #define HDMI_AMD_VENDOR_SPECIFIC_DATA_BLOCK_IEEE_REGISTRATION_ID 0x00001A
 #define AMD_VSDB_VERSION_3_FEATURECAP_REPLAYMODE 0x40
 #define HDMI_AMD_VENDOR_SPECIFIC_DATA_BLOCK_VERSION_3 0x3
+
+#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
+
 /*
 #include "include/amdgpu_dal_power_if.h"
 #include "amdgpu_dm_irq.h"
@@ -759,6 +762,20 @@ struct dm_plane_state {
 	 * linearize.
 	 */
 	enum amdgpu_transfer_function degamma_tf;
+	/**
+	 * @hdr_mult:
+	 *
+	 * Multiplier to 'gain' the plane.  When PQ is decoded using the fixed
+	 * func transfer function to the internal FP16 fb, 1.0 -> 80 nits (on
+	 * AMD at least). When sRGB is decoded, 1.0 -> 1.0, obviously.
+	 * Therefore, 1.0 multiplier = 80 nits for SDR content.  So if you
+	 * want, 203 nits for SDR content, pass in (203.0 / 80.0).  Format is
+	 * S31.32 sign-magnitude.
+	 *
+	 * HDR multiplier can wide range beyond [0.0, 1.0]. This means that PQ
+	 * TF is needed for any subsequent linear-to-non-linear transforms.
+	 */
+	__u64 hdr_mult;
 };
 
 struct dm_crtc_state {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 49faaf606cfe..b5b34a9209e4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -225,6 +225,12 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_degamma_tf_property = prop;
 
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 0, "AMD_PLANE_HDR_MULT", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_hdr_mult_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index d5e12e05d161..45a2c9b36630 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1342,6 +1342,7 @@ static void amdgpu_dm_plane_drm_plane_reset(struct drm_plane *plane)
 
 	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
 	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
+	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
 }
 
 static struct drm_plane_state *amdgpu_dm_plane_drm_plane_duplicate_state(struct drm_plane *plane)
@@ -1365,6 +1366,7 @@ static struct drm_plane_state *amdgpu_dm_plane_drm_plane_duplicate_state(struct
 			drm_property_blob_get(old_dm_plane_state->degamma_lut);
 
 	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
+	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
 
 	return &dm_plane_state->base;
 }
@@ -1464,6 +1466,10 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 					   dm->adev->mode_info.plane_degamma_tf_property,
 					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
 	}
+	/* HDR MULT is always available */
+	drm_object_attach_property(&plane->base,
+				   dm->adev->mode_info.plane_hdr_mult_property,
+				   AMDGPU_HDR_MULT_DEFAULT);
 }
 
 static int
@@ -1490,6 +1496,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 			dm_plane_state->degamma_tf = val;
 			dm_plane_state->base.color_mgmt_changed = 1;
 		}
+	} else if (property == adev->mode_info.plane_hdr_mult_property) {
+		if (dm_plane_state->hdr_mult != val) {
+			dm_plane_state->hdr_mult = val;
+			dm_plane_state->base.color_mgmt_changed = 1;
+		}
 	} else {
 		drm_dbg_atomic(plane->dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
@@ -1515,6 +1526,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 			dm_plane_state->degamma_lut->base.id : 0;
 	} else if (property == adev->mode_info.plane_degamma_tf_property) {
 		*val = dm_plane_state->degamma_tf;
+	} else if (property == adev->mode_info.plane_hdr_mult_property) {
+		*val = dm_plane_state->hdr_mult;
 	} else {
 		return -EINVAL;
 	}
-- 
2.40.1

