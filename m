Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C312B0AFC6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 14:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3261310E00E;
	Sat, 19 Jul 2025 12:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 548 seconds by postgrey-1.36 at gabe;
 Sat, 19 Jul 2025 12:20:38 UTC
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D650F10E00E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 12:20:38 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 8D0941C07C4;
 Sat, 19 Jul 2025 14:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdf7:4000:ceae:3606:9020:cd4f])
 by srv01.abscue.de (Postfix) with ESMTPSA id ED5A11C0740;
 Sat, 19 Jul 2025 14:11:31 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sat, 19 Jul 2025 14:09:43 +0200
Subject: [PATCH 07/12] drm: sprd: fix DSI rate and PLL setup code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-ums9230-drm-v1-7-e4344a05eb3d@abscue.de>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
In-Reply-To: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.2
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

Correct the initialization code to treat the hs_rate and lp_rate values
as hertz instead of kilohertz. While at it, fix a bit operation bug in
the PLL initialization code which caused a PLL register to be set to
zero instead of the desired value.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/sprd/megacores_pll.c | 7 +++----
 drivers/gpu/drm/sprd/sprd_dsi.c      | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sprd/megacores_pll.c
index e5a18599678ab6e3771cd732dcca409ab2d59f72..f214f906b58fb006c4305de9b8b86b4a934f2074 100644
--- a/drivers/gpu/drm/sprd/megacores_pll.c
+++ b/drivers/gpu/drm/sprd/megacores_pll.c
@@ -23,13 +23,12 @@
 
 static int dphy_calc_pll_param(struct dphy_pll *pll)
 {
-	const u32 khz = 1000;
 	const u32 mhz = 1000000;
 	const unsigned long long factor = 100;
 	unsigned long long tmp;
 	int i;
 
-	pll->potential_fvco = pll->freq / khz;
+	pll->potential_fvco = pll->freq / mhz;
 
 	for (i = 0; i < 4; ++i) {
 		if (pll->potential_fvco >= pll->platform->band_low &&
@@ -89,7 +88,7 @@ static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *regmap)
 	reg_val[3] = pll->vco_band | (pll->sdm_en << 1) | (pll->refin << 2);
 	reg_val[4] = pll->kint >> 12;
 	reg_val[5] = pll->kint >> 4;
-	reg_val[6] = pll->out_sel | ((pll->kint << 4) & 0xf);
+	reg_val[6] = pll->out_sel | ((pll->kint & 0xf) << 4);
 	reg_val[7] = 1 << 4;
 	reg_val[8] = pll->det_delay;
 
@@ -218,7 +217,7 @@ void dphy_timing_config(struct dsi_context *ctx)
 	u32 tmp = 0;
 
 	/* t_ui: 1 ui, byteck: 8 ui, half byteck: 4 ui */
-	t_ui = 1000 * scale / (pll->freq / 1000);
+	t_ui = 1000 * scale / (pll->freq / 1000000);
 	t_byteck = t_ui << 3;
 	t_half_byteck = t_ui << 2;
 	constant = t_ui << 1;
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index db5f9bcbb2500096402b9d44b9cc4428070e69ba..e01d1d28fe579644ec2e0c83ec9170269932adfe 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -391,7 +391,7 @@ static u32 fmt_to_coding(u32 fmt)
 static void sprd_dsi_init(struct dsi_context *ctx)
 {
 	struct sprd_dsi *dsi = container_of(ctx, struct sprd_dsi, ctx);
-	u32 byte_clk = dsi->slave->hs_rate / 8;
+	u32 byte_clk = dsi->slave->hs_rate / 8000;
 	u16 data_hs2lp, data_lp2hs, clk_hs2lp, clk_lp2hs;
 	u16 max_rd_time;
 	int div;
@@ -408,7 +408,7 @@ static void sprd_dsi_init(struct dsi_context *ctx)
 	dsi_reg_up(ctx, VIRTUAL_CHANNEL_ID, VIDEO_PKT_VCID, 0);
 	dsi_reg_up(ctx, VIRTUAL_CHANNEL_ID, GEN_RX_VCID, 0);
 
-	div = DIV_ROUND_UP(byte_clk, dsi->slave->lp_rate);
+	div = DIV_ROUND_UP(byte_clk, dsi->slave->lp_rate / 1000);
 	writel(div, ctx->base + TX_ESC_CLK_CONFIG);
 
 	max_rd_time = ns_to_cycle(ctx->max_rd_time, byte_clk);
@@ -450,7 +450,6 @@ static int sprd_dsi_dpi_video(struct dsi_context *ctx)
 {
 	struct sprd_dsi *dsi = container_of(ctx, struct sprd_dsi, ctx);
 	struct videomode *vm = &ctx->vm;
-	u32 byte_clk = dsi->slave->hs_rate / 8;
 	u16 bpp_x100;
 	u16 video_size;
 	u32 ratio_x1000;
@@ -472,7 +471,7 @@ static int sprd_dsi_dpi_video(struct dsi_context *ctx)
 	video_size = round_video_size(coding, vm->hactive);
 	bpp_x100 = calc_bytes_per_pixel_x100(coding);
 	video_size_step = calc_video_size_step(coding);
-	ratio_x1000 = byte_clk * 1000 / (vm->pixelclock / 1000);
+	ratio_x1000 = dsi->slave->hs_rate / 8 / (vm->pixelclock / 1000);
 	hline = vm->hactive + vm->hsync_len + vm->hfront_porch +
 		vm->hback_porch;
 

-- 
2.50.0
