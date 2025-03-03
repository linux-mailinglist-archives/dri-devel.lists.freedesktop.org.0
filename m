Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD18A4C392
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 15:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C4610E34D;
	Mon,  3 Mar 2025 14:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="K6sirqud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2783A10E34D;
 Mon,  3 Mar 2025 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=Cdlfgnw8G3+c2z4nhjgVDSllq75qCcu4juCsqIjCRVU=; b=K6sirqudCWNyvGUV
 /HTVqPM3WYWKlwJk6yB1/38dSP70Im0Cm/yvMBZwLWIL/eYN48TVSc26B6c8i15hLfJ8OtvFou7KL
 JIctFSYAvAAakwQmItCIQjHAo4RElyzFmj493wDm89Bg5mPU+Q2oyCqJc5jLYf5+2RA9TV4lGHuyl
 GX4Uop2w1DjcNh1vyjrWbukIHUMYPeuA7LNh+LVhm20X/KiQ6lqBhx/8t3VF6EOIMuLJZvqneXfqm
 yEH7tOknyWujF3edoOtlVCgyQBU5Io+0s2PW7MKmCQ/4FB2F2Spuz0kuIXGHulBLTTwyKdAPo6v4i
 yL88hIl2jwOYzNqgsg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tp6x4-0028PG-2R;
 Mon, 03 Mar 2025 14:39:26 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, Felix.Kuehling@amd.com,
 christian.koenig@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, austin.zheng@amd.com, jun.lei@amd.com,
 kenneth.feng@amd.com, linux-kernel@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/6] drm/amdgpu: Remove unused pre_surface_trace
Date: Mon,  3 Mar 2025 14:39:20 +0000
Message-ID: <20250303143922.36342-5-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303143922.36342-1-linux@treblig.org>
References: <20250303143922.36342-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

pre_surface_trace() has been unused since 2017's
commit 745cc746da42 ("drm/amd/display: remove
dc_pre_update_surfaces_to_stream from dc use")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../gpu/drm/amd/display/dc/core/dc_debug.c    | 120 ------------------
 .../amd/display/include/logger_interface.h    |   5 -
 2 files changed, 125 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index af1ea5792560..650e89825968 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -51,126 +51,6 @@
 		DC_LOG_BANDWIDTH_CALCS(__VA_ARGS__); \
 } while (0)
 
