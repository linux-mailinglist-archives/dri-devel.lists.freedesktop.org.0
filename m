Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2E2948C1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B926F456;
	Wed, 21 Oct 2020 07:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBD36E02D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 22:15:10 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id s21so3846021oij.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+CpEO8YhmbVOZXzaRTTlPwKKMh8ff8K9DvXivuST1qc=;
 b=Wt1L2chonevKKt3UJIbVeNDb+bYA161TTXwmzFBs+lABdRQxknsdeHXkEp8yzzTZIo
 7BNOKfubqjn+jNKiQKJRRunBp/upoEvvKVgJN1wKvQz4hhFOHGRlHWdac3u+feevyYO+
 HBxKwu6edrm+woL8n6yvlIK3NlUYR8hxCZ1mipEe29n0GuBgNGbY3ozp63u0o/9Z368o
 K+sKlL+1cVabaySLHgmx5o+KI8uQTqH+zjen16e2qtxpMGkv2bWkStEMytU7SjKe+rvM
 O7ny6I8iCeSA+ppkNZEJYXMmYStnyQWUtdt4YpiGaetODkOHIBvVr4nysBkiilU0ALLQ
 t28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+CpEO8YhmbVOZXzaRTTlPwKKMh8ff8K9DvXivuST1qc=;
 b=hqVvKXjoUV4IiqmuBXOPhkbSSmSyhY+B9QhlBC43SJlRFXEVQ6EY2L4erchs4U6NX2
 cf9J/8tMtmwnUFdrbRJjJJQslYAc+kaoR8iv8ucRktTDV8hbHfvJxDbr+pSocxdIlGQc
 WoDiMxvkipKelPJZXMjMy/dw1miwPP9mbs2/3b/uE+vbeurdXRpNImPmOTw1MWwZlzQB
 uiTkDfaFDAN8TS3XvvX+BVCuRn77PGathLREME1Nk+HXyq5kib4xqjuOG5EnFBdoVe94
 RVHNGukY9H6oy/E4zpXcuTcJBmCupj+tapa+7mmxHsBKUhXNy2lbdMW6GrZATviJ8tuJ
 sSiw==
X-Gm-Message-State: AOAM531ELwEo8mhdekHLskHxc/r/RxYxC8zEEua440Du9uXjaDApcZmh
 dLJ+c2p+G5BNS2kFdxpuL4uz+yiCoodeKA==
X-Google-Smtp-Source: ABdhPJxfNRSrioVTPpQ0lhQURF8C6l5m0Fewl/pKBJDVDbUIqIKC5y3LfPoelGxitYrmKAMxp/NY4g==
X-Received: by 2002:aca:1105:: with SMTP id 5mr156072oir.46.1603232109349;
 Tue, 20 Oct 2020 15:15:09 -0700 (PDT)
Received: from nuclearis2-1.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id 81sm57005oti.79.2020.10.20.15.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 15:15:08 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] drm/bridge: sii902x: Refactor init code into separate
 function
Date: Tue, 20 Oct 2020 17:14:57 -0500
Message-Id: <20201020221501.260025-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200928173056.1674274-1-mr.nuke.me@gmail.com>
References: <20200928173056.1674274-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 sam@ravnborg.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Separate the hardware initialization code from setting up the data
structures and parsing the device tree. The purpose of this change is
to provide a single exit point and avoid a waterfall of 'goto's in
the subsequent patch.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1/and v2:
  * Separated this from main patch to better show diff

 drivers/gpu/drm/bridge/sii902x.c | 77 ++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 33fd33f953ec..f78c17f49887 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -954,41 +954,13 @@ static const struct drm_bridge_timings default_sii902x_timings = {
 		 | DRM_BUS_FLAG_DE_HIGH,
 };
 
