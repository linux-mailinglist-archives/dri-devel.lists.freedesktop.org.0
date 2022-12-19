Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1724D651F00
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C650410E389;
	Tue, 20 Dec 2022 10:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFB210E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 09:02:52 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id qk9so19870552ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 01:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lqYmIYoxTMMpoYQgw16ovQhh+oEOozpYMDvGaahlUYc=;
 b=TQKO3zLxYXBYDTiW46AltPoen3RSbIyB8k2VaIuFnkph0BiNvBuGnifXGOY+zKrLEI
 LO5sFtmIdDq2PxEMYgnOvt2kONxeu0CuvZRF7RG/Gb6oTqzzUuJb9rGcEoDCqV3AfH8D
 qAURFDAeigb5FUW7znBFd1NHo9RBqP5xErBkXZNwvBgtXINDIsMZb8RgnpocJwD+jkf2
 VUdQamL9R5duw9muX5u3+cYEnVdypu8N/js/a0YoywML0zu71Y0/HOQnRBi/T3dGWZ2F
 Bj5NawWiidI5fAUlI1sNlIVVeHkSlVpIpZHKEllff2+QyHvAPo0tSDNC02X/hcvuvfUF
 NETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lqYmIYoxTMMpoYQgw16ovQhh+oEOozpYMDvGaahlUYc=;
 b=aWk2hJIaxfBqYyHAFZioY+hFIsB8j4aLrvvwx4mcXCThstOm9eG/bupsQez69NaKZO
 6l8K1VlhWe+IHHnTgpUlZ9oTpXePYWQ+dVfPQV0aSm0XQFhs8iTGNLhUUmCSRivRRTBV
 XZZPQn9JLMtgnLMt8Qv0F3Nx1bDC+WIW0MH8Q3VrOujdS1D+EyLsg5FusGPd+//uvazj
 XVgLZtk81gDsvTeone6ttZpaBCkSLPlHbkGQzJnu0aawFNJ9aAdU4+AvsBa8o43ZSh9B
 fgTKFji/nKfPsL2Ko+WMS/d0v/ZOyDAYu2sdwJpKoaXhwCR4gt4w4d2ceqKageS/rUOb
 lpWQ==
X-Gm-Message-State: ANoB5plA+g8tOOh8ZAniQCkNEydokdVzn3D1m4B1aZaw3ZeUVYfAD6gN
 FlIKX2uMvI7cpcF8j0TiR2Vagg==
X-Google-Smtp-Source: AA0mqf4NSk7Yw/HcS1h8rMvyHtywLl/r5oAAdXCCDdnKAMEYPX1/1IxBA282Q7E2z2acv/RmzDLBFw==
X-Received: by 2002:a17:907:910b:b0:7c1:1c5:c7cd with SMTP id
 p11-20020a170907910b00b007c101c5c7cdmr28846533ejq.5.1671440571173; 
 Mon, 19 Dec 2022 01:02:51 -0800 (PST)
Received: from [127.0.1.1] ([2001:b07:5d39:f336:a0ba:cfa5:2107:c2c4])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170906b10b00b00781dbdb292asm4082721ejy.155.2022.12.19.01.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 01:02:50 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 19 Dec 2022 10:02:38 +0100
Subject: [PATCH v4 2/2] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221116-s905x_spi_ili9486-v4-2-f86b4463b9e4@baylibre.com>
References: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Carlo Caione <ccaione@baylibre.com>
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
transfer size to the maximum allowed by the SPI controller.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 8bf0dca0b05d..6f03531175bd 100644
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
