Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75953745D07
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 15:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428F810E219;
	Mon,  3 Jul 2023 13:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB7C890BE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 13:22:01 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b6a6f224a1so71658141fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688390520; x=1690982520;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8pwcMMcLu8aRKPbF6hOsBwY09TgJnTHnoSY0sCGoOrg=;
 b=JZ1VL81wimucYJtISs+yFDMAY2WffZ5+bs59wQn09C/XJg43cnDfksjEAU6IZHri6g
 WeYP9eGIo+osI0GXyZbj4UNgP+0kpP9y7JhLmUDg+bTre1zC5ymgriP9fqfcWOltgNmP
 KAyUr5+zazO5tNddxhJDlmaCs5TmvYiEPRB6I/6DAlwn0JneCori1Y/gOw7rWU4wm5KI
 zpBfxO2ON7f2fnUvi8sAZfU74IlWuTCl5r7+b+7jLINAQaxlsNkaMdRRB1df1Z4VawgF
 q3/rFoU2AHSjpwf8sXRqpNGWOKRi2O4BGICp4UvP9yNGMmops5MUUhmDBOQDBOHOEOYJ
 VuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688390520; x=1690982520;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8pwcMMcLu8aRKPbF6hOsBwY09TgJnTHnoSY0sCGoOrg=;
 b=RNYBF8HMhzZU1wp3EjIFjW9N2cdxl4juDGY1Ngb5eErPQGdfHoVpV+toaM2AFTVgKG
 TiouHSFs8wM3TuOGYTc1QmuwWhn2wvUzaPbSS5Q9/W4BkIU9Xey6FZZFuLYntIbLn+nr
 899zFKUwq5+NvcwQJCKjmi2O3bIlfqT8VvXiCHs4n6RalO97hHuyyed99G4DCMMW9nfb
 BWjPrJM2MvZ1gMrAWmi5+BzBcYWgI8KfLp6TEDqK7/Babm+q62ygBhqCL0ksfBrVtymW
 lo84dmVgIHp39XLbEW+h7LI+mxfpzKrEKVylUmMN497hRPNzNfjXjH62QVaOWNayoQyA
 NBLg==
X-Gm-Message-State: ABy/qLafH3hpDmPerJZrj6M9POXzBLEkVoWTS4HKgH+WOdd6pf9fEfiB
 E/lmxX+ZAycMu50i6JShMM+wXIcJjbbxDJQH9PU=
X-Google-Smtp-Source: APBJJlFPBxTp70HQuK46qpjEtdn5PiCm7FuEyI0Q8CYc4zySF/5tGkFU5++DfGfNBJ9N5vp7yPlrEQ==
X-Received: by 2002:a2e:3515:0:b0:2b6:d89e:74e2 with SMTP id
 z21-20020a2e3515000000b002b6d89e74e2mr4434725ljz.7.1688390519934; 
 Mon, 03 Jul 2023 06:21:59 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 u10-20020a2e9f0a000000b002b6b7a98c4bsm3535238ljk.77.2023.07.03.06.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 06:21:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Jul 2023 15:21:52 +0200
Subject: [PATCH v3 4/4] drm/panel: ili9882t: Break out function for
 switching page
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-fix-boe-tv101wum-nl6-v3-4-bd6e9432c755@linaro.org>
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>, 
 Stephen Boyd <swboyd@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ILI9882t has similarities with other Ilitek panels, such
as the characteristic internal page switching code that uses
the model number (0x98, 0x82) as parameter.

We can clearly abstract out the page switching sequence from
the initialization code.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 54 ++++++++++++++++++---------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 20f3cc37fa83..c1a0f10fbaf7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -55,13 +55,33 @@ struct ili9882t {
 	struct gpio_desc *enable_gpio;
 };
 
+/* ILI9882-specific commands, add new commands as you decode them */
+#define ILI9882T_DCS_SWITCH_PAGE	0xFF
+
+static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 page)
+{
+	u8 switch_cmd[] = {0x98, 0x82, 0x00};
+	int ret;
+
+	switch_cmd[2] = page;
+
+	ret = mipi_dsi_dcs_write(dsi, ILI9882T_DCS_SWITCH_PAGE, switch_cmd, 3);
+	if (ret) {
+		dev_err(&dsi->dev,
+			"error switching panel controller page (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 {
 	int ret;
 
 	msleep(5);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x01);
+	ili9882t_switch_page(dsi, 0x01);
 	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x42);
 	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x11);
 	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x00);
