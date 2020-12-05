Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6B2CFB44
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 13:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444B96E418;
	Sat,  5 Dec 2020 12:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3416E418
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 12:22:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a1so8350824ljq.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Dec 2020 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=miB/yNVWUdB4sQwoLV/yygu/UIc0HB+nf4OPvc4pO3U=;
 b=KvQaXUoqszpy7YnNPSxZM+vAspvQFe9HrTbhcyta9vU/nOakRA5FRCA6FfGovBbyfa
 e19eVJqN9MedB80UA8jTjuVEAogSHzY6U+bXLJLUNTSDHCz5eXBcinC+FeihNjCLhNOu
 d8W+8EO2ZgSindDj0F8Y4S6vJftngzxphe5NDLrjCX5iLxfCm2qJLHkFsvZ5hVbs2dZZ
 +Fmt+FIv3s7/hugyjqsCrhhGtx1xq16QeMZ1TPo1Dz1FNtsNe0JIZoabcjBgTrAqcYod
 CO9nvlXaCsF/xUjpZH1vR4GJ9ImVc4+CFaIC8eQs8ny5zZh2sIP9P/NFk8GfXVEOXELe
 KNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=miB/yNVWUdB4sQwoLV/yygu/UIc0HB+nf4OPvc4pO3U=;
 b=FeupRUIoR2FPct6Yyim4UOFwo3JJqPC85+OkB3UUqY+YKsYUwI1WYHDMa5agje0fxd
 KZUFs4Xfpr8sJtAUx2ZRGy6V5iZGnjhHSyK0x/uQBY3BvmH1MA2IQOdhJNmT/fHw6lIH
 ArUyGEGS7kc/PAVZp6hvpUcg6QnoqR/QZMm8OcFE2YsS9QtqOJWtRAr4gNCcARHYNUa6
 N3FWyVzo9BcT6YHXpmMS+3zWI0InyLld99UbNCT+JqM3E08bFVm9pvPoNOTR4a3cf+La
 Ufdy97gUbqfXscuIb+FdOUIJ8vEuS+mzf9aQTu2k5zVf0f/+0JFe2LA+VdUfePX7zQGR
 3iyw==
X-Gm-Message-State: AOAM530cVWzFjkM+YBV4CT3YfbmE5uwHo013Fh6hSyjleLgEngwAiC3Q
 XSglsqNpAt0s0VABlVpXztRcdw==
X-Google-Smtp-Source: ABdhPJxasBAA9aVuXRfBCvu0q17H9ezxyTSRD5GiLSqxpToeQNOEafim7l1ER7C53RR/jnA4TWxLgg==
X-Received: by 2002:a05:651c:96:: with SMTP id 22mr891224ljq.316.1607170959901; 
 Sat, 05 Dec 2020 04:22:39 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id f21sm2367558ljj.71.2020.12.05.04.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Dec 2020 04:22:38 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: s6e63m0: Fix init sequence again
Date: Sat,  5 Dec 2020 13:22:29 +0100
Message-Id: <20201205122229.1952980-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI version of the panel behaved instable and close
scrutiny of the vendor driver from the Samsung
GT-S8190 shows a different initialization sequence for
the DSI mode panel than the DPI mode panel.

Make the initialization depend on whether we are in
DSI or DPI mode and handle the differences.

After this the panel on the GT-I8190 becomes much more
stable.

Also spell out some more custom DCS commands found in
the vendor source code to cut down a bit on magic
where we can.

Cc: Stephan Gerhold <stephan@gerhold.net>
Fixes: f0aee45ffc8b ("drm/panel: s6e63m0: Fix init sequence")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 42 ++++++++++++++-----
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index 6b4e97bfd46e..bf6d704d4d27 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -25,6 +25,14 @@
 /* Manufacturer Command Set */
 #define MCS_ELVSS_ON		0xb1
 #define MCS_TEMP_SWIRE		0xb2
+#define MCS_PENTILE_1		0xb3
+#define MCS_PENTILE_2		0xb4
+#define MCS_GAMMA_DELTA_Y_RED	0xb5
+#define MCS_GAMMA_DELTA_X_RED	0xb6
+#define MCS_GAMMA_DELTA_Y_GREEN	0xb7
+#define MCS_GAMMA_DELTA_X_GREEN	0xb8
+#define MCS_GAMMA_DELTA_Y_BLUE	0xb9
+#define MCS_GAMMA_DELTA_X_BLUE	0xba
 #define MCS_MIECTL1		0xc0
 #define MCS_BCMODE		0xc1
 #define MCS_ERROR_CHECK		0xd5
