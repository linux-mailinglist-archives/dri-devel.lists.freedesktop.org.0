Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1754D6324A2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 15:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B519910E2CF;
	Mon, 21 Nov 2022 14:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBB610E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 09:42:43 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ud5so27162000ejc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 01:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Hu5U86ige5HyMDl6UUjo7RBdCuH6co9yADRt72Y/8MY=;
 b=hA9fcWmto4ybP9K5GSKv+Pfqt4s/xOpxBEdTWZGxoXk6kt2zLckX/Yk82YP6m+DRQH
 sIF9hMmmAMqBUceUi3M1Z/0jgaKEQAGWC0QiBrGojCm9mqwLy8C3CThNtvEkPyHQJcjW
 4xKF6ACJiKqPomEiYRKmMCyDNJSNXrdq9bFaNJbmXHgXIeBGD5jZ5z4ORQ7jgp1Kw6VI
 /b19SKnEYkxN5X1LFi3izAJW23uJ9NO5iJuVGGA2PTfj9oAlSXXN9j4ewaG37Vjeic6s
 99UtizGD47CZl7b9UFTfW2JeHkMp208v3pRhlTmm6YlX3PeDAT60zsSPk5xRzaFPIcHj
 d3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hu5U86ige5HyMDl6UUjo7RBdCuH6co9yADRt72Y/8MY=;
 b=zREcPu/Z4yVDHYT0yH6q539G8jX9h33Oss5XbnnxQ2WfoZxtyDKjAZzJCpWnGK2LOU
 5bRvtdCzIoIVBxHhMMdkfEcrywPTjObJ1SWnDi0K4V7tUxsh1gZTadcsb/WH6YZImS31
 LsGlcCfuhh7DBzFLwe9vtGdFGVWLSRNZe4BcSQqrkQjRnzOrRA8n0tJKdAAwLK2xwFYI
 w3ZObLxv0co3n1ez4uYwUTH9B7WaYlpDZ7pqacryhIKMRnUA30D71OKGqDussHW7u7zf
 GuYdxnQsYCD51aYWZMGYwtloDnDGrSO0s1yLprdNZi1s8BBdnkqUdAtMLXSMG8GKwEg+
 Ieqg==
X-Gm-Message-State: ANoB5pl2RtCbBaS40hYuMi/A2ib3iQ3nflBmPF5KAc1AeY+XknxQG9R6
 abeTG0/zxD1qjpfPjGTPRijrx4MIhhegA+1+
X-Google-Smtp-Source: AA0mqf7R80CBcgut7WKoqa2UyoJjTe+iSCNXbGx9E8tOfUa5mUdWN2uLlo6XvJ+69OMC/vUzYl5ZwQ==
X-Received: by 2002:a17:907:986b:b0:7ad:b7c2:a2f7 with SMTP id
 ko11-20020a170907986b00b007adb7c2a2f7mr14848367ejc.227.1669023761673; 
 Mon, 21 Nov 2022 01:42:41 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:c97f:bc5d:82d3:1a3b])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a17090632cb00b0078d3f96d293sm4822240ejk.30.2022.11.21.01.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 01:42:41 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 21 Nov 2022 10:42:31 +0100
Subject: [PATCH v2 2/2] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221116-s905x_spi_ili9486-v2-2-084c6e3cd930@baylibre.com>
References: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Mon, 21 Nov 2022 14:01:27 +0000
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
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pixel data for the ILI9486 is always 16-bits wide and it must be
sent over the SPI bus. When the controller is only able to deal with
8-bit transfers, this 16-bits data needs to be swapped before the
sending to account for the big endian bus, this is on the contrary not
needed when the SPI controller already supports 16-bits transfers.

The decision about swapping the pixel data or not is taken in the MIPI
DBI code by probing the controller capabilities: if the controller only
suppors 8-bit transfers the data is swapped, otherwise it is not.

This swapping/non-swapping is relying on the assumption that when the
controller does support 16-bit transactions then the data is sent
unswapped in 16-bits-per-word over SPI.

The problem with the ILI9486 driver is that it is forcing 8-bit
transactions also for controllers supporting 16-bits, violating the
assumption and corrupting the pixel data.

Align the driver to what is done in the MIPI DBI code by adjusting the
tranfer size to the maximum allowed by the SPI controller.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index bd37dfe8dd05..4d80a413338f 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -43,6 +43,7 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
 			     size_t num)
 {
 	struct spi_device *spi = mipi->spi;
+	unsigned int bpw = 8;
 	void *data = par;
 	u32 speed_hz;
 	int i, ret;
@@ -56,8 +57,6 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
 	 * The displays are Raspberry Pi HATs and connected to the 8-bit only
 	 * SPI controller, so 16-bit command and parameters need byte swapping
 	 * before being transferred as 8-bit on the big endian SPI bus.
-	 * Pixel data bytes have already been swapped before this function is
-	 * called.
 	 */
 	buf[0] = cpu_to_be16(*cmd);
 	gpiod_set_value_cansleep(mipi->dc, 0);
@@ -71,12 +70,18 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
 		for (i = 0; i < num; i++)
 			buf[i] = cpu_to_be16(par[i]);
 		num *= 2;
-		speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
 		data = buf;
 	}
 
+	/*
+	 * Check whether pixel data bytes needs to be swapped or not
+	 */
+	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && !mipi->swap_bytes)
+		bpw = 16;
+
 	gpiod_set_value_cansleep(mipi->dc, 1);
-	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, data, num);
+	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, data, num);
  free:
 	kfree(buf);
 

-- 
b4 0.10.1
