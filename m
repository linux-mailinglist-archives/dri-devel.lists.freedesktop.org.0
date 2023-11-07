Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F57E3CB3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B819D10E13D;
	Tue,  7 Nov 2023 12:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6939D10E13D;
 Tue,  7 Nov 2023 12:19:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B6F05B811E3;
 Tue,  7 Nov 2023 12:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FD6C433CC;
 Tue,  7 Nov 2023 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359545;
 bh=ByIIPM0M3PnHmgaXhF0czkWz0OeT1QHvIZEXFx3wcTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gbnl/GZeLvsmQtn8BsmgR8yY6QlLXI70MfL9AGqvti0X9kXdJbPIZ4FL400jKTvS6
 0K74lY4rmKDKKvPX/t2BAuFQKQRHBlzndbLeqOFLqQfjSzun6WgMbht0cx8fd4m53/
 NYW0d1yu2rG1pIGwH8C8LJdgZv+s3iEtS92CITLFKizQSVxqgdMbO31nDJ6MLZP3mh
 7VS/2Q2xrr6u7w4d5cGz+CR6hCjtBOGhDPXMIxJQCCBDZbCfnhREG8O1su34gPVtPY
 sJ2e/BG1qyHceFDauRrJj/o/r550rQd5jizIozu9pH7DLFXWPJfZeK/oJg16fRyJpH
 nrs+6Eucm2OCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 04/40] drm/amd/display: Blank phantom OTG before
 enabling
Date: Tue,  7 Nov 2023 07:16:06 -0500
Message-ID: <20231107121837.3759358-4-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107121837.3759358-1-sashal@kernel.org>
References: <20231107121837.3759358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
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
Cc: Ilya.Bakoulin@amd.com, wenjing.liu@amd.com, Samson Tam <samson.tam@amd.com>,
 mdaenzer@redhat.com, hamza.mahfooz@amd.com, moadhuri@amd.com,
 syedsaaem.rizvi@amd.com, jun.lei@amd.com, arthurgrillo@riseup.net,
 Sasha Levin <sashal@kernel.org>, danny.wang@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, alvin.lee2@amd.com,
 george.shen@amd.com, Stylon Wang <stylon.wang@amd.com>, sunpeng.li@amd.com,
 chiawen.huang@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, hanghong.ma@amd.com, dillon.varone@amd.com,
 chiahsuan.chung@amd.com, Wesley.Chalmers@amd.com, Qingqing.Zhuo@amd.com,
 Xinhui.Pan@amd.com, dmytro.laktyushkin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <Alvin.Lee2@amd.com>

[ Upstream commit e87a6c5b7780b5f423797351eb586ed96cc6d151 ]

[Description]
Before enabling the phantom OTG for an update we
must enable DPG to avoid underflow.

Reviewed-by: Samson Tam <samson.tam@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 50 +------------------
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    | 10 +++-
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    | 46 +++++++++++++++++
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.h    |  5 ++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_init.c |  1 +
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |  5 ++
 6 files changed, 68 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index d08e60dff46de..3b9d6fa50d170 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1069,53 +1069,6 @@ static void apply_ctx_interdependent_lock(struct dc *dc,
 	}
 }
 
-static void phantom_pipe_blank(
-		struct dc *dc,
-		struct timing_generator *tg,
-		int width,
-		int height)
-{
-	struct dce_hwseq *hws = dc->hwseq;
-	enum dc_color_space color_space;
-	struct tg_color black_color = {0};
-	struct output_pixel_processor *opp = NULL;
-	uint32_t num_opps, opp_id_src0, opp_id_src1;
-	uint32_t otg_active_width, otg_active_height;
-	uint32_t i;
-
-	/* program opp dpg blank color */
-	color_space = COLOR_SPACE_SRGB;
-	color_space_to_black_color(dc, color_space, &black_color);
-
-	otg_active_width = width;
-	otg_active_height = height;
-
-	/* get the OPTC source */
-	tg->funcs->get_optc_source(tg, &num_opps, &opp_id_src0, &opp_id_src1);
-	ASSERT(opp_id_src0 < dc->res_pool->res_cap->num_opp);
-
-	for (i = 0; i < dc->res_pool->res_cap->num_opp; i++) {
-		if (dc->res_pool->opps[i] != NULL && dc->res_pool->opps[i]->inst == opp_id_src0) {
-			opp = dc->res_pool->opps[i];
-			break;
-		}
-	}
-
-	if (opp && opp->funcs->opp_set_disp_pattern_generator)
-		opp->funcs->opp_set_disp_pattern_generator(
-				opp,
-				CONTROLLER_DP_TEST_PATTERN_SOLID_COLOR,
-				CONTROLLER_DP_COLOR_SPACE_UDEFINED,
-				COLOR_DEPTH_UNDEFINED,
-				&black_color,
-				otg_active_width,
-				otg_active_height,
-				0);
-
-	if (tg->funcs->is_tg_enabled(tg))
-		hws->funcs.wait_for_blank_complete(opp);
-}
-
 static void dc_update_viusal_confirm_color(struct dc *dc, struct dc_state *context, struct pipe_ctx *pipe_ctx)
 {
 	if (dc->ctx->dce_version >= DCN_VERSION_1_0) {
@@ -1206,7 +1159,8 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 
 					main_pipe_width = old_stream->mall_stream_config.paired_stream->dst.width;
 					main_pipe_height = old_stream->mall_stream_config.paired_stream->dst.height;
-					phantom_pipe_blank(dc, tg, main_pipe_width, main_pipe_height);
+					if (dc->hwss.blank_phantom)
+						dc->hwss.blank_phantom(dc, tg, main_pipe_width, main_pipe_height);
 					tg->funcs->enable_crtc(tg);
 				}
 			}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index aeadc587433fd..a2e1ca3b93e86 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1830,8 +1830,16 @@ void dcn20_program_front_end_for_ctx(
 			dc->current_state->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
 			struct timing_generator *tg = dc->current_state->res_ctx.pipe_ctx[i].stream_res.tg;
 
-			if (tg->funcs->enable_crtc)
+			if (tg->funcs->enable_crtc) {
+				if (dc->hwss.blank_phantom) {
+					int main_pipe_width, main_pipe_height;
+
+					main_pipe_width = dc->current_state->res_ctx.pipe_ctx[i].stream->mall_stream_config.paired_stream->dst.width;
+					main_pipe_height = dc->current_state->res_ctx.pipe_ctx[i].stream->mall_stream_config.paired_stream->dst.height;
+					dc->hwss.blank_phantom(dc, tg, main_pipe_width, main_pipe_height);
+				}
 				tg->funcs->enable_crtc(tg);
+			}
 		}
 	}
 	/* OTG blank before disabling all front ends */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index 680e7fa8d18ab..cae5e1e68c860 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -1573,3 +1573,49 @@ void dcn32_init_blank(
 	if (opp)
 		hws->funcs.wait_for_blank_complete(opp);
 }
