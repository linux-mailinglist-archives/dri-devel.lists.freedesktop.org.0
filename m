Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B40CB9940
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 19:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BA610E05C;
	Fri, 12 Dec 2025 18:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EMlninF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA5610E05C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 18:37:29 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42b3b0d76fcso882603f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 10:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765564648; x=1766169448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ojYm2I1R/IjtvUXHyoOg5tTWpIbTghzOJdRpnkuUhE=;
 b=EMlninF70L669otoWTfwE3GLYiPFM0YQP/mJhVrtoazIWNLqLYrlymf93HIDHcakCZ
 cLSCyQ81C+FBIkPMKAJUSkir1jV1jasFsXmT/13oDprCz0jTmaEuBCG6IbGzxNIQ3kLD
 JAvWemcP59zgsQ/1f68FMTRBVJ+tc9c/sID3gEdv60CpLUX9zstddSlcxwXDaqmJFiE4
 B2TX5TlZqRq3WsPge/jAUDHRf9a0quH+br7dLKWA8BcJCEvJol5goLfh5tLjZPye277D
 sLpEFtjCTyxYSyQF9+Vkba41HpqrLa5sJFpK2f8hmh7XsLwQL+VAk0g8wC7rl9yUm8xg
 vUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765564648; x=1766169448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/ojYm2I1R/IjtvUXHyoOg5tTWpIbTghzOJdRpnkuUhE=;
 b=gJZHzMMLdxr1QV7aa+Nukfk00TKYhn7OK89wOp0wuIulyQghseJiIu+wtxGBaroVM0
 O1tct0Rnh6tTNssMmp+m8LVAXOlLofLPxcfqQZ+5ijnAwf6e7vXzfXYa4S4jFniuNg2w
 shDKOGlltJrTUNmTmuZ7gPlVXa2RuDSwvwgr37D2NR7VM/RzPE5UWF6vAaOmwSnIf/gh
 SIShlPkn5Mz9USs4X7e3+Ofwsl+M9Yz9LnHVOCpx2g1mfXe6mDumI7RhaY3oFSxePGIX
 1aO3E1qxslXnNGsnFn4golIXlefdHiBcfIxqpmKMn8rzIiNeyfS0kP03UOUniLcBABoQ
 TM6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV96GjSP4Sdh+uYw8nIuUuWMIHg2h/ug1iEY35axq6jMf0mLtudaTmcJPXXHSbJUUB5I3A3UIZcvew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTTLFZU0l/f26fSEAwTYWPx5EayU79e+/wgZZdu/IhH5nZas72
 sUecNbDmPvZzMNp/FTBIqdPhPx2uM0xLJfcTiLTDUnivxaOxPCtHQLD+
X-Gm-Gg: AY/fxX7D17TY6tzBs+UtWrNc+Ls6iAYV7Sw7inmc7Ndvs/R4WUh8e081G3xfi7LcVvU
 JaQJr4oWGfaon51LKgllAxCwgIWNcXyUS+Usd5pzVu+EcrG4vOJvrCwIj5Wc4Anakm2BlIjVfaB
 ljIEXbs6ZV0wSTB/DrzVnfsQ9OC8J2QaBVivvzwO+m1mzFfeNKhvw2H+jNdpUdboNmM9VRqhks1
 EIG5BZeLPCU5nkIAq4N4wlzHaCrzEvcVqRR+WInnxHLo6E9LwUlX7xjMZfYleC7lMisilz01v+B
 j3YP0sLROuYboTPq1EgVjL7XWKBBlHf6QyPU58KlO1cX3cwmBR8JoxXjCrAdqRuJELmGO+kxLeC
 JeA9ukmZ+JfHZgQORdklpzOHl/Ox6Aarvg2ca2L1YWzmCFEXihMCjwVssz55F11LQtgMQTwPsao
 4P6qsNqYp25w9769uFfps=
X-Google-Smtp-Source: AGHT+IERHQBg+JmH4NLBA3BHNsnu20ClSKQFjPqupnFe3whGUCR0+tAyOrdomDGorF5TJdawE7/qiA==
X-Received: by 2002:a5d:584a:0:b0:42b:2c53:3abc with SMTP id
 ffacd0b85a97d-42fb44ba63dmr3536078f8f.19.1765564647548; 
 Fri, 12 Dec 2025 10:37:27 -0800 (PST)
Received: from gattout.local ([213.137.177.122])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a66b97sm13510825f8f.7.2025.12.12.10.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 10:37:27 -0800 (PST)
From: Amin GATTOUT <amin.gattout@gmail.com>
To: neil.armstrong@linaro.org
Cc: jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 dianders@chromium.org, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 Amin GATTOUT <amin.gattout@gmail.com>
Subject: [PATCH v2] drm/panel: otm8009a: Switch to mipi_dsi_multi_context
 helpers
Date: Fri, 12 Dec 2025 19:37:26 +0100
Message-ID: <20251212183726.103480-1-amin.gattout@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204082659.84387-1-amin.gattout@gmail.com>
References: <20251204082659.84387-1-amin.gattout@gmail.com>
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

