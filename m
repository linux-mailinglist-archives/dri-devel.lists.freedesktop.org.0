Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6BD70E8BF
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5287D10E500;
	Tue, 23 May 2023 22:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB1C10E4FD;
 Tue, 23 May 2023 22:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2Bfk2vTd4j6JrEAyNeIzl/Pt0PC+uwAlPuSSU1/87kQ=; b=i4WCx+uRtKEpplOWMJyGKZS7hL
 uc/FaNP3c1nC+kfZIEz4GvWRNz4OxaksT1MejQHJM1CxRhuT+gefFvu5cVCC2vxnUMJElEtH674Wt
 s6ks4RPdbzZRBVi3yvOqqoG0LWd2m0KGoT/gOHY+P+enix6bgY1pLXG2ipUaAejznyjrCfZlvzMn8
 FSJUHQmozcBwRevO6BbaN3wPtkpbnqxJqO4HyQK35NDvIwT8Ualsr7acutSmf5aPnmbrj/YQkCzt1
 2wARR0UzU97R7gTQaqLYwesm7nbovBixTBPgRB6XMg9FKw1u8c82Z1IHODtzosomEb9u3vkZ6dEC6
 69fXyByg==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aI4-00HEOv-T7; Wed, 24 May 2023 00:15:37 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 09/36] drm/amd/display: add plane HDR multiplier
 driver-specific property
Date: Tue, 23 May 2023 21:14:53 -0100
Message-Id: <20230523221520.3115570-10-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
nits for SDR content. So if you want, 203 nits for SDR content, pass in
(203.0 / 80.0).

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c         |  6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h            |  4 ++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h   | 12 ++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 13 +++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index fd6c4078c53a..f0e12cca295d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1298,6 +1298,12 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 9d7f47fe6303..c105f51b7b6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -365,6 +365,10 @@ struct amdgpu_mode_info {
 	 * linearize content with or without LUT.
 	 */
 	struct drm_property *plane_degamma_tf_property;
+	/**
+	 * @plane_hdr_mult_property:
+	 */
+	struct drm_property *plane_hdr_mult_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b8e432cc8078..dadbef561606 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -51,6 +51,7 @@
 
 #define AMDGPU_DMUB_NOTIFICATION_MAX 5
 
+#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
 /*
 #include "include/amdgpu_dal_power_if.h"
 #include "amdgpu_dm_irq.h"
@@ -732,6 +733,17 @@ struct dm_plane_state {
 	 * linearize.
 	 */
 	enum drm_transfer_function degamma_tf;
+	/**
+	 * @hdr_mult:
+	 *
+	 * Multiplier to 'gain' the plane.  When PQ is decoded using the fixed
+	 * func transfer function to the internal FP16 fb, 1.0 -> 80 nits (on
+	 * AMD at least). When sRGB is decoded, 1.0 -> 1.0, obviously.
+	 * Therefore, 1.0 multiplier = 80 nits for SDR content.  So if you
+	 * want, 203 nits for SDR content, pass in (203.0 / 80.0).  Format is
+	 * S31.32 sign-magnitude.
+	 */
+	__u64 hdr_mult;
 };
 
 struct dm_crtc_state {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 6b71777a525c..bbbf25dd2515 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1322,6 +1322,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
 
 	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
 	amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
+	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
 }
 
 static struct drm_plane_state *
@@ -1345,6 +1346,7 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
 
 	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
+	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
 
 	return &dm_plane_state->base;
 }
@@ -1450,6 +1452,10 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 					   dm->adev->mode_info.plane_degamma_tf_property,
 					   DRM_TRANSFER_FUNCTION_DEFAULT);
 	}
+	/* HDR MULT is always available */
+	drm_object_attach_property(&plane->base,
+				   dm->adev->mode_info.plane_hdr_mult_property,
+				   AMDGPU_HDR_MULT_DEFAULT);
 }
 
 static int
@@ -1476,6 +1482,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -1501,6 +1512,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 			dm_plane_state->degamma_lut->base.id : 0;
 	} else if (property == adev->mode_info.plane_degamma_tf_property) {
 		*val = dm_plane_state->degamma_tf;
+	} else if (property == adev->mode_info.plane_hdr_mult_property) {
+		*val = dm_plane_state->hdr_mult;
 	} else {
 		return -EINVAL;
 	}
-- 
2.39.2

