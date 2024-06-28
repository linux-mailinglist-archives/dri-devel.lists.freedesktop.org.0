Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7D691B5E9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 07:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D7B10E1CF;
	Fri, 28 Jun 2024 05:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dszsJD69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EAA10EBB2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:11:10 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7066463c841so160257b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 22:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719551470; x=1720156270; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1leVm4yK6r54KvcryCJ+B+nYpH1fvWydBSEJaKQDgw=;
 b=dszsJD69sDDCqOblKUQjXeTS3qwqGzg+YneHNc5A2Hj3f+/gEouVof0xiQPzc3OJrH
 JtpJmoH1EiWGBypqDEGVV0/XfeGPRUFA/AM05+0T0tWIEGuvttydec1s3lzYuuJjJKVh
 O1TTD4npkgT1Xti0Gcd8gfcRLclFEuHpsC7Q/acigeei1WFk85J24YEsjEYcFbMnpN8E
 BjFMd4px58UiC4LWUo2YnmgTKX9UOuGzFyK58djvBFHuOpDtIJWpFNrHjhvz5Ttul4pY
 gZZKXW9boTIXohm/W5mKCfWnmwDLk1kpOjMCU2wM21vy3Sv+sZ/a3Kj3PW4wKhKQ3mTJ
 S1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719551470; x=1720156270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1leVm4yK6r54KvcryCJ+B+nYpH1fvWydBSEJaKQDgw=;
 b=KyKy7adi7YXkKbFVHac361Wp1DxibqoTT+8XlWytRyRS2YXVFp9P+rJh9CGZuJsT3u
 puMAe4bY8QTfIgZ5Osfb5rkOupAL+atS2v9DH0GpAAusMZeKf0/ZIU2uF7NFDCuAnRM8
 Ku7C+RBUWuOjs+LgAhh+vltrmbVNMGKMKntEXESKzCHJ2wsi2s/ZRsccpOuJmgYnRep6
 +XSIr7MOFzkVl86nzVwNFS3mIiN4g0Tsts95xeqeefsnzUP+HStOfOvO/BjlKUWEGidD
 TYHEPghsP/1kSxftICkzSmpe2PwaeR3GrWgqaWxELfGKMmeSEzfPmgg2C4+Up+tvAcn8
 BgIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8TFym6KYCT9Vee/Jle2PTFGYvKeA7jEuL85L5t1fpgH+wCfjgavOiS1w+9eRsrfCt7UO37DwpjBD5co1xRY/G5NLI8u/4RIGXa6j/D0vO
X-Gm-Message-State: AOJu0YwZXqEY1kG3OQ5Jni8jyRnu0BTp6WRXebmyZ062wsSRYszEd+sy
 Ia1WUzYtxBT0wQB6ticeF96cWBrJYfHDaI5/8Oe9G8Qyx3qEVk2O
X-Google-Smtp-Source: AGHT+IEdqo5LbG/OYlTAzYx9ptswNQzlqaWakcu0sg22J2Y7C21d+uH6Fngxi6+VrsgnXKDB24vpDQ==
X-Received: by 2002:a05:6a00:2e0d:b0:706:a86f:e966 with SMTP id
 d2e1a72fcca58-706a86feb29mr8468243b3a.31.1719551470045; 
 Thu, 27 Jun 2024 22:11:10 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804893e4bsm624716b3a.184.2024.06.27.22.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 22:11:09 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] drm/panel: st7701: Add Anbernic RG28XX panel support
Date: Fri, 28 Jun 2024 14:10:17 +0900
Message-ID: <20240628051019.975172-4-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628051019.975172-1-kikuchan98@gmail.com>
References: <20240628051019.975172-1-kikuchan98@gmail.com>
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

The Anbernic RG28XX is a handheld gaming device with a 2.8 inch 480x640
display. Add support for the display panel.

This panel is driven by a variant of ST7701 driver IC internally,
confirmed by dumping and analyzing its BSP initialization sequence
by using a logic analyzer. It is very similar to the existing
densitron,dmt028vghmcmi-1a panel, but differs in some unknown
register values. Besides, it is connected via SPI, so add a new entry
for the panel.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 07980f010bb..8450a4317c1 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -471,6 +471,55 @@ static void rg_arc_gip_sequence(struct st7701 *st7701)
 	msleep(120);
 }
 
