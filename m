Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4939691C57E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2983910E235;
	Fri, 28 Jun 2024 18:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MNOmJjfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF4D10E235
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:12:51 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7066463c841so667523b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719598371; x=1720203171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8Jo6W/oSNP8jr6rmsVk9Fz1TTt99fPqwc+b/r8xVV4=;
 b=MNOmJjfNL9w2n5jlCQhfJTPKo5PpFXrcDhJ3ENfChHk28cgS4eoSfMRL8Pzof0iucK
 LDAAMTNg0Mf2d3XTvjJ83uBllIaRC5h/VwxV//HbOscuXST8jitzD9184GIL9ZMZlUgZ
 tQ/1VE4d/5rXs8EGIhBwqBgU/WDe4JNBqBVoMSbWwUmniSleOiG9gTqz6GpUDYt7271J
 ElpddvaRAhZsoUVQoQxf2gc1kz6geZJIqACSCxchtGSqo4mi/pD89t0WNPVRawqDMgYq
 /f4tGSbb9e9/Zb8sZaRvBeskQj8VxC/feMHhA5tQFc8ntwzew+BQuFTv5i8Pl2k3XyIj
 RQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719598371; x=1720203171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q8Jo6W/oSNP8jr6rmsVk9Fz1TTt99fPqwc+b/r8xVV4=;
 b=gyJDjJxiRT5hlZ148qAJGf1n6pALFUU2NaQDx0Se+B3ZhttYY4g2qO+CTVQJ17QdZn
 GGncSnZKUkDXWpx7c9CmMIxUMtvdmcWuiy9bZuL5tmjT0R+b3rsQJW5aaHtRVWJw6z+6
 O6lZM/Dpw82/v8mQgfE+c/eKvDRuzqXNRODXnstGsBmhsv6+3tCyGcynPIjX8RKlAONI
 DOeRmbkZ1I4G3Lf7VlCHBmBg21oYxIERxs/kquDJuJFTbRJ+U9pQzD2Bn4IiLCVfm1NR
 C2Y7LNLGU4VYWKntkTz28GtjwCAnK04WjmVVTRSOoB97kB9e2CPRrE6oqfRzYZWk7mO9
 As3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJlzsuT5piafxo430uHi5nq+yeSYpjG9x5rjtGixX7YqY4CER+xbEweO71/0RMOgcFNPEAsn78yLYr/s/fSrAc0obWpuXmCqZLaghGVHGd
X-Gm-Message-State: AOJu0YwJNLOeAD0MnFpKo+9zjqp7emWvDq1ELt07uPX3Vo0F2RsvclGT
 Xbh2UP86/n1QeHn92aNDf5MklQWYjIAO7roqqD+Ef4UCkkm6QC9X
X-Google-Smtp-Source: AGHT+IF3AjHxyLKw/pfm6Tp0dYJXbY0D7ipNfh1LjJnjgv4OthC3bqatVYyRUQTKQR31MgPFGEPKnA==
X-Received: by 2002:a05:6a00:2d2:b0:704:2b6e:f10b with SMTP id
 d2e1a72fcca58-706745d6c9dmr14857451b3a.15.1719598370562; 
 Fri, 28 Jun 2024 11:12:50 -0700 (PDT)
Received: from distilledx.localdomain ([122.172.84.231])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804989f5asm1926960b3a.195.2024.06.28.11.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 11:12:50 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: tejasvipin76@gmail.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: asus-z00t-tm5p5-n35596: transition to mipi_dsi
 wrapped functions
Date: Fri, 28 Jun 2024 23:42:38 +0530
Message-ID: <20240628181238.169681-4-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628181238.169681-1-tejasvipin76@gmail.com>
References: <20240628181238.169681-1-tejasvipin76@gmail.com>
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

Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi:
Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
("drm/mipi-dsi: wrap more functions for streamline handling") for the
asus-z00t-tm5p5-n35596 panel.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 140 ++++++++----------
 1 file changed, 59 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index bcaa63d1955f..b05a663c134c 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -33,119 +33,97 @@ static void tm5p5_nt35596_reset(struct tm5p5_nt35596 *ctx)
 	usleep_range(15000, 16000);
 }
 
-static int tm5p5_nt35596_on(struct tm5p5_nt35596 *ctx)
+static void tm5p5_nt35596_on(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-
-	mipi_dsi_generic_write_seq(dsi, 0xff, 0x05);
-	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xff, 0x04);
-	mipi_dsi_generic_write_seq(dsi, 0x01, 0x84);
-	mipi_dsi_generic_write_seq(dsi, 0x05, 0x25);
-	mipi_dsi_generic_write_seq(dsi, 0x06, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0x07, 0x20);
-	mipi_dsi_generic_write_seq(dsi, 0x08, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0x09, 0x08);
-	mipi_dsi_generic_write_seq(dsi, 0x0a, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0x0b, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0x0c, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0x0d, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x0e, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x0f, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x10, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x11, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x12, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x17, 0xf3);
-	mipi_dsi_generic_write_seq(dsi, 0x18, 0xc0);
-	mipi_dsi_generic_write_seq(dsi, 0x19, 0xc0);
-	mipi_dsi_generic_write_seq(dsi, 0x1a, 0xc0);
-	mipi_dsi_generic_write_seq(dsi, 0x1b, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x1c, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x1d, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x1e, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x1f, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x20, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xff, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0x35, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x04);
-	mipi_dsi_generic_write_seq(dsi, 0x5e, 0x0d);
-	mipi_dsi_generic_write_seq(dsi, 0x11, 0x00);
-	msleep(100);
-	mipi_dsi_generic_write_seq(dsi, 0x29, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0x53, 0x24);
-
-	return 0;
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xff, 0x05);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc5, 0x31);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xff, 0x04);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x01, 0x84);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x05, 0x25);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x06, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x07, 0x20);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x08, 0x06);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x09, 0x08);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0a, 0x10);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0b, 0x10);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0c, 0x10);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0d, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0e, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0f, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x10, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x11, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x12, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x17, 0xf3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x18, 0xc0);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x19, 0xc0);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1a, 0xc0);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1b, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1c, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1d, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1e, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1f, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x20, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xff, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x35, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd3, 0x06);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd4, 0x04);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x5e, 0x0d);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x11, 0x00);
+
+	mipi_dsi_msleep(dsi_ctx, 100);
+
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x29, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x53, 0x24);
 }
 
-static int tm5p5_nt35596_off(struct tm5p5_nt35596 *ctx)
+static void tm5p5_nt35596_off(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(60);
+	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_msleep(dsi_ctx, 60);
 
-	mipi_dsi_dcs_write_seq(dsi, 0x4f, 0x01);
+	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
 
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x4f, 0x01);
 }
 
 static int tm5p5_nt35596_prepare(struct drm_panel *panel)
 {
 	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx =	{.dsi = ctx->dsi};
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
-		return ret;
-	}
+	dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 
 	tm5p5_nt35596_reset(ctx);
 
-	ret = tm5p5_nt35596_on(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+	tm5p5_nt35596_on(&dsi_ctx);
+
+	if (dsi_ctx.accum_err) {
 		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
 				       ctx->supplies);
-		return ret;
 	}
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int tm5p5_nt35596_unprepare(struct drm_panel *panel)
 {
 	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx =	{.dsi = ctx->dsi};
 
-	ret = tm5p5_nt35596_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	tm5p5_nt35596_off(&dsi_ctx);
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
 			       ctx->supplies);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode tm5p5_nt35596_mode = {
-- 
2.45.2

