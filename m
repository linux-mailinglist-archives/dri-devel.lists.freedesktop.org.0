Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD2AB03C23
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3DF10E451;
	Mon, 14 Jul 2025 10:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IlUm18Xb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B1F10E451
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752489894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QcePExROBkGmXTd3pzyFFPMJePKoh9BWUTzEsDl2zWY=;
 b=IlUm18XbUD+942LfE9Lxg8EmBeIfYvLlZvSh53igBESNCMeyK32bpTa7S27eEat5j1/0PK
 OQ8dmWzK+B3UuTqdUDKC5hBE+MNYVT9png6dZD3oKuGm9fp9+u1l1F4EJJrkwslaUcX0Zp
 iKQpih1MWoltcD8iFW0KV4pTQ0uKRqo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-Lh5mhaTcOkWZqPZffA-rxA-1; Mon, 14 Jul 2025 06:44:50 -0400
X-MC-Unique: Lh5mhaTcOkWZqPZffA-rxA-1
X-Mimecast-MFC-AGG-ID: Lh5mhaTcOkWZqPZffA-rxA_1752489889
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-455ea9cb0beso21248785e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489889; x=1753094689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QcePExROBkGmXTd3pzyFFPMJePKoh9BWUTzEsDl2zWY=;
 b=AS7tb1JduObtD2fogZRnXpp1p22owSMq2SM6GVOh1fk0GkD8SfYXPAieIS6KXWJ+cX
 FJDakI48MSpDKbBdBuJcl27EtLvajXpiDi+1+4mTYDBQC8W4XFv8Hkv1ejyOmOJWQtTm
 5+E8kD7xXmBiuhoNA6ZfHkX1kdnFhECvUzbwSUxi2M3Gn1VVex1eyoN3ZUXMMUxyMy9c
 QEYytU/qH2OB//Tq6a6mSpknUAZtVejtifu5xIsN+z/ztNUo720KFN5mT9pX7meTdd4A
 LQwK7SpyuvPIdfA9ecLO/xI2+/QLoiGIgeVAA+rNfZxdPOsqAafYxYlHFXI7C9drNljD
 Mwqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7HW4jm6RdLWQeItzvT5HRlUP63dDwgcXkmruxlNVWuVy0EMq4nUauvhgc2hOhDkNnO2znoy4HhhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqF7hyURomBHqSCCgpHcmwVUEVAH9vtSEToD1c/Czsd4m6dHQZ
 A//4HLQlL5kmpM3Psn62vQb90T5AfcAcuHUdEy9Gff43krCeJ85RV3KKA40zirhiLzfqng+bIcG
 NhZ4LL8K2EI3Np0da3eaJxqYXNiGXplyVO7nz4ctCXuYxe0aUT7Ik5PyzfgWA4Y95joumfA==
X-Gm-Gg: ASbGncvpUvIvgIvCOBgt7EIvIlBWJtLnMII+I/N+RVHK2z2XJRfqBMlNggjEizDrmmu
 VtGsD5V7DdltIvDbolbTTqX3d1XR1ST8KqovxmPr89IlWAqkya3dtuGBqB2/QsFe7XBpnvo9Ol1
 zUI/uzBIPD50KbHNMgVF0ZmDl/v7G5uQb+LupyP0AU1mc7MSNh63bS0pLuzjjPCOAcWOW3pG0sW
 NGaXVXVrNVKjvFdu5+qqYhREWHaD5pCRclkDiNzzY4axSbWJL/Yl2XemmIowPQTem3l6VD7w0lb
 I+2ze8+TOcMhGxWXuXY3o3w9nr6rjSy9
X-Received: by 2002:a05:600c:1da7:b0:456:1b8b:b8c6 with SMTP id
 5b1f17b1804b1-4561b8bbbf3mr26659955e9.14.1752489889157; 
 Mon, 14 Jul 2025 03:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGnLmL3APGndfptepWrP7aJt58jFVF0xV99rnqtzmW+5CMr6NcUHBMolv58MpEYfVkZQpmmQ==
X-Received: by 2002:a05:600c:1da7:b0:456:1b8b:b8c6 with SMTP id
 5b1f17b1804b1-4561b8bbbf3mr26659605e9.14.1752489888714; 
 Mon, 14 Jul 2025 03:44:48 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e14ce6sm12240314f8f.68.2025.07.14.03.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:44:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/sitronix/st7571-i2c: Add support for the ST7567
 Controller
Date: Mon, 14 Jul 2025 12:44:04 +0200
Message-ID: <20250714104421.323753-6-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250714104421.323753-1-javierm@redhat.com>
References: <20250714104421.323753-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dx_rQ0zHLkAXA7eJIvcHVga_0bwcbXe0bcc36KA3xvM_1752489889
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

The Sitronix ST7567 is a monochrome Dot Matrix LCD Controller that has SPI,
I2C and parallel interfaces. The st7571-i2c driver only has support for I2C
so displays using other transport interfaces are currently not supported.

