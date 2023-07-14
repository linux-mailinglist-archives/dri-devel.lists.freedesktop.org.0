Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71039752EC7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568DB10E0AD;
	Fri, 14 Jul 2023 01:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F2D10E7B1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5DD861BE3;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10310C433BD;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298687;
 bh=j8pDswVHzIfTvdkT2nYVTXa5vw9xRuWvNmDrAubLjII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qgSc69w/n1FeisakITDh5sh81dAr+Zd1OjhByLooZwPoD74XW6MeiRIhNj677pFwV
 I9QzcUuyIhpEdQnIJWpITrdhyoweEd+BcN5cOt2jjHUxU5EpFk2xEXkQR7CabAfKHz
 t2RJiZTWNoHL0O1/jhWng1RSnmobMFJd6P4oxcAVlSphPYmX6yPD+4j50u20HaL1WK
 uroClo3gganL6oYLw/ymAXOrozY6yVeokjoL4vHaMfvsextSqLLoUeYI/Rn3zrFHVL
 cqPtJgERraS/nUnp6V1XiiszwnNJGNuzALTYNo7Houq+JfzNDGGUFn5UB0Vr4VadAv
 IX8S+pqfQ/C8Q==
Received: by mercury (Postfix, from userid 1000)
 id 0713910676FB; Fri, 14 Jul 2023 03:37:59 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 19/19] drm/panel: sitronix-st7789v: Check display ID
Date: Fri, 14 Jul 2023 03:37:56 +0200
Message-Id: <20230714013756.1546769-20-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Miquel Raynal <miquel.raynal@bootlin.com>

A very basic debugging rule when a device is connected for the first
time is to access a read-only register which contains known data in
order to ensure the communication protocol is properly working. This
driver lacked any read helper which is often a critical piece for
speeding-up bring-ups.

Add a read helper and use it to verify the communication with the panel
is working as soon as possible in order to inform the user early if this
is not the case.

As this panel may work with no MISO line, the check is discarded in this
case. Upon error, we do not fail probing but just warn the user, in case
the DT description would be lacking the Rx bus width (which is likely on
old descriptions) in order to avoid breaking existing devices.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Tested-by: Sebastian Reichel <sre@kernel.org> # no MISO line
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 47387f127e05..dc010d87a9ef 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -110,6 +110,9 @@
 			return val;		\
 	} while (0)
 
+#define ST7789V_IDS { 0x85, 0x85, 0x52 }
+#define ST7789V_IDS_SIZE 3
+
 struct st7789_panel_info {
 	const struct drm_display_mode *mode;
 	u32 bus_format;
@@ -157,6 +160,76 @@ static int st7789v_write_data(struct st7789v *ctx, u8 cmd)
 	return st7789v_spi_write(ctx, ST7789V_DATA, cmd);
 }
 
+static int st7789v_read_data(struct st7789v *ctx, u8 cmd, u8 *buf,
+			     unsigned int len)
+{
+	struct spi_transfer xfer[2] = { };
+	struct spi_message msg;
+	u16 txbuf = ((ST7789V_COMMAND & 1) << 8) | cmd;
+	u16 rxbuf[4] = {};
+	u8 bit9 = 0;
+	int ret, i;
+
+	switch (len) {
+	case 1:
+	case 3:
+	case 4:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	spi_message_init(&msg);
+
+	xfer[0].tx_buf = &txbuf;
+	xfer[0].len = sizeof(txbuf);
+	spi_message_add_tail(&xfer[0], &msg);
+
+	xfer[1].rx_buf = rxbuf;
+	xfer[1].len = len * 2;
+	spi_message_add_tail(&xfer[1], &msg);
+
+	ret = spi_sync(ctx->spi, &msg);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < len; i++) {
+		buf[i] = rxbuf[i] >> i | (bit9 << (9 - i));
+		if (i)
+			bit9 = rxbuf[i] & GENMASK(i - 1, 0);
+	}
+
+	return 0;
+}
+
+static int st7789v_check_id(struct drm_panel *panel)
+{
+	const u8 st7789v_ids[ST7789V_IDS_SIZE] = ST7789V_IDS;
+	struct st7789v *ctx = panel_to_st7789v(panel);
+	bool invalid_ids = false;
+	int ret, i;
+	u8 ids[3];
+
+	if (ctx->spi->mode & SPI_NO_RX)
+		return 0;
+
+	ret = st7789v_read_data(ctx, MIPI_DCS_GET_DISPLAY_ID, ids, ST7789V_IDS_SIZE);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ST7789V_IDS_SIZE; i++) {
+		if (ids[i] != st7789v_ids[i]) {
+			invalid_ids = true;
+			break;
+		}
+	}
+
+	if (invalid_ids)
+		return -EIO;
+
+	return 0;
+}
+
 static const struct drm_display_mode default_mode = {
 	.clock = 7000,
 	.hdisplay = 240,
@@ -295,6 +368,14 @@ static int st7789v_prepare(struct drm_panel *panel)
 	gpiod_set_value(ctx->reset, 0);
 	msleep(120);
 
+	/*
+	 * Avoid failing if the IDs are invalid in case the Rx bus width
+	 * description is missing.
+	 */
+	ret = st7789v_check_id(panel);
+	if (ret)
+		dev_warn(panel->dev, "Unrecognized panel IDs");
+
 	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_EXIT_SLEEP_MODE));
 
 	/* We need to wait 120ms after a sleep out command */
-- 
2.40.1

