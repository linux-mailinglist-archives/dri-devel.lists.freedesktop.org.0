Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8111827A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EB16E82E;
	Tue, 10 Dec 2019 08:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C445B6E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:51:50 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id s18so7354872pfd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uaDYqsyc1Amfj+rSgV5LdqRPEszOSqeoO5bxQF6wI/8=;
 b=mgRkhidWIwQrXgZ+53Q3ES0onwYvT97F/zSJomcMLUsE3rX1QvgnpHcPZGSNwySnyL
 v4fWp3ofa4Ls1qwhijcJQIQeRtVEa7DifKsIRjyLmsfGNCv6gf6Ntb/rBTM1y39ufl4B
 lHTGSCi6gahnJsCCQeNaViCA8QJnrfYvVWwbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uaDYqsyc1Amfj+rSgV5LdqRPEszOSqeoO5bxQF6wI/8=;
 b=T81F/S6Wx8PO8jdW8fk86ex8RO5jM3jSjUqYMY2j3CFO9walX3fMHsgr/MXBGtonEb
 v4iCoCBLQRO+CMPDWLRdoBg29+6Zb/r4pB5oElW8gvIaxnFPx33Qfk+ATtEDBDWQKpgm
 io9Vr7L/MCsReiSgLytNjOl5hqIT5jT5rMGGra5dAi0cr3InTxcYjl/WD1RyOeU0IFkl
 6E87xia9+EPDmzq52oKiI/njF0m+HidnYKiAkRY+om7NLyGHgfU7FpZbu7HzfS+Ol0xS
 aZyeYrJCEYONFcmZeYHFP/8bsrQVvY69a/ZF6giY7vDKhTsP6W6C4FrIBhKyacGxAC3m
 Hafw==
X-Gm-Message-State: APjAAAXDKlTXivDTZwhO3Eer/GXxM3to1QqZRNhpQfoqDFG0yCwfBbAq
 fg1b+R+HJ0nNT4nhzzkS5LPlX6R5bz4/9A==
X-Google-Smtp-Source: APXvYqzAxcbhb9dq2bTBZndMkD6J3hhmRbSgWIiplaCgX/EMjF8TeQ17Ny2l9Uhse5276EJgApSiUA==
X-Received: by 2002:a65:5c0a:: with SMTP id u10mr18950072pgr.258.1575903110084; 
 Mon, 09 Dec 2019 06:51:50 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id k16sm29143119pfh.97.2019.12.09.06.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:51:49 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 4/4] drm: bridge: anx7688: Support bypass GPIO feature
Date: Mon,  9 Dec 2019 22:50:16 +0800
Message-Id: <20191209145016.227784-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191209145016.227784-1-hsinyi@chromium.org>
References: <20191209145016.227784-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support optional feature: bypass GPIO.

Get GPIO status in irq handler. If GPIO is active, mode_fixup would be
bypassed.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/analogix-anx7688.c | 57 +++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix-anx7688.c
index 5a3a2251c1c5..1d09db2cf8e9 100644
--- a/drivers/gpu/drm/bridge/analogix-anx7688.c
+++ b/drivers/gpu/drm/bridge/analogix-anx7688.c
@@ -5,11 +5,16 @@
  * Copyright 2016 Google LLC
  */
 
+#include <linux/gpio.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_probe_helper.h>
 
 /* Register addresses */
 #define VENDOR_ID_REG 0x00
@@ -31,6 +36,9 @@ struct anx7688 {
 	struct i2c_client *client;
 	struct regmap *regmap;
 
+	struct gpio_desc *gpiod_bypass;
+	int bypass;
+
 	bool filter;
 };
 
@@ -49,6 +57,10 @@ static bool anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
 	int totalbw, requiredbw;
 	int ret;
 
+	/* bypass anx mode fixup */
+	if (anx7688->bypass)
+		return true;
+
 	if (!anx7688->filter)
 		return true;
 
@@ -93,6 +105,19 @@ static const struct drm_bridge_funcs anx7688_bridge_funcs = {
 	.mode_fixup	= anx7688_bridge_mode_fixup,
 };
 
+static irqreturn_t gpio_display_mux_det_threaded_handler(int unused, void *data)
+{
+	struct anx7688 *anx7688 = data;
+
+	anx7688->bypass = gpiod_get_value(anx7688->gpiod_bypass);
+	dev_dbg(&anx7688->client->dev, "Interrupt %d!\n", anx7688->bypass);
+
+	if (anx7688->bridge.dev)
+		drm_kms_helper_hotplug_event(anx7688->bridge.dev);
+
+	return IRQ_HANDLED;
+}
+
 static const struct regmap_config anx7688_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -156,6 +181,38 @@ static int anx7688_i2c_probe(struct i2c_client *client,
 			 buffer[0], buffer[1]);
 	}
 
+	/* Optional bypass-gpios */
+	anx7688->gpiod_bypass = devm_gpiod_get_optional(dev, "bypass",
+							GPIOD_IN);
+	if (IS_ERR(anx7688->gpiod_bypass)) {
+		ret = PTR_ERR(anx7688->gpiod_bypass);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "bypass-gpios assigned failed\n");
+		return ret;
+	}
+	if (anx7688->gpiod_bypass) {
+		int irq;
+
+		irq = gpiod_to_irq(anx7688->gpiod_bypass);
+		if (irq < 0) {
+			dev_err(dev, "Failed to get output irq %d\n", irq);
+			return -ENODEV;
+		}
+
+		anx7688->bypass = gpiod_get_value(anx7688->gpiod_bypass);
+
+		ret = devm_request_threaded_irq(dev, irq, NULL,
+				gpio_display_mux_det_threaded_handler,
+				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
+				IRQF_ONESHOT,
+				"gpio-display-mux-det", anx7688);
+		if (ret) {
+			dev_err(dev,
+				"Failed to request MUX_DET threaded irq\n");
+			return ret;
+		}
+	}
+
 	anx7688->bridge.funcs = &anx7688_bridge_funcs;
 	drm_bridge_add(&anx7688->bridge);
 
-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
