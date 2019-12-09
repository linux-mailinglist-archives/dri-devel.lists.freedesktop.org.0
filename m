Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20E6118272
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37EC89CD9;
	Tue, 10 Dec 2019 08:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E20C6E43F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 12:20:48 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x185so7156296pfc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 04:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uaDYqsyc1Amfj+rSgV5LdqRPEszOSqeoO5bxQF6wI/8=;
 b=HLgV18T+ucI2mKJgCw3vbomZ0tuzLu/7/QH2PtjQy299n5JyYS+Q6PHKNLr7OTXImX
 QY6tia+bJb7iRkFFxN7yJrcvlfR9Li81a98kc7ViNQ0V8S4AXznyoEG0HYaXQGQt4aT5
 PZHiH6nFw3wYdCuYq6T8rCEZBXIUJf9UGdjZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uaDYqsyc1Amfj+rSgV5LdqRPEszOSqeoO5bxQF6wI/8=;
 b=HZeHhWCbbDvDFJfqwAbrdi6c6ZDOIsNTt6U25ZAjNX/8wzUR1F8/N5MJhnw3d1r8+P
 8imfM3AIB46KlJnQiMPiPKj9kUB+8SVJBp19WgEIr5rZB+Dowqj9mQAO46ef1kdlY9Rb
 9lRy82f5aiqa8xwFsO1ObXvhgXumO+FFNykBHcU/lalRQCXxTwfFYB5I+Ig0GlgCBryG
 wavk6iYQMyc6SpdWtXuq3/IR3TGflVGD3/PdoRPhVJlzvjJ1jLcHBf1w6u54Bs4OpdWj
 ALgvtlQQZY6kqUB1gKs2rDtcawtA4dv2R6Y6gKB2b1XY9stxgEjRrJFNfhN0ssTINqsv
 fjAQ==
X-Gm-Message-State: APjAAAVbGSVICh6lXaOTJ4CE+xg3wXPvKviWxZqxon/o78Qv9KaElMYo
 cuJ7A3O69enymjQ70uhUSO7BVtSbP8ri9g==
X-Google-Smtp-Source: APXvYqy/lHJIWrfIzvI2UJaglWQA7earIp8Y3bMqEUk8egTypwDN5U4K852L6vRuGCM11q/C3vqrtQ==
X-Received: by 2002:a63:cd16:: with SMTP id i22mr19049999pgg.239.1575894047511; 
 Mon, 09 Dec 2019 04:20:47 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id p21sm26733813pfn.103.2019.12.09.04.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:20:47 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm: bridge: anx7688: Support bypass GPIO feature
Date: Mon,  9 Dec 2019 20:20:13 +0800
Message-Id: <20191209122013.178564-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191209122013.178564-1-hsinyi@chromium.org>
References: <20191209122013.178564-1-hsinyi@chromium.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>
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
