Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4B8C8DC6
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3D410E137;
	Fri, 17 May 2024 21:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gXr0ElPu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335A610E137
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 21:37:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1f082d92864so23076575ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715981870; x=1716586670;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Idck8NJaJ/+Vpl/CRWABV0vclOOqdIkStHcxSg1So4=;
 b=gXr0ElPuS5wEBTzWuK3vmrD8Ir0BkDRkWfbzSBtrJtzlYBznIKDOgF0FpvvNvp6y34
 F5R2jBsEZY8pzJiHIidEdL9VaBJgL9OY8krDoHR5HR8dvFJrgSzQ/IdO+V6X2kZeeET+
 /ugFyx9e5oylSTyNPbe/P9fsSUZ2MSLD5cY9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981870; x=1716586670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Idck8NJaJ/+Vpl/CRWABV0vclOOqdIkStHcxSg1So4=;
 b=stMM00/RFbNTACiesXAXE95Of4iHn84XL1u/bMU8Vk9Zv6YBAMifowgrpxSZZS5n2O
 p/QZbWqyIhNazjIp2myXrkfFhPSu2pRnN9psUEPQbFjKm25pZ/6kEjtJrahEJD2KMRLe
 PHTqtzUhEyZg+HtwREuyQS8IoTu76Pfwgj+CTXhhlJTgybw8cyW1UbkhezvVSVzbNKSV
 AC6ZyZRh3NP3wMhcYA66bS/7XxWHxun417Wg9Nb6oqU0W4StEYtQ8AvSZp80YYBWZaTV
 raTQ5ZvAgZXhIjlm9CcIq6uM06jHjZAVgQmZg/1txS8Tj/uemWtPjsJgBwEHCcjafNvM
 zG1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+De9udTj6R1NRnOMWamCOP+r9vQPaNOJe7jJzY3hVspRxK/MBy2K4E705sgRlPnzEb6VAQB+esZijtvlJ5xJNiwDQjFeR1fU9N4X3XLz7
X-Gm-Message-State: AOJu0YzpAXo/9UQOXtNvGYPzsqNgRc1mWVstJOA/iTayUAJWF/uzj+/5
 8yGItyYGoRlDs57Y0/WCNs+MMK5ONE1ndeX3b8qbHJbEHsX/412qrkFJBkabxQ==
X-Google-Smtp-Source: AGHT+IFTf9mztHoG3W0qKI9PMVLR156uygC1Rq1UbvG0b5tcufO2fDgf17EUnFOGEMDC1IYVyFm+4g==
X-Received: by 2002:a05:6a00:14cb:b0:6f3:ea39:a56a with SMTP id
 d2e1a72fcca58-6f4e0299776mr26311621b3a.1.1715981870627; 
 Fri, 17 May 2024 14:37:50 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:26de:b1dd:5:771c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2f8b3sm15168736b3a.211.2024.05.17.14.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:37:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] drm/panel: himax-hx83102: use wrapped MIPI DCS functions
Date: Fri, 17 May 2024 14:36:43 -0700
Message-ID: <20240517143643.8.If761d37b5d511867ac8207fe8220ae48d444a04f@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240517213712.3135166-1-dianders@chromium.org>
References: <20240517213712.3135166-1-dianders@chromium.org>
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

