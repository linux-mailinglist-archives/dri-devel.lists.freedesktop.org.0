Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 155FF40D7A2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 12:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CCD6EB59;
	Thu, 16 Sep 2021 10:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A0256EB59
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 10:42:47 +0000 (UTC)
Received: from BC-Mail-Ex23.internal.baidu.com (unknown [172.31.51.17])
 by Forcepoint Email with ESMTPS id 1BC695FF92B07D9D571D;
 Thu, 16 Sep 2021 18:42:46 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex23.internal.baidu.com (172.31.51.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 18:42:45 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 18:42:45 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panel: ili9881c: Make use of the helper function
 dev_err_probe()
Date: Thu, 16 Sep 2021 18:42:39 +0800
Message-ID: <20210916104240.11217-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex15.internal.baidu.com (172.31.51.55) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
And using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 0145129d7c66..f7520231abc3 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -653,16 +653,14 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 		       DRM_MODE_CONNECTOR_DSI);
 
 	ctx->power = devm_regulator_get(&dsi->dev, "power");
-	if (IS_ERR(ctx->power)) {
-		dev_err(&dsi->dev, "Couldn't get our power regulator\n");
-		return PTR_ERR(ctx->power);
-	}
+	if (IS_ERR(ctx->power))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->power),
+				     "Couldn't get our power regulator\n");
 
 	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->reset)) {
-		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
-		return PTR_ERR(ctx->reset);
-	}
+	if (IS_ERR(ctx->reset))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
+				     "Couldn't get our reset GPIO\n");
 
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
-- 
2.25.1

