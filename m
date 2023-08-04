Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B89770A73
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 23:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BE610E12F;
	Fri,  4 Aug 2023 21:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC2A10E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:07:24 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-686ba97e4feso2333118b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 14:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691183244; x=1691788044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VNDAtrU25aj6ZP4bQWj0APLJi4B34GsziEpWhng/8JI=;
 b=N6dNfcKtQXSBke+mS4nTeXCQtCgohPrw4TJPlo/PdyO5S1VfnJ0lLEF5d6rrflEVsf
 aimcxuM4ZwvGDe4cNiVLrqdlOaUEGJLyRSTegRpvymbhG/yRHvfWdvI7dCMGVrjRDTtw
 wTp4mI50n4njBi6P4ZmqVJcbX9jNMdOv4MnA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691183244; x=1691788044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VNDAtrU25aj6ZP4bQWj0APLJi4B34GsziEpWhng/8JI=;
 b=N4btuwXLzqqYoKXb+BIrqcbczGtZGDtaoLBy6/4A0rRYxFb+ZBA4gio/EiuRZ4gZjV
 1KUZLQiREKsQVjJ7bmoB6fft7mPspWO0grmwxW5FoumHBJ+kXchSmru17LtezBUakeSk
 Qm5Xx8SgKiBJwaWETvLDAUAgkqXO04niW1si/Y4wdNmhKfkxJW+/DVls0Ys4ky0SxmSc
 jSwsE9JbpljfKeueXmIM22zG6SIaTh6tc0NknsUnuiAQSFlh4k2GA2ija9n46fTP90/J
 aJEQ4IKfISDMf8HA8KPW8Gt8IYxVrX1QONdfspLLwbvl7gfYRBbARDL7JmdjH36XIble
 QSxA==
X-Gm-Message-State: AOJu0Yw2cogA1n43RHwSMVFEcMprROemao8CUmALD1HkAubIdoHFsUNe
 Uz5A9E3yqoOqwMriorbSjNqtxROwiuIXOvsnkK1LpYbS
X-Google-Smtp-Source: AGHT+IFkbNOFoh/VI4k1FOKVvL/4zX2h+f9c0koj1hj0xdsNC4QSnnSpGjC+Wrgn2SfibLOdC4Cvgw==
X-Received: by 2002:aa7:8884:0:b0:687:9909:3c75 with SMTP id
 z4-20020aa78884000000b0068799093c75mr3885000pfe.4.1691183243227; 
 Fri, 04 Aug 2023 14:07:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e186:e5d2:e60:bad3])
 by smtp.gmail.com with ESMTPSA id
 n22-20020aa78a56000000b0068664ace38asm2037584pfa.19.2023.08.04.14.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 14:07:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFC PATCH 05/10] drm/panel: Don't store+check prepared/enabled for
 panels needing shutdown
Date: Fri,  4 Aug 2023 14:06:08 -0700
Message-ID: <20230804140605.RFC.5.Icc3238e91bc726d4b04c51a4acf67f001ec453d7@changeid>
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
 Stefan Mavrodiev <stefan@olimex.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Ondrej Jirman <megi@xff.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

A number of panels seemed to need the extra double-checking of the
prepared/enabled state to handle driver remove and/or shutdown. This
set of drivers was easy to transform and used to call
drm_panel_unprepare() and drm_panel_disable(). It's easy to move them
to call the drm_panel_helper_shutdown() that does the double-checking
for the panels.

NOTE: this patch doesn't attempt to sanitize the shutdown or remove
functions of these panels, it merely tries to preserve the old
behavior while removing the need for the panels to track
prepared/enabled state themselves. Specifically it can be noted that
removing an in-use panel is not necessarily straightfoward and may not
be correct in most panels.

ALSO NOTE: some of the panels touched in this path used to not
complain about disable/unprepare error at shutdown time. Now that
we're using the drm_panel_helper_shutdown() function we'll
consistently warn about these errors.

THIRDLY NOTE: One of these panels, "boe-himax8279d", used to call its
unprepare() and disable() functions directly instead of calling
drm_panel_unprepare() and drm_panel_disable(). I believe that the only
difference is that "boe-himax8279d" will now turn off its backlight at
shutdown/remove. This will also pave the way if anyone wants to use
this panel w/ the new "panel follower" APIs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-boe-himax8279d.c  | 36 ++-----------
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 16 +-----
 drivers/gpu/drm/panel/panel-edp.c             | 34 ++-----------
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  | 21 +-------
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 21 +-------
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 51 ++-----------------
 drivers/gpu/drm/panel/panel-khadas-ts050.c    | 35 ++-----------
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 43 ++--------------
 .../drm/panel/panel-leadtek-ltk050h3146w.c    | 21 +-------
 .../drm/panel/panel-leadtek-ltk500hd1829.c    | 21 +-------
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 24 ++-------
 .../drm/panel/panel-olimex-lcd-olinuxino.c    | 45 +---------------
 .../drm/panel/panel-osd-osd101t2587-53ts.c    | 37 ++------------
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 31 ++---------
 drivers/gpu/drm/panel/panel-simple.c          | 34 ++-----------
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  | 19 ++-----
 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 21 +-------
 17 files changed, 45 insertions(+), 465 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index 11b64acbe8a9..cccf9400fa99 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -18,6 +18,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 #include <video/mipi_display.h>
 
