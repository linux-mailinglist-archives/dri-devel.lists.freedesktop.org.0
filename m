Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9764244EED
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 21:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D2F6EC0D;
	Fri, 14 Aug 2020 19:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76A66EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 19:45:15 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t6so11100003ljk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 12:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KsFn0c7QdtWCb3DsEhl/Wuyowc273VuyU1hI8J52hq0=;
 b=caTRvB3i0SvVbFZoQGsJ4z/ityAKFAfmcwWcW3TKUjnm5T4qt7zr/3nKA30U7lNWkA
 L4gJypj+EpQA6I0sNEfHUm19XmUhgKkA3p44Ip17Www43aUJ9mu3QKcOCm0Ryf7M0saj
 n4+YlNMu/7lzvTWV9v3+DnUcatqS/jm0JRub9rZKTXMCMy/00HkMcizoXd3F6s0jYVT9
 O4qeI7CAu5rao5eAVk1qa0uiMMQyKZ6eyg+XNKlFI/DXly67QUkchkjkpxOqs1zxs987
 emTdBfdIHdE6fZYpC+e072+RHpOvGB9oEON9v8XExOI7tnOTqjiUGrC+Fgp4/n1awmmp
 AopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KsFn0c7QdtWCb3DsEhl/Wuyowc273VuyU1hI8J52hq0=;
 b=D6zt8IKjD0aZQ/pa2RDnUKmJ2956RSDlAFGEd5oPPCnJdzo/jZmY2kk/JUhJ97lIlP
 6z+TEE3xRv/dDdjWB7TtrGMu5wv7TqJUxzfUfKUfwV5E9kqyRat5GexbOkjceleAa85e
 pVpHM2g53ETp8oRJgPvkVF8/Xi9YbQKpieANs5ruIDsSa3VVp9fJgoHve60HFQ9korkb
 4IKe2hyfEO37uGyEVNd4wmC3Kc2zgFYExQENKemz/Ic3uXhLsIHw3yDfqJBitMgYajOt
 74phIr0odPnSQ8pEIaPaGnDXRUmEFFchXWrFilcjiPEk+xvTvLXxosHXYdvfNpu1dpPD
 u1OQ==
X-Gm-Message-State: AOAM533Wul4/5LnGUzgtjDJPQH5ew+M+G1/iCqLASALqpp+9WmbDmTcr
 r6U3/ycjf0S3Ohu+n3HmtmYFfD7dtGaHDA==
X-Google-Smtp-Source: ABdhPJy3gr7I4uQt50TmckwgPS2JyyL3EDiK6yasn4U+0ppYmKrCJ6EaHk3jyf+JB37iFzTDDjFrVQ==
X-Received: by 2002:a2e:9a15:: with SMTP id o21mr1969351lji.419.1597434313776; 
 Fri, 14 Aug 2020 12:45:13 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y16sm1938847ljg.21.2020.08.14.12.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 12:45:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH v2] drm/mcde: Retry DSI read/write transactions
Date: Fri, 14 Aug 2020 21:44:51 +0200
Message-Id: <20200814194451.3494294-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vendor driver makes a few retries on read DSI
transactions, something that is needed especially in
case of read (such as reading the panel MTP ID) while
the panel is running in video mode. This happens on
the Samsung s6e63m0 panel on the Golden device.

Retry reads and writes alike three times.

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Retry three times.
- Only retry the actual command transmission like the vendor
  driver does, no need to set up all registers and do checks
  all over. Break out a part of the mcde_dsi_host_transfer()
  function to achieve this.
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 158 +++++++++++++++++++-------------
 1 file changed, 92 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 4ce8cc5f0be2..b3c5d3cbda92 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -208,79 +208,16 @@ static int mcde_dsi_host_detach(struct mipi_dsi_host *host,
 	 (type == MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM) || \
 	 (type == MIPI_DSI_DCS_READ))
 
-static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
-				      const struct mipi_dsi_msg *msg)
+static int mcde_dsi_execute_transfer(struct mcde_dsi *d,
+				     const struct mipi_dsi_msg *msg)
 {
-	struct mcde_dsi *d = host_to_mcde_dsi(host);
 	const u32 loop_delay_us = 10; /* us */
-	const u8 *tx = msg->tx_buf;
 	u32 loop_counter;
 	size_t txlen = msg->tx_len;
 	size_t rxlen = msg->rx_len;
+	int i;
 	u32 val;
 	int ret;
-	int i;
-
-	if (txlen > 16) {
-		dev_err(d->dev,
-			"dunno how to write more than 16 bytes yet\n");
-		return -EIO;
-	}
-	if (rxlen > 4) {
-		dev_err(d->dev,
-			"dunno how to read more than 4 bytes yet\n");
-		return -EIO;
-	}
-
-	dev_dbg(d->dev,
-		"message to channel %d, write %zd bytes read %zd bytes\n",
-		msg->channel, txlen, rxlen);
-
-	/* Command "nature" */
-	if (MCDE_DSI_HOST_IS_READ(msg->type))
-		/* MCTL_MAIN_DATA_CTL already set up */
-		val = DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_NAT_READ;
-	else
-		val = DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_NAT_WRITE;
-	/*
-	 * More than 2 bytes will not fit in a single packet, so it's
-	 * time to set the "long not short" bit. One byte is used by
-	 * the MIPI DCS command leaving just one byte for the payload
-	 * in a short package.
-	 */
-	if (mipi_dsi_packet_format_is_long(msg->type))
-		val |= DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_LONGNOTSHORT;
-	val |= 0 << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_ID_SHIFT;
-	val |= txlen << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_SIZE_SHIFT;
-	val |= DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_LP_EN;
-	val |= msg->type << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_HEAD_SHIFT;
-	writel(val, d->regs + DSI_DIRECT_CMD_MAIN_SETTINGS);
-
-	/* MIPI DCS command is part of the data */
-	if (txlen > 0) {
-		val = 0;
-		for (i = 0; i < 4 && i < txlen; i++)
-			val |= tx[i] << (i * 8);
-	}
-	writel(val, d->regs + DSI_DIRECT_CMD_WRDAT0);
-	if (txlen > 4) {
-		val = 0;
-		for (i = 0; i < 4 && (i + 4) < txlen; i++)
-			val |= tx[i + 4] << (i * 8);
-		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT1);
-	}
-	if (txlen > 8) {
-		val = 0;
-		for (i = 0; i < 4 && (i + 8) < txlen; i++)
-			val |= tx[i + 8] << (i * 8);
-		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT2);
-	}
-	if (txlen > 12) {
-		val = 0;
-		for (i = 0; i < 4 && (i + 12) < txlen; i++)
-			val |= tx[i + 12] << (i * 8);
-		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT3);
-	}
 
 	writel(~0, d->regs + DSI_DIRECT_CMD_STS_CLR);
 	writel(~0, d->regs + DSI_CMD_MODE_STS_CLR);
