Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609A07ADFF4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F8510E301;
	Mon, 25 Sep 2023 19:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F08510E2E8;
 Mon, 25 Sep 2023 19:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MZng1P1DC05hvYrYdCzQez0CQBYVrOmR4TRkNYg057Y=; b=DtHK+SuB0e2JR8fHnwdq61/C/i
 Su2ba+mYTr1bJveDW2FR21tf+DoqqD7ppayl1XGPu0I94LHTMq1RCt0r1mtN16qdyVaD7yPelEVxQ
 JLimjYZN/Kv5wH0M+rf3ROEST7tPKtstg8bqGzylfc22vhCF76bUQ7T4zsfswxyHGZeS9pFVBcZ/I
 ehYv0TZ10ZZaVKblUgFOkyFi1sh2Tv/1z63GFcMXT/BiwEtRF4JU8UyKAe7rL605XtJvEQMslPzjR
 NRCk+8Wr5uALNpisAAD47F15XQGjFQCotIrM5H/z1ctTn/CnPqjhyGanKYF0WzaqqT9TDPRrVowbK
 Pnkt6P3A==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkray-008GsG-6h; Mon, 25 Sep 2023 21:50:16 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 18/32] drm/amd/display: decouple steps for mapping CRTC
 degamma to DC plane
Date: Mon, 25 Sep 2023 18:49:18 -0100
Message-Id: <20230925194932.1329483-19-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925194932.1329483-1-mwen@igalia.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
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
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 9d09a62645b9..aa34501e2a32 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -760,20 +760,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
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
@@ -796,8 +785,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 						 &degamma_size);
 		ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
 
-		dc_plane_state->in_transfer_func->type =
-			TF_TYPE_DISTRIBUTED_POINTS;
+		dc_plane_state->in_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
 
 		/*
 		 * This case isn't fully correct, but also fairly
@@ -833,7 +821,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				   degamma_lut, degamma_size);
 		if (r)
 			return r;
-	} else if (crtc->cm_is_degamma_srgb) {
+	} else {
 		/*
 		 * For legacy gamma support we need the regamma input
 		 * in linear space. Assume that the input is sRGB.
@@ -843,8 +831,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 
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
+		/* AMD HW doesn't have post-blending degamma caps. When DRM
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

