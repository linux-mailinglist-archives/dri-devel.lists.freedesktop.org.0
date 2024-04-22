Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659058AC84A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8E8112901;
	Mon, 22 Apr 2024 09:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="tMmpxjCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2432910F2C1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:03:46 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6ee12766586so3171284b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713776625; x=1714381425; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoBdjuXWDUuJ+jSHXmVgfP2cSXSbnwpnE6WVyHmN2Ck=;
 b=tMmpxjCbyrwPnL5Jo1G9ljBaCLUTH83Khz8ZsQtVRLMMn3CaxBAD3zkHGOF4V1T3nS
 yPt15PsLalS4MM/1G1z5arRgETq0YZpl/5AX1h4kur2ODUgOXZ+KcKFVSHSOPWZTh3Rs
 RwO+cJW3pb0wpdQ6e5d/6w5Woaact2l69lnixpE5D6mda0MipYsxkW9Ua736GQRnscMi
 pzjMvLA1KkbMkL7vUIkAh9xr74U5LOO3L3Aa0wUhuaQjILP9Uuc08vf5K5BTfEA5IMAl
 Mxaab6PudgKqThitkyAaVpDwGa3GbZT+21paOh8s9XKEOBT+62KvK15CYHXd+mvyI4+u
 JN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713776625; x=1714381425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MoBdjuXWDUuJ+jSHXmVgfP2cSXSbnwpnE6WVyHmN2Ck=;
 b=L0KfqxEA9VkqDeTFgALGchV/A5l+kWqIfuYEu3biAk27TBwsgAwjvTgaEoe2zha+3O
 ucYkctAqYqG3+GHeaph9RDCtJxeszhKHOWN0t86j02Kyjxg/PM+xTstwEZ/21Vc47GYG
 mPBQ+ay2+3Bo/AQncviHzODFnm2ki7oQsFzD2Tr4av6X8AMU8kYbT9JdttHyLa87SJxG
 6Nnx/GLu1kxgM77uEJFKVveb5kC8tCgzjI18TLGCvneEgwAXXlep+bJKace5fCflUqIm
 sMKdCcga0bdZbGPBt3zw5Ko7jMtpFX0+mc1pvj2UD3OVzkc5/WFhc5hpWbzk/V5g2cne
 uI3g==
X-Gm-Message-State: AOJu0YyT8crjl2tPH29H21bb0Ks8MQ7/bOpQkU0l4yMPtlt526cZ5yFV
 ofQVNBgSjOY+IMlsz7vIGWnORPMnGdNaU2jD9R56XRyI7bzic16TpzAECcVRyW8=
X-Google-Smtp-Source: AGHT+IHtXUIw4DQodd3k75YlM9IE/Uk+dPLH3dhn58MwvKF1de+VA6pYiKx6zsGe2E8F6vddldxFQg==
X-Received: by 2002:a05:6a21:168b:b0:1a3:bd97:4cab with SMTP id
 np11-20020a056a21168b00b001a3bd974cabmr18567528pzb.6.1713776625538; 
 Mon, 22 Apr 2024 02:03:45 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 by42-20020a056a0205aa00b005fdd11c0874sm1919137pgb.64.2024.04.22.02.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 02:03:45 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v2 5/7] drm/panel: himax-hx83102: Support for BOE nv110wum-l60
 MIPI-DSI panel
Date: Mon, 22 Apr 2024 17:03:08 +0800
Message-Id: <20240422090310.3311429-6-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
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

The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, use hx83102 controller
which fits in nicely with the existing panel-himax-hx83102 driver. Hence,
we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 198 ++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index ac8329f89195..963438a2b245 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -46,6 +46,7 @@
 #define HX83102_UNKNOWN3	0xd6
 #define HX83102_SETGIP3		0xd8
 #define HX83102_UNKNOWN4	0xe0
+#define HX83102_UNKNOWN5	0xe1
 #define HX83102_SETTP1		0xe7
 #define HX83102_SETSPCCMD	0xe9
 
@@ -234,6 +235,172 @@ static int starry_init_cmd(struct hx83102 *ctx)
 	return 0;
 };
 