Update the driver to use the non-deprecated mipi_dsi_*_multi()
helpers, as recommended in Documentation/gpu/todo.rst. The multi
variants provide proper error accumulation and handle the required
DCS NOP insertions, which suits the OTM8009A command sequences.

Refactor otm8009a_dcs_write_buf() and the dcs_write_seq/dcs_write_cmd_at
macros to take a mipi_dsi_multi_context pointer, passing it through
from callers. This ensures consistent error handling throughout the
driver.

Replace all mdelay() and msleep() calls within DSI command sequences
with mipi_dsi_msleep() for proper error accumulation.

The init, disable, and backlight update paths now return dsi_ctx.accum_err,
ensuring errors are propagated to callers.

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 171 ++++++++----------
 1 file changed, 74 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index a0f58c3b73f6..1388e292fb60 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -109,13 +109,10 @@ static inline struct otm8009a *panel_to_otm8009a(struct drm_panel *panel)
 	return container_of(panel, struct otm8009a, panel);
 }
 
-static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
+static void otm8009a_dcs_write_buf(struct mipi_dsi_multi_context *dsi_ctx, const void *data,
 				   size_t len)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-
-	if (mipi_dsi_dcs_write_buffer(dsi, data, len) < 0)
-		dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, data, len);
 }
 
 #define dcs_write_seq(ctx, seq...)			\
@@ -133,153 +130,131 @@ static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
 static int otm8009a_init_sequence(struct otm8009a *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* Enter CMD2 */
-	dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0x80, 0x09, 0x01);
+	dcs_write_cmd_at(&dsi_ctx, MCS_CMD2_ENA1, 0x80, 0x09, 0x01);
 
 	/* Enter Orise Command2 */
-	dcs_write_cmd_at(ctx, MCS_CMD2_ENA2, 0x80, 0x09);
-
-	dcs_write_cmd_at(ctx, MCS_SD_PCH_CTRL, 0x30);
-	mdelay(10);
-
-	dcs_write_cmd_at(ctx, MCS_NO_DOC1, 0x40);
-	mdelay(10);
-
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL4 + 1, 0xA9);
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 1, 0x34);
-	dcs_write_cmd_at(ctx, MCS_P_DRV_M, 0x50);
-	dcs_write_cmd_at(ctx, MCS_VCOMDC, 0x4E);
-	dcs_write_cmd_at(ctx, MCS_OSC_ADJ, 0x66); /* 65Hz */
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 2, 0x01);
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 5, 0x34);
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 4, 0x33);
-	dcs_write_cmd_at(ctx, MCS_GVDDSET, 0x79, 0x79);
-	dcs_write_cmd_at(ctx, MCS_SD_CTRL + 1, 0x1B);
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL1 + 2, 0x83);
-	dcs_write_cmd_at(ctx, MCS_SD_PCH_CTRL + 1, 0x83);
-	dcs_write_cmd_at(ctx, MCS_RGB_VID_SET, 0x0E);
-	dcs_write_cmd_at(ctx, MCS_PANSET, 0x00, 0x01);
-
-	dcs_write_cmd_at(ctx, MCS_GOAVST, 0x85, 0x01, 0x00, 0x84, 0x01, 0x00);
-	dcs_write_cmd_at(ctx, MCS_GOACLKA1, 0x18, 0x04, 0x03, 0x39, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_CMD2_ENA2, 0x80, 0x09);
+
+	dcs_write_cmd_at(&dsi_ctx, MCS_SD_PCH_CTRL, 0x30);
+	mipi_dsi_msleep(&dsi_ctx, 10);
+
+	dcs_write_cmd_at(&dsi_ctx, MCS_NO_DOC1, 0x40);
+	mipi_dsi_msleep(&dsi_ctx, 10);
+
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL4 + 1, 0xA9);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 1, 0x34);
+	dcs_write_cmd_at(&dsi_ctx, MCS_P_DRV_M, 0x50);
+	dcs_write_cmd_at(&dsi_ctx, MCS_VCOMDC, 0x4E);
+	dcs_write_cmd_at(&dsi_ctx, MCS_OSC_ADJ, 0x66); /* 65Hz */
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 2, 0x01);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 5, 0x34);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 4, 0x33);
+	dcs_write_cmd_at(&dsi_ctx, MCS_GVDDSET, 0x79, 0x79);
+	dcs_write_cmd_at(&dsi_ctx, MCS_SD_CTRL + 1, 0x1B);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL1 + 2, 0x83);
+	dcs_write_cmd_at(&dsi_ctx, MCS_SD_PCH_CTRL + 1, 0x83);
+	dcs_write_cmd_at(&dsi_ctx, MCS_RGB_VID_SET, 0x0E);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANSET, 0x00, 0x01);
+
+	dcs_write_cmd_at(&dsi_ctx, MCS_GOAVST, 0x85, 0x01, 0x00, 0x84, 0x01, 0x00);
+	dcs_write_cmd_at(&dsi_ctx, MCS_GOACLKA1, 0x18, 0x04, 0x03, 0x39, 0x00, 0x00,
 			 0x00, 0x18, 0x03, 0x03, 0x3A, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_GOACLKA3, 0x18, 0x02, 0x03, 0x3B, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_GOACLKA3, 0x18, 0x02, 0x03, 0x3B, 0x00, 0x00,
 			 0x00, 0x18, 0x01, 0x03, 0x3C, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_GOAECLK, 0x01, 0x01, 0x20, 0x20, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_GOAECLK, 0x01, 0x01, 0x20, 0x20, 0x00, 0x00,
 			 0x01, 0x02, 0x00, 0x00);
 
