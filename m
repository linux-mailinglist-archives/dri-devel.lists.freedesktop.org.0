Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97B17BC4F1
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 08:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54D510E590;
	Sat,  7 Oct 2023 06:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0C310E58F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 06:07:04 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-692ada71d79so2409806b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 23:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696658824; x=1697263624; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9YjH2BRrQM/30MuBfPFFxKpjNbWObuhK7FE/JpRSOxA=;
 b=JSkCLjzTp3wcsm6mIfc9OUpXFYArdyt7uBcb0gAXkO4Hgpm3+XL/F9saaiuA+LTGdu
 1jkHox5Ovmqw9YGiIluDgDgGIOfm7pf5VkeXCNKg7vosxGT+k1PrwAWfnHOQzwciX1NY
 gNDxuswdHdA3QA/xVQbSPba7SOqt1EUvfMAdsi8BFclxY8BX75F6OAEcrX5Pd/pn/JM1
 qbqO8zwZQjM23ZXMwM4aGOjAVZAN+gHZR39p6XULBwbxqlCbfpZWBvKc2iHvAMZYMHkt
 qdSRDjSsvY6S8WKqxolI4ZT0rKkWoocv5BzOhw2QweCiTsLW5rXTaxhW3C8qJ5JMe+j6
 MvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696658824; x=1697263624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9YjH2BRrQM/30MuBfPFFxKpjNbWObuhK7FE/JpRSOxA=;
 b=gn+tNYf0CpCXpLlCoyElwJb58cX7+PBE5W89sZ3l99ss1E4ydzjNf5jCHTdLeg/LHn
 VI6Zb/OTJCDi9qsNOFtytrR6HNniaNx6cfR99xwhZ94vPr69i/Vusc2b73sZYqWFoWIq
 LDudQORCK17K1VU7TA2AW1N+PyyDtHa3vDVev0NFzDsQq0dFTBW2gnBhwNuipLCLknWI
 NtccIWA1eaO4C3Ys534thH1NzFYDzVx289vRtOd3Xb9Xx5eDYxNthAtOojgTxj+gzo7e
 o7tIgUlS53hGW4YptfhhFHFge7lcty8v6foWodwYYSbzJZhSNwqLHO98G97WhYgC6fvv
 es+g==
X-Gm-Message-State: AOJu0YypbovvBPW8OP0l0gP40Nk/27ZoSmkUNbWRcoSXbz7QHYj6pMeg
 wlCavsySY5skbdUubNyKvZM/pA==
X-Google-Smtp-Source: AGHT+IEf2zrnFglGNNqdhVoDvFYpNaq8EMo2bPugvIeVQHR4zSJAaqTbreUUpDTGpy4+XgmlplP8fQ==
X-Received: by 2002:a05:6a20:1613:b0:15d:9ee7:180a with SMTP id
 l19-20020a056a20161300b0015d9ee7180amr11678932pzj.4.1696658824197; 
 Fri, 06 Oct 2023 23:07:04 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 jj15-20020a170903048f00b001b8c6890623sm5014431plb.7.2023.10.06.23.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 23:07:03 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com
Subject: [v1 2/2] drm/panel: ili9882t: Avoid blurred screen from fast sleep
Date: Sat,  7 Oct 2023 14:06:39 +0800
Message-Id: <20231007060639.725350-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
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

At present, we have found that there may be a problem of blurred
screen during fast sleep/resume. The direct cause of the blurred
screen is that the IC does not receive 0x28/0x10. Because of the
particularity of the IC, before the panel enters sleep hid must
stop scanning, i2c_hid_core_suspend before ili9882t_disable.
This doesn't look very spec-compliant. So in order to solve this
problem, the IC can handle it through the exception mechanism when
it cannot receive 0X28/0X10 command. Handling exceptions requires a reset
50ms delay. Refer to vendor detailed analysis [1].

Ilitek vendor also suggested switching the page before entering sleep to
avoid panel IC not receiving 0x28/0x10 command.

Note: 0x28 is display off, 0x10 is sleep in.

[1]: https://github.com/ILITEK-LoganLin/Document/tree/main/ILITEK_Power_Sequence

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index bbfcffe65623..0a1dd987b204 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -423,6 +423,23 @@ static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
 	return container_of(panel, struct ili9882t, base);
 }
 
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
 static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
 {
 	struct mipi_dsi_device *dsi = ili->dsi;
@@ -444,8 +461,10 @@ static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
 static int ili9882t_disable(struct drm_panel *panel)
 {
 	struct ili9882t *ili = to_ili9882t(panel);
+	struct mipi_dsi_device *dsi = ili->dsi;
 	int ret;
 
+	ili9882t_switch_page(dsi, 0x00);
 	ret = ili9882t_enter_sleep_mode(ili);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
@@ -507,7 +526,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
 	gpiod_set_value(ili->enable_gpio, 1);
 	usleep_range(1000, 2000);
 	gpiod_set_value(ili->enable_gpio, 0);
-	usleep_range(1000, 2000);
+	usleep_range(40000, 50000);
 	gpiod_set_value(ili->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
-- 
2.25.1

