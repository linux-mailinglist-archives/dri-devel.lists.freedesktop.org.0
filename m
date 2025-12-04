Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3ECA2E50
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1CC10E8F9;
	Thu,  4 Dec 2025 09:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ab/fVM1u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524A010E89C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 08:37:27 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-42e2d5e119fso304620f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764837446; x=1765442246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C8ChXUaXX/3Eb7EnyDqnAZz0gJR5wknVDuL7fNH9uhE=;
 b=Ab/fVM1uUK3xU+L7FHzgPoYqSGKjND+iWuXWbE92Ze1FEmG5y3oKPNnBj/ltlPO5Bf
 exj1QG/c7ZfTvmw0QJlQt+miM5M9q9EV59SObHQIUk+Az0e/nnSU0a2QFb+9+VmssHGH
 zDbnrOUJSJPsjrpCHPOMloImYuZhvrNBs7TuVmsc6FY3x9CtDY7BSD06Gbe5ElFGYvdN
 GvhowbwoTld43zQ10mqA5TiBoE0OmTRo+d6quy3+Z/66+ClgAAJmtguyf3jZ1I7QrufF
 6uWwld5MlA7PT5UOryQxBoJo+qATcKcaaoBt4UqWUf1ZH6ZNcRtylu8cIohf8C7TIliv
 zBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764837446; x=1765442246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8ChXUaXX/3Eb7EnyDqnAZz0gJR5wknVDuL7fNH9uhE=;
 b=FT2lqU6M0F0BAhdLGYl5rxKWNQ7pzbQ99woyHWsIqN9s/xl0hlnV/cu5mRpSTOulpZ
 EaFKjTrmkZy1NFnpMrO0BpyAY6YMzyNCOGRMlG/gGN5kABnU9H/fUH4nfTqLrYyfY/DS
 Os2ehsTYz69ulUzH38zL+HsgzdOLZcenSQMnqPRdtrxfZxlEHzCZ9LUhEylcRFx7VcpP
 wDGq2C0zUymeeQ1RTnmzGa16AUUpV4DQaAo03GljPbGcljInuynxOmLDke1PZP3t35E5
 2eZtrBdbKthliYgGWVl7bmqPCDObr7RSh1urse+qGy5AOCBciddQnBqoGpT8xWZ96JTz
 2kEg==
X-Gm-Message-State: AOJu0Yznu2oZZrLLwWowUlfgaOmyf84lNn6XNuK/TTwlRIZrEtpP2MNh
 BiarP9DwKiQKohNiCCAs3VDGXjqpEhL/WkC/I8Tmnlu2DRYe2Gl2o0S/
X-Gm-Gg: ASbGncvZQnDYFvxTmsDhCOkpgAWYcZZ07fnchuPGAd6MNSdrUdCNiZP9GWxOcDNHFXY
 MhgofDNDokx50H8YyWyG8Vc/YDc0AiFyW4P26yRWU0VNPzEvw6C3M8Pv0Lx2Xna52H2f91uP8oh
 lSIXHJsFNgEApDJkczcjDRuk5BYo7fvwZ/YascAtBQwUw+2rWB9M0Ir5//s7WMJ5Ll9+jyefSIX
 364ADUZekyyN1jPuKa8m1QSGArb+jk5ZpF6svzZA6TLyMQtRR/bFINqCA5OspkEkeUHmATXYvzJ
 0odUmOmcmhrA+eXxxcVaQ6v0i0xzqGo0MGLYMuwm19aDakmrXV+kI+6TTwzQzipFFLDpxWWjkdp
 /5l01Ukpzl5Kt6A6p+06/KIZ5/EWHbXNYtsB16p5amrOv/+2uzkeelA7lINPi1Lp9vPGA6Ml/4+
 WCUKEREcAb+PFUfb+Hl2yeJ2LszHfdbcDK15Yh7qfO+jWUxWrAnROcLZfflxe22O5HNDYazIgwh
 G38IzT0VS4BMzOcKFWxHA==
X-Google-Smtp-Source: AGHT+IGskEPThtuasuGfzDAcJBPuTV1Yggp0zHFey4EJ6Rz911VtGEzvcWXQ9678IY4p4XxvCTxx8Q==
X-Received: by 2002:a5d:5e01:0:b0:42b:3246:1682 with SMTP id
 ffacd0b85a97d-42f731963cdmr5225495f8f.16.1764837445503; 
 Thu, 04 Dec 2025 00:37:25 -0800 (PST)
Received: from gattout.local
 (2a01cb0012bffa008e9c25a4ae82f3b7.ipv6.abo.wanadoo.fr.
 [2a01:cb00:12bf:fa00:8e9c:25a4:ae82:f3b7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222506sm2213149f8f.28.2025.12.04.00.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 00:37:25 -0800 (PST)
From: Amin GATTOUT <amin.gattout@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Amin GATTOUT <amin.gattout@gmail.com>
Subject: [PATCH] drm/panel: otm8009a: Switch to mipi_dsi_multi_context helpers
Date: Thu,  4 Dec 2025 09:37:21 +0100
Message-ID: <20251204083722.84749-1-amin.gattout@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Dec 2025 09:04:28 +0000
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

Update the driver to use the non-deprecated mipi_dsi_*_multi()
helpers, as recommended in Documentation/gpu/todo.rst. The multi
variants provide proper error accumulation and handle the required
DCS NOP insertions, which suits the OTM8009A command sequences.

The init and disable paths now return dsi_ctx.accum_err, ensuring
errors are propagated to callers.

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 56 ++++++-------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index a0f58c3b73f6..fe31f508efd6 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -113,9 +113,9 @@ static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
 				   size_t len)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	if (mipi_dsi_dcs_write_buffer(dsi, data, len) < 0)
-		dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
+	mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, data, len);
 }
 
 #define dcs_write_seq(ctx, seq...)			\
@@ -133,7 +133,7 @@ static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
 static int otm8009a_init_sequence(struct otm8009a *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* Enter CMD2 */
 	dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0x80, 0x09, 0x01);
@@ -213,44 +213,28 @@ static int otm8009a_init_sequence(struct otm8009a *ctx)
 	/* Exit CMD2 */
 	dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0xFF, 0xFF, 0xFF);
 
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret)
-		return ret;
-
-	/* Wait for sleep out exit */
-	mdelay(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	/* Default portrait 480x800 rgb24 */
 	dcs_write_seq(ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0, OTM8009A_HDISPLAY - 1);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, OTM8009A_HDISPLAY - 1);
 
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0, OTM8009A_VDISPLAY - 1);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, OTM8009A_VDISPLAY - 1);
 
 	/* See otm8009a driver documentation for pixel format descriptions */
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24BIT |
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_24BIT |
 					    MIPI_DCS_PIXEL_FMT_24BIT << 4);
-	if (ret)
-		return ret;
 
 	/* Disable CABC feature */
 	dcs_write_seq(ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
 
 	/* Send Command GRAM memory write (no parameters) */
 	dcs_write_seq(ctx, MIPI_DCS_WRITE_MEMORY_START);
@@ -258,28 +242,22 @@ static int otm8009a_init_sequence(struct otm8009a *ctx)
 	/* Wait a short while to let the panel be ready before the 1st frame */
 	mdelay(10);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int otm8009a_disable(struct drm_panel *panel)
 {
 	struct otm8009a *ctx = panel_to_otm8009a(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	backlight_disable(ctx->bl_dev);
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret)
-		return ret;
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret)
-		return ret;
-
-	msleep(120);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int otm8009a_unprepare(struct drm_panel *panel)
-- 
2.43.0

