Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A588E00E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75210FCDE;
	Wed, 27 Mar 2024 12:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D9lSnCh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923BC10FCDC;
 Wed, 27 Mar 2024 12:28:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D4594CE2615;
 Wed, 27 Mar 2024 12:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1EAC433C7;
 Wed, 27 Mar 2024 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542521;
 bh=7W1XtM2kBUqktTrSfUPjV5wHeCHmRnaDpmkFG80H1Y0=;
 h=From:To:Cc:Subject:Date:From;
 b=D9lSnCh5y3iaXBnZ7RZNeUY9LtgMNrtCQHkvdxrHJRyoDP4WWwqgMNztU2FGpz7Ta
 BktXvv3lq9Buf6zxSoFO9o1PfTqQy1+mvWt7UJUfNpH1vmVC74UWwTYnE7cYlMjONh
 zyHaLauN8YGuteQDLcZbflYMO+5TVuQtshZg5ssgv4LsQ838QPr5dyJAgdBth4NAyg
 u9wHwZCIje+SXDvv0UyGWs70HAWeViDthuEOQ07nybOTRQFT50664x7Ql4trdTvSQ4
 7y5sTNjDNxgUWNrHcNVLt54l6GdSZgTM4lBH3BOtFjDAh8upLF+MzzsQ+/y8v6tS8A
 Hgp9PhX7Eomng==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	dillon.varone@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Init DPPCLK from SMU on dcn32" failed
 to apply to 4.19-stable tree
Date: Wed, 27 Mar 2024 08:28:38 -0400
Message-ID: <20240327122839.2842942-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 4.19-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 4f5b8d78ca43fcc695ba16c83ebfabbfe09506d6 Mon Sep 17 00:00:00 2001
From: Dillon Varone <dillon.varone@amd.com>
Date: Wed, 21 Feb 2024 13:21:20 -0500
Subject: [PATCH] drm/amd/display: Init DPPCLK from SMU on dcn32

[WHY & HOW]
DPPCLK ranges should be obtained from the SMU when available.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Chaitanya Dhere <chaitanya.dhere@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  | 14 ++++++++++
 .../drm/amd/display/dc/dml2/dml2_wrapper.c    | 28 +++++++++++++------
 .../drm/amd/display/dc/dml2/dml2_wrapper.h    |  3 ++
 .../dc/resource/dcn32/dcn32_resource.c        |  2 ++
 .../dc/resource/dcn321/dcn321_resource.c      |  2 ++
 5 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index 668f05c8654ef..bec252e1dd27a 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -216,6 +216,16 @@ void dcn32_init_clocks(struct clk_mgr *clk_mgr_base)
 	if (clk_mgr_base->bw_params->dc_mode_limit.dispclk_mhz > 1950)
 		clk_mgr_base->bw_params->dc_mode_limit.dispclk_mhz = 1950;
 
+	/* DPPCLK */
+	dcn32_init_single_clock(clk_mgr, PPCLK_DPPCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].dppclk_mhz,
+			&num_entries_per_clk->num_dppclk_levels);
+	num_levels = num_entries_per_clk->num_dppclk_levels;
+	clk_mgr_base->bw_params->dc_mode_limit.dppclk_mhz = dcn30_smu_get_dc_mode_max_dpm_freq(clk_mgr, PPCLK_DPPCLK);
+	//HW recommends limit of 1950 MHz in display clock for all DCN3.2.x
+	if (clk_mgr_base->bw_params->dc_mode_limit.dppclk_mhz > 1950)
+		clk_mgr_base->bw_params->dc_mode_limit.dppclk_mhz = 1950;
+
 	if (num_entries_per_clk->num_dcfclk_levels &&
 			num_entries_per_clk->num_dtbclk_levels &&
 			num_entries_per_clk->num_dispclk_levels)
@@ -240,6 +250,10 @@ void dcn32_init_clocks(struct clk_mgr *clk_mgr_base)
 					= khz_to_mhz_ceil(clk_mgr_base->ctx->dc->debug.min_dpp_clk_khz);
 	}
 
