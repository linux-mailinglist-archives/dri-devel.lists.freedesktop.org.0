Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E19858A8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A2610E8F2;
	Wed, 25 Sep 2024 11:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b+meSjYT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D381D10E8F2;
 Wed, 25 Sep 2024 11:45:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B1465C5941;
 Wed, 25 Sep 2024 11:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07861C4CEC3;
 Wed, 25 Sep 2024 11:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264750;
 bh=DVGnUYvBcHuMLBChz9iVVjT+v+6z3/OQZyMlDDpdGPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b+meSjYTA9xcfzAshdmK/thqw4ziVX/tjMsGgQu0ka7rhx5meOjXb/7B7Bie5KdnC
 sFfr9tQVdW2/5ofcVKLGoLXIInPD/LPZUNDkMYG1E5+4Swcj6LZEcE2d92ZfK0jFh8
 MRBjP587J+LMbctrZOgLDnk1hoiWR8cZ94BtmTYYMB9Az4OmxuNS7EWgMoAv70jAaq
 K/lj2hrzAg089ma+w9eioMyaoZeoQyXIeqkpILVfLksO6zikekP4HmLh8YlOZ4WB1Y
 5OFMv8DX10WVKSc4/cqoRr8BQTubJTf4S29uFZwXalWtZAoNsMvsXXSMxn9nBwyzAm
 MdlLK7B9lbPfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Jun Lei <jun.lei@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, charlene.liu@amd.com, hamza.mahfooz@amd.com,
 sungjoon.kim@amd.com, Jerry.Zuo@amd.com, syed.hassan@amd.com,
 Qingqing.Zhuo@amd.com, aurabindo.pillai@amd.com, arnd@arndb.de,
 xi.liu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 144/244] drm/amd/display: Use
 gpuvm_min_page_size_kbytes for DML2 surfaces
Date: Wed, 25 Sep 2024 07:26:05 -0400
Message-ID: <20240925113641.1297102-144-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 31663521ede2edb622ee1b397ae3ac666d6351c5 ]

[Why]
It's currently hard coded to 256 when it should be using the SOC
provided values. This can result in corruption with linear surfaces
where we prefetch more PTE than the buffer can hold.

[How]
Update the min page size correctly for the plane.

Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Jun Lei <jun.lei@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../display/dc/dml2/dml2_translation_helper.c | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index 8b9dcee772660..73c285b751d6f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -953,7 +953,9 @@ static void get_scaler_data_for_plane(const struct dc_plane_state *in, struct dc
 	memcpy(out, &temp_pipe->plane_res.scl_data, sizeof(*out));
 }
 
-static void populate_dummy_dml_plane_cfg(struct dml_plane_cfg_st *out, unsigned int location, const struct dc_stream_state *in)
+static void populate_dummy_dml_plane_cfg(struct dml_plane_cfg_st *out, unsigned int location,
+					 const struct dc_stream_state *in,
+					 const struct soc_bounding_box_st *soc)
 {
 	dml_uint_t width, height;
 
@@ -970,7 +972,7 @@ static void populate_dummy_dml_plane_cfg(struct dml_plane_cfg_st *out, unsigned
 	out->CursorBPP[location] = dml_cur_32bit;
 	out->CursorWidth[location] = 256;
 
-	out->GPUVMMinPageSizeKBytes[location] = 256;
+	out->GPUVMMinPageSizeKBytes[location] = soc->gpuvm_min_page_size_kbytes;
 
 	out->ViewportWidth[location] = width;
 	out->ViewportHeight[location] = height;
@@ -1007,7 +1009,9 @@ static void populate_dummy_dml_plane_cfg(struct dml_plane_cfg_st *out, unsigned
 	out->ScalerEnabled[location] = false;
 }
 
-static void populate_dml_plane_cfg_from_plane_state(struct dml_plane_cfg_st *out, unsigned int location, const struct dc_plane_state *in, struct dc_state *context)
+static void populate_dml_plane_cfg_from_plane_state(struct dml_plane_cfg_st *out, unsigned int location,
+						    const struct dc_plane_state *in, struct dc_state *context,
+						    const struct soc_bounding_box_st *soc)
 {
 	struct scaler_data *scaler_data = kzalloc(sizeof(*scaler_data), GFP_KERNEL);
 	if (!scaler_data)
@@ -1018,7 +1022,7 @@ static void populate_dml_plane_cfg_from_plane_state(struct dml_plane_cfg_st *out
 	out->CursorBPP[location] = dml_cur_32bit;
 	out->CursorWidth[location] = 256;
 
-	out->GPUVMMinPageSizeKBytes[location] = 256;
+	out->GPUVMMinPageSizeKBytes[location] = soc->gpuvm_min_page_size_kbytes;
 
 	out->ViewportWidth[location] = scaler_data->viewport.width;
 	out->ViewportHeight[location] = scaler_data->viewport.height;
@@ -1299,7 +1303,8 @@ void map_dc_state_into_dml_display_cfg(struct dml2_context *dml2, struct dc_stat
 			disp_cfg_plane_location = dml_dispcfg->num_surfaces++;
 
 			populate_dummy_dml_surface_cfg(&dml_dispcfg->surface, disp_cfg_plane_location, context->streams[i]);
-			populate_dummy_dml_plane_cfg(&dml_dispcfg->plane, disp_cfg_plane_location, context->streams[i]);
+			populate_dummy_dml_plane_cfg(&dml_dispcfg->plane, disp_cfg_plane_location,
+						     context->streams[i], &dml2->v20.dml_core_ctx.soc);
 
 			dml_dispcfg->plane.BlendingAndTiming[disp_cfg_plane_location] = disp_cfg_stream_location;
 
@@ -1315,7 +1320,10 @@ void map_dc_state_into_dml_display_cfg(struct dml2_context *dml2, struct dc_stat
 				ASSERT(disp_cfg_plane_location >= 0 && disp_cfg_plane_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
 
 				populate_dml_surface_cfg_from_plane_state(dml2->v20.dml_core_ctx.project, &dml_dispcfg->surface, disp_cfg_plane_location, context->stream_status[i].plane_states[j]);
-				populate_dml_plane_cfg_from_plane_state(&dml_dispcfg->plane, disp_cfg_plane_location, context->stream_status[i].plane_states[j], context);
+				populate_dml_plane_cfg_from_plane_state(
+					&dml_dispcfg->plane, disp_cfg_plane_location,
+					context->stream_status[i].plane_states[j], context,
+					&dml2->v20.dml_core_ctx.soc);
 
 				if (stream_mall_type == SUBVP_MAIN) {
 					dml_dispcfg->plane.UseMALLForPStateChange[disp_cfg_plane_location] = dml_use_mall_pstate_change_sub_viewport;
-- 
2.43.0

