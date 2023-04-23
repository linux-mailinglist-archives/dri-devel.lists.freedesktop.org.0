Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA996EC022
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0DA10E402;
	Sun, 23 Apr 2023 14:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D30810E3FC;
 Sun, 23 Apr 2023 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lxN4o+4K+4Z4seUWpOvL7AAr75VVAUYJY+xnqLiCvUc=; b=ldnqTfdyEMGI4mbqShp9tr/liM
 YQTTbJw6WaTPud7IYSxZwA15m0J2bA8x23c73MjMq3kNtQd0Jt3KBobOZIBCzCb2XLvELGfbF/Qt7
 eGDG9ZbCwoCkHFAKeP6qIoASRP+4hAHQqHkrEP+cEHDHNFSYvhmXDThVVCXcHMnApgb+tjAxqBGo6
 6WAksnjMAdCXgRzIOxcu8T1hxp4gNNFaOl7PEijhMtUOop4Ao5ZSPsvN+N3pCUvbL17vhApJQ1xAn
 D+OXavQ94QlAL5RXXZVKQ6pgFQJoDRp+jeu2lzhWn/8vXDnUSLOqizYX5SuVqIKCsMhsokaJmtKSw
 DGzMjzdQ==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaT7-00ANVs-0P; Sun, 23 Apr 2023 16:13:33 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 29/40] drm/amd/display: add CRTC shaper TF support
Date: Sun, 23 Apr 2023 13:10:41 -0100
Message-Id: <20230423141051.702990-30-mwen@igalia.com>
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

Inspired by regamma TF, follow similar steps to add TF + 1D LUT for
shaper func. Reuse gamma_tf property, since the driver doesn't support
shaper and out gamma at the same time. We could rename gamma_tf, if
necessary to avoid misunderstandings, or add a specific property for
shaper lut.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 6e7271065a56..6a233380f284 100644
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
+		func_shaper->sdr_ref_white_level = 80; /* hardcoded for now */
 
-		ret = __set_output_tf(func_shaper, shaper_lut, shaper_size, false);
+		ret = __set_output_tf(func_shaper, shaper_lut, shaper_size, has_rom);
 	} else {
 		func_shaper->type = TF_TYPE_BYPASS;
 		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
@@ -509,12 +512,14 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 					 struct dc_stream_state *stream,
 					 const struct drm_color_lut *drm_shaper_lut,
 					 uint32_t drm_shaper_size,
+					 bool has_rom,
+					 enum dc_transfer_func_predefined tf,
 					 const struct drm_color_lut *drm_lut3d,
 					 uint32_t drm_lut3d_size)
 {
 	struct dc_3dlut *lut3d_func;
 	struct dc_transfer_func *func_shaper;
-	bool acquire = drm_shaper_size || drm_lut3d_size;
+	bool acquire = drm_shaper_size || drm_lut3d_size || tf != TRANSFER_FUNCTION_LINEAR;
 
 	lut3d_func = (struct dc_3dlut *)stream->lut3d_func;
 	func_shaper = (struct dc_transfer_func *)stream->func_shaper;
@@ -536,7 +541,7 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 
 	amdgpu_dm_atomic_lut3d(drm_lut3d, drm_lut3d_size, lut3d_func);
 
-	return amdgpu_dm_atomic_shaper_lut(drm_shaper_lut,
+	return amdgpu_dm_atomic_shaper_lut(drm_shaper_lut, has_rom, tf,
 					   drm_shaper_size, func_shaper);
 }
 
@@ -735,6 +740,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 		shaper_size = shaper_lut != NULL ? shaper_size : 0;
 		r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, ctx, stream,
 						  shaper_lut, shaper_size,
+						  has_rom, tf,
 						  lut3d, lut3d_size);
 		if (r) {
 			DRM_DEBUG_DRIVER("Failed on shaper/3D LUTs setup\n");
-- 
2.39.2