Take advantage of some of the new wrapped routines introduced by
commit f79d6d28d8fe ("drm/mipi-dsi: wrap more functions for streamline
handling") to simplify the himax-hx83102 driver a bit more. This gets
rid of some extra error prints (since the _multi functions all print
errors for you) and simplifies the code a bit.

One thing here that isn't just refactoring is that in a few places we
now check with errors with "if (err)" instead of "if (err < 0)". All
errors are expected to be negative so this is not expected to have any
impact. The _multi code internally considers anything non-zero to be
an error so this just makes things consistent.

It can also be noted that hx83102_prepare() has a mix of things that
can take advantage of _multi calls and things that can't. The cleanest
seemed to be to use the multi_ctx still but consistently use the
"accum_err" variable for error returns, though that's definitely a
style decision with pros and cons.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-himax-hx83102.c | 92 +++++++--------------
 1 file changed, 28 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 1ba623e41924..6009a3fe1b8f 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -285,12 +285,10 @@ static int boe_nv110wum_init(struct hx83102 *ctx)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
 	hx83102_enable_extended_cmds(&dsi_ctx, false);
-	if (dsi_ctx.accum_err)
-		return dsi_ctx.accum_err;
 
-	msleep(50);
+	mipi_dsi_msleep(dsi_ctx, 50);
 
-	return 0;
+	return dsi_ctx.accum_err;
 };
 
 static int ivo_t109nw41_init(struct hx83102 *ctx)
@@ -392,12 +390,10 @@ static int ivo_t109nw41_init(struct hx83102 *ctx)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
 	hx83102_enable_extended_cmds(&dsi_ctx, false);
-	if (dsi_ctx.accum_err)
-		return dsi_ctx.accum_err;
 
-	msleep(60);
+	mipi_dsi_msleep(dsi_ctx, 60);
 
-	return 0;
+	return dsi_ctx.accum_err;
 };
 
 static const struct drm_display_mode starry_mode = {
@@ -472,40 +468,20 @@ static int hx83102_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int hx83102_panel_enter_sleep_mode(struct hx83102 *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret;
-
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		return ret;
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static int hx83102_disable(struct drm_panel *panel)
 {
 	struct hx83102 *ctx = panel_to_hx83102(panel);
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = hx83102_panel_enter_sleep_mode(ctx);
-	if (ret < 0) {
-		dev_err(dev, "failed to set panel off: %d\n", ret);
-		return ret;
-	}
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	msleep(150);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	return 0;
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
+	return dsi_ctx.accum_err;
 }
 
 static int hx83102_unprepare(struct drm_panel *panel)
@@ -526,32 +502,30 @@ static int hx83102_prepare(struct drm_panel *panel)
 {
 	struct hx83102 *ctx = panel_to_hx83102(panel);
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	gpiod_set_value(ctx->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
-	ret = regulator_enable(ctx->pp1800);
-	if (ret < 0)
-		return ret;
+	dsi_ctx.accum_err = regulator_enable(ctx->pp1800);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 
 	usleep_range(3000, 5000);
 
-	ret = regulator_enable(ctx->avdd);
-	if (ret < 0)
+	dsi_ctx.accum_err = regulator_enable(ctx->avdd);
+	if (dsi_ctx.accum_err)
 		goto poweroff1v8;
-	ret = regulator_enable(ctx->avee);
-	if (ret < 0)
+	dsi_ctx.accum_err = regulator_enable(ctx->avee);
+	if (dsi_ctx.accum_err)
 		goto poweroffavdd;
 
 	usleep_range(10000, 11000);
 
-	ret = mipi_dsi_dcs_nop(ctx->dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to send NOP: %d\n", ret);
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
 		goto poweroff;
-	}
+
 	usleep_range(1000, 2000);
 
 	gpiod_set_value(ctx->enable_gpio, 1);
@@ -561,23 +535,13 @@ static int hx83102_prepare(struct drm_panel *panel)
 	gpiod_set_value(ctx->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
-	ret = ctx->desc->init(ctx);
-	if (ret < 0)
-		goto poweroff;
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		goto poweroff;
-	}
-
-	msleep(120);
+	dsi_ctx.accum_err = ctx->desc->init(ctx);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret) {
-		dev_err(dev, "Failed to turn on the display: %d\n", ret);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
 		goto poweroff;
-	}
 
 	return 0;
 
@@ -590,7 +554,7 @@ static int hx83102_prepare(struct drm_panel *panel)
 	usleep_range(5000, 7000);
 	regulator_disable(ctx->pp1800);
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static int hx83102_get_modes(struct drm_panel *panel,
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

