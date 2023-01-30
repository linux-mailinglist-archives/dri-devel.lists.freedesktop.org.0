Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31186681AE7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 20:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DEC10E126;
	Mon, 30 Jan 2023 19:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AED10E126;
 Mon, 30 Jan 2023 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9XQaoJ7LDoCXPduWr2aD6SVTOAoLNF/BGWXbCC0eBLg=; b=mL8E4UAqmtdD8kboXApFofEBDV
 veQ7MfZUfECa9Ae5XlCingOIHzFnj6uQhQ2ipOvziMCcFws0WoWGIkeJfR/H1gAnK+bNfcvSpqvqA
 fsEzn/roRWLTMijar76CTzkNixnFjSOkYmnb94RZxTvJ/f5sRnS5NaXYtCveHp5WFWezNKqEFGmno
 b1EGrsJlGPiggMG5UuFHifG1QrlplTZUdRud9jyu/AkyXgURMh9sPSnIsTonlGTNBLcmQi4mcyn7w
 UK9Ab12W17q8wEZZ+x3zOGZwp+KPH4n/MpAvbAWV0O3yu1hZ2cXM2f82HXiBxaDxaruAUV6oc5ipA
 t/ZQMVYQ==;
Received: from [177.94.21.70] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pMaGJ-004lup-Tl; Mon, 30 Jan 2023 20:56:20 +0100
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Trivial swizzle-related code clean-ups
Date: Mon, 30 Jan 2023 16:56:07 -0300
Message-Id: <20230130195607.1297694-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.39.0
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
Cc: kernel@gpiccoli.net, Swapnil Patel <Swapnil.Patel@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 dri-devel@lists.freedesktop.org, Mark Broadworth <mark.broadworth@amd.com>,
 Melissa Wen <mwen@igalia.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Sung Joon Kim <Sungjoon.Kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a very trivial code clean-up related to commit 5468c36d6285
("drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS"). This commit
added a validation on driver probe to prevent invalid TMDS modes, but one
of the fake properties (swizzle) ended-up causing a warning on driver
probe; was reported here: https://gitlab.freedesktop.org/drm/amd/-/issues/2264.

It was fixed by commit 105a8b8698e2 ("drm/amd/display: patch cases with
unknown plane state to prevent warning"), but the validation code had
a double variable assignment, which we hereby remove. Also, the fix relies
in the dcn2{0,1}patch_unknown_plane_state() callbacks, so while at it we
took the opportunity to perform a small code clean-up in such routines.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Daniel Wheeler <daniel.wheeler@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Mark Broadworth <mark.broadworth@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Sung Joon Kim <Sungjoon.Kim@amd.com>
Cc: Swapnil Patel <Swapnil.Patel@amd.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 1 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 8 ++------
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 6 ++----
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 86a2f7f58550..e71e94663d14 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6336,7 +6336,6 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 	dc_plane_state->plane_size.surface_size.width  = stream->src.width;
 	dc_plane_state->plane_size.chroma_size.height  = stream->src.height;
 	dc_plane_state->plane_size.chroma_size.width   = stream->src.width;
-	dc_plane_state->tiling_info.gfx9.swizzle =  DC_SW_UNKNOWN;
 	dc_plane_state->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB8888;
 	dc_plane_state->tiling_info.gfx9.swizzle = DC_SW_UNKNOWN;
 	dc_plane_state->rotation = ROTATION_ANGLE_0;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 531f405d2554..3af24ef9cb2d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2225,14 +2225,10 @@ enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state *plane_stat
 	enum surface_pixel_format surf_pix_format = plane_state->format;
 	unsigned int bpp = resource_pixel_format_to_bpp(surf_pix_format);
 
-	enum swizzle_mode_values swizzle = DC_SW_LINEAR;
-
+	plane_state->tiling_info.gfx9.swizzle = DC_SW_64KB_S;
 	if (bpp == 64)
-		swizzle = DC_SW_64KB_D;
-	else
-		swizzle = DC_SW_64KB_S;
+		plane_state->tiling_info.gfx9.swizzle = DC_SW_64KB_D;
 
-	plane_state->tiling_info.gfx9.swizzle = swizzle;
 	return DC_OK;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index fbcf0afeae0d..8f9244fe5c86 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -1393,15 +1393,13 @@ static uint32_t read_pipe_fuses(struct dc_context *ctx)
 
 static enum dc_status dcn21_patch_unknown_plane_state(struct dc_plane_state *plane_state)
 {
-	enum dc_status result = DC_OK;
-
 	if (plane_state->ctx->dc->debug.disable_dcc == DCC_ENABLE) {
 		plane_state->dcc.enable = 1;
 		/* align to our worst case block width */
 		plane_state->dcc.meta_pitch = ((plane_state->src_rect.width + 1023) / 1024) * 1024;
 	}
-	result = dcn20_patch_unknown_plane_state(plane_state);
-	return result;
+
+	return dcn20_patch_unknown_plane_state(plane_state);
 }
 
 static const struct resource_funcs dcn21_res_pool_funcs = {
-- 
2.39.0

