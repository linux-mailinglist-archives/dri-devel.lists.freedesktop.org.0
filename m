Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523062EA58
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 01:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C1510E1E7;
	Fri, 18 Nov 2022 00:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078CD10E576
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 08:47:56 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z20so54224edc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 00:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=idox2DWf9CfxY6np+xVajajSNgisazAtYo+m3/oXIzQ=;
 b=YJtoDwNevsDYE56TfvpY13pJKKdr1ptUtkThXpzJvzyqFNfQ0lQAYsHeD/G6ijoQb9
 FzNX3VDp0JST+f3q3q97kt/nU09VpZOu7LMruQ2aOWiPdjy515rP0ho3XAzk1xer9fUN
 oo8Xij8p06FD8ZWJk/LZaY9rS8uvkmH0Z1QGAUQbauZoRhXRKl8mkUxO/VfQ94d/bxDO
 0PA707ZmvAL0b7U1IDRpV2graHjHktcAA/oqFa82GZMPJbLgLQQ8+eIAE7kVfLldaMqZ
 ih7RbpltfyVp99rBOpxzOCYnMi64Up3c/VX8yVq0MmjyQIqG90pWGWBylHcJm+0gLN/P
 +P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idox2DWf9CfxY6np+xVajajSNgisazAtYo+m3/oXIzQ=;
 b=fWN7gfGUaEcr7dkPfKMeQooY0r7G/8c5/aNLw28HXoSVNqzylZsOEBuc59EnY2fqg9
 4Inc+v7EjOI5aK0YoYDhk9jexyQpJ4Z2yC+vIAdaC1QVu0FjyP7W/gJGkZD8c0tyAbAG
 SIAMjUei3rMkZajgSE8UcYy442EwDt6yy8zytaNnaIrwAmcsBGz+AyN1hvSoXHJC5j4y
 CH8lWC8JdguqAwNx4uYTt4vDqeh/7nwrV3/XrZNsIsxOHEuTMMV9v3xVGSyzDIvRbh4/
 kpU4jksb5K6OzVu4IDLywdSRy9v62IpVYUjy6xOHh3IHTp4Y3ykvHRytcGDTSqJpd2/x
 bXfw==
X-Gm-Message-State: ANoB5pne8Yrz/qpAzBVdG7GD2cJBcFxYCBXmhYLrBqWXJTnT6EzGr3el
 GQDlRd9kEkTyvjIsngA5oznBkA==
X-Google-Smtp-Source: AA0mqf4yWjrqIlKEjUvVEQZBYNp9Cyg1fui9YTk3qSoXBiIO38liYCs7aLKXOQNddd4uvH2WBxvUEA==
X-Received: by 2002:a05:6402:3707:b0:467:6847:83d3 with SMTP id
 ek7-20020a056402370700b00467684783d3mr1257987edb.247.1668674874355; 
 Thu, 17 Nov 2022 00:47:54 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a1709067b9600b0077205dd15basm77332ejo.66.2022.11.17.00.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 00:47:54 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 17 Nov 2022 09:47:41 +0100
Subject: [PATCH 3/3] spi: meson-spicc: Lower CS between bursts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Fri, 18 Nov 2022 00:32:52 +0000
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
Cc: Carlo Caione <ccaione@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some hardware (reproduced on S905X) when a large payload is
transmitted over SPI in bursts at the end of each burst, the clock line
briefly fluctuates creating spurious clock transitions that are being
recognised by the connected device as a genuine pulses, creating an
offset in the data being transmitted.

Lower the GPIO CS between bursts to avoid the clock being interpreted as
valid.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/spi/spi-meson-spicc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index d47f2623a60f..af8d74b53519 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -291,6 +291,10 @@ static inline void meson_spicc_setup_burst(struct meson_spicc_device *spicc)
 static irqreturn_t meson_spicc_irq(int irq, void *data)
 {
 	struct meson_spicc_device *spicc = (void *) data;
+	struct spi_device *spi_dev;
+
+	spi_dev = spicc->message->spi;
+	gpiod_set_value(spi_dev->cs_gpiod, 0);
 
 	writel_bits_relaxed(SPICC_TC, SPICC_TC, spicc->base + SPICC_STATREG);
 
@@ -309,6 +313,8 @@ static irqreturn_t meson_spicc_irq(int irq, void *data)
 	/* Setup burst */
 	meson_spicc_setup_burst(spicc);
 
+	gpiod_set_value(spi_dev->cs_gpiod, 1);
+
 	/* Start burst */
 	writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPICC_CONREG);
 

-- 
b4 0.10.1
