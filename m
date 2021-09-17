Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B908540F104
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 06:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFF86EB55;
	Fri, 17 Sep 2021 04:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85D2C6EB4C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 04:22:29 +0000 (UTC)
Received: from BC-Mail-EX04.internal.baidu.com (unknown [172.31.51.44])
 by Forcepoint Email with ESMTPS id 68C8343F6DF5E86072FD;
 Fri, 17 Sep 2021 12:22:28 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-EX04.internal.baidu.com (172.31.51.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 17 Sep 2021 12:22:28 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 12:22:27 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Jingoo Han <jingoohan1@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] fbdev: ssd1307fb: Make use of the helper function
 dev_err_probe()
Date: Fri, 17 Sep 2021 12:22:10 +0800
Message-ID: <20210917042213.17689-4-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917042213.17689-1-caihuoqing@baidu.com>
References: <20210917042213.17689-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex05.internal.baidu.com (10.127.64.15) To
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
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/video/fbdev/ssd1307fb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 1e2f71c2f8a8..c6d5df31111d 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -658,9 +658,8 @@ static int ssd1307fb_probe(struct i2c_client *client)
 
 	par->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(par->reset)) {
-		dev_err(dev, "failed to get reset gpio: %ld\n",
-			PTR_ERR(par->reset));
-		ret = PTR_ERR(par->reset);
+		ret = dev_err_probe(dev, PTR_ERR(par->reset),
+				    "failed to get reset gpio\n");
 		goto fb_alloc_error;
 	}
 
@@ -670,7 +669,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
 		if (ret == -ENODEV) {
 			par->vbat_reg = NULL;
 		} else {
-			dev_err(dev, "failed to get VBAT regulator: %d\n", ret);
+			dev_err_probe(dev, ret, "failed to get VBAT regulator\n");
 			goto fb_alloc_error;
 		}
 	}
-- 
2.25.1

