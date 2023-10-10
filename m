Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468897BFAEA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D7610E1E5;
	Tue, 10 Oct 2023 12:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3201410E1EB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:14:28 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c894e4573bso21013995ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 05:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696940067; x=1697544867; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2+ejWqFa5TzTu6IekwfT94Ub7oN0IRd+5WBVvHA6u0=;
 b=Yf3R+FX9mg/DRzAcPZuLwoboj5E9ov7/r7+YIYGJgxIKKWZxbFFRsf7KaYX2C4pJvt
 7mTnJgBhthjeC08wn+V5B3FtA3OMgXqP1yr9TueXfrZtRWZMdiLdIlzzI2i599L2vvXZ
 U+Fbhntc1H6ysYm3010xZOTsqEy8LTSiDV06bmEmseNnBNFQZ9yYEEInl7nk89MQRJW0
 OpkPqyHG0zeeq+BYxp7rgapbO9rlh96b6X14ELuHTeG07O9rTvjzs4Vq5V/lqRwTXwNc
 /vGI8Ij1DWuHblQ4lWkZgAYhaPOaeeRZp9tVkCL+0MGtc6LKI/D+4G/p3ud7uH41GAdY
 kdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696940067; x=1697544867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d2+ejWqFa5TzTu6IekwfT94Ub7oN0IRd+5WBVvHA6u0=;
 b=BQTWxZFRlNt2b52HbUPYAVKf/OiWkeO9j/OMUT4GYw0JJQ4p6eRcwP1zPtSQfk/ZBw
 33p8nzhhCCWiIIe/I73Z832QzUzIp7Wp0KLuHcNAvV04xoGHDdYVDHB8M9ERKdr2fCEG
 +4GzFafhS/UY8rdK184R4SC/GzpWW967a3S4VSBK4wk5D3Moy36IV14ThBSQuNz3kWke
 REvZvbBnn2/mO1iuPv6kAY3dM2Im9aF5CJPQWkKiWKj1eA/TANPq6NteRstrbPkLExt5
 t/o29u83+R1rh93vi6AqQfo9mQTWHUdZ1LtflI9DLLQY0D3cIKhChicN5pgDXBTtZIUz
 gI5A==
X-Gm-Message-State: AOJu0YzKa53AkCqhfNFuonsxgmiOnyFZrA1YW3OPvNeHWL5rVXCCTwb3
 4uM6lH1ZulejEo6SmOFREU4j1g==
X-Google-Smtp-Source: AGHT+IFKuCO5U2+3KJTfQva9ozzJPK3y0qK73AHNFiopw0mQwpfJTDTvldgCZ7Qfnum4M2jABYBPmg==
X-Received: by 2002:a17:902:b607:b0:1bb:30c5:835a with SMTP id
 b7-20020a170902b60700b001bb30c5835amr14684546pls.7.1696940067533; 
 Tue, 10 Oct 2023 05:14:27 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170902ecc400b001c74df14e6esm11570486plh.51.2023.10.10.05.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 05:14:26 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
Subject: [v2 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
Date: Tue, 10 Oct 2023 20:14:01 +0800
Message-Id: <20231010121402.3687948-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
References: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
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
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index e095ad91c4bc..20ae370ebe2f 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -465,6 +465,24 @@ static int ili9882t_init_dcs_cmd(struct ili9882t *ili)
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
@@ -486,8 +504,10 @@ static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
 static int ili9882t_disable(struct drm_panel *panel)
 {
 	struct ili9882t *ili = to_ili9882t(panel);
+	struct mipi_dsi_device *dsi = ili->dsi;
 	int ret;
 
+	ili9882t_switch_page(dsi, 0x00);
 	ret = ili9882t_enter_sleep_mode(ili);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
@@ -548,7 +568,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
 	gpiod_set_value(ili->enable_gpio, 1);
 	usleep_range(1000, 2000);
 	gpiod_set_value(ili->enable_gpio, 0);
-	usleep_range(1000, 2000);
+	usleep_range(40000, 50000);
 	gpiod_set_value(ili->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
-- 
2.25.1