@@ -47,9 +48,6 @@ struct panel_info {
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *pp33_gpio;
 	struct gpio_desc *pp18_gpio;
-
-	bool prepared;
-	bool enabled;
 };
 
 static inline struct panel_info *to_panel_info(struct drm_panel *panel)
@@ -86,17 +84,12 @@ static int boe_panel_disable(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;
 
-	if (!pinfo->enabled)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
 		return err;
 	}
 
-	pinfo->enabled = false;
-
 	return 0;
 }
 
@@ -105,9 +98,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;
 
-	if (!pinfo->prepared)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -121,8 +111,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 
 	disable_gpios(pinfo);
 
-	pinfo->prepared = false;
-
 	return 0;
 }
 
@@ -131,9 +119,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;
 
-	if (pinfo->prepared)
-		return 0;
-
 	gpiod_set_value(pinfo->pp18_gpio, 1);
 	/* T1: 5ms - 6ms */
 	usleep_range(5000, 6000);
@@ -180,8 +165,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	/* T7: 20ms - 21ms */
 	usleep_range(20000, 21000);
 
-	pinfo->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -194,9 +177,6 @@ static int boe_panel_enable(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int ret;
 
-	if (pinfo->enabled)
-		return 0;
-
 	usleep_range(120000, 121000);
 
 	ret = mipi_dsi_dcs_set_display_on(pinfo->link);
@@ -205,8 +185,6 @@ static int boe_panel_enable(struct drm_panel *panel)
 		return ret;
 	}
 
-	pinfo->enabled = true;
-
 	return 0;
 }
 
@@ -923,14 +901,7 @@ static void panel_remove(struct mipi_dsi_device *dsi)
 	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = boe_panel_disable(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
-
-	err = boe_panel_unprepare(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
+	drm_panel_helper_shutdown(&pinfo->base);
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
@@ -942,8 +913,7 @@ static void panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
 
-	boe_panel_disable(&pinfo->base);
-	boe_panel_unprepare(&pinfo->base);
+	drm_panel_helper_shutdown(&pinfo->base);
 }
 
 static struct mipi_dsi_driver panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 5ac926281d2c..72cb9a10fe43 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -14,6 +14,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 #include <video/mipi_display.h>
 
@@ -50,8 +51,6 @@ struct boe_panel {
 	struct regulator *avee;
 	struct regulator *avdd;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
 };
 
 enum dsi_cmd_type {
@@ -1792,9 +1791,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
 
-	if (!boe->prepared)
-		return 0;
-
 	if (boe->desc->discharge_on_disable) {
 		regulator_disable(boe->avee);
 		regulator_disable(boe->avdd);
@@ -1813,8 +1809,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		regulator_disable(boe->pp3300);
 	}
 
-	boe->prepared = false;
-
 	return 0;
 }
 
@@ -1823,9 +1817,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct boe_panel *boe = to_boe_panel(panel);
 	int ret;
 
-	if (boe->prepared)
-		return 0;
-
 	gpiod_set_value(boe->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
@@ -1865,8 +1856,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	boe->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -2292,8 +2281,7 @@ static void boe_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
 
-	drm_panel_disable(&boe->base);
-	drm_panel_unprepare(&boe->base);
+	drm_panel_helper_shutdown(&boe->base);
 }
 
 static void boe_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index feb665df35a1..fd8987702140 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -41,6 +41,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 /**
  * struct panel_delay - Describes delays for a simple panel.
@@ -207,11 +208,8 @@ struct edp_panel_entry {
 
 struct panel_edp {
 	struct drm_panel base;
-	bool enabled;
 	bool no_hpd;
 
-	bool prepared;
-
 	ktime_t prepared_time;
 	ktime_t unprepared_time;
 
@@ -361,14 +359,9 @@ static int panel_edp_disable(struct drm_panel *panel)
 {
 	struct panel_edp *p = to_panel_edp(panel);
 
-	if (!p->enabled)
-		return 0;
-
 	if (p->desc->delay.disable)
 		msleep(p->desc->delay.disable);
 
-	p->enabled = false;
-
 	return 0;
 }
 
@@ -385,18 +378,12 @@ static int panel_edp_suspend(struct device *dev)
 
 static int panel_edp_unprepare(struct drm_panel *panel)
 {
-	struct panel_edp *p = to_panel_edp(panel);
 	int ret;
 
-	/* Unpreparing when already unprepared is a no-op */
-	if (!p->prepared)
-		return 0;
-
 	pm_runtime_mark_last_busy(panel->dev);
 	ret = pm_runtime_put_autosuspend(panel->dev);
 	if (ret < 0)
 		return ret;
-	p->prepared = false;
 
 	return 0;
 }
