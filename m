Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELDmA5cMlGn4/QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 07:37:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31794148FFE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 07:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F8110E1DF;
	Tue, 17 Feb 2026 06:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qeRAyOmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CD710E1DF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 06:37:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CC0D4413B;
 Tue, 17 Feb 2026 06:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27601C19421;
 Tue, 17 Feb 2026 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771310225;
 bh=gnTftnoIBkI330fF7Dod1W2djpjcPdodUfHbrfc7B/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qeRAyOmoqhjiu31w51h8IzEas+BPYq/Rj9Cq2dbhwSdnplKN+wfCGbktqazo8D77u
 B8zwrM8yt2O3xLC33YeJuVEyhdffOWQsnC/AtioSipU14Oxxt1G7wRpQaCF/o6g9qb
 QVolPRYMdFj1D7ULLxpcdk5cu8AH2eFY7JEcj38aO+4Zgl3Msk87+FMXTUSN+95oBl
 DPOIfBitCJxZzletxwc19RyuGxMn/n9abDKojLyefHkoXPPICdq3KdNlZL6WoFgPdB
 rUreL4C47XIAU3ciM7ahQ2lk/Y/w8+OuwxfuBtXigimkw1SOP4QqYGwSYe0kWRcD5+
 IPA0n/R8bqNDQ==
Received: by wens.tw (Postfix, from userid 1000)
 id 977CE5FCAE; Tue, 17 Feb 2026 14:37:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Michael Riesch <michael.riesch@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Archit Anant <architanant5@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH 2/2] drm/panel: sitronix-st7789v: Convert to mipi_dbi
Date: Tue, 17 Feb 2026 14:36:44 +0800
Message-ID: <20260217063647.3160826-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217063647.3160826-1-wens@kernel.org>
References: <20260217063647.3160826-1-wens@kernel.org>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,wolfvision.net,bootlin.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sebastian.reichel@collabora.com,m:gerald.loacker@wolfvision.net,m:michael.riesch@collabora.com,m:miquel.raynal@bootlin.com,m:wens@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:architanant5@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 31794148FFE
X-Rspamd-Action: no action

The wire protocol of the ST7789V is basically MIPI DBI. Switch to the
mipi_dbi helpers to reduce some code. This also ends up adding support
for 8-bit D/C mode. The reset logic in the mipi_dbi helpers is also
used.

While at it, also clean up st7789v_check_id() to use ST7789V_IDS_SIZE
to declare the ids array size and sizeof(ids) where the size is
needed.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/gpu/drm/panel/Kconfig                 |   1 +
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 304 +++++++-----------
 2 files changed, 109 insertions(+), 196 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 307152ad7759..64325874d3e2 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1011,6 +1011,7 @@ config DRM_PANEL_SITRONIX_ST7789V
 	tristate "Sitronix ST7789V panel"
 	depends on OF && SPI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DBI
 	help
 	  Say Y here if you want to enable support for the Sitronix
 	  ST7789V controller for 240x320 LCD panels
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index d5f821d6b23c..27d1c4aefc53 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_mipi_dbi.h>
 #include <drm/drm_panel.h>
 
 #define ST7789V_RAMCTRL_CMD		0xb0
@@ -125,9 +126,9 @@ struct st7789_panel_info {
 
 struct st7789v {
 	struct drm_panel panel;
+	struct mipi_dbi dbi;
 	const struct st7789_panel_info *info;
 	struct spi_device *spi;
-	struct gpio_desc *reset;
 	struct regulator *power;
 	enum drm_panel_orientation orientation;
 };
@@ -142,86 +143,23 @@ static inline struct st7789v *panel_to_st7789v(struct drm_panel *panel)
 	return container_of(panel, struct st7789v, panel);
 }
 
