Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AAE8AFE75
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21C511261A;
	Wed, 24 Apr 2024 02:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Ic4OkwS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E36E11252C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:31:00 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3bbc649c275so2755907b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713925859; x=1714530659; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGlfIXei0q5g87t8TDHyHjhG2JVouovJNembL1zbdJM=;
 b=Ic4OkwS8fOVJ6AipuSaZ2GK+poQ6Y9ZRys/dv9+yZ9JUk11I/nacylqy6OD2gPYYW/
 lsFF5NjwuliAs+6gJLyNXqtXFWhbewptuoGdk7rYuifVEc5+hQ6Zh3zL/KgkxRuVJW1e
 lkgG+d5k/ZpBT3v1ztE1nhR9FqToQQ7dTEE+7qLQMeVh9xcyzPjDnaJxs4ZaTQcKHjOZ
 CLdvutVhl/8OseJNAwTNjbA+8aln8nZfpi/jlVb85kj9R0qYnwnL84dGbJFZ7yBXu3mf
 FaZm97TSdWR9ZIW06C283RmTde/YrBN4Y5clQzP81MzwLujTTRoCbGIXC/rDJZ+wUHh5
 4OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713925859; x=1714530659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGlfIXei0q5g87t8TDHyHjhG2JVouovJNembL1zbdJM=;
 b=SY/jZyEoZeyAhEJXGblknGZ1y9Fdw3om0u/sk0d+GmEmY/MaHCjt/fUrZaIFnyVofJ
 vOYk+vXx0bjLtfsgmudRO3GvEVvub5VtNBP7ow4UimFdjQ7x8oMi8Zr71dRSEmZYKL9b
 XRghooAK1INeVAWybHOD1KosnEpHFgsuk92+YRztYIWljQvy5oHqgyWLGxORKuRL9g6E
 47QYYDfemlF9brjwTZKXnUFG8OZp8eLGj8wpuQRq7Z0axxUcbngcdVzb/LjrX1noa0S0
 RkAYQk5qGRP+H1117mS1s+XKLnvOZltN071S/VF7Rs5XQQaPL2fz+QugPQNEDmaCoT5s
 XumA==
X-Gm-Message-State: AOJu0YykMy8vztON8TZgYz58nxgPW1kpn+YmbtcXAXN4t9U31qpG2xSm
 AnraVe3yVx7xJQ4MjrGoSnUm2VUnOanUI9wf3oyqhl8jdp8ATzgIaxtazGowELc=
X-Google-Smtp-Source: AGHT+IH13ShZNauuVVcIYxiND28Z8XPM6Izk+d10fAGG2AogDuxMToOZVz94kJMhKf0juB6GPzqEJA==
X-Received: by 2002:a05:6808:2391:b0:3c6:eb0:7471 with SMTP id
 bp17-20020a056808239100b003c60eb07471mr1208441oib.43.1713925859293; 
 Tue, 23 Apr 2024 19:30:59 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a638c02000000b005e857e39b10sm10179385pgd.56.2024.04.23.19.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 19:30:58 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v3 7/7] drm/panel: himax-hx83102: Support for IVO t109nw41
 MIPI-DSI panel
Date: Wed, 24 Apr 2024 10:30:10 +0800
Message-Id: <20240424023010.2099949-8-yangcong5@huaqin.corp-partner.google.com>
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

The IVO t109nw41 is a 11.0" WUXGA TFT LCD panel, use hx83102 controller
which fits in nicely with the existing panel-himax-hx83102 driver. Hence,
we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
Chage since V3:

- inital cmds use lowercasehex.

V2: https://lore.kernel.org/all/20240422090310.3311429-8-yangcong5@huaqin.corp-partner.google.com

---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 172 ++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index ea433d0c86f9..96c637c7ae2c 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -24,6 +24,7 @@
 #define HX83102_SETPOWER	0xb1
 #define HX83102_SETDISP		0xb2
 #define HX83102_SETCYC		0xb4
+#define HX83102_UNKNOWN6	0xb6
 #define HX83102_SETEXTC		0xb9
 #define HX83102_SETMIPI		0xba
 #define HX83102_SETVDC		0xbc
@@ -392,6 +393,152 @@ static int boe_nv110wum_init_cmd(struct hx83102 *ctx)
 	return 0;
 };
 
