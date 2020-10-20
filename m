Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF92948B8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524326E9AC;
	Wed, 21 Oct 2020 07:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E64D6E02D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 22:15:13 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id d28so103880ote.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qgb/6FQ5Y+5ks3gJUSbI0OvSC559NlxqqVqZk7W8uig=;
 b=uNfpqwWZTEG9jrnDv2yMwFvts2SeACpm4RaAGrMNM27LXCj16ykn3WxaPn/YyuJ1jl
 UKWNwa/WOMeMkK/PiT0CesDhjV8GryPrl+vMpvcqDWctvZ89EA7xNlvBrOb0WphNGtZ1
 JR6YIpnujy0WRYKxi/zSsai1kJdGJ5HHmGuk7H/dWwdj0gNJFmLJKveYdoYoQa8F6JrL
 iUvp8jzDDDZ0NGBZ3gKmNRM9G60zxOGYLocpLuuK8KUBKnjmZXwleNYKvB3Phr/vtpkm
 ypHTaZzSumnz8IC4ap3RywWe4SYkhKbs7iZHvO51xkkno0wHcYU7m0DtLjh8ORc47WNn
 gb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qgb/6FQ5Y+5ks3gJUSbI0OvSC559NlxqqVqZk7W8uig=;
 b=Ww5eEAYu7KWI0SXf8FQKKG9juUCywADgjBOCtSS9vLQuFR1ohpeD/V6ZjO8E1hZofq
 +GOfnGIT2RFfnwVUjRMeHeJ0PiuhxqfS99qAY31NUeAxuXwrTNiKfG6NgClmiH70I1SM
 QZvOfR0E5OlXlKWl1tKahT3QP5NV/3c1nyGh9HS4pQ5kXUZ/Vh6/k51pnWA7S2T5QyfG
 tmnfsyav9sWNOq9/4+3NeMZKvnnJqNUe35Lwovpsyq5TocJ2YRwEZK9yqp5FisVOhta6
 VUbjczKS7flyIeWx3HOWlyTqtx4DdoBOd6jcYi6e0/p9I033D8MTAtWhaRVRaBV+f6Pw
 TzRA==
X-Gm-Message-State: AOAM533zYCfTDYzJhE9ykWRpPOkMOzc47samsOvOHqQKfLu1EzgPLEqZ
 2nnW5ETLOXJwQCDqwG1Wj/zWN/lazf+PnA==
X-Google-Smtp-Source: ABdhPJzMVl1/tXVTDSiL+yi4uPPZsH0uG/LZGzfJtSt79m3oerf91yhSp/3Z8o1/prH6Ai4t3uCepA==
X-Received: by 2002:a05:6830:2434:: with SMTP id
 k20mr358136ots.205.1603232112128; 
 Tue, 20 Oct 2020 15:15:12 -0700 (PDT)
Received: from nuclearis2-1.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id 81sm57005oti.79.2020.10.20.15.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 15:15:11 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] drm/bridge: sii902x: Enable I/O and core VCC supplies
 if present
Date: Tue, 20 Oct 2020 17:14:58 -0500
Message-Id: <20201020221501.260025-2-mr.nuke.me@gmail.com>
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
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, sam@ravnborg.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the SII9022, the IOVCC and CVCC12 supplies must reach the correct
voltage before the reset sequence is initiated. On most boards, this
assumption is true at boot-up, so initialization succeeds.

However, when we try to initialize the chip with incorrect supply
voltages, it will not respond to I2C requests. sii902x_probe() fails
with -ENXIO.

To resolve this, look for the "iovcc" and "cvcc12" regulators, and
make sure they are enabled before starting the reset sequence. If
these supplies are not available in devicetree, then they will default
to dummy-regulator. In that case everything will work like before.

This was observed on a STM32MP157C-DK2 booting in u-boot falcon mode.
On this board, the supplies would be set by the second stage
bootloader, which does not run in falcon mode.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
  * Fix return code after regulator_enable(sii902x->iovcc) fails (Fabio Estevam)
  * Use dev_err_probe() instead of dev_err() where appropriate (Sam Ravnborg)

Changes since v2:
  * Eliminate prototype for static functionn sii902x_init (Sam Ravnborg)
  * Bundled supplies under regulator_bulk_get/enable/disable()
  
 drivers/gpu/drm/bridge/sii902x.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index f78c17f49887..5bab51a6b55c 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/clk.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -168,6 +169,7 @@ struct sii902x {
 	struct drm_connector connector;
 	struct gpio_desc *reset_gpio;
 	struct i2c_mux_core *i2cmux;
+	struct regulator_bulk_data supplies[2];
 	/*
 	 * Mutex protects audio and video functions from interfering
 	 * each other, by keeping their i2c command sequences atomic.
@@ -1049,7 +1051,26 @@ static int sii902x_probe(struct i2c_client *client,
 
 	mutex_init(&sii902x->mutex);
 
+	sii902x->supplies[0].supply = "iovcc";
+	sii902x->supplies[1].supply = "cvcc12";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(sii902x->supplies),
+				      sii902x->supplies);
+	if (ret < 0)
+		return ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(sii902x->supplies),
+				    sii902x->supplies);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to enable supplies");
+		return ret;
+	}
+
 	ret = sii902x_init(sii902x);
+	if (ret < 0) {
+		regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
+					sii902x->supplies);
+	}
+
 	return ret;
 }
 
@@ -1060,6 +1081,8 @@ static int sii902x_remove(struct i2c_client *client)
 
 	i2c_mux_del_adapters(sii902x->i2cmux);
 	drm_bridge_remove(&sii902x->bridge);
+	regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
+				sii902x->supplies);
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
