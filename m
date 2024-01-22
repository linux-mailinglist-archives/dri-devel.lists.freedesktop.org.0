Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E68365FA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F43910F264;
	Mon, 22 Jan 2024 14:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F85710F264;
 Mon, 22 Jan 2024 14:57:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF987614FD;
 Mon, 22 Jan 2024 14:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A49C433F1;
 Mon, 22 Jan 2024 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935441;
 bh=f9Sk/+C5kcX0il63I5n35DiRElG5AdEB1o+Ds2m2Xc8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AuMZnMNCnOyqXSECFryi+JKq66wrIcKIVdf0qtKgGgiBXe5gY+nFIPVOC1Op4C6ip
 I11waZXZE6yC4Wtsjr3obY5bx36n8Xb5ljQjVwjJZoDBZHnDe+Xf5x8HXPipVgd0X3
 eYdZwt1rTZ/R3G0rnHeuQhykDdTVydk0KAdaGVsdM3iBf+t0ZSMJI7QqXnxbrGCZEp
 r+saZLuhOKPHhjXtgQsTwkHGQEDI5Adkw+a3betZHQsUQB7JfEVQ5VKje+zxcPSjFx
 jhHh76XaE8id0a8CA92KGNn855OA48IZUOizoZ8UbhoQ0CHqTRLzKLe2QnLvUDsYW9
 blO4tbXg1Iq2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 19/88] drm/amd/display: Fix disable_otg_wa logic
Date: Mon, 22 Jan 2024 09:50:52 -0500
Message-ID: <20240122145608.990137-19-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, charlene.liu@amd.com,
 dri-devel@lists.freedesktop.org, Nicholas Susanto <nicholas.susanto@amd.com>,
 sunpeng.li@amd.com, airlied@gmail.com, sungkim@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 yang.lee@linux.alibaba.com, hamza.mahfooz@amd.com, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, ovidiu.bunea@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Susanto <nicholas.susanto@amd.com>

[ Upstream commit 2ce156482a6fef349d2eba98e5070c412d3af662 ]

[Why]
When switching to another HDMI mode, we are unnecesarilly
disabling/enabling FIFO causing both HPO and DIG registers to be set at
the same time when only HPO is supposed to be set.

This can lead to a system hang the next time we change refresh rates as
there are cases when we don't disable OTG/FIFO but FIFO is enabled when
it isn't supposed to be.

[How]
Removing the enable/disable FIFO entirely.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Nicholas Susanto <nicholas.susanto@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index d5fde7d23fbf..f3b0af2c0295 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -126,21 +126,13 @@ static void dcn35_disable_otg_wa(struct clk_mgr *clk_mgr_base, struct dc_state *
 			continue;
 		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal) ||
 				     !pipe->stream->link_enc)) {
-			struct stream_encoder *stream_enc = pipe->stream_res.stream_enc;
-
 			if (disable) {
-				if (stream_enc && stream_enc->funcs->disable_fifo)
-					pipe->stream_res.stream_enc->funcs->disable_fifo(stream_enc);
-
 				if (pipe->stream_res.tg && pipe->stream_res.tg->funcs->immediate_disable_crtc)
 					pipe->stream_res.tg->funcs->immediate_disable_crtc(pipe->stream_res.tg);
 
 				reset_sync_context_for_pipe(dc, context, i);
 			} else {
 				pipe->stream_res.tg->funcs->enable_crtc(pipe->stream_res.tg);
-
-				if (stream_enc && stream_enc->funcs->enable_fifo)
-					pipe->stream_res.stream_enc->funcs->enable_fifo(stream_enc);
 			}
 		}
 	}
-- 
2.43.0