+	for (i = 0; i < num_levels; i++)
+		if (clk_mgr_base->bw_params->clk_table.entries[i].dppclk_mhz > 1950)
+			clk_mgr_base->bw_params->clk_table.entries[i].dppclk_mhz = 1950;
+
 	/* Get UCLK, update bounding box */
 	clk_mgr_base->funcs->get_memclk_states_from_smu(clk_mgr_base);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
index 2a58a7687bdb5..72cca367062e1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
@@ -703,13 +703,8 @@ static inline struct dml2_context *dml2_allocate_memory(void)
 	return (struct dml2_context *) kzalloc(sizeof(struct dml2_context), GFP_KERNEL);
 }
 
-bool dml2_create(const struct dc *in_dc, const struct dml2_configuration_options *config, struct dml2_context **dml2)
+static void dml2_init(const struct dc *in_dc, const struct dml2_configuration_options *config, struct dml2_context **dml2)
 {
-	// Allocate Mode Lib Ctx
-	*dml2 = dml2_allocate_memory();
-
-	if (!(*dml2))
-		return false;
 
 	// Store config options
 	(*dml2)->config = *config;
@@ -737,9 +732,18 @@ bool dml2_create(const struct dc *in_dc, const struct dml2_configuration_options
 	initialize_dml2_soc_bbox(*dml2, in_dc, &(*dml2)->v20.dml_core_ctx.soc);
 
 	initialize_dml2_soc_states(*dml2, in_dc, &(*dml2)->v20.dml_core_ctx.soc, &(*dml2)->v20.dml_core_ctx.states);
+}
+
+bool dml2_create(const struct dc *in_dc, const struct dml2_configuration_options *config, struct dml2_context **dml2)
+{
+	// Allocate Mode Lib Ctx
+	*dml2 = dml2_allocate_memory();
+
+	if (!(*dml2))
+		return false;
+
+	dml2_init(in_dc, config, dml2);
 
-	/*Initialize DML20 instance which calls dml2_core_create, and core_dcn3_populate_informative*/
-	//dml2_initialize_instance(&(*dml_ctx)->v20.dml_init);
 	return true;
 }
 
@@ -779,3 +783,11 @@ bool dml2_create_copy(struct dml2_context **dst_dml2,
 
 	return true;
 }
+
+void dml2_reinit(const struct dc *in_dc,
+				 const struct dml2_configuration_options *config,
+				 struct dml2_context **dml2)
+{
+
+	dml2_init(in_dc, config, dml2);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
index ee0eb184eb6d7..cc662d682fd4d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
@@ -214,6 +214,9 @@ void dml2_copy(struct dml2_context *dst_dml2,
 	struct dml2_context *src_dml2);
 bool dml2_create_copy(struct dml2_context **dst_dml2,
 	struct dml2_context *src_dml2);
+void dml2_reinit(const struct dc *in_dc,
+				 const struct dml2_configuration_options *config,
+				 struct dml2_context **dml2);
 
 /*
  * dml2_validate - Determines if a display configuration is supported or not.
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index f844f57ecc49b..ce1754cc1f463 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1931,6 +1931,8 @@ static void dcn32_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw
 {
 	DC_FP_START();
 	dcn32_update_bw_bounding_box_fpu(dc, bw_params);
+	if (dc->debug.using_dml2 && dc->current_state && dc->current_state->bw_ctx.dml2)
+		dml2_reinit(dc, &dc->dml2_options, &dc->current_state->bw_ctx.dml2);
 	DC_FP_END();
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index b356fed1726d9..296a0a8e71459 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1581,6 +1581,8 @@ static void dcn321_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *b
 {
 	DC_FP_START();
 	dcn321_update_bw_bounding_box_fpu(dc, bw_params);
+	if (dc->debug.using_dml2 && dc->current_state && dc->current_state->bw_ctx.dml2)
+		dml2_reinit(dc, &dc->dml2_options, &dc->current_state->bw_ctx.dml2);
 	DC_FP_END();
 }
 
-- 
2.43.0