@@ -504,21 +491,14 @@ static int panel_edp_resume(struct device *dev)
 
 static int panel_edp_prepare(struct drm_panel *panel)
 {
-	struct panel_edp *p = to_panel_edp(panel);
 	int ret;
 
-	/* Preparing when already prepared is a no-op */
-	if (p->prepared)
-		return 0;
-
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
 		pm_runtime_put_autosuspend(panel->dev);
 		return ret;
 	}
 
-	p->prepared = true;
-
 	return 0;
 }
 
@@ -527,9 +507,6 @@ static int panel_edp_enable(struct drm_panel *panel)
 	struct panel_edp *p = to_panel_edp(panel);
 	unsigned int delay;
 
-	if (p->enabled)
-		return 0;
-
 	delay = p->desc->delay.enable;
 
 	/*
@@ -558,8 +535,6 @@ static int panel_edp_enable(struct drm_panel *panel)
 
 	panel_edp_wait(p->prepared_time, p->desc->delay.prepare_to_enable);
 
-	p->enabled = true;
-
 	return 0;
 }
 
@@ -807,7 +782,6 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 	if (!panel)
 		return -ENOMEM;
 
-	panel->enabled = false;
 	panel->prepared_time = 0;
 	panel->desc = desc;
 	panel->aux = aux;
@@ -908,8 +882,7 @@ static void panel_edp_remove(struct device *dev)
 	struct panel_edp *panel = dev_get_drvdata(dev);
 
 	drm_panel_remove(&panel->base);
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	drm_panel_helper_shutdown(&panel->base);
 
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
@@ -924,8 +897,7 @@ static void panel_edp_shutdown(struct device *dev)
 {
 	struct panel_edp *panel = dev_get_drvdata(dev);
 
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	drm_panel_helper_shutdown(&panel->base);
 }
 
 static const struct display_timing auo_b101ean01_timing = {
diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index e7be15b68102..b76dd85d41b4 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -22,6 +22,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 /* Manufacturer specific Commands send via DSI */
 #define KD35T133_CMD_INTERFACEMODECTRL		0xb0
@@ -43,7 +44,6 @@ struct kd35t133 {
 	struct regulator *vdd;
 	struct regulator *iovcc;
 	enum drm_panel_orientation orientation;
-	bool prepared;
 };
 
 static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
@@ -91,9 +91,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
 		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
@@ -107,8 +104,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vdd);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -118,9 +113,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vdd);
 	if (ret < 0) {
@@ -164,8 +156,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
 
 	msleep(50);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_iovcc:
@@ -302,15 +292,8 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
 static void kd35t133_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
 
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+	drm_panel_helper_shutdown(&ctx->panel);
 }
 
 static void kd35t133_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c73243d85de7..3e75d48aae0a 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -23,6 +23,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 #define DRV_NAME "panel-himax-hx8394"
 
@@ -68,7 +69,6 @@ struct hx8394 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
-	bool prepared;
 
 	const struct hx8394_panel_desc *desc;
 };
@@ -262,16 +262,11 @@ static int hx8394_unprepare(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 
-	if (!ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vcc);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -280,9 +275,6 @@ static int hx8394_prepare(struct drm_panel *panel)
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	ret = regulator_enable(ctx->vcc);
@@ -301,8 +293,6 @@ static int hx8394_prepare(struct drm_panel *panel)
 
 	msleep(180);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_vcc:
@@ -404,15 +394,8 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 static void hx8394_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
 
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
+	drm_panel_helper_shutdown(&ctx->panel);
 }
 
 static void hx8394_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 485178a99910..cc2a05a38972 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -16,6 +16,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 struct panel_init_cmd {
 	size_t len;
@@ -51,9 +52,6 @@ struct innolux_panel {
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
-	bool enabled;
 };
 
 static inline struct innolux_panel *to_innolux_panel(struct drm_panel *panel)
@@ -61,26 +59,11 @@ static inline struct innolux_panel *to_innolux_panel(struct drm_panel *panel)
 	return container_of(panel, struct innolux_panel, base);
 }
 
