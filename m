Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906F86EBFFE
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5044310E3DA;
	Sun, 23 Apr 2023 14:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1668D10E3D8;
 Sun, 23 Apr 2023 14:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mNxdNED6L3HES4VBefAtsG63OTHIZrslESDcQiiim+M=; b=gmOQ3q2nfwj0Oz9By8BoODLpBY
 nlWFvAuX/nCjrsoRwqBnOvu2066ZTKBbV1SErilbIPPRLrxBtV/KWPbid0GMIyO0efOPS2r9whq0A
 zJStCM0vdyqfTIqe/n3FV9tKSV0Za4BhoTjefXnGciV3+7B4cIVtyUf4ZbL3mD5bi+9yctwQHIEfJ
 n9rskomfSRZN28dlPi6qFZPvlKXDWiYCorGwQblxgtaBjG22jhYjdJ3T/Y83k66Nf0wQ6tDd5VRv+
 /WmFasbZZ6REAydvn3Edv4Yoeoc1HzxVBaY/iWeNkA2aCk9I39lVyGQ7bW1YmWLYStAvpVPKJJy65
 k3LsJHwA==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaSA-00ANVs-GB; Sun, 23 Apr 2023 16:12:34 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 12/40] drm/amd/display: add plane HDR multiplier
 driver-private property
Date: Sun, 23 Apr 2023 13:10:24 -0100
Message-Id: <20230423141051.702990-13-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
nits for SDR content. So if you want, 203 nits for SDR content, pass in
(203.0 / 80.0).

Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 12 +++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 25 ++++++++++++++-----
 4 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 24595906dab1..dd658f162f6f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1326,6 +1326,12 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_degamma_tf_property = prop;
 
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 0, "AMD_PLANE_HDR_MULT", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_hdr_mult_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index ab9ce6f26c90..65a9d62ffbe4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -387,6 +387,10 @@ struct amdgpu_mode_info {
 	 * linearize content with or without LUT.
 	 */
 	struct drm_property *plane_degamma_tf_property;
+	/**
+	 * @plane_hdr_mult_property:
+	 */
+	struct drm_property *plane_hdr_mult_property;
 #endif
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 005632c1c9ec..bb7307b9cfd5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -51,6 +51,7 @@
 
 #define AMDGPU_DMUB_NOTIFICATION_MAX 5
 
+#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
 /*
 #include "include/amdgpu_dal_power_if.h"
 #include "amdgpu_dm_irq.h"
@@ -736,6 +737,17 @@ struct dm_plane_state {
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
 #endif
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 5b458cc0781c..57169dae8b3d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1321,8 +1321,10 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
 		__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
 
 #ifdef CONFIG_STEAM_DECK
-	if (amdgpu_state)
+	if (amdgpu_state) {
 		amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
+		amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
+	}
 #endif
 }
 
@@ -1424,11 +1426,11 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 #ifdef CONFIG_STEAM_DECK
 int
 amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
-					       struct drm_property_blob **blob,
-					       uint64_t blob_id,
-					       ssize_t expected_size,
-					       ssize_t expected_elem_size,
-					       bool *replaced)
+					struct drm_property_blob **blob,
+					uint64_t blob_id,
+					ssize_t expected_size,
+					ssize_t expected_elem_size,
+					bool *replaced)
 {
 	struct drm_property_blob *new_blob = NULL;
 
@@ -1482,6 +1484,10 @@ dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 					   dm->adev->mode_info.plane_degamma_tf_property,
 					   DRM_TRANSFER_FUNCTION_DEFAULT);
 	}
+	/* HDR MULT is always available */
+	drm_object_attach_property(&plane->base,
+				   dm->adev->mode_info.plane_hdr_mult_property,
+				   AMDGPU_HDR_MULT_DEFAULT);
 }
 
 static int
@@ -1507,6 +1513,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -1533,6 +1544,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
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

