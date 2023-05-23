Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DD70E8F5
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6195E10E536;
	Tue, 23 May 2023 22:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3C110E522;
 Tue, 23 May 2023 22:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FolzCJ0zQbL2KV09G8T1Rouesa3Sa8n9yz6tG8R4kjs=; b=LntbvZXH8Y0VwqyyjOKlI3ahcK
 CftIVE/C+4l+hEOyiJtXMXDPM7rQOD54/0cf+o/VRRonly+dyXdtxmoBA77WVpbHQ30bFqcr0ucOa
 V0+lCsH7N96AuUTgqAWxQD82ELgRUmK7xSTKRPE+gtnMheOouMnypKJYPDs8yZvJS80vMUJeSQT5R
 tMfwebwUjxRrLvauDijBYzw2G7xHKVsLYQoCX7aEmU1Svr0X7IuMN4MvXVvcuacTxKDaSfudqW9xa
 zlkJVWgB2p1agk6Wz043xnIHPzYEDV0af46Yb8tvXJNFDPr2YPknBqZcePg1iGyQcWVfhXJ6ScgbS
 CoJDILjQ==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIT-00HEOv-Nl; Wed, 24 May 2023 00:16:01 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 25/36] drm/amd/display: add CRTC shaper TF support
Date: Tue, 23 May 2023 21:15:09 -0100
Message-Id: <20230523221520.3115570-26-mwen@igalia.com>
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

Inspired by regamma TF, follow similar steps to add TF + 1D LUT for
shaper func. Reuse regamma_tf property, since the driver doesn't support
shaper and out gamma at the same time. Only set shaper TF if setting
shaper LUT or 3D LUT. We could rename regamma_tf - if necessary to avoid
misunderstandings - or add a specific property for shaper TF when.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 7cf35ac3fad3..5650b85cc28e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -470,19 +470,22 @@ static void amdgpu_dm_atomic_lut3d(const struct drm_color_lut *drm_lut,
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
@@ -509,6 +512,8 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 					 struct dc_stream_state *stream,
 					 const struct drm_color_lut *drm_shaper_lut,
 					 uint32_t drm_shaper_size,
+					 bool has_rom,
+					 enum dc_transfer_func_predefined tf,
 					 const struct drm_color_lut *drm_lut3d,
 					 uint32_t drm_lut3d_size)
 {
@@ -536,7 +541,7 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 
 	amdgpu_dm_atomic_lut3d(drm_lut3d, drm_lut3d_size, lut3d_func);
 
-	return amdgpu_dm_atomic_shaper_lut(drm_shaper_lut,
+	return amdgpu_dm_atomic_shaper_lut(drm_shaper_lut, has_rom, tf,
 					   drm_shaper_size, func_shaper);
 }
 
@@ -734,6 +739,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 		shaper_size = shaper_lut != NULL ? shaper_size : 0;
 		r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, ctx, stream,
 						  shaper_lut, shaper_size,
+						  has_rom, tf,
 						  lut3d, lut3d_size);
 		if (r) {
 			drm_dbg(&adev->ddev, "Failed on shaper/3D LUTs setup\n");
-- 
2.39.2