+static int ivo_t109nw41_init_cmd(struct hx83102 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+
+	msleep(60);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x83, 0x10, 0x21, 0x55, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x2c, 0xed, 0xed, 0x27, 0xe7, 0x42, 0xf5, 0x39,
+						  0x36, 0x36, 0x36, 0x36, 0x32, 0x8b, 0x11, 0x65, 0x00, 0x88, 0xfa, 0xff,
+						  0xff, 0x8f, 0xff, 0x08, 0xd6, 0x33);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETDISP, 0x00, 0x47, 0xb0, 0x80, 0x00, 0x12, 0x71, 0x3c,
+						  0xa3, 0x22, 0x20, 0x00, 0x00, 0x88, 0x01);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCYC, 0x35, 0x35, 0x43, 0x43, 0x35, 0x35, 0x30, 0x7a,
+						  0x30, 0x7a, 0x01, 0x9d);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_UNKNOWN6, 0x34, 0x34, 0x03);
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
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPTBA, 0xfc, 0xc4);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSTBA, 0x34, 0x34, 0x22, 0x11, 0x22, 0xa0, 0x31, 0x08,
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
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPWM, 0x00, 0x1e, 0x13, 0x88, 0x01);
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
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPCTRL, 0x07, 0x06, 0x00, 0x02, 0x04, 0x2c, 0xff);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x08,
+						  0x08, 0x37, 0x07, 0x64, 0x7c, 0x11, 0x11, 0x03, 0x03, 0x32, 0x10, 0x0e,
+						  0x00, 0x0e, 0x32, 0x17, 0x97, 0x07, 0x97, 0x32, 0x00, 0x02, 0x00, 0x02,
+						  0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP1, 0x25, 0x24, 0x25, 0x24, 0x18, 0x18, 0x18, 0x18,
+						  0x07, 0x06, 0x07, 0x06, 0x05, 0x04, 0x05, 0x04, 0x03, 0x02, 0x03, 0x02,
+						  0x01, 0x00, 0x01, 0x00, 0xa8, 0xa8, 0xa8, 0xa8, 0x29, 0x29, 0x29, 0x29,
+						  0x21, 0x20, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0xaa, 0xaa,
+						  0xaa, 0xaa, 0xaa, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+						  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+						  0x00, 0x00, 0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTP1, 0x07, 0x10, 0x10, 0x1a, 0x26, 0x9e, 0x00, 0x4f,
+						  0xa0, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12, 0x0a, 0x02, 0x02, 0x00,
+						  0x33, 0x02, 0x04, 0x18, 0x01);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x01);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x01, 0x7f, 0x11, 0xfd);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCLOCK, 0x86);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+						  0x00, 0x00, 0x00, 0x00, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0xaa, 0xaa,
+						  0xaa, 0xaa, 0xaa, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+						  0x00, 0x00, 0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTP1, 0x02, 0x00, 0x2b, 0x01, 0x7e, 0x0f, 0x7e, 0x10,
+						  0xa0, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x02);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETPTBA, 0xf2);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETCLOCK, 0x03, 0x07, 0x00, 0x10, 0x79);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETGIP3, 0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0,
+						  0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETTP1, 0xfe, 0x01, 0xfe, 0x01, 0xfe, 0x01, 0x00, 0x00,
+						  0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00, 0x20, 0x6e, 0x02, 0x01,
+						  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETBANK, 0x03);
+
+	mipi_dsi_dcs_write_seq(dsi, HX83102_SETSPCCMD, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0xaa, 0xaa,
+						  0xaa, 0xaa, 0xaa, 0xa0, 0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0, 0xff, 0xff,
+						  0xff, 0xff, 0xfa, 0xa0, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0xaa, 0xaa,
+						  0xaa, 0xaa, 0xaa, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+						  0x00, 0x00, 0x00, 0x00);
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
+	msleep(60);
+
+	return 0;
+};
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -436,6 +583,28 @@ static const struct hx83102_panel_desc boe_nv110wum_desc = {
 	.init_cmds = boe_nv110wum_init_cmd,
 };
 
+static const struct drm_display_mode ivo_t109nw41_default_mode = {
+	.clock = 166400,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 75,
+	.hsync_end = 1200 + 75 + 20,
+	.htotal = 1200 + 75 + 20 + 55,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 115,
+	.vsync_end = 1920 + 115 + 8,
+	.vtotal = 1920 + 115 + 8 + 12,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc ivo_t109nw41_desc = {
+	.modes = &ivo_t109nw41_default_mode,
+	.size = {
+		.width_mm = 147,
+		.height_mm = 235,
+	},
+	.init_cmds = ivo_t109nw41_init_cmd,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	struct hx83102 *ctx = panel_to_hx83102(panel);
@@ -695,6 +864,9 @@ static const struct of_device_id hx83102_of_match[] = {
 	{ .compatible = "boe,nv110wum-l60",
 	  .data = &boe_nv110wum_desc
 	},
+	{ .compatible = "ivo,t109nw41",
+	  .data = &ivo_t109nw41_desc
+	},
 	{ .compatible = "starry,himax83102-j02",
 	  .data = &starry_desc
 	},
-- 
2.25.1

