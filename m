Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D6AE8A6C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BE210E78D;
	Wed, 25 Jun 2025 16:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="i4irj6ZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905CB10E78D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:46:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBA1544384;
 Wed, 25 Jun 2025 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750869992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbSpydz2eJQQP997xNonpSsdHolKUbUJfT+KnBTHW6I=;
 b=i4irj6ZOqZOCZtYn7GpCYJ8Yeh21ysw9X3NjMEmJmQ+M0Q4AnnOgvo6ndo6g8/yTfXA7eK
 BNNzwqTqdR+ECFFrTh1Tp7ZaxEGS+HrpZyrWtKb8m0dqKAukTelaiYddO4MtTVlJwi/ycu
 1HIqJ3s/NrZRRkdPfj1Oef+OD/aXmyFaQxEJLPj+xuou5tYQKxKOqM4dJ+8ISg2Pa8GrtK
 lmTMubR7YB9FJ5XcNtbHbHqyzF8QaZ2mKIDldJu8dAKc6usGweFWXt6oHr9V2uNHkaPcJM
 P8UZw1arHz/NIcAN7en0b8YQhM/dfB1PBBNbpAtHmYM6Slx55ZFigY0c1jdlng==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:36 +0200
Subject: [PATCH 32/32] drm/mcde: convert to the .attach_new op
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-32-e36bc258a7c5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepvdeknecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
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
mipi_dsi_device in two places: struct mcde and struct mcde_dsi. That's
exactly what .attach_new aims at removing.