+static int boe_nv110wum_init_cmd(struct hx83102 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+
+	msleep(60);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x83, 0x10, 0x21, 0x55, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x2C, 0xAF, 0xAF, 0x2B, 0xEB, 0x42, 0xE1, 0x4D,
+						  0x36, 0x36, 0x36, 0x36, 0x1A, 0x8B, 0x11, 0x65, 0x00, 0x88, 0xFA, 0xFF,
+						  0xFF, 0x8F, 0xFF, 0x08, 0x9A, 0x33);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETDISP, 0x00, 0x47, 0xB0, 0x80, 0x00, 0x12, 0x71, 0x3C,
+						  0xA3, 0x11, 0x00, 0x00, 0x00, 0x88, 0xF5, 0x22, 0x8F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCYC, 0x49, 0x49, 0x32, 0x32, 0x14, 0x32, 0x84, 0x6E,
+						  0x84, 0x6E, 0x01, 0x9C);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xCD);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETMIPI, 0x84);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETVDC, 0x1B, 0x04);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN1, 0x20);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPTBA, 0xFC, 0x84);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSTBA, 0x36, 0x36, 0x22, 0x00, 0x00, 0xA0, 0x61, 0x08,
+						  0xF5, 0x03);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xCC);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTCON, 0x80);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xC6);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETRAMDMY, 0x97);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPWM, 0x00, 0x1E, 0x30, 0xD4, 0x01);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCLOCK, 0x08, 0x13, 0x07, 0x00, 0x0F, 0x34);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPANEL, 0x02, 0x03, 0x44);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xC4);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCASCADE, 0x03);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPCTRL, 0x37, 0x06, 0x00, 0x02, 0x04, 0x0C, 0xFF);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN2, 0x1F, 0x11, 0x1F, 0x11);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x04, 0x08, 0x04,
+						  0x08, 0x37, 0x37, 0x64, 0x4B, 0x11, 0x11, 0x03, 0x03, 0x32, 0x10, 0x0E,
+						  0x00, 0x0E, 0x32, 0x10, 0x0A, 0x00, 0x0A, 0x32, 0x17, 0x98, 0x07, 0x98,
+						  0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP1, 0x18, 0x18, 0x18, 0x18, 0x1E, 0x1E, 0x1E, 0x1E,
+						  0x1F, 0x1F, 0x1F, 0x1F, 0x24, 0x24, 0x24, 0x24, 0x07, 0x06, 0x07, 0x06,
+						  0x05, 0x04, 0x05, 0x04, 0x03, 0x02, 0x03, 0x02, 0x01, 0x00, 0x01, 0x00,
+						  0x21, 0x20, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xAF, 0xAA, 0xAA, 0xAA, 0xAA, 0xA0, 0xAF, 0xAA,
+						  0xAA, 0xAA, 0xAA, 0xA0);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN4, 0x00, 0x05, 0x0D, 0x14, 0x1B, 0x2C, 0x44, 0x49,
+						  0x51, 0x4C, 0x67, 0x6C, 0x71, 0x80, 0x7D, 0x84, 0x8D, 0xA0, 0xA0, 0x4F,
+						  0x58, 0x64, 0x73, 0x00, 0x05, 0x0D, 0x14, 0x1B, 0x2C, 0x44, 0x49, 0x51,
+						  0x4C, 0x67, 0x6C, 0x71, 0x80, 0x7D, 0x84, 0x8D, 0xA0, 0xA0, 0x4F, 0x58,
+						  0x64, 0x73);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTP1, 0x07, 0x10, 0x10, 0x1A, 0x26, 0x9E, 0x00, 0x53,
+						  0x9B, 0x14, 0x14);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN5, 0x11, 0x00, 0x00, 0x89, 0x30, 0x80, 0x07, 0x80,
+						  0x02, 0x58, 0x00, 0x14, 0x02, 0x58, 0x02, 0x58, 0x02, 0x00, 0x02, 0x2C,
+						  0x00, 0x20, 0x02, 0x02, 0x00, 0x08, 0x00, 0x0C, 0x05, 0x0E, 0x04, 0x94,
+						  0x18, 0x00, 0x10, 0xF0, 0x03, 0x0C, 0x20, 0x00, 0x06, 0x0B, 0x0B, 0x33,
+						  0x0E);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x01);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xFF, 0xFF, 0xFF, 0xFF, 0xFA, 0xA0, 0xFF, 0xFF,
+						  0xFF, 0xFF, 0xFA, 0xA0);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x01, 0xBF, 0x11);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCLOCK, 0x86);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN2, 0x96);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xC9);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP0, 0x84);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xD1);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN5, 0xF6, 0x2B, 0x34, 0x2B, 0x74, 0x3B, 0x74, 0x6B,
+						  0x74);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTP1, 0x02, 0x00, 0x2B, 0x01, 0x7E, 0x0F, 0x7E, 0x10,
+						  0xA0, 0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x02);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCYC, 0x02, 0x00, 0xBB, 0x11);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xFF, 0xAF, 0xFF, 0xFF, 0xFA, 0xA0, 0xFF, 0xAF,
+						  0xFF, 0xFF, 0xFA, 0xA0);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTP1, 0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01, 0x00, 0x00,
+						  0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00, 0x20, 0x65, 0x02, 0x01,
+						  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x03);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xAA, 0xAF, 0xAA, 0xAA, 0xA0, 0x00, 0xAA, 0xAF,
+						  0xAA, 0xAA, 0xA0, 0x00, 0xAA, 0xAF, 0xAA, 0xAA, 0xA0, 0x00, 0xAA, 0xAF,
+						  0xAA, 0xAA, 0xA0, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xC6);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCYC, 0x03, 0xFF, 0xF8);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN5, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xC4);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETMIPI, 0x96);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x01);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xC5);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETMIPI, 0x4F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3F);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x00, 0x00, 0x00);
+
+	msleep(50);
+
+	return 0;
+};
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -262,6 +429,34 @@ static const struct hx83102_panel_desc starry_desc = {
 	.lp11_before_reset = true,
 };
 
+static const struct drm_display_mode boe_tv110wum_default_mode = {
+	.clock = 166400,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 65,
+	.hsync_end = 1200 + 65 + 20,
+	.htotal = 1200 + 60 + 20 + 65,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 115,
+	.vsync_end = 1920 + 115 + 8,
+	.vtotal = 1920 + 115 + 8 + 12,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc boe_nv110wum_desc = {
+	.modes = &boe_tv110wum_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 147,
+		.height_mm = 235,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = boe_nv110wum_init_cmd,
+	.lp11_before_reset = true
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	struct hx83102 *ctx = panel_to_hx83102(panel);
@@ -545,6 +740,9 @@ static void hx83102_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id hx83102_of_match[] = {
+	{ .compatible = "boe,nv110wum-l60",
+	  .data = &boe_nv110wum_desc
+	},
 	{ .compatible = "starry,himax83102-j02",
 	  .data = &starry_desc
 	},
-- 
2.25.1

