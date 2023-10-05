Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31447BA79C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111B210E445;
	Thu,  5 Oct 2023 17:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B6810E455;
 Thu,  5 Oct 2023 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a7xLsGgomxYn9Ov+HximEvm8uRna3ByA87GFP4/MUro=; b=J4WPkMCXMg1hhpz83wDuLNXmB3
 MGQoQqNzRn0RmOeZhyOTtN7f1uSLabIbTVAIZWfBQ9rmYkmpsnbdRc6mVhGRdIEYK3gaDTDPMBf+o
 UKiVT40BKd0qVIEuSUuDvD5/8YDy659Y9xPw2raElz7wRG0jq/4CDoX+LRGJ+kLezgku69bQGCuHv
 OdT/ngNhNXHH3rmJDoOO1tzdUbGoCqtm4Mz7YAGOLaIYLqXulbuzhfGuvp9suAm0xdkXPS6DeklXI
 CklgVvXRAhDhFDw1D3Bw5+cHgEdowvDFpF2k7lDh3yCgeWD/bxD+GBfMEI6hQbjo60CqPg+ljb2GX
 uFRkCRvw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRxJ-00CFJN-BG; Thu, 05 Oct 2023 19:16:09 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 18/32] drm/amd/display: decouple steps for mapping CRTC
 degamma to DC plane
Date: Thu,  5 Oct 2023 16:15:13 -0100
Message-Id: <20231005171527.203657-19-mwen@igalia.com>
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

The next patch adds pre-blending degamma to AMD color mgmt pipeline, but
pre-blending degamma caps (DPP) is currently in use to provide DRM CRTC
atomic degamma or implict degamma on legacy gamma. Detach degamma usage
regarging CRTC color properties to manage plane and CRTC color
correction combinations.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 60 +++++++++++++------
 1 file changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index e81263d60b7d..ffdf493b8ef2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -788,20 +788,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	return 0;
 }
 
-/**
- * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
- * @crtc: amdgpu_dm crtc state
- * @dc_plane_state: target DC surface
- *
- * Update the underlying dc_stream_state's input transfer function (ITF) in
- * preparation for hardware commit. The transfer function used depends on
- * the preparation done on the stream for color management.
- *
- * Returns:
- * 0 on success. -ENOMEM if mem allocation fails.
- */
-int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
-				      struct dc_plane_state *dc_plane_state)
+static int
+map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
+			     struct dc_plane_state *dc_plane_state)
 {
 	const struct drm_color_lut *degamma_lut;
 	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
@@ -824,8 +813,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 						 &degamma_size);
 		ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
 
-		dc_plane_state->in_transfer_func->type =
-			TF_TYPE_DISTRIBUTED_POINTS;
+		dc_plane_state->in_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
 
 		/*
 		 * This case isn't fully correct, but also fairly
@@ -861,7 +849,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				   degamma_lut, degamma_size);
 		if (r)
 			return r;
-	} else if (crtc->cm_is_degamma_srgb) {
+	} else {
 		/*
 		 * For legacy gamma support we need the regamma input
 		 * in linear space. Assume that the input is sRGB.
@@ -871,8 +859,44 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 
 		if (tf != TRANSFER_FUNCTION_SRGB &&
 		    !mod_color_calculate_degamma_params(NULL,
-			    dc_plane_state->in_transfer_func, NULL, false))
+							dc_plane_state->in_transfer_func,
+							NULL, false))
 			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/**
+ * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
+ * @crtc: amdgpu_dm crtc state
+ * @dc_plane_state: target DC surface
+ *
+ * Update the underlying dc_stream_state's input transfer function (ITF) in
+ * preparation for hardware commit. The transfer function used depends on
+ * the preparation done on the stream for color management.
+ *
+ * Returns:
+ * 0 on success. -ENOMEM if mem allocation fails.
+ */
+int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
+				      struct dc_plane_state *dc_plane_state)
+{
+	bool has_crtc_cm_degamma;
+	int ret;
+
+	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
+	if (has_crtc_cm_degamma){
+		/*
+		 * AMD HW doesn't have post-blending degamma caps. When DRM
+		 * CRTC atomic degamma is set, we maps it to DPP degamma block
+		 * (pre-blending) or, on legacy gamma, we use DPP degamma to
+		 * linearize (implicit degamma) from sRGB/BT709 according to
+		 * the input space.
+		 */
+		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
+		if (ret)
+			return ret;
 	} else {
 		/* ...Otherwise we can just bypass the DGM block. */
 		dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
-- 
2.40.1

