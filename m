Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB91B370B2E
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 12:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969B86E507;
	Sun,  2 May 2021 10:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346896E507
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 10:49:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 416E5B12C;
 Sun,  2 May 2021 10:49:57 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH 6/7] drm/via: Remove references to drm_device.pdev
Date: Sun,  2 May 2021 12:49:52 +0200
Message-Id: <20210502104953.21768-7-tzimmermann@suse.de>
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
 drivers/gpu/drm/via/via_dmablit.c | 15 +++++++++------
 drivers/gpu/drm/via/via_map.c     |  3 ++-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/via/via_dmablit.c b/drivers/gpu/drm/via/via_dmablit.c
index 5771bb53ce6a..e016a4d62090 100644
--- a/drivers/gpu/drm/via/via_dmablit.c
+++ b/drivers/gpu/drm/via/via_dmablit.c
@@ -494,6 +494,7 @@ via_dmablit_workqueue(struct work_struct *work)
 {
 	drm_via_blitq_t *blitq = container_of(work, drm_via_blitq_t, wq);
 	struct drm_device *dev = blitq->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned long irqsave;
 	drm_via_sg_info_t *cur_sg;
 	int cur_released;
@@ -520,7 +521,7 @@ via_dmablit_workqueue(struct work_struct *work)
 
 		wake_up(&blitq->busy_queue);
 
-		via_free_sg_info(dev->pdev, cur_sg);
+		via_free_sg_info(pdev, cur_sg);
 		kfree(cur_sg);
 
 		spin_lock_irqsave(&blitq->blit_lock, irqsave);
@@ -540,9 +541,10 @@ via_init_dmablit(struct drm_device *dev)
 {
 	int i, j;
 	drm_via_private_t *dev_priv = (drm_via_private_t *)dev->dev_private;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	drm_via_blitq_t *blitq;
 
-	pci_set_master(dev->pdev);
+	pci_set_master(pdev);
 
 	for (i = 0; i < VIA_NUM_BLIT_ENGINES; ++i) {
 		blitq = dev_priv->blit_queues + i;
@@ -573,6 +575,7 @@ via_init_dmablit(struct drm_device *dev)
 static int
 via_build_sg_info(struct drm_device *dev, drm_via_sg_info_t *vsg, drm_via_dmablit_t *xfer)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	int draw = xfer->to_fb;
 	int ret = 0;
 
@@ -652,17 +655,17 @@ via_build_sg_info(struct drm_device *dev, drm_via_sg_info_t *vsg, drm_via_dmabli
 
 	if (0 != (ret = via_lock_all_dma_pages(vsg, xfer))) {
 		DRM_ERROR("Could not lock DMA pages.\n");
-		via_free_sg_info(dev->pdev, vsg);
+		via_free_sg_info(pdev, vsg);
 		return ret;
 	}
 
-	via_map_blit_for_device(dev->pdev, xfer, vsg, 0);
+	via_map_blit_for_device(pdev, xfer, vsg, 0);
 	if (0 != (ret = via_alloc_desc_pages(vsg))) {
 		DRM_ERROR("Could not allocate DMA descriptor pages.\n");
-		via_free_sg_info(dev->pdev, vsg);
+		via_free_sg_info(pdev, vsg);
 		return ret;
 	}
-	via_map_blit_for_device(dev->pdev, xfer, vsg, 1);
+	via_map_blit_for_device(pdev, xfer, vsg, 1);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/via/via_map.c b/drivers/gpu/drm/via/via_map.c
index 255c5066a939..a9f6b0c11966 100644
--- a/drivers/gpu/drm/via/via_map.c
+++ b/drivers/gpu/drm/via/via_map.c
@@ -98,6 +98,7 @@ int via_map_init(struct drm_device *dev, void *data, struct drm_file *file_priv)
 
 int via_driver_load(struct drm_device *dev, unsigned long chipset)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	drm_via_private_t *dev_priv;
 	int ret = 0;
 
@@ -110,7 +111,7 @@ int via_driver_load(struct drm_device *dev, unsigned long chipset)
 
 	dev_priv->chipset = chipset;
 
-	pci_set_master(dev->pdev);
+	pci_set_master(pdev);
 
 	ret = drm_vblank_init(dev, 1);
 	if (ret) {
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
