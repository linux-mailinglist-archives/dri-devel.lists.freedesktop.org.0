Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5192D3D5F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47686E2BC;
	Wed,  9 Dec 2020 08:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6426E161
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:36:04 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cr05C2mlXz15YQC;
 Tue,  8 Dec 2020 20:35:27 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Dec 2020 20:35:55 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <jsarha@ti.com>, <tomi.valkeinen@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/tidss: Use the new api devm_drm_irq_install
Date: Tue, 8 Dec 2020 20:36:09 +0800
Message-ID: <1607430969-1663-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_drm_irq_install to register interrupts so that
drm_irq_uninstall is not needed to be called.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 66e3c86e..e68f2de 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -173,7 +173,7 @@ static int tidss_probe(struct platform_device *pdev)
 		goto err_runtime_suspend;
 	}
 
-	ret = drm_irq_install(ddev, irq);
+	ret = devm_drm_irq_install(ddev, irq);
 	if (ret) {
 		dev_err(dev, "drm_irq_install failed: %d\n", ret);
 		goto err_runtime_suspend;
@@ -219,8 +219,6 @@ static int tidss_remove(struct platform_device *pdev)
 
 	drm_atomic_helper_shutdown(ddev);
 
-	drm_irq_uninstall(ddev);
-
 #ifndef CONFIG_PM
 	/* If we don't have PM, we need to call suspend manually */
 	dispc_runtime_suspend(tidss->dispc);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
