Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC77B147D9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 07:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F56010E5C8;
	Tue, 29 Jul 2025 05:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="nEBV0nut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246C310E1CB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 05:44:52 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7490acf57b9so3451241b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 22:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753767892; x=1754372692;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COKSRSkCv2e/sYoB0EHqFBJc3uH7WpbNSgSDA8clFRo=;
 b=nEBV0nutnlihPBJVe5Utqm2VAkGWNHUOVOGEqDxGy33sOMJw7uYNu711+VFwz8Pb96
 Fif0ADG/BjHeo/PXRdxbcaEXVT6XWp1NJAI8MEaYem1K0+4KTibju9MRrLvJCICqLmlN
 OJiq6KI9nF6gMJGXmBnkH+0x/BBHET+yvOHmgWpv7GYjuo+axv8/otdPHsRhUey0fnss
 SMsr2HYWoo+YeeMO/4TCcJO1NMJxogXljOcV+LK+OBcns22EeL88HY/rFtf23stvptFy
 jhEWbfCUtfPstLeRAlnVQEOgf0RQZ0Fp/3/qWPt2qj+SEKsWkhUFgqsJx74BcsQNZgKZ
 ybSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753767892; x=1754372692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COKSRSkCv2e/sYoB0EHqFBJc3uH7WpbNSgSDA8clFRo=;
 b=mYMcxonxo/aJ/5g1/UHsGhmo/7tNt1IDn1uNyAQqtBwsmA1CkngdNnjza+rIrd/OdU
 Xq+60ZI1Ln2ysHYcKi3p9pS+Jtp4ylk5zPe3TOOruX0OAXT/Gb9KeaqtAywHCHxXoEYS
 vAFdre/QCPDJEAKCvsxWJzsR3z+6meJn4WeBCR5iQ4X9DVhyEUZJUoYg3SzuwIYkjJpt
 4y7kWmewsKbLbSiKIhnEwsYtbjvWtQuf6F7B4H8Q3HfJjm6jUSeBYwOeRKWnDhDUdhn+
 WFsy7F8HcpLUwRWGSqPJbNAb9OJmLtAqLt5LyytXtuflw9gH/q0m7apRLmI250dFA7ZG
 NI2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCHBg0NFwDnr3CSFAtjZ2ivRHKPLLzJc9l2vGBH5NoiZCwZzvgbpPezc27ANv/DuwJGIu18jleoVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX+3N+DxRR5oRQbsxYYfxihyLVuuWh0kLwQ7FoQr0kbLheAxSu
 Ayj75hxOaHLX+z5LSdGC+5sso5K7AaI4Kk1xEvLpc060+vYjUs74PfDLWHBX5uEOzgw=
X-Gm-Gg: ASbGncsEfZndRzE1Q2WNg/wv1HBoU8boqKtgk/W22Zq5fl0ZE+kczI4wjfqLw3TsNne
 fZ5rMRF3S5qYxW/jEnteHhFXoCwCNLJ2cSGacB6Z1/DHJ+UKZjpbYBpi7T4n+wCq6ENPFgE/a04
 RFB6eXwTm2EO+G1g37bAFTIokx4+yJyxPGRB76QrIl3LCF3KUAAvESCSS95d8diD8iqzEdL2CuU
 BvwJwiHoctz0aAvleW5HFhqN0ZgAWQ+kYou12O252/K+OEsYjl9Wu99s69u612pr8gWMPJc9cBM
 BZ6TOGGF9J7dWjj77/Ymob1JzV/MNoj53J5ArnpLwEJMS9Z2B8vdLg4seu/48NLg5ndkfMh8Jkl
 povp06QGthKv0fhQKrCuRjJWPJOYBLKXIe2IGDpv9ESn7bv59Ng==
X-Google-Smtp-Source: AGHT+IEKT4VdUWeYSI+Yxmg18Ry8MecXTM672YvlbxnqiUXUEIyKJRacPTbA4pdEHGHlr/606bjVYg==
X-Received: by 2002:a05:6a21:339b:b0:232:1d30:cd90 with SMTP id
 adf61e73a8af0-23d6ffe4a50mr20873371637.5.1753767891630; 
 Mon, 28 Jul 2025 22:44:51 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640872a500sm6972462b3a.22.2025.07.28.22.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 22:44:50 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 3/3] drm/panel: novatek-nt35560: Clean up driver
Date: Mon, 28 Jul 2025 23:44:35 -0600
Message-ID: <20250729054435.1209156-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729054435.1209156-1-me@brighamcampbell.com>
References: <20250729054435.1209156-1-me@brighamcampbell.com>
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

