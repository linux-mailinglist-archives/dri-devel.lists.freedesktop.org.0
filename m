Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A4B370B27
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 12:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726206E151;
	Sun,  2 May 2021 10:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38F76E151
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 10:49:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17BABB08C;
 Sun,  2 May 2021 10:49:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH 1/7] drm/i810: Remove references to struct drm_device.pdev
Date: Sun,  2 May 2021 12:49:47 +0200
Message-Id: <20210502104953.21768-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210502104953.21768-1-tzimmermann@suse.de>
References: <20210502104953.21768-1-tzimmermann@suse.de>
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

Replace all references to struct drm_device's pdev field with
an upcast from dev.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i810/i810_dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
index 88250860f8e4..8a728273d625 100644
--- a/drivers/gpu/drm/i810/i810_dma.c
+++ b/drivers/gpu/drm/i810/i810_dma.c
@@ -220,7 +220,7 @@ static int i810_dma_cleanup(struct drm_device *dev)
 		if (dev_priv->ring.virtual_start)
 			drm_legacy_ioremapfree(&dev_priv->ring.map, dev);
 		if (dev_priv->hw_status_page) {
-			dma_free_coherent(&dev->pdev->dev, PAGE_SIZE,
+			dma_free_coherent(dev->dev, PAGE_SIZE,
 					  dev_priv->hw_status_page,
 					  dev_priv->dma_status_page);
 		}
@@ -398,7 +398,7 @@ static int i810_dma_initialize(struct drm_device *dev,
 
 	/* Program Hardware Status Page */
 	dev_priv->hw_status_page =
-		dma_alloc_coherent(&dev->pdev->dev, PAGE_SIZE,
+		dma_alloc_coherent(dev->dev, PAGE_SIZE,
 				   &dev_priv->dma_status_page, GFP_KERNEL);
 	if (!dev_priv->hw_status_page) {
 		dev->dev_private = (void *)dev_priv;
@@ -1197,6 +1197,8 @@ static int i810_flip_bufs(struct drm_device *dev, void *data,
 
 int i810_driver_load(struct drm_device *dev, unsigned long flags)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
 	dev->agp = drm_agp_init(dev);
 	if (dev->agp) {
 		dev->agp->agp_mtrr = arch_phys_wc_add(
@@ -1209,7 +1211,7 @@ int i810_driver_load(struct drm_device *dev, unsigned long flags)
 	if (!dev->agp)
 		return -EINVAL;
 
-	pci_set_master(dev->pdev);
+	pci_set_master(pdev);
 
 	return 0;
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
