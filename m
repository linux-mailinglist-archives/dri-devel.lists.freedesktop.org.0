Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7F97C81CB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 11:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95AC10E5C9;
	Fri, 13 Oct 2023 09:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4E410E5C9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 09:19:00 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c87a85332bso16349485ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697188739; x=1697793539; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTMdnCgLNeLGmQ9hPPl3PbM796NA0JjUHITsgIAxfwc=;
 b=MrKX9UGTnj9k6dfworv0kGpgSZEOAw7VWdSJzKBJw7obgPXfyY4fKukIBPvWjEilFV
 Tajzz2c0TlOnTeeJkI9CIS4QCEa2Gs5OMyp7FzQznM2iCmBaCbC18sgVKsA3u2FlspIJ
 7SYl+WTRgA+zulOxtBu2rGpqcSGfQ/oCjdK37ksBjyOBHvyQtO2vDNsqvBA6SysEusa0
 bDMdWG2hxfkRnH84v2jS4GbN7V2gEkjYXt7BFnpH9MLwcG8JdxZ71wK783qSxVAJ0lQj
 m/RC6gG2hU9+eOcUw9zOHPqMBBZb4WZ7pBRpzQQy4cHyf6sryOpbME4IZucBwjSyGO79
 vNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697188739; x=1697793539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTMdnCgLNeLGmQ9hPPl3PbM796NA0JjUHITsgIAxfwc=;
 b=FAGoTUH9R43ECEqEQq2OUUYY5H1qntWOtBakZGtLZM2shKZZ41p0k6EW1JWJYiAZyp
 IcaitdR77vqJnj3EdkfVyEnavqxcURXNA+gG76+GNkDc0kYlqcC6B3oWd6gVpebrc0L+
 xWwPaebAu0X7OC4I2aO7y3x/pqFjqOQjG2yuMj1QbJAxhpkEbZM+vQvANt4BGOc7yk8u
 SlhiLQI+f9jhF2Aj01KfFjEsnY1jWLszPxY+ONKqyYRe4lgc17NBsauTqdqamC5FVYiw
 g5mTWwTt16GjwgER+XegNrkA9rN8WbT2c4PpQzJfykpJBzBP++nc1pExs6Bpvrx36A2w
 TbZg==
X-Gm-Message-State: AOJu0YwLhJWHTZ0Wt8tmviWsR4MUT1zAsBa8tkzhDNXTESvDybcmD1fo
 hp9DHthCriCkt4yQsPssJLINkg==
X-Google-Smtp-Source: AGHT+IGF4eeVhQxVCQg3gIgd4Pxx30swUPBPrGiFMtgkseo7sgyOd+UQjrBXHpKPfvqdBYpeZFcrMw==
X-Received: by 2002:a17:902:ec8f:b0:1c5:ee21:ce33 with SMTP id
 x15-20020a170902ec8f00b001c5ee21ce33mr35059343plg.23.1697188739587; 
 Fri, 13 Oct 2023 02:18:59 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 jw22-20020a170903279600b001b8a3e2c241sm3427168plb.14.2023.10.13.02.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 02:18:59 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
Subject: [v4 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
Date: Fri, 13 Oct 2023 17:18:43 +0800
Message-Id: <20231013091844.804310-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
References: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
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
stop scanning, as i2c_hid_core_suspend before ili9882t_disable.
If move the ili9882t_enter_sleep_mode function to ili9882t_unprepare,
touch reset will pull low before panel entersleep, which does not meet
the timing requirements.. So in order to solve this problem, the IC
can handle it through the exception mechanism when it cannot receive
0x28/0x10 command. Handling exceptions requires a reset 50ms delay.
Refer to vendor detailed analysis [1].

Ilitek vendor also suggested switching the page before entering sleep to
avoid panel IC not receiving 0x28/0x10 command.

Note: 0x28 is display off, 0x10 is sleep in.

[1]: https://github.com/ILITEK-LoganLin/Document/tree/main/ILITEK_Power_Sequence

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 93a40c2f1483..267a5307041c 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -463,6 +463,24 @@ static int ili9882t_init_dcs_cmd(struct ili9882t *ili)
 	return 0;
 }
 
+static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 page)
+{
+	int ret;
+	const struct panel_init_cmd cmd = _INIT_SWITCH_PAGE_CMD(page);
+
+	ret = mipi_dsi_dcs_write(dsi, cmd.data[0],
+				 cmd.len <= 1 ? NULL :
+				 &cmd.data[1],
+				 cmd.len - 1);
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
@@ -484,8 +502,10 @@ static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
 static int ili9882t_disable(struct drm_panel *panel)
 {
 	struct ili9882t *ili = to_ili9882t(panel);
+	struct mipi_dsi_device *dsi = ili->dsi;
 	int ret;
 
+	ili9882t_switch_page(dsi, 0x00);
 	ret = ili9882t_enter_sleep_mode(ili);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
@@ -546,7 +566,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
 	gpiod_set_value(ili->enable_gpio, 1);
 	usleep_range(1000, 2000);
 	gpiod_set_value(ili->enable_gpio, 0);
-	usleep_range(1000, 2000);
+	msleep(50);
 	gpiod_set_value(ili->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
-- 
2.25.1

