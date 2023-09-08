Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F90E798FC4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14F910E92C;
	Fri,  8 Sep 2023 19:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFAC10E933;
 Fri,  8 Sep 2023 19:34:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8298FB821E4;
 Fri,  8 Sep 2023 19:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA42C43395;
 Fri,  8 Sep 2023 19:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201677;
 bh=oydeY7LMES6UGzJ49BFWh3Ok2ahwHYWzx3M2c5QljD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pEnjrothwlkwp1dHOAzwEHuzQln1tG8XGUVqI3mleC0+oaaiGV951gb8o4GkwK/KH
 zXYDf+J/9KIcHIQN33GmdcojT2Ky+22XvDBh/cAm+YDRRedJrVWYaGx8jgjYEAVfz5
 yHiUAYYDWjhM9aADJhqeXh7u7RD6VuszsgxwE7zTba/yM2c/LVqkYt7xTmt4tR4T03
 hW2DXW3iguXNZDJ3tVhAAVXj12IJFFWFQqWX1hPaqKtSqMlAZcB//AlG3HJEXc5MmM
 4a3q6DA86UxGwAccbDP0c1CJmr3SCbKBqIGZbni9+MWLZ1eYeDDO19Br94CXi2AgDH
 aZ0r3X1wEu8/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 08/22] drm/amd/display: Read down-spread
 percentage from lut to adjust dprefclk.
Date: Fri,  8 Sep 2023 15:33:52 -0400
Message-Id: <20230908193407.3463368-8-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193407.3463368-1-sashal@kernel.org>
References: <20230908193407.3463368-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
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
Cc: dri-devel@lists.freedesktop.org, meenakshikumar.somasundaram@amd.com,
 Jun.Lei@amd.com, Sasha Levin <sashal@kernel.org>, sancchen@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 Martin Tsai <martin.tsai@amd.com>, Alex Hung <alex.hung@amd.com>,
 duncan.ma@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 Daniel.Miess@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, wayne.lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Tsai <martin.tsai@amd.com>

[ Upstream commit 6917b0b711713b9d84d7e0844e9aa613997a51b2 ]

[Why]
Panels show corruption with high refresh rate timings when
ss is enabled.

[How]
Read down-spread percentage from lut to adjust dprefclk.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Martin Tsai <martin.tsai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/clk_mgr/dcn314/dcn314_clk_mgr.c        | 33 +++++++++++++++++--
 .../dc/clk_mgr/dcn314/dcn314_clk_mgr.h        |  7 ++++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
index e43b4d7dc60e2..0316fd8df3841 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
@@ -87,6 +87,14 @@ static const struct IP_BASE CLK_BASE = { { { { 0x00016C00, 0x02401800, 0, 0, 0,
 #define CLK1_CLK_PLL_REQ__PllSpineDiv_MASK	0x0000F000L
 #define CLK1_CLK_PLL_REQ__FbMult_frac_MASK	0xFFFF0000L
 
+#define regCLK1_CLK2_BYPASS_CNTL			0x029c
+#define regCLK1_CLK2_BYPASS_CNTL_BASE_IDX	0
+
+#define CLK1_CLK2_BYPASS_CNTL__CLK2_BYPASS_SEL__SHIFT	0x0
+#define CLK1_CLK2_BYPASS_CNTL__LK2_BYPASS_DIV__SHIFT	0x10
+#define CLK1_CLK2_BYPASS_CNTL__CLK2_BYPASS_SEL_MASK		0x00000007L
+#define CLK1_CLK2_BYPASS_CNTL__LK2_BYPASS_DIV_MASK		0x000F0000L
+
 #define REG(reg_name) \
 	(CLK_BASE.instance[0].segment[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
 
@@ -440,6 +448,11 @@ static DpmClocks314_t dummy_clocks;
 
 static struct dcn314_watermarks dummy_wms = { 0 };
 
+static struct dcn314_ss_info_table ss_info_table = {
+	.ss_divider = 1000,
+	.ss_percentage = {0, 0, 375, 375, 375}
+};
+
 static void dcn314_build_watermark_ranges(struct clk_bw_params *bw_params, struct dcn314_watermarks *table)
 {
 	int i, num_valid_sets;
@@ -719,6 +732,20 @@ static struct clk_mgr_funcs dcn314_funcs = {
 };
 extern struct clk_mgr_funcs dcn3_fpga_funcs;
 
+static void dcn314_read_ss_info_from_lut(struct clk_mgr_internal *clk_mgr)
+{
+	uint32_t clock_source;
+
+	REG_GET(CLK1_CLK2_BYPASS_CNTL, CLK2_BYPASS_SEL, &clock_source);
+
+	clk_mgr->dprefclk_ss_percentage = ss_info_table.ss_percentage[clock_source];
+
+	if (clk_mgr->dprefclk_ss_percentage != 0) {
+		clk_mgr->ss_on_dprefclk = true;
+		clk_mgr->dprefclk_ss_divider = ss_info_table.ss_divider;
+	}
+}
+
 void dcn314_clk_mgr_construct(
 		struct dc_context *ctx,
 		struct clk_mgr_dcn314 *clk_mgr,
@@ -791,9 +818,11 @@ void dcn314_clk_mgr_construct(
 
 	clk_mgr->base.base.dprefclk_khz = 600000;
 	clk_mgr->base.base.clks.ref_dtbclk_khz = 600000;
-	dce_clock_read_ss_info(&clk_mgr->base);
+
+	dcn314_read_ss_info_from_lut(&clk_mgr->base);
 	/*if bios enabled SS, driver needs to adjust dtb clock, only enable with correct bios*/
-	//clk_mgr->base.dccg->ref_dtbclk_khz = dce_adjust_dp_ref_freq_for_ss(clk_mgr_internal, clk_mgr->base.base.dprefclk_khz);
+	clk_mgr->base.base.dprefclk_khz =
+		dce_adjust_dp_ref_freq_for_ss(&clk_mgr->base, clk_mgr->base.base.dprefclk_khz);
 
 	clk_mgr->base.base.bw_params = &dcn314_bw_params;
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h
index 171f84340eb2f..e0670dafe2600 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h
@@ -28,6 +28,8 @@
 #define __DCN314_CLK_MGR_H__
 #include "clk_mgr_internal.h"
 
+#define NUM_CLOCK_SOURCES   5
+
 struct dcn314_watermarks;
 
 struct dcn314_smu_watermark_set {
@@ -40,6 +42,11 @@ struct clk_mgr_dcn314 {
 	struct dcn314_smu_watermark_set smu_wm_set;
 };
 
+struct dcn314_ss_info_table {
+	uint32_t ss_divider;
+	uint32_t ss_percentage[NUM_CLOCK_SOURCES];
+};
+
 bool dcn314_are_clock_states_equal(struct dc_clocks *a,
 		struct dc_clocks *b);
 
-- 
2.40.1