-static int sii902x_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int sii902x_init(struct sii902x *sii902x)
 {
-	struct device *dev = &client->dev;
+	struct device *dev = &sii902x->i2c->dev;
 	unsigned int status = 0;
-	struct sii902x *sii902x;
 	u8 chipid[4];
 	int ret;
 
-	ret = i2c_check_functionality(client->adapter,
-				      I2C_FUNC_SMBUS_BYTE_DATA);
-	if (!ret) {
-		dev_err(dev, "I2C adapter not suitable\n");
-		return -EIO;
-	}
-
-	sii902x = devm_kzalloc(dev, sizeof(*sii902x), GFP_KERNEL);
-	if (!sii902x)
-		return -ENOMEM;
-
-	sii902x->i2c = client;
-	sii902x->regmap = devm_regmap_init_i2c(client, &sii902x_regmap_config);
-	if (IS_ERR(sii902x->regmap))
-		return PTR_ERR(sii902x->regmap);
-
-	sii902x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						      GPIOD_OUT_LOW);
-	if (IS_ERR(sii902x->reset_gpio)) {
-		dev_err(dev, "Failed to retrieve/request reset gpio: %ld\n",
-			PTR_ERR(sii902x->reset_gpio));
-		return PTR_ERR(sii902x->reset_gpio);
-	}
-
-	mutex_init(&sii902x->mutex);
-
 	sii902x_reset(sii902x);
 
 	ret = regmap_write(sii902x->regmap, SII902X_REG_TPI_RQB, 0x0);
@@ -1012,11 +984,11 @@ static int sii902x_probe(struct i2c_client *client,
 	regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
 	regmap_write(sii902x->regmap, SII902X_INT_STATUS, status);
 
-	if (client->irq > 0) {
+	if (sii902x->i2c->irq > 0) {
 		regmap_write(sii902x->regmap, SII902X_INT_ENABLE,
 			     SII902X_HOTPLUG_EVENT);
 
-		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+		ret = devm_request_threaded_irq(dev, sii902x->i2c->irq, NULL,
 						sii902x_interrupt,
 						IRQF_ONESHOT, dev_name(dev),
 						sii902x);
@@ -1031,9 +1003,9 @@ static int sii902x_probe(struct i2c_client *client,
 
 	sii902x_audio_codec_init(sii902x, dev);
 
-	i2c_set_clientdata(client, sii902x);
+	i2c_set_clientdata(sii902x->i2c, sii902x);
 
-	sii902x->i2cmux = i2c_mux_alloc(client->adapter, dev,
+	sii902x->i2cmux = i2c_mux_alloc(sii902x->i2c->adapter, dev,
 					1, 0, I2C_MUX_GATE,
 					sii902x_i2c_bypass_select,
 					sii902x_i2c_bypass_deselect);
@@ -1044,6 +1016,43 @@ static int sii902x_probe(struct i2c_client *client,
 	return i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
 }
 
+static int sii902x_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct sii902x *sii902x;
+	int ret;
+
+	ret = i2c_check_functionality(client->adapter,
+				      I2C_FUNC_SMBUS_BYTE_DATA);
+	if (!ret) {
+		dev_err(dev, "I2C adapter not suitable\n");
+		return -EIO;
+	}
+
+	sii902x = devm_kzalloc(dev, sizeof(*sii902x), GFP_KERNEL);
+	if (!sii902x)
+		return -ENOMEM;
+
+	sii902x->i2c = client;
+	sii902x->regmap = devm_regmap_init_i2c(client, &sii902x_regmap_config);
+	if (IS_ERR(sii902x->regmap))
+		return PTR_ERR(sii902x->regmap);
+
+	sii902x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						      GPIOD_OUT_LOW);
+	if (IS_ERR(sii902x->reset_gpio)) {
+		dev_err(dev, "Failed to retrieve/request reset gpio: %ld\n",
+			PTR_ERR(sii902x->reset_gpio));
+		return PTR_ERR(sii902x->reset_gpio);
+	}
+
+	mutex_init(&sii902x->mutex);
+
+	ret = sii902x_init(sii902x);
+	return ret;
+}
+
 static int sii902x_remove(struct i2c_client *client)
 
 {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
