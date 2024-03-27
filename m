Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B388DE60
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C163210FB70;
	Wed, 27 Mar 2024 12:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qiWn/50H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E474310FB6E;
 Wed, 27 Mar 2024 12:15:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3B97061519;
 Wed, 27 Mar 2024 12:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1B1C43390;
 Wed, 27 Mar 2024 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541759;
 bh=mfbgHbPzTgNHogBsmr1pXkKJqEMKk/914rY6t3Qu7BM=;
 h=From:To:Cc:Subject:Date:From;
 b=qiWn/50HP6D6MpN+sXBofpRT6h6A8ONnLi08I12V60uwlWGsKPlC9u16M0xIwoFR2
 LDVy8l4nVgbMb1eWViVlDFQx4kEycDqFRNFqnf+gmdJnIl9eIUnHdUgmG6ahuIV3Fx
 lR9L71WMvXFw3ymY7AnbCtvBvag7YObDXcHJy7Ijtz1sBRJ3xEFri5RiSogLN9QaSP
 qbKGQcArM73Rew9jEyRxew52mboZV4eOIVGnR+ETWoyNA7yqJC692eBVmF5fMkEtEA
 f673a2NE8UFDvzNQ3ylqNpHd//VjjVg+qWZHxjQzxQu4ORjX5JuNOi+5hTViS0A2kf
 K0nNJGuTK0Qgw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	wenjing.liu@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Lock all enabled otg pipes even with
 no planes" failed to apply to 5.15-stable tree
Date: Wed, 27 Mar 2024 08:15:56 -0400
Message-ID: <20240327121556.2832310-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 94040c2cbb1a872ff779da06bf034ccfee0f9cba Mon Sep 17 00:00:00 2001
From: Wenjing Liu <wenjing.liu@amd.com>
Date: Fri, 23 Feb 2024 15:17:39 -0500
Subject: [PATCH] drm/amd/display: Lock all enabled otg pipes even with no
 planes

[WHY]
On DCN32 we support dynamic ODM even when OTG is blanked. When ODM
configuration is dynamically changed and the OTG is on blank pattern,
we will need to reprogram OPP's test pattern based on new ODM
configuration. Therefore we need to lock the OTG pipe to avoid temporary
corruption when we are reprogramming OPP blank patterns.

[HOW]
Add a new interdependent update lock implementation to lock all enabled
OTG pipes even when there is no plane on the OTG for DCN32.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 23 +++++++++++++++++++
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.h   |  2 ++
 .../amd/display/dc/hwss/dcn32/dcn32_init.c    |  2 +-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index b890db0bfc46b..c0b526cf17865 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -1785,3 +1785,26 @@ void dcn32_prepare_bandwidth(struct dc *dc,
 		context->bw_ctx.bw.dcn.clk.p_state_change_support = p_state_change_support;
 	}
 }
+
+void dcn32_interdependent_update_lock(struct dc *dc,
+		struct dc_state *context, bool lock)
+{
+	unsigned int i;
+	struct pipe_ctx *pipe;
+	struct timing_generator *tg;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+		tg = pipe->stream_res.tg;
+
+		if (!resource_is_pipe_type(pipe, OTG_MASTER) ||
+				!tg->funcs->is_tg_enabled(tg) ||
+				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM)
+			continue;
+
+		if (lock)
+			dc->hwss.pipe_control_lock(dc, pipe, true);
+		else
+			dc->hwss.pipe_control_lock(dc, pipe, false);
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h
index 069e20bc87c0a..f55c11fc56ec7 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h
@@ -129,4 +129,6 @@ bool dcn32_is_pipe_topology_transition_seamless(struct dc *dc,
 void dcn32_prepare_bandwidth(struct dc *dc,
 	struct dc_state *context);
 
+void dcn32_interdependent_update_lock(struct dc *dc,
+		struct dc_state *context, bool lock);
 #endif /* __DC_HWSS_DCN32_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c
index 2b073123d3ede..67d661dbd5b7c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c
@@ -58,7 +58,7 @@ static const struct hw_sequencer_funcs dcn32_funcs = {
 	.disable_plane = dcn20_disable_plane,
 	.disable_pixel_data = dcn20_disable_pixel_data,
 	.pipe_control_lock = dcn20_pipe_control_lock,
-	.interdependent_update_lock = dcn10_lock_all_pipes,
+	.interdependent_update_lock = dcn32_interdependent_update_lock,
 	.cursor_lock = dcn10_cursor_lock,
 	.prepare_bandwidth = dcn32_prepare_bandwidth,
 	.optimize_bandwidth = dcn20_optimize_bandwidth,
-- 
2.43.0