The DRM_FORMAT_R1 pixel format and data commands are the same than what
is used by the ST7571 controller, so only is needed a different callback
that implements the expected initialization sequence for the ST7567 chip.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Changes in v2:
- Use a different parse DT function (Thomas Zimmermann).

 drivers/gpu/drm/sitronix/st7571-i2c.c | 74 +++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index f9c4fedb3cca..1b820ff6a9dd 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -68,6 +68,9 @@
 #define ST7571_SET_COLOR_MODE(c)		(0x10 | FIELD_PREP(GENMASK(0, 0), (c)))
 #define ST7571_COMMAND_SET_NORMAL		(0x00)
 
+/* ST7567 commands */
+#define ST7567_SET_LCD_BIAS(m) (0xa2 | FIELD_PREP(GENMASK(0, 0), (m)))
+
 #define ST7571_PAGE_HEIGHT 8
 
 #define DRIVER_NAME "st7571"
@@ -774,6 +777,32 @@ static int st7571_validate_parameters(struct st7571_device *st7571)
 	return 0;
 }
 
+static int st7567_parse_dt(struct st7571_device *st7567)
+{
+	struct device *dev = &st7567->client->dev;
+	struct device_node *np = dev->of_node;
+	struct display_timing dt;
+	int ret;
+
+	ret = of_get_display_timing(np, "panel-timing", &dt);
+	if (ret) {
+		dev_err(dev, "Failed to get display timing from DT\n");
+		return ret;
+	}
+
+	of_property_read_u32(np, "width-mm", &st7567->width_mm);
+	of_property_read_u32(np, "height-mm", &st7567->height_mm);
+
+	st7567->pformat = &st7571_monochrome;
+	st7567->bpp = 1;
+
+	st7567->startline = dt.vfront_porch.typ;
+	st7567->nlines = dt.vactive.typ;
+	st7567->ncols = dt.hactive.typ;
+
+	return 0;
+}
+
 static int st7571_parse_dt(struct st7571_device *st7571)
 {
 	struct device *dev = &st7571->client->dev;
@@ -819,6 +848,37 @@ static void st7571_reset(struct st7571_device *st7571)
 	gpiod_set_value_cansleep(st7571->reset, 0);
 }
 
+static int st7567_lcd_init(struct st7571_device *st7567)
+{
+	/*
+	 * Most of the initialization sequence is taken directly from the
+	 * referential initial code in the ST7567 datasheet.
+	 */
+	u8 commands[] = {
+		ST7571_DISPLAY_OFF,
+
+		ST7567_SET_LCD_BIAS(1),
+
+		ST7571_SET_SEG_SCAN_DIR(0),
+		ST7571_SET_COM_SCAN_DIR(1),
+
+		ST7571_SET_REGULATOR_REG(4),
+		ST7571_SET_CONTRAST_MSB,
+		ST7571_SET_CONTRAST_LSB(0x20),
+
+		ST7571_SET_START_LINE_MSB,
+		ST7571_SET_START_LINE_LSB(st7567->startline),
+
+		ST7571_SET_POWER(0x4),	/* Power Control, VC: ON, VR: OFF, VF: OFF */
+		ST7571_SET_POWER(0x6),	/* Power Control, VC: ON, VR: ON, VF: OFF */
+		ST7571_SET_POWER(0x7),	/* Power Control, VC: ON, VR: ON, VF: ON */
+
+		ST7571_SET_ENTIRE_DISPLAY_ON(0),
+	};
+
+	return st7571_send_command_list(st7567, commands, ARRAY_SIZE(commands));
+}
+
 static int st7571_lcd_init(struct st7571_device *st7571)
 {
 	/*
@@ -963,6 +1023,18 @@ static void st7571_remove(struct i2c_client *client)
 	drm_dev_unplug(&st7571->dev);
 }
 
+struct st7571_panel_data st7567_config = {
+	.init = st7567_lcd_init,
+	.parse_dt = st7567_parse_dt,
+	.constraints = {
+		.min_nlines = 1,
+		.max_nlines = 64,
+		.min_ncols = 128,
+		.max_ncols = 128,
+		.support_grayscale = false,
+	},
+};
+
 struct st7571_panel_data st7571_config = {
 	.init = st7571_lcd_init,
 	.parse_dt = st7571_parse_dt,
@@ -976,12 +1048,14 @@ struct st7571_panel_data st7571_config = {
 };
 
 static const struct of_device_id st7571_of_match[] = {
+	{ .compatible = "sitronix,st7567", .data = &st7567_config },
 	{ .compatible = "sitronix,st7571", .data = &st7571_config },
 	{},
 };
 MODULE_DEVICE_TABLE(of, st7571_of_match);
 
 static const struct i2c_device_id st7571_id[] = {
+	{ "st7567", 0 },
 	{ "st7571", 0 },
 	{ }
 };
-- 
2.49.0