+
+void dcn32_blank_phantom(struct dc *dc,
+		struct timing_generator *tg,
+		int width,
+		int height)
+{
+	struct dce_hwseq *hws = dc->hwseq;
+	enum dc_color_space color_space;
+	struct tg_color black_color = {0};
+	struct output_pixel_processor *opp = NULL;
+	uint32_t num_opps, opp_id_src0, opp_id_src1;
+	uint32_t otg_active_width, otg_active_height;
+	uint32_t i;
+
+	/* program opp dpg blank color */
+	color_space = COLOR_SPACE_SRGB;
+	color_space_to_black_color(dc, color_space, &black_color);
+
+	otg_active_width = width;
+	otg_active_height = height;
+
+	/* get the OPTC source */
+	tg->funcs->get_optc_source(tg, &num_opps, &opp_id_src0, &opp_id_src1);
+	ASSERT(opp_id_src0 < dc->res_pool->res_cap->num_opp);
+
+	for (i = 0; i < dc->res_pool->res_cap->num_opp; i++) {
+		if (dc->res_pool->opps[i] != NULL && dc->res_pool->opps[i]->inst == opp_id_src0) {
+			opp = dc->res_pool->opps[i];
+			break;
+		}
+	}
+
+	if (opp && opp->funcs->opp_set_disp_pattern_generator)
+		opp->funcs->opp_set_disp_pattern_generator(
+				opp,
+				CONTROLLER_DP_TEST_PATTERN_SOLID_COLOR,
+				CONTROLLER_DP_COLOR_SPACE_UDEFINED,
+				COLOR_DEPTH_UNDEFINED,
+				&black_color,
+				otg_active_width,
+				otg_active_height,
+				0);
+
+	if (tg->funcs->is_tg_enabled(tg))
+		hws->funcs.wait_for_blank_complete(opp);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
index 2d2628f31bed7..616d5219119e9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
@@ -115,4 +115,9 @@ void dcn32_init_blank(
 		struct dc *dc,
 		struct timing_generator *tg);
 
+void dcn32_blank_phantom(struct dc *dc,
+		struct timing_generator *tg,
+		int width,
+		int height);
+
 #endif /* __DC_HWSS_DCN32_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
index c7417147dff19..eb4227926006a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
@@ -115,6 +115,7 @@ static const struct hw_sequencer_funcs dcn32_funcs = {
 	.update_phantom_vp_position = dcn32_update_phantom_vp_position,
 	.update_dsc_pg = dcn32_update_dsc_pg,
 	.apply_update_flags_for_phantom = dcn32_apply_update_flags_for_phantom,
+	.blank_phantom = dcn32_blank_phantom,
 };
 
 static const struct hwseq_private_funcs dcn32_private_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
index 02ff99f7bec2b..7a702e216e530 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
@@ -388,6 +388,11 @@ struct hw_sequencer_funcs {
 	void (*z10_restore)(const struct dc *dc);
 	void (*z10_save_init)(struct dc *dc);
 
+	void (*blank_phantom)(struct dc *dc,
+			struct timing_generator *tg,
+			int width,
+			int height);
+
 	void (*update_visual_confirm_color)(struct dc *dc,
 			struct pipe_ctx *pipe_ctx,
 			int mpcc_id);
-- 
2.42.0