-	dcs_write_cmd_at(ctx, MCS_NO_DOC2, 0x00);
+	dcs_write_cmd_at(&dsi_ctx, MCS_NO_DOC2, 0x00);
 
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 			 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 			 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET5, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET5, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0,
 			 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET6, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET6, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4,
 			 4, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET8, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET8, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
 			 0xFF, 0xFF, 0xFF, 0xFF, 0xFF);
 
-	dcs_write_cmd_at(ctx, MCS_PANU2D1, 0x00, 0x26, 0x09, 0x0B, 0x01, 0x25,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANU2D1, 0x00, 0x26, 0x09, 0x0B, 0x01, 0x25,
 			 0x00, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_PANU2D2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANU2D2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			 0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x0A, 0x0C, 0x02);
-	dcs_write_cmd_at(ctx, MCS_PANU2D3, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANU2D3, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00,
 			 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_PAND2U1, 0x00, 0x25, 0x0C, 0x0A, 0x02, 0x26,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PAND2U1, 0x00, 0x25, 0x0C, 0x0A, 0x02, 0x26,
 			 0x00, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_PAND2U2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PAND2U2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x0B, 0x09, 0x01);
-	dcs_write_cmd_at(ctx, MCS_PAND2U3, 0x26, 0x00, 0x00, 0x00, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PAND2U3, 0x26, 0x00, 0x00, 0x00, 0x00, 0x00,
 			 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
 
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL1 + 1, 0x66);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL1 + 1, 0x66);
 
-	dcs_write_cmd_at(ctx, MCS_NO_DOC3, 0x06);
+	dcs_write_cmd_at(&dsi_ctx, MCS_NO_DOC3, 0x06);
 
-	dcs_write_cmd_at(ctx, MCS_GMCT2_2P, 0x00, 0x09, 0x0F, 0x0E, 0x07, 0x10,
+	dcs_write_cmd_at(&dsi_ctx, MCS_GMCT2_2P, 0x00, 0x09, 0x0F, 0x0E, 0x07, 0x10,
 			 0x0B, 0x0A, 0x04, 0x07, 0x0B, 0x08, 0x0F, 0x10, 0x0A,
 			 0x01);
-	dcs_write_cmd_at(ctx, MCS_GMCT2_2N, 0x00, 0x09, 0x0F, 0x0E, 0x07, 0x10,
+	dcs_write_cmd_at(&dsi_ctx, MCS_GMCT2_2N, 0x00, 0x09, 0x0F, 0x0E, 0x07, 0x10,
 			 0x0B, 0x0A, 0x04, 0x07, 0x0B, 0x08, 0x0F, 0x10, 0x0A,
 			 0x01);
 
 	/* Exit CMD2 */
-	dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0xFF, 0xFF, 0xFF);
-
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret)
-		return ret;
+	dcs_write_cmd_at(&dsi_ctx, MCS_CMD2_ENA1, 0xFF, 0xFF, 0xFF);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
 
-	/* Wait for sleep out exit */
-	mdelay(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	/* Default portrait 480x800 rgb24 */
-	dcs_write_seq(ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	dcs_write_seq(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
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
-	dcs_write_seq(ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	dcs_write_seq(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
 
 	/* Send Command GRAM memory write (no parameters) */
-	dcs_write_seq(ctx, MIPI_DCS_WRITE_MEMORY_START);
+	dcs_write_seq(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
 
 	/* Wait a short while to let the panel be ready before the 1st frame */
-	mdelay(10);
+	mipi_dsi_msleep(&dsi_ctx, 10);
 
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
@@ -383,6 +358,8 @@ static const struct drm_panel_funcs otm8009a_drm_funcs = {
 static int otm8009a_backlight_update_status(struct backlight_device *bd)
 {
 	struct otm8009a *ctx = bl_get_data(bd);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	u8 data[2];
 
 	if (!ctx->prepared) {
@@ -397,7 +374,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 		 */
 		data[0] = MIPI_DCS_SET_DISPLAY_BRIGHTNESS;
 		data[1] = bd->props.brightness;
-		otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
+		otm8009a_dcs_write_buf(&dsi_ctx, data, ARRAY_SIZE(data));
 
 		/* set Brightness Control & Backlight on */
 		data[1] = 0x24;
@@ -409,9 +386,9 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 
 	/* Update Brightness Control & Backlight */
 	data[0] = MIPI_DCS_WRITE_CONTROL_DISPLAY;
-	otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
+	otm8009a_dcs_write_buf(&dsi_ctx, data, ARRAY_SIZE(data));
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static const struct backlight_ops otm8009a_backlight_ops = {
-- 
2.43.0

