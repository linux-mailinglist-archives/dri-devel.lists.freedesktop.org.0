Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B44FC9B2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE39A10FABD;
	Tue, 12 Apr 2022 00:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA96010FABE;
 Tue, 12 Apr 2022 00:46:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB903B819C7;
 Tue, 12 Apr 2022 00:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BCBC385B7;
 Tue, 12 Apr 2022 00:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724372;
 bh=LU1XvV/Sb51XBZs+EBx4/KXUgwEjV5nkor5bVay2cyM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WmRbtbRxCZjSn0uEmwQ2nf9OrMQdGOHKX653hA3yPqZFyA7gBD6NEumkGglNPYCkM
 i8VDBrUDNdEYgXiU4Eko7OprG4qAOPyyRBFprQPw4rNQOom9v4EIzLukLbY6cghoJH
 CO9ODirr0wgsgSJKidHfxYvSFwEI13u2JuxObhSHYP0ui4EHSCvWLDO3CQ4px1y6B9
 1R0dDtChcfFy0OpQVUkgF9y3/uK96fqGLIk2CHEhtoRXuNMg1/GD2dSNyzXqZz+ysO
 S9H/K5V9UVXIs3OwhTbUqpzb3I3gZX9Reb9KrzHh2WSYFWRkfWfyZaY8jbqH5oBW0d
 +7TY5zq27omBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 36/49] drm/amd/display: Enable power gating
 before init_pipes
Date: Mon, 11 Apr 2022 20:43:54 -0400
Message-Id: <20220412004411.349427-36-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004411.349427-1-sashal@kernel.org>
References: <20220412004411.349427-1-sashal@kernel.org>
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
Cc: Anson.Jacob@amd.com, haonan.wang2@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Yi-Ling.Chen2@amd.com, wyatt.wood@amd.com,
 Jun.Lei@amd.com, Anthony Koo <Anthony.Koo@amd.com>, hanghong.ma@amd.com,
 Sasha Levin <sashal@kernel.org>, Josip.Pavic@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, Jerry.Zuo@amd.com,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Martin.Leung@amd.com, paul.hsieh@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, Derek.Lai@amd.com, Eric Yang <Eric.Yang2@amd.com>,
 Wesley.Chalmers@amd.com, Xinhui.Pan@amd.com, Roman Li <Roman.Li@amd.com>,
 nicholas.kazlauskas@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 roy.chan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Li <Roman.Li@amd.com>

[ Upstream commit 58e16c752e9540b28a873c44c3bee83e022007c1 ]

[Why]
In init_hw() we call init_pipes() before enabling power gating.
init_pipes() tries to power gate dsc but it may fail because
required force-ons are not released yet.
As a result with dsc config the following errors observed on resume:
"REG_WAIT timeout 1us * 1000 tries - dcn20_dsc_pg_control"
"REG_WAIT timeout 1us * 1000 tries - dcn20_dpp_pg_control"
"REG_WAIT timeout 1us * 1000 tries - dcn20_hubp_pg_control"

[How]
Move enable_power_gating_plane() before init_pipes() in init_hw()

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Reviewed-by: Eric Yang <Eric.Yang2@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Roman Li <Roman.Li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 5 +++--
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c        | 5 +++--
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c        | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 530a72e3eefe..39d5ceb9a373 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -1508,6 +1508,9 @@ void dcn10_init_hw(struct dc *dc)
 	if (dc->config.power_down_display_on_boot)
 		dc_link_blank_all_dp_displays(dc);
 
+	if (hws->funcs.enable_power_gating_plane)
+		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
+
 	/* If taking control over from VBIOS, we may want to optimize our first
 	 * mode set, so we need to skip powering down pipes until we know which
 	 * pipes we want to use.
@@ -1560,8 +1563,6 @@ void dcn10_init_hw(struct dc *dc)
 
 		REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
 	}
-	if (hws->funcs.enable_power_gating_plane)
-		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
 
 	if (dc->clk_mgr->funcs->notify_wm_ranges)
 		dc->clk_mgr->funcs->notify_wm_ranges(dc->clk_mgr);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 1db1ca19411d..05dc0a3ae2a3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -548,6 +548,9 @@ void dcn30_init_hw(struct dc *dc)
 	if (dc->config.power_down_display_on_boot)
 		dc_link_blank_all_dp_displays(dc);
 
+	if (hws->funcs.enable_power_gating_plane)
+		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
+
 	/* If taking control over from VBIOS, we may want to optimize our first
 	 * mode set, so we need to skip powering down pipes until we know which
 	 * pipes we want to use.
@@ -625,8 +628,6 @@ void dcn30_init_hw(struct dc *dc)
 
 		REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
 	}
-	if (hws->funcs.enable_power_gating_plane)
-		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
 
 	if (!dcb->funcs->is_accelerated_mode(dcb) && dc->res_pool->hubbub->funcs->init_watermarks)
 		dc->res_pool->hubbub->funcs->init_watermarks(dc->res_pool->hubbub);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
index 4206ce5bf9a9..1d2682104670 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
@@ -200,6 +200,9 @@ void dcn31_init_hw(struct dc *dc)
 	if (dc->config.power_down_display_on_boot)
 		dc_link_blank_all_dp_displays(dc);
 
+	if (hws->funcs.enable_power_gating_plane)
+		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
+
 	/* If taking control over from VBIOS, we may want to optimize our first
 	 * mode set, so we need to skip powering down pipes until we know which
 	 * pipes we want to use.
@@ -249,8 +252,6 @@ void dcn31_init_hw(struct dc *dc)
 
 		REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
 	}
-	if (hws->funcs.enable_power_gating_plane)
-		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
 
 	if (!dcb->funcs->is_accelerated_mode(dcb) && dc->res_pool->hubbub->funcs->init_watermarks)
 		dc->res_pool->hubbub->funcs->init_watermarks(dc->res_pool->hubbub);
-- 
2.35.1

