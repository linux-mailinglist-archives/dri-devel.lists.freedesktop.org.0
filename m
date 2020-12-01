Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D572CB6A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199E16EA10;
	Wed,  2 Dec 2020 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387FC6E526
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:55:51 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ClgX43lcNz15VbT;
 Tue,  1 Dec 2020 19:55:16 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 19:55:37 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>
Subject: [PATCH drm/hisilicon v2 2/4] drm/hisilicon: Code refactoring for
 hibmc_drm_drv
Date: Tue, 1 Dec 2020 19:55:52 +0800
Message-ID: <1606823754-52451-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
References: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the devm_drm_dev_alloc provided by the drm framework to alloc
a struct hibmc_drm_private.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 16 ++++++----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |  2 +-
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index dd9fadc..c5b0b57 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -262,13 +262,6 @@ static int hibmc_load(struct drm_device *dev)
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	int ret;
 
-	priv = drmm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		drm_err(dev, "no memory to allocate for hibmc_drm_private\n");
-		return -ENOMEM;
-	}
-	dev->dev_private = priv;
-
 	ret = hibmc_hw_init(priv);
 	if (ret)
 		goto err;
@@ -311,6 +304,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
 	struct drm_device *dev;
+	struct hibmc_drm_private *priv;
 	int ret;
 
 	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev,
@@ -318,12 +312,14 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&hibmc_driver, &pdev->dev);
-	if (IS_ERR(dev)) {
+	priv = devm_drm_dev_alloc(&pdev->dev, &hibmc_driver,
+				  struct hibmc_drm_private, dev);
+	if (IS_ERR(priv)) {
 		DRM_ERROR("failed to allocate drm_device\n");
-		return PTR_ERR(dev);
+		return PTR_ERR(priv);
 	}
 
+	dev = &priv->dev;
 	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index e35353a..7e0c756 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -52,7 +52,7 @@ static inline struct hibmc_connector *to_hibmc_connector(struct drm_connector *c
 
 static inline struct hibmc_drm_private *to_hibmc_drm_private(struct drm_device *dev)
 {
-	return dev->dev_private;
+	return container_of(dev, struct hibmc_drm_private, dev);
 }
 
 void hibmc_set_power_mode(struct hibmc_drm_private *priv,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
