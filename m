Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F6F1A522F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792616E31D;
	Sat, 11 Apr 2020 12:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270466E22D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 02:50:29 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2D05D414D6D0EC0728D2;
 Sat, 11 Apr 2020 10:50:25 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sat, 11 Apr 2020 10:50:17 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon: Add the shutdown for hibmc_pci_driver
Date: Sat, 11 Apr 2020 10:49:30 +0800
Message-ID: <1586573370-41945-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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

add the shutdown function to release the resource.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index a6fd0c2..126d4f4 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -232,6 +232,21 @@ static int hibmc_hw_map(struct hibmc_drm_private *priv)
 	return 0;
 }
 
+static void hibmc_hw_unmap(struct hibmc_drm_private *priv)
+{
+	struct drm_device *dev = priv->dev;
+
+	if (priv->mmio)	{
+		devm_iounmap(dev->dev, priv->mmio);
+		priv->mmio = NULL;
+	}
+
+	if (priv->fb_map) {
+		devm_iounmap(dev->dev, priv->fb_map);
+		priv->fb_map = NULL;
+	}
+}
+
 static int hibmc_hw_init(struct hibmc_drm_private *priv)
 {
 	int ret;
@@ -258,6 +273,7 @@ static int hibmc_unload(struct drm_device *dev)
 
 	hibmc_kms_fini(priv);
 	hibmc_mm_fini(priv);
+	hibmc_hw_unmap(priv);
 	dev->dev_private = NULL;
 	return 0;
 }
@@ -374,6 +390,12 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
 	drm_dev_unregister(dev);
 	hibmc_unload(dev);
 	drm_dev_put(dev);
+	pci_disable_device(pdev);
+}
+
+static void hibmc_pci_shutdown(struct pci_dev *pdev)
+{
+	hibmc_pci_remove(pdev);
 }
 
 static struct pci_device_id hibmc_pci_table[] = {
@@ -386,6 +408,7 @@ static struct pci_driver hibmc_pci_driver = {
 	.id_table =	hibmc_pci_table,
 	.probe =	hibmc_pci_probe,
 	.remove =	hibmc_pci_remove,
+	.shutdown = hibmc_pci_shutdown,
 	.driver.pm =    &hibmc_pm_ops,
 };
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
