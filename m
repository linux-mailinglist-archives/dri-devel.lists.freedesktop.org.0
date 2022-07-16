Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A7C577145
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 21:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424BA10E259;
	Sat, 16 Jul 2022 19:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CC410E0E0;
 Sat, 16 Jul 2022 19:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6ppoxgdipskmmbW5jBQLibvHxWKVt7t/b+tu2ackF68=; b=JojGInDTU8Kz2yjwVlXOw9Vk/v
 Yig/L9s04sffB8MI0oyjtD+QmyeKUehMumRKeAg4P1zYD3kEbBCQdB7IPKCpsB5FYnhmwkvYb3YbQ
 0d9lnytUjUC8FxlpjQlDRs5wr9Ny1g459ncScbi9pCa5L/CNnxGRWFlAeuy/ACqr3vVZbPM6+tGAm
 KiXJglgq75FjYuvSTx0DtZj9zAwSvOydUKlRSOsIinvGr5kU1PObtkapIjeqmm83TvheIVMBHV+SA
 YRusFDvkAhP8lZ6A8l2x6Vlq6Oog22J4dBqqTRV+eDsVLAMsND73XjxF7lgml2MEL0QxNfAGt16pI
 dFDfnBjg==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oCnpt-001zN4-32; Sat, 16 Jul 2022 21:52:21 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: move dcn31_update_soc_for_wm_a func to dml
 fpu folder
Date: Sat, 16 Jul 2022 18:51:44 -0100
Message-Id: <20220716195144.342960-1-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although dcn31_update_soc_for_wm_a() is only called in dml/dcn31/dcn31_fpu by
dc->res_pool->funcs->update_soc_for_wm_a(dc, context), it's declared in
dcn31_resource that is not FPU protected. Move this function to dcn31_fpu
file as part of the work to isolate FPU code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 9 ---------
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h | 1 -
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  | 9 +++++++++
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  | 2 ++
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 16bbccc69fdc..17c776e88514 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -1716,15 +1716,6 @@ int dcn31_populate_dml_pipes_from_context(
 	return pipe_cnt;
 }
 
-void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
-{
-	if (dc->clk_mgr->bw_params->wm_table.entries[WM_A].valid) {
-		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].pstate_latency_us;
-		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_enter_plus_exit_time_us;
-		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_exit_time_us;
-	}
-}
-
 void dcn31_calculate_wm_and_dlg(
 		struct dc *dc, struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
index 393458015d6a..41f8ec99da6b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
@@ -59,7 +59,6 @@ dcn31_set_mcif_arb_params(struct dc *dc,
 			  struct dc_state *context,
 			  display_e2e_pipe_params_st *pipes,
 			  int pipe_cnt);
-void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context);
 
 struct resource_pool *dcn31_create_resource_pool(
 		const struct dc_init_data *init_data,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index 7be3476989ce..facac3daeaca 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -435,6 +435,15 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc = {
 	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
 };
 
+void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
+{
+	if (dc->clk_mgr->bw_params->wm_table.entries[WM_A].valid) {
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].pstate_latency_us;
+		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_enter_plus_exit_time_us;
+		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_exit_time_us;
+	}
+}
+
 void dcn31_calculate_wm_and_dlg_fp(
 		struct dc *dc, struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
index 24ac19c83687..0a10de80c1a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
@@ -31,6 +31,8 @@
 #define DCN3_15_MIN_COMPBUF_SIZE_KB 128
 #define DCN3_16_DEFAULT_DET_SIZE 192
 
+void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context);
+
 void dcn31_calculate_wm_and_dlg_fp(
 		struct dc *dc, struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
-- 
2.35.1

