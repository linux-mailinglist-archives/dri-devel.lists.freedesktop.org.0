Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DDE40F11A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 06:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153466EB7A;
	Fri, 17 Sep 2021 04:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id 023B96EB7A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 04:24:27 +0000 (UTC)
Received: from BC-Mail-Ex26.internal.baidu.com (unknown [172.31.51.20])
 by Forcepoint Email with ESMTPS id 0E81EF5CE8855A0DC3F0;
 Fri, 17 Sep 2021 12:24:27 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex26.internal.baidu.com (172.31.51.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 17 Sep 2021 12:24:26 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 12:24:26 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: <linux-fbdev@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] fbdev: omapfb: panel-tpo-td043mtea1: Make use of the
 helper function dev_err_probe()
Date: Fri, 17 Sep 2021 12:24:13 +0800
Message-ID: <20210917042414.17787-4-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917042414.17787-1-caihuoqing@baidu.com>
References: <20210917042414.17787-1-caihuoqing@baidu.com>
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
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 .../video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
index afac1d9445aa..3db0232c31ab 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
@@ -517,8 +517,7 @@ static int tpo_td043_probe(struct spi_device *spi)
 
 	ddata->vcc_reg = devm_regulator_get(&spi->dev, "vcc");
 	if (IS_ERR(ddata->vcc_reg)) {
-		dev_err(&spi->dev, "failed to get LCD VCC regulator\n");
-		r = PTR_ERR(ddata->vcc_reg);
+		r = dev_err_probe(&spi->dev, r, "failed to get LCD VCC regulator\n");
 		goto err_regulator;
 	}
 
-- 
2.25.1