-static int innolux_panel_disable(struct drm_panel *panel)
-{
-	struct innolux_panel *innolux = to_innolux_panel(panel);
-
-	if (!innolux->enabled)
-		return 0;
-
-	innolux->enabled = false;
-
-	return 0;
-}
-
 static int innolux_panel_unprepare(struct drm_panel *panel)
 {
 	struct innolux_panel *innolux = to_innolux_panel(panel);
 	int err;
 
-	if (!innolux->prepared)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(innolux->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -104,8 +87,6 @@ static int innolux_panel_unprepare(struct drm_panel *panel)
 	if (err < 0)
 		return err;
 
-	innolux->prepared = false;
-
 	return 0;
 }
 
@@ -114,9 +95,6 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 	struct innolux_panel *innolux = to_innolux_panel(panel);
 	int err;
 
-	if (innolux->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(innolux->enable_gpio, 0);
 
 	err = regulator_bulk_enable(innolux->desc->num_supplies,
@@ -178,8 +156,6 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 	/* T7: 5ms */
 	usleep_range(5000, 6000);
 
-	innolux->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -189,18 +165,6 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 	return err;
 }
 
-static int innolux_panel_enable(struct drm_panel *panel)
-{
-	struct innolux_panel *innolux = to_innolux_panel(panel);
-
-	if (innolux->enabled)
-		return 0;
-
-	innolux->enabled = true;
-
-	return 0;
-}
-
 static const char * const innolux_p079zca_supply_names[] = {
 	"power",
 };
@@ -407,10 +371,8 @@ static int innolux_panel_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs innolux_panel_funcs = {
-	.disable = innolux_panel_disable,
 	.unprepare = innolux_panel_unprepare,
 	.prepare = innolux_panel_prepare,
-	.enable = innolux_panel_enable,
 	.get_modes = innolux_panel_get_modes,
 };
 
@@ -510,13 +472,7 @@ static void innolux_panel_remove(struct mipi_dsi_device *dsi)
 	struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = drm_panel_unprepare(&innolux->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
-	err = drm_panel_disable(&innolux->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+	drm_panel_helper_shutdown(&innolux->base);
 
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
@@ -529,8 +485,7 @@ static void innolux_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
 
-	drm_panel_unprepare(&innolux->base);
-	drm_panel_disable(&innolux->base);
+	drm_panel_helper_shutdown(&innolux->base);
 }
 
 static struct mipi_dsi_driver innolux_panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index b942a0162274..ed46b1d19e7c 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -17,6 +17,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 struct khadas_ts050_panel {
 	struct drm_panel base;
@@ -25,9 +26,6 @@ struct khadas_ts050_panel {
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
-	bool enabled;
 };
 
 struct khadas_ts050_panel_cmd {
@@ -584,9 +582,6 @@ static int khadas_ts050_panel_prepare(struct drm_panel *panel)
 	unsigned int i;
 	int err;
 
-	if (khadas_ts050->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(khadas_ts050->enable_gpio, 0);
 
 	err = regulator_enable(khadas_ts050->supply);
@@ -649,8 +644,6 @@ static int khadas_ts050_panel_prepare(struct drm_panel *panel)
 
 	usleep_range(10000, 11000);
 
-	khadas_ts050->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -667,11 +660,6 @@ static int khadas_ts050_panel_unprepare(struct drm_panel *panel)
 	struct khadas_ts050_panel *khadas_ts050 = to_khadas_ts050_panel(panel);
 	int err;
 
-	if (!khadas_ts050->prepared)
-		return 0;
-
-	khadas_ts050->prepared = false;
-
 	err = mipi_dsi_dcs_enter_sleep_mode(khadas_ts050->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
@@ -688,31 +676,17 @@ static int khadas_ts050_panel_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int khadas_ts050_panel_enable(struct drm_panel *panel)
-{
-	struct khadas_ts050_panel *khadas_ts050 = to_khadas_ts050_panel(panel);
-
-	khadas_ts050->enabled = true;
-
-	return 0;
-}
-
 static int khadas_ts050_panel_disable(struct drm_panel *panel)
 {
 	struct khadas_ts050_panel *khadas_ts050 = to_khadas_ts050_panel(panel);
 	int err;
 
-	if (!khadas_ts050->enabled)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(khadas_ts050->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
 
 	usleep_range(10000, 11000);
 
-	khadas_ts050->enabled = false;
-
 	return 0;
 }
 
@@ -756,7 +730,6 @@ static int khadas_ts050_panel_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs khadas_ts050_panel_funcs = {
 	.prepare = khadas_ts050_panel_prepare,
 	.unprepare = khadas_ts050_panel_unprepare,
-	.enable = khadas_ts050_panel_enable,
 	.disable = khadas_ts050_panel_disable,
 	.get_modes = khadas_ts050_panel_get_modes,
 };
@@ -840,16 +813,14 @@ static void khadas_ts050_panel_remove(struct mipi_dsi_device *dsi)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	drm_panel_remove(&khadas_ts050->base);
-	drm_panel_disable(&khadas_ts050->base);
-	drm_panel_unprepare(&khadas_ts050->base);
+	drm_panel_helper_shutdown(&khadas_ts050->base);
 }
 
 static void khadas_ts050_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct khadas_ts050_panel *khadas_ts050 = mipi_dsi_get_drvdata(dsi);
 
-	drm_panel_disable(&khadas_ts050->base);
-	drm_panel_unprepare(&khadas_ts050->base);
+	drm_panel_helper_shutdown(&khadas_ts050->base);
 }
 
 static struct mipi_dsi_driver khadas_ts050_panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 17f8d80cf2b3..b86f24875985 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -16,6 +16,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 struct kingdisplay_panel {
 	struct drm_panel base;
@@ -23,9 +24,6 @@ struct kingdisplay_panel {
 
 	struct regulator *supply;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
-	bool enabled;
 };
 
 struct kingdisplay_panel_cmd {
@@ -185,15 +183,10 @@ static int kingdisplay_panel_disable(struct drm_panel *panel)
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
 	int err;
 
-	if (!kingdisplay->enabled)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(kingdisplay->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
 
-	kingdisplay->enabled = false;
-
 	return 0;
 }
 
@@ -202,9 +195,6 @@ static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
 	int err;
 
-	if (!kingdisplay->prepared)
-		return 0;
-
 	err = mipi_dsi_dcs_enter_sleep_mode(kingdisplay->link);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
@@ -220,8 +210,6 @@ static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 	if (err < 0)
 		return err;
 
-	kingdisplay->prepared = false;
-
 	return 0;
 }
 
@@ -231,9 +219,6 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	int err, regulator_err;
 	unsigned int i;
 
-	if (kingdisplay->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(kingdisplay->enable_gpio, 0);
 
 	err = regulator_enable(kingdisplay->supply);
@@ -275,8 +260,6 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	/* T7: 10ms */
 	usleep_range(10000, 11000);
 
-	kingdisplay->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -289,18 +272,6 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	return err;
 }
 
-static int kingdisplay_panel_enable(struct drm_panel *panel)
-{
-	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
-
-	if (kingdisplay->enabled)
-		return 0;
-
-	kingdisplay->enabled = true;
-
-	return 0;
-}
-
 static const struct drm_display_mode default_mode = {
 	.clock = 229000,
 	.hdisplay = 1536,
@@ -341,7 +312,6 @@ static const struct drm_panel_funcs kingdisplay_panel_funcs = {
 	.disable = kingdisplay_panel_disable,
 	.unprepare = kingdisplay_panel_unprepare,
 	.prepare = kingdisplay_panel_prepare,
-	.enable = kingdisplay_panel_enable,
 	.get_modes = kingdisplay_panel_get_modes,
 };
 
@@ -420,13 +390,7 @@ static void kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = drm_panel_unprepare(&kingdisplay->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
-	err = drm_panel_disable(&kingdisplay->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+	drm_panel_helper_shutdown(&kingdisplay->base);
 
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
@@ -439,8 +403,7 @@ static void kingdisplay_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
 
-	drm_panel_unprepare(&kingdisplay->base);
-	drm_panel_disable(&kingdisplay->base);
+	drm_panel_helper_shutdown(&kingdisplay->base);
 }
 
 static struct mipi_dsi_driver kingdisplay_panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index d41482d3a34f..ae07d23e26f9 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -16,6 +16,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 struct ltk050h3146w_cmd {
 	char cmd;
@@ -35,7 +36,6 @@ struct ltk050h3146w {
 	struct regulator *vci;
 	struct regulator *iovcc;
 	const struct ltk050h3146w_desc *panel_desc;
-	bool prepared;
 };
 
 static const struct ltk050h3146w_cmd page1_cmds[] = {
@@ -432,9 +432,6 @@ static int ltk050h3146w_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0) {
 		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
@@ -450,8 +447,6 @@ static int ltk050h3146w_unprepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vci);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -461,9 +456,6 @@ static int ltk050h3146w_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vci);
 	if (ret < 0) {
@@ -504,8 +496,6 @@ static int ltk050h3146w_prepare(struct drm_panel *panel)
 
 	msleep(50);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_iovcc:
@@ -608,15 +598,8 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
 static void ltk050h3146w_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct ltk050h3146w *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
 
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+	drm_panel_helper_shutdown(&ctx->panel);
 }
 
 static void ltk050h3146w_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index 39e408c9f762..8f26f0b51a06 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -20,6 +20,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 struct ltk500hd1829 {
 	struct device *dev;
@@ -27,7 +28,6 @@ struct ltk500hd1829 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
-	bool prepared;
 };
 
 struct ltk500hd1829_cmd {
@@ -272,9 +272,6 @@ static int ltk500hd1829_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", ret);
@@ -290,8 +287,6 @@ static int ltk500hd1829_unprepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vcc);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -302,9 +297,6 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 	unsigned int i;
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	ret = regulator_enable(ctx->vcc);
 	if (ret < 0) {
 		dev_err(ctx->dev, "Failed to enable vci supply: %d\n", ret);
@@ -348,8 +340,6 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 		goto disable_iovcc;
 	}
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_iovcc:
@@ -466,15 +456,8 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
 static void ltk500hd1829_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct ltk500hd1829 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
 
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+	drm_panel_helper_shutdown(&ctx->panel);
 }
 
 static void ltk500hd1829_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 33fb3d715e54..8447cc9887d2 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -25,6 +25,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 #include <video/mipi_display.h>
 
@@ -72,8 +73,6 @@ struct nt36672a_panel {
 	struct regulator_bulk_data supplies[ARRAY_SIZE(nt36672a_regulator_names)];
 
 	struct gpio_desc *reset_gpio;
-
-	bool prepared;
 };
 
 static inline struct nt36672a_panel *to_nt36672a_panel(struct drm_panel *panel)
@@ -119,9 +118,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
 	int ret;
 
-	if (!pinfo->prepared)
-		return 0;
-
 	/* send off cmds */
 	ret = nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
 				 pinfo->desc->num_off_cmds);
@@ -147,8 +143,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
 	if (ret < 0)
 		dev_err(panel->dev, "power_off failed ret = %d\n", ret);
 
-	pinfo->prepared = false;
-
 	return ret;
 }
 
@@ -179,9 +173,6 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
 	int err;
 
-	if (pinfo->prepared)
-		return 0;
-
 	err = nt36672a_panel_power_on(pinfo);
 	if (err < 0)
 		goto poweroff;
@@ -221,8 +212,6 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
 
 	msleep(120);
 
-	pinfo->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -673,13 +662,7 @@ static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
 	struct nt36672a_panel *pinfo = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = drm_panel_unprepare(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
-	err = drm_panel_disable(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+	drm_panel_helper_shutdown(&pinfo->base);
 
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
@@ -692,8 +675,7 @@ static void nt36672a_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct nt36672a_panel *pinfo = mipi_dsi_get_drvdata(dsi);
 
-	drm_panel_disable(&pinfo->base);
-	drm_panel_unprepare(&pinfo->base);
+	drm_panel_helper_shutdown(&pinfo->base);
 }
 
 static const struct of_device_id tianma_fhd_video_of_match[] = {
diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 4819ada69482..ee89f0c99986 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -20,6 +20,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 #define LCD_OLINUXINO_HEADER_MAGIC	0x4F4CB727
 #define LCD_OLINUXINO_DATA_LEN		256
@@ -64,9 +65,6 @@ struct lcd_olinuxino {
 	struct i2c_client *client;
 	struct mutex mutex;
 
-	bool prepared;
-	bool enabled;
-
 	struct regulator *supply;
 	struct gpio_desc *enable_gpio;
 
@@ -78,30 +76,13 @@ static inline struct lcd_olinuxino *to_lcd_olinuxino(struct drm_panel *panel)
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
 
@@ -110,27 +91,11 @@ static int lcd_olinuxino_prepare(struct drm_panel *panel)
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
@@ -195,10 +160,8 @@ static int lcd_olinuxino_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs lcd_olinuxino_funcs = {
-	.disable = lcd_olinuxino_disable,
 	.unprepare = lcd_olinuxino_unprepare,
 	.prepare = lcd_olinuxino_prepare,
-	.enable = lcd_olinuxino_enable,
 	.get_modes = lcd_olinuxino_get_modes,
 };
 
@@ -264,9 +227,6 @@ static int lcd_olinuxino_probe(struct i2c_client *client)
 		lcd->eeprom.num_modes = 4;
 	}
 
-	lcd->enabled = false;
-	lcd->prepared = false;
-
 	lcd->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(lcd->supply))
 		return PTR_ERR(lcd->supply);
@@ -293,8 +253,7 @@ static void lcd_olinuxino_remove(struct i2c_client *client)
 
 	drm_panel_remove(&panel->panel);
 
-	drm_panel_disable(&panel->panel);
-	drm_panel_unprepare(&panel->panel);
+	drm_panel_helper_shutdown(&panel->panel);
 }
 
 static const struct of_device_id lcd_olinuxino_of_ids[] = {
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 493e0504f6f7..b299e999d5b5 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -12,6 +12,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 #include <video/mipi_display.h>
 
@@ -21,9 +22,6 @@ struct osd101t2587_panel {
 
 	struct regulator *supply;
 
-	bool prepared;
-	bool enabled;
-
 	const struct drm_display_mode *default_mode;
 };
 
@@ -37,13 +35,8 @@ static int osd101t2587_panel_disable(struct drm_panel *panel)
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	int ret;
 
-	if (!osd101t2587->enabled)
-		return 0;
-
 	ret = mipi_dsi_shutdown_peripheral(osd101t2587->dsi);
 
-	osd101t2587->enabled = false;
-
 	return ret;
 }
 
@@ -51,11 +44,7 @@ static int osd101t2587_panel_unprepare(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 
-	if (!osd101t2587->prepared)
-		return 0;
-
 	regulator_disable(osd101t2587->supply);
-	osd101t2587->prepared = false;
 
 	return 0;
 }
@@ -63,16 +52,8 @@ static int osd101t2587_panel_unprepare(struct drm_panel *panel)
 static int osd101t2587_panel_prepare(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
-	int ret;
-
-	if (osd101t2587->prepared)
-		return 0;
 
-	ret = regulator_enable(osd101t2587->supply);
-	if (!ret)
-		osd101t2587->prepared = true;
-
-	return ret;
+	return regulator_enable(osd101t2587->supply);
 }
 
 static int osd101t2587_panel_enable(struct drm_panel *panel)
@@ -80,15 +61,10 @@ static int osd101t2587_panel_enable(struct drm_panel *panel)
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	int ret;
 
-	if (osd101t2587->enabled)
-		return 0;
-
 	ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
 	if (ret)
 		return ret;
 
-	osd101t2587->enabled = true;
-
 	return ret;
 }
 
@@ -211,11 +187,7 @@ static void osd101t2587_panel_remove(struct mipi_dsi_device *dsi)
 	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&osd101t2587->base);
-	if (ret < 0)
-		dev_warn(&dsi->dev, "failed to disable panel: %d\n", ret);
-
-	drm_panel_unprepare(&osd101t2587->base);
+	drm_panel_helper_shutdown(&osd101t2587->base);
 	drm_panel_remove(&osd101t2587->base);
 
 	ret = mipi_dsi_detach(dsi);
@@ -227,8 +199,7 @@ static void osd101t2587_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
 
-	drm_panel_disable(&osd101t2587->base);
-	drm_panel_unprepare(&osd101t2587->base);
+	drm_panel_helper_shutdown(&osd101t2587->base);
 }
 
 static struct mipi_dsi_driver osd101t2587_panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 5703f4712d96..e46eb8a0b1e9 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -18,6 +18,7 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 /* T3 VCC to HPD high is max 200 ms */
 #define HPD_MAX_MS	200
@@ -25,8 +26,6 @@
 
 struct atana33xc20_panel {
 	struct drm_panel base;
-	bool prepared;
-	bool enabled;
 	bool el3_was_on;
 
 	bool no_hpd;
@@ -137,13 +136,8 @@ static int atana33xc20_disable(struct drm_panel *panel)
 {
 	struct atana33xc20_panel *p = to_atana33xc20(panel);
 
-	/* Disabling when already disabled is a no-op */
-	if (!p->enabled)
-		return 0;
-
 	gpiod_set_value_cansleep(p->el_on3_gpio, 0);
 	p->el_on3_off_time = ktime_get_boottime();
-	p->enabled = false;
 
 	/*
 	 * Keep track of the fact that EL_ON3 was on but we haven't power
@@ -167,10 +161,6 @@ static int atana33xc20_enable(struct drm_panel *panel)
 {
 	struct atana33xc20_panel *p = to_atana33xc20(panel);
 
-	/* Enabling when already enabled is a no-op */
-	if (p->enabled)
-		return 0;
-
 	/*
 	 * Once EL_ON3 drops we absolutely need a power cycle before the next
 	 * enable or the backlight will never come on again. The code ensures
@@ -189,20 +179,14 @@ static int atana33xc20_enable(struct drm_panel *panel)
 	atana33xc20_wait(p->powered_on_time, 400);
 
 	gpiod_set_value_cansleep(p->el_on3_gpio, 1);
-	p->enabled = true;
 
 	return 0;
 }
 
 static int atana33xc20_unprepare(struct drm_panel *panel)
 {
-	struct atana33xc20_panel *p = to_atana33xc20(panel);
 	int ret;
 
-	/* Unpreparing when already unprepared is a no-op */
-	if (!p->prepared)
-		return 0;
-
 	/*
 	 * Purposely do a put_sync, don't use autosuspend. The panel's tcon
 	 * seems to sometimes crash when you stop giving it data and this is
@@ -214,26 +198,19 @@ static int atana33xc20_unprepare(struct drm_panel *panel)
 	ret = pm_runtime_put_sync_suspend(panel->dev);
 	if (ret < 0)
 		return ret;
-	p->prepared = false;
 
 	return 0;
 }
 
 static int atana33xc20_prepare(struct drm_panel *panel)
 {
-	struct atana33xc20_panel *p = to_atana33xc20(panel);
 	int ret;
 
-	/* Preparing when already prepared is a no-op */
-	if (p->prepared)
-		return 0;
-
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
 		pm_runtime_put_autosuspend(panel->dev);
 		return ret;
 	}
-	p->prepared = true;
 
 	return 0;
 }
@@ -337,8 +314,7 @@ static void atana33xc20_remove(struct dp_aux_ep_device *aux_ep)
 	struct atana33xc20_panel *panel = dev_get_drvdata(dev);
 
 	drm_panel_remove(&panel->base);
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	drm_panel_helper_shutdown(&panel->base);
 
 	kfree(panel->edid);
 }
@@ -348,8 +324,7 @@ static void atana33xc20_shutdown(struct dp_aux_ep_device *aux_ep)
 	struct device *dev = &aux_ep->dev;
 	struct atana33xc20_panel *panel = dev_get_drvdata(dev);
 
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	drm_panel_helper_shutdown(&panel->base);
 }
 
 static const struct of_device_id atana33xc20_dt_match[] = {
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 72cef64441a6..6ccf0f6727b7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -40,6 +40,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 /**
  * struct panel_desc - Describes a simple panel.
@@ -137,9 +138,6 @@ struct panel_desc {
 
 struct panel_simple {
 	struct drm_panel base;
-	bool enabled;
-
-	bool prepared;
 
 	ktime_t unprepared_time;
 
@@ -289,14 +287,9 @@ static int panel_simple_disable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (!p->enabled)
-		return 0;
-
 	if (p->desc->delay.disable)
 		msleep(p->desc->delay.disable);
 
-	p->enabled = false;
-
 	return 0;
 }
 
@@ -316,18 +309,12 @@ static int panel_simple_suspend(struct device *dev)
 
 static int panel_simple_unprepare(struct drm_panel *panel)
 {
-	struct panel_simple *p = to_panel_simple(panel);
 	int ret;
 
-	/* Unpreparing when already unprepared is a no-op */
-	if (!p->prepared)
-		return 0;
-
 	pm_runtime_mark_last_busy(panel->dev);
 	ret = pm_runtime_put_autosuspend(panel->dev);
 	if (ret < 0)
 		return ret;
-	p->prepared = false;
 
 	return 0;
 }
@@ -355,21 +342,14 @@ static int panel_simple_resume(struct device *dev)
 
 static int panel_simple_prepare(struct drm_panel *panel)
 {
-	struct panel_simple *p = to_panel_simple(panel);
 	int ret;
 
-	/* Preparing when already prepared is a no-op */
-	if (p->prepared)
-		return 0;
-
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
 		pm_runtime_put_autosuspend(panel->dev);
 		return ret;
 	}
 
-	p->prepared = true;
-
 	return 0;
 }
 