-static int st7789v_spi_write(struct st7789v *ctx, enum st7789v_prefix prefix,
-			     u8 data)
-{
-	struct spi_transfer xfer = { };
-	u16 txbuf = ((prefix & 1) << 8) | data;
-
-	xfer.tx_buf = &txbuf;
-	xfer.len = sizeof(txbuf);
-
-	return spi_sync_transfer(ctx->spi, &xfer, 1);
-}
-
-static int st7789v_write_command(struct st7789v *ctx, u8 cmd)
-{
-	return st7789v_spi_write(ctx, ST7789V_COMMAND, cmd);
-}
-
-static int st7789v_write_data(struct st7789v *ctx, u8 cmd)
-{
-	return st7789v_spi_write(ctx, ST7789V_DATA, cmd);
-}
-
-static int st7789v_read_data(struct st7789v *ctx, u8 cmd, u8 *buf,
-			     unsigned int len)
-{
-	struct spi_transfer xfer[2] = { };
-	struct spi_message msg;
-	u16 txbuf = ((ST7789V_COMMAND & 1) << 8) | cmd;
-	u16 rxbuf[4] = {};
-	u8 bit9 = 0;
-	int ret, i;
-
-	switch (len) {
-	case 1:
-	case 3:
-	case 4:
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
-
-	spi_message_init(&msg);
-
-	xfer[0].tx_buf = &txbuf;
-	xfer[0].len = sizeof(txbuf);
-	spi_message_add_tail(&xfer[0], &msg);
-
-	xfer[1].rx_buf = rxbuf;
-	xfer[1].len = len * 2;
-	spi_message_add_tail(&xfer[1], &msg);
-
-	ret = spi_sync(ctx->spi, &msg);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < len; i++) {
-		buf[i] = rxbuf[i] >> i | (bit9 << (9 - i));
-		if (i)
-			bit9 = rxbuf[i] & GENMASK(i - 1, 0);
-	}
-
-	return 0;
-}
-
 static int st7789v_check_id(struct drm_panel *panel)
 {
 	const u8 st7789v_ids[ST7789V_IDS_SIZE] = ST7789V_IDS;
 	struct st7789v *ctx = panel_to_st7789v(panel);
 	bool invalid_ids = false;
 	int ret, i;
-	u8 ids[3];
+	u8 ids[ST7789V_IDS_SIZE];
 
 	if (ctx->spi->mode & SPI_NO_RX)
 		return 0;
 
-	ret = st7789v_read_data(ctx, MIPI_DCS_GET_DISPLAY_ID, ids, ST7789V_IDS_SIZE);
+	ret = mipi_dbi_command_stackbuf(&ctx->dbi, MIPI_DCS_GET_DISPLAY_ID,
+					ids, sizeof(ids));
 	if (ret)
 		return ret;
 
-	for (i = 0; i < ST7789V_IDS_SIZE; i++) {
+	for (i = 0; i < sizeof(ids); i++) {
 		if (ids[i] != st7789v_ids[i]) {
 			invalid_ids = true;
 			break;
@@ -379,6 +317,7 @@ static enum drm_panel_orientation st7789v_get_orientation(struct drm_panel *p)
 static int st7789v_prepare(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
+	struct mipi_dbi *dbi = &ctx->dbi;
 	u8 mode, pixel_fmt, polarity;
 	int ret;
 
@@ -416,10 +355,7 @@ static int st7789v_prepare(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
-	gpiod_set_value(ctx->reset, 1);
-	msleep(30);
-	gpiod_set_value(ctx->reset, 0);
-	msleep(120);
+	mipi_dbi_hw_reset(&ctx->dbi);
 
 	/*
 	 * Avoid failing if the IDs are invalid in case the Rx bus width
@@ -429,101 +365,81 @@ static int st7789v_prepare(struct drm_panel *panel)
 	if (ret)
 		dev_warn(panel->dev, "Unrecognized panel IDs");
 
-	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_EXIT_SLEEP_MODE));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE));
 
 	/* We need to wait 120ms after a sleep out command */
 	msleep(120);
 
-	ST7789V_TEST(ret, st7789v_write_command(ctx,
-						MIPI_DCS_SET_ADDRESS_MODE));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, 0));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx,
-						MIPI_DCS_SET_PIXEL_FORMAT));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, pixel_fmt));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PORCTRL_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xc));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xc));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, 0));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PORCTRL_IDLE_BP(3) |
-					     ST7789V_PORCTRL_IDLE_FP(3)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx,
-					     ST7789V_PORCTRL_PARTIAL_BP(3) |
-					     ST7789V_PORCTRL_PARTIAL_FP(3)));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_GCTRL_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_GCTRL_VGLS(5) |
-					     ST7789V_GCTRL_VGHS(3)));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VCOMS_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, 0x2b));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_LCMCTRL_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_LCMCTRL_XMH |
-					     ST7789V_LCMCTRL_XMX |
-					     ST7789V_LCMCTRL_XBGR));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VDVVRHEN_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_VDVVRHEN_CMDEN));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VRHS_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xf));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VDVS_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, 0x20));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_FRCTRL2_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xf));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PWCTRL1_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PWCTRL1_MAGIC));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PWCTRL1_AVDD(2) |
-					     ST7789V_PWCTRL1_AVCL(2) |
-					     ST7789V_PWCTRL1_VDS(1)));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PVGAMCTRL_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP63(0xd)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP1(0xca)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP2(0xe)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP4(8)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP6(9)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP13(7)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP20(0x2d)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP27(0xb) |
-					     ST7789V_PVGAMCTRL_VP36(3)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP43(0x3d)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_JP1(3) |
-					     ST7789V_PVGAMCTRL_VP50(4)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP57(0xa)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP59(0xa)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP61(0x1b)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP62(0x28)));
-
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_NVGAMCTRL_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN63(0xd)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN1(0xca)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN2(0xf)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN4(8)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN6(8)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN13(7)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN20(0x2e)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN27(0xc) |
-					     ST7789V_NVGAMCTRL_VN36(5)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN43(0x40)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_JN1(3) |
-					     ST7789V_NVGAMCTRL_VN50(4)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN57(9)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN59(0xb)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN61(0x1b)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN62(0x28)));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, pixel_fmt));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_PORCTRL_CMD, 0xc, 0xc, 0,
+					   ST7789V_PORCTRL_IDLE_BP(3) |
+					   ST7789V_PORCTRL_IDLE_FP(3),
+					   ST7789V_PORCTRL_PARTIAL_BP(3) |
+					   ST7789V_PORCTRL_PARTIAL_FP(3)));
+
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_GCTRL_CMD,
+					   ST7789V_GCTRL_VGLS(5) |
+					   ST7789V_GCTRL_VGHS(3)));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_VCOMS_CMD, 0x2b));
+
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_LCMCTRL_CMD,
+					   ST7789V_LCMCTRL_XMH |
+					   ST7789V_LCMCTRL_XMX |
+					   ST7789V_LCMCTRL_XBGR));
+
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_VDVVRHEN_CMD,
+					   ST7789V_VDVVRHEN_CMDEN));
+
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_VRHS_CMD, 0xf));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_VDVS_CMD, 0x20));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_FRCTRL2_CMD, 0xf));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_PWCTRL1_CMD,
+					   ST7789V_PWCTRL1_MAGIC,
+					   ST7789V_PWCTRL1_AVDD(2) |
+					   ST7789V_PWCTRL1_AVCL(2) |
+					   ST7789V_PWCTRL1_VDS(1)));
+
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_PVGAMCTRL_CMD,
+					   ST7789V_PVGAMCTRL_VP63(0xd),
+					   ST7789V_PVGAMCTRL_VP1(0xca),
+					   ST7789V_PVGAMCTRL_VP2(0xe),
+					   ST7789V_PVGAMCTRL_VP4(8),
+					   ST7789V_PVGAMCTRL_VP6(9),
+					   ST7789V_PVGAMCTRL_VP13(7),
+					   ST7789V_PVGAMCTRL_VP20(0x2d),
+					   ST7789V_PVGAMCTRL_VP27(0xb) |
+					   ST7789V_PVGAMCTRL_VP36(3),
+					   ST7789V_PVGAMCTRL_VP43(0x3d),
+					   ST7789V_PVGAMCTRL_JP1(3) |
+					   ST7789V_PVGAMCTRL_VP50(4),
+					   ST7789V_PVGAMCTRL_VP57(0xa),
+					   ST7789V_PVGAMCTRL_VP59(0xa),
+					   ST7789V_PVGAMCTRL_VP61(0x1b),
+					   ST7789V_PVGAMCTRL_VP62(0x28)));
+
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_NVGAMCTRL_CMD,
+					   ST7789V_NVGAMCTRL_VN63(0xd),
+					   ST7789V_NVGAMCTRL_VN1(0xca),
+					   ST7789V_NVGAMCTRL_VN2(0xf),
+					   ST7789V_NVGAMCTRL_VN4(8),
+					   ST7789V_NVGAMCTRL_VN6(8),
+					   ST7789V_NVGAMCTRL_VN13(7),
+					   ST7789V_NVGAMCTRL_VN20(0x2e),
+					   ST7789V_NVGAMCTRL_VN27(0xc) |
+					   ST7789V_NVGAMCTRL_VN36(5),
+					   ST7789V_NVGAMCTRL_VN43(0x40),
+					   ST7789V_NVGAMCTRL_JN1(3) |
+					   ST7789V_NVGAMCTRL_VN50(4),
+					   ST7789V_NVGAMCTRL_VN57(9),
+					   ST7789V_NVGAMCTRL_VN59(0xb),
+					   ST7789V_NVGAMCTRL_VN61(0x1b),
+					   ST7789V_NVGAMCTRL_VN62(0x28)));
 
 	if (ctx->info->invert_mode) {
-		ST7789V_TEST(ret, st7789v_write_command(ctx,
-						MIPI_DCS_ENTER_INVERT_MODE));
+		ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE));
 	} else {
-		ST7789V_TEST(ret, st7789v_write_command(ctx,
-						MIPI_DCS_EXIT_INVERT_MODE));
+		ST7789V_TEST(ret, mipi_dbi_command(dbi,	MIPI_DCS_EXIT_INVERT_MODE));
 	}
 
 	if (ctx->info->partial_mode) {
@@ -539,36 +455,27 @@ static int st7789v_prepare(struct drm_panel *panel)
 		 * add margins.
 		 */
 
-		ST7789V_TEST(ret, st7789v_write_command(
-					  ctx, MIPI_DCS_ENTER_PARTIAL_MODE));
-
-		ST7789V_TEST(ret, st7789v_write_command(
-					  ctx, MIPI_DCS_SET_PAGE_ADDRESS));
-		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[0]));
-		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[1]));
-		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[2]));
-		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[3]));
-
-		ST7789V_TEST(ret, st7789v_write_command(
-					  ctx, MIPI_DCS_SET_PARTIAL_ROWS));
-		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[0]));
-		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[1]));
-		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[2]));
-		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[3]));
+		ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_ENTER_PARTIAL_MODE));
+
+		ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS,
+						   area_data[0], area_data[1],
+						   area_data[2], area_data[3]));
+
+		ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_SET_PARTIAL_ROWS,
+						   area_data[0], area_data[1],
+						   area_data[2], area_data[3]));
 	}
 
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RAMCTRL_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_DM_RGB |
-					     ST7789V_RAMCTRL_RM_RGB));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_EPF(3) |
-					     ST7789V_RAMCTRL_MAGIC));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_RAMCTRL_CMD,
+					   ST7789V_RAMCTRL_DM_RGB |
+					   ST7789V_RAMCTRL_RM_RGB,
+					   ST7789V_RAMCTRL_EPF(3) |
+					   ST7789V_RAMCTRL_MAGIC));
 
