Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF560AA9F8E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4329810E477;
	Mon,  5 May 2025 22:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XjopS4J7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A280710E476;
 Mon,  5 May 2025 22:24:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4B5BE61F1F;
 Mon,  5 May 2025 22:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2267C4CEE4;
 Mon,  5 May 2025 22:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483869;
 bh=lwr9bmhpfNroeZ6vXSSRBniyysNpdMbEwskf9zf0GNE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XjopS4J7d9b+JLQUrKmn6D1W0lIaaIEYC6rd16ll4UGMO1fQdxBOoVS0HanIJF6TG
 fysVl7M0XBtYLDA7wJWCPAlYC2v+VcU42l6m/o6ZZ1bWdNrSAcJm2ixNtJggKFohY8
 UtRyAnWmdyhWaYQ5D4PHgfMnF+axldimHb4tv+Aam+U4jb6xOC7T+jdnBE+uRWz0Cz
 LT6frNeEki/YRcicZ1gjNfZYESro6aVoDe2xF5H7X6t4T/SxKpDLzuD/pZj/bFYYjl
 /gsRvMxaVFGW/ylbhhnZMqeV7VgQFhb6Pb6w4oMZbCSJ15NvzVV2rf/DrUcsTs6pzj
 K/iqmEmEIpWIg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aric Cyr <Aric.Cyr@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, austin.zheng@amd.com, jun.lei@amd.com,
 siqueira@igalia.com, alex.hung@amd.com, alvin.lee2@amd.com,
 aurabindo.pillai@amd.com, Ilya.Bakoulin@amd.com, mario.limonciello@amd.com,
 Wayne.Lin@amd.com, Josip.Pavic@amd.com, dillon.varone@amd.com,
 wenjing.liu@amd.com, linux@treblig.org, Leo.Zeng@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 253/642] drm/amd/display: Request HW cursor on
 DCN3.2 with SubVP
Date: Mon,  5 May 2025 18:07:49 -0400
Message-Id: <20250505221419.2672473-253-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Aric Cyr <Aric.Cyr@amd.com>

[ Upstream commit b74f46f3ce1e5f6336645f1e9ff47c56d5dfdef1 ]

[why]
When SubVP is active the HW cursor size is limited to 64x64, and
anything larger will force composition which is bad for gaming on
DCN3.2 if the game uses a larger cursor.

[how]
If HW cursor is requested, typically by a fullscreen game, do not
enable SubVP so that up to 256x256 cursor sizes are available for
DCN3.2.

Reviewed-by: Aric Cyr <aric.cyr@amd.com>
Signed-off-by: Aric Cyr <Aric.Cyr@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c             | 3 ++-
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index a444fe1e0838a..5cd13aea1f694 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -4907,7 +4907,8 @@ static bool full_update_required(struct dc *dc,
 			stream_update->lut3d_func ||
 			stream_update->pending_test_pattern ||
 			stream_update->crtc_timing_adjust ||
-			stream_update->scaler_sharpener_update))
+			stream_update->scaler_sharpener_update ||
+			stream_update->hw_cursor_req))
 		return true;
 
 	if (stream) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 6f490d8d7038c..56dda686e2992 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -626,6 +626,7 @@ static bool dcn32_assign_subvp_pipe(struct dc *dc,
 		 * - Not TMZ surface
 		 */
 		if (pipe->plane_state && !pipe->top_pipe && !pipe->prev_odm_pipe && !dcn32_is_center_timing(pipe) &&
+				!pipe->stream->hw_cursor_req &&
 				!(pipe->stream->timing.pix_clk_100hz / 10000 > DCN3_2_MAX_SUBVP_PIXEL_RATE_MHZ) &&
 				(!dcn32_is_psr_capable(pipe) || (context->stream_count == 1 && dc->caps.dmub_caps.subvp_psr)) &&
 				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_NONE &&
-- 
2.39.5