Instead of the struct mipi_dsi_device, store:

 * a copy of the format parameters in struct mcde_dsi
 * a pointer to it in struct mcde

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mcde/mcde_display.c | 14 +++----
 drivers/gpu/drm/mcde/mcde_drm.h     |  3 +-
 drivers/gpu/drm/mcde/mcde_dsi.c     | 78 ++++++++++++++++++-------------------
 3 files changed, 48 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 70f8d92ed23a192f4cdb51c7f68b9973147b2113..6898353e944479b4fe8cdaa632ef87e062299c57 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -796,9 +796,9 @@ static void mcde_configure_dsi_formatter(struct mcde *mcde,
 	 * 8 bit commands and DCS commands (notgen = not generic)
 	 */
 	val = MCDE_DSICONF0_CMD8 | MCDE_DSICONF0_DCSVID_NOTGEN;
-	if (mcde->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO)
+	if (mcde->bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO)
 		val |= MCDE_DSICONF0_VID_MODE_VID;
-	switch (mcde->mdsi->format) {
+	switch (mcde->bus_fmt->format) {
 	case MIPI_DSI_FMT_RGB888:
 		val |= MCDE_DSICONF0_PACKING_RGB888 <<
 			MCDE_DSICONF0_PACKING_SHIFT;
@@ -1081,11 +1081,11 @@ static void mcde_setup_dsi(struct mcde *mcde, const struct drm_display_mode *mod
 	u32 val;
 
 	dev_info(mcde->dev, "output in %s mode, format %dbpp\n",
-		 (mcde->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) ?
+		 (mcde->bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO) ?
 		 "VIDEO" : "CMD",
-		 mipi_dsi_pixel_format_to_bpp(mcde->mdsi->format));
+		 mipi_dsi_pixel_format_to_bpp(mcde->bus_fmt->format));
 	formatter_cpp =
-		mipi_dsi_pixel_format_to_bpp(mcde->mdsi->format) / 8;
+		mipi_dsi_pixel_format_to_bpp(mcde->bus_fmt->format) / 8;
 	dev_info(mcde->dev, "Overlay CPP: %d bytes, DSI formatter CPP %d bytes\n",
 		 cpp, formatter_cpp);
 
@@ -1117,7 +1117,7 @@ static void mcde_setup_dsi(struct mcde *mcde, const struct drm_display_mode *mod
 	 * 192 for HDMI 16bpp
 	 */
 	fifo_wtrmrk = mode->hdisplay;
-	if (mcde->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+	if (mcde->bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		fifo_wtrmrk = min(fifo_wtrmrk, 128);
 		pkt_div = 1;
 	} else {
@@ -1132,7 +1132,7 @@ static void mcde_setup_dsi(struct mcde *mcde, const struct drm_display_mode *mod
 	/* NOTE: pkt_div is 1 for video mode */
 	pkt_size = (formatter_ppl * formatter_cpp) / pkt_div;
 	/* Commands CMD8 need one extra byte */
-	if (!(mcde->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO))
+	if (!(mcde->bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO))
 		pkt_size++;
 
 	dev_dbg(mcde->dev, "DSI packet size: %d * %d bytes per line\n",
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index 23f9a6473d8ac0f91b3e3665f22e52ef8e696a17..842ca58543da7a075976cc33df707d78e096e82e 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -5,6 +5,7 @@
  * (C) ST-Ericsson SA 2013
  */
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_mipi_dsi.h>
 
 #ifndef _MCDE_DRM_H_
 #define _MCDE_DRM_H_
@@ -74,7 +75,7 @@ struct mcde {
 	struct drm_connector *connector;
 	struct drm_simple_display_pipe pipe;
 	struct mipi_dsi_host *dsi_host;
-	struct mipi_dsi_device *mdsi;
+	struct mipi_dsi_bus_fmt *bus_fmt;
 	bool dpi_output;
 	s16 stride;
 	enum mcde_flow_mode flow_mode;
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index b97b9541b6277ad3e024845d3bb61c9e73d627f7..c4225875b04ab440e3e926c976dd981f46dd3461 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -42,7 +42,7 @@ struct mcde_dsi {
 	struct drm_panel *panel;
 	struct drm_bridge *bridge_out;
 	struct mipi_dsi_host dsi_host;
-	struct mipi_dsi_device *mdsi;
+	struct mipi_dsi_bus_fmt bus_fmt;
 	const struct drm_display_mode *mode;
 	struct clk *hs_clk;
 	struct clk *lp_clk;
@@ -147,8 +147,8 @@ bool mcde_dsi_irq(struct mipi_dsi_host *host)
 
 static void mcde_dsi_attach_to_mcde(struct mcde_dsi *d)
 {
-	d->mcde->mdsi = d->mdsi;
 	d->mcde->dsi_host = &d->dsi_host;
+	d->mcde->bus_fmt = &d->bus_fmt;
 
 	/*
 	 * Select the way the DSI data flow is pushing to the display:
@@ -162,23 +162,23 @@ static void mcde_dsi_attach_to_mcde(struct mcde_dsi *d)
 	 * single frame on-demand updates with DRM for command mode
 	 * displays (MCDE_COMMAND_ONESHOT_FLOW).
 	 */
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO)
+	if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO)
 		d->mcde->flow_mode = MCDE_VIDEO_FORMATTER_FLOW;
 	else
 		d->mcde->flow_mode = MCDE_COMMAND_TE_FLOW;
 }
 
 static int mcde_dsi_host_attach(struct mipi_dsi_host *host,
-				struct mipi_dsi_device *mdsi)
+				const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct mcde_dsi *d = host_to_mcde_dsi(host);
 
-	if (mdsi->lanes > 2) {
+	if (bus_fmt->lanes > 2) {
 		DRM_ERROR("dsi device params invalid, 1 or 2 lanes supported\n");
 		return -EINVAL;
 	}
 
-	d->mdsi = mdsi;
+	d->bus_fmt = *bus_fmt;
 	if (d->mcde)
 		mcde_dsi_attach_to_mcde(d);
 
@@ -190,10 +190,10 @@ static int mcde_dsi_host_detach(struct mipi_dsi_host *host,
 {
 	struct mcde_dsi *d = host_to_mcde_dsi(host);
 
-	d->mdsi = NULL;
+	memset(&d->mcde->bus_fmt, 0, sizeof(d->mcde->bus_fmt));
 	if (d->mcde) {
-		d->mcde->mdsi = NULL;
 		d->mcde->dsi_host = NULL;
+		d->mcde->bus_fmt = NULL;
 	}
 
 	return 0;
@@ -378,7 +378,7 @@ static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops mcde_dsi_host_ops = {
-	.attach = mcde_dsi_host_attach,
+	.attach_new = mcde_dsi_host_attach,
 	.detach = mcde_dsi_host_detach,
 	.transfer = mcde_dsi_host_transfer,
 };
@@ -426,7 +426,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
 				      const struct drm_display_mode *mode)
 {
 	/* cpp, characters per pixel, number of bytes per pixel */
-	u8 cpp = mipi_dsi_pixel_format_to_bpp(d->mdsi->format) / 8;
+	u8 cpp = mipi_dsi_pixel_format_to_bpp(d->bus_fmt.format) / 8;
 	u64 pclk;
 	u64 bpl;
 	int hfp;
@@ -436,14 +436,14 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
 	u32 val;
 
 	val = 0;
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+	if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
 		val |= DSI_VID_MAIN_CTL_BURST_MODE;
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+	if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
 		val |= DSI_VID_MAIN_CTL_SYNC_PULSE_ACTIVE;
 		val |= DSI_VID_MAIN_CTL_SYNC_PULSE_HORIZONTAL;
 	}
 	/* RGB header and pixel mode */
-	switch (d->mdsi->format) {
+	switch (d->bus_fmt.format) {
 	case MIPI_DSI_FMT_RGB565:
 		val |= MIPI_DSI_PACKED_PIXEL_STREAM_16 <<
 			DSI_VID_MAIN_CTL_HEADER_SHIFT;
@@ -516,7 +516,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
 	 * 6 + 2 is HFP header + checksum
 	 */
 	hfp = (mode->hsync_start - mode->hdisplay) * cpp - 6 - 2;
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+	if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
 		/*
 		 * Use sync pulse for sync: explicit HSA time
 		 * 6 is HBP header + checksum
@@ -596,21 +596,21 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
 	bpl = pclk * mode->htotal; /* (1) picoseconds per line */
 	dev_dbg(d->dev, "picoseconds per line: %llu\n", bpl);
 	/* Multiply with bytes per second (3) */
-	bpl *= (d->mdsi->hs_rate / 8);
+	bpl *= (d->bus_fmt.hs_rate / 8);
 	/* Pixels per second (2) */
 	bpl = DIV_ROUND_DOWN_ULL(bpl, 1000000); /* microseconds */
 	bpl = DIV_ROUND_DOWN_ULL(bpl, 1000000); /* seconds */
 	/* parallel transactions in all lanes */
-	bpl *= d->mdsi->lanes;
+	bpl *= d->bus_fmt.lanes;
 	dev_dbg(d->dev,
 		"calculated bytes per line: %llu @ %d Hz with HS %lu Hz\n",
-		bpl, drm_mode_vrefresh(mode), d->mdsi->hs_rate);
+		bpl, drm_mode_vrefresh(mode), d->bus_fmt.hs_rate);
 
 	/*
 	 * 6 is header + checksum, header = 4 bytes, checksum = 2 bytes
 	 * 4 is short packet for vsync/hsync
 	 */
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+	if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
 		/* Set the event packet size to 0 (not used) */
 		writel(0, d->regs + DSI_VID_BLKSIZE1);
 		/*
@@ -646,10 +646,10 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
 	 * the line duration by 1 under very specific circumstances.
 	 * Here we also imply that LP is used during burst EOL.
 	 */
-	if (d->mdsi->lanes == 2 && (hsa & 0x01) && (hfp & 0x01)
-	    && (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
+	if (d->bus_fmt.lanes == 2 && (hsa & 0x01) && (hfp & 0x01)
+	    && (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
 		line_duration--;
-	line_duration = DIV_ROUND_CLOSEST(line_duration, d->mdsi->lanes);
+	line_duration = DIV_ROUND_CLOSEST(line_duration, d->bus_fmt.lanes);
 	dev_dbg(d->dev, "line duration %u bytes\n", line_duration);
 	val = line_duration << DSI_VID_DPHY_TIME_REG_LINE_DURATION_SHIFT;
 	/*
@@ -665,7 +665,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
 	 * See the manual figure 657 page 2203 for understanding the impact
 	 * of the different burst mode settings.
 	 */
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+	if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
 		int blkeol_pck, blkeol_duration;
 		/*
 		 * Packet size at EOL for burst mode, this is only used
@@ -716,7 +716,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
 		 * according to figure 565 page 2202?
 		 */
 		blkeol_duration = DIV_ROUND_CLOSEST(blkeol_pck + 6,
-						    d->mdsi->lanes);
+						    d->bus_fmt.lanes);
 		dev_dbg(d->dev, "BLKEOL duration: %d clock cycles\n",
 			blkeol_duration);
 
@@ -757,7 +757,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
 		DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
 		DSI_MCTL_MAIN_DATA_CTL_READ_EN |
 		DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
-	if (!(d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (!(d->bus_fmt.mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
 		val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
 	writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
 
@@ -785,9 +785,9 @@ static void mcde_dsi_start(struct mcde_dsi *d)
 	 * all the lines.
 	 */
 	val = 0x0f << DSI_MCTL_MAIN_PHY_CTL_WAIT_BURST_TIME_SHIFT;
-	if (d->mdsi->lanes == 2)
+	if (d->bus_fmt.lanes == 2)
 		val |= DSI_MCTL_MAIN_PHY_CTL_LANE2_EN;
-	if (!(d->mdsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
+	if (!(d->bus_fmt.mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		val |= DSI_MCTL_MAIN_PHY_CTL_CLK_CONTINUOUS;
 	val |= DSI_MCTL_MAIN_PHY_CTL_CLK_ULPM_EN |
 		DSI_MCTL_MAIN_PHY_CTL_DAT1_ULPM_EN |
@@ -811,7 +811,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
 		DSI_MCTL_MAIN_EN_CKLANE_EN |
 		DSI_MCTL_MAIN_EN_DAT1_EN |
 		DSI_MCTL_MAIN_EN_IF1_EN;
-	if (d->mdsi->lanes == 2)
+	if (d->bus_fmt.lanes == 2)
 		val |= DSI_MCTL_MAIN_EN_DAT2_EN;
 	writel(val, d->regs + DSI_MCTL_MAIN_EN);
 
@@ -820,7 +820,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
 	val = DSI_MCTL_MAIN_STS_PLL_LOCK |
 		DSI_MCTL_MAIN_STS_CLKLANE_READY |
 		DSI_MCTL_MAIN_STS_DAT1_READY;
-	if (d->mdsi->lanes == 2)
+	if (d->bus_fmt.lanes == 2)
 		val |= DSI_MCTL_MAIN_STS_DAT2_READY;
 	while ((readl(d->regs + DSI_MCTL_MAIN_STS) & val) != val) {
 		/* Sleep for a millisecond */
@@ -839,7 +839,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
 	 * If we enable low-power mode here,
 	 * then display updates become really slow.
 	 */
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_LPM)
+	if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_LPM)
 		val |= DSI_CMD_MODE_CTL_IF1_LP_EN;
 	val &= ~DSI_CMD_MODE_CTL_IF1_ID_MASK;
 	writel(val, d->regs + DSI_CMD_MODE_CTL);
@@ -861,12 +861,12 @@ void mcde_dsi_enable(struct drm_bridge *bridge)
 	int ret;
 
 	/* Copy maximum clock frequencies */
-	if (d->mdsi->lp_rate)
-		lp_freq = d->mdsi->lp_rate;
+	if (d->bus_fmt.lp_rate)
+		lp_freq = d->bus_fmt.lp_rate;
 	else
 		lp_freq = DSI_DEFAULT_LP_FREQ_HZ;
-	if (d->mdsi->hs_rate)
-		hs_freq = d->mdsi->hs_rate;
+	if (d->bus_fmt.hs_rate)
+		hs_freq = d->bus_fmt.hs_rate;
 	else
 		hs_freq = DSI_DEFAULT_HS_FREQ_HZ;
 
@@ -912,7 +912,7 @@ void mcde_dsi_enable(struct drm_bridge *bridge)
 	/* Start up the hardware */
 	mcde_dsi_start(d);
 
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+	if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO) {
 		/* Set up the video mode from the DRM mode */
 		mcde_dsi_setup_video_mode(d, d->mode);
 
@@ -943,7 +943,7 @@ void mcde_dsi_enable(struct drm_bridge *bridge)
 		 * If we enable low-power mode here
 		 * the display updates become really slow.
 		 */
-		if (d->mdsi->mode_flags & MIPI_DSI_MODE_LPM)
+		if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_LPM)
 			val |= DSI_CMD_MODE_CTL_IF1_LP_EN;
 		val &= ~DSI_CMD_MODE_CTL_IF1_ID_MASK;
 		writel(val, d->regs + DSI_CMD_MODE_CTL);
@@ -958,7 +958,7 @@ static void mcde_dsi_bridge_mode_set(struct drm_bridge *bridge,
 {
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 
-	if (!d->mdsi) {
+	if (!d->bus_fmt.lanes) {
 		dev_err(d->dev, "no DSI device attached to encoder!\n");
 		return;
 	}
@@ -967,7 +967,7 @@ static void mcde_dsi_bridge_mode_set(struct drm_bridge *bridge,
 
 	dev_info(d->dev, "set DSI master to %dx%d %u Hz %s mode\n",
 		 mode->hdisplay, mode->vdisplay, mode->clock * 1000,
-		 (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) ? "VIDEO" : "CMD"
+		 (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO) ? "VIDEO" : "CMD"
 		);
 }
 
@@ -1021,7 +1021,7 @@ void mcde_dsi_disable(struct drm_bridge *bridge)
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 	u32 val;
 
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+	if (d->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO) {
 		/* Stop video mode */
 		val = readl(d->regs + DSI_MCTL_MAIN_DATA_CTL);
 		val &= ~DSI_MCTL_MAIN_DATA_CTL_VID_EN;
@@ -1082,7 +1082,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	}
 	d->mcde = mcde;
 	/* If the display attached before binding, set this up */
-	if (d->mdsi)
+	if (d->bus_fmt.lanes)
 		mcde_dsi_attach_to_mcde(d);
 
 	/* Obtain the clocks */

-- 
2.49.0

