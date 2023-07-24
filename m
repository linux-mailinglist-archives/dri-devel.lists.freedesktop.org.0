Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590C75E668
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B80B10E225;
	Mon, 24 Jul 2023 01:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD8E10E225;
 Mon, 24 Jul 2023 01:19:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A0FA60EEB;
 Mon, 24 Jul 2023 01:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FBAC433C7;
 Mon, 24 Jul 2023 01:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161576;
 bh=8mQ1aaxYZKsSAjFd636hvk5zw2O7nhxVxEqOofpTlzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ucP9ohWQ1xjcgIdCFfpq0T5BwNF/yrZ5s+ON0WeRLsDzX0+M0lboQNLemzVzP8cca
 af8iF8PrA+D9wqSRKveBEnLxIWv/TgZEApR8GK33xsHCJtqQOlaprYYk4/pQKmYqZF
 QyShiHSpaLVB0XeS2TgqorQ767dmLilsK7Ivr/DSMVX8iI04E6fEdDvnF+qPVFBXjc
 om0kBwze6Xz9RhLD9pwv32hekidqfbCQ2gbh7DD+ebg5vFfFh+NgR5ypwKFYNpYB5M
 X7e0G/KwwHupy92bHm9ggq3CRiRwTrR+tyEPPGsy2OuZvvuCmA6KKcqcepXmfX2Eu6
 k+kRU/mjQ6HWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 40/58] drm/amd/display: Trigger DIO FIFO resync on
 commit streams
Date: Sun, 23 Jul 2023 21:13:08 -0400
Message-Id: <20230724011338.2298062-40-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
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
Cc: Iswara.Nagulendran@amd.com, wenjing.liu@amd.com,
 dri-devel@lists.freedesktop.org, hamza.mahfooz@amd.com,
 Saaem Rizvi <syedsaaem.rizvi@amd.com>, Jun.Lei@amd.com, Jingwen.Zhu@amd.com,
 Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com, sancchen@amd.com,
 Rodrigo.Siqueira@amd.com, Syed.Hassan@amd.com, amd-gfx@lists.freedesktop.org,
 alex.hung@amd.com, michael.strauss@amd.com, Alvin.Lee2@amd.com,
 jdhillon@amd.com, stylon.wang@amd.com, jiapeng.chong@linux.alibaba.com,
 sunpeng.li@amd.com, trix@redhat.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 Martin.Leung@amd.com, daniel.miess@amd.com, Dillon.Varone@amd.com,
 Tom Chung <chiahsuan.chung@amd.com>, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Dmytro.Laktyushkin@amd.com,
 zhikai.zhai@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Saaem Rizvi <syedsaaem.rizvi@amd.com>

[ Upstream commit 3e8d74cb128fb1a4d56270ffbecea6056c55739a ]

[WHY]
Currently, there is an intermittent issue where a screen can either go
blank or be corrupted.

[HOW]
To resolve the issue we trigger the ramping logic for DIO FIFO so that
it goes back up to the correct speed.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Saaem Rizvi <syedsaaem.rizvi@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../display/dc/dce110/dce110_hw_sequencer.c   |  3 +++
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h |  4 ++-
 .../drm/amd/display/dc/dcn314/dcn314_dccg.c   | 11 ++++++++
 .../drm/amd/display/dc/dcn314/dcn314_dccg.h   |  5 +++-
 .../drm/amd/display/dc/dcn314/dcn314_hwseq.c  | 27 +++++++++++++++++++
 .../drm/amd/display/dc/dcn314/dcn314_hwseq.h  |  2 ++
 .../drm/amd/display/dc/dcn314/dcn314_init.c   |  1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h  |  3 +++
 .../amd/display/dc/inc/hw_sequencer_private.h |  2 ++
 9 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 8d2460d06bced..1a0be40d125c6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -2291,6 +2291,9 @@ enum dc_status dce110_apply_ctx_to_hw(
 
 		if (DC_OK != status)
 			return status;
+
+		if (hws->funcs.resync_fifo_dccg_dio)
+			hws->funcs.resync_fifo_dccg_dio(hws, dc, context);
 	}
 
 	if (dc->fbc_compressor)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
index 7bdc146f7cb59..c8602bcfa393a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
@@ -208,7 +208,9 @@
 #define DCCG314_REG_FIELD_LIST(type) \
 	type DSCCLK3_DTO_PHASE;\
 	type DSCCLK3_DTO_MODULO;\
-	type DSCCLK3_DTO_ENABLE;
+	type DSCCLK3_DTO_ENABLE;\
+	type DENTIST_DISPCLK_RDIVIDER;\
+	type DENTIST_DISPCLK_WDIVIDER;
 
 #define DCCG32_REG_FIELD_LIST(type) \
 	type DPSTREAMCLK0_EN;\
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
index de7bfba2c1798..e0e7d32bb1a0e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
@@ -45,6 +45,16 @@
 #define DC_LOGGER \
 	dccg->ctx->logger
 
