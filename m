Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73C2AAA264
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E20710E5A6;
	Mon,  5 May 2025 22:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c4eGLx0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B4B10E5A6;
 Mon,  5 May 2025 22:59:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 479D7629CA;
 Mon,  5 May 2025 22:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7117C4CEE4;
 Mon,  5 May 2025 22:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485972;
 bh=sggkn5Buws6iQxZ0z5gA8d/UmGBYOyuOaEJ/3vTAaBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c4eGLx0zUEZJqpsqlUH/hPm9GBaYAq7xOW4pAhjGwDQZWkUONoieiA4aoYDSYIAIm
 6/XD+xnnRlCBjcnxJxU7N9/JJ7Mzl5fHRhEdxBBoFZYhx+pdG/wP/tHfH2h+qPl2eK
 J9sNE/KHeKYVLJzHH/VYQIq3sBskyL4+A+HGzOIvOcokJrNcsjSEI/+2eszUU5Glzj
 23XfDIB5POCDJCzbnnTD0yWJQlJ4u4h93cSr+c70ui5JXlY7UYGmDwCUnLl/KiV9km
 Lz4+j8keZNJknJUdyGrf8Asoray+AxWIDV+UTcaK+xbzHQa43fFhxlxuiUHA9t6SUh
 Jc49okJTWEqCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charlene Liu <Charlene.Liu@amd.com>, Ovidiu Bunea <ovidiu.bunea@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, chris.park@amd.com,
 Jing.Zhou@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 093/294] drm/amd/display: remove minimum Dispclk
 and apply oem panel timing.
Date: Mon,  5 May 2025 18:53:13 -0400
Message-Id: <20250505225634.2688578-93-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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

From: Charlene Liu <Charlene.Liu@amd.com>

[ Upstream commit 756e58e83e89d372b94269c0cde61fe55da76947 ]

[why & how]
1. apply oem panel timing (not only on OLED)
2. remove MIN_DPP_DISP_CLK request in driver.

This fix will apply for dcn31x but not
sync with DML's output.

Reviewed-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 2 --
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c | 2 --
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c    | 3 ++-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index ebeb969ee180b..327776eeb9f3e 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -194,8 +194,6 @@ static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
 	// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
 	if (new_clocks->dppclk_khz < MIN_DPP_DISP_CLK)
 		new_clocks->dppclk_khz = MIN_DPP_DISP_CLK;
-	if (new_clocks->dispclk_khz < MIN_DPP_DISP_CLK)
-		new_clocks->dispclk_khz = MIN_DPP_DISP_CLK;
 
 	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
 		if (clk_mgr->base.clks.dppclk_khz > new_clocks->dppclk_khz)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
index 6f1785715dfb7..f95e5e767eb1a 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
@@ -201,8 +201,6 @@ static void dcn316_update_clocks(struct clk_mgr *clk_mgr_base,
 	// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
 	if (new_clocks->dppclk_khz < 100000)
 		new_clocks->dppclk_khz = 100000;
-	if (new_clocks->dispclk_khz < 100000)
-		new_clocks->dispclk_khz = 100000;
 
 	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
 		if (clk_mgr->base.clks.dppclk_khz > new_clocks->dppclk_khz)
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 7b5c1498941dd..d389eeb264a79 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1066,7 +1066,8 @@ void dce110_edp_backlight_control(
 			DC_LOG_DC("edp_receiver_ready_T9 skipped\n");
 	}
 
-	if (!enable && link->dpcd_sink_ext_caps.bits.oled) {
+	if (!enable) {
+		/*follow oem panel config's requirement*/
 		pre_T11_delay += link->panel_config.pps.extra_pre_t11_ms;
 		msleep(pre_T11_delay);
 	}
-- 
2.39.5

