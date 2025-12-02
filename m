Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9669C9AABD
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F14D10E5AC;
	Tue,  2 Dec 2025 08:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bKVyqpOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DDC10E5D7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 08:26:16 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5959187c5a9so4644870e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 00:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764663975; x=1765268775; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JNPr1GR6LTMqIj8RiE65mwHD5mctt4yEgU/pajOvYyE=;
 b=bKVyqpOKlYpR6AiCrbChHu1zLElDOrcN/QcbeJ/TqVW+Ky+fPMFfyDf01cVJbW9LZu
 r7vCv+jWPeQMCy6bYLJ961cn3YQn1evyjt/Wxd1HgJfRj1htWpbceezIBXflkXfDDg35
 y1FRZyF5jbdSyYmhsn9RWXxdIf6dchC3f5sHdHI5tMjBX7oqqsLCC3HsxX1hVfqlg8Yr
 Z91wYem5dOwYCQREHCDiC4iZaXS9m33Dabm0uYFM54d15YbW4PTGQ6P312PVXVc3sY3P
 8YslHPciGCa9Mv/xCzO6ZivXoNejjZUtWDTpJD8p/5A2P6YUfancjve8j8p1zmoXvqek
 7KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764663975; x=1765268775;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JNPr1GR6LTMqIj8RiE65mwHD5mctt4yEgU/pajOvYyE=;
 b=Ajp4cc6isHmvqQf+v6YOkvQvJhVCw8YYAZKMI4LFP7u/Zj3bAioX4yja5Irwb1O++X
 Ra/qyshi/jqMGxmXX2zJ1wjagqeo/ViQ14LXyByJtD+LPJQJm9d20InXdDhvrPKhHRoc
 5KBR8f3/JMMTH3Lycb9NAPMMQnO3Mpp9fZE9rr96MDF8aleyTAmGMIiB/yLrnAbDu92w
 NcQjj/XOfJArPLuXdiGMAUQItVrtVmAW6Fd/YxJPjrgnEHQNLCrzSrz6YsH8UJvcAcLi
 jynTOhMVCnoyurObSJCCHJOZpTvQtbOok0PAQUNNGKf8DT80QNnNTTMXutwrzOwjidqf
 R6Fw==
X-Gm-Message-State: AOJu0Yy6cZE43dTPffQT+8g0KnPONVPRxw14tvWvuj0uEERTvaFX2V4n
 bF16PzzG7dtXk56ON7lMuHiTxJ4u4voCwURyzlUMhonsUz6Mg6P0ej9BfRjjGSCz
X-Gm-Gg: ASbGncvJd/JTQ8yORdabhD0DuxVuyBjBbvT2AZZ3KBbbxeN1d5q9MqadfifMmPBErJg
 iGLCdF6XmihoOt5/agaeZ7QLncHYazTmqdWhqVg8U0yx0h0kmHq3NjLxiPrYYRRR6l5mdHAP+ZB
 RBGV1jtcI/7IUPTrOyzCp11EsO1guNg4/YMAvMhABnehgXo7+quD9OGvXKMg9Th7UTb6mZrQnbx
 VOSYAlUf9iRVrYh7O1siNBars354KIuONTtrEZ8uXCPANYp/07hCXOw02VpAL5EMrI+GsFfRMrk
 DqbWpSlhUwZi+02qc1YRdjh7Ef8AS8niPqjAbNB9grKAeRKBwcVU/UMRYXoKYVUv1Yl2XK09A6z
 XOAta7YYXLGZPb6/F2dxvQ7nfmiYC+MIo/VWlGvkRPbBnTaVJLS61YJxAqc/J70Se+QFbCIAISF
 O40kW4+eraVPBjZqo9MEmHgz5K5kwtuAIF+xlluMlvZ/9BuQWzo1xLNE8b
X-Google-Smtp-Source: AGHT+IH4htxMOwDkLOG9gRs39wKw1GDE9LUIkOGW2QSwBgMV+hqQPKhoOj+qJBJ+Zi5LfheRYSakDQ==
X-Received: by 2002:a05:6512:a8b:b0:595:9d6b:1175 with SMTP id
 2adb3069b0e04-596a3ebebd8mr14121244e87.14.1764663974954; 
 Tue, 02 Dec 2025 00:26:14 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bf8b06bcsm4423727e87.25.2025.12.02.00.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 00:26:14 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:25:20 +0100
Subject: [PATCH RESEND v2 4/6] drm/sitronix/st7571-i2c: make probe
 independent of hw interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251202-st7571-split-v2-4-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
In-Reply-To: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10468;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=2gB/R9568q3Lz+zMQSvxmvd9sl7V4TvMscZtlHQKZ5A=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLqKQSL5eDDeZRaoFtVAINbIJOVQEvEkl6cNfZ
 R3LLGecEI2JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6ikAAKCRCIgE5vWV1S
 MhxVEACfPnF65sxFqDUB5HMqNH6xxEGeoKX1NWwnQgClHkbupLwAfgD9VkO/WOlECRl9efFryE6
 YMyHWgNQ65JoqpiGzkf1QtuA1zK2/EbUc29it3MlMcVoUVeWGNrnD6iyb/dFt6XJ3qI7yS19v/Y
 GiQ97MFuPbVsCoag+aTbPe6FFmHEmSoDt/uv7RmLjeyX4Llm4i4qlz4nZg5/tnb6b91TA4707eJ
 /wSzF3Z5iiihanRr19+Cu+pXvW0E/eSzRQYV0XIz8+Ody4jMy6DET/VymrB9HRcpWHATwtqVSDe
 ukvgKmjj+xW/ifD84zAUgmYnQvQlwsn9czD3bH04IaBKY2dyKe+EV8PfdTU9LRPZQB2zj+c/QLJ
 t6IvvNyYqNCrBt0HxwJ3uVfgm5dAXUoKflyljpnQYLaks/uS24YXcYJVNnluxSUkSxz86W7OLQG
 dtv4sJQbB2CuPXiDbZNDP8M9arMYGHFzmNrOapdP8eewI8uYFBm9POh3LfNEAth/s3PjEVCl3Dm
 iZM6VniwrJsbA86jpqIW2ngRCG7zBWEkVflW2U3Dqc5FPrmqx+dn+UU4USbLHkGeDTvqm/C+YPp
 z9qpg1rzoT9J3IG6Jb8WuJA42tXt15UXeGGdiNTSMhS+gVgwsH4znFLdyQh/Dz7dJPImviX1jXC
 wgSnDGCqhRElBjA==
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
index af27658a5e15..f994ace40739 100644
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
index c6fd6f1d3aa3..f62c57ddb99e 100644
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
2.51.2

