Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D34356CE13
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B97B113239;
	Sun, 10 Jul 2022 08:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB0C1120D6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=lTwzZ2DksrKHBLOH6mSgq++8rA/vM173f4pmQUrFl7A=;
 b=WTybjW+AgiWYaINwiC4hb+264u5oDKcxyfXjxRa1kb5D6T14BvdBV0yjWdPtWpFovlR/d41EH7xe9
 zahHDRoqrwzXIRpS81KrTdj2wFiAhTh0yntM+pT6q17+x+0fZL0bhDyvWiDu/vvkM9mwyd4QrUAwgP
 LmAygeV1e3bICO7Bu/GfbPwHKV/QepSyvvlbSaeejRyaiBnfOHXtbQjqBrMlPCBEEG63KCXVartVVv
 J+8hlN3Ikko+8PeqTC/WAaGQLaJclP2V0w44iXF8L8V+Or7UN1JJzVOlifrPXS9Z8A1BPeqWWO4h6g
 nqfD+BM/MXD9rVvHqK7x/tIOFR/krGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=lTwzZ2DksrKHBLOH6mSgq++8rA/vM173f4pmQUrFl7A=;
 b=5wk6UYONbtUzHQg8MugXSTeTLYGASlURdSyH4RCbnrRQcLjG3EUR6FFvzF2GLqzkRvVF+vWIr3QKj
 xUSLBpUBQ==
X-HalOne-Cookie: 1e34d64778e0bade938cf63fa7c2b35e78b64fe1
X-HalOne-ID: 0a960e65-002e-11ed-a6c6-d0431ea8a283
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 0a960e65-002e-11ed-a6c6-d0431ea8a283;
 Sun, 10 Jul 2022 08:55:26 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 03/11] drm/via: Embed via_map in via_dri1
Date: Sun, 10 Jul 2022 10:54:58 +0200
Message-Id: <20220710085506.1384056-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220710085506.1384056-1-sam@ravnborg.org>
References: <20220710085506.1384056-1-sam@ravnborg.org>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few functions has no external use and are made static.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/via/Makefile   |   2 +-
 drivers/gpu/drm/via/via_dri1.c | 102 +++++++++++++++++++++++++
 drivers/gpu/drm/via/via_drv.h  |   4 -
 drivers/gpu/drm/via/via_map.c  | 132 ---------------------------------
 4 files changed, 103 insertions(+), 137 deletions(-)
 delete mode 100644 drivers/gpu/drm/via/via_map.c

diff --git a/drivers/gpu/drm/via/Makefile b/drivers/gpu/drm/via/Makefile
index 824198c0c2ea..be12cbfa4d7f 100644
--- a/drivers/gpu/drm/via/Makefile
+++ b/drivers/gpu/drm/via/Makefile
@@ -3,6 +3,6 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-via-y    := via_irq.o via_dri1.o via_map.o via_mm.o via_verifier.o via_video.o via_dmablit.o
+via-y    := via_irq.o via_dri1.o via_mm.o via_verifier.o via_video.o via_dmablit.o
 
 obj-$(CONFIG_DRM_VIA)	+=via.o
diff --git a/drivers/gpu/drm/via/via_dri1.c b/drivers/gpu/drm/via/via_dri1.c
index d5d4a64437da..2fa22359b1f6 100644
--- a/drivers/gpu/drm/via/via_dri1.c
+++ b/drivers/gpu/drm/via/via_dri1.c
@@ -32,6 +32,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_pciids.h>
+#include <drm/drm_vblank.h>
 #include <drm/via_drm.h>
 
 #include "via_drv.h"
@@ -66,6 +67,107 @@
 	dev_priv->dma_low += 8;			\
 } while (0)
 
