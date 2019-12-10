Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C29AB119359
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E668689EB8;
	Tue, 10 Dec 2019 21:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A1C89EB8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:10:10 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDEC3246AC;
 Tue, 10 Dec 2019 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012210;
 bh=zOQHlGxGlD22dSvYMFWP0Utebo3AOdsp8NUI2OFX6hE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sXDrGBeqthkGBjlGUh69UlxOW0lFWJhMpVyVOosAagD3JsbB82cEfOCv2WG6m/zIv
 5ancxEiEW0g4ThZvGrukmv8QBBKKjFFi6J+Rqa3LrWn1hnTpliR7+6Eif5nuDUldkL
 HBVvfWxSy1BcQa4WXYHVGnAxrNpERda8hQtpuPwM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 162/350] drm/amd/display: correctly populate dpp
 refclk in fpga
Date: Tue, 10 Dec 2019 16:04:27 -0500
Message-Id: <20191210210735.9077-123-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anthony Koo <Anthony.Koo@amd.com>

[ Upstream commit 952f6c4b5d72d40f93f3deb61239290b357d434e ]

[Why]
In diags environment we are not programming the DPP DTO
correctly.

[How]
Populate the dpp refclk in dccg so it can be used to correctly
program DPP DTO.

Signed-off-by: Anthony Koo <Anthony.Koo@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
index 3e8ac303bd526..23ec283eb07b6 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
@@ -320,6 +320,8 @@ void dcn2_update_clocks_fpga(struct clk_mgr *clk_mgr,
 		struct dc_state *context,
 		bool safe_to_lower)
 {
+	struct clk_mgr_internal *clk_mgr_int = TO_CLK_MGR_INTERNAL(clk_mgr);
+
 	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
 	/* Min fclk = 1.2GHz since all the extra scemi logic seems to run off of it */
 	int fclk_adj = new_clocks->fclk_khz > 1200000 ? new_clocks->fclk_khz : 1200000;
@@ -357,14 +359,18 @@ void dcn2_update_clocks_fpga(struct clk_mgr *clk_mgr,
 		clk_mgr->clks.dispclk_khz = new_clocks->dispclk_khz;
 	}
 
-	/* Both fclk and dppclk ref are run on the same scemi clock so we
-	 * need to keep the same value for both
+	/* Both fclk and ref_dppclk run on the same scemi clock.
+	 * So take the higher value since the DPP DTO is typically programmed
+	 * such that max dppclk is 1:1 with ref_dppclk.
 	 */
 	if (clk_mgr->clks.fclk_khz > clk_mgr->clks.dppclk_khz)
 		clk_mgr->clks.dppclk_khz = clk_mgr->clks.fclk_khz;
 	if (clk_mgr->clks.dppclk_khz > clk_mgr->clks.fclk_khz)
 		clk_mgr->clks.fclk_khz = clk_mgr->clks.dppclk_khz;
 
+	// Both fclk and ref_dppclk run on the same scemi clock.
+	clk_mgr_int->dccg->ref_dppclk = clk_mgr->clks.fclk_khz;
+
 	dm_set_dcn_clocks(clk_mgr->ctx, &clk_mgr->clks);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
