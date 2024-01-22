Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CE836669
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7880310F24D;
	Mon, 22 Jan 2024 15:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0F110F201;
 Mon, 22 Jan 2024 15:01:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7E271CE2AA3;
 Mon, 22 Jan 2024 15:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A524CC433F1;
 Mon, 22 Jan 2024 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935666;
 bh=vSXH9S5fPCcb5miNeZI3+Bfvyh+vxHE6G/x7Q/8vLL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KIOZHMIA5en9DO82eJNbIubKUoYr11WYWQ++7jt/BdwFJhhrVrIhBJI9jK4R0Ww/V
 SyspSHvpXULSR+FblN8+qdI9te+/L81+lnylNkjdKkMeut/RCTyqHmLITgjhJpF+Do
 36zzq7QpSd6cdInsL5waY4G5wx1GRjSw9rd/PqtZHRAZiPt/uKx0atzlBqWyXeusPq
 +gbikKIKKN90OUzdKNvG150NJshaxLN73WtDeF2LwZ5/kD5XC4npSo2qbDrdqBNvEm
 3gIh6AuU00jzuTLyeryrPGOyPgCcLkz+GzyctXys+A1IcKwhSkYYILeNfZbIe4Udyl
 XDGoCobpgBxtA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 69/88] drm/amd/display: Only clear symclk otg flag
 for HDMI
Date: Mon, 22 Jan 2024 09:51:42 -0500
Message-ID: <20240122145608.990137-69-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: ian.chen@amd.com, wenjing.liu@amd.com, Samson Tam <samson.tam@amd.com>,
 mdaenzer@redhat.com, hamza.mahfooz@amd.com, jun.lei@amd.com, airlied@gmail.com,
 Sasha Levin <sashal@kernel.org>, charlene.liu@amd.com, Josip.Pavic@amd.com,
 sancchen@amd.com, Rodrigo.Siqueira@amd.com, syed.hassan@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com,
 Alvin Lee <alvin.lee2@amd.com>, Jingwen.Zhu@amd.com, sunpeng.li@amd.com,
 mwen@igalia.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, sungjoon.kim@amd.com, dillon.varone@amd.com,
 Wesley.Chalmers@amd.com, swapnil.patel@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, nicholas.kazlauskas@amd.com, daniel@ffwll.ch,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit dff45f03f508c92cd8eb2050e27b726726b8ae0b ]

[Description]
There is a corner case where the symclk otg flag is cleared
when disabling the phantom pipe for subvp (because the phantom
and main pipe share the same link). This is undesired because
we need the maintain the correct symclk otg flag state for
the main pipe.

For now only clear the flag only for HDMI signal type, since
it's only set for HDMI signal type (phantom is virtual). The
ideal solution is to not clear it if the stream is phantom but
currently there's a bug that doesn't allow us to do this. Once
this issue is fixed the proper fix can be implemented.

Reviewed-by: Samson Tam <samson.tam@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 3 ++-
 drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 3 ++-
 drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 3 ++-
 drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c   | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 960a55e06375..c0d2e8454efc 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -2124,7 +2124,8 @@ static void dce110_reset_hw_ctx_wrap(
 				BREAK_TO_DEBUGGER();
 			}
 			pipe_ctx_old->stream_res.tg->funcs->disable_crtc(pipe_ctx_old->stream_res.tg);
-			pipe_ctx_old->stream->link->phy_state.symclk_ref_cnts.otg = 0;
+			if (dc_is_hdmi_tmds_signal(pipe_ctx_old->stream->signal))
+				pipe_ctx_old->stream->link->phy_state.symclk_ref_cnts.otg = 0;
 			pipe_ctx_old->plane_res.mi->funcs->free_mem_input(
 					pipe_ctx_old->plane_res.mi, dc->current_state->stream_count);
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index cdb903116eb7..1fc8436c8130 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -1057,7 +1057,8 @@ static void dcn10_reset_back_end_for_pipe(
 		if (pipe_ctx->stream_res.tg->funcs->set_drr)
 			pipe_ctx->stream_res.tg->funcs->set_drr(
 					pipe_ctx->stream_res.tg, NULL);
-		pipe_ctx->stream->link->phy_state.symclk_ref_cnts.otg = 0;
+		if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal))
+			pipe_ctx->stream->link->phy_state.symclk_ref_cnts.otg = 0;
 	}
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index c3c83178eb1e..da0181fef411 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -2610,7 +2610,8 @@ static void dcn20_reset_back_end_for_pipe(
 		 * the case where the same symclk is shared across multiple otg
 		 * instances
 		 */
-		link->phy_state.symclk_ref_cnts.otg = 0;
+		if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal))
+			link->phy_state.symclk_ref_cnts.otg = 0;
 		if (link->phy_state.symclk_state == SYMCLK_ON_TX_OFF) {
 			link_hwss->disable_link_output(link,
 					&pipe_ctx->link_res, pipe_ctx->stream->signal);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
index 97798cee876e..3a40b7359a30 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
@@ -523,7 +523,8 @@ static void dcn31_reset_back_end_for_pipe(
 	if (pipe_ctx->stream_res.tg->funcs->set_odm_bypass)
 		pipe_ctx->stream_res.tg->funcs->set_odm_bypass(
 				pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing);
-	pipe_ctx->stream->link->phy_state.symclk_ref_cnts.otg = 0;
+	if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal))
+		pipe_ctx->stream->link->phy_state.symclk_ref_cnts.otg = 0;
 
 	if (pipe_ctx->stream_res.tg->funcs->set_drr)
 		pipe_ctx->stream_res.tg->funcs->set_drr(
-- 
2.43.0

