Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BB21715B7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 12:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823226E819;
	Thu, 27 Feb 2020 11:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4566E817
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 11:09:29 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j7H2j-0007Dw-Jt; Thu, 27 Feb 2020 12:09:25 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: request pages from DMA32 zone when needed
Date: Thu, 27 Feb 2020 12:09:25 +0100
Message-Id: <20200227110925.21556-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Vivante GPUs are found in systems that have interconnects restricted
to 32 address bits, but may have system memory mapped above the 4GB mark.
As this region isn't accessible to the GPU via DMA any GPU memory allocated
in the upper part needs to go through SWIOTLB bounce buffering. This kills
performance if it happens too often, as well as overrunning the available
bounce buffer space, as the GPU buffer may stay mapped for a long time.

Avoid bounce buffering by checking the addressing restrictions. If the
GPU is unable to access memory above the 4GB mark, request our SHM buffers
to be located in the DMA32 zone.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.h | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 8 ++++++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6b43c1c94e8f..a8685b2e1803 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -551,6 +551,7 @@ static int etnaviv_bind(struct device *dev)
 	mutex_init(&priv->gem_lock);
 	INIT_LIST_HEAD(&priv->gem_list);
 	priv->num_gpus = 0;
+	priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
 
 	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm->dev);
 	if (IS_ERR(priv->cmdbuf_suballoc)) {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index efc656efeb0f..4d8dc9236e5f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -35,6 +35,7 @@ struct etnaviv_drm_private {
 	int num_gpus;
 	struct device_dma_parameters dma_parms;
 	struct etnaviv_gpu *gpu[ETNA_MAX_PIPES];
+	gfp_t shm_gfp_mask;
 
 	struct etnaviv_cmdbuf_suballoc *cmdbuf_suballoc;
 	struct etnaviv_iommu_global *mmu_global;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 6adea180d629..dc9ef302f517 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -602,6 +602,7 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
 int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	u32 size, u32 flags, u32 *handle)
 {
+	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct drm_gem_object *obj = NULL;
 	int ret;
 
@@ -624,8 +625,7 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	 * above new_inode() why this is required _and_ expected if you're
 	 * going to pin these pages.
 	 */
-	mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER |
-			     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	mapping_set_gfp_mask(obj->filp->f_mapping, priv->shm_gfp_mask);
 
 	etnaviv_gem_obj_add(dev, obj);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index f7b2f3a36a86..92df441839ae 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -781,6 +781,14 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 		gpu->identity.features &= ~chipFeatures_FAST_CLEAR;
 	}
 
+	/*
+	 * If the GPU is part of a system with DMA addressing limitations,
+	 * request pages for our SHM backend buffers from the DMA32 zone to
+	 * hopefully avoid performance killing SWIOTLB bounce buffering.
+	 */
+	if (dma_addressing_limited(gpu->dev))
+		priv->shm_gfp_mask |= GFP_DMA32;
+
 	/* Create buffer: */
 	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
 				  PAGE_SIZE);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