Update driver to use the "multi" variants of MIPI functions which
facilitate improved error handling and cleaner driver code.

Remove information from a comment which was made obsolete by commit
994ea402c767 ("drm/panel: Rename Sony ACX424 to Novatek NT35560"), which
determined that this driver supports the Novatek NT35560 panel
controller.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
 1 file changed, 60 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 17898a29efe8..561e6643dcbb 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -148,24 +148,20 @@ static inline struct nt35560 *panel_to_nt35560(struct drm_panel *panel)
 static int nt35560_set_brightness(struct backlight_device *bl)
 {
 	struct nt35560 *nt = bl_get_data(bl);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
-	int period_ns = 1023;
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = to_mipi_dsi_device(nt->dev)
+	};
 	int duty_ns = bl->props.brightness;
+	int period_ns = 1023;
 	u8 pwm_ratio;
 	u8 pwm_div;
-	u8 par;
-	int ret;
 
 	if (backlight_is_blank(bl)) {
 		/* Disable backlight */
-		par = 0x00;
-		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
-					 &par, 1);
-		if (ret < 0) {
-			dev_err(nt->dev, "failed to disable display backlight (%d)\n", ret);
-			return ret;
-		}
-		return 0;
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+					     MIPI_DCS_WRITE_CONTROL_DISPLAY,
+					     0x00);
+		return dsi_ctx.accum_err;
 	}
 
 	/* Calculate the PWM duty cycle in n/256's */
@@ -176,12 +172,6 @@ static int nt35560_set_brightness(struct backlight_device *bl)
 
 	/* Set up PWM dutycycle ONE byte (differs from the standard) */
 	dev_dbg(nt->dev, "calculated duty cycle %02x\n", pwm_ratio);
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
-				 &pwm_ratio, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to set display PWM ratio (%d)\n", ret);
-		return ret;
-	}
 
 	/*
 	 * Sequence to write PWMDIV:
@@ -192,46 +182,23 @@ static int nt35560_set_brightness(struct backlight_device *bl)
 	 *	0x22		PWMDIV
 	 *	0x7F		0xAA   CMD2 page 1 lock
 	 */
-	par = 0xaa;
-	ret = mipi_dsi_dcs_write(dsi, 0xf3, &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to unlock CMD 2 (%d)\n", ret);
-		return ret;
-	}
-	par = 0x01;
-	ret = mipi_dsi_dcs_write(dsi, 0x00, &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to enter page 1 (%d)\n", ret);
-		return ret;
-	}
-	par = 0x01;
-	ret = mipi_dsi_dcs_write(dsi, 0x7d, &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to disable MTP reload (%d)\n", ret);
-		return ret;
-	}
-	ret = mipi_dsi_dcs_write(dsi, 0x22, &pwm_div, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to set PWM divisor (%d)\n", ret);
-		return ret;
-	}
-	par = 0xaa;
-	ret = mipi_dsi_dcs_write(dsi, 0x7f, &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to lock CMD 2 (%d)\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_var_seq_multi(&dsi_ctx,
+					 MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
+					 pwm_ratio);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0xaa);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x01);
+
+	mipi_dsi_dcs_write_var_seq_multi(&dsi_ctx, 0x22, pwm_div);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0xaa);
 
 	/* Enable backlight */
-	par = 0x24;
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
-				 &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to enable display backlight (%d)\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x24);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static const struct backlight_ops nt35560_bl_ops = {
@@ -244,32 +211,23 @@ static const struct backlight_properties nt35560_bl_props = {
 	.max_brightness = 1023,
 };
 
-static int nt35560_read_id(struct nt35560 *nt)
+static void nt35560_read_id(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
+	struct device dev = dsi_ctx->dsi->dev;
 	u8 vendor, version, panel;
 	u16 val;
-	int ret;
 
-	ret = mipi_dsi_dcs_read(dsi, NT35560_DCS_READ_ID1, &vendor, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "could not vendor ID byte\n");
-		return ret;
-	}
-	ret = mipi_dsi_dcs_read(dsi, NT35560_DCS_READ_ID2, &version, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "could not read device version byte\n");
-		return ret;
-	}
-	ret = mipi_dsi_dcs_read(dsi, NT35560_DCS_READ_ID3, &panel, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "could not read panel ID byte\n");
-		return ret;
-	}
+	mipi_dsi_dcs_read_multi(dsi_ctx, NT35560_DCS_READ_ID1, &vendor, 1);
+	mipi_dsi_dcs_read_multi(dsi_ctx, NT35560_DCS_READ_ID2, &version, 1);
+	mipi_dsi_dcs_read_multi(dsi_ctx, NT35560_DCS_READ_ID3, &panel, 1);
+
+	if (dsi_ctx->accum_err < 0)
+		return;
 
 	if (vendor == 0x00) {
-		dev_err(nt->dev, "device vendor ID is zero\n");
-		return -ENODEV;
+		dev_err(&dev, "device vendor ID is zero\n");
+		dsi_ctx->accum_err = -ENODEV;
+		return;
 	}
 
 	val = (vendor << 8) | panel;
