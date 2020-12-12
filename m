Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753D2D8784
	for <lists+dri-devel@lfdr.de>; Sat, 12 Dec 2020 17:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD7D6ED06;
	Sat, 12 Dec 2020 16:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD97D6ED06
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 16:08:45 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 12/14] drm/amd/display: Init clock value by
 current vbios CLKs
Date: Sat, 12 Dec 2020 11:08:29 -0500
Message-Id: <20201212160831.2335172-12-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201212160831.2335172-1-sashal@kernel.org>
References: <20201212160831.2335172-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 Brandon Syu <Brandon.Syu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brandon Syu <Brandon.Syu@amd.com>

[ Upstream commit 7e0b367db85ef7b91399006253759a024eab7653 ]

[Why]
While booting into OS, driver updates DPP/DISP CLKs.
But init clock value is zero which is invalid.

[How]
Get current clocks value to update init clocks.
To avoid underflow.

Signed-off-by: Brandon Syu <Brandon.Syu@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index dd92f9c295b45..9f301f8575a54 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -97,8 +97,17 @@ void rn_update_clocks(struct clk_mgr *clk_mgr_base,
 			new_clocks->dppclk_khz = 100000;
 	}
 
-	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
-		if (clk_mgr->base.clks.dppclk_khz > new_clocks->dppclk_khz)
+	/*
+	 * Temporally ignore thew 0 cases for disp and dpp clks.
+	 * We may have a new feature that requires 0 clks in the future.
+	 */
+	if (new_clocks->dppclk_khz == 0 || new_clocks->dispclk_khz == 0) {
+		new_clocks->dppclk_khz = clk_mgr_base->clks.dppclk_khz;
+		new_clocks->dispclk_khz = clk_mgr_base->clks.dispclk_khz;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr_base->clks.dppclk_khz)) {
+		if (clk_mgr_base->clks.dppclk_khz > new_clocks->dppclk_khz)
 			dpp_clock_lowered = true;
 		clk_mgr_base->clks.dppclk_khz = new_clocks->dppclk_khz;
 		update_dppclk = true;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
