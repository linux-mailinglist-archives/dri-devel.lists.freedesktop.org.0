Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230BE6628CA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4003610E434;
	Mon,  9 Jan 2023 14:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9510F10E431;
 Mon,  9 Jan 2023 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eUiu9Wjf4cO16yZY2bNhlA8qvES7ZdJnbNszqoBABJk=; b=AcFBRRJPlEyliGEC7GMXryCRso
 +PtpcH1KZao7XWkZvq6yU2ttxiXjMGPocxbxuXhqDxmaxPG3sfm7u++kHlqBEUImCa9aC+YLWBV3/
 teSel5vTH7vn2CxnEMOlwUnSObf9iE4N816Uh47bQ5EKZOr3ku9imykLH7QVSHw4tzjjwbUp6p8hQ
 A36echmG6vsG3XeED97XdS+E0Q7+jiCQUo6cDjSvKVUuZ+z5uGMZuwpgcBNZFKJLNfaUufrboCLsL
 y2pOJejCbEO9j4jqz8qlKZImBUWJket+kd96gNEEEAAf8DSV0rUD/U7oo4uxvfaHdlVoTDbHZoZ3G
 QX8/If7A==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtNe-003TyM-7Z; Mon, 09 Jan 2023 15:44:06 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 07/18] drm/amd/display: remove unused regamma condition
Date: Mon,  9 Jan 2023 13:38:35 -0100
Message-Id: <20230109143846.1966301-8-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
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
Cc: laurent.pinchart+renesas@ideasonboard.com, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org, tzimmermann@suse.de,
 amd-gfx@lists.freedesktop.org, bhawanpreet.lakha@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function __set_output_tf is only called by
amdgpu_dm_update_crtc_color_mgmt() when using atomic regamma. In this
situation, func->tf == TRANSFER_FUNCTION_LINEAR (the original if
condition) and it never falls into tf != LINEAR (the else condition).
Therefore, remove unused condition to avoid misunderstandings here.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 32 ++++++-------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a4cb23d059bd..10a29d131424 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -255,14 +255,13 @@ static int __set_legacy_tf(struct dc_transfer_func *func,
  * @func: transfer function
  * @lut: lookup table that defines the color space
  * @lut_size: size of respective lut
- * @has_rom: if ROM can be used for hardcoded curve
  *
  * Returns:
  * 0 in case of success. -ENOMEM if fails.
  */
 static int __set_output_tf(struct dc_transfer_func *func,
-			   const struct drm_color_lut *lut, uint32_t lut_size,
-			   bool has_rom)
+			   const struct drm_color_lut *lut,
+			   uint32_t lut_size)
 {
 	struct dc_gamma *gamma = NULL;
 	struct calculate_buffer cal_buffer = {0};
@@ -279,24 +278,13 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	gamma->num_entries = lut_size;
 	__drm_lut_to_dc_gamma(lut, gamma, false);
 
-	if (func->tf == TRANSFER_FUNCTION_LINEAR) {
-		/*
-		 * Color module doesn't like calculating regamma params
-		 * on top of a linear input. But degamma params can be used
-		 * instead to simulate this.
-		 */
-		gamma->type = GAMMA_CUSTOM;
-		res = mod_color_calculate_degamma_params(NULL, func,
-							gamma, true);
-	} else {
-		/*
-		 * Assume sRGB. The actual mapping will depend on whether the
-		 * input was legacy or not.
-		 */
-		gamma->type = GAMMA_CS_TFM_1D;
-		res = mod_color_calculate_regamma_params(func, gamma, false,
-							 has_rom, NULL, &cal_buffer);
-	}
+	/*
+	 * Color module doesn't like calculating regamma params
+	 * on top of a linear input. But degamma params can be used
+	 * instead to simulate this.
+	 */
+	gamma->type = GAMMA_CUSTOM;
+	res = mod_color_calculate_degamma_params(NULL, func, gamma, true);
 
 	dc_gamma_release(&gamma);
 
@@ -450,7 +438,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
 
 		r = __set_output_tf(stream->out_transfer_func, regamma_lut,
-				    regamma_size, has_rom);
+				    regamma_size);
 		if (r)
 			return r;
 	} else {
-- 
2.35.1

