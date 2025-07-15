Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CC5B0585E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9349010E593;
	Tue, 15 Jul 2025 11:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B0x4Hiwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD9510E594
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752577504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXWJvgkysJAIYjhynSIqmAwCotshg97ykDbemk4MKVY=;
 b=B0x4HiwncBdnLvGcsI1b9Z6Zx2xgZe8uo1y09o8lnDKDe3HclHUOVUxD7IpaHL78UF8B1q
 TcXFVFf2GFNXQ5NqCzKLMpJK8LRWxXnsQayCdHpZ3Rq/dKkpZrF02OehUbRnLQ5CEmtTfM
 XBt1sFRmFdVM4y0Zv2JumzluMV3/SOI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-0a64H4FwO7ir4fS984AApA-1; Tue, 15 Jul 2025 07:05:03 -0400
X-MC-Unique: 0a64H4FwO7ir4fS984AApA-1
X-Mimecast-MFC-AGG-ID: 0a64H4FwO7ir4fS984AApA_1752577502
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-455f79a2a16so30555685e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 04:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752577502; x=1753182302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXWJvgkysJAIYjhynSIqmAwCotshg97ykDbemk4MKVY=;
 b=i+rjoC4I6BVvZJt7xVOjUuHKyDUpMAdPg4NZa0vE85BfCEQMgG+XCNoOwCOmv5SoNM
 k9YM/DjLEyG4F2crNqSUG4ZR6kq30kSmDcYTtxZZtZSCjpAI8J4uj4QzCLDVUXbWwFQ2
 MdurKbweFE15po5BMlTS5L9O/ODUkauGiD5K/oBa2nvcTr+wd3KQpdeHRIYszjv2NajI
 CpFjXufMKvpvynw0jok/6Q55wLRpFABmYdJVdhC356Pg8surYOEE8qIBwOapd+/Mqa7d
 P2qCKplm10w02brHFBlGWGtBP4j/I70gq23fIbww0DFq8Y8bb0nmke4ZKufkzkUDXsl9
 m3hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuasd2R/71TB7bCvUTn3jwcq+TtM6/MWNox/MtHBk/ReQhurpCsTU2oVbxGQIvrpu4VVGilXch9Xg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGwp9jMJ5GYUkcT/TbCOWQzsFERwhwnWtGFil802goDkRjQy+b
 MR6J9nbzTPMND9W5J4ZdM0ZvExxAiMAho02uOfnFYByHYZvIea7sAtjcA3LTKzkzeoU85iTrEFt
 eC2wmHkgHML0MIqG1eSSCyI62XFx7BT0nLh4H38QsXu9UCQq4jPdqKvKBqePHG/+/g4vqZA==
X-Gm-Gg: ASbGncucNUXGvH0C7BKACpFy+fYL6tln5yoPvf6yow7bUQjOeLd+YbLsLfLGsZfagwV
 eJY/ts+nzB/1eCZhxWNjJi9IePA2uY+LB8DdTXqBfLDrZoU/haJFDPQGb9EZ6usD4H7FqD5woWy
 1hmsWwGu1dNaw/BfJtxRJL6RVNDsceN/KHSoRjuHgZDAaDCTXx/Jdigh+o/YkvAMT0LWMHIgN6i
 U5IsJhwdz8oOc1W1TsMXRiW6kROKFkuy1FfApBPdvAtyPBr3S9baHlTfALdSv/42FDhTWOfAIJM
 9GsZ2cpBYmzpHx9PLnahLdVkQMk3JlqS
X-Received: by 2002:a05:600c:3b84:b0:442:e9eb:cba2 with SMTP id
 5b1f17b1804b1-456270595f5mr25682815e9.0.1752577501571; 
 Tue, 15 Jul 2025 04:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp+zFcABguTv2tVfluwznB62/qIMjIJQ+aN4JA01wqyr6F5mtu+/5NlUV3tbY8+UfZTV92gQ==
X-Received: by 2002:a05:600c:3b84:b0:442:e9eb:cba2 with SMTP id
 5b1f17b1804b1-456270595f5mr25682415e9.0.1752577501047; 
 Tue, 15 Jul 2025 04:05:01 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45614aeba29sm73112375e9.11.2025.07.15.04.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 04:05:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/sitronix/st7571-i2c: Add support for the ST7567
 Controller
Date: Tue, 15 Jul 2025 13:03:54 +0200
Message-ID: <20250715110411.448343-6-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250715110411.448343-1-javierm@redhat.com>
References: <20250715110411.448343-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 90Inv-QLEMgBGT4GCNCurvaftYTbCuGnW81LjgrydHI_1752577502
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

Changes in v3:
- Explicitly set ST7571_SET_REVERSE(0) instead of relying on defaults.

Changes in v2:
- Use a different parse DT function (Thomas Zimmermann).

 drivers/gpu/drm/sitronix/st7571-i2c.c | 75 +++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index f9c4fedb3cca..453eb7e045e5 100644
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
@@ -819,6 +848,38 @@ static void st7571_reset(struct st7571_device *st7571)
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
+		ST7571_SET_REVERSE(0),
+		ST7571_SET_ENTIRE_DISPLAY_ON(0),
+	};
+
+	return st7571_send_command_list(st7567, commands, ARRAY_SIZE(commands));
+}
+
 static int st7571_lcd_init(struct st7571_device *st7571)
 {
 	/*
@@ -963,6 +1024,18 @@ static void st7571_remove(struct i2c_client *client)
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
@@ -976,12 +1049,14 @@ struct st7571_panel_data st7571_config = {
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

