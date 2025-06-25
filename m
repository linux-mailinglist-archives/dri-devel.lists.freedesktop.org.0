Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141EDAE8A6E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711A710E793;
	Wed, 25 Jun 2025 16:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TTc8qGLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BF810E790
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:46:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C9044437D;
 Wed, 25 Jun 2025 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750869985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yyKj3c5L5BuZvNV4ZLjrnBDkRs6hAEEv2OmhUgxrNYk=;
 b=TTc8qGLZbmH2lrJ7I4Ut4zddsfGTxXplvQf9BdenMFswH/fL8ptgwoRtI6J0OjI/6q9oLK
 KiSYsLh9BNAVDE9qf/qZ4fqNdu3va15R03Z7MmcMR/gUG0FNC05ON78ILiihN6doEHxEbu
 AC32Ql7/MFxOYm2v0MTd8TIgElntrtZSwj4rmi93A4jq7xI4mmFDI1B0QawXbQk9Jbnjhv
 ncad1319v6vtiPmveV+r4i8stissMCQU13Q2pcB39WinZIoxEVkVvuxhwKkIjCISbbjA5o
 4aJPDNQ5gFGFZYBLlDNbFAGqaQy2adMMdQI7GaqdTRb1YEcn/Yqu2EW0RhyOpg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:32 +0200
Subject: [PATCH 28/32] drm/sprd: convert to the .attach_new op
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-28-e36bc258a7c5@bootlin.com>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepvdehnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

This op does not pass any pointer to the DSI device, so the DSI host driver
cannot store it.

This driver uses the DSI device format parameters in various places outside
the .attach op, and currently it does so by storing a pointer to the struct
mipi_dsi_device. That's exactly what .attach_new aims at removing.

Store a copy of the format parameters instead of the struct mipi_dsi_device
pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/sprd/megacores_pll.c |  2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c      |  2 +-
 drivers/gpu/drm/sprd/sprd_dsi.c      | 28 ++++++++++++++--------------
 drivers/gpu/drm/sprd/sprd_dsi.h      |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sprd/megacores_pll.c
index 3091dfdc11e3b547a05a9edaa4047a1e367c1596..e2558b77f4d4100052327c370fc4ba9eb5f722f1 100644
--- a/drivers/gpu/drm/sprd/megacores_pll.c
+++ b/drivers/gpu/drm/sprd/megacores_pll.c
@@ -111,7 +111,7 @@ int dphy_pll_config(struct dsi_context *ctx)
 	struct dphy_pll *pll = &ctx->pll;
 	int ret;
 
