Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BB7CA2E4A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9655110E1C4;
	Thu,  4 Dec 2025 09:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aBekNTdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09CD10E1CA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 08:27:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so7476265e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 00:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764836827; x=1765441627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C8ChXUaXX/3Eb7EnyDqnAZz0gJR5wknVDuL7fNH9uhE=;
 b=aBekNTdLjFAH5pDHDGElu2wgTYfSjM5qGZ1jtesDx+BcVJ0BDFR0fthc2h22ToQM4M
 LxojTeIafRH6tRuhS0Nj0g+V2FScYRgtRgaJCG8k6HaZ8KozaYeq5mW1xjH+1jR+lJ/1
 ssQEs8iaABdoOH6WS58rA7QiONgYwNzrdh9A1z70dCuKFqM3ok1UWZ+TlT70RoqiPCEV
 dd/mXI5S0ivSGQMbTE0tFTq/Dgy/Bw2aLUjMOeeMK0iXI1AiXtVDV+OkN5cO27ttojrR
 +Umlex+aeIF91pt+9YxNw1qtbuuwzwrZrecGd38TyOYv4+RB9QRaKM+O7BtBuSC7QN7a
 7R7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764836827; x=1765441627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8ChXUaXX/3Eb7EnyDqnAZz0gJR5wknVDuL7fNH9uhE=;
 b=Fa7dORfiUe01AA3/mCzSzg5Pr+UjjNZRf91JI3mucn0ljoF9V3J3OmO1Mklm6SmJWD
 dfVXktX5lcffPvAeGv+RfzD4ybsnYW2HXV7k87AvGM1bt10CxfovAj2Dhy1tBzVjFnqx
 Ld1vBPjNY44SkhtDpllkEP2Zv+4b8/MsGee2O/1FiRTjByf+rvRoNa6ixhgEH2tiF8k1
 jJ2KNykS+67Q36CLtC2hOtAk226E1bEExU/i0NLhZETTR7vVNiiAUk6GD0FE75AOb08p
 /jjziSxc0znlV3qCJ05P0+8CGLmmZH9CludVvO6sTE+ysj5nvYtSHPxPgpbpqU6vjXFJ
 A98A==
X-Gm-Message-State: AOJu0YzjaIuao9YbMfKDulhvZHMC/sxU8VcV/edWD21uthLtuPhr/tJX
 ticzfteKf7Y33QlL/mZQeTFrT73gzCElbjMEcdj9tmd2ZqMWiC1qs8LX
X-Gm-Gg: ASbGncuPOddAF5amQdLJ/tUHS9svNojY7SCCgvMI4Vrm3T5S8CXAiaBqNGekGf5U1tQ
 48s6qa1CNMpmf1nm/JsL8l28M4q01YshV2yVwiJXtobtSWZSBkrXu/Sjnc4IgyyNVyR/afRTQNP
 QJsu89P8UkAZFcjwUIvOdBY4VtJuOalhMYi+cAHq+zZvJzX4LaCtTt2IjZ2oHyd64xUM+oPNetN
 oHkSvlb2lrQ6HSV40cZZW3n6Dq62DkW+BDvrEdWgHBfLtv7HS2i/ygQjX9x3MRjVkyW8jJf6ZSH
 amMGBjRBk+LMmzPwIQFf93wEr4um65BhJGZczyQGjhwHwLI1x5tQv+1L3K4PZ1nFKo4H2u3BWbd
 lpJiCowpBD/BnVCA12PvWBFr1oSxuFxgDAi9NvqfQ/zaz/7OZjppbtmsftpKMYCwbtkpazTyMVO
 ruLl1FfrpysXBh3yftoZHrRu3OdS08uUT+PNMMgPpxUomE9Wy2E4RYvkRdInd+5JohK9VqEoac9
 cQiGfHiX48=
X-Google-Smtp-Source: AGHT+IGqNqtJcEM/KHQy2M+RqHz31DpNQ4G8IwXipAOCXnaYAIv0Hpnd4Vggvy2cod8SbmsEjdXJRQ==
X-Received: by 2002:a7b:c3da:0:b0:477:a246:8398 with SMTP id
 5b1f17b1804b1-4792f23c82amr13974035e9.2.1764836826877; 
 Thu, 04 Dec 2025 00:27:06 -0800 (PST)
Received: from gattout.local
 (2a01cb0012bffa008e9c25a4ae82f3b7.ipv6.abo.wanadoo.fr.
 [2a01:cb00:12bf:fa00:8e9c:25a4:ae82:f3b7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d2226c5sm1908082f8f.23.2025.12.04.00.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 00:27:06 -0800 (PST)
From: Amin GATTOUT <amin.gattout@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Amin GATTOUT <amin.gattout@gmail.com>
Subject: [PATCH] drm/panel: otm8009a: Switch to mipi_dsi_multi_context helpers
Date: Thu,  4 Dec 2025 09:26:59 +0100
Message-ID: <20251204082659.84387-1-amin.gattout@gmail.com>
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

