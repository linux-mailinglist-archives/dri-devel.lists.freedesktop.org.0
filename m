Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D2943AA5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC4810E764;
	Thu,  1 Aug 2024 00:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MaQNmas0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9FB10E760;
 Thu,  1 Aug 2024 00:17:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7AA6ECE17A6;
 Thu,  1 Aug 2024 00:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6EBC116B1;
 Thu,  1 Aug 2024 00:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471461;
 bh=j2T65Zj5aWyyXrWFynGBkS47SHJUbO+P6xMKcLEqalk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MaQNmas0yDX3IpLFqFkLs6uduhx7lRZB1d/iJoRdaxSjBY5lsXKQRE3W+wGoWhYCM
 KyrJJ5kRTqjouGtA6buWJ2j0CqKvXD9sEOlAxubaPCTuhS70l0vf+jNpGLZ67HBjZW
 ANSEVR8H6kiA/CZEYcmFA805mSrisMj2EdZrjENTYJFHg3KIBOIfVLvFoZ+ifK6Y7r
 xIgcKU2RLOddpH8rXqcqWi1buGQP5ZHMWqoVUMoGtJXJhU3v8DhwwwfUd9hArbR5sK
 IVLgI1AtxKzmIzqR/6y1AVll81hcIkmT3pWYxW77rbpPZr11wH580KnF4GB5SkgynL
 Iiw2Jw1FdUHPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 nicholas.kazlauskas@amd.com, wayne.lin@amd.com, duncan.ma@amd.com,
 alvin.lee2@amd.com, dillon.varone@amd.com, srinivasan.shanmugam@amd.com,
 aurabindo.pillai@amd.com, jinze.xu@amd.com, Qingqing.Zhuo@amd.com,
 hamza.mahfooz@amd.com, martin.leung@amd.com, chaitanya.dhere@amd.com,
 chiahsuan.chung@amd.com, harikrishna.revalla@amd.com, wenjing.liu@amd.com,
 zhikai.zhai@amd.com, arnd@arndb.de, michael.strauss@amd.com,
 sungjoon.kim@amd.com, ivlipski@amd.com, cruise.hung@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 100/121] drm/amd/display: Validate function
 returns
Date: Wed, 31 Jul 2024 20:00:38 -0400
Message-ID: <20240801000834.3930818-100-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 673f816b9e1e92d1f70e1bf5f21b531e0ff9ad6c ]

[WHAT & HOW]
Function return values must be checked before data can be used
in subsequent functions.

This fixes 4 CHECKED_RETURN issues reported by Coverity.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c               | 7 +++++--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c        | 3 ++-
 .../drm/amd/display/dc/link/protocols/link_dp_training.c   | 3 +--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 2293a92df3bed..22d2ab8ce7f8b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -245,7 +245,9 @@ bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int coun
 			if (status == DMUB_STATUS_POWER_STATE_D3)
 				return false;
 
-			dmub_srv_wait_for_idle(dmub, 100000);
+			status = dmub_srv_wait_for_idle(dmub, 100000);
+			if (status != DMUB_STATUS_OK)
+				return false;
 
 			/* Requeue the command. */
 			status = dmub_srv_cmd_queue(dmub, &cmd_list[i]);
@@ -511,7 +513,8 @@ void dc_dmub_srv_get_visual_confirm_color_cmd(struct dc *dc, struct pipe_ctx *pi
 	union dmub_rb_cmd cmd = { 0 };
 	unsigned int panel_inst = 0;
 
-	dc_get_edp_link_panel_inst(dc, pipe_ctx->stream->link, &panel_inst);
+	if (!dc_get_edp_link_panel_inst(dc, pipe_ctx->stream->link, &panel_inst))
+		return;
 
 	memset(&cmd, 0, sizeof(cmd));
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
index c6f859871d11e..7e4ca2022d649 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
@@ -595,7 +595,8 @@ static bool hubbub2_program_watermarks(
 		hubbub1->base.ctx->dc->clk_mgr->clks.p_state_change_support == false)
 		safe_to_lower = true;
 
-	hubbub1_program_pstate_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower);
+	if (hubbub1_program_pstate_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower))
+		wm_pending = true;
 
 	REG_SET(DCHUBBUB_ARB_SAT_LEVEL, 0,
 			DCHUBBUB_ARB_SAT_LEVEL, 60 * refclk_mhz);
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index b8e704dbe9567..8c0dea6f75bf1 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -1659,8 +1659,7 @@ bool perform_link_training_with_retries(
 		if (status == LINK_TRAINING_ABORT) {
 			enum dc_connection_type type = dc_connection_none;
 
-			link_detect_connection_type(link, &type);
-			if (type == dc_connection_none) {
+			if (link_detect_connection_type(link, &type) && type == dc_connection_none) {
 				DC_LOG_HW_LINK_TRAINING("%s: Aborting training because sink unplugged\n", __func__);
 				break;
 			}
-- 
2.43.0

