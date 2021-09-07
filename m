Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC8E40235E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 08:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A7789C97;
	Tue,  7 Sep 2021 06:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id F415889C97
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 06:23:46 +0000 (UTC)
Received: from BJHW-Mail-Ex12.internal.baidu.com (unknown [10.127.64.35])
 by Forcepoint Email with ESMTPS id D034EC052D97E104049F;
 Tue,  7 Sep 2021 14:23:45 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex12.internal.baidu.com (10.127.64.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 7 Sep 2021 14:23:45 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 7 Sep 2021 14:23:45 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Lee Jones <lee.jones@linaro.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] backlight: l4f00242t03: Add a single error handling block at
 the end of the function.
Date: Tue, 7 Sep 2021 14:23:39 +0800
Message-ID: <20210907062339.1828-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex12_2021-09-07 14:23:45:833
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

A single error handling block at the end of the function could
be brought in to make code a little more concise.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/video/backlight/l4f00242t03.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
index 46f97d1c3d21..c6f540f1b507 100644
--- a/drivers/video/backlight/l4f00242t03.c
+++ b/drivers/video/backlight/l4f00242t03.c
@@ -65,14 +65,12 @@ static void l4f00242t03_lcd_init(struct spi_device *spi)
 	ret = regulator_set_voltage(priv->core_reg, 2800000, 2800000);
 	if (ret) {
 		dev_err(&spi->dev, "failed to set the core regulator voltage.\n");
-		regulator_disable(priv->io_reg);
-		return;
+		goto err_disable_reg;
 	}
 	ret = regulator_enable(priv->core_reg);
 	if (ret) {
 		dev_err(&spi->dev, "failed to enable the core regulator.\n");
-		regulator_disable(priv->io_reg);
-		return;
+		goto err_disable_reg;
 	}
 
 	l4f00242t03_reset(priv->reset);
@@ -80,6 +78,10 @@ static void l4f00242t03_lcd_init(struct spi_device *spi)
 	gpiod_set_value(priv->enable, 1);
 	msleep(60);
 	spi_write(spi, (const u8 *)cmd, ARRAY_SIZE(cmd) * sizeof(u16));
+	return;
+
+err_disable_reg:
+	regulator_disable(priv->io_reg);
 }
 
 static void l4f00242t03_lcd_powerdown(struct spi_device *spi)
-- 
2.25.1

