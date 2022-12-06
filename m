Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4816A645533
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 09:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC9B10E374;
	Wed,  7 Dec 2022 08:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB3810E302
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 08:34:11 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e13so19215057edj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 00:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6+091FGCQ4rhzDvkB3AYfkA+OM7BJLCJxULLW5x6V0Y=;
 b=CMulTRGHBt8iZM34cI32BL92j4m/IGpI6bWJ+J8LmB3Bk9XlO8T2iVFu0JkuBVf5zj
 8Wr0rXr9XVkORpLTFHEUXRXlrgQds3a+N8OJcv8pyp5UWyhX043kgJV1IYaeEM1if5ls
 fcn1Xmbm29SFIoT4NocFl/j01Dm8x/9dT3pH/70rdtr7Eiq5IyhhHdZgMX3hHJEvfaOw
 uXWTFUo5QnhQaRm3Q8kBsLYm1Rz7Cg/AknnwM7TowRNpVAl9Bh3+7ivfKDgQHnnwTSgu
 669PfAVJ5wR334uRsypLCsWVOL5aYLZS1wPHtmj3LtsaCbwak5Q8yk1GI3C4z0kIfkyk
 FLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+091FGCQ4rhzDvkB3AYfkA+OM7BJLCJxULLW5x6V0Y=;
 b=4QqSIYgks8WNSlvWgjXcY8n+zPEQR84fDbQuYKietmzx7KaODl1cyEl0VVdksnyKJV
 3EP0+4nQ+5ptaEmkXTrO40V2BYyR08ql4MYQ/niX2/u6FWK3JZ9pqH9BzQsbOt+O4xxM
 GMoDmvSXpshs/eGE0BvQCyGAxuFf8ABE/lqMrD8va+tZTWH4bV2vVPrJilVoTEJyxUjx
 u7mWnjYRY03F7zCSYgKnW8dYPdZihHJfyCBlOr95S2BE5oWjUZmMZpZ3mrJzOfSWn8vC
 JHmBVDYo2IEvGa/RmwC6dHnjdNwBprqrzQ4uVeu2gYKZ2Pm5iIQjrSlr/Qr94UFSOrlq
 E9Vg==
X-Gm-Message-State: ANoB5pn5Fk60OOhV7JmOVJvdecQie0KJzzCwqhO75BKcgcOuvzkZR40R
 QNW/EadD3b18RVyeKRUCSL5y2w==
X-Google-Smtp-Source: AA0mqf7xShBddJAwFF9w5fCy8BkqKLZeSqJlo3zmXsOR6j9nvha3NC93Pz85cGp3Hed4/H9Fmoo1IQ==
X-Received: by 2002:a05:6402:4516:b0:467:b88c:f3af with SMTP id
 ez22-20020a056402451600b00467b88cf3afmr1991786edb.24.1670315650207; 
 Tue, 06 Dec 2022 00:34:10 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2017:359e:18ef:1c49])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b0078d9b967962sm7019390eja.65.2022.12.06.00.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 00:34:09 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 06 Dec 2022 09:34:02 +0100
Subject: [PATCH v3 2/3] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221116-s905x_spi_ili9486-v3-2-59c6b58cbfe3@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Wed, 07 Dec 2022 08:08:47 +0000
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
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
index 2ca7c59771f3..14a9e6ad2d15 100644
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
