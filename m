Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C178370B2D
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 12:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBBF6E7E5;
	Sun,  2 May 2021 10:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC2C6E1D5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 10:49:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48AA2B0B3;
 Sun,  2 May 2021 10:49:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH 2/7] drm/mga: Remove references to struct drm_device.pdev
Date: Sun,  2 May 2021 12:49:48 +0200
Message-Id: <20210502104953.21768-3-tzimmermann@suse.de>
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
 drivers/gpu/drm/mga/mga_dma.c   | 13 +++++++------
 drivers/gpu/drm/mga/mga_state.c |  3 ++-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mga/mga_dma.c b/drivers/gpu/drm/mga/mga_dma.c
index 1cb7d120d18f..53a119a761df 100644
--- a/drivers/gpu/drm/mga/mga_dma.c
+++ b/drivers/gpu/drm/mga/mga_dma.c
@@ -389,6 +389,7 @@ int mga_freelist_put(struct drm_device *dev, struct drm_buf *buf)
 
 int mga_driver_load(struct drm_device *dev, unsigned long flags)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	drm_mga_private_t *dev_priv;
 	int ret;
 
@@ -400,9 +401,9 @@ int mga_driver_load(struct drm_device *dev, unsigned long flags)
 	 * device is 0x0021 (HB6 Universal PCI-PCI bridge), we reject the
 	 * device.
 	 */
-	if ((dev->pdev->device == 0x0525) && dev->pdev->bus->self
-	    && (dev->pdev->bus->self->vendor == 0x3388)
-	    && (dev->pdev->bus->self->device == 0x0021)
+	if ((pdev->device == 0x0525) && pdev->bus->self
+	    && (pdev->bus->self->vendor == 0x3388)
+	    && (pdev->bus->self->device == 0x0021)
 	    && dev->agp) {
 		/* FIXME: This should be quirked in the pci core, but oh well
 		 * the hw probably stopped existing. */
@@ -419,10 +420,10 @@ int mga_driver_load(struct drm_device *dev, unsigned long flags)
 	dev_priv->usec_timeout = MGA_DEFAULT_USEC_TIMEOUT;
 	dev_priv->chipset = flags;
 
-	pci_set_master(dev->pdev);
+	pci_set_master(pdev);
 
-	dev_priv->mmio_base = pci_resource_start(dev->pdev, 1);
-	dev_priv->mmio_size = pci_resource_len(dev->pdev, 1);
+	dev_priv->mmio_base = pci_resource_start(pdev, 1);
+	dev_priv->mmio_size = pci_resource_len(pdev, 1);
 
 	ret = drm_vblank_init(dev, 1);
 
diff --git a/drivers/gpu/drm/mga/mga_state.c b/drivers/gpu/drm/mga/mga_state.c
index 0dec4062e5a2..5b7247b58451 100644
--- a/drivers/gpu/drm/mga/mga_state.c
+++ b/drivers/gpu/drm/mga/mga_state.c
@@ -1005,6 +1005,7 @@ int mga_getparam(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	drm_mga_private_t *dev_priv = dev->dev_private;
 	drm_mga_getparam_t *param = data;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	int value;
 
 	if (!dev_priv) {
@@ -1016,7 +1017,7 @@ int mga_getparam(struct drm_device *dev, void *data, struct drm_file *file_priv)
 
 	switch (param->param) {
 	case MGA_PARAM_IRQ_NR:
-		value = dev->pdev->irq;
+		value = pdev->irq;
 		break;
 	case MGA_PARAM_CARD_TYPE:
 		value = dev_priv->chipset;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
