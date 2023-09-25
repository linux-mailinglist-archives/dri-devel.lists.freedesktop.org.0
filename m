Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC27AE00D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFEE10E318;
	Mon, 25 Sep 2023 19:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A4F10E2FE;
 Mon, 25 Sep 2023 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K/HT2RJ39ckquCRKnR0palBqaM3+R3kfZRTo8L6PvXQ=; b=eZw6B8FOL/QaQon2h3EcPHKHhv
 GejPaPjANHIFwe/TAvb3zgFLp+U4BcEKP8bqqnbtqysKq45yaO7TrjVnSQ4fkQKvTD4uwuHe3absK
 TPZ9qUYGdwj9LSp/tUeyTPOIVaQ5PE9+HHK2L3BVVfGWQ4rD2iE7YN0jZFfdkgj2il7ypm7pOCBLN
 pMUiHNZ9C04sEHgeLMi9T9d1l15zAV3bdO53mNo2Pn1nBteLavqVuvdsl966Z/P/t/bMDp1zvTYih
 hYkDgVB9y0pDxCBYuaQmoLJzB7ur6ZroAlSTGJ4Wp7ELuppJOs07idhDLAANwEFrFdfSLtKwRM3OQ
 fW+xRb5g==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkrbB-008GsG-TX; Mon, 25 Sep 2023 21:50:30 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 24/32] drm/amd/display: add plane shaper TF support
Date: Mon, 25 Sep 2023 18:49:24 -0100
Message-Id: <20230925194932.1329483-25-mwen@igalia.com>
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

Enable usage of predefined transfer func in addition to shaper 1D LUT.
That means we can save some complexity by just setting a predefined
curve, instead of programming a custom curve when preparing color space
for applying 3D LUT.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 8c991b5cf473..a085f98c8e90 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -595,19 +595,22 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 }
 
 static int amdgpu_dm_atomic_shaper_lut(const struct drm_color_lut *shaper_lut,
+				       bool has_rom,
+				       enum dc_transfer_func_predefined tf,
 				       uint32_t shaper_size,
 				       struct dc_transfer_func *func_shaper)
 {
 	int ret = 0;
 
-	if (shaper_size) {
+	if (shaper_size || tf != TRANSFER_FUNCTION_LINEAR) {
 		/* If DRM shaper LUT is set, we assume a linear color space
 		 * (linearized by DRM degamma 1D LUT or not)
 		 */
 		func_shaper->type = TF_TYPE_DISTRIBUTED_POINTS;
-		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
+		func_shaper->tf = tf;
+		func_shaper->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
 
-		ret = __set_output_tf(func_shaper, shaper_lut, shaper_size, false);
+		ret = __set_output_tf(func_shaper, shaper_lut, shaper_size, has_rom);
 	} else {
 		func_shaper->type = TF_TYPE_BYPASS;
 		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
@@ -954,6 +957,7 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	enum amdgpu_transfer_function shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 	const struct drm_color_lut *shaper_lut;
 	uint32_t shaper_size;
 	int ret;
@@ -966,8 +970,11 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 
 	shaper_lut = __extract_blob_lut(dm_plane_state->shaper_lut, &shaper_size);
 	shaper_size = shaper_lut != NULL ? shaper_size : 0;
+	shaper_tf = dm_plane_state->shaper_tf;
 
-	ret = amdgpu_dm_atomic_shaper_lut(shaper_lut, shaper_size,
+	ret = amdgpu_dm_atomic_shaper_lut(shaper_lut, false,
+					  amdgpu_tf_to_dc_tf(shaper_tf),
+					  shaper_size,
 					  dc_plane_state->in_shaper_func);
 	if (ret)
 		drm_dbg_kms(plane_state->plane->dev,
-- 
2.40.1

