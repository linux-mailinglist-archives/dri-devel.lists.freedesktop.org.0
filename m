Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 935173FC38C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 09:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD0E89BDB;
	Tue, 31 Aug 2021 07:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC60B89BF8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:54:50 +0000 (UTC)
Received: from BJHW-Mail-Ex09.internal.baidu.com (unknown [10.127.64.32])
 by Forcepoint Email with ESMTPS id F0974B69247B2CAB27D6;
 Tue, 31 Aug 2021 15:54:49 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex09.internal.baidu.com (10.127.64.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 15:54:49 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 15:54:48 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <laurent.pinchart@ideasonboard.com>,
 <kieran.bingham+renesas@ideasonboard.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
 Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] drm: rcar-du: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Tue, 31 Aug 2021 15:54:42 +0800
Message-ID: <20210831075442.698-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex12.internal.baidu.com (172.31.51.52) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex09_2021-08-31 15:54:50:045
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
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 4 +---
 drivers/gpu/drm/rcar-du/rcar_lvds.c   | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 4ac26d08ebb4..ebec4b7269d1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -570,7 +570,6 @@ static void rcar_du_shutdown(struct platform_device *pdev)
 static int rcar_du_probe(struct platform_device *pdev)
 {
 	struct rcar_du_device *rcdu;
-	struct resource *mem;
 	int ret;
 
 	/* Allocate and initialize the R-Car device structure. */
@@ -585,8 +584,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rcdu);
 
 	/* I/O resources */
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	rcdu->mmio = devm_ioremap_resource(&pdev->dev, mem);
+	rcdu->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rcdu->mmio))
 		return PTR_ERR(rcdu->mmio);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index d061b8de748f..a64d910b0500 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -802,7 +802,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *attr;
 	struct rcar_lvds *lvds;
-	struct resource *mem;
 	int ret;
 
 	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
@@ -825,8 +824,7 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	lvds->bridge.funcs = &rcar_lvds_bridge_ops;
 	lvds->bridge.of_node = pdev->dev.of_node;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lvds->mmio = devm_ioremap_resource(&pdev->dev, mem);
+	lvds->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lvds->mmio))
 		return PTR_ERR(lvds->mmio);
 
-- 
2.25.1

