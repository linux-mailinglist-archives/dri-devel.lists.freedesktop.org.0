Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA508BB5FA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68264113297;
	Fri,  3 May 2024 21:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TLoJvQ/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A855B113296
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:12 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1ec92e355bfso1189645ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772231; x=1715377031;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkEQE93f5W3qrIiQKk9BZKKCez6HKRClYa+QpRpQRiA=;
 b=TLoJvQ/5hvsntZ+9aUhtA9RT41PFE/iytWPRltKFEZwBW71gr4e/lipxZFgxHAkr08
 lxm/20LVb6C73IrPvo4m9uF1PLz61qO7WwAMpE6KKivm48c0eGalQtmuc0RYMvpf1n48
 Onl9LBR2ewBXQHSRauQ/15IgGy7xeN6ILUilc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772231; x=1715377031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AkEQE93f5W3qrIiQKk9BZKKCez6HKRClYa+QpRpQRiA=;
 b=hHqXsfBH8ogfkuR3R6TKoQDjO+dmnzopK9XAbltHYV+CS5iQHo8DXzz3sxEUxDujyI
 WAixQlcUdE4tkFfnQVIz+vZAzG774bP+cqzGYg9j99coFER7W0rTuGu1L9mMXJM3SpFQ
 kQStO3ibvkHsfJp6Rr4QbTMhA0eV/jJRonfxRWY0VRHIt1jGk0WVUrveNcHAJV2D6qGq
 JRB3HTfu7EXa2Sv5djL1iu8tiga02aJHsLw0kxzgfEMBXPV+sjYXnM/74e/EKRYUzesZ
 hTXIK2gHU3w0ECfL96nncSk4XhaIdA36bzh3usH6onbNuGUJFlcgACxyyfmpm6GovD0N
 vQXg==
X-Gm-Message-State: AOJu0YxpnYZXLjpHgH3gZ2zbiEXntgeocVQvtg+meqHlLSiu/BjvI9iX
 VJoCyer7IkD2bCYx+/pGB56eVkYA4yHauFx3qm4sTYU1Agsxk1MM0uRozbREz3cHry3IiGDf9kw
 jIQ==
X-Google-Smtp-Source: AGHT+IErDEdWQJDxA1HZWTCGw5TL3HdjrluPTuCRLtiAQGGfIJv8XgK1D0yAqk5RVYxDWbW7F4IUEA==
X-Received: by 2002:a17:902:ecc7:b0:1e3:ca5a:2d9a with SMTP id
 a7-20020a170902ecc700b001e3ca5a2d9amr4783895plh.53.1714772231641; 
 Fri, 03 May 2024 14:37:11 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Stefan Mavrodiev <stefan@olimex.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 20/48] drm/panel: olimex-lcd-olinuxino: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:33:01 -0700
Message-ID: <20240503143327.RFT.v2.20.I6a96d762be98321e02f56b5864359258d65d9da8@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

Cc: Stefan Mavrodiev <stefan@olimex.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.45.0.rc1.225.g2a3ae87e7f-goog

