Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EDFAFFF2D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D0E10E373;
	Thu, 10 Jul 2025 10:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bnVNbs4i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5310C10E373
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752143157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rpachhN0uLazu1YIn/ePDV6zDFQOiD+8nZOn/jssAK0=;
 b=bnVNbs4iDV8FRkWRYfi+3GZPR+PWkT+vah/Zurwy5rswLeosqtpOEQZwxth9VD01U+UI9j
 fRe+yYStSxYeCp8zPQduiMf6kUyBHTQ4hhIpuUfRSBZFDNvyPZbwi7ZvaPVsbShT6Vvouy
 Yc4Y0JdbewJAyHyrxdYkbr+n81klP/Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-OTVL2N4HPlmvlUpq5XYjpQ-1; Thu, 10 Jul 2025 06:25:54 -0400
X-MC-Unique: OTVL2N4HPlmvlUpq5XYjpQ-1
X-Mimecast-MFC-AGG-ID: OTVL2N4HPlmvlUpq5XYjpQ_1752143153
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4f7f1b932so573330f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 03:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752143153; x=1752747953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rpachhN0uLazu1YIn/ePDV6zDFQOiD+8nZOn/jssAK0=;
 b=dxxr/b4usYe5IcQ3nI9TTIdlAmZ5taeUuCBZYOV4U9ldDyl/nfDr7AAPI4xvMsCfVd
 2p3kNUzIamFSIJENxesmzmgxIJcRsxMXyIa9FKKreAbe3Xz4xygHlVr07Hg7Hjo1Av2I
 ACgePsg5j8pPBlnZKU0ES6/Vpi9vYW2yoTcZ4x2FwAFxngCQrtK2BaaSa3nAjy4ST7Ge
 0YqlFEt6KEIkjuhCmxJLuYKPvXkRyCLad7qjg6b5xIiQYP1DQc8+AEZjaQ5LQbh5hBfC
 KOME2gtrOzlr5NqJ8TGL5GKgTGbP+7kjtym27xJMiFbJu+Ta5NuwNuLeEgaeB+1BfFh7
 Iejw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFgfJ/AO2faOlv7kwq0i5fQlA2Gu95ODxACqIZB79rI/5aZG8IZ+buvxESbyfoNa5biwUPbht2qq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysDS5Glg9hfrixBCPw4UXNVPQkf0Sp37K7nLVQsXexv1WsBXci
 EBxP0zC1aQRH+M8qVSalIs4csZ6S//FQydyzSiwcpn7LiKcF+BW58KXhRGk2TsA1cGsz8Xw/7lo
 K2YyEsXGhF1VherpEh/ETwNovnbRJOC2YL++tBCrHheBbcEZ2a5vn6R8nMidhJgs+lXgzmw==
X-Gm-Gg: ASbGncuM2RHgp5aGgvIUmC6QBgrLDeph7R1K7MJd4IrisiW3jL+DobVTSkuRap/goeK
 q2ru8ULqg4MDhrXeSJuqr9aqxI4tvAOC0j3JX6jLZYo7KS4N1CmZOIq0hgUkD27156tUMa0eWaF
 PN2sPuf32zWRNUaIQLkLL75/ccvTV2QjM9Tu+iBRfqH5P5Re3DQbRlDczmLpod0LL+ax9sKVUIZ
 L8dOAVSxjwTpJTOOow44iHR6w9uFefHHdtdGI+z4dh2Pk2pbR65zeLRTtBZ2eFDVsAPZ6BG/aOn
 IYHq/daWozQ5RFXomHjJ5Eu4qJSukiDEmEPO+81JifmpTgE=
X-Received: by 2002:a05:6000:2dc5:b0:3a4:e7b7:3851 with SMTP id
 ffacd0b85a97d-3b5e86fbabbmr1843212f8f.58.1752143153137; 
 Thu, 10 Jul 2025 03:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNFbEAiTWk6bIPshxO3enB3W4uVYluO9n+nPE5yTK/qj5yZCxHAbekX/b1jHd+JAInA2V4AA==
X-Received: by 2002:a05:6000:2dc5:b0:3a4:e7b7:3851 with SMTP id
 ffacd0b85a97d-3b5e86fbabbmr1843196f8f.58.1752143152721; 
 Thu, 10 Jul 2025 03:25:52 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26c97sm1507695f8f.90.2025.07.10.03.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 03:25:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/sitronix/st7571-i2c: Add support for the ST7567
 Controller
Date: Thu, 10 Jul 2025 12:24:35 +0200
Message-ID: <20250710102453.101078-4-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710102453.101078-1-javierm@redhat.com>
References: <20250710102453.101078-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g5dsm4oGA4Eov8eQkEOrCgAE1gMCmLBEWpBtirgyyKE_1752143153
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
---

 drivers/gpu/drm/sitronix/st7571-i2c.c | 47 +++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 73e8db25f895..ea915bd5deeb 100644
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
@@ -820,6 +823,37 @@ static void st7571_reset(struct st7571_device *st7571)
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
@@ -964,6 +998,17 @@ static void st7571_remove(struct i2c_client *client)
 	drm_dev_unplug(&st7571->dev);
 }
 
+struct st7571_panel_data st7567_config = {
+	.init = st7567_lcd_init,
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
 	.constraints = {
@@ -976,12 +1021,14 @@ struct st7571_panel_data st7571_config = {
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

