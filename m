Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5743C4CA903
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A244510E11D;
	Wed,  2 Mar 2022 15:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C70310E11D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 15:24:46 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 73A81287297;
 Wed,  2 Mar 2022 15:24:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1646234684; bh=m2dP9qApAL01VFp9qy+xJrDK91P77R9vS54gcF/RtGA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MxDo8svVXzZnbZ/OAhwvgk1LknSd0AbBdvDH5TVARIPMd2CTV1bMDPUa/ZjDoWE+B
 tK1kZAGNONgk52BiB3TJQ+L1fXfH7GZV1Ctf5JnYub6TM56MTQD6F7c8donwpm6z9S
 eNf+QZt9Q8BiKqnbcEdEwr90UfM1uZPEDCB/lPxSf2yJ20NvlAMFH3Rs4QqurP5ERg
 f5tmqCRF+lYWaolnMv2N1ZNuVw+ZP4Ah1GJLORnPGWYyyT3lfZn7RYHq2mouUTn4Ac
 cYHvASQXfOmuSFPuP5BsFOAIBJylICrYq3xusdEvo2wmQKN4SmE6cNpnK8c7v1Tab/
 kDPxxdan6fX0A==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/vmwgfx: Implement MSI/MSI-X support for IRQs
Date: Wed,  2 Mar 2022 10:24:25 -0500
Message-Id: <20220302152426.885214-8-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302152426.885214-1-zack@kde.org>
References: <20220302152426.885214-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

SVGAv3 deprecates legacy interrupts and adds support for MSI/MSI-X. With
MSI the driver visible side remains largely unchanged but with MSI-X
each interrupt gets delivered on its own vector.

Add support for MSI/MSI-X while preserving the old functionality for
SVGAv2. Code between the SVGAv2 and SVGAv3 is exactly the same, only
the number of available vectors changes, in particular between legacy
and MSI-X interrupts.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  9 ++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c | 54 +++++++++++++++++++++++++----
 3 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index f43afd56915e..791f9a5f3868 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -980,7 +980,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	}
 
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK) {
-		ret = vmw_irq_install(&dev_priv->drm, pdev->irq);
+		ret = vmw_irq_install(dev_priv);
 		if (ret != 0) {
 			drm_err(&dev_priv->drm,
 				"Failed installing irq: %d\n", ret);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 12eb4de41036..be19aa6e1f13 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -65,6 +65,11 @@
 #define VMWGFX_PCI_ID_SVGA2              0x0405
 #define VMWGFX_PCI_ID_SVGA3              0x0406
 
+/*
+ * This has to match get_count_order(SVGA_IRQFLAG_MAX)
+ */
+#define VMWGFX_MAX_NUM_IRQS 6
+
 /*
  * Perhaps we should have sysfs entries for these.
  */
@@ -532,6 +537,8 @@ struct vmw_private {
 	bool has_mob;
 	spinlock_t hw_lock;
 	bool assume_16bpp;
+	u32 irqs[VMWGFX_MAX_NUM_IRQS];
+	u32 num_irq_vectors;
 
 	enum vmw_sm_type sm_type;
 
@@ -1158,7 +1165,7 @@ bool vmw_cmd_describe(const void *buf, u32 *size, char const **cmd);
  * IRQs and wating - vmwgfx_irq.c
  */
 
-extern int vmw_irq_install(struct drm_device *dev, int irq);
+extern int vmw_irq_install(struct vmw_private *dev_priv);
 extern void vmw_irq_uninstall(struct drm_device *dev);
 extern bool vmw_seqno_passed(struct vmw_private *dev_priv,
 				uint32_t seqno);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index fe4732bf2c9d..482989b1f211 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -300,6 +300,7 @@ void vmw_irq_uninstall(struct drm_device *dev)
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	uint32_t status;
+	u32 i;
 
 	if (!(dev_priv->capabilities & SVGA_CAP_IRQMASK))
 		return;
@@ -309,20 +310,61 @@ void vmw_irq_uninstall(struct drm_device *dev)
 	status = vmw_irq_status_read(dev_priv);
 	vmw_irq_status_write(dev_priv, status);
 
-	free_irq(pdev->irq, dev);
+	for (i = 0; i < dev_priv->num_irq_vectors; ++i)
+		free_irq(dev_priv->irqs[i], dev);
+
+	pci_free_irq_vectors(pdev);
+	dev_priv->num_irq_vectors = 0;
 }
 
 /**
  * vmw_irq_install - Install the irq handlers
  *
- * @dev:  Pointer to the drm device.
- * @irq:  The irq number.
+ * @dev_priv:  Pointer to the vmw_private device.
  * Return:  Zero if successful. Negative number otherwise.
  */
-int vmw_irq_install(struct drm_device *dev, int irq)
+int vmw_irq_install(struct vmw_private *dev_priv)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+	struct drm_device *dev = &dev_priv->drm;
+	int ret;
+	int nvec;
+	int i = 0;
+
+	BUILD_BUG_ON((SVGA_IRQFLAG_MAX >> VMWGFX_MAX_NUM_IRQS) != 1);
+	BUG_ON(VMWGFX_MAX_NUM_IRQS != get_count_order(SVGA_IRQFLAG_MAX));
+
+	nvec = pci_alloc_irq_vectors(pdev, 1, VMWGFX_MAX_NUM_IRQS,
+				     PCI_IRQ_ALL_TYPES);
+
+	if (nvec <= 0) {
+		drm_err(&dev_priv->drm,
+			"IRQ's are unavailable, nvec: %d\n", nvec);
+		goto done;
+	}
+
 	vmw_irq_preinstall(dev);
 
-	return request_threaded_irq(irq, vmw_irq_handler, vmw_thread_fn,
-				    IRQF_SHARED, VMWGFX_DRIVER_NAME, dev);
+	for (i = 0; i < nvec; ++i) {
+		ret = pci_irq_vector(pdev, i);
+		if (ret < 0) {
+			drm_err(&dev_priv->drm,
+				"failed getting irq vector: %d\n", ret);
+			goto done;
+		}
+		dev_priv->irqs[i] = ret;
+
+		ret = request_threaded_irq(dev_priv->irqs[i], vmw_irq_handler, vmw_thread_fn,
+					   IRQF_SHARED, VMWGFX_DRIVER_NAME, dev);
+		if (ret != 0) {
+			drm_err(&dev_priv->drm,
+				"Failed installing irq(%d): %d\n",
+				dev_priv->irqs[i], ret);
+			goto done;
+		}
+	}
+
+done:
+	dev_priv->num_irq_vectors = i;
+	return ret;
 }
-- 
2.32.0