+static void rg28xx_gip_sequence(struct st7701 *st7701)
+{
+	st7701_switch_cmd_bkx(st7701, true, 3);
+	ST7701_WRITE(st7701, 0xEF, 0x08);
+
+	st7701_switch_cmd_bkx(st7701, true, 0);
+	ST7701_WRITE(st7701, 0xC3, 0x02, 0x10, 0x02);
+	ST7701_WRITE(st7701, 0xC7, 0x04);
+	ST7701_WRITE(st7701, 0xCC, 0x10);
+
+	st7701_switch_cmd_bkx(st7701, true, 1);
+	ST7701_WRITE(st7701, 0xEE, 0x42);
+	ST7701_WRITE(st7701, 0xE0, 0x00, 0x00, 0x02);
+
+	ST7701_WRITE(st7701, 0xE1, 0x04, 0xA0, 0x06, 0xA0, 0x05, 0xA0, 0x07, 0xA0,
+		   0x00, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		   0x00, 0x00, 0x00, 0x00);
+	ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x22, 0x22);
+	ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE5, 0x0C, 0x90, 0xA0, 0xA0, 0x0E, 0x92, 0xA0, 0xA0,
+		   0x08, 0x8C, 0xA0, 0xA0, 0x0A, 0x8E, 0xA0, 0xA0);
+	ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x22, 0x22);
+	ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE8, 0x0D, 0x91, 0xA0, 0xA0, 0x0F, 0x93, 0xA0, 0xA0,
+		   0x09, 0x8D, 0xA0, 0xA0, 0x0B, 0x8F, 0xA0, 0xA0);
+	ST7701_WRITE(st7701, 0xEB, 0x00, 0x00, 0xE4, 0xE4, 0x44, 0x00, 0x40);
+	ST7701_WRITE(st7701, 0xED, 0xFF, 0xF5, 0x47, 0x6F, 0x0B, 0xA1, 0xBA, 0xFF,
+		   0xFF, 0xAB, 0x1A, 0xB0, 0xF6, 0x74, 0x5F, 0xFF);
+	ST7701_WRITE(st7701, 0xEF, 0x08, 0x08, 0x08, 0x45, 0x3F, 0x54);
+
+	st7701_switch_cmd_bkx(st7701, false, 0);
+
+	st7701_switch_cmd_bkx(st7701, true, 3);
+	ST7701_WRITE(st7701, 0xE6, 0x16);
+	ST7701_WRITE(st7701, 0xE8, 0x00, 0x0E);
+
+	st7701_switch_cmd_bkx(st7701, false, 0);
+	ST7701_WRITE(st7701, MIPI_DCS_SET_ADDRESS_MODE, 0x10);
+	ST7701_WRITE(st7701, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(120);
+
+	st7701_switch_cmd_bkx(st7701, true, 3);
+	ST7701_WRITE(st7701, 0xE8, 0x00, 0x0C);
+	msleep(10);
+	ST7701_WRITE(st7701, 0xE8, 0x00, 0x00);
+	st7701_switch_cmd_bkx(st7701, false, 0);
+}
+
 static int st7701_prepare(struct drm_panel *panel)
 {
 	struct st7701 *st7701 = panel_to_st7701(panel);
@@ -986,6 +1035,106 @@ static const struct st7701_panel_desc rg_arc_desc = {
 	.gip_sequence = rg_arc_gip_sequence,
 };
 
+static const struct drm_display_mode rg28xx_mode = {
+	.clock		= 22325,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 40,
+	.hsync_end	= 480 + 40 + 4,
+	.htotal		= 480 + 40 + 4 + 20,
+
+	.vdisplay	= 640,
+	.vsync_start	= 640 + 2,
+	.vsync_end	= 640 + 2 + 40,
+	.vtotal		= 640 + 2 + 40 + 16,
+
+	.width_mm	= 44,
+	.height_mm	= 58,
+
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct st7701_panel_desc rg28xx_desc = {
+	.mode = &rg28xx_mode,
+
+	.panel_sleep_delay = 80,
+
+	.pv_gamma = {
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x10),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x17),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0xd),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x11),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x6),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x5),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x7),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x1f),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x4),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0x11),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0xe),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0x29),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x30),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
+	},
+	.nv_gamma = {
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0xd),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x14),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0xe),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x11),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x6),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x4),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x8),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x20),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x5),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0x13),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0x26),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x30),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
+	},
+	.nlinv = 7,
+	.vop_uv = 4800000,
+	.vcom_uv = 1512500,
+	.vgh_mv = 15000,
+	.vgl_mv = -11730,
+	.avdd_mv = 6600,
+	.avcl_mv = -4400,
+	.gamma_op_bias = OP_BIAS_MIDDLE,
+	.input_op_bias = OP_BIAS_MIN,
+	.output_op_bias = OP_BIAS_MIN,
+	.t2d_ns = 1600,
+	.t3d_ns = 10400,
+	.eot_en = true,
+	.gip_sequence = rg28xx_gip_sequence,
+};
+
 static void st7701_cleanup(void *data)
 {
 	struct st7701 *st7701 = (struct st7701 *)data;
@@ -1120,11 +1269,13 @@ static const struct of_device_id st7701_dsi_of_match[] = {
 MODULE_DEVICE_TABLE(of, st7701_dsi_of_match);
 
 static const struct of_device_id st7701_spi_of_match[] = {
+	{ .compatible = "anbernic,rg28xx-panel", .data = &rg28xx_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, st7701_spi_of_match);
 
 static const struct spi_device_id st7701_spi_ids[] = {
+	{ "rg28xx-panel" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, st7701_spi_ids);
-- 
2.45.2

