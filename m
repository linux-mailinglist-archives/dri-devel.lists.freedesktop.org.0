Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122027E3CB7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B3310E51A;
	Tue,  7 Nov 2023 12:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7B810E51A;
 Tue,  7 Nov 2023 12:19:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 465EEB81699;
 Tue,  7 Nov 2023 12:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DF4C433C8;
 Tue,  7 Nov 2023 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359566;
 bh=uQ9NtKoixX1kZI3/vE3JH4NF9hW7VI/vaRKE9imZ5AE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HbmIpGbPV+R7/D7GWG/1eu5ACWX75DkBnwMmHqV367Ey6ko36HxD596DJU2JB7MS8
 dd7pyS/Lr/0DEvsnbEMEpupfT2nQaMHMLVO6dh3Q1pRL64uxnzT1VCnyjaOZaOmDkA
 Sig/EPNIN1Kq51oO1rfS+fehLUk3RzpfzzFqzhavtLBC1trvBWM8kfa5MuL/1EZ+0I
 OsNUN9N4Ongx+5Spc5XJYpH4bJGA0S6OZEWaSAAEE2dqyQRefPo0i99zJdlEkRslJ0
 pKuOQTi90l05w+LU8c1LFhrq966xqZynqzGVzHLUYnAxgzKjqo2aTdK9drY9aLqtiK
 iJGZ/LtVgot3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 06/40] drm/amd/display: add seamless pipe topology
 transition check
Date: Tue,  7 Nov 2023 07:16:08 -0500
Message-ID: <20231107121837.3759358-6-sashal@kernel.org>
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
Cc: Wenjing Liu <wenjing.liu@amd.com>, samson.tam@amd.com, moadhuri@amd.com,
 syedsaaem.rizvi@amd.com, jun.lei@amd.com, Sasha Levin <sashal@kernel.org>,
 danny.wang@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, alvin.lee2@amd.com, george.shen@amd.com,
 Stylon Wang <stylon.wang@amd.com>, sunpeng.li@amd.com, chiawen.huang@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 hanghong.ma@amd.com, Dillon Varone <dillon.varone@amd.com>,
 chiahsuan.chung@amd.com, Wesley.Chalmers@amd.com, Qingqing.Zhuo@amd.com,
 Xinhui.Pan@amd.com, dmytro.laktyushkin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[ Upstream commit 15c6798ae26d5c7a7776f4f7d0c1fa8c462688a2 ]

[why]
We have a few cases where we need to perform update topology update
in dc update interface. However some of the updates are not seamless
This could cause user noticible glitches. To enforce seamless transition
we are adding a checking condition and error logging so the corruption
as result of non seamless transition can be easily spotted.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  8 +++
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    | 52 +++++++++++++++++++
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.h    |  4 ++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_init.c |  1 +
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |  3 ++
 5 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 3b9d6fa50d170..14c3c1907b953 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -4328,6 +4328,14 @@ bool dc_update_planes_and_stream(struct dc *dc,
 				update_type,
 				context);
 	} else {
+		if (!stream_update &&
+				dc->hwss.is_pipe_topology_transition_seamless &&
+				!dc->hwss.is_pipe_topology_transition_seamless(
+						dc, dc->current_state, context)) {
+
+			DC_LOG_ERROR("performing non-seamless pipe topology transition with surface only update!\n");
+			BREAK_TO_DEBUGGER();
+		}
 		commit_planes_for_stream(
 				dc,
 				srf_updates,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index cae5e1e68c860..018376146d977 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -1619,3 +1619,55 @@ void dcn32_blank_phantom(struct dc *dc,
 	if (tg->funcs->is_tg_enabled(tg))
 		hws->funcs.wait_for_blank_complete(opp);
 }
+
+bool dcn32_is_pipe_topology_transition_seamless(struct dc *dc,
+		const struct dc_state *cur_ctx,
+		const struct dc_state *new_ctx)
+{
+	int i;
+	const struct pipe_ctx *cur_pipe, *new_pipe;
+	bool is_seamless = true;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		cur_pipe = &cur_ctx->res_ctx.pipe_ctx[i];
+		new_pipe = &new_ctx->res_ctx.pipe_ctx[i];
+
+		if (resource_is_pipe_type(cur_pipe, FREE_PIPE) ||
+				resource_is_pipe_type(new_pipe, FREE_PIPE))
+			/* adding or removing free pipes is always seamless */
+			continue;
+		else if (resource_is_pipe_type(cur_pipe, OTG_MASTER)) {
+			if (resource_is_pipe_type(new_pipe, OTG_MASTER))
+				if (cur_pipe->stream->stream_id == new_pipe->stream->stream_id)
+				/* OTG master with the same stream is seamless */
+					continue;
+		} else if (resource_is_pipe_type(cur_pipe, OPP_HEAD)) {
+			if (resource_is_pipe_type(new_pipe, OPP_HEAD)) {
+				if (cur_pipe->stream_res.tg == new_pipe->stream_res.tg)
+					/*
+					 * OPP heads sharing the same timing
+					 * generator is seamless
+					 */
+					continue;
+			}
+		} else if (resource_is_pipe_type(cur_pipe, DPP_PIPE)) {
+			if (resource_is_pipe_type(new_pipe, DPP_PIPE)) {
+				if (cur_pipe->stream_res.opp == new_pipe->stream_res.opp)
+					/*
+					 * DPP pipes sharing the same OPP head is
+					 * seamless
+					 */
+					continue;
+			}
+		}
+
+		/*
+		 * This pipe's transition doesn't fall under any seamless
+		 * conditions
+		 */
+		is_seamless = false;
+		break;
+	}
+
+	return is_seamless;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
index 616d5219119e9..9992e40acd217 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
@@ -120,4 +120,8 @@ void dcn32_blank_phantom(struct dc *dc,
 		int width,
 		int height);
 
+bool dcn32_is_pipe_topology_transition_seamless(struct dc *dc,
+		const struct dc_state *cur_ctx,
+		const struct dc_state *new_ctx);
+
 #endif /* __DC_HWSS_DCN32_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
index eb4227926006a..1edadff39a5ef 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
@@ -116,6 +116,7 @@ static const struct hw_sequencer_funcs dcn32_funcs = {
 	.update_dsc_pg = dcn32_update_dsc_pg,
 	.apply_update_flags_for_phantom = dcn32_apply_update_flags_for_phantom,
 	.blank_phantom = dcn32_blank_phantom,
+	.is_pipe_topology_transition_seamless = dcn32_is_pipe_topology_transition_seamless,
 };
 
 static const struct hwseq_private_funcs dcn32_private_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
index 7a702e216e530..66e680902c95c 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
@@ -401,6 +401,9 @@ struct hw_sequencer_funcs {
 			struct dc_state *context,
 			struct pipe_ctx *phantom_pipe);
 	void (*apply_update_flags_for_phantom)(struct pipe_ctx *phantom_pipe);
+	bool (*is_pipe_topology_transition_seamless)(struct dc *dc,
+			const struct dc_state *cur_ctx,
+			const struct dc_state *new_ctx);
 
 	void (*commit_subvp_config)(struct dc *dc, struct dc_state *context);
 	void (*enable_phantom_streams)(struct dc *dc, struct dc_state *context);
-- 
2.42.0

