Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFAB7BA783
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D2710E443;
	Thu,  5 Oct 2023 17:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B0610E43E;
 Thu,  5 Oct 2023 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O7LWpEI4Wxo2nvObSMyljDk70IrD9o1uiIg+HiLdLbs=; b=L2Be+eiRd291PcqrjuxyVj1Q8Y
 xk2VGfJGYJf3JpYurbJAFG7+rmFBIRox7xQLZIo5AcaUotbbmZVKC6lrVfMt0OJA+Js0l2w0ek5vh
 zaDRmbIL9ggRTae8Sh089i0zWVMEuTvgYbV/GYVz2/XM8gXnDRXr/d9UyRlPEQ+VbNvcUJLTuAFRc
 ks0X5RkbYhaWeUjZ4W9Ml7WBpbwVH3mz16mwu/CgZCWjCW8Z4AXionSYK0gRujqxROOzTDd11V/ek
 HN5dDGsv+4XkanltVGDjPcz/Zh5J67L7RjCqlvSAWeVP1xBqP729MGP0M8pQX8arh8vG60U3KaDRI
 kvMo0uBw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRwy-00CFJN-96; Thu, 05 Oct 2023 19:15:48 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 08/32] drm/amd/display: add plane HDR multiplier
 driver-specific property
Date: Thu,  5 Oct 2023 16:15:03 -0100
Message-Id: <20231005171527.203657-9-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005171527.203657-1-mwen@igalia.com>
References: <20231005171527.203657-1-mwen@igalia.com>
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
index 9b6fab86c6c3..62044d41da75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -359,6 +359,10 @@ struct amdgpu_mode_info {
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
index fc4f188d397e..bb2ce843369d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -55,6 +55,9 @@
 #define HDMI_AMD_VENDOR_SPECIFIC_DATA_BLOCK_IEEE_REGISTRATION_ID 0x00001A
 #define AMD_VSDB_VERSION_3_FEATURECAP_REPLAYMODE 0x40
 #define HDMI_AMD_VENDOR_SPECIFIC_DATA_BLOCK_VERSION_3 0x3
+
+#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
+
 /*
 #include "include/amdgpu_dal_power_if.h"
 #include "amdgpu_dm_irq.h"
@@ -767,6 +770,20 @@ struct dm_plane_state {
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
index d5dbd20a6766..caf49a044ab4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -224,6 +224,12 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
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
index 04af6db8cffd..ae64d4b73360 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1337,6 +1337,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
 
 	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
 	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
+	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
 }
 
 static struct drm_plane_state *
@@ -1360,6 +1361,7 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
 
 	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
+	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
 
 	return &dm_plane_state->base;
 }
@@ -1456,6 +1458,10 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 					   dm->adev->mode_info.plane_degamma_tf_property,
 					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
 	}
+	/* HDR MULT is always available */
+	drm_object_attach_property(&plane->base,
+				   dm->adev->mode_info.plane_hdr_mult_property,
+				   AMDGPU_HDR_MULT_DEFAULT);
 }
 
 static int
@@ -1482,6 +1488,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -1507,6 +1518,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
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

