Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBCC985931
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C010E96E;
	Wed, 25 Sep 2024 11:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q+AlX7bZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5261110E96C;
 Wed, 25 Sep 2024 11:51:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6C751A43FAF;
 Wed, 25 Sep 2024 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51B0C4CEC3;
 Wed, 25 Sep 2024 11:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265063;
 bh=IRYTNB+jCbKqwSnAW5SlGOXSdtMMgG6Ioqz+djcTV14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q+AlX7bZBxHz0UBvVqVa9EpwTsyq3r3og5uAtujHM6TCNBt2y8RTkl2UAYeKMthjz
 OutW4B32GmB5o/X2wGRvk81ZSxWk/n/6t49wzDw2CGu9+vymdJj5CezF+h8Syo5uG2
 RNjjSrwwbgklm++3LeunjuieBCaB2ED9jOqdCU6U0jNBO+bi4tk6qrE9oHVVlIltUk
 GFZH0bdCmu4nlMUMZh8jllAZIveG6bD48i2MSfVr4p5hY23B2QZJtDw2sxPaNYdySE
 l8PHFeJHcTQqvXD6MikNKB9HB35m3Kl+NJi73O0Bk9x7JuR7HLVqTSW2ubbGQCvKxy
 83XD/qOo3a0Bw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dillon Varone <dillon.varone@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alex.hung@amd.com, aurabindo.pillai@amd.com,
 daniel.sa@amd.com, chaitanya.dhere@amd.com, roman.li@amd.com,
 jun.lei@amd.com, wenjing.liu@amd.com, joshua.aberback@amd.com,
 nicholas.kazlauskas@amd.com, Qingqing.Zhuo@amd.com, gateeger@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 202/244] drm/amd/display: Force enable 3DLUT DMA
 check for dcn401 in DML
Date: Wed, 25 Sep 2024 07:27:03 -0400
Message-ID: <20240925113641.1297102-202-sashal@kernel.org>
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

From: Dillon Varone <dillon.varone@amd.com>

[ Upstream commit b8dc6ca028d9a39196a3a066b9ef2d4a5eca475d ]

[WHY]
Currently TR0 (trip 0) is not properly budgeting for urgent latency in
DML2.1. This results in overly aggressive prefetch schedules that are
vulnerable to request return jitter, resulting in severe underflow at
the start of the frame.

[HOW]
Forcing 3DLUT DMA check to enable causes urgent latency to be budgeted
properly into the prefetch schedule, avoiding the vulnerability.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/dml2/dml21/dml21_translation_helper.c    | 6 ++++--
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h          | 1 +
 .../drm/amd/display/dc/resource/dcn401/dcn401_resource.c    | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index 06387b8b0aee5..825b3bfc0bed5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -827,6 +827,7 @@ static void populate_dml21_plane_config_from_plane_state(struct dml2_context *dm
 
 	if (plane_state->mcm_luts.lut3d_data.lut3d_src == DC_CM2_TRANSFER_FUNC_SOURCE_VIDMEM) {
 		plane->tdlut.setup_for_tdlut = true;
+
 		switch (plane_state->mcm_luts.lut3d_data.gpu_mem_params.layout) {
 		case DC_CM2_GPU_MEM_LAYOUT_3D_SWIZZLE_LINEAR_RGB:
 		case DC_CM2_GPU_MEM_LAYOUT_3D_SWIZZLE_LINEAR_BGR:
@@ -836,6 +837,7 @@ static void populate_dml21_plane_config_from_plane_state(struct dml2_context *dm
 			plane->tdlut.tdlut_addressing_mode = dml2_tdlut_simple_linear;
 			break;
 		}
+
 		switch (plane_state->mcm_luts.lut3d_data.gpu_mem_params.size) {
 		case DC_CM2_GPU_MEM_SIZE_171717:
 			plane->tdlut.tdlut_width_mode = dml2_tdlut_width_17_cube;
@@ -844,8 +846,8 @@ static void populate_dml21_plane_config_from_plane_state(struct dml2_context *dm
 			//plane->tdlut.tdlut_width_mode = dml2_tdlut_width_flatten; // dml2_tdlut_width_flatten undefined
 			break;
 		}
-	} else
-		plane->tdlut.setup_for_tdlut = false;
+	}
+	plane->tdlut.setup_for_tdlut |= dml_ctx->config.force_tdlut_enable;
 
 	plane->dynamic_meta_data.enable = false;
 	plane->dynamic_meta_data.lines_before_active_required = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
index 023325e8f6e22..0f944fcfd5a5b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
@@ -236,6 +236,7 @@ struct dml2_configuration_options {
 
 	bool use_clock_dc_limits;
 	bool gpuvm_enable;
+	bool force_tdlut_enable;
 	struct dml2_soc_bb *bb_from_dmub;
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 3e76732ac0dca..ec676d269d33f 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -2099,6 +2099,7 @@ static bool dcn401_resource_construct(
 	dc->dml2_options.use_native_soc_bb_construction = true;
 	dc->dml2_options.minimize_dispclk_using_odm = true;
 	dc->dml2_options.map_dc_pipes_with_callbacks = true;
+	dc->dml2_options.force_tdlut_enable = true;
 
 	resource_init_common_dml2_callbacks(dc, &dc->dml2_options);
 	dc->dml2_options.callbacks.can_support_mclk_switch_using_fw_based_vblank_stretch = &dcn30_can_support_mclk_switch_using_fw_based_vblank_stretch;
-- 
2.43.0