@@ -278,16 +236,16 @@ static int nt35560_read_id(struct nt35560 *nt)
 	case DISPLAY_SONY_ACX424AKP_ID2:
 	case DISPLAY_SONY_ACX424AKP_ID3:
 	case DISPLAY_SONY_ACX424AKP_ID4:
-		dev_info(nt->dev, "MTP vendor: %02x, version: %02x, panel: %02x\n",
+		dev_info(&dev,
+			 "MTP vendor: %02x, version: %02x, panel: %02x\n",
 			 vendor, version, panel);
 		break;
 	default:
-		dev_info(nt->dev, "unknown vendor: %02x, version: %02x, panel: %02x\n",
+		dev_info(&dev,
+			 "unknown vendor: %02x, version: %02x, panel: %02x\n",
 			 vendor, version, panel);
 		break;
 	}
-
-	return 0;
 }
 
 static int nt35560_power_on(struct nt35560 *nt)
@@ -322,92 +280,56 @@ static void nt35560_power_off(struct nt35560 *nt)
 static int nt35560_prepare(struct drm_panel *panel)
 {
 	struct nt35560 *nt = panel_to_nt35560(panel);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
-	const u8 mddi = 3;
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = to_mipi_dsi_device(nt->dev)
+	};
 	int ret;
 
 	ret = nt35560_power_on(nt);
 	if (ret)
 		return ret;
 
-	ret = nt35560_read_id(nt);
-	if (ret) {
-		dev_err(nt->dev, "failed to read panel ID (%d)\n", ret);
-		goto err_power_off;
-	}
+	nt35560_read_id(&dsi_ctx);
 
-	/* Enabe tearing mode: send TE (tearing effect) at VBLANK */
-	ret = mipi_dsi_dcs_set_tear_on(dsi,
+	/* Enable tearing mode: send TE (tearing effect) at VBLANK */
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx,
 				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret) {
-		dev_err(nt->dev, "failed to enable vblank TE (%d)\n", ret);
-		goto err_power_off;
-	}
 
 	/*
 	 * Set MDDI
 	 *
 	 * This presumably deactivates the Qualcomm MDDI interface and
 	 * selects DSI, similar code is found in other drivers such as the
-	 * Sharp LS043T1LE01 which makes us suspect that this panel may be
-	 * using a Novatek NT35565 or similar display driver chip that shares
-	 * this command. Due to the lack of documentation we cannot know for
-	 * sure.
+	 * Sharp LS043T1LE01.
 	 */
-	ret = mipi_dsi_dcs_write(dsi, NT35560_DCS_SET_MDDI,
-				 &mddi, sizeof(mddi));
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to set MDDI (%d)\n", ret);
-		goto err_power_off;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, NT35560_DCS_SET_MDDI, 3);
 
-	/* Exit sleep mode */
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to exit sleep mode (%d)\n", ret);
-		goto err_power_off;
-	}
-	msleep(140);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 140);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to turn display on (%d)\n", ret);
-		goto err_power_off;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 	if (nt->video_mode) {
-		/* In video mode turn peripheral on */
-		ret = mipi_dsi_turn_on_peripheral(dsi);
-		if (ret) {
-			dev_err(nt->dev, "failed to turn on peripheral\n");
-			goto err_power_off;
-		}
+		mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
 	}
 
-	return 0;
-
-err_power_off:
-	nt35560_power_off(nt);
-	return ret;
+	if (dsi_ctx.accum_err < 0)
+		nt35560_power_off(nt);
+	return dsi_ctx.accum_err;
 }
 
 static int nt35560_unprepare(struct drm_panel *panel)
 {
 	struct nt35560 *nt = panel_to_nt35560(panel);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = to_mipi_dsi_device(nt->dev)
+	};
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to turn display off (%d)\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+
+	if (dsi_ctx.accum_err < 0)
+		return dsi_ctx.accum_err;
 
-	/* Enter sleep mode */
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to enter sleep mode (%d)\n", ret);
-		return ret;
-	}
 	msleep(85);
 
 	nt35560_power_off(nt);
-- 
2.50.1

