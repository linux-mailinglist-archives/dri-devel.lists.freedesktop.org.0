Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4CA1EF9CA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6607B6E8FE;
	Fri,  5 Jun 2020 13:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6116E8F8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39EA6AE65;
 Fri,  5 Jun 2020 13:58:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 14/14] drm/mgag200: Use managed device initialization
Date: Fri,  5 Jun 2020 15:58:03 +0200
Message-Id: <20200605135803.19811-15-tzimmermann@suse.de>
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

The mgag200 driver now uses managed functions for DRM devices. The
individual helpers for modesetting and memory managed are already
covered, so only device allocation and initialization is left for
conversion.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 30 +++++++--------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 6dfb7c5f79e3c..e19660f4a6371 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -95,27 +95,20 @@ mgag200_device_create(struct pci_dev *pdev, unsigned long flags)
 	struct mga_device *mdev;
 	int ret;
 
-	mdev = devm_kzalloc(&pdev->dev, sizeof(*mdev), GFP_KERNEL);
-	if (!mdev)
-		return ERR_PTR(-ENOMEM);
+	mdev = devm_drm_dev_alloc(&pdev->dev, &mgag200_driver,
+				  struct mga_device, base);
+	if (IS_ERR(mdev))
+		return mdev;
 	dev = &mdev->base;
 
-	ret = drm_dev_init(dev, &mgag200_driver, &pdev->dev);
-	if (ret)
-		return ERR_PTR(ret);
-
 	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
 	ret = mgag200_device_init(mdev, flags);
 	if (ret)
-		goto err_drm_dev_put;
+		return ERR_PTR(ret);
 
 	return mdev;
-
-err_drm_dev_put:
-	drm_dev_put(dev);
-	return ERR_PTR(ret);
 }
 
 /*
@@ -151,23 +144,17 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return ret;
 
 	mdev = mgag200_device_create(pdev, ent->driver_data);
-	if (IS_ERR(mdev)) {
-		ret = PTR_ERR(mdev);
-		goto err_drm_dev_put;
-	}
+	if (IS_ERR(mdev))
+		return PTR_ERR(mdev);
 	dev = &mdev->base;
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
-		goto err_drm_dev_put;
+		return ret;
 
 	drm_fbdev_generic_setup(dev, 0);
 
 	return 0;
-
-err_drm_dev_put:
-	drm_dev_put(dev);
-	return ret;
 }
 
 static void mgag200_pci_remove(struct pci_dev *pdev)
@@ -175,7 +162,6 @@ static void mgag200_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(dev);
-	drm_dev_put(dev);
 }
 
 static struct pci_driver mgag200_pci_driver = {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
