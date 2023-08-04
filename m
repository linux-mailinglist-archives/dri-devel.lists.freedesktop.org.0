Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA9770A74
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 23:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E1010E16A;
	Fri,  4 Aug 2023 21:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006C10E14C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:07:26 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68706d67ed9so1936171b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 14:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691183245; x=1691788045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bMFEctXfVjG2IYe4vquf3xioJyZh6qEXoPMzTW8XNA=;
 b=UmKwTf2gaxpcP2JnLDn6fy71PrYW89RakQc+k8bK3mBzH2yxrr4BqWPt5WLcmhByIm
 cY0QPbfVGE8upeRjG2hXjKzPNfeQ3Y8EXZAG1l5kW/kNIUCfOV/NEGz++UFVEzvONl4M
 o44riHYsbsKbHKkrKkbQnh+7EVkRNZeDnCg54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691183245; x=1691788045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bMFEctXfVjG2IYe4vquf3xioJyZh6qEXoPMzTW8XNA=;
 b=cDy34Czq/wgDiJ/rBYJ0EzT7nT/8k6UmCneZziVkIBG1FTRyaTg2uJZ+A1Pg+8Gv76
 7M3UN2rr5FqwpeOiDTbD0SzVksGT8N5yvWpu1qqWhE11fG3dpbZXIImaRNzOq7AqfGXL
 DkpHpauR6D7CJYeFajELyaxJ9j/N3Gw5JXgcyHwocv8fLdo8yN5EHF65oDWeE00Al3US
 7RkqAZwHGs/bm4M4GPYTkFvr/69xBKdmnBdZ3JEqKlv3oFtDlYjkvF0EM3EYehrh31RS
 5/0bSsORnoFXaXmov/l6cHv4t89d4gLNvI+r+3Xa2jVLLAbI9EW5XbiM8F/SHJKn71MO
 6ccQ==
X-Gm-Message-State: AOJu0YwfQl4kFaFYw/eElodleImNisuz/4HR+E/WCqTY8uOcUsmXPLsY
 ysnCC8IWDRgvFFU0AAQQNSjrYZNrHTM08t1MaI9uFpig
X-Google-Smtp-Source: AGHT+IEHC04jFzOyt2UFo/slXTKcwStdP7RdJ5VKlyFbAKIEQZWmVkl4YqVVxR8Ctq4+wjmmL0B27w==
X-Received: by 2002:a05:6a00:194c:b0:687:8dba:4ca8 with SMTP id
 s12-20020a056a00194c00b006878dba4ca8mr2937611pfk.30.1691183245113; 
 Fri, 04 Aug 2023 14:07:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e186:e5d2:e60:bad3])
 by smtp.gmail.com with ESMTPSA id
 n22-20020aa78a56000000b0068664ace38asm2037584pfa.19.2023.08.04.14.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 14:07:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFC PATCH 06/10] drm/panel: Don't store+check prepared/enabled for
 panels disabled at shutdown
Date: Fri,  4 Aug 2023 14:06:09 -0700
Message-ID: <20230804140605.RFC.6.I4965e84eede943cf8cc1c8eb604b2d06bd06f423@changeid>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230804210644.1862287-1-dianders@chromium.org>
References: <20230804210644.1862287-1-dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