-	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RGBCTRL_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, mode |
-					     ST7789V_RGBCTRL_RCM(2) |
-					     polarity));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_HBP(20)));
+	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_RGBCTRL_CMD,
+					   mode | ST7789V_RGBCTRL_RCM(2) | polarity,
+					   ST7789V_RGBCTRL_VBP(8),
+					   ST7789V_RGBCTRL_HBP(20)));
 
 	return 0;
 }
@@ -577,7 +484,7 @@ static int st7789v_enable(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
 
-	return st7789v_write_command(ctx, MIPI_DCS_SET_DISPLAY_ON);
+	return mipi_dbi_command(&ctx->dbi, MIPI_DCS_SET_DISPLAY_ON);
 }
 
 static int st7789v_disable(struct drm_panel *panel)
@@ -585,7 +492,7 @@ static int st7789v_disable(struct drm_panel *panel)
 	struct st7789v *ctx = panel_to_st7789v(panel);
 	int ret;
 
-	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_SET_DISPLAY_OFF));
+	ST7789V_TEST(ret, mipi_dbi_command(&ctx->dbi, MIPI_DCS_SET_DISPLAY_OFF));
 
 	return 0;
 }
@@ -595,7 +502,7 @@ static int st7789v_unprepare(struct drm_panel *panel)
 	struct st7789v *ctx = panel_to_st7789v(panel);
 	int ret;
 
