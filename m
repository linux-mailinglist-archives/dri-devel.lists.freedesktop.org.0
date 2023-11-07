Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33647E3CC3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE8A10E52C;
	Tue,  7 Nov 2023 12:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5405610E52B;
 Tue,  7 Nov 2023 12:20:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9D7B561005;
 Tue,  7 Nov 2023 12:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFFEC433CA;
 Tue,  7 Nov 2023 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359603;
 bh=HmF/NtGtcaMzGvsDQwwWM5jQd/meU9ykl9wxiteJxos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X+XDinIgXAKs2Ks7GbCH2OtjUp5qxpa2jYZU2T3JxjJG1/N/ntG4735moT9s5uPPp
 54y3bW4Md/1vYx6jubWq02g+2dCJvLx4MWIiAaiUvB/YFrfZ6lGBqE/xitj1kOBmnp
 uNEcH6nF2UPhcdjmyGNAt2ooTyz6sUsZfrgOCNTxGgpn6tXnFC+H0aCrj97NNyk1LU
 2BgUpcPn0ozbebYhJeC3lMhXPjaf742hKr8GFhEVc8a0E6MVuXUepHCV9W85apiyC4
 ZEX9y/UQpnNJqNuYkW4Ahl8wB71JxJhOjr/HtzmydpKy+ktbTbp3o0BWQACRs9SFro
 ydb3wq93WQ+uQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 13/40] drm/amd/display: use full update for clip
 size increase of large plane source
Date: Tue,  7 Nov 2023 07:16:15 -0500
Message-ID: <20231107121837.3759358-13-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107121837.3759358-1-sashal@kernel.org>
References: <20231107121837.3759358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
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
 dri-devel@lists.freedesktop.org, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com, Wenjing Liu <wenjing.liu@amd.com>,
 samson.tam@amd.com, chiawen.huang@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, alvin.lee2@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <jun.lei@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[ Upstream commit 05b78277ef0efc1deebc8a22384fffec29a3676e ]

[why]
Clip size increase will increase viewport, which could cause us to
switch  to MPC combine.
If we skip full update, we are not able to change to MPC combine in
fast update. This will cause corruption showing on the video plane.

[how]
treat clip size increase of a surface larger than 5k as a full update.

Reviewed-by: Jun Lei <jun.lei@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 12 ++++++++++--
 drivers/gpu/drm/amd/display/dc/dc.h      |  5 +++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 14c3c1907b953..38abbd0c9d997 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -990,7 +990,8 @@ static bool dc_construct(struct dc *dc,
 	/* set i2c speed if not done by the respective dcnxxx__resource.c */
 	if (dc->caps.i2c_speed_in_khz_hdcp == 0)
 		dc->caps.i2c_speed_in_khz_hdcp = dc->caps.i2c_speed_in_khz;
-
+	if (dc->caps.max_optimizable_video_width == 0)
+		dc->caps.max_optimizable_video_width = 5120;
 	dc->clk_mgr = dc_clk_mgr_create(dc->ctx, dc->res_pool->pp_smu, dc->res_pool->dccg);
 	if (!dc->clk_mgr)
 		goto fail;
@@ -2442,6 +2443,7 @@ static enum surface_update_type get_plane_info_update_type(const struct dc_surfa
 }
 
 static enum surface_update_type get_scaling_info_update_type(
+		const struct dc *dc,
 		const struct dc_surface_update *u)
 {
 	union surface_update_flags *update_flags = &u->surface->update_flags;
@@ -2474,6 +2476,12 @@ static enum surface_update_type get_scaling_info_update_type(
 			update_flags->bits.clock_change = 1;
 	}
 
+	if (u->scaling_info->src_rect.width > dc->caps.max_optimizable_video_width &&
+		(u->scaling_info->clip_rect.width > u->surface->clip_rect.width ||
+		 u->scaling_info->clip_rect.height > u->surface->clip_rect.height))
+		 /* Changing clip size of a large surface may result in MPC slice count change */
+		update_flags->bits.bandwidth_change = 1;
+
 	if (u->scaling_info->src_rect.x != u->surface->src_rect.x
 			|| u->scaling_info->src_rect.y != u->surface->src_rect.y
 			|| u->scaling_info->clip_rect.x != u->surface->clip_rect.x
@@ -2511,7 +2519,7 @@ static enum surface_update_type det_surface_update(const struct dc *dc,
 	type = get_plane_info_update_type(u);
 	elevate_update_type(&overall_type, type);
 
-	type = get_scaling_info_update_type(u);
+	type = get_scaling_info_update_type(dc, u);
 	elevate_update_type(&overall_type, type);
 
 	if (u->flip_addr) {
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 31e3183497a7f..c05e91b257ace 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -231,6 +231,11 @@ struct dc_caps {
 	uint32_t dmdata_alloc_size;
 	unsigned int max_cursor_size;
 	unsigned int max_video_width;
+	/*
+	 * max video plane width that can be safely assumed to be always
+	 * supported by single DPP pipe.
+	 */
+	unsigned int max_optimizable_video_width;
 	unsigned int min_horizontal_blanking_period;
 	int linear_pitch_alignment;
 	bool dcc_const_color;
-- 
2.42.0

