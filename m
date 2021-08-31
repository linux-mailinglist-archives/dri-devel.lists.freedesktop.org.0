Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2B3FC38B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 09:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4563589BBE;
	Tue, 31 Aug 2021 07:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 313B389BBE
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:53:39 +0000 (UTC)
Received: from BJHW-Mail-Ex10.internal.baidu.com (unknown [10.127.64.33])
 by Forcepoint Email with ESMTPS id 0424B752BAE7FFEEADB0;
 Tue, 31 Aug 2021 15:53:37 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex10.internal.baidu.com (10.127.64.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 15:53:36 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 15:53:36 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <robh@kernel.org>, <tomeu.vizoso@collabora.com>, <steven.price@arm.com>,
 <alyssa.rosenzweig@collabora.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] drm/panfrost: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Tue, 31 Aug 2021 15:53:27 +0800
Message-ID: <20210831075327.653-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex12.internal.baidu.com (172.31.51.52) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex10_2021-08-31 15:53:36:956
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
 drivers/gpu/drm/panfrost/panfrost_device.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index bd9b7be63b0f..1c692428b0d4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -198,7 +198,6 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
 int panfrost_device_init(struct panfrost_device *pfdev)
 {
 	int err;
-	struct resource *res;
 
 	mutex_init(&pfdev->sched_lock);
 	INIT_LIST_HEAD(&pfdev->scheduled_jobs);
@@ -236,8 +235,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	if (err)
 		goto out_reset;
 
-	res = platform_get_resource(pfdev->pdev, IORESOURCE_MEM, 0);
-	pfdev->iomem = devm_ioremap_resource(pfdev->dev, res);
+	pfdev->iomem = devm_platform_ioremap_resource(pfdev->pdev, 0);
 	if (IS_ERR(pfdev->iomem)) {
 		err = PTR_ERR(pfdev->iomem);
 		goto out_pm_domain;
-- 
2.25.1

