Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D42DA34C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDCA89CAC;
	Mon, 14 Dec 2020 22:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F177889CAC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 22:22:30 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a9so34283270lfh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8e8FNWsX0eRqq/Sk9Ag/HY8CvfGI1+lRbF8HhreiA4=;
 b=I8MZrdKrZrImlPvOSCTF7RxnAaBsKsXdO9BACh9RJF8qCAnMvARRgImJGz5+uu6L+Q
 QlVW/egpzHHBGkUHzyBgbhDI6XkqpNL+eO0NJkFQ3Y7ksV1rGVLXnT2confVDLCWyyhT
 uW9meGI2bO2wvqbEXElwbr9LLYImsZOmmBmp4hnIjmD849eVXVvlg8noW1pbRgsWdiBG
 hFSlIYvLkDs6BZwzmD082/1GHCjVPQyM6/U3JPWqjTbUF0aGzH+l+cd6g6VmAVoOKb2j
 DtuklTv6i6aq8IpYzafg6f8k0us5pbAf8KupJviA5jI0m5KmoA+pspUDHNfAiePV5keo
 nTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8e8FNWsX0eRqq/Sk9Ag/HY8CvfGI1+lRbF8HhreiA4=;
 b=NROkSDJoCx7KfnRH+GSgtFEOQfYd74c7Rv+TjWuufzxOvcBVB85PdAxUKua/ZNKjde
 kvjWf2FXaR7p/Fo77SaeAKsseys0+D6D6Dd1HwdUSdkeuNEnZ2X5JO6shKTkGSfWOqMA
 Rp2DmnM3djpvgJpNjqVgnGhauzyqv6ahagT2ky3z5UQgsKr3LUtK8mUcBzM4JEXQVe5l
 gCdfQ+bxjkpCENiKlIe1ji4oAXEqrYb8E8sImGBC+q/BpdpHM2i5TAEVUROH+CpRUhiU
 4bB5lRIPGQWzGccIVmi6DPf+dbuhOIoyPPhVkd7eiTjsAf57NWwuIIPdRu4DUMiTsk3m
 FcFA==
X-Gm-Message-State: AOAM530zMsUFxKfvIP56OaiVqwyI4USq0QhSiNyf43kzSWWswKNXbYLc
 D6IcsHv+xAmn9TUkWD9YGZd6/g==
X-Google-Smtp-Source: ABdhPJygYVyv6E6BfrociI2Zmt6/EBA9izGXmvnm/2jX/vCOFvGIWlioSrw2LjqU7HD3skIWt6MUww==
X-Received: by 2002:ac2:41da:: with SMTP id d26mr10262448lfi.15.1607984549345; 
 Mon, 14 Dec 2020 14:22:29 -0800 (PST)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id s27sm1819091ljd.25.2020.12.14.14.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 14:22:28 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: s6e63m0: Support max-brightness
Date: Mon, 14 Dec 2020 23:22:10 +0100
Message-Id: <20201214222210.238081-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "max-brightness" is a standard backlight property that
we need to support for the Samsung GT-I8190 Golden because
the display will go black if we crank up the brightness
too high.

As the platform needs this ability to give picture this is
a regression fix along with the addition of the property
to the GT-I8190 device tree.

Cc: Stephan Gerhold <stephan@gerhold.net>
Fixes: 9c3f0a0dd6a1 ("drm/panel: s6e63m0: Implement 28 backlight levels")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index bf6d704d4d27..603c5dfe8768 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -692,12 +692,12 @@ static const struct backlight_ops s6e63m0_backlight_ops = {
 	.update_status	= s6e63m0_set_brightness,
 };
 
-static int s6e63m0_backlight_register(struct s6e63m0 *ctx)
+static int s6e63m0_backlight_register(struct s6e63m0 *ctx, u32 max_brightness)
 {
 	struct backlight_properties props = {
 		.type		= BACKLIGHT_RAW,
-		.brightness	= MAX_BRIGHTNESS,
-		.max_brightness = MAX_BRIGHTNESS
+		.brightness	= max_brightness,
+		.max_brightness = max_brightness,
 	};
 	struct device *dev = ctx->dev;
 	int ret = 0;
@@ -719,6 +719,7 @@ int s6e63m0_probe(struct device *dev,
 		  bool dsi_mode)
 {
 	struct s6e63m0 *ctx;
+	u32 max_brightness;
 	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(struct s6e63m0), GFP_KERNEL);
@@ -734,6 +735,14 @@ int s6e63m0_probe(struct device *dev,
 	ctx->enabled = false;
 	ctx->prepared = false;
 
+	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
+	if (ret)
+		max_brightness = MAX_BRIGHTNESS;
+	if (max_brightness > MAX_BRIGHTNESS) {
+		dev_err(dev, "illegal max brightness specified\n");
+		max_brightness = MAX_BRIGHTNESS;
+	}
+
 	ctx->supplies[0].supply = "vdd3";
 	ctx->supplies[1].supply = "vci";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
@@ -753,7 +762,7 @@ int s6e63m0_probe(struct device *dev,
 		       dsi_mode ? DRM_MODE_CONNECTOR_DSI :
 		       DRM_MODE_CONNECTOR_DPI);
 
-	ret = s6e63m0_backlight_register(ctx);
+	ret = s6e63m0_backlight_register(ctx, max_brightness);
 	if (ret < 0)
 		return ret;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
