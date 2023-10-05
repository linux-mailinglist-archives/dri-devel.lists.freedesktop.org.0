Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988917BA79E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DC910E458;
	Thu,  5 Oct 2023 17:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B02D10E459;
 Thu,  5 Oct 2023 17:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sT/gs1NehLiK+m5bdQZVOLZ+1fTnfsMMgUEidQObCYw=; b=DAx+G/AoMRrD66h7765qwZcrKc
 u8rjOq0IRrrzGLwxktZ70PMVVVZ6L9TVWvtv0s1dCdR7zguQwy2dIK1sWhc3lAgCnDjfFZqXVG+Mi
 KQBfQn1NYEFaUWtPdgicj/3CyZAMquCv8U8hallbJwmQkGq12YpfeohMMGe9dJ+P2eCd7+XHhvXQu
 FRek+1tDgu2wYysH/9Yo9YVOZ43J8PpKlIyX3FUOkNEYt85U+yv9zGCO6MqqRvFvS3Bk0ltKzA7Bp
 aSFMHz7piX7ANSALCGBw6wRTjr1ni7kEiucnpHh5rcc5MUahJJLziuy2o+dM1XzQjFDUur7WQ9gen
 zuLN9xCw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRxL-00CFJN-Ef; Thu, 05 Oct 2023 19:16:11 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 19/32] drm/amd/display: add plane degamma TF and LUT support
Date: Thu,  5 Oct 2023 16:15:14 -0100
Message-Id: <20231005171527.203657-20-mwen@igalia.com>
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

Set DC plane with user degamma LUT or predefined TF from driver-specific
plane color properties. If plane and CRTC degamma are set in the same
time, plane degamma has priority.  That means, we only set CRTC degamma
if we don't have plane degamma LUT or TF to configure. We return -EINVAL
if we don't have plane degamma settings, so we can continue and check
CRTC degamma.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 70 +++++++++++++++++--
 3 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d44fd8cb6edf..a8a1690b7322 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5191,7 +5191,9 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
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
index c138457ff12e..c5ec6e4f15c2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -918,6 +918,7 @@ int amdgpu_dm_create_color_properties(struct amdgpu_device *adev);
 int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
+				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state);
 
 void amdgpu_dm_update_connector_after_detect(
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ffdf493b8ef2..6acc9ebc52da 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -867,9 +867,58 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 	return 0;
 }
 
+static int
+__set_dm_plane_degamma(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	const struct drm_color_lut *degamma_lut;
+	enum amdgpu_transfer_function tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
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
+	tf = dm_plane_state->degamma_tf;
+
+	/* If we don't have plane degamma LUT nor TF to set on DC, we have
+	 * nothing to do here, return.
+	 */
+	if (!has_degamma_lut && tf == AMDGPU_TRANSFER_FUNCTION_DEFAULT)
+		return -EINVAL;
+
+	dc_plane_state->in_transfer_func->tf = amdgpu_tf_to_dc_tf(tf);
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
@@ -880,13 +929,28 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
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
 		/*
 		 * AMD HW doesn't have post-blending degamma caps. When DRM
 		 * CRTC atomic degamma is set, we maps it to DPP degamma block
@@ -897,10 +961,6 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
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
2.40.1

