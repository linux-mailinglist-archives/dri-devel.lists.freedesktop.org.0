Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E89088DD53
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901EF10FA97;
	Wed, 27 Mar 2024 12:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g0G43IGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB4510FA92;
 Wed, 27 Mar 2024 12:08:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B92FB614CD;
 Wed, 27 Mar 2024 12:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C89C43399;
 Wed, 27 Mar 2024 12:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541280;
 bh=4qFhr1I6nsrTVTR45fEiijDXQsLNyF63gQIWgwVY7Y4=;
 h=From:To:Cc:Subject:Date:From;
 b=g0G43IGT7RrP7uteZZOScyPGstqI5Rp3zHma+QakcrwfAjSWIt5wrzcN7GvbVwM5E
 h2uOyrm4h/91zdPb/mUJOoEijaYk8fsw89cxRMzNY4cV3IDXs4t/tizzCCMLzodR72
 YVGKysmYrn1TMZdqqJ7D1GSb24B8FtadomSkX/PwHvg151Mh7f6ydHpX9aWcivK0pk
 CypoS0e0YsPpUjWxYItko9M+KfUve/N0Xi7dwUwRvtdNW69DFmJIl2df9l2GKoz7Rn
 roaFZM2RHf/WWVNiNLhh281vTqzggd7fw9vGK49r/Z8V/ulsO8aYB86DFQlIW24hcc
 BzNq5oOWNWEiQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lewis.huang@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Anthony Koo <anthony.koo@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Only allow dig mapping to pwrseq in
 new asic" failed to apply to 6.8-stable tree
Date: Wed, 27 Mar 2024 08:07:57 -0400
Message-ID: <20240327120758.2825841-1-sashal@kernel.org>
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

The patch below does not apply to the 6.8-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 4af4d2c275aeb667bc2bca0d2135b825e931a55a Mon Sep 17 00:00:00 2001
From: Lewis Huang <lewis.huang@amd.com>
Date: Wed, 31 Jan 2024 17:20:17 +0800
Subject: [PATCH] drm/amd/display: Only allow dig mapping to pwrseq in new asic

[Why]
The old asic only have 1 pwrseq hw.
We don't need to map the diginst to pwrseq inst in old asic.

[How]
1. Only mapping dig to pwrseq for new asic.
2. Move mapping function into dcn specific panel control component

Cc: Stable <stable@vger.kernel.org> # v6.6+
Cc: Mario Limonciello <mario.limonciello@amd.com>
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3122
Reviewed-by: Anthony Koo <anthony.koo@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Lewis Huang <lewis.huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../drm/amd/display/dc/dce/dce_panel_cntl.c   |  1 +
 .../amd/display/dc/dcn301/dcn301_panel_cntl.c |  1 +
 .../amd/display/dc/dcn31/dcn31_panel_cntl.c   | 18 ++++++++++++-
 .../drm/amd/display/dc/inc/hw/panel_cntl.h    |  2 +-
 .../drm/amd/display/dc/link/link_factory.c    | 26 +------------------
 5 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
index e8570060d007b..5bca67407c5b1 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
@@ -290,4 +290,5 @@ void dce_panel_cntl_construct(
 	dce_panel_cntl->base.funcs = &dce_link_panel_cntl_funcs;
 	dce_panel_cntl->base.ctx = init_data->ctx;
 	dce_panel_cntl->base.inst = init_data->inst;
+	dce_panel_cntl->base.pwrseq_inst = 0;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c
index ad0df1a72a90a..9e96a3ace2077 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c
@@ -215,4 +215,5 @@ void dcn301_panel_cntl_construct(
 	dcn301_panel_cntl->base.funcs = &dcn301_link_panel_cntl_funcs;
 	dcn301_panel_cntl->base.ctx = init_data->ctx;
 	dcn301_panel_cntl->base.inst = init_data->inst;
+	dcn301_panel_cntl->base.pwrseq_inst = 0;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
index 03248422d6ffd..281be20b1a107 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
@@ -154,8 +154,24 @@ void dcn31_panel_cntl_construct(
 	struct dcn31_panel_cntl *dcn31_panel_cntl,
 	const struct panel_cntl_init_data *init_data)
 {
+	uint8_t pwrseq_inst = 0xF;
+
 	dcn31_panel_cntl->base.funcs = &dcn31_link_panel_cntl_funcs;
 	dcn31_panel_cntl->base.ctx = init_data->ctx;
 	dcn31_panel_cntl->base.inst = init_data->inst;
-	dcn31_panel_cntl->base.pwrseq_inst = init_data->pwrseq_inst;
+
+	switch (init_data->eng_id) {
+	case ENGINE_ID_DIGA:
+		pwrseq_inst = 0;
+		break;
+	case ENGINE_ID_DIGB:
+		pwrseq_inst = 1;
+		break;
+	default:
+		DC_LOG_WARNING("Unsupported pwrseq engine id: %d!\n", init_data->eng_id);
+		ASSERT(false);
+		break;
+	}
+
+	dcn31_panel_cntl->base.pwrseq_inst = pwrseq_inst;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h b/drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h
index 5dcbaa2db964a..e97d964a1791c 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h
@@ -57,7 +57,7 @@ struct panel_cntl_funcs {
 struct panel_cntl_init_data {
 	struct dc_context *ctx;
 	uint32_t inst;
-	uint32_t pwrseq_inst;
+	uint32_t eng_id;
 };
 
 struct panel_cntl {
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index 37d3027c32dcb..cf22b8f28ba6c 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -370,30 +370,6 @@ static enum transmitter translate_encoder_to_transmitter(
 	}
 }
 
-static uint8_t translate_dig_inst_to_pwrseq_inst(struct dc_link *link)
-{
-	uint8_t pwrseq_inst = 0xF;
-	struct dc_context *dc_ctx = link->dc->ctx;
-
-	DC_LOGGER_INIT(dc_ctx->logger);
-
-	switch (link->eng_id) {
-	case ENGINE_ID_DIGA:
-		pwrseq_inst = 0;
-		break;
-	case ENGINE_ID_DIGB:
-		pwrseq_inst = 1;
-		break;
-	default:
-		DC_LOG_WARNING("Unsupported pwrseq engine id: %d!\n", link->eng_id);
-		ASSERT(false);
-		break;
-	}
-
-	return pwrseq_inst;
-}
-
-
 static void link_destruct(struct dc_link *link)
 {
 	int i;
@@ -657,7 +633,7 @@ static bool construct_phy(struct dc_link *link,
 			link->link_id.id == CONNECTOR_ID_LVDS)) {
 		panel_cntl_init_data.ctx = dc_ctx;
 		panel_cntl_init_data.inst = panel_cntl_init_data.ctx->dc_edp_id_count;
-		panel_cntl_init_data.pwrseq_inst = translate_dig_inst_to_pwrseq_inst(link);
+		panel_cntl_init_data.eng_id = link->eng_id;
 		link->panel_cntl =
 			link->dc->res_pool->funcs->panel_cntl_create(
 								&panel_cntl_init_data);
-- 
2.43.0




