Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3F836635
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A237410F2A4;
	Mon, 22 Jan 2024 14:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDD110F2AC;
 Mon, 22 Jan 2024 14:59:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0A343CE2B0C;
 Mon, 22 Jan 2024 14:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281A2C433C7;
 Mon, 22 Jan 2024 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935543;
 bh=MSWeEE6FV7XfvdnRuVEZiZxowGTy6E0Grpm61VV6JOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N6bZK+0PpWHjWIT8qSHGaErRWbtcCaRb0hKyeEiWjJHYxmKtQhh6png0ud0zBq5bK
 VOyv2AlQbyxzI0nIqBFh3XiXj14NGOUdZA8k4wQZvCM7Dn/1bZalCRHgRAONOancis
 8qyKAbIpG2BoDnJSZsW14865ukGeSjajbYUT3b+IpYUsFg9oxHbdN6qAN6GcfBStc3
 08fww7Kp8pJW3+M7byZ7qeg9M/gInukjW/wyJtKTBXTQvdbYEpBGeQrzy/nb+mVlMk
 GQlIDFgl+domhwFwXw/ZI42BsKM0MO/upVz30Iz+R6ClbezBun955VMK6dOPFFJfOt
 p+3vu+f2Knw5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 51/88] drm/amd/display: Force p-state disallow if
 leaving no plane config
Date: Mon, 22 Jan 2024 09:51:24 -0500
Message-ID: <20240122145608.990137-51-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 Wesley.Chalmers@amd.com, sunpeng.li@amd.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 Samson Tam <samson.tam@amd.com>, wenjing.liu@amd.com, mdaenzer@redhat.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>, jun.lei@amd.com,
 christian.koenig@amd.com, hamza.mahfooz@amd.com
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
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 608221b0dd5d..c3c83178eb1e 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1877,6 +1877,8 @@ void dcn20_program_front_end_for_ctx(
 	int i;
 	struct dce_hwseq *hws = dc->hwseq;
 	DC_LOGGER_INIT(dc->ctx->logger);
+	unsigned int prev_hubp_count = 0;
+	unsigned int hubp_count = 0;
 
 	if (resource_is_pipe_topology_changed(dc->current_state, context))
 		resource_log_pipe_topology_update(dc, context);
@@ -1894,6 +1896,20 @@ void dcn20_program_front_end_for_ctx(
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
@@ -2039,6 +2055,10 @@ void dcn20_post_unlock_program_front_end(
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

