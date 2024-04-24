Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A058AFE71
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321691123B3;
	Wed, 24 Apr 2024 02:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="UMss3IxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C254410FB78
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:30:50 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6ed20fb620fso5371002b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713925850; x=1714530650; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzH4XV8Zi04kMHmrB/YlldjcyEVvFvCgJE1H2WULusA=;
 b=UMss3IxVDF0yU6zH0X12fzzVJg/x9cNE4Pa0OizxHciSMhrdjyZWqY+y6Ne983fMDo
 fJydsqC7CK7EFr6j/zIDxKlbPURDtcaPBc9eF6S+3q1mvLTTG69n4bQeQwLEjKkGMkmm
 ZA59MW/Q+luQzDctzZiK9OAm+9gMrGd9qGBQsFdsV4wRjYBzEBr1FvVOjIOZIdFnszu4
 hBIK7fREphbw73XkYv2794JR4qUDtAzo3oExWH638noNdkXY9f3CPGUV2qK2x7xNa4zD
 ghI/4EYY7Wu0Ey2PMVX9zYsKUO72dPrpmK3dZTlzZmYG8zIlULbyEs61G46/Vtd2CzY8
 YIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713925850; x=1714530650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzH4XV8Zi04kMHmrB/YlldjcyEVvFvCgJE1H2WULusA=;
 b=Q0OVA/elUiQEwwglCe/K0j8Lry5rfTf23bclLqdSlNBqcgfrzUdC4J7hoHc+rghCVm
 g6rKtfEOd4Tx2+IvMO1kopA6SJaWCqPLhQhjjbZFvuVpu4chNQLJxvQR57DXiwv5xC72
 Ce3p8937Ri0penjnnj7exNgMd1nkjSG0qR+czWz3KR3kiOk1sSIKtbnhQSIGWTcvtRG5
 +SOSK0Uz77BCL8+cwiFWWUoqL/HHvAKoSDGFxVTMdpugvaHMSH5q11xx41LwkTm2kaho
 wQmICWnvgK3Vg/0nlcSYLU4IOZEZrn3TCxJM2RpqsmGdkBuzO2dO/U3k3l4NY02kgH3U
 hbSQ==
X-Gm-Message-State: AOJu0Yzvlr1x/REab7QcauKC+07zvjknxRLDFGlCea3W4CK7DNerjvPa
 mSnFQbChQuwO/FvY9oTTrDh1pWB4DH/ukWPTY8XXDzOVtgbijh3QPSCFw59Svkc=
X-Google-Smtp-Source: AGHT+IGNaIv8Iz5J1kXLvBeSYNk09Mn1WAfhmoEvJVNM1wT9o/npLLmgTNZ4rPWF0XFPRcyzOMc6EA==
X-Received: by 2002:a05:6a21:99b:b0:1a9:6c18:7e96 with SMTP id
 li27-20020a056a21099b00b001a96c187e96mr1052698pzb.19.1713925850096; 
 Tue, 23 Apr 2024 19:30:50 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a638c02000000b005e857e39b10sm10179385pgd.56.2024.04.23.19.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 19:30:49 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v3 5/7] drm/panel: himax-hx83102: Support for BOE nv110wum-l60
 MIPI-DSI panel
Date: Wed, 24 Apr 2024 10:30:08 +0800
Message-Id: <20240424023010.2099949-6-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
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
Chage since V3:

- inital cmds use lowercasehex.

V2: https://lore.kernel.org/all/20240422090310.3311429-6-yangcong5@huaqin.corp-partner.google.com

---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 192 ++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index b60ba60a4140..ea433d0c86f9 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -44,6 +44,7 @@
 #define HX83102_UNKNOWN3	0xd6
 #define HX83102_SETGIP3		0xd8
 #define HX83102_UNKNOWN4	0xe0
+#define HX83102_UNKNOWN5	0xe1
 #define HX83102_SETTP1		0xe7
 #define HX83102_SETSPCCMD	0xe9
 
