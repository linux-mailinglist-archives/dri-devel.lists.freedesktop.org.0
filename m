Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE40C0C3AE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631F810E361;
	Mon, 27 Oct 2025 08:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cskp2T6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201DD10E346
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:06:30 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-59303607a3aso2084770e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761552388; x=1762157188; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8az67etDCe+j6oAMVPHkMbmqmZXuNQBkA4UoBLW7ZLM=;
 b=cskp2T6CiMs9zzwKcbec7AhpUB0Z4P4hhpYeoFSpeib6SopqcPeUv0H3EnyLW5ONpV
 4QG/Lwa9N6xhhH/mujHO55ahnC3K2r1VNC1qIPsC/qb7RlseZa9CD+B/4weYa+RXb8q0
 UrV7E8u1rEdPTSbfO9B186IiXWqzGOV3gIxXCg+qCRvI2BFqluHj+zZw88wfNJh4wyG8
 Unzk55gfdffIY1fzEXE9PFPEXTmv0d9Z6NjZo8qJ/Hc36dLYTPG4/vIRlnyTD2UniwHN
 O7ImyvnJ0mAOQjruseO2JT+rKfKJZKI0PVbNR4PBuN7onf+ZsL8PhMFsgGsQXe93xbBh
 pIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761552388; x=1762157188;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8az67etDCe+j6oAMVPHkMbmqmZXuNQBkA4UoBLW7ZLM=;
 b=Ewmkz6Mp3Vr6bgjEf7+CTEjPBYDybe0t4ZB/4+eiI479mI+z6ngegDIvrazVntZvt3
 IzMpvw1nFbTaJhpbQM0RLFl1+TyrC6FuAFQWU/OThAw+2YIATbglhcbDEi44U+XS0zSC
 RI099GX9szMAkRrK7k1NGYGfx1pRWGkXOYpNwj980A389r6S4VIIKeapPj3g8nLOf6af
 T5yQvMWy2rzmTgjUPc6/eCpKVDPGqoN/7SDqll4HlhpD1Yua2yZtirCJtuKRh6d51jKB
 XZumqLg7GGwBBKdDHlL1Uz2SuXnxR0nagm1nn0h2nLQlOpwM4aisJWJN/VHxW/a+taWG
 PQPA==
X-Gm-Message-State: AOJu0YxeoYjRCRg7FuDr8n869dQ9JczhjQeXJKJJJCone2NjHprgqiDK
 EWTRyAtmjuj0Fvkiocb9hcfJkYhqOKr7fHx7KQi9lRSXq1wblJg7zMNI
X-Gm-Gg: ASbGncsnKXDxgiQqUKgLjQRzWX1rD/pmHBailjA/8WJr/gh15NRTEiy6tvJrSPzyZ8n
 7PPLS/4pD5iY6R6qZezk/DJZeSNHOX6RkGQJ3le6URi4RVW7NxS5DKqyKH4Q51uX5lCPwU7VEZt
 UQOubB12PcuKJC68jT4Gu4OI/Yqd0yKEEA4fHJxyl3qNCgwcTQazIh/CfOZVRvsg8BO8Sf7qkyw
 7/pF1xnzNQdRirukRbzKg5nwboCKfERnJrY8dYk74ir9EwUBhfGu9vJqy2E2XuusKE35h9tszXH
 wZR6ufjRaYiIDKtneSS27f3bDmNXBm6wF3sQECd4tRlAfp6wX8cDcMhpQf8/J6qr3KfVUxJLDhp
 sHEvxGiMHDWGTy0CDUh/8iZUQ5R8cwIWiNeH19PlcnvqHxlWsZF8yyo2K9hWXTVJoCLwI09uZbR
 3cQnff5GZahlriOMjN+uwXSCMOx8abTNJzSi6au+Pp5QL0
X-Google-Smtp-Source: AGHT+IFgGhZYl4/P0JPmEkwn6YhC0umUq0AKzrPz060axcPlibV51BIDoxu5l5KxvyefyI5wAhN+9w==
X-Received: by 2002:a05:6512:10cd:b0:592:faf7:2a0 with SMTP id
 2adb3069b0e04-592faf702dbmr2992667e87.33.1761552388214; 
 Mon, 27 Oct 2025 01:06:28 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41ce8sm2210689e87.6.2025.10.27.01.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 01:06:27 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 27 Oct 2025 09:05:44 +0100
