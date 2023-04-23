Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C46EC034
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128C810E417;
	Sun, 23 Apr 2023 14:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F9410E415;
 Sun, 23 Apr 2023 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j3/12jxSdcW585zS5aTXAW8FYxDjDH8xTDC6oGODNZ4=; b=gGPYg1jP8KMZzxXdI1YyTRkYWD
 ZOSsJyEWVsUa4GnVoAhvsXfQe5MwF/3xExwFTIXBkBhDy26yZagqaIfPPwFlbEkrrNcPp3NBd7CBE
 cKO/cuBPRttDjjstSCMeNkP6/A7WLmMcJoClGtyLVXAtwsZga4YDQHji8U8a1HHhz6hienUN4W++V
 g3vS9eYtpHFvmFYUtrlL8GLh2d9et+g2dxLs6Bzn1Ewt/J7yqREVBcR/w9pFXOxaMg5xpSPow0Sfi
 02XeYziyiJQbR9xryPVYgY113jjbSkCgryI/9m2MC3TEQVdXp7BXUzlfxY8tzz68AwJZFnQMRyu1g
 VY7vcTog==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaTZ-00ANVs-0W; Sun, 23 Apr 2023 16:14:01 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 36/40] drm/amd/display: add plane shaper/3D LUT and shaper
 TF support
Date: Sun, 23 Apr 2023 13:10:48 -0100
Message-Id: <20230423141051.702990-37-mwen@igalia.com>
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

We already have the steps to program post-blending shaper/3D LUT on AMD
display driver, so that we can reuse them and map plane properties to DC
plane for pre-blending (plane) shaper/3D LUT setup.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 34 +++++++++++++++++--
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |  5 +--
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 854510b05194..e17141fc8d12 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -909,6 +909,35 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	}
 	return 0;
 }
+
+static int
+amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
+				     struct dc_plane_state *dc_plane_state)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	enum drm_transfer_function shaper_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
+	const struct drm_color_lut *shaper_lut, *lut3d;
+	uint32_t lut3d_size, shaper_size;
+
+	/* We have nothing to do here, return */
+	if (!plane_state->color_mgmt_changed)
+		return 0;
+
+	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
+
+	shaper_tf = dm_plane_state->shaper_tf;
+	shaper_lut = __extract_blob_lut(dm_plane_state->shaper_lut, &shaper_size);
+	lut3d = __extract_blob_lut(dm_plane_state->lut3d, &lut3d_size);
+	lut3d_size = lut3d != NULL ? lut3d_size : 0;
+	shaper_size = shaper_lut != NULL ? shaper_size : 0;
+
+	amdgpu_dm_atomic_lut3d(lut3d, lut3d_size, dc_plane_state->lut3d_func);
+	ret = amdgpu_dm_atomic_shaper_lut(shaper_lut, false,
+					  drm_tf_to_dc_tf(shaper_tf),
+					  shaper_size, dc_plane_state->in_shaper_func);
+
+	return ret;
+}
 #endif
 
 /**
@@ -939,7 +968,9 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
 #ifdef CONFIG_STEAM_DECK
-	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
+	ret = amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
+	if(ret)
+		return ret;
 
 	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
 	if (ret != -EINVAL)
@@ -971,6 +1002,5 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 			return ret;
 	}
 
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 5800acf6aae1..91fee60410f4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1759,8 +1759,9 @@ static void dcn20_program_pipe(
 		hws->funcs.set_hdr_multiplier(pipe_ctx);
 
 	if (pipe_ctx->update_flags.bits.enable ||
-			pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
-			pipe_ctx->plane_state->update_flags.bits.gamma_change)
+	    pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
+	    pipe_ctx->plane_state->update_flags.bits.gamma_change ||
+	    pipe_ctx->plane_state->update_flags.bits.lut_3d)
 		hws->funcs.set_input_transfer_func(dc, pipe_ctx, pipe_ctx->plane_state);
 
 	/* dcn10_translate_regamma_to_hw_format takes 750us to finish
-- 
2.39.2

