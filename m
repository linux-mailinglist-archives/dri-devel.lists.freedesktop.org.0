Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28854735BD0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A51E10E21C;
	Mon, 19 Jun 2023 16:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E797810E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:00:13 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687190412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Buq07FqJfA/AX33oYkO9+19k+nw9EBL40YqYi/2S1zA=;
 b=MqmSJXwFMQUJ0+ITTGObDe7ebaLEanre/zOZMGTslduGxomaCDFwfTw2Hw6s64CDmlrbzF
 Bk/E3E1xa1YdECnamvtYaCxiYaYN5ppdECv2fQ6SD5M2dSzUc2uYwKaHb9bWGABLQyg+tu
 7FlXXPPYsoxJqj+Ui5Po8n9lJnmC5src5h9GP7MmJqlkoXlKWlFuf7Ca5AUmUVSFL+vR8r
 4xEe53ecC7Fms4/JJyFKet92PKKPU9Ph6b/H11eA8ElyFHg0TBrINEIDiFipDhuHtWB+4o
 niLqbjJUrGhAXQYnvz8oo349nAYMY46u86pP7m54RVJpuO661l9HWRmW7F219Q==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31DDC1BF205;
 Mon, 19 Jun 2023 16:00:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/6] drm/panel: sitronix-st7789v: Check display ID
Date: Mon, 19 Jun 2023 17:59:58 +0200
Message-Id: <20230619155958.3119181-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619155958.3119181-1-miquel.raynal@bootlin.com>
References: <20230619155958.3119181-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 8649966ceae8..205de179f7f2 100644
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
2.34.1

