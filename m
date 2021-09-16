Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D442440D7B2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 12:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C6B6EB61;
	Thu, 16 Sep 2021 10:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3492489DB8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 10:46:27 +0000 (UTC)
Received: from BJHW-Mail-Ex03.internal.baidu.com (unknown [10.127.64.13])
 by Forcepoint Email with ESMTPS id DF88F788B45F7BD24C3C;
 Thu, 16 Sep 2021 18:46:25 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex03.internal.baidu.com (10.127.64.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 18:46:25 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 18:46:25 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panel: nt39016: Make use of the helper function
 dev_err_probe()
Date: Thu, 16 Sep 2021 18:46:19 +0800
Message-ID: <20210916104620.11569-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex31.internal.baidu.com (172.31.51.25) To
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
And using dev_err_probe() can reduce code size, the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index f8151fe3ac9a..d036853db865 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -258,16 +258,13 @@ static int nt39016_probe(struct spi_device *spi)
 		return -EINVAL;
 
 	panel->supply = devm_regulator_get(dev, "power");
-	if (IS_ERR(panel->supply)) {
-		dev_err(dev, "Failed to get power supply\n");
-		return PTR_ERR(panel->supply);
-	}
+	if (IS_ERR(panel->supply))
+		return dev_err_probe(dev, PTR_ERR(panel->supply),
+				     "Failed to get power supply\n");
 
 	panel->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(panel->reset_gpio)) {
-		dev_err(dev, "Failed to get reset GPIO\n");
-		return PTR_ERR(panel->reset_gpio);
-	}
+	if (IS_ERR(panel->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(panel->reset_gpio), "Failed to get reset GPIO\n");
 
 	spi->bits_per_word = 8;
 	spi->mode = SPI_MODE_3 | SPI_3WIRE;
@@ -287,11 +284,8 @@ static int nt39016_probe(struct spi_device *spi)
 		       DRM_MODE_CONNECTOR_DPI);
 
 	err = drm_panel_of_backlight(&panel->drm_panel);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get backlight handle\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to get backlight handle\n");
 
 	drm_panel_add(&panel->drm_panel);
 
-- 
2.25.1