-void pre_surface_trace(
-		struct dc *dc,
-		const struct dc_plane_state *const *plane_states,
-		int surface_count)
-{
-	int i;
-	DC_LOGGER_INIT(dc->ctx->logger);
-
-	for (i = 0; i < surface_count; i++) {
-		const struct dc_plane_state *plane_state = plane_states[i];
-
-		SURFACE_TRACE("Planes %d:\n", i);
-
-		SURFACE_TRACE(
-				"plane_state->visible = %d;\n"
-				"plane_state->flip_immediate = %d;\n"
-				"plane_state->address.type = %d;\n"
-				"plane_state->address.grph.addr.quad_part = 0x%llX;\n"
-				"plane_state->address.grph.meta_addr.quad_part = 0x%llX;\n"
-				"plane_state->scaling_quality.h_taps = %d;\n"
-				"plane_state->scaling_quality.v_taps = %d;\n"
-				"plane_state->scaling_quality.h_taps_c = %d;\n"
-				"plane_state->scaling_quality.v_taps_c = %d;\n",
-				plane_state->visible,
-				plane_state->flip_immediate,
-				plane_state->address.type,
-				plane_state->address.grph.addr.quad_part,
-				plane_state->address.grph.meta_addr.quad_part,
-				plane_state->scaling_quality.h_taps,
-				plane_state->scaling_quality.v_taps,
-				plane_state->scaling_quality.h_taps_c,
-				plane_state->scaling_quality.v_taps_c);
-
-		SURFACE_TRACE(
-				"plane_state->src_rect.x = %d;\n"
-				"plane_state->src_rect.y = %d;\n"
-				"plane_state->src_rect.width = %d;\n"
-				"plane_state->src_rect.height = %d;\n"
-				"plane_state->dst_rect.x = %d;\n"
-				"plane_state->dst_rect.y = %d;\n"
-				"plane_state->dst_rect.width = %d;\n"
-				"plane_state->dst_rect.height = %d;\n"
-				"plane_state->clip_rect.x = %d;\n"
-				"plane_state->clip_rect.y = %d;\n"
-				"plane_state->clip_rect.width = %d;\n"
-				"plane_state->clip_rect.height = %d;\n",
-				plane_state->src_rect.x,
-				plane_state->src_rect.y,
-				plane_state->src_rect.width,
-				plane_state->src_rect.height,
-				plane_state->dst_rect.x,
-				plane_state->dst_rect.y,
-				plane_state->dst_rect.width,
-				plane_state->dst_rect.height,
-				plane_state->clip_rect.x,
-				plane_state->clip_rect.y,
-				plane_state->clip_rect.width,
-				plane_state->clip_rect.height);
-
-		SURFACE_TRACE(
-				"plane_state->plane_size.surface_size.x = %d;\n"
-				"plane_state->plane_size.surface_size.y = %d;\n"
-				"plane_state->plane_size.surface_size.width = %d;\n"
-				"plane_state->plane_size.surface_size.height = %d;\n"
-				"plane_state->plane_size.surface_pitch = %d;\n",
-				plane_state->plane_size.surface_size.x,
-				plane_state->plane_size.surface_size.y,
-				plane_state->plane_size.surface_size.width,
-				plane_state->plane_size.surface_size.height,
-				plane_state->plane_size.surface_pitch);
-
-
-		SURFACE_TRACE(
-				"plane_state->tiling_info.gfx8.num_banks = %d;\n"
-				"plane_state->tiling_info.gfx8.bank_width = %d;\n"
-				"plane_state->tiling_info.gfx8.bank_width_c = %d;\n"
-				"plane_state->tiling_info.gfx8.bank_height = %d;\n"
-				"plane_state->tiling_info.gfx8.bank_height_c = %d;\n"
-				"plane_state->tiling_info.gfx8.tile_aspect = %d;\n"
-				"plane_state->tiling_info.gfx8.tile_aspect_c = %d;\n"
-				"plane_state->tiling_info.gfx8.tile_split = %d;\n"
-				"plane_state->tiling_info.gfx8.tile_split_c = %d;\n"
-				"plane_state->tiling_info.gfx8.tile_mode = %d;\n"
-				"plane_state->tiling_info.gfx8.tile_mode_c = %d;\n",
-				plane_state->tiling_info.gfx8.num_banks,
-				plane_state->tiling_info.gfx8.bank_width,
-				plane_state->tiling_info.gfx8.bank_width_c,
-				plane_state->tiling_info.gfx8.bank_height,
-				plane_state->tiling_info.gfx8.bank_height_c,
-				plane_state->tiling_info.gfx8.tile_aspect,
-				plane_state->tiling_info.gfx8.tile_aspect_c,
-				plane_state->tiling_info.gfx8.tile_split,
-				plane_state->tiling_info.gfx8.tile_split_c,
-				plane_state->tiling_info.gfx8.tile_mode,
-				plane_state->tiling_info.gfx8.tile_mode_c);
-
-		SURFACE_TRACE(
-				"plane_state->tiling_info.gfx8.pipe_config = %d;\n"
-				"plane_state->tiling_info.gfx8.array_mode = %d;\n"
-				"plane_state->color_space = %d;\n"
-				"plane_state->dcc.enable = %d;\n"
-				"plane_state->format = %d;\n"
-				"plane_state->rotation = %d;\n"
-				"plane_state->stereo_format = %d;\n",
-				plane_state->tiling_info.gfx8.pipe_config,
-				plane_state->tiling_info.gfx8.array_mode,
-				plane_state->color_space,
-				plane_state->dcc.enable,
-				plane_state->format,
-				plane_state->rotation,
-				plane_state->stereo_format);
-
-		SURFACE_TRACE("plane_state->tiling_info.gfx9.swizzle = %d;\n",
-				plane_state->tiling_info.gfx9.swizzle);
-
-		SURFACE_TRACE("\n");
-	}
-	SURFACE_TRACE("\n");
-}
-
 void update_surface_trace(
 		struct dc *dc,
 		const struct dc_surface_update *updates,
diff --git a/drivers/gpu/drm/amd/display/include/logger_interface.h b/drivers/gpu/drm/amd/display/include/logger_interface.h
index 058f882d5bdd..4c01514b926c 100644
--- a/drivers/gpu/drm/amd/display/include/logger_interface.h
+++ b/drivers/gpu/drm/amd/display/include/logger_interface.h
@@ -40,11 +40,6 @@ struct dc_state;
  *
  */
 
-void pre_surface_trace(
-		struct dc *dc,
-		const struct dc_plane_state *const *plane_states,
-		int surface_count);
-
 void update_surface_trace(
 		struct dc *dc,
 		const struct dc_surface_update *updates,
-- 
2.48.1