This is much like the patch ("drm/panel: Don't store+check
prepared/enabled for panels needing shutdown") but this set of panels
used to _just_ call their disable() function at shutdown time. Now
both the disable() and unprepare() will be called. This is probably an
improvement and probably makes the power sequencing more correct, but
it is a change in behavior that needs to be called out. It also has
the potential to delay shutdown by a small amount of time.

As talked about in patch ("drm/panel: Don't store+check
prepared/enabled for panels needing shutdown"), this patch doesn't
attempt to validate that any remove() functions touched will actually
work properly. The main goal here is to avoid storing and
double-checking the prepared and enabled state.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 30 ++----------
 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 42 ++---------------
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   | 45 ++----------------
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   | 46 ++-----------------
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   | 19 ++------
 5 files changed, 16 insertions(+), 166 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 8f4f137a2af6..28b7ae491d12 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -24,6 +24,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 static const char * const regulator_names[] = {
 	"vddp",
@@ -41,9 +42,6 @@ struct jdi_panel {
 	struct gpio_desc *dcdc_en_gpio;
 	struct backlight_device *backlight;
 
-	bool prepared;
-	bool enabled;
-
 	const struct drm_display_mode *mode;
 };
 
@@ -180,13 +178,8 @@ static int jdi_panel_disable(struct drm_panel *panel)
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
 
@@ -196,9 +189,6 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 	struct device *dev = &jdi->dsi->dev;
 	int ret;
 
-	if (!jdi->prepared)
-		return 0;
-
 	jdi_panel_off(jdi);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(jdi->supplies), jdi->supplies);
@@ -211,8 +201,6 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 
 	gpiod_set_value(jdi->dcdc_en_gpio, 0);
 
-	jdi->prepared = false;
-
 	return 0;
 }
 
@@ -222,9 +210,6 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	struct device *dev = &jdi->dsi->dev;
 	int ret;
 
-	if (jdi->prepared)
-		return 0;
-
 	ret = regulator_bulk_enable(ARRAY_SIZE(jdi->supplies), jdi->supplies);
 	if (ret < 0) {
 		dev_err(dev, "regulator enable failed, %d\n", ret);
@@ -254,8 +239,6 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	jdi->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -276,13 +259,8 @@ static int jdi_panel_enable(struct drm_panel *panel)
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
 
@@ -487,9 +465,7 @@ static void jdi_panel_remove(struct mipi_dsi_device *dsi)
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = jdi_panel_disable(&jdi->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
+	drm_panel_helper_shutdown(&jdi->base);
 
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
@@ -503,7 +479,7 @@ static void jdi_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 
-	jdi_panel_disable(&jdi->base);
+	drm_panel_helper_shutdown(&jdi->base);
 }
 
 static struct mipi_dsi_driver jdi_panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 8ba6d8287938..1a4121bd0ec1 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -18,6 +18,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 /*
  * When power is turned off to this panel a minimum off time of 500ms has to be
@@ -32,9 +33,6 @@ struct wuxga_nt_panel {
 
 	struct regulator *supply;
 
-	bool prepared;
-	bool enabled;
-
 	ktime_t earliest_wake;
 
 	const struct drm_display_mode *mode;
@@ -53,28 +51,16 @@ static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_nt)
 static int wuxga_nt_panel_disable(struct drm_panel *panel)
 {
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
-	int mipi_ret, bl_ret = 0;
-
-	if (!wuxga_nt->enabled)
-		return 0;
-
-	mipi_ret = mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
-
-	wuxga_nt->enabled = false;
 
-	return mipi_ret ? mipi_ret : bl_ret;
+	return mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
 }
 
 static int wuxga_nt_panel_unprepare(struct drm_panel *panel)
 {
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
 
-	if (!wuxga_nt->prepared)
-		return 0;
-
 	regulator_disable(wuxga_nt->supply);
 	wuxga_nt->earliest_wake = ktime_add_ms(ktime_get_real(), MIN_POFF_MS);
-	wuxga_nt->prepared = false;
 
 	return 0;
 }
@@ -85,9 +71,6 @@ static int wuxga_nt_panel_prepare(struct drm_panel *panel)
 	int ret;
 	s64 enablewait;
 
-	if (wuxga_nt->prepared)
-		return 0;
-
 	/*
 	 * If the user re-enabled the panel before the required off-time then
 	 * we need to wait the remaining period before re-enabling regulator
@@ -117,8 +100,6 @@ static int wuxga_nt_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	wuxga_nt->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -127,18 +108,6 @@ static int wuxga_nt_panel_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static int wuxga_nt_panel_enable(struct drm_panel *panel)
-{
-	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
-
-	if (wuxga_nt->enabled)
-		return 0;
-
-	wuxga_nt->enabled = true;
-
-	return 0;
-}
-
 static const struct drm_display_mode default_mode = {
 	.clock = 164402,
 	.hdisplay = 1920,
@@ -178,7 +147,6 @@ static const struct drm_panel_funcs wuxga_nt_panel_funcs = {
 	.disable = wuxga_nt_panel_disable,
 	.unprepare = wuxga_nt_panel_unprepare,
 	.prepare = wuxga_nt_panel_prepare,
-	.enable = wuxga_nt_panel_enable,
 	.get_modes = wuxga_nt_panel_get_modes,
 };
 
@@ -255,9 +223,7 @@ static void wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&wuxga_nt->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
+	drm_panel_helper_shutdown(&wuxga_nt->base);
 
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
@@ -270,7 +236,7 @@ static void wuxga_nt_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 
-	drm_panel_disable(&wuxga_nt->base);
+	drm_panel_helper_shutdown(&wuxga_nt->base);
 }
 
 static struct mipi_dsi_driver wuxga_nt_panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 658c7c040570..ca517c642674 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -20,6 +20,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 struct seiko_panel_desc {
 	const struct drm_display_mode *modes;
@@ -44,8 +45,6 @@ struct seiko_panel_desc {
 
 struct seiko_panel {
 	struct drm_panel base;
-	bool prepared;
-	bool enabled;
 	const struct seiko_panel_desc *desc;
 	struct regulator *dvdd;
 	struct regulator *avdd;
@@ -122,25 +121,10 @@ static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
 	return num;
 }
 
-static int seiko_panel_disable(struct drm_panel *panel)
-{
-	struct seiko_panel *p = to_seiko_panel(panel);
-
-	if (!p->enabled)
-		return 0;
-
-	p->enabled = false;
-
-	return 0;
-}
-
 static int seiko_panel_unprepare(struct drm_panel *panel)
 {
 	struct seiko_panel *p = to_seiko_panel(panel);
 
-	if (!p->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
 
 	regulator_disable(p->avdd);
@@ -150,8 +134,6 @@ static int seiko_panel_unprepare(struct drm_panel *panel)
 
 	regulator_disable(p->dvdd);
 
-	p->prepared = false;
-
 	return 0;
 }
 
@@ -160,9 +142,6 @@ static int seiko_panel_prepare(struct drm_panel *panel)
 	struct seiko_panel *p = to_seiko_panel(panel);
 	int err;
 
-	if (p->prepared)
-		return 0;
-
 	err = regulator_enable(p->dvdd);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enable dvdd: %d\n", err);
@@ -180,8 +159,6 @@ static int seiko_panel_prepare(struct drm_panel *panel)
 
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
-	p->prepared = true;
-
 	return 0;
 
 disable_dvdd:
@@ -189,18 +166,6 @@ static int seiko_panel_prepare(struct drm_panel *panel)
 	return err;
 }
 
-static int seiko_panel_enable(struct drm_panel *panel)
-{
-	struct seiko_panel *p = to_seiko_panel(panel);
-
-	if (p->enabled)
-		return 0;
-
-	p->enabled = true;
-
-	return 0;
-}
-
 static int seiko_panel_get_modes(struct drm_panel *panel,
 				 struct drm_connector *connector)
 {
@@ -228,10 +193,8 @@ static int seiko_panel_get_timings(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs seiko_panel_funcs = {
-	.disable = seiko_panel_disable,
 	.unprepare = seiko_panel_unprepare,
 	.prepare = seiko_panel_prepare,
-	.enable = seiko_panel_enable,
 	.get_modes = seiko_panel_get_modes,
 	.get_timings = seiko_panel_get_timings,
 };
@@ -246,8 +209,6 @@ static int seiko_panel_probe(struct device *dev,
 	if (!panel)
 		return -ENOMEM;
 
-	panel->enabled = false;
-	panel->prepared = false;
 	panel->desc = desc;
 
 	panel->dvdd = devm_regulator_get(dev, "dvdd");
@@ -283,14 +244,14 @@ static void seiko_panel_remove(struct platform_device *pdev)
 	struct seiko_panel *panel = platform_get_drvdata(pdev);
 
 	drm_panel_remove(&panel->base);
-	drm_panel_disable(&panel->base);
+	drm_panel_helper_shutdown(&panel->base);
 }
 
 static void seiko_panel_shutdown(struct platform_device *pdev)
 {
 	struct seiko_panel *panel = platform_get_drvdata(pdev);
 
-	drm_panel_disable(&panel->base);
+	drm_panel_helper_shutdown(&panel->base);
 }
 
 static const struct display_timing seiko_43wvf1g_timing = {
diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 14851408a5e1..2a0b64c7d898 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -15,6 +15,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 struct sharp_panel {
 	struct drm_panel base;
@@ -24,9 +25,6 @@ struct sharp_panel {
 
 	struct regulator *supply;
 
-	bool prepared;
-	bool enabled;
-
 	const struct drm_display_mode *mode;
 };
 
@@ -85,26 +83,11 @@ static __maybe_unused int sharp_panel_read(struct sharp_panel *sharp,
 	return err;
 }
 
-static int sharp_panel_disable(struct drm_panel *panel)
-{
-	struct sharp_panel *sharp = to_sharp_panel(panel);
-
-	if (!sharp->enabled)
-		return 0;
-
-	sharp->enabled = false;
-
-	return 0;
-}
-
 static int sharp_panel_unprepare(struct drm_panel *panel)
 {
 	struct sharp_panel *sharp = to_sharp_panel(panel);
 	int err;
 
-	if (!sharp->prepared)
-		return 0;
-
 	sharp_wait_frames(sharp, 4);
 
 	err = mipi_dsi_dcs_set_display_off(sharp->link1);
@@ -119,8 +102,6 @@ static int sharp_panel_unprepare(struct drm_panel *panel)
 
 	regulator_disable(sharp->supply);
 
-	sharp->prepared = false;
-
 	return 0;
 }
 
@@ -164,9 +145,6 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 	u8 format = MIPI_DCS_PIXEL_FMT_24BIT;
 	int err;
 
-	if (sharp->prepared)
-		return 0;
-
 	err = regulator_enable(sharp->supply);
 	if (err < 0)
 		return err;
@@ -235,8 +213,6 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	sharp->prepared = true;
-
 	/* wait for 6 frames before continuing */
 	sharp_wait_frames(sharp, 6);
 
@@ -247,18 +223,6 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 	return err;
 }
 
-static int sharp_panel_enable(struct drm_panel *panel)
-{
-	struct sharp_panel *sharp = to_sharp_panel(panel);
-
-	if (sharp->enabled)
-		return 0;
-
-	sharp->enabled = true;
-
-	return 0;
-}
-
 static const struct drm_display_mode default_mode = {
 	.clock = 278000,
 	.hdisplay = 2560,
@@ -295,10 +259,8 @@ static int sharp_panel_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs sharp_panel_funcs = {
-	.disable = sharp_panel_disable,
 	.unprepare = sharp_panel_unprepare,
 	.prepare = sharp_panel_prepare,
-	.enable = sharp_panel_enable,
 	.get_modes = sharp_panel_get_modes,
 };
 
@@ -402,9 +364,7 @@ static void sharp_panel_remove(struct mipi_dsi_device *dsi)
 		return;
 	}
 
-	err = drm_panel_disable(&sharp->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+	drm_panel_helper_shutdown(&sharp->base);
 
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
@@ -421,7 +381,7 @@ static void sharp_panel_shutdown(struct mipi_dsi_device *dsi)
 	if (!sharp)
 		return;
 
-	drm_panel_disable(&sharp->base);
+	drm_panel_helper_shutdown(&sharp->base);
 }
 
 static struct mipi_dsi_driver sharp_panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 855e64444daa..7f8c6e5c389f 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -19,6 +19,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 struct sharp_nt_panel {
 	struct drm_panel base;
@@ -26,8 +27,6 @@ struct sharp_nt_panel {
 
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
-
-	bool prepared;
 };
 
 static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
@@ -99,9 +98,6 @@ static int sharp_nt_panel_unprepare(struct drm_panel *panel)
 	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
 	int ret;
 
-	if (!sharp_nt->prepared)
-		return 0;
-
 	ret = sharp_nt_panel_off(sharp_nt);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
@@ -112,8 +108,6 @@ static int sharp_nt_panel_unprepare(struct drm_panel *panel)
 	if (sharp_nt->reset_gpio)
 		gpiod_set_value(sharp_nt->reset_gpio, 0);
 
-	sharp_nt->prepared = false;
-
 	return 0;
 }
 
@@ -122,9 +116,6 @@ static int sharp_nt_panel_prepare(struct drm_panel *panel)
 	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
 	int ret;
 
-	if (sharp_nt->prepared)
-		return 0;
-
 	ret = regulator_enable(sharp_nt->supply);
 	if (ret < 0)
 		return ret;
@@ -152,8 +143,6 @@ static int sharp_nt_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	sharp_nt->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -279,9 +268,7 @@ static void sharp_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct sharp_nt_panel *sharp_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&sharp_nt->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
+	drm_panel_helper_shutdown(&sharp_nt->base);
 
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
@@ -294,7 +281,7 @@ static void sharp_nt_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct sharp_nt_panel *sharp_nt = mipi_dsi_get_drvdata(dsi);
 
-	drm_panel_disable(&sharp_nt->base);
+	drm_panel_helper_shutdown(&sharp_nt->base);
 }
 
 static const struct of_device_id sharp_nt_of_match[] = {
-- 
2.41.0.585.gd2178a4bd4-goog