+static void dccg314_trigger_dio_fifo_resync(
+	struct dccg *dccg)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+	uint32_t dispclk_rdivider_value = 0;
+
+	REG_GET(DENTIST_DISPCLK_CNTL, DENTIST_DISPCLK_RDIVIDER, &dispclk_rdivider_value);
+	REG_UPDATE(DENTIST_DISPCLK_CNTL, DENTIST_DISPCLK_WDIVIDER, dispclk_rdivider_value);
+}
+
 static void dccg314_get_pixel_rate_div(
 		struct dccg *dccg,
 		uint32_t otg_inst,
@@ -357,6 +367,7 @@ static const struct dccg_funcs dccg314_funcs = {
 	.disable_dsc = dccg31_disable_dscclk,
 	.enable_dsc = dccg31_enable_dscclk,
 	.set_pixel_rate_div = dccg314_set_pixel_rate_div,
+	.trigger_dio_fifo_resync = dccg314_trigger_dio_fifo_resync,
 	.set_valid_pixel_rate = dccg314_set_valid_pixel_rate,
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h
index 90687a9e8fddd..8e07d3151f915 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h
@@ -192,7 +192,10 @@
 	DCCG_SF(DCCG_GATE_DISABLE_CNTL2, PHYBSYMCLK_GATE_DISABLE, mask_sh),\
 	DCCG_SF(DCCG_GATE_DISABLE_CNTL2, PHYCSYMCLK_GATE_DISABLE, mask_sh),\
 	DCCG_SF(DCCG_GATE_DISABLE_CNTL2, PHYDSYMCLK_GATE_DISABLE, mask_sh),\
-	DCCG_SF(DCCG_GATE_DISABLE_CNTL2, PHYESYMCLK_GATE_DISABLE, mask_sh)
+	DCCG_SF(DCCG_GATE_DISABLE_CNTL2, PHYESYMCLK_GATE_DISABLE, mask_sh),\
+	DCCG_SF(HDMISTREAMCLK0_DTO_PARAM, HDMISTREAMCLK0_DTO_MODULO, mask_sh),\
+	DCCG_SF(DENTIST_DISPCLK_CNTL, DENTIST_DISPCLK_RDIVIDER, mask_sh),\
+	DCCG_SF(DENTIST_DISPCLK_CNTL, DENTIST_DISPCLK_WDIVIDER, mask_sh)
 
 struct dccg *dccg314_create(
 	struct dc_context *ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
index cc3fe9cac5b53..df5c5117bc9b2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
@@ -390,6 +390,33 @@ void dcn314_set_pixels_per_cycle(struct pipe_ctx *pipe_ctx)
 				pix_per_cycle);
 }
 
+void dcn314_resync_fifo_dccg_dio(struct dce_hwseq *hws, struct dc *dc, struct dc_state *context)
+{
+	uint8_t i;
+	struct pipe_ctx *pipe = NULL;
+	bool otg_disabled[MAX_PIPES] = {false};
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		if (pipe->top_pipe || pipe->prev_odm_pipe)
+			continue;
+
+		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal))) {
+			pipe->stream_res.tg->funcs->disable_crtc(pipe->stream_res.tg);
+			reset_sync_context_for_pipe(dc, context, i);
+			otg_disabled[i] = true;
+		}
+	}
+
+	hws->ctx->dc->res_pool->dccg->funcs->trigger_dio_fifo_resync(hws->ctx->dc->res_pool->dccg);
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (otg_disabled[i])
+			pipe->stream_res.tg->funcs->enable_crtc(pipe->stream_res.tg);
+	}
+}
+
 void dcn314_dpp_root_clock_control(struct dce_hwseq *hws, unsigned int dpp_inst, bool clock_on)
 {
 	if (!hws->ctx->dc->debug.root_clock_optimization.bits.dpp)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h
index 6d0b62503caa6..559d71002e8a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h
@@ -41,6 +41,8 @@ unsigned int dcn314_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsig
 
 void dcn314_set_pixels_per_cycle(struct pipe_ctx *pipe_ctx);
 
+void dcn314_resync_fifo_dccg_dio(struct dce_hwseq *hws, struct dc *dc, struct dc_state *context);
+
 void dcn314_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on);
 
 void dcn314_dpp_root_clock_control(struct dce_hwseq *hws, unsigned int dpp_inst, bool clock_on);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
index a588f46b166f4..6b8586852c0eb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
@@ -151,6 +151,7 @@ static const struct hwseq_private_funcs dcn314_private_funcs = {
 	.setup_hpo_hw_control = dcn31_setup_hpo_hw_control,
 	.calculate_dccg_k1_k2_values = dcn314_calculate_dccg_k1_k2_values,
 	.set_pixels_per_cycle = dcn314_set_pixels_per_cycle,
+	.resync_fifo_dccg_dio = dcn314_resync_fifo_dccg_dio,
 };
 
 void dcn314_hw_sequencer_construct(struct dc *dc)
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
index ad6acd1b34e1d..0b700b3d7d972 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
@@ -159,6 +159,9 @@ struct dccg_funcs {
 			int otg_inst,
 			int pixclk_khz);
 
+	void (*trigger_dio_fifo_resync)(
+			struct dccg *dccg);
+
 	void (*dpp_root_clock_control)(
 			struct dccg *dccg,
 			unsigned int dpp_inst,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
index 4513544559be2..4ca4192c1e127 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
@@ -160,6 +160,8 @@ struct hwseq_private_funcs {
 			unsigned int *k1_div,
 			unsigned int *k2_div);
 	void (*set_pixels_per_cycle)(struct pipe_ctx *pipe_ctx);
+	void (*resync_fifo_dccg_dio)(struct dce_hwseq *hws, struct dc *dc,
+			struct dc_state *context);
 	bool (*is_dp_dig_pixel_rate_div_policy)(struct pipe_ctx *pipe_ctx);
 #endif
 };
-- 
2.39.2

