Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD31EF9C5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E900C6E8FA;
	Fri,  5 Jun 2020 13:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09AB6E8F6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F1564AD09;
 Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 12/14] drm/mgag200: Allocate device structures in
 mgag200_driver_load()
Date: Fri,  5 Jun 2020 15:58:01 +0200
Message-Id: <20200605135803.19811-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605135803.19811-1-tzimmermann@suse.de>
References: <20200605135803.19811-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instances of struct drm_device and struct mga_device are now allocated
next to each other in mgag200_driver_load(). Yet another preparation
before embedding the DRM device instance in struct mga_device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 38 +++++++++++++++------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 926437a27a228..592e484f87ee7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -88,26 +88,36 @@ static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
 	return 0;
 }
 
-static int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
+static struct mga_device *
+mgag200_driver_load(struct pci_dev *pdev, unsigned long flags)
 {
+	struct drm_device *dev;
 	struct mga_device *mdev;
 	int ret;
 
+	dev = drm_dev_alloc(&mgag200_driver, &pdev->dev);
+	if (IS_ERR(dev))
+		return ERR_CAST(dev);
+
+	dev->pdev = pdev;
+	pci_set_drvdata(pdev, dev);
+
 	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
 	if (mdev == NULL)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	dev->dev_private = (void *)mdev;
 	mdev->dev = dev;
 
 	ret = mgag200_device_init(mdev, flags);
 	if (ret)
-		goto err_mm;
+		goto err_drm_dev_put;
 
-	return 0;
+	return mdev;
 
-err_mm:
+err_drm_dev_put:
+	drm_dev_put(dev);
 	dev->dev_private = NULL;
-	return ret;
+	return ERR_PTR(ret);
 }
 
 static void mgag200_driver_unload(struct drm_device *dev)
@@ -141,6 +151,7 @@ MODULE_DEVICE_TABLE(pci, mgag200_pciidlist);
 static int
 mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
+	struct mga_device *mdev;
 	struct drm_device *dev;
 	int ret;
 
@@ -150,16 +161,10 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&mgag200_driver, &pdev->dev);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
-
-	dev->pdev = pdev;
-	pci_set_drvdata(pdev, dev);
-
-	ret = mgag200_driver_load(dev, ent->driver_data);
-	if (ret)
-		goto err_drm_dev_put;
+	mdev = mgag200_driver_load(pdev, ent->driver_data);
+	if (IS_ERR(mdev))
+		return PTR_ERR(mdev);
+	dev = mdev->dev;
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
@@ -171,7 +176,6 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 err_mgag200_driver_unload:
 	mgag200_driver_unload(dev);
-err_drm_dev_put:
 	drm_dev_put(dev);
 	return ret;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