Subject: [PATCH v2 4/6] drm/sitronix/st7571-i2c: make probe independent of
 hw interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251027-st7571-split-v2-4-8352fb278d21@gmail.com>
References: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
In-Reply-To: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10580;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=eJr8JxZpepkO+MxnlRNP4S+wzfkUycx9FXy9G5ycSU8=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo/yft9zKK8HA5Rvu6vWCYQInVcMNBZmq5jjOKn
 M7tGpWI4ZKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaP8n7QAKCRCIgE5vWV1S
 MtaFD/4uP/eOzYkCfSPP273o7sXPRboi6yrUg4eUByBwLb4RUCTvRJNigy//zaOMtd30dzjt53Z
 uyQZQ3JoUlFZMBDMpv0IfeDjv3hxdEOWYkkG9Ru9mF5tN/JzG9bK8RGPVBJtQT9a57bzuw4bdH/
 BF3zuTeb7SJeBuEFlYIOjy5z6J2lVzsw3QyEw2FPIP9/T0BS/aXkEDFO5CiUHMRijaDraxqOZb4
 au7blhuqius/S+9JGZZM4ooEp8RNqurx+5p2gVu+7DVw2veaHz1B+xzs3ARwCPDGhtf4o0PCVpA
 wiPSDohIqKW3q/bO/77ppswnJwWYDR73Z2+hshHkUXptnskrWv+kbNFlpKUBXkVC/PhAWr+1zUl
 bXxvaCugXaF9nNL+yZY68GxeITw2X0w0av2d/vWuFwIl62RopH+H18ejjkeTUXEH+GJmO3rixzz
 cmJEoxJyM/+nOuCuE6kBroXFW8vMJ6DnCwwCNYzz1BajZS99gttACCQ9ALN+ZduV0q7gpNdu9Zf
 PV31aCVnrxddH1c43r4HdnFg5aoBYlTCnELMESj62pAqNsVd5xnbKOyS0GZzitq9P6byvOlrTu+
 /oXTV+ym1Dm2RO2Bl1fImfLn6pupo7J05tEyzaeLgY00upDgbz3KwFwALlHwaEcJ7HkYSPtROa+
 B9rQMBOjnJOjiNg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a interface independent layer for the probe function. This to
make it possible to add support for other interfaces.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 165 +++++++++++++++++++++++-----------
 drivers/gpu/drm/sitronix/st7571.h     |  25 +-----
 2 files changed, 113 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index af27658a5e152534d445bc623893eee6b3ca00d5..f994ace407390dba30c0968ca99f437382badfab 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -80,6 +80,33 @@
 #define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 
