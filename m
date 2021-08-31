Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44193FC8F0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFEF89FA9;
	Tue, 31 Aug 2021 13:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0763189FA9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:56:10 +0000 (UTC)
Received: from BC-Mail-HQEX01.internal.baidu.com (unknown [172.31.51.57])
 by Forcepoint Email with ESMTPS id 275F3445DCED39F3F2B8;
 Tue, 31 Aug 2021 21:56:09 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-HQEX01.internal.baidu.com (172.31.51.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 31 Aug 2021 21:56:08 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 21:56:08 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/mcde: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Tue, 31 Aug 2021 21:56:02 +0800
Message-ID: <20210831135602.4476-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
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

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 4 +---
 drivers/gpu/drm/mcde/mcde_dsi.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index e60566a5739c..5b5afc6aaf8e 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -276,7 +276,6 @@ static int mcde_probe(struct platform_device *pdev)
 	struct drm_device *drm;
 	struct mcde *mcde;
 	struct component_match *match = NULL;
-	struct resource *res;
 	u32 pid;
 	int irq;
 	int ret;
@@ -344,8 +343,7 @@ static int mcde_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mcde->regs = devm_ioremap_resource(dev, res);
+	mcde->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mcde->regs)) {
 		dev_err(dev, "no MCDE regs\n");
 		ret = -EINVAL;
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 180ebbccbeda..5651734ce977 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1169,7 +1169,6 @@ static int mcde_dsi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mcde_dsi *d;
 	struct mipi_dsi_host *host;
-	struct resource *res;
 	u32 dsi_id;
 	int ret;
 
@@ -1187,8 +1186,7 @@ static int mcde_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(d->prcmu);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	d->regs = devm_ioremap_resource(dev, res);
+	d->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(d->regs))
 		return PTR_ERR(d->regs);
 
-- 
2.25.1