@@ -377,14 +357,9 @@ static int panel_simple_enable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (p->enabled)
-		return 0;
-
 	if (p->desc->delay.enable)
 		msleep(p->desc->delay.enable);
 
-	p->enabled = true;
-
 	return 0;
 }
 
@@ -562,7 +537,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	if (!panel)
 		return -ENOMEM;
 
-	panel->enabled = false;
 	panel->desc = desc;
 
 	panel->supply = devm_regulator_get(dev, "power");
@@ -694,8 +668,7 @@ static void panel_simple_remove(struct device *dev)
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
 	drm_panel_remove(&panel->base);
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	drm_panel_helper_shutdown(&panel->base);
 
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
@@ -707,8 +680,7 @@ static void panel_simple_shutdown(struct device *dev)
 {
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	drm_panel_helper_shutdown(&panel->base);
 }
 
 static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index d8487bc6d611..07d5917f1549 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -17,6 +17,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 struct tdo_tl070wsh30_panel {
 	struct drm_panel base;
@@ -24,8 +25,6 @@ struct tdo_tl070wsh30_panel {
 
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
-
-	bool prepared;
 };
 
 static inline
@@ -39,9 +38,6 @@ static int tdo_tl070wsh30_panel_prepare(struct drm_panel *panel)
 	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = to_tdo_tl070wsh30_panel(panel);
 	int err;
 
-	if (tdo_tl070wsh30->prepared)
-		return 0;
-
 	err = regulator_enable(tdo_tl070wsh30->supply);
 	if (err < 0)
 		return err;
@@ -74,8 +70,6 @@ static int tdo_tl070wsh30_panel_prepare(struct drm_panel *panel)
 
 	msleep(20);
 
-	tdo_tl070wsh30->prepared = true;
-
 	return 0;
 }
 