@@ -225,6 +226,172 @@ static int starry_init_cmd(struct hx83102 *ctx)
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
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x2c, 0xaf, 0xaf, 0x2b, 0xeb, 0x42, 0xe1, 0x4d,
+						  0x36, 0x36, 0x36, 0x36, 0x1a, 0x8b, 0x11, 0x65, 0x00, 0x88, 0xfa, 0xff,
+						  0xff, 0x8f, 0xff, 0x08, 0x9a, 0x33);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETDISP, 0x00, 0x47, 0xb0, 0x80, 0x00, 0x12, 0x71, 0x3c,
+						  0xa3, 0x11, 0x00, 0x00, 0x00, 0x88, 0xf5, 0x22, 0x8f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCYC, 0x49, 0x49, 0x32, 0x32, 0x14, 0x32, 0x84, 0x6e,
+						  0x84, 0x6e, 0x01, 0x9c);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xcd);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETMIPI, 0x84);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETVDC, 0x1b, 0x04);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN1, 0x20);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPTBA, 0xfc, 0x84);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSTBA, 0x36, 0x36, 0x22, 0x00, 0x00, 0xa0, 0x61, 0x08,
+						  0xf5, 0x03);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xcc);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTCON, 0x80);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xc6);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETRAMDMY, 0x97);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPWM, 0x00, 0x1e, 0x30, 0xd4, 0x01);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCLOCK, 0x08, 0x13, 0x07, 0x00, 0x0f, 0x34);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPANEL, 0x02, 0x03, 0x44);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xc4);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCASCADE, 0x03);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPCTRL, 0x37, 0x06, 0x00, 0x02, 0x04, 0x0c, 0xff);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN2, 0x1f, 0x11, 0x1f, 0x11);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x04, 0x08, 0x04,
+						  0x08, 0x37, 0x37, 0x64, 0x4b, 0x11, 0x11, 0x03, 0x03, 0x32, 0x10, 0x0e,
+						  0x00, 0x0e, 0x32, 0x10, 0x0a, 0x00, 0x0a, 0x32, 0x17, 0x98, 0x07, 0x98,
+						  0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP1, 0x18, 0x18, 0x18, 0x18, 0x1e, 0x1e, 0x1e, 0x1e,
+						  0x1f, 0x1f, 0x1f, 0x1f, 0x24, 0x24, 0x24, 0x24, 0x07, 0x06, 0x07, 0x06,
+						  0x05, 0x04, 0x05, 0x04, 0x03, 0x02, 0x03, 0x02, 0x01, 0x00, 0x01, 0x00,
+						  0x21, 0x20, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xaf, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0xaf, 0xaa,
+						  0xaa, 0xaa, 0xaa, 0xa0);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN4, 0x00, 0x05, 0x0d, 0x14, 0x1b, 0x2c, 0x44, 0x49,
+						  0x51, 0x4c, 0x67, 0x6c, 0x71, 0x80, 0x7d, 0x84, 0x8d, 0xa0, 0xa0, 0x4f,
+						  0x58, 0x64, 0x73, 0x00, 0x05, 0x0d, 0x14, 0x1b, 0x2c, 0x44, 0x49, 0x51,
+						  0x4c, 0x67, 0x6c, 0x71, 0x80, 0x7d, 0x84, 0x8d, 0xa0, 0xa0, 0x4f, 0x58,
+						  0x64, 0x73);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTP1, 0x07, 0x10, 0x10, 0x1a, 0x26, 0x9e, 0x00, 0x53,
+						  0x9b, 0x14, 0x14);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN5, 0x11, 0x00, 0x00, 0x89, 0x30, 0x80, 0x07, 0x80,
+						  0x02, 0x58, 0x00, 0x14, 0x02, 0x58, 0x02, 0x58, 0x02, 0x00, 0x02, 0x2c,
+						  0x00, 0x20, 0x02, 0x02, 0x00, 0x08, 0x00, 0x0c, 0x05, 0x0e, 0x04, 0x94,
+						  0x18, 0x00, 0x10, 0xf0, 0x03, 0x0c, 0x20, 0x00, 0x06, 0x0b, 0x0b, 0x33,
+						  0x0e);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x01);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0, 0xff, 0xff,
+						  0xff, 0xff, 0xfa, 0xa0);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x01, 0xbf, 0x11);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCLOCK, 0x86);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN2, 0x96);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xc9);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP0, 0x84);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xd1);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN5, 0xf6, 0x2b, 0x34, 0x2b, 0x74, 0x3b, 0x74, 0x6b,
+						  0x74);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTP1, 0x02, 0x00, 0x2b, 0x01, 0x7e, 0x0f, 0x7e, 0x10,
+						  0xa0, 0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x02);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCYC, 0x02, 0x00, 0xbb, 0x11);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xff, 0xaf, 0xff, 0xff, 0xfa, 0xa0, 0xff, 0xaf,
+						  0xff, 0xff, 0xfa, 0xa0);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTP1, 0xfe, 0x01, 0xfe, 0x01, 0xfe, 0x01, 0x00, 0x00,
+						  0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00, 0x20, 0x65, 0x02, 0x01,
+						  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x03);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x00, 0xaa, 0xaf,
+						  0xaa, 0xaa, 0xa0, 0x00, 0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x00, 0xaa, 0xaf,
+						  0xaa, 0xaa, 0xa0, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xc6);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCYC, 0x03, 0xff, 0xf8);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN5, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xc4);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETMIPI, 0x96);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x01);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xc5);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETMIPI, 0x4f);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0x3f);
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
@@ -247,6 +414,28 @@ static const struct hx83102_panel_desc starry_desc = {
 	.init_cmds = starry_init_cmd,
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
+	.size = {
+		.width_mm = 147,
+		.height_mm = 235,
+	},
+	.init_cmds = boe_nv110wum_init_cmd,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	struct hx83102 *ctx = panel_to_hx83102(panel);
@@ -503,6 +692,9 @@ static void hx83102_remove(struct mipi_dsi_device *dsi)
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

