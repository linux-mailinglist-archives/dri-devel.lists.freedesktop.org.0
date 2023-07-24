Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5808175E600
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAEE10E0BA;
	Mon, 24 Jul 2023 01:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C88A10E0BA;
 Mon, 24 Jul 2023 01:13:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9502860EF4;
 Mon, 24 Jul 2023 01:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C281CC433C8;
 Mon, 24 Jul 2023 01:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161228;
 bh=+TJGO4/ZmIlOp7lWICardyjuXbS+sdzOoTX6AM8rstw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bZaBemvMt+MONrryRz2F/+IQqwjJ9ot4/vNq0sQc2yJ0ayEG/YLSSD0jmZYb25mjQ
 JYHZPD8b6vxz0UEWyLXQyKDk80sDZlydkG8JHSGuKtMYN4WDCS0k1buMf+ko4+i2Nq
 Z8R1P8M7zuzGKSehNuTSOBUu+cvKZjC15KKH+LZ4pmdrtEq7cEIKPT+V4NSnRHe7NK
 +Bm2dRD24QWNdQr5d029A46Z8tUZk73GJFVpjfS+1C1S8DXKry1h6V+yPqPwzCKwWK
 vdq89+MSXpmaJroHZw5yn4XLLJbIraqAEBmrmCpCkgL4tDoCZPjgmV7xuzyrEUSS8/
 S2wchO3tsGX+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 02/58] drm/amd/display: Update DTBCLK for DCN32
Date: Sun, 23 Jul 2023 21:12:30 -0400
Message-Id: <20230724011338.2298062-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Dillon.Varone@amd.com, Chris.Park@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, samson.tam@amd.com, wenjing.liu@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, alvin.lee2@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, jun.lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <Alvin.Lee2@amd.com>

[ Upstream commit 128c1ca0303fe764a4cde5f761e72810d9e40b6e ]

[Why&How]
- Implement interface to program DTBCLK DTO’s
  according to reference DTBCLK returned by PMFW
- This is required because DTO programming
  requires exact DTBCLK reference freq or it could
  result in underflow

Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index 8d9444db092ab..eea103908b09f 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -233,6 +233,32 @@ void dcn32_init_clocks(struct clk_mgr *clk_mgr_base)
 	DC_FP_END();
 }
 
+static void dcn32_update_clocks_update_dtb_dto(struct clk_mgr_internal *clk_mgr,
+			struct dc_state *context,
+			int ref_dtbclk_khz)
+{
+	struct dccg *dccg = clk_mgr->dccg;
+	uint32_t tg_mask = 0;
+	int i;
+
+	for (i = 0; i < clk_mgr->base.ctx->dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
+		struct dtbclk_dto_params dto_params = {0};
+
+		/* use mask to program DTO once per tg */
+		if (pipe_ctx->stream_res.tg &&
+				!(tg_mask & (1 << pipe_ctx->stream_res.tg->inst))) {
+			tg_mask |= (1 << pipe_ctx->stream_res.tg->inst);
+
+			dto_params.otg_inst = pipe_ctx->stream_res.tg->inst;
+			dto_params.ref_dtbclk_khz = ref_dtbclk_khz;
+
+			dccg->funcs->set_dtbclk_dto(clk_mgr->dccg, &dto_params);
+			//dccg->funcs->set_audio_dtbclk_dto(clk_mgr->dccg, &dto_params);
+		}
+	}
+}
+
 /* Since DPPCLK request to PMFW needs to be exact (due to DPP DTO programming),
  * update DPPCLK to be the exact frequency that will be set after the DPPCLK
  * divider is updated. This will prevent rounding issues that could cause DPP
@@ -570,6 +596,7 @@ static void dcn32_update_clocks(struct clk_mgr *clk_mgr_base,
 		/* DCCG requires KHz precision for DTBCLK */
 		clk_mgr_base->clks.ref_dtbclk_khz =
 				dcn32_smu_set_hard_min_by_freq(clk_mgr, PPCLK_DTBCLK, khz_to_mhz_ceil(new_clocks->ref_dtbclk_khz));
+		dcn32_update_clocks_update_dtb_dto(clk_mgr, context, clk_mgr_base->clks.ref_dtbclk_khz);
 	}
 
 	if (dc->config.forced_clocks == false || (force_reset && safe_to_lower)) {
-- 
2.39.2

