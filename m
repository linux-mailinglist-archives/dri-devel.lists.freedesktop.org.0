Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154088366BF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124B910F354;
	Mon, 22 Jan 2024 15:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6410F320;
 Mon, 22 Jan 2024 15:06:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B8E9D61532;
 Mon, 22 Jan 2024 15:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB734C43394;
 Mon, 22 Jan 2024 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935991;
 bh=N/JYfq2P2B6n2iliMdJGT06WbHGJvbszbHCOVodukAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZLFNuCbpzOPt6eLrHwml0rENpUetiqa7lecsNcYP1L0ASWIGgvHHEpdFoaxI3rSOa
 QzvYA4WjFV/Udgq+09Qt8nLUjBlBYPePU/FUVne7aXUrRmVG6K8pe/fCzHIJGEJoFP
 rk5m/5XFwnfJVBbihUEez5u31keD07mO3L82UaG4/oires0GwTDjv+vgoFwJnS+bnW
 CSwdLV+Ygr6/INuOfavK13KOYTAJ/UhiFr91Ovwai+KJR9ZysWlfrFtMwUl2Jjygue
 YZnD5pX4upFC0zLfY8SCbENPYrvtZ7bg06U2nPZQbxlB7bZUT4mrXGGN5DWspQr0TW
 TYOLgJgPJC/CQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 44/73] drm/amd/display: Force p-state disallow if
 leaving no plane config
Date: Mon, 22 Jan 2024 10:01:58 -0500
Message-ID: <20240122150432.992458-44-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
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
Cc: wenjing.liu@amd.com, Samson Tam <samson.tam@amd.com>, mdaenzer@redhat.com,
 hamza.mahfooz@amd.com, moadhuri@amd.com, jun.lei@amd.com, airlied@gmail.com,
 Sasha Levin <sashal@kernel.org>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alvin.Lee2@amd.com, ilya.bakoulin@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Wesley.Chalmers@amd.com,
 Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com, gabe.teeger@amd.com,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit 9a902a9073c287353e25913c0761bfed49d75a88 ]

[Description]
- When we're in a no plane config, DCN is always asserting
  P-State allow
- This creates a scenario where the P-State blackout can start
  just as VUPDATE takes place and transitions the DCN config to
  a one where one or more HUBP's are active which can result in
  underflow
- To fix this issue, force p-state disallow and unforce after
  the transition from no planes case -> one or more planes active

Reviewed-by: Samson Tam <samson.tam@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index a2e1ca3b93e8..2c4bcbca8bb8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1792,6 +1792,8 @@ void dcn20_program_front_end_for_ctx(
 	int i;
 	struct dce_hwseq *hws = dc->hwseq;
 	DC_LOGGER_INIT(dc->ctx->logger);
+	unsigned int prev_hubp_count = 0;
+	unsigned int hubp_count = 0;
 
 	/* Carry over GSL groups in case the context is changing. */
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
@@ -1815,6 +1817,20 @@ void dcn20_program_front_end_for_ctx(
 		}
 	}
 
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (dc->current_state->res_ctx.pipe_ctx[i].plane_state)
+			prev_hubp_count++;
+		if (context->res_ctx.pipe_ctx[i].plane_state)
+			hubp_count++;
+	}
+
+	if (prev_hubp_count == 0 && hubp_count > 0) {
+		if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
+			dc->res_pool->hubbub->funcs->force_pstate_change_control(
+					dc->res_pool->hubbub, true, false);
+		udelay(500);
+	}
+
 	/* Set pipe update flags and lock pipes */
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		dcn20_detect_pipe_changes(&dc->current_state->res_ctx.pipe_ctx[i],
@@ -1962,6 +1978,10 @@ void dcn20_post_unlock_program_front_end(
 		}
 	}
 
+	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
+		dc->res_pool->hubbub->funcs->force_pstate_change_control(
+				dc->res_pool->hubbub, false, false);
+
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
-- 
2.43.0

