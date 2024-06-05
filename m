Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76ED8FC070
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEDA10E637;
	Wed,  5 Jun 2024 00:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="F9MIP8RJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC5910E632
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:24 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1f692d6e990so16283185ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547063; x=1718151863;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzvwGuJ+WTCRog8EdqXF+Obfr3JYyQtoUfl83gDvzVE=;
 b=F9MIP8RJx5Pq6uYHUPvsFaE+jNPOo5ILCSzttQ0YlkOMf/GtquVlzrgz248/IE4flD
 j0K7owWovhbKrRSEa7c27CHYmBEFKMcuJ5VeZBQSUDw5duhvey0vehdZ3RR88DvBWMb3
 HopIwV3O/VN9LGJIJKh8VQ+y1HTPx0WAD/rIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547063; x=1718151863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzvwGuJ+WTCRog8EdqXF+Obfr3JYyQtoUfl83gDvzVE=;
 b=uCx28uATHE+0ssCVdgPkYx+QiLOikQcIfbDxOkRjQy6eSDJyDwLeoZtmZyW0rg6Uk1
 dyk/a8DSh3LtzEbKp2R4T8buoYDQZjMqaWzwMkgGDhdLbqYx4c/o4FgzGnZsXTzPNDDg
 0VI5+TX/4uDG8NdnhmOB1fd/myiW3A/w9fMlWZLaEC3Yx5MUPa9QTcCB+/9gSu0b1Xnf
 lADF2g82CZd3w+93J1Qq8erRvCoTqPkIupc/+e1xUS7jHyWJBEft60fd/wHlwAswAH72
 jtK6i6NR0rpBJvuUJB8Oc2c2JDL/bfh/05ejIuOTOtpvEGeoR05/nXCIEnZ59A45urkw
 SlFg==
X-Gm-Message-State: AOJu0Yxw6PCK7/KajGOBFgaywvxSfJccof7rlMLUGve64vdYPUeW7k3t
 COHdWHuW7wJ5YofVL2ZB/XVRjPvYwDLJZlUPF+AC/CYUERWfYc/91vJXprw/8x2ekR6BX3FJsEo
 =
X-Google-Smtp-Source: AGHT+IElsoNXkv7mUljM8/UDK3zzl3IwJ2DQTSHMSmNYHfMB/j0jhxzWAT3nNtc8jJhxnwRjLD3uqA==
X-Received: by 2002:a17:902:cec4:b0:1f6:7f8f:65c6 with SMTP id
 d9443c01a7336-1f6a5a10295mr15071235ad.24.1717547062977; 
 Tue, 04 Jun 2024 17:24:22 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/24] drm/panel: olimex-lcd-olinuxino: Stop tracking
 prepared/enabled
Date: Tue,  4 Jun 2024 17:22:51 -0700
Message-ID: <20240604172305.v3.5.I6a96d762be98321e02f56b5864359258d65d9da8@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../drm/panel/panel-olimex-lcd-olinuxino.c    | 41 -------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 4819ada69482..8a687d3ba236 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -64,9 +64,6 @@ struct lcd_olinuxino {
 	struct i2c_client *client;
 	struct mutex mutex;
 
-	bool prepared;
-	bool enabled;
-
 	struct regulator *supply;
 	struct gpio_desc *enable_gpio;
 
@@ -78,30 +75,13 @@ static inline struct lcd_olinuxino *to_lcd_olinuxino(struct drm_panel *panel)
 	return container_of(panel, struct lcd_olinuxino, panel);
 }
 
-static int lcd_olinuxino_disable(struct drm_panel *panel)
-{
-	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);
-
-	if (!lcd->enabled)
-		return 0;
-
-	lcd->enabled = false;
-
-	return 0;
-}
-
 static int lcd_olinuxino_unprepare(struct drm_panel *panel)
 {
 	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);
 
-	if (!lcd->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(lcd->enable_gpio, 0);
 	regulator_disable(lcd->supply);
 
-	lcd->prepared = false;
-
 	return 0;
 }
 
@@ -110,27 +90,11 @@ static int lcd_olinuxino_prepare(struct drm_panel *panel)
 	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);
 	int ret;
 
-	if (lcd->prepared)
-		return 0;
-
 	ret = regulator_enable(lcd->supply);
 	if (ret < 0)
 		return ret;
 
 	gpiod_set_value_cansleep(lcd->enable_gpio, 1);
-	lcd->prepared = true;
-
-	return 0;
-}
-
-static int lcd_olinuxino_enable(struct drm_panel *panel)
-{
-	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);
-
-	if (lcd->enabled)
-		return 0;
-
-	lcd->enabled = true;
 
 	return 0;
 }
@@ -195,10 +159,8 @@ static int lcd_olinuxino_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs lcd_olinuxino_funcs = {
-	.disable = lcd_olinuxino_disable,
 	.unprepare = lcd_olinuxino_unprepare,
 	.prepare = lcd_olinuxino_prepare,
-	.enable = lcd_olinuxino_enable,
 	.get_modes = lcd_olinuxino_get_modes,
 };
 
@@ -264,9 +226,6 @@ static int lcd_olinuxino_probe(struct i2c_client *client)
 		lcd->eeprom.num_modes = 4;
 	}
 
-	lcd->enabled = false;
-	lcd->prepared = false;
-
 	lcd->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(lcd->supply))
 		return PTR_ERR(lcd->supply);
-- 
2.45.1.288.g0e0cd299f1-goog

