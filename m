Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB930231290
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276C06E2CC;
	Tue, 28 Jul 2020 19:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC0389DB8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 12:57:10 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 84C4B6635318109F9F2B;
 Tue, 28 Jul 2020 20:57:04 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Jul 2020 20:56:59 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm/hisilicon: Fixed the warning: Assignment of 0/1 to
 bool variable
Date: Tue, 28 Jul 2020 20:55:07 +0800
Message-ID: <1595940907-17874-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fixed the following warning:
hibmc_drm_drv.c:296:1-18:WARNING: Assignment of 0/1 to bool variable.
hibmc_drm_drv.c:301:2-19: WARNING: Assignment of 0/1 to bool variable.

v2:
using the pci_dev.msi_enabled instead of priv->msi_enabled.

v3:
just call pci_enable_msi() and pci_disable_msi(), it's no need to
set dev->pdev->msi_enabled again.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 5 +----
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 249c298..b8d839a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -254,9 +254,8 @@ static int hibmc_unload(struct drm_device *dev)
 
 	if (dev->irq_enabled)
 		drm_irq_uninstall(dev);
-	if (priv->msi_enabled)
-		pci_disable_msi(dev->pdev);
 
+	pci_disable_msi(dev->pdev);
 	hibmc_kms_fini(priv);
 	hibmc_mm_fini(priv);
 	dev->dev_private = NULL;
@@ -294,12 +293,10 @@ static int hibmc_load(struct drm_device *dev)
 		goto err;
 	}
 
-	priv->msi_enabled = 0;
 	ret = pci_enable_msi(dev->pdev);
 	if (ret) {
 		DRM_WARN("enabling MSI failed: %d\n", ret);
 	} else {
-		priv->msi_enabled = 1;
 		ret = drm_irq_install(dev, dev->pdev->irq);
 		if (ret)
 			DRM_WARN("install irq failed: %d\n", ret);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 6097687..a683763 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -25,7 +25,6 @@ struct hibmc_drm_private {
 	void __iomem   *fb_map;
 	unsigned long  fb_base;
 	unsigned long  fb_size;
-	bool msi_enabled;
 
 	/* drm */
 	struct drm_device  *dev;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