@@ -281,6 +289,7 @@ struct s6e63m0 {
 	struct backlight_device *bl_dev;
 	u8 lcd_type;
 	u8 elvss_pulse;
+	bool dsi_mode;
 
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset_gpio;
@@ -395,9 +404,21 @@ static int s6e63m0_check_lcd_type(struct s6e63m0 *ctx)
 
 static void s6e63m0_init(struct s6e63m0 *ctx)
 {
-	s6e63m0_dcs_write_seq_static(ctx, MCS_PANELCTL,
-				     0x01, 0x27, 0x27, 0x07, 0x07, 0x54, 0x9f,
-				     0x63, 0x8f, 0x1a, 0x33, 0x0d, 0x00, 0x00);
+	/*
+	 * We do not know why there is a difference in the DSI mode.
+	 * (No datasheet.)
+	 *
+	 * In the vendor driver this sequence is called
+	 * "SEQ_PANEL_CONDITION_SET" or "DCS_CMD_SEQ_PANEL_COND_SET".
+	 */
+	if (ctx->dsi_mode)
+		s6e63m0_dcs_write_seq_static(ctx, MCS_PANELCTL,
+					     0x01, 0x2c, 0x2c, 0x07, 0x07, 0x5f, 0xb3,
+					     0x6d, 0x97, 0x1d, 0x3a, 0x0f, 0x00, 0x00);
+	else
+		s6e63m0_dcs_write_seq_static(ctx, MCS_PANELCTL,
+					     0x01, 0x27, 0x27, 0x07, 0x07, 0x54, 0x9f,
+					     0x63, 0x8f, 0x1a, 0x33, 0x0d, 0x00, 0x00);
 
 	s6e63m0_dcs_write_seq_static(ctx, MCS_DISCTL,
 				     0x02, 0x03, 0x1c, 0x10, 0x10);
@@ -414,40 +435,40 @@ static void s6e63m0_init(struct s6e63m0 *ctx)
 
 	s6e63m0_dcs_write_seq_static(ctx, MCS_SRCCTL,
 				     0x00, 0x8e, 0x07);
-	s6e63m0_dcs_write_seq_static(ctx, 0xb3, 0x6c);
+	s6e63m0_dcs_write_seq_static(ctx, MCS_PENTILE_1, 0x6c);
 
-	s6e63m0_dcs_write_seq_static(ctx, 0xb5,
+	s6e63m0_dcs_write_seq_static(ctx, MCS_GAMMA_DELTA_Y_RED,
 				     0x2c, 0x12, 0x0c, 0x0a, 0x10, 0x0e, 0x17,
 				     0x13, 0x1f, 0x1a, 0x2a, 0x24, 0x1f, 0x1b,
 				     0x1a, 0x17, 0x2b, 0x26, 0x22, 0x20, 0x3a,
 				     0x34, 0x30, 0x2c, 0x29, 0x26, 0x25, 0x23,
 				     0x21, 0x20, 0x1e, 0x1e);
 
-	s6e63m0_dcs_write_seq_static(ctx, 0xb6,
+	s6e63m0_dcs_write_seq_static(ctx, MCS_GAMMA_DELTA_X_RED,
 				     0x00, 0x00, 0x11, 0x22, 0x33, 0x44, 0x44,
 				     0x44, 0x55, 0x55, 0x66, 0x66, 0x66, 0x66,
 				     0x66, 0x66);
 
-	s6e63m0_dcs_write_seq_static(ctx, 0xb7,
+	s6e63m0_dcs_write_seq_static(ctx, MCS_GAMMA_DELTA_Y_GREEN,
 				     0x2c, 0x12, 0x0c, 0x0a, 0x10, 0x0e, 0x17,
 				     0x13, 0x1f, 0x1a, 0x2a, 0x24, 0x1f, 0x1b,
 				     0x1a, 0x17, 0x2b, 0x26, 0x22, 0x20, 0x3a,
 				     0x34, 0x30, 0x2c, 0x29, 0x26, 0x25, 0x23,
 				     0x21, 0x20, 0x1e, 0x1e);
 
-	s6e63m0_dcs_write_seq_static(ctx, 0xb8,
+	s6e63m0_dcs_write_seq_static(ctx, MCS_GAMMA_DELTA_X_GREEN,
 				     0x00, 0x00, 0x11, 0x22, 0x33, 0x44, 0x44,
 				     0x44, 0x55, 0x55, 0x66, 0x66, 0x66, 0x66,
 				     0x66, 0x66);
 
-	s6e63m0_dcs_write_seq_static(ctx, 0xb9,
+	s6e63m0_dcs_write_seq_static(ctx, MCS_GAMMA_DELTA_Y_BLUE,
 				     0x2c, 0x12, 0x0c, 0x0a, 0x10, 0x0e, 0x17,
 				     0x13, 0x1f, 0x1a, 0x2a, 0x24, 0x1f, 0x1b,
 				     0x1a, 0x17, 0x2b, 0x26, 0x22, 0x20, 0x3a,
 				     0x34, 0x30, 0x2c, 0x29, 0x26, 0x25, 0x23,
 				     0x21, 0x20, 0x1e, 0x1e);
 
-	s6e63m0_dcs_write_seq_static(ctx, 0xba,
+	s6e63m0_dcs_write_seq_static(ctx, MCS_GAMMA_DELTA_X_BLUE,
 				     0x00, 0x00, 0x11, 0x22, 0x33, 0x44, 0x44,
 				     0x44, 0x55, 0x55, 0x66, 0x66, 0x66, 0x66,
 				     0x66, 0x66);
@@ -704,6 +725,7 @@ int s6e63m0_probe(struct device *dev,
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->dsi_mode = dsi_mode;
 	ctx->dcs_read = dcs_read;
 	ctx->dcs_write = dcs_write;
 	dev_set_drvdata(dev, ctx);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
