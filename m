Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141C6B8C5A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B01310E715;
	Tue, 14 Mar 2023 08:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5B510E715
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:02:37 +0000 (UTC)
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VdrL7AH_1678780952) by smtp.aliyun-inc.com;
 Tue, 14 Mar 2023 16:02:33 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com
Subject: [PATCH -next 2/2] drm/arm/hdlcd: Use devm_platform_ioremap_resource()
Date: Tue, 14 Mar 2023 16:02:30 +0800
Message-Id: <20230314080231.20212-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to commit 7945f929f1a7 ("drivers: provide
devm_platform_ioremap_resource()"), convert platform_get_resource(),
devm_ioremap_resource() to a single call to Use
devm_platform_ioremap_resource(), as this is exactly what this function
does.

Since 'struct platform_device *pdev = to_platform_device(drm->dev)',
'drm->dev' is equivalent to 'pdev->deva'.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e3507dd6f82a..a86b317c1312 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -100,7 +100,6 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 {
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	struct platform_device *pdev = to_platform_device(drm->dev);
-	struct resource *res;
 	u32 version;
 	int ret;
 
@@ -115,8 +114,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 	atomic_set(&hdlcd->dma_end_count, 0);
 #endif
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdlcd->mmio = devm_ioremap_resource(drm->dev, res);
+	hdlcd->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdlcd->mmio)) {
 		DRM_ERROR("failed to map control registers area\n");
 		ret = PTR_ERR(hdlcd->mmio);
-- 
2.20.1.7.g153144c