@@ -192,7 +212,7 @@ static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 	mipi_dsi_dcs_write_seq(dsi, 0x8B, 0x07);
 	mipi_dsi_dcs_write_seq(dsi, 0x8C, 0x07);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x02);
+	ili9882t_switch_page(dsi, 0x02);
 	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x3A);
 	mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x3B);
 
@@ -211,12 +231,12 @@ static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 	mipi_dsi_dcs_write_seq(dsi, 0x5E, 0x40);
 	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x03);
+	ili9882t_switch_page(dsi, 0x03);
 	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
 	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x3C);
 	mipi_dsi_dcs_write_seq(dsi, 0x22, 0xFA);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0A);
+	ili9882t_switch_page(dsi, 0x0a);
 	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x01);
 	mipi_dsi_dcs_write_seq(dsi, 0xE2, 0x01);
 	mipi_dsi_dcs_write_seq(dsi, 0xE5, 0x91);
@@ -224,10 +244,10 @@ static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 	mipi_dsi_dcs_write_seq(dsi, 0xE7, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, 0xE8, 0xFA);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x12);
+	ili9882t_switch_page(dsi, 0x12);
 	mipi_dsi_dcs_write_seq(dsi, 0x87, 0x2C);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x05);
+	ili9882t_switch_page(dsi, 0x05);
 	mipi_dsi_dcs_write_seq(dsi, 0x73, 0xE5);
 	mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x6B);
 	mipi_dsi_dcs_write_seq(dsi, 0x6D, 0xA4);
@@ -242,7 +262,7 @@ static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 	mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x90);
 	mipi_dsi_dcs_write_seq(dsi, 0x86, 0x87);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x06);
+	ili9882t_switch_page(dsi, 0x06);
 	mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x80);
 	mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x07);
 	mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x58);
@@ -256,7 +276,7 @@ static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 	mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x55);
 	mipi_dsi_dcs_write_seq(dsi, 0xDC, 0x38);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x08);
+	ili9882t_switch_page(dsi, 0x08);
 	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0x56, 0x6A, 0x6E, 0x79,
 			       0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, 0xCE, 0xC6, 0xBD,
 			       0xD5, 0xE2, 0xE8);
@@ -264,10 +284,10 @@ static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 			       0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, 0xCE, 0xC6, 0xBD,
 			       0xD5, 0xE2, 0xE8);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x04);
+	ili9882t_switch_page(dsi, 0x04);
 	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x81);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0C);
+	ili9882t_switch_page(dsi, 0x0c);
 	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x02);
 	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x03);
@@ -333,10 +353,10 @@ static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 	mipi_dsi_dcs_write_seq(dsi, 0x3E, 0x0A);
 	mipi_dsi_dcs_write_seq(dsi, 0x3F, 0x1F);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x04);
+	ili9882t_switch_page(dsi, 0x04);
 	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x01);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0E);
+	ili9882t_switch_page(dsi, 0x0e);
 	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x0C);
 	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x10);
 	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x16);
@@ -373,12 +393,12 @@ static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x21);
 	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x10);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x1E);
+	ili9882t_switch_page(dsi, 0x1e);
 	mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, 0x6D, 0x00);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0B);
+	ili9882t_switch_page(dsi, 0x0b);
 	mipi_dsi_dcs_write_seq(dsi, 0xA6, 0x44);
 	mipi_dsi_dcs_write_seq(dsi, 0xA7, 0xB6);
 	mipi_dsi_dcs_write_seq(dsi, 0xA8, 0x03);
@@ -389,13 +409,13 @@ static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
 	mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x92);
 	mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xA1);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x05);
+	ili9882t_switch_page(dsi, 0x05);
 	mipi_dsi_dcs_write_seq(dsi, 0x86, 0x87);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x06);
+	ili9882t_switch_page(dsi, 0x06);
 	mipi_dsi_dcs_write_seq(dsi, 0x92, 0x22);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x00);
+	ili9882t_switch_page(dsi, 0x00);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret)

-- 
2.34.1

