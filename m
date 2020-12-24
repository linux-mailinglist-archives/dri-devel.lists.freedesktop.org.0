Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F252E2AEE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6679589BA5;
	Fri, 25 Dec 2020 09:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7392889D4A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 08:46:01 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D1kD865WDzhxCC;
 Thu, 24 Dec 2020 16:45:12 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 24 Dec 2020 16:45:53 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/hisilicon: Add load and unload callback functions
Date: Thu, 24 Dec 2020 16:45:58 +0800
Message-ID: <1608799558-29564-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the callback functions of drm_driver structure member functions
load and unload, no need to call load in the hibmc_pci_probe function
and unload in the hibmc_pci_remove function.

v2:
remove the hibmc_unload called from hibmc_pic_remove.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 0d4e902..10042cf 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -27,6 +27,9 @@
 
 DEFINE_DRM_GEM_FOPS(hibmc_fops);
 
+static int hibmc_load(struct drm_device *dev, unsigned long flags);
+static void hibmc_unload(struct drm_device *dev);
+
 static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
@@ -63,6 +66,8 @@ static const struct drm_driver hibmc_driver = {
 	.dumb_map_offset        = drm_gem_vram_driver_dumb_mmap_offset,
 	.gem_prime_mmap		= drm_gem_prime_mmap,
 	.irq_handler		= hibmc_drm_interrupt,
+	.load			= hibmc_load,
+	.unload			= hibmc_unload,
 };
 
 static int __maybe_unused hibmc_pm_suspend(struct device *dev)
@@ -248,7 +253,7 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
 	return 0;
 }
 
-static int hibmc_unload(struct drm_device *dev)
+static void hibmc_unload(struct drm_device *dev)
 {
 	drm_atomic_helper_shutdown(dev);
 
@@ -256,11 +261,9 @@ static int hibmc_unload(struct drm_device *dev)
 		drm_irq_uninstall(dev);
 
 	pci_disable_msi(dev->pdev);
-
-	return 0;
 }
 
-static int hibmc_load(struct drm_device *dev)
+static int hibmc_load(struct drm_device *dev, unsigned long flags)
 {
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	int ret;
@@ -335,12 +338,6 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 		goto err_return;
 	}
 
-	ret = hibmc_load(dev);
-	if (ret) {
-		drm_err(dev, "failed to load hibmc: %d\n", ret);
-		goto err_return;
-	}
-
 	ret = drm_dev_register(dev, 0);
 	if (ret) {
 		drm_err(dev, "failed to register drv for userspace access: %d\n",
@@ -363,7 +360,6 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(dev);
-	hibmc_unload(dev);
 }
 
 static const struct pci_device_id hibmc_pci_table[] = {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
