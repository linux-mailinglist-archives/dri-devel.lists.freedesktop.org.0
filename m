Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60744163EC9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9930A6EAB3;
	Wed, 19 Feb 2020 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838026E08A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 07:57:37 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EB2D92AC65ADECDF186C;
 Wed, 19 Feb 2020 15:57:33 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Wed, 19 Feb 2020 15:57:26 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon: Fixed pcie resource conflict between drm and
 firmware
Date: Wed, 19 Feb 2020 15:57:08 +0800
Message-ID: <1582099028-11898-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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

remove the framebuffer initialized by fireware/bootloader,which will use
hibmc's pcie resource, and may cause conflict.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 5f612f6..7ebe831 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -47,6 +47,22 @@ static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void hibmc_remove_framebuffers(struct pci_dev *pdev)
+{
+	struct apertures_struct *ap;
+
+	ap = alloc_apertures(1);
+	if (!ap)
+		return;
+
+	ap->ranges[0].base = pci_resource_start(pdev, 0);
+	ap->ranges[0].size = pci_resource_len(pdev, 0);
+
+	drm_fb_helper_remove_conflicting_framebuffers(ap, "hibmcdrmfb", false);
+
+	kfree(ap);
+}
+
 static struct drm_driver hibmc_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &hibmc_fops,
@@ -327,6 +343,8 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 	struct drm_device *dev;
 	int ret;
 
+	hibmc_remove_framebuffers(pdev);
+
 	dev = drm_dev_alloc(&hibmc_driver, &pdev->dev);
 	if (IS_ERR(dev)) {
 		DRM_ERROR("failed to allocate drm_device\n");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