@@ -84,9 +78,6 @@ static int tdo_tl070wsh30_panel_unprepare(struct drm_panel *panel)
 	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = to_tdo_tl070wsh30_panel(panel);
 	int err;
 
-	if (!tdo_tl070wsh30->prepared)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(tdo_tl070wsh30->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -103,8 +94,6 @@ static int tdo_tl070wsh30_panel_unprepare(struct drm_panel *panel)
 
 	regulator_disable(tdo_tl070wsh30->supply);
 
-	tdo_tl070wsh30->prepared = false;
-
 	return 0;
 }
 
@@ -220,16 +209,14 @@ static void tdo_tl070wsh30_panel_remove(struct mipi_dsi_device *dsi)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	drm_panel_remove(&tdo_tl070wsh30->base);
-	drm_panel_disable(&tdo_tl070wsh30->base);
-	drm_panel_unprepare(&tdo_tl070wsh30->base);
+	drm_panel_helper_shutdown(&tdo_tl070wsh30->base);
 }
 
 static void tdo_tl070wsh30_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = mipi_dsi_get_drvdata(dsi);
 
-	drm_panel_disable(&tdo_tl070wsh30->base);
-	drm_panel_unprepare(&tdo_tl070wsh30->base);
+	drm_panel_helper_shutdown(&tdo_tl070wsh30->base);
 }
 
 static struct mipi_dsi_driver tdo_tl070wsh30_panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 8670386498a4..27a66694be06 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -12,6 +12,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 #include <video/display_timing.h>
 #include <video/mipi_display.h>
@@ -52,7 +53,6 @@ struct xpp055c272 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vci;
 	struct regulator *iovcc;
-	bool prepared;
 };
 
 static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
@@ -136,9 +136,6 @@ static int xpp055c272_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
 		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
@@ -152,8 +149,6 @@ static int xpp055c272_unprepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vci);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -163,9 +158,6 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vci);
 	if (ret < 0) {
@@ -209,8 +201,6 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 
 	msleep(50);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_iovcc:
@@ -320,15 +310,8 @@ static int xpp055c272_probe(struct mipi_dsi_device *dsi)
 static void xpp055c272_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct xpp055c272 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
 
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+	drm_panel_helper_shutdown(&ctx->panel);
 }
 
 static void xpp055c272_remove(struct mipi_dsi_device *dsi)
-- 
2.41.0.585.gd2178a4bd4-goog