@@ -297,6 +234,7 @@ static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
 			usleep_range(loop_delay_us, (loop_delay_us * 3) / 2);
 		if (!loop_counter) {
 			dev_err(d->dev, "DSI read timeout!\n");
+			/* Set exit code and retry */
 			return -ETIME;
 		}
 	} else {
@@ -307,6 +245,7 @@ static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
 			usleep_range(loop_delay_us, (loop_delay_us * 3) / 2);
 
 		if (!loop_counter) {
+			/* Set exit code and retry */
 			dev_err(d->dev, "DSI write timeout!\n");
 			return -ETIME;
 		}
@@ -348,6 +287,93 @@ static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
 		ret = rdsz;
 	}
 
+	/* Successful transmission */
+	return ret;
+}
+
+static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
+				      const struct mipi_dsi_msg *msg)
+{
+	struct mcde_dsi *d = host_to_mcde_dsi(host);
+	const u8 *tx = msg->tx_buf;
+	size_t txlen = msg->tx_len;
+	size_t rxlen = msg->rx_len;
+	unsigned int retries = 0;
+	u32 val;
+	int ret;
+	int i;
+
+	if (txlen > 16) {
+		dev_err(d->dev,
+			"dunno how to write more than 16 bytes yet\n");
+		return -EIO;
+	}
+	if (rxlen > 4) {
+		dev_err(d->dev,
+			"dunno how to read more than 4 bytes yet\n");
+		return -EIO;
+	}
+
+	dev_dbg(d->dev,
+		"message to channel %d, write %zd bytes read %zd bytes\n",
+		msg->channel, txlen, rxlen);
+
+	/* Command "nature" */
+	if (MCDE_DSI_HOST_IS_READ(msg->type))
+		/* MCTL_MAIN_DATA_CTL already set up */
+		val = DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_NAT_READ;
+	else
+		val = DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_NAT_WRITE;
+	/*
+	 * More than 2 bytes will not fit in a single packet, so it's
+	 * time to set the "long not short" bit. One byte is used by
+	 * the MIPI DCS command leaving just one byte for the payload
+	 * in a short package.
+	 */
+	if (mipi_dsi_packet_format_is_long(msg->type))
+		val |= DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_LONGNOTSHORT;
+	val |= 0 << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_ID_SHIFT;
+	val |= txlen << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_SIZE_SHIFT;
+	val |= DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_LP_EN;
+	val |= msg->type << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_HEAD_SHIFT;
+	writel(val, d->regs + DSI_DIRECT_CMD_MAIN_SETTINGS);
+
+	/* MIPI DCS command is part of the data */
+	if (txlen > 0) {
+		val = 0;
+		for (i = 0; i < 4 && i < txlen; i++)
+			val |= tx[i] << (i * 8);
+	}
+	writel(val, d->regs + DSI_DIRECT_CMD_WRDAT0);
+	if (txlen > 4) {
+		val = 0;
+		for (i = 0; i < 4 && (i + 4) < txlen; i++)
+			val |= tx[i + 4] << (i * 8);
+		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT1);
+	}
+	if (txlen > 8) {
+		val = 0;
+		for (i = 0; i < 4 && (i + 8) < txlen; i++)
+			val |= tx[i + 8] << (i * 8);
+		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT2);
+	}
+	if (txlen > 12) {
+		val = 0;
+		for (i = 0; i < 4 && (i + 12) < txlen; i++)
+			val |= tx[i + 12] << (i * 8);
+		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT3);
+	}
+
+	while (retries < 3) {
+		ret = mcde_dsi_execute_transfer(d, msg);
+		if (ret >= 0)
+			break;
+		retries++;
+	}
+	if (ret < 0 && retries)
+		dev_err(d->dev, "gave up after %d retries\n", retries);
+
+	/* Clear any errors */
 	writel(~0, d->regs + DSI_DIRECT_CMD_STS_CLR);
 	writel(~0, d->regs + DSI_CMD_MODE_STS_CLR);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
