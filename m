Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E995C2DE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 03:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7351010EBF8;
	Fri, 23 Aug 2024 01:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2310EBF8;
 Fri, 23 Aug 2024 01:35:24 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WqjL70g6SzyR2B;
 Fri, 23 Aug 2024 09:34:55 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 7A3E1180106;
 Fri, 23 Aug 2024 09:35:19 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 09:35:18 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicholas.kazlauskas@amd.com>, <Charlene.Liu@amd.com>,
 <chiahsuan.chung@amd.com>, <hamza.mahfooz@amd.com>, <sungjoon.kim@amd.com>,
 <roman.li@amd.com>, <syed.hassan@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v3] drm/amd/display: Remove unused dcn35_fpga_funcs and
 related functions
Date: Fri, 23 Aug 2024 09:42:50 +0800
Message-ID: <20240823014250.1578889-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

dcn35_fpga_funcs is not used anywhere, remove it.

And also remove related not used dcn35_init_clocks_fpga()
and dcn35_update_clocks_fpga().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Also remove related unused functions.
- Update the commit message.
v2:
- Remove it instead of making it static.
---
 .../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  | 83 -------------------
 1 file changed, 83 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index 0ce9b40dfc68..0899d8d84dc6 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -982,82 +982,6 @@ static bool dcn35_is_ips_supported(struct clk_mgr *clk_mgr_base)
 	return ips_supported;
 }
 
-static void dcn35_init_clocks_fpga(struct clk_mgr *clk_mgr)
-{
-	init_clk_states(clk_mgr);
-
-/* TODO: Implement the functions and remove the ifndef guard */
-}
-
-static void dcn35_update_clocks_fpga(struct clk_mgr *clk_mgr,
-		struct dc_state *context,
-		bool safe_to_lower)
-{
-	struct clk_mgr_internal *clk_mgr_int = TO_CLK_MGR_INTERNAL(clk_mgr);
-	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
-	int fclk_adj = new_clocks->fclk_khz;
-
-	/* TODO: remove this after correctly set by DML */
-	new_clocks->dcfclk_khz = 400000;
-	new_clocks->socclk_khz = 400000;
-
-	/* Min fclk = 1.2GHz since all the extra scemi logic seems to run off of it */
-	//int fclk_adj = new_clocks->fclk_khz > 1200000 ? new_clocks->fclk_khz : 1200000;
-	new_clocks->fclk_khz = 4320000;
-
-	if (should_set_clock(safe_to_lower, new_clocks->phyclk_khz, clk_mgr->clks.phyclk_khz)) {
-		clk_mgr->clks.phyclk_khz = new_clocks->phyclk_khz;
-	}
-
-	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr->clks.dcfclk_khz)) {
-		clk_mgr->clks.dcfclk_khz = new_clocks->dcfclk_khz;
-	}
-
-	if (should_set_clock(safe_to_lower,
-			new_clocks->dcfclk_deep_sleep_khz, clk_mgr->clks.dcfclk_deep_sleep_khz)) {
-		clk_mgr->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
-	}
-
-	if (should_set_clock(safe_to_lower, new_clocks->socclk_khz, clk_mgr->clks.socclk_khz)) {
-		clk_mgr->clks.socclk_khz = new_clocks->socclk_khz;
-	}
-
-	if (should_set_clock(safe_to_lower, new_clocks->dramclk_khz, clk_mgr->clks.dramclk_khz)) {
-		clk_mgr->clks.dramclk_khz = new_clocks->dramclk_khz;
-	}
-
-	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->clks.dppclk_khz)) {
-		clk_mgr->clks.dppclk_khz = new_clocks->dppclk_khz;
-	}
-
-	if (should_set_clock(safe_to_lower, fclk_adj, clk_mgr->clks.fclk_khz)) {
-		clk_mgr->clks.fclk_khz = fclk_adj;
-	}
-
-	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr->clks.dispclk_khz)) {
-		clk_mgr->clks.dispclk_khz = new_clocks->dispclk_khz;
-	}
-
-	/* Both fclk and ref_dppclk run on the same scemi clock.
-	 * So take the higher value since the DPP DTO is typically programmed
-	 * such that max dppclk is 1:1 with ref_dppclk.
-	 */
-	if (clk_mgr->clks.fclk_khz > clk_mgr->clks.dppclk_khz)
-		clk_mgr->clks.dppclk_khz = clk_mgr->clks.fclk_khz;
-	if (clk_mgr->clks.dppclk_khz > clk_mgr->clks.fclk_khz)
-		clk_mgr->clks.fclk_khz = clk_mgr->clks.dppclk_khz;
-
-	// Both fclk and ref_dppclk run on the same scemi clock.
-	clk_mgr_int->dccg->ref_dppclk = clk_mgr->clks.fclk_khz;
-
-	/* TODO: set dtbclk in correct place */
-	clk_mgr->clks.dtbclk_en = true;
-	dm_set_dcn_clocks(clk_mgr->ctx, &clk_mgr->clks);
-	dcn35_update_clocks_update_dpp_dto(clk_mgr_int, context, safe_to_lower);
-
-	dcn35_update_clocks_update_dtb_dto(clk_mgr_int, context, clk_mgr->clks.ref_dtbclk_khz);
-}
-
 static struct clk_mgr_funcs dcn35_funcs = {
 	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
 	.get_dtb_ref_clk_frequency = dcn31_get_dtb_ref_freq_khz,
@@ -1071,13 +995,6 @@ static struct clk_mgr_funcs dcn35_funcs = {
 	.is_ips_supported = dcn35_is_ips_supported,
 };
 
-struct clk_mgr_funcs dcn35_fpga_funcs = {
-	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
-	.update_clocks = dcn35_update_clocks_fpga,
-	.init_clocks = dcn35_init_clocks_fpga,
-	.get_dtb_ref_clk_frequency = dcn31_get_dtb_ref_freq_khz,
-};
-
 void dcn35_clk_mgr_construct(
 		struct dc_context *ctx,
 		struct clk_mgr_dcn35 *clk_mgr,
-- 
2.34.1

