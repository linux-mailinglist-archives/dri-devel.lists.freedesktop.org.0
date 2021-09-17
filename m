Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010FC40F105
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 06:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9316EB5B;
	Fri, 17 Sep 2021 04:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83EE06EB55
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 04:22:31 +0000 (UTC)
Received: from BJHW-MAIL-EX04.internal.baidu.com (unknown [10.127.64.14])
 by Forcepoint Email with ESMTPS id 78C4A4A5BDB8D0256D64;
 Fri, 17 Sep 2021 12:22:30 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-MAIL-EX04.internal.baidu.com (10.127.64.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 12:22:30 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 12:22:29 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Jingoo Han <jingoohan1@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/6] fbdev: s3c-fb: Make use of the helper function
 dev_err_probe()
Date: Fri, 17 Sep 2021 12:22:11 +0800
Message-ID: <20210917042213.17689-5-caihuoqing@baidu.com>
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
 drivers/video/fbdev/s3c-fb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 3b134e1bbc38..459d159879a3 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -1392,18 +1392,17 @@ static int s3c_fb_probe(struct platform_device *pdev)
 	spin_lock_init(&sfb->slock);
 
 	sfb->bus_clk = devm_clk_get(dev, "lcd");
-	if (IS_ERR(sfb->bus_clk)) {
-		dev_err(dev, "failed to get bus clock\n");
-		return PTR_ERR(sfb->bus_clk);
-	}
+	if (IS_ERR(sfb->bus_clk))
+		return dev_err_probe(dev, PTR_ERR(sfb->bus_clk),
+				     "failed to get bus clock\n");
 
 	clk_prepare_enable(sfb->bus_clk);
 
 	if (!sfb->variant.has_clksel) {
 		sfb->lcd_clk = devm_clk_get(dev, "sclk_fimd");
 		if (IS_ERR(sfb->lcd_clk)) {
-			dev_err(dev, "failed to get lcd clock\n");
-			ret = PTR_ERR(sfb->lcd_clk);
+			ret = dev_err_probe(dev, PTR_ERR(sfb->lcd_clk),
+					    "failed to get lcd clock\n");
 			goto err_bus_clk;
 		}
 
-- 
2.25.1

