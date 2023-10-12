Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BC47C6DA3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 14:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206EB10E4D3;
	Thu, 12 Oct 2023 12:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EFB10E4C9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 12:10:23 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-692c70bc440so718086b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 05:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697112622; x=1697717422; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOkLibYY7q/p/bUNu8Ac2idWbM7oa6x1P0bz0Gbc5Kc=;
 b=jKoj5cczxq3qekenIg96TlrZb2ATENSlqDutthCdleoFBjBD3vDOUh+Qk7X37LIQd3
 khTBSFFJlT57UMU2S1AkbqtNtdgivHMcGV3l02eSG/AxAmZGP5LgRQFhm1DWj1tHo8Zt
 Azkj6BRyEZtN1ty1M5EPTie1bP0ocBwagwN06+ywniU7E8ELm2YvSdmnZTXmmbWoG8Ln
 8ZPrbvh/Jrzv4aByeWKE1QDskotXn5mOxtLLO/nIfPYY47dOtR9xZDDO6PrquD/ZK9n/
 ez/0ddOWWmZObiRVnLvf+KO8KOvsu1QYz9JyPibM9u5OcA79srBJsA7GNbEKp3QsAg8N
 Fm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697112622; x=1697717422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KOkLibYY7q/p/bUNu8Ac2idWbM7oa6x1P0bz0Gbc5Kc=;
 b=HmaTF++EoXCjiXFEQn+Ds1birhL67A9lBJ1+rM2XaKkmYB0m/60/veCWS0F6NMpEfc
 uRWvSv+ICid2TMe8oqViAE00CqKa/qK6k9b29zEWZZ/W9ikXJ5++BfAI5Q+Wm3tl/DC6
 ibCzYofZsLPlVVRYldQGxx8Vp6VipeEekzvFXKbCp8KynzG8zQ/xG4Srjnys1jNET3oE
 TY/PUySBbr7BW9VD7VQNWrk2yJxO/gQ0YUwGiasUO9jVpLM+lHYmKb6RyrZK7Ex/gxHm
 43gOQ3r5U6goLbJ+Dgl1hMIcQ//h+kpp4DXDPmKxZ/jfggAKxW4QZ+8lHUEOjLuN5foA
 UQXg==
X-Gm-Message-State: AOJu0YwT0L0vfPBql+MZ+pSuPlSAVwmA+pDzmRd5S6XdWz3PO7zCfgGw
 aSKH6bvDjh+gazF934H756assw==
X-Google-Smtp-Source: AGHT+IEGrC/Omu0GicJoFeQ9YE+SXksfGu4yXDQ79qoYaA7aic4RSaXVyuYCCM3/k3bo1/sX1x5fzw==
X-Received: by 2002:a05:6a20:12c6:b0:161:3120:e865 with SMTP id
 v6-20020a056a2012c600b001613120e865mr25851547pzg.52.1697112622610; 
 Thu, 12 Oct 2023 05:10:22 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 ds2-20020a17090b08c200b00256b67208b1sm1664455pjb.56.2023.10.12.05.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 05:10:22 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
Subject: [v3 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
Date: Thu, 12 Oct 2023 20:10:03 +0800
Message-Id: <20231012121004.2127918-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
References: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
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
index 93a40c2f1483..54ff1efb94aa 100644
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
+	usleep_range(50000, 51000);
 	gpiod_set_value(ili->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
-- 
2.25.1

