Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25A4635D1F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E7910E2E8;
	Wed, 23 Nov 2022 12:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B537D10E2DF;
 Wed, 23 Nov 2022 12:42:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5DB21B81F38;
 Wed, 23 Nov 2022 12:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039FCC433D6;
 Wed, 23 Nov 2022 12:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207324;
 bh=1Rfb2oc7NrSB4db+j1UuO7mUlYzt+qjigoSBnL2+3Ng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IomrmY4nk6xz2vOfwy+4+S8rqoFJHkK/h2Cv31c3YqHt3e5ESPM23fAZYJbwfyevT
 pSYasLFpiB3tv+eFVRM0ISLhAf06vxYBWKT15PxjN/g+2GGCFaQkJ6UsFODNp/T8uK
 C3pCgGmRYt0Iadczohd1jCBsXMX91G7wElba9AMHS1evSsD2rbtGUciqAqFCMUSf+Y
 m//SHea4ZeTYkbYx0JMSc/YfoxIiw3d5sESRenCKeHOU2St8itgsO56so4IJMtx+NS
 u37qkYjC2NSq5KTK2Vn3kGIcb50XGdpC1/cShM8SBCaWdgW62Ptst8ZFdSXnuPLOWh
 MA7bAgDXvOArw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 26/44] drm/amd/display: use uclk pstate latency
 for fw assisted mclk validation dcn32
Date: Wed, 23 Nov 2022 07:40:35 -0500
Message-Id: <20221123124057.264822-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124057.264822-1-sashal@kernel.org>
References: <20221123124057.264822-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Dillon Varone <Dillon.Varone@amd.com>,
 David.Galiffi@amd.com, Tom Chung <chiahsuan.chung@amd.com>,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 samson.tam@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 rdunlap@infradead.org, Alvin.Lee2@amd.com, george.shen@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, jun.lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dillon Varone <Dillon.Varone@amd.com>

[ Upstream commit c149947b188c651b943c1d8ca1494d1a98a3e27f ]

[WHY?]
DCN32 uses fclk pstate watermarks for dummy pstate, and must always be
supported.

[HOW?]
Validation needs to be run with fclk pstate latency set
as the dummy pstate latency to get correct prefetch and bandwidth outputs.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Dillon Varone <Dillon.Varone@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index b9d3a4000c3d..6ed76e194423 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -1700,6 +1700,12 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 			 */
 			context->bw_ctx.dml.soc.dram_clock_change_latency_us =
 					dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
+			/* For DCN32/321 need to validate with fclk pstate change latency equal to dummy so
+			 * prefetch is scheduled correctly to account for dummy pstate.
+			 */
+			if (dummy_latency_index == 0)
+				context->bw_ctx.dml.soc.fclk_change_latency_us =
+						dc->clk_mgr->bw_params->dummy_pstate_table[dummy_latency_index].dummy_pstate_latency_us;
 			dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, false);
 			maxMpcComb = context->bw_ctx.dml.vba.maxMpcComb;
 			dcfclk = context->bw_ctx.dml.vba.DCFCLKState[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
@@ -1879,6 +1885,10 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 
 	context->perf_params.stutter_period_us = context->bw_ctx.dml.vba.StutterPeriod;
 
+	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching && dummy_latency_index == 0)
+		context->bw_ctx.dml.soc.fclk_change_latency_us =
+				dc->clk_mgr->bw_params->dummy_pstate_table[dummy_latency_index].dummy_pstate_latency_us;
+
 	dcn32_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
 
 	if (!pstate_en)
@@ -1886,8 +1896,12 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 		context->bw_ctx.dml.soc.dram_clock_change_latency_us =
 				dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
 
-	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching)
+	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching) {
 		dcn30_setup_mclk_switch_using_fw_based_vblank_stretch(dc, context);
+		if (dummy_latency_index == 0)
+			context->bw_ctx.dml.soc.fclk_change_latency_us =
+					dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.fclk_change_latency_us;
+	}
 }
 
 static void dcn32_get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
-- 
2.35.1