+struct st7571_i2c_transport {
+	struct i2c_client *client;
+
+	/*
+	 * Depending on the hardware design, the acknowledge signal may be hard to
+	 * recognize as a valid logic "0" level.
+	 * Therefor, ignore NAK if possible to stay compatible with most hardware designs
+	 * and off-the-shelf panels out there.
+	 *
+	 * From section 6.4 MICROPOCESSOR INTERFACE section in the datasheet:
+	 *
+	 * "By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
+	 * I2C interface compatible.
+	 * Separating acknowledge-output from serial data
+	 * input is advantageous for chip-on-glass (COG) applications. In COG
+	 * applications, the ITO resistance and the pull-up resistor will form a
+	 * voltage  divider, which affects acknowledge-signal level. Larger ITO
+	 * resistance will raise the acknowledged-signal level and system cannot
+	 * recognize this level as a valid logic “0” level. By separating SDA_IN from
+	 * SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
+	 * For applications which check acknowledge-bit, it is necessary to minimize
+	 * the ITO resistance of the SDA_OUT trace to guarantee a valid low level."
+	 *
+	 */
+	bool ignore_nak;
+};
+
 static inline struct st7571_device *drm_to_st7571(struct drm_device *drm)
 {
 	return container_of(drm, struct st7571_device, drm);
@@ -87,18 +114,17 @@ static inline struct st7571_device *drm_to_st7571(struct drm_device *drm)
 
 static int st7571_regmap_write(void *context, const void *data, size_t count)
 {
-	struct i2c_client *client = context;
-	struct st7571_device *st7571 = i2c_get_clientdata(client);
+	struct st7571_i2c_transport *t = context;
 	int ret;
 
 	struct i2c_msg msg = {
-		.addr = st7571->client->addr,
-		.flags = st7571->ignore_nak ? I2C_M_IGNORE_NAK : 0,
+		.addr = t->client->addr,
+		.flags = t->ignore_nak ? I2C_M_IGNORE_NAK : 0,
 		.len = count,
 		.buf = (u8 *)data
 	};
 
-	ret = i2c_transfer(st7571->client->adapter, &msg, 1);
+	ret = i2c_transfer(t->client->adapter, &msg, 1);
 
 	/*
 	 * Unfortunately, there is no way to check if the transfer failed because of
@@ -106,7 +132,7 @@ static int st7571_regmap_write(void *context, const void *data, size_t count)
 	 *
 	 * However, if the transfer fails and ignore_nak is set, we know it is an error.
 	 */
-	if (ret < 0 && st7571->ignore_nak)
+	if (ret < 0 && t->ignore_nak)
 		return ret;
 
 	return 0;
@@ -845,102 +871,135 @@ static int st7571_lcd_init(struct st7571_device *st7571)
 	return st7571_send_command_list(st7571, commands, ARRAY_SIZE(commands));
 }
 
-static int st7571_probe(struct i2c_client *client)
+static struct st7571_device *st7571_probe(struct device *dev,
+					  struct regmap *regmap)
 {
 	struct st7571_device *st7571;
 	struct drm_device *drm;
 	int ret;
 
-	st7571 = devm_drm_dev_alloc(&client->dev, &st7571_driver,
+	st7571 = devm_drm_dev_alloc(dev, &st7571_driver,
 				    struct st7571_device, drm);
 	if (IS_ERR(st7571))
-		return PTR_ERR(st7571);
+		return st7571;
 
 	drm = &st7571->drm;
-	st7571->dev = &client->dev;
-	st7571->client = client;
-	i2c_set_clientdata(client, st7571);
+	st7571->dev = dev;
 	st7571->pdata = device_get_match_data(st7571->dev);
 
 	ret = st7571->pdata->parse_dt(st7571);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	ret = st7571_validate_parameters(st7571);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	st7571->mode = st7571_mode(st7571);
+	st7571->regmap = regmap;
 
-	/*
-	 * The hardware design could make it hard to detect a NAK on the I2C bus.
-	 * If the adapter does not support protocol mangling do
-	 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
-	 * cruft in the logs.
-	 */
-	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
-		st7571->ignore_nak = true;
-
-	st7571->regmap = devm_regmap_init(st7571->dev, &st7571_regmap_bus,
-					  client, &st7571_regmap_config);
-	if (IS_ERR(st7571->regmap)) {
-		return dev_err_probe(st7571->dev, PTR_ERR(st7571->regmap),
-				     "Failed to initialize regmap\n");
-	}
 
 	st7571->hwbuf = devm_kzalloc(st7571->dev,
 				     (st7571->nlines * st7571->ncols * st7571->bpp) / 8,
 				     GFP_KERNEL);
 	if (!st7571->hwbuf)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	st7571->row = devm_kzalloc(st7571->dev,
 				   (st7571->ncols * st7571->bpp),
 				   GFP_KERNEL);
 	if (!st7571->row)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	ret = st7571_mode_config_init(st7571);
-	if (ret)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize mode config\n");
+	if (ret) {
+		dev_err(st7571->dev, "Failed to initialize mode config\n");
+		return ERR_PTR(ret);
+	}
 
 	ret = st7571_plane_init(st7571, st7571->pformat);
-	if (ret)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize primary plane\n");
+	if (ret) {
+		dev_err(st7571->dev, "Failed to initialize primary plane\n");
+		return ERR_PTR(ret);
+	}
 
 	ret = st7571_crtc_init(st7571);
-	if (ret < 0)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize CRTC\n");
+	if (ret < 0) {
+		dev_err(st7571->dev, "Failed to initialize CRTC\n");
+		return ERR_PTR(ret);
+	}
 
 	ret = st7571_encoder_init(st7571);
-	if (ret < 0)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize encoder\n");
+	if (ret < 0) {
+		dev_err(st7571->dev, "Failed to initialize encoder\n");
+		return ERR_PTR(ret);
+	}
 
 	ret = st7571_connector_init(st7571);
-	if (ret < 0)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to initialize connector\n");
+	if (ret < 0) {
+		dev_err(st7571->dev, "Failed to initialize connector\n");
+		return ERR_PTR(ret);
+	}
 
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);
-	if (ret)
-		return dev_err_probe(st7571->dev, ret,
-				     "Failed to register DRM device\n");
+	if (ret) {
+		dev_err(st7571->dev, "Failed to register DRM device\n");
+		return ERR_PTR(ret);
+	}
 
 	drm_client_setup(drm, NULL);
+	return st7571;
+}
+
+static void st7571_remove(struct st7571_device *st7571)
+{
+	drm_dev_unplug(&st7571->drm);
+}
+
+static int st7571_i2c_probe(struct i2c_client *client)
+{
+	struct st7571_device *st7571;
+	struct st7571_i2c_transport *t;
+	struct regmap *regmap;
+
+	t = devm_kzalloc(&client->dev, sizeof(*t), GFP_KERNEL);
+	if (!t)
+		return -ENOMEM;
+
+	t->client = client;
+
+	/*
+	 * The hardware design could make it hard to detect a NAK on the I2C bus.
+	 * If the adapter does not support protocol mangling do
+	 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
+	 * cruft in the logs.
+	 */
+	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
+		t->ignore_nak = true;
+
+	regmap = devm_regmap_init(&client->dev, &st7571_regmap_bus,
+				  t, &st7571_regmap_config);
+	if (IS_ERR(regmap)) {
+		return dev_err_probe(&client->dev, PTR_ERR(regmap),
+				     "Failed to initialize regmap\n");
+	}
+
+	st7571 = st7571_probe(&client->dev, regmap);
+	if (IS_ERR(st7571))
+		return dev_err_probe(&client->dev, PTR_ERR(st7571),
+				     "Failed to initialize regmap\n");
+
+	i2c_set_clientdata(client, st7571);
 	return 0;
 }
 
-static void st7571_remove(struct i2c_client *client)
+static void st7571_i2c_remove(struct i2c_client *client)
 {
 	struct st7571_device *st7571 = i2c_get_clientdata(client);
 
-	drm_dev_unplug(&st7571->drm);
+	st7571_remove(st7571);
 }
 
 static const struct st7571_panel_data st7567_config = {
@@ -986,8 +1045,8 @@ static struct i2c_driver st7571_i2c_driver = {
 		.name = "st7571",
 		.of_match_table = st7571_of_match,
 	},
-	.probe = st7571_probe,
-	.remove = st7571_remove,
+	.probe = st7571_i2c_probe,
+	.remove = st7571_i2c_remove,
 	.id_table = st7571_id,
 };
 
diff --git a/drivers/gpu/drm/sitronix/st7571.h b/drivers/gpu/drm/sitronix/st7571.h
index c6fd6f1d3aa33d6b43330ce8f2cb2d3f2321b29b..f62c57ddb99ebe82f63048cc2ccf75a81518d717 100644
--- a/drivers/gpu/drm/sitronix/st7571.h
+++ b/drivers/gpu/drm/sitronix/st7571.h
@@ -13,6 +13,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_format_helper.h>
 
 #include <linux/regmap.h>
 
@@ -62,33 +63,9 @@ struct st7571_device {
 
 	const struct st7571_panel_format *pformat;
 	const struct st7571_panel_data *pdata;
-	struct i2c_client *client;
 	struct gpio_desc *reset;
 	struct regmap *regmap;
 
-	/*
-	 * Depending on the hardware design, the acknowledge signal may be hard to
-	 * recognize as a valid logic "0" level.
-	 * Therefor, ignore NAK if possible to stay compatible with most hardware designs
-	 * and off-the-shelf panels out there.
-	 *
-	 * From section 6.4 MICROPOCESSOR INTERFACE section in the datasheet:
-	 *
-	 * "By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
-	 * I2C interface compatible.
-	 * Separating acknowledge-output from serial data
-	 * input is advantageous for chip-on-glass (COG) applications. In COG
-	 * applications, the ITO resistance and the pull-up resistor will form a
-	 * voltage  divider, which affects acknowledge-signal level. Larger ITO
-	 * resistance will raise the acknowledged-signal level and system cannot
-	 * recognize this level as a valid logic “0” level. By separating SDA_IN from
-	 * SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
-	 * For applications which check acknowledge-bit, it is necessary to minimize
-	 * the ITO resistance of the SDA_OUT trace to guarantee a valid low level."
-	 *
-	 */
-	bool ignore_nak;
-
 	bool grayscale;
 	bool inverted;
 	u32 height_mm;

-- 
2.50.1