-	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_ENTER_SLEEP_MODE));
+	ST7789V_TEST(ret, mipi_dbi_command(&ctx->dbi, MIPI_DCS_ENTER_SLEEP_MODE));
 
 	regulator_disable(ctx->power);
 
@@ -615,6 +522,7 @@ static int st7789v_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
 	struct st7789v *ctx;
+	struct gpio_desc *dc;
 	int ret;
 
 	ctx = devm_drm_panel_alloc(dev, struct st7789v, panel,
@@ -625,11 +533,6 @@ static int st7789v_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, ctx);
 	ctx->spi = spi;
 
-	spi->bits_per_word = 9;
-	ret = spi_setup(spi);
-	if (ret < 0)
-		return dev_err_probe(&spi->dev, ret, "Failed to setup spi\n");
-
 	ctx->info = device_get_match_data(&spi->dev);
 
 	ctx->power = devm_regulator_get(dev, "power");
@@ -637,11 +540,16 @@ static int st7789v_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get regulator\n");
 
-	ctx->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	ctx->dbi.reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	ret = PTR_ERR_OR_ZERO(ctx->reset);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get reset line\n");
 
+	dc = devm_gpiod_get_optional(&spi->dev, "dc", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(dc);
+	if (ret)
+		return dev_err_probe(&spi->dev, ret, "Failed to get GPIO for D/C\n");
+
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -650,6 +558,10 @@ static int st7789v_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(&spi->dev, ret, "Failed to get orientation\n");
 
+	ret = mipi_dbi_spi_init(spi, &ctx->dbi, dc);
+	if (ret)
+		return dev_err_probe(&spi->dev, ret, "Failed to init MIPI DBI\n");
+
 	drm_panel_add(&ctx->panel);
 
 	return 0;
-- 
2.47.3

