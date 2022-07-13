Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15330573BB4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF5190F96;
	Wed, 13 Jul 2022 17:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA4E90E04
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 17:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=acs6YbP33vHKmz7Rkm16ciGDF3+3/DdqZNRNm0k/zGQ=;
 b=elKrHItQQxxCsUTtTgkVj8yA4dD1Q9Imji6X9qnN6AgO0Y2ZaM73Vy2KchrKK68WMpYbWjqZsjxsj
 hxuCDlkAyMZ98yH8xw/+LK4gHCL99YCeHOVi9C6/9gn66m2ivGRxOqYEOtZvAfPVdvvmnk1Mear8mi
 P71zT3oMZyyJYUvXUw02TW360g+Plk410PwqPpPLdHGqyQ0uuY16i7yIsFv7w3EoIhslJt8FqTSt+6
 xT651eAjdOdXcWf6k69QcXSOXS0jE3CrzKrHF9WzzWKwhl4f9wqiqLSvL81qZEzNIN86Wcfcnh+9La
 XyZwm3Ql/qUazkCQEzKl+6y5GR7Tu5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=acs6YbP33vHKmz7Rkm16ciGDF3+3/DdqZNRNm0k/zGQ=;
 b=A6LWA7uQ5AF5KTuea0w3z/C97AHiEvz5vH7lCzlDo/B/q/S+QfXKuGf3iJWvpPJ9ny33Mwi9B4LrN
 faSc0x2AQ==
X-HalOne-Cookie: 4313c7b92594af93ee83b6302ca3e9f63419ea38
X-HalOne-ID: 89ea0ac7-02cd-11ed-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 89ea0ac7-02cd-11ed-be7e-d0431ea8bb03;
 Wed, 13 Jul 2022 17:02:12 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/13] drm/via: Embed via_map in via_dri1
Date: Wed, 13 Jul 2022 19:01:52 +0200
Message-Id: <20220713170202.1798216-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713170202.1798216-1-sam@ravnborg.org>
References: <20220713170202.1798216-1-sam@ravnborg.org>
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
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

