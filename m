Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B637468BB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 07:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EC410E021;
	Tue,  4 Jul 2023 05:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A979A10E021
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 05:07:53 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6689430d803so2659828b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 22:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1688447273; x=1691039273; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yEK3MGVob10iHTS5iKmj9mov/a9Z0JHKPt0QQ9mDo9g=;
 b=Vybgv0OQeX/6z7nZ2kdt8af/KgUBNJE+NAoTuQ6oTimRuKBHhBlIA4pMTVyOskQEUc
 RJSyf33iJhcVqr/xNVVCTsaUNnQ/OuxvHBKANMsxN3ghZLgF3dar8cE7MfAOh7gkSFDC
 HecYFG8tkJGF1VzRXAPQA7p24XjA6j6q2J7TReMOvXKu+LZ6kqbxqJaubVzQaXH7hLXX
 gzIaDJiTck4ZysH0NooOrld1rJDDpwA2SOWAfEElZ+rGlK0p/DvM4MnKKD48BGgXpEmC
 JbcHkzGnDFiL1w8ExoXmw4YZjsS/OXp0bqHFMi/lKqREIYqQo0xjHremhE1jgZksiRmg
 o8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688447273; x=1691039273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yEK3MGVob10iHTS5iKmj9mov/a9Z0JHKPt0QQ9mDo9g=;
 b=UhUfPzMNSFG9Vnkb8cMQRcnvojto3FKxMR0MbTf8huAwwshKAj3tajTcr6mB/UsaeY
 d5VAITCbt+tuVgmW/eBSTRFO5qI2NelIPrFJfAp1irWvu8kPdyHuBfa7yEO2iTTc1TGm
 xNn4ImKqjoVDyxK08mFf7QNb4r0Z6sSuKrN4i3XEobGwGoNdTtRBf4sZvgJ1AFuj8kNo
 6DlXuYf4f6eH8wM9/q5M3L3bYXAHPluMzOJeRPkznJNd9Y++E4+3IB4DRUouv2VKv7io
 R2UhFNIYXsffx6bS9T3y487mWmdhNCvjtNAfJyHUanAyi2O0z5YqSN9UL3Iaymr0vzND
 mFvg==
X-Gm-Message-State: ABy/qLYbR4GZ+81su7vDJTqcMmNfZRQkZ6gpZIObxk7Zsc6yKToKv3jn
 fkxSsWJPAh4TzBp3u8ZKdlnkJw==
X-Google-Smtp-Source: APBJJlFgr2ePE2VS5nmoQIhosRnrM+okwhC8T3OIv/v4UT43clXElusIoAUyB+8H9jJ2UsHZO/qzkQ==
X-Received: by 2002:a05:6a00:13a1:b0:677:bdc:cd6b with SMTP id
 t33-20020a056a0013a100b006770bdccd6bmr13638452pfg.19.1688447272644; 
 Mon, 03 Jul 2023 22:07:52 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 y10-20020aa7804a000000b00669c99d05fasm14834333pfm.150.2023.07.03.22.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 22:07:52 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 airlied@gmail.com, dianders@google.com, hsinyi@google.com
Subject: [PATCH] drm/panel: Add avdd/avee delay for Starry-himax83102-j02 and
 Starry-ili9882t panel
Date: Tue,  4 Jul 2023 13:07:44 +0800
Message-Id: <20230704050744.1196293-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From power on/off sequence for panel data sheet[1], T2 timing VSP to VSN
needs 1ms delay when power on, and VSN to VSP also needs 1ms delay when
power off. Some pmic may not be able to adjust the delay internally, so
let's add a delay between avdd/avee regulator gpio to meet the timing of
panel.

[1]: https://github.com/HimaxSoftware/Doc/tree/main/Himax_Chipset_Power_Sequence

Fixes: 59bba51ec2a5 ("drm/panel: Fine tune Starry-ili9882t panel HFP and HBP")
Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index dc276c346fd1..b44a6871d97c 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -37,6 +37,7 @@ struct panel_desc {
 	unsigned int lanes;
 	bool discharge_on_disable;
 	bool lp11_before_reset;
+	int avdd_avee_delay;
 };
 
 struct boe_panel {
@@ -1798,6 +1799,7 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 
 	if (boe->desc->discharge_on_disable) {
 		regulator_disable(boe->avee);
+		usleep_range(boe->desc->avdd_avee_delay, boe->desc->avdd_avee_delay * 2);
 		regulator_disable(boe->avdd);
 		usleep_range(5000, 7000);
 		gpiod_set_value(boe->enable_gpio, 0);
@@ -1808,6 +1810,7 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		gpiod_set_value(boe->enable_gpio, 0);
 		usleep_range(1000, 2000);
 		regulator_disable(boe->avee);
+		usleep_range(boe->desc->avdd_avee_delay, boe->desc->avdd_avee_delay * 2);
 		regulator_disable(boe->avdd);
 		usleep_range(5000, 7000);
 		regulator_disable(boe->pp1800);
@@ -1843,6 +1846,7 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	ret = regulator_enable(boe->avdd);
 	if (ret < 0)
 		goto poweroff1v8;
+	usleep_range(boe->desc->avdd_avee_delay, boe->desc->avdd_avee_delay * 2);
 	ret = regulator_enable(boe->avee);
 	if (ret < 0)
 		goto poweroffavdd;
@@ -2134,6 +2138,7 @@ static const struct panel_desc starry_himax83102_j02_desc = {
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = starry_himax83102_j02_init_cmd,
 	.lp11_before_reset = true,
+	.avdd_avee_delay = 1500,
 };
 
 static const struct drm_display_mode starry_ili9882t_default_mode = {
@@ -2162,6 +2167,7 @@ static const struct panel_desc starry_ili9882t_desc = {
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = starry_ili9882t_init_cmd,
 	.lp11_before_reset = true,
+	.avdd_avee_delay = 1500,
 };
 
 static int boe_panel_get_modes(struct drm_panel *panel,
-- 
2.25.1

