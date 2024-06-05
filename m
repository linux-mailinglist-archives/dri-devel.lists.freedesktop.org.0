Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C5E8FC075
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955D310E639;
	Wed,  5 Jun 2024 00:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JL/2q4SS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536BE10E63C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:37 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-6cc3e134f88so1339470a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547076; x=1718151876;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nt+Uz61a2MDORYQbLM7hqg1KrTLX44Z8XHA6HpQkDA0=;
 b=JL/2q4SS8BppEf9794e3Fl7X0Q289wMBdJXeq7ydB5CmXMfLT53q/JaBnZ1+wx6NnI
 o3Xz4sgl/rhLq9/EhdShuZfL30JcuydHa2Qqfhm7AFOV8hC8/UhlzGXpAjv110fIwLCv
 5BH7LXrH9v4+Fscu9mO5TCoaBdMTAdnFyhsjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547076; x=1718151876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nt+Uz61a2MDORYQbLM7hqg1KrTLX44Z8XHA6HpQkDA0=;
 b=gvCzOaSEQynJka0KbQiBPH2QR/P9frM5XTBPuxLuqXbX78ZcF4wpWY08KfGh9ciff2
 9ZJ36PvdjPxT6dYbaXykqQVoMzUk9ExBxsRoGpE5AwgIxq3VDAK3lYHB754PMSnPjb9v
 qWcjWXp/M2wmLGTQb/3XwCyHFaL+NDFooKLOaljjY6B2Q3T0TUya/GJhDDgzRZo95/0z
 359sozfTu0Y2QTWf/foU1AYtr6bx45Z3PRvtzvsy/XQ7qiaegVDgbS6TTwBseKwCt8/j
 UeClKKw6xKIi0GU1xRkx4oiCLVgWpdeAwBnLjS89NTIF7CwuZYH4oG/nvfhu2NJrZIUC
 VKYQ==
X-Gm-Message-State: AOJu0YyO/Vagw2HsTFKwPl1SnExcUy+5cPh3BNnrmyXaZ3CDYenI4V26
 8WkD8xxvYzdntSyKOBQe3LUWuR+N4OGGTD4SvLTwQXGOtl3tuQXpGgo1o2zg3JWWJulhyN8Hios
 =
X-Google-Smtp-Source: AGHT+IG8GVjkkeUZPe82uyMtW/A8Z+0TZ1mgkbT3D57ki2eM/keBp6CyQM3mvG3P3K8NdynAMqX0zA==
X-Received: by 2002:a05:6a21:18f:b0:1b2:a780:2d08 with SMTP id
 adf61e73a8af0-1b2b6e4ab78mr1534566637.10.1717547076080; 
 Tue, 04 Jun 2024 17:24:36 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:35 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vinay Simha BN <simhavcs@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/24] drm/panel: jdi-lt070me05000: Stop tracking
 prepared/enabled
Date: Tue,  4 Jun 2024 17:22:57 -0700
Message-ID: <20240604172305.v3.11.I2e991044def6644c18ad8d7d686f4f3006f278de@changeid>
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

NOTE: as part of this, transition the panel's direct calls to its
disable function in shutdown/remove to call through DRM panel.

Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Note: since we are able to identify that this panel only appears to be
used on Qualcomm boards and we have to touch the shutdown/remove path
in this patch anyway, we could possibly squash this with the next
patch that removes the disable call in shutdown/remove. For now I'm
keeping them separate just to keep the concepts separate.

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 27 ++-----------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index f9a69f347068..4ddddee6fa1e 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -37,9 +37,6 @@ struct jdi_panel {
 	struct gpio_desc *dcdc_en_gpio;
 	struct backlight_device *backlight;
 
-	bool prepared;
-	bool enabled;
-
 	const struct drm_display_mode *mode;
 };
 
@@ -176,13 +173,8 @@ static int jdi_panel_disable(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_jdi_panel(panel);
 
-	if (!jdi->enabled)
-		return 0;
-
 	backlight_disable(jdi->backlight);
 
-	jdi->enabled = false;
-
 	return 0;
 }
 
@@ -192,9 +184,6 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 	struct device *dev = &jdi->dsi->dev;
 	int ret;
 
-	if (!jdi->prepared)
-		return 0;
-
 	jdi_panel_off(jdi);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(jdi->supplies), jdi->supplies);
@@ -207,8 +196,6 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 
 	gpiod_set_value(jdi->dcdc_en_gpio, 0);
 
-	jdi->prepared = false;
-
 	return 0;
 }
 
@@ -218,9 +205,6 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	struct device *dev = &jdi->dsi->dev;
 	int ret;
 
-	if (jdi->prepared)
-		return 0;
-
 	ret = regulator_bulk_enable(ARRAY_SIZE(jdi->supplies), jdi->supplies);
 	if (ret < 0) {
 		dev_err(dev, "regulator enable failed, %d\n", ret);
@@ -250,8 +234,6 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	jdi->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -272,13 +254,8 @@ static int jdi_panel_enable(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_jdi_panel(panel);
 
-	if (jdi->enabled)
-		return 0;
-
 	backlight_enable(jdi->backlight);
 
-	jdi->enabled = true;
-
 	return 0;
 }
 
@@ -475,7 +452,7 @@ static void jdi_panel_remove(struct mipi_dsi_device *dsi)
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = jdi_panel_disable(&jdi->base);
+	ret = drm_panel_disable(&jdi->base);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
 
@@ -491,7 +468,7 @@ static void jdi_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 
-	jdi_panel_disable(&jdi->base);
+	drm_panel_disable(&jdi->base);
 }
 
 static struct mipi_dsi_driver jdi_panel_driver = {
-- 
2.45.1.288.g0e0cd299f1-goog

