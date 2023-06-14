Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6570E8E6
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C4610E52D;
	Tue, 23 May 2023 22:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9924210E522;
 Tue, 23 May 2023 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fsF1ovmekm8bE+sXG2oNuuF44kjUhVczJ1nlBvcGOUU=; b=Zqnjy9EAN8tn2VOa8VfI+qyITu
 /hqjGT6h/mdR+HWYTZug5WI+X8+gaT2eQd+0kII++jFmGHT4CK/LpGcnQKpbP6dcipogVBWR8WUJ9
 SiOyZm4YrrhqKEPK8CMnIQatBc1zGMWUvagdQf0ViRKHfeMFFts5FMLeNdh1DQFtXpKz4UTLRGJSu
 ZIIBR6bRV3sAFTBf74iAnWWIa0oQimhguOvyTUXz2KlKuWEjTt1jvGUvs3AvjEqLFTh0tgE2D69gd
 mIwkwbwg7inJ2K8lzcLYTRh2g4SZX5zxQOvpswL6Q0xkjtKY1yR7pjqSYX1HYgvDEnkVSV6BzBdo+
 qDH/+xuQ==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIY-00HEOv-CP; Wed, 24 May 2023 00:16:06 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 28/36] drm/amd/display: add support for plane degamma TF and
 LUT properties
Date: Tue, 23 May 2023 21:15:12 -0100
Message-Id: <20230523221520.3115570-29-mwen@igalia.com>
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

Set DC plane with user degamma LUT or predefined TF from driver-specific
plane color properties. If plane and CRTC degamma are set in the same
time, plane degamma has priority.  That means, we only set CRTC degamma
if we don't have plane degamma LUT or TF to configure. We return -EINVAL
if we don't have plane degamma settings, so we can continue and check
CRTC degamma.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 70 +++++++++++++++++--
 3 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b048c0267670..4f3597ea9873 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5038,7 +5038,9 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 	 * Always set input transfer function, since plane state is refreshed
 	 * every time.
 	 */
-	ret = amdgpu_dm_update_plane_color_mgmt(dm_crtc_state, dc_plane_state);
+	ret = amdgpu_dm_update_plane_color_mgmt(dm_crtc_state,
+						plane_state,
+						dc_plane_state);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ea76c2957848..bf4a1d6be99e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -902,6 +902,7 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 				     struct dc_state *ctx);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
+				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state);
 
 void amdgpu_dm_update_connector_after_detect(
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 246f12532c48..89178b7f636f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -869,9 +869,58 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 	return 0;
 }
 
+static int
+__set_dm_plane_degamma(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	const struct drm_color_lut *degamma_lut;
+	enum drm_transfer_function drm_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
+	uint32_t degamma_size;
+	bool has_degamma_lut;
+	int ret;
+
+	degamma_lut = __extract_blob_lut(dm_plane_state->degamma_lut,
+					 &degamma_size);
+
+	has_degamma_lut = degamma_lut &&
+			  !__is_lut_linear(degamma_lut, degamma_size);
+
+	drm_tf = dm_plane_state->degamma_tf;
+
+	/* If we don't have plane degamma LUT nor TF to set on DC, we have
+	 * nothing to do here, return.
+	 */
+	if (!has_degamma_lut && drm_tf == DRM_TRANSFER_FUNCTION_DEFAULT)
+		return -EINVAL;
+
+	dc_plane_state->in_transfer_func->tf = drm_tf_to_dc_tf(drm_tf);
+
+	if (has_degamma_lut) {
+		ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
+
+		dc_plane_state->in_transfer_func->type =
+			TF_TYPE_DISTRIBUTED_POINTS;
+
+		ret = __set_input_tf(dc_plane_state->in_transfer_func,
+				     degamma_lut, degamma_size);
+		if (ret)
+			return ret;
+       } else {
+		dc_plane_state->in_transfer_func->type =
+			TF_TYPE_PREDEFINED;
+
+		if (!mod_color_calculate_degamma_params(NULL,
+		    dc_plane_state->in_transfer_func, NULL, false))
+			return -ENOMEM;
+	}
+	return 0;
+}
+
 /**
  * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
  * @crtc: amdgpu_dm crtc state
+ * @plane_state: DRM plane state
  * @dc_plane_state: target DC surface
  *
  * Update the underlying dc_stream_state's input transfer function (ITF) in
@@ -882,13 +931,28 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
  * 0 on success. -ENOMEM if mem allocation fails.
  */
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
+				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state)
 {
 	bool has_crtc_cm_degamma;
 	int ret;
 
+	/* Initially, we can just bypass the DGM block. */
+	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
+	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
+
+	/* After, we start to update values according to color props */
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
-	if (has_crtc_cm_degamma){
+
+	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
+	if (ret != -EINVAL)
+		return ret;
+
+	/* If we are here, it means we don't have plane degamma settings, check
+	 * if we have CRTC degamma waiting for mapping to pre-blending degamma
+	 * block
+	 */
+	if (has_crtc_cm_degamma) {
 		/* AMD HW doesn't have post-blending degamma caps. When DRM
 		 * CRTC atomic degamma is set, we maps it to DPP degamma block
 		 * (pre-blending) or, on legacy gamma, we use DPP degamma to
@@ -898,10 +962,6 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
 		if (ret)
 			return ret;
-	} else {
-		/* ...Otherwise we can just bypass the DGM block. */
-		dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
-		dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
 	}
 
 	return 0;
-- 
2.39.2

