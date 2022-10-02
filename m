Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3875F2631
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 00:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E608910E153;
	Sun,  2 Oct 2022 22:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB9810E153;
 Sun,  2 Oct 2022 22:50:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9193C60F19;
 Sun,  2 Oct 2022 22:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9F2C433D6;
 Sun,  2 Oct 2022 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664751057;
 bh=a9bbk+n0W6zEVK5wtX4ovn8t+np19o3n6a3wg1jiUlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V7Cwj1gZZ2WgEcLo3u85hshXBWQRzfJOd3+2pSilJf3yWhNKu5VVbz4hAsycNIfcq
 o5/3IbV6f9/oi6IrAJV9OyRCkYSZZ6Z0bDGELOquqk9sLUPnkjh8SPI4pGKdF6hrZT
 SUSL2F3IEm4NyoMzt3puytgCRoDLUVp6APeGgNgvRGRcRrKUMzfvOy30qRicolKguR
 BsaPhoyf26w94NIAvCkr2QPrpcpj355JHQJNHLSPlUllKCNXbX+h7SBGCYK+T6O0Oq
 WPWAMaXThNWEWNqqRaJC7Bx1M4/h3KYBvAwG5wBTcTMDYOVMFiwDEhfd66sTMqOTyO
 YjkGI9JkX9d8A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 28/29] drm/amd/display: increase dcn315 pstate
 change latency
Date: Sun,  2 Oct 2022 18:49:21 -0400
Message-Id: <20221002224922.238837-28-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002224922.238837-1-sashal@kernel.org>
References: <20221002224922.238837-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, nikola.cornij@amd.com,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 paul.hsieh@amd.com, Jun Lei <Jun.Lei@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

[ Upstream commit dcc2527df918edfe297c5074ccc1f05eae361ca6 ]

[Why & How]
Update after new measurment came in

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/clk_mgr/dcn315/dcn315_clk_mgr.c        | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index f4381725b210..c3d7712e9fd0 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -46,6 +46,9 @@
 #define TO_CLK_MGR_DCN315(clk_mgr)\
 	container_of(clk_mgr, struct clk_mgr_dcn315, base)
 
+#define UNSUPPORTED_DCFCLK 10000000
+#define MIN_DPP_DISP_CLK     100000
+
 static int dcn315_get_active_display_cnt_wa(
 		struct dc *dc,
 		struct dc_state *context)
@@ -146,6 +149,9 @@ static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
 		}
 	}
 
+	/* Lock pstate by requesting unsupported dcfclk if change is unsupported */
+	if (!new_clocks->p_state_change_support)
+		new_clocks->dcfclk_khz = UNSUPPORTED_DCFCLK;
 	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
 		clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
 		dcn315_smu_set_hard_min_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_khz);
@@ -159,10 +165,10 @@ static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
 
 	// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
 	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
-		if (new_clocks->dppclk_khz < 100000)
-			new_clocks->dppclk_khz = 100000;
-		if (new_clocks->dispclk_khz < 100000)
-			new_clocks->dispclk_khz = 100000;
+		if (new_clocks->dppclk_khz < MIN_DPP_DISP_CLK)
+			new_clocks->dppclk_khz = MIN_DPP_DISP_CLK;
+		if (new_clocks->dispclk_khz < MIN_DPP_DISP_CLK)
+			new_clocks->dispclk_khz = MIN_DPP_DISP_CLK;
 	}
 
 	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
@@ -272,7 +278,7 @@ static struct wm_table ddr5_wm_table = {
 		{
 			.wm_inst = WM_A,
 			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 64.0,
+			.pstate_latency_us = 129.0,
 			.sr_exit_time_us = 11.5,
 			.sr_enter_plus_exit_time_us = 14.5,
 			.valid = true,
@@ -280,7 +286,7 @@ static struct wm_table ddr5_wm_table = {
 		{
 			.wm_inst = WM_B,
 			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 64.0,
+			.pstate_latency_us = 129.0,
 			.sr_exit_time_us = 11.5,
 			.sr_enter_plus_exit_time_us = 14.5,
 			.valid = true,
@@ -288,7 +294,7 @@ static struct wm_table ddr5_wm_table = {
 		{
 			.wm_inst = WM_C,
 			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 64.0,
+			.pstate_latency_us = 129.0,
 			.sr_exit_time_us = 11.5,
 			.sr_enter_plus_exit_time_us = 14.5,
 			.valid = true,
@@ -296,7 +302,7 @@ static struct wm_table ddr5_wm_table = {
 		{
 			.wm_inst = WM_D,
 			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 64.0,
+			.pstate_latency_us = 129.0,
 			.sr_exit_time_us = 11.5,
 			.sr_enter_plus_exit_time_us = 14.5,
 			.valid = true,
-- 
2.35.1

