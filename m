Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA05836664
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D7F10F0F1;
	Mon, 22 Jan 2024 15:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A72A10F208;
 Mon, 22 Jan 2024 15:01:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86D1D6150B;
 Mon, 22 Jan 2024 15:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAB7C433C7;
 Mon, 22 Jan 2024 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935697;
 bh=fQFFBkrFdLLM7GxjFIKe1M6mKNcU4J+T9QygBhzijbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K5u4CQXKjXv9BYjxwLF5UkYU1tYwD8edI2DdYO++gZ4cGChfzFomdThqKIoAGLPnn
 9hBTJANKD/+OgMOZEooXGnTTuKc/uFZPSVcSGtJoVCapSUJNZtoW2IhXcgeMxOPNMd
 iABFbii39us/m2KhGrCTfvSgmmG3P+54Ng0ruUY0ezpvg/yRGTiZxHsJmKcVtOwnps
 mfwEJIzyHYu/TTkcsic3kIdAKGo496aIlnbjfuK+Uq6NSaBzj9QFDh6ExlFQMBkGdI
 jqeg8Rjxd4t39Q6DIzI0ov0Q4/f8A15GzKR+okcsn/CwJ1/3FopV8YPQEdjNFS0Ac5
 lIsAMBIYrU+0A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 76/88] drm/amd/display: Fixing stream allocation
 regression
Date: Mon, 22 Jan 2024 09:51:49 -0500
Message-ID: <20240122145608.990137-76-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, Relja Vojvodic <relja.vojvodic@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, srinivasan.shanmugam@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 samson.tam@amd.com, ethan.bitnun@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, alvin.lee2@amd.com, daniel@ffwll.ch,
 Martin Leung <martin.leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 jun.lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Relja Vojvodic <relja.vojvodic@amd.com>

[ Upstream commit 292c2116b2ae84c7e799ae340981e60551b18f5e ]

For certain dual display configs that had one display using a 1080p
mode, the DPM level used to drive the configs regressed from DPM 0 to
DPM 3. This was caused by a missing check that should have only limited
the pipe segments on non-phantom pipes. This caused issues with detile
buffer allocation, which dissallow subvp from being used

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Reviewed-by: Martin Leung <martin.leung@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Relja Vojvodic <relja.vojvodic@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index bc5f0db23d0c..a9c45174abed 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -290,7 +290,7 @@ static void override_det_for_subvp(struct dc *dc, struct dc_state *context, uint
 		for (i = 0; i < dc->res_pool->pipe_count; i++) {
 			struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
-			if (pipe_ctx->stream && pipe_ctx->plane_state && pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM) {
+			if (pipe_ctx->stream && pipe_ctx->plane_state && pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM != SUBVP_PHANTOM) {
 				if (pipe_ctx->stream->timing.v_addressable == 1080 && pipe_ctx->stream->timing.h_addressable == 1920) {
 					if (pipe_segments[i] > 4)
 						pipe_segments[i] = 4;
-- 
2.43.0

