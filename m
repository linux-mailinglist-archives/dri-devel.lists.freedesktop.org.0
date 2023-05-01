Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B07E6F2C6B
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 05:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B0510E251;
	Mon,  1 May 2023 03:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586AD10E248;
 Mon,  1 May 2023 03:00:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA73461710;
 Mon,  1 May 2023 03:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBB7C4339C;
 Mon,  1 May 2023 03:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682910007;
 bh=Tx3vmCs861wXDaW6tV/68MgbPLCbqupwuszoS75cJuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OQP4bN6hxQYUebCq0blr89E6cQmlocosOO8XpnQd2Vj2goXR7zhfFXR6W0GrnN0ab
 NlKwRdNdDIBwQ+r6AQjRb9snpYc6XfYVnfd0Pdyho10eFnCmBudhmNLmuK/k9xe3nC
 B9bMylqDQLtk8gjHI7WqNtK/4UDa72bA2RqTIfPx/27l80J9MNt2IzuLviQ26wR3hV
 qRivR708FxcK/FsXsfBe3BgZWc/GKT7+p9B5MvkE1VKMDUnM3kWZYGU3cUUe+5uilI
 LIfnnKxWbNJ+wpW+Qc8hmWn8WicuPOBjeUnx5obTdoulf1+P7tdnHjPIk8+ElQmtoa
 cNnRzQYuoE8qg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 04/37] drm/amd/display: enable DPG when disabling
 plane for phantom pipe
Date: Sun, 30 Apr 2023 22:59:12 -0400
Message-Id: <20230501025945.3253774-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501025945.3253774-1-sashal@kernel.org>
References: <20230501025945.3253774-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, HaoPing.Liu@amd.com, Dillon.Varone@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Samson Tam <samson.tam@amd.com>, wenjing.liu@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun.Lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Samson Tam <samson.tam@amd.com>

[ Upstream commit d47d2f9392f69f069c31d60ac3088471b1e1c7d4 ]

[Why]
In disable_dangling_plane, for phantom pipes, we enable OTG so
disable programming gets the double buffer update.  But this
causes an underflow to occur.

[How]
Enable DPG prior to enabling OTG.

Reviewed-by: Alvin Lee <Alvin.Lee2@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Samson Tam <samson.tam@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 47 +++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 698ef50e83f3f..b29978ec17d68 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -76,6 +76,8 @@
 
 #include "dc_trace.h"
 
+#include "hw_sequencer_private.h"
+
 #include "dce/dmub_outbox.h"
 
 #define CTX \
@@ -1050,6 +1052,44 @@ static void apply_ctx_interdependent_lock(struct dc *dc, struct dc_state *contex
 	}
 }
 
+static void phantom_pipe_blank(
+		struct dc *dc,
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
+	opp = dc->res_pool->opps[opp_id_src0];
+
+	opp->funcs->opp_set_disp_pattern_generator(
+			opp,
+			CONTROLLER_DP_TEST_PATTERN_SOLID_COLOR,
+			CONTROLLER_DP_COLOR_SPACE_UDEFINED,
+			COLOR_DEPTH_UNDEFINED,
+			&black_color,
+			otg_active_width,
+			otg_active_height,
+			0);
+
+	hws->funcs.wait_for_blank_complete(opp);
+}
+
 static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 {
 	int i, j;
@@ -1108,8 +1148,13 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 			 * again for different use.
 			 */
 			if (old_stream->mall_stream_config.type == SUBVP_PHANTOM) {
-				if (tg->funcs->enable_crtc)
+				if (tg->funcs->enable_crtc) {
+					int main_pipe_width, main_pipe_height;
+					main_pipe_width = old_stream->mall_stream_config.paired_stream->dst.width;
+					main_pipe_height = old_stream->mall_stream_config.paired_stream->dst.height;
+					phantom_pipe_blank(dc, tg, main_pipe_width, main_pipe_height);
 					tg->funcs->enable_crtc(tg);
+				}
 			}
 			dc_rem_all_planes_for_stream(dc, old_stream, dangling_context);
 			disable_all_writeback_pipes_for_stream(dc, old_stream, dangling_context);
-- 
2.39.2