-	pll->freq = dsi->slave->hs_rate;
+	pll->freq = dsi->bus_fmt.hs_rate;
 
 	/* FREQ = 26M * (NINT + KINT / 2^20) / out_sel */
 	ret = dphy_calc_pll_param(pll);
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index a3447622a33cd612e34be038e833222567bdcd2c..c1996fb72a52c7483dc68bfd5156ddfaa065aa57 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -626,7 +626,7 @@ static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
 				  crtc->state->encoder_mask) {
 		dsi = encoder_to_dsi(encoder);
 
-		if (dsi->slave->mode_flags & MIPI_DSI_MODE_VIDEO)
+		if (dsi->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO)
 			dpu->ctx.if_type = SPRD_DPU_IF_DPI;
 		else
 			dpu->ctx.if_type = SPRD_DPU_IF_EDPI;
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 23b0e1dc547a5023ee6ad7d5e1c49e2cec986bf0..2962836e34c0c6f6b2ed615f66d149af2aac48bd 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -389,7 +389,7 @@ static u32 fmt_to_coding(u32 fmt)
 static void sprd_dsi_init(struct dsi_context *ctx)
 {
 	struct sprd_dsi *dsi = container_of(ctx, struct sprd_dsi, ctx);
-	u32 byte_clk = dsi->slave->hs_rate / 8;
+	u32 byte_clk = dsi->bus_fmt.hs_rate / 8;
 	u16 data_hs2lp, data_lp2hs, clk_hs2lp, clk_lp2hs;
 	u16 max_rd_time;
 	int div;
@@ -406,7 +406,7 @@ static void sprd_dsi_init(struct dsi_context *ctx)
 	dsi_reg_up(ctx, VIRTUAL_CHANNEL_ID, VIDEO_PKT_VCID, 0);
 	dsi_reg_up(ctx, VIRTUAL_CHANNEL_ID, GEN_RX_VCID, 0);
 
-	div = DIV_ROUND_UP(byte_clk, dsi->slave->lp_rate);
+	div = DIV_ROUND_UP(byte_clk, dsi->bus_fmt.lp_rate);
 	writel(div, ctx->base + TX_ESC_CLK_CONFIG);
 
 	max_rd_time = ns_to_cycle(ctx->max_rd_time, byte_clk);
@@ -448,7 +448,7 @@ static int sprd_dsi_dpi_video(struct dsi_context *ctx)
 {
 	struct sprd_dsi *dsi = container_of(ctx, struct sprd_dsi, ctx);
 	struct videomode *vm = &ctx->vm;
-	u32 byte_clk = dsi->slave->hs_rate / 8;
+	u32 byte_clk = dsi->bus_fmt.hs_rate / 8;
 	u16 bpp_x100;
 	u16 video_size;
 	u32 ratio_x1000;
@@ -466,7 +466,7 @@ static int sprd_dsi_dpi_video(struct dsi_context *ctx)
 	u16 hline;
 	u16 byte_cycle;
 
-	coding = fmt_to_coding(dsi->slave->format);
+	coding = fmt_to_coding(dsi->bus_fmt.format);
 	video_size = round_video_size(coding, vm->hactive);
 	bpp_x100 = calc_bytes_per_pixel_x100(coding);
 	video_size_step = calc_video_size_step(coding);
@@ -517,7 +517,7 @@ static int sprd_dsi_dpi_video(struct dsi_context *ctx)
 
 		/* hline total bytes from the DPI interface */
 		total_bytes = (vm->hactive + vm->hfront_porch) *
-				ratio_x1000 / dsi->slave->lanes / 1000;
+				ratio_x1000 / dsi->bus_fmt.lanes / 1000;
 
 		/* check if the pixels actually fit on the DSI link */
 		if (total_bytes < bytes_per_chunk) {
@@ -588,7 +588,7 @@ static void sprd_dsi_edpi_video(struct dsi_context *ctx)
 	u32 max_fifo_len;
 	u8 coding;
 
-	coding = fmt_to_coding(dsi->slave->format);
+	coding = fmt_to_coding(dsi->bus_fmt.format);
 	bpp_x100 = calc_bytes_per_pixel_x100(coding);
 	max_fifo_len = word_length * fifo_depth * 100 / bpp_x100;
 
@@ -760,7 +760,7 @@ static int sprd_dphy_init(struct dsi_context *ctx)
 	dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_RESET_N, RF_PHY_RESET_N);
 	writel(0x1C, ctx->base + PHY_MIN_STOP_TIME);
 	dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_CLK_EN, RF_PHY_CLK_EN);
-	writel(dsi->slave->lanes - 1, ctx->base + PHY_LANE_NUM_CONFIG);
+	writel(dsi->bus_fmt.lanes - 1, ctx->base + PHY_LANE_NUM_CONFIG);
 
 	ret = dphy_wait_pll_locked(ctx);
 	if (ret) {
@@ -809,7 +809,7 @@ static void sprd_dsi_encoder_enable(struct drm_encoder *encoder)
 	sprd_dsi_set_work_mode(ctx, ctx->work_mode);
 	sprd_dsi_state_reset(ctx);
 
-	if (dsi->slave->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
+	if (dsi->bus_fmt.mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
 		dsi_reg_up(ctx, PHY_CLK_LANE_LP_CTRL, AUTO_CLKLANE_CTRL_EN,
 			   AUTO_CLKLANE_CTRL_EN);
 	} else {
@@ -965,21 +965,21 @@ static const struct component_ops dsi_component_ops = {
 };
 
 static int sprd_dsi_host_attach(struct mipi_dsi_host *host,
-				struct mipi_dsi_device *slave)
+				const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct sprd_dsi *dsi = host_to_dsi(host);
 	struct dsi_context *ctx = &dsi->ctx;
 
-	dsi->slave = slave;
+	dsi->bus_fmt = *bus_fmt;
 
-	if (slave->mode_flags & MIPI_DSI_MODE_VIDEO)
+	if (bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO)
 		ctx->work_mode = DSI_MODE_VIDEO;
 	else
 		ctx->work_mode = DSI_MODE_CMD;
 
-	if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+	if (bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
 		ctx->burst_mode = VIDEO_BURST_WITH_SYNC_PULSES;
-	else if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	else if (bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 		ctx->burst_mode = VIDEO_NON_BURST_WITH_SYNC_PULSES;
 	else
 		ctx->burst_mode = VIDEO_NON_BURST_WITH_SYNC_EVENTS;
@@ -1017,7 +1017,7 @@ static ssize_t sprd_dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops sprd_dsi_host_ops = {
-	.attach = sprd_dsi_host_attach,
+	.attach_new = sprd_dsi_host_attach,
 	.detach = sprd_dsi_host_detach,
 	.transfer = sprd_dsi_host_transfer,
 };
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.h b/drivers/gpu/drm/sprd/sprd_dsi.h
index d858ebb111150546e99403a87bc7cea42cad0158..2a0a5700d93c30bda5e33f2142cef8a7cce0271c 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.h
+++ b/drivers/gpu/drm/sprd/sprd_dsi.h
@@ -114,7 +114,7 @@ struct dsi_context {
 struct sprd_dsi {
 	struct drm_device *drm;
 	struct mipi_dsi_host host;
-	struct mipi_dsi_device *slave;
+	struct mipi_dsi_bus_fmt bus_fmt;
 	struct drm_encoder encoder;
 	struct drm_bridge *panel_bridge;
 	struct dsi_context ctx;

-- 
2.49.0

