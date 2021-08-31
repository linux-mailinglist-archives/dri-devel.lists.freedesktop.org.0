Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E1F3FC384
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 09:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E962C899A3;
	Tue, 31 Aug 2021 07:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0049B899A3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:43:28 +0000 (UTC)
Received: from BC-Mail-Ex32.internal.baidu.com (unknown [172.31.51.26])
 by Forcepoint Email with ESMTPS id 1B3C1FCD9D0533221AE1;
 Tue, 31 Aug 2021 15:43:28 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex32.internal.baidu.com (172.31.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 31 Aug 2021 15:43:27 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 15:43:27 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <liviu.dudau@arm.com>, <brian.starkey@arm.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] drm/arm/hdlcd: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Tue, 31 Aug 2021 15:43:19 +0800
Message-ID: <20210831074319.518-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex27.internal.baidu.com (172.31.51.21) To
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
 drivers/gpu/drm/arm/hdlcd_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 479c2422a2e0..72e63c8fad4e 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -129,7 +129,6 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 {
 	struct hdlcd_drm_private *hdlcd = drm->dev_private;
 	struct platform_device *pdev = to_platform_device(drm->dev);
-	struct resource *res;
 	u32 version;
 	int ret;
 
@@ -144,8 +143,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 	atomic_set(&hdlcd->dma_end_count, 0);
 #endif
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdlcd->mmio = devm_ioremap_resource(drm->dev, res);
+	hdlcd->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdlcd->mmio)) {
 		DRM_ERROR("failed to map control registers area\n");
 		ret = PTR_ERR(hdlcd->mmio);
-- 
2.25.1