+static int via_do_init_map(struct drm_device *dev, drm_via_init_t *init)
+{
+	drm_via_private_t *dev_priv = dev->dev_private;
+
+	DRM_DEBUG("\n");
+
+	dev_priv->sarea = drm_legacy_getsarea(dev);
+	if (!dev_priv->sarea) {
+		DRM_ERROR("could not find sarea!\n");
+		dev->dev_private = (void *)dev_priv;
+		via_do_cleanup_map(dev);
+		return -EINVAL;
+	}
+
+	dev_priv->fb = drm_legacy_findmap(dev, init->fb_offset);
+	if (!dev_priv->fb) {
+		DRM_ERROR("could not find framebuffer!\n");
+		dev->dev_private = (void *)dev_priv;
+		via_do_cleanup_map(dev);
+		return -EINVAL;
+	}
+	dev_priv->mmio = drm_legacy_findmap(dev, init->mmio_offset);
+	if (!dev_priv->mmio) {
+		DRM_ERROR("could not find mmio region!\n");
+		dev->dev_private = (void *)dev_priv;
+		via_do_cleanup_map(dev);
+		return -EINVAL;
+	}
+
+	dev_priv->sarea_priv =
+	    (drm_via_sarea_t *) ((u8 *) dev_priv->sarea->handle +
+				 init->sarea_priv_offset);
+
+	dev_priv->agpAddr = init->agpAddr;
+
+	via_init_futex(dev_priv);
+
+	via_init_dmablit(dev);
+
+	dev->dev_private = (void *)dev_priv;
+	return 0;
+}
+
+int via_do_cleanup_map(struct drm_device *dev)
+{
+	via_dma_cleanup(dev);
+
+	return 0;
+}
+
+static int via_map_init(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	drm_via_init_t *init = data;
+
+	DRM_DEBUG("\n");
+
+	switch (init->func) {
+	case VIA_INIT_MAP:
+		return via_do_init_map(dev, init);
+	case VIA_CLEANUP_MAP:
+		return via_do_cleanup_map(dev);
+	}
+
+	return -EINVAL;
+}
+
+static int via_driver_load(struct drm_device *dev, unsigned long chipset)
+{
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	drm_via_private_t *dev_priv;
+	int ret = 0;
+
+	dev_priv = kzalloc(sizeof(drm_via_private_t), GFP_KERNEL);
+	if (dev_priv == NULL)
+		return -ENOMEM;
+
+	idr_init(&dev_priv->object_idr);
+	dev->dev_private = (void *)dev_priv;
+
+	dev_priv->chipset = chipset;
+
+	pci_set_master(pdev);
+
+	ret = drm_vblank_init(dev, 1);
+	if (ret) {
+		kfree(dev_priv);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void via_driver_unload(struct drm_device *dev)
+{
+	drm_via_private_t *dev_priv = dev->dev_private;
+
+	idr_destroy(&dev_priv->object_idr);
+
+	kfree(dev_priv);
+}
+
 static void via_cmdbuf_start(drm_via_private_t *dev_priv);
 static void via_cmdbuf_pause(drm_via_private_t *dev_priv);
 static void via_cmdbuf_reset(drm_via_private_t *dev_priv);
diff --git a/drivers/gpu/drm/via/via_drv.h b/drivers/gpu/drm/via/via_drv.h
index 5757422ea634..4eaad17c0e02 100644
--- a/drivers/gpu/drm/via/via_drv.h
+++ b/drivers/gpu/drm/via/via_drv.h
@@ -187,15 +187,11 @@ extern int via_fb_init(struct drm_device *dev, void *data, struct drm_file *file
 extern int via_mem_alloc(struct drm_device *dev, void *data, struct drm_file *file_priv);
 extern int via_mem_free(struct drm_device *dev, void *data, struct drm_file *file_priv);
 extern int via_agp_init(struct drm_device *dev, void *data, struct drm_file *file_priv);
-extern int via_map_init(struct drm_device *dev, void *data, struct drm_file *file_priv);
 extern int via_decoder_futex(struct drm_device *dev, void *data, struct drm_file *file_priv);
 extern int via_wait_irq(struct drm_device *dev, void *data, struct drm_file *file_priv);
 extern int via_dma_blit_sync(struct drm_device *dev, void *data, struct drm_file *file_priv);
 extern int via_dma_blit(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
-extern int via_driver_load(struct drm_device *dev, unsigned long chipset);
-extern void via_driver_unload(struct drm_device *dev);
-
 extern int via_init_context(struct drm_device *dev, int context);
 extern int via_final_context(struct drm_device *dev, int context);
 
diff --git a/drivers/gpu/drm/via/via_map.c b/drivers/gpu/drm/via/via_map.c
deleted file mode 100644
index a9f6b0c11966..000000000000
--- a/drivers/gpu/drm/via/via_map.c
+++ /dev/null
@@ -1,132 +0,0 @@
-/*
- * Copyright 1998-2003 VIA Technologies, Inc. All Rights Reserved.
- * Copyright 2001-2003 S3 Graphics, Inc. All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sub license,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#include <linux/pci.h>
-
-#include <drm/drm_device.h>
-#include <drm/drm_vblank.h>
-#include <drm/via_drm.h>
-
-#include "via_drv.h"
-
-static int via_do_init_map(struct drm_device *dev, drm_via_init_t *init)
-{
-	drm_via_private_t *dev_priv = dev->dev_private;
-
-	DRM_DEBUG("\n");
-
-	dev_priv->sarea = drm_legacy_getsarea(dev);
-	if (!dev_priv->sarea) {
-		DRM_ERROR("could not find sarea!\n");
-		dev->dev_private = (void *)dev_priv;
-		via_do_cleanup_map(dev);
-		return -EINVAL;
-	}
-
-	dev_priv->fb = drm_legacy_findmap(dev, init->fb_offset);
-	if (!dev_priv->fb) {
-		DRM_ERROR("could not find framebuffer!\n");
-		dev->dev_private = (void *)dev_priv;
-		via_do_cleanup_map(dev);
-		return -EINVAL;
-	}
-	dev_priv->mmio = drm_legacy_findmap(dev, init->mmio_offset);
-	if (!dev_priv->mmio) {
-		DRM_ERROR("could not find mmio region!\n");
-		dev->dev_private = (void *)dev_priv;
-		via_do_cleanup_map(dev);
-		return -EINVAL;
-	}
-
-	dev_priv->sarea_priv =
-	    (drm_via_sarea_t *) ((u8 *) dev_priv->sarea->handle +
-				 init->sarea_priv_offset);
-
-	dev_priv->agpAddr = init->agpAddr;
-
-	via_init_futex(dev_priv);
-
-	via_init_dmablit(dev);
-
-	dev->dev_private = (void *)dev_priv;
-	return 0;
-}
-
-int via_do_cleanup_map(struct drm_device *dev)
-{
-	via_dma_cleanup(dev);
-
-	return 0;
-}
-
-int via_map_init(struct drm_device *dev, void *data, struct drm_file *file_priv)
-{
-	drm_via_init_t *init = data;
-
-	DRM_DEBUG("\n");
-
-	switch (init->func) {
-	case VIA_INIT_MAP:
-		return via_do_init_map(dev, init);
-	case VIA_CLEANUP_MAP:
-		return via_do_cleanup_map(dev);
-	}
-
-	return -EINVAL;
-}
-
-int via_driver_load(struct drm_device *dev, unsigned long chipset)
-{
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	drm_via_private_t *dev_priv;
-	int ret = 0;
-
-	dev_priv = kzalloc(sizeof(drm_via_private_t), GFP_KERNEL);
-	if (dev_priv == NULL)
-		return -ENOMEM;
-
-	idr_init(&dev_priv->object_idr);
-	dev->dev_private = (void *)dev_priv;
-
-	dev_priv->chipset = chipset;
-
-	pci_set_master(pdev);
-
-	ret = drm_vblank_init(dev, 1);
-	if (ret) {
-		kfree(dev_priv);
-		return ret;
-	}
-
-	return 0;
-}
-
-void via_driver_unload(struct drm_device *dev)
-{
-	drm_via_private_t *dev_priv = dev->dev_private;
-
-	idr_destroy(&dev_priv->object_idr);
-
-	kfree(dev_priv);
-}
-- 
2.34.1

