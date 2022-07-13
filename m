Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97888573BB6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF9F92E8C;
	Wed, 13 Jul 2022 17:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1B491069
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=kb31IcRDxR2F9MieVU6uB4IHA6JkgakefHaWrLqrtCo=;
 b=OSb93aEbQmX/se/KrXEnjUMTpgqJudZr285cB7uOXCLgS6CP6iDKCoSkxsOiZQkDbV5PydowRFUK2
 ZxWeKjj1YgvalkbSoSnZrl+q8dUhAWKHwMisbrCjqCmxEFAFz1tEZAbGK066CfZmWwxuiOEKpmuwir
 kdQyG5qQqYOKCkN4MOwEZBjVI6e9EG4EKdiSUPlWm+wblDC7mF3EsIHQ0XLU/5ct9HnH4AdLl1QF4F
 DUsUn68styaOeHZnfbyM2OIsZIRYC4M2cmuucty8X3uT9mjr0KfDY2LUJ3iYNM3SkEbipIhARWIlYw
 1hwBjjz2qhWSITpzUahv7habXquRJfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=kb31IcRDxR2F9MieVU6uB4IHA6JkgakefHaWrLqrtCo=;
 b=rvF9AYnCPdfyM6lQ8Xu41hDTodPjWShb6QekNBv4LRsflzm5YPx6A0nOcsIGNbSSfQrpNTCev1EuH
 aIWtPrQAQ==
X-HalOne-Cookie: 80070af2faaf9a68c33fd28c93e0567dfc29086e
X-HalOne-ID: 8b64be73-02cd-11ed-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 8b64be73-02cd-11ed-be7e-d0431ea8bb03;
 Wed, 13 Jul 2022 17:02:15 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/13] drm/via: Embed via_video in via_dri1
Date: Wed, 13 Jul 2022 19:01:54 +0200
Message-Id: <20220713170202.1798216-6-sam@ravnborg.org>
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

All functions are made static as there are no more external users.
The file had a new copyright that is kept.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
---
 drivers/gpu/drm/via/Makefile    |  2 +-
 drivers/gpu/drm/via/via_dri1.c  | 66 ++++++++++++++++++++++-
 drivers/gpu/drm/via/via_drv.h   |  4 --
 drivers/gpu/drm/via/via_video.c | 94 ---------------------------------
 4 files changed, 66 insertions(+), 100 deletions(-)
 delete mode 100644 drivers/gpu/drm/via/via_video.c

diff --git a/drivers/gpu/drm/via/Makefile b/drivers/gpu/drm/via/Makefile
index daadc0d3233f..398be21c6df8 100644
--- a/drivers/gpu/drm/via/Makefile
+++ b/drivers/gpu/drm/via/Makefile
@@ -3,6 +3,6 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-via-y    := via_irq.o via_dri1.o via_verifier.o via_video.o via_dmablit.o
+via-y    := via_irq.o via_dri1.o via_verifier.o via_dmablit.o
 
 obj-$(CONFIG_DRM_VIA)	+=via.o
diff --git a/drivers/gpu/drm/via/via_dri1.c b/drivers/gpu/drm/via/via_dri1.c
index 3ebe17649ec2..4c5517330110 100644
--- a/drivers/gpu/drm/via/via_dri1.c
+++ b/drivers/gpu/drm/via/via_dri1.c
@@ -5,7 +5,8 @@
  * Copyright 2006 Tungsten Graphics Inc., Bismarck, ND., USA.
  * Copyright 2004 Digeo, Inc., Palo Alto, CA, U.S.A. All Rights Reserved.
  * Copyright 2004 The Unichrome project. All Rights Reserved.
-  *
+ * Copyright 2005 Thomas Hellstrom. All Rights Reserved.
+ *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
  * to deal in the Software without restriction, including without limitation
@@ -76,6 +77,69 @@ struct via_memblock {
 	struct list_head owner_list;
 };
 
+static void via_init_futex(drm_via_private_t *dev_priv)
+{
+	unsigned int i;
+
+	DRM_DEBUG("\n");
+
+	for (i = 0; i < VIA_NR_XVMC_LOCKS; ++i) {
+		init_waitqueue_head(&(dev_priv->decoder_queue[i]));
+		XVMCLOCKPTR(dev_priv->sarea_priv, i)->lock = 0;
+	}
+}
+
+static void via_cleanup_futex(drm_via_private_t *dev_priv)
+{
+}
+
+static void via_release_futex(drm_via_private_t *dev_priv, int context)
+{
+	unsigned int i;
+	volatile int *lock;
+
+	if (!dev_priv->sarea_priv)
+		return;
+
+	for (i = 0; i < VIA_NR_XVMC_LOCKS; ++i) {
+		lock = (volatile int *)XVMCLOCKPTR(dev_priv->sarea_priv, i);
+		if ((_DRM_LOCKING_CONTEXT(*lock) == context)) {
+			if (_DRM_LOCK_IS_HELD(*lock)
+			    && (*lock & _DRM_LOCK_CONT)) {
+				wake_up(&(dev_priv->decoder_queue[i]));
+			}
+			*lock = 0;
+		}
+	}
+}
+
+static int via_decoder_futex(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	drm_via_futex_t *fx = data;
+	volatile int *lock;
+	drm_via_private_t *dev_priv = (drm_via_private_t *) dev->dev_private;
+	drm_via_sarea_t *sAPriv = dev_priv->sarea_priv;
+	int ret = 0;
+
+	DRM_DEBUG("\n");
+
+	if (fx->lock >= VIA_NR_XVMC_LOCKS)
+		return -EFAULT;
+
+	lock = (volatile int *)XVMCLOCKPTR(sAPriv, fx->lock);
+
+	switch (fx->func) {
+	case VIA_FUTEX_WAIT:
+		VIA_WAIT_ON(ret, dev_priv->decoder_queue[fx->lock],
+			    (fx->ms / 10) * (HZ / 100), *lock != fx->val);
+		return ret;
+	case VIA_FUTEX_WAKE:
+		wake_up(&(dev_priv->decoder_queue[fx->lock]));
+		return 0;
+	}
+	return 0;
+}
+
 static int via_agp_init(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	drm_via_agp_t *agp = data;
diff --git a/drivers/gpu/drm/via/via_drv.h b/drivers/gpu/drm/via/via_drv.h
index c1a5fdf0bc4b..312e86b850f6 100644
--- a/drivers/gpu/drm/via/via_drv.h
+++ b/drivers/gpu/drm/via/via_drv.h
@@ -183,7 +183,6 @@ do {								\
 	remove_wait_queue(&(queue), &entry);			\
 } while (0)
 
-extern int via_decoder_futex(struct drm_device *dev, void *data, struct drm_file *file_priv);
 extern int via_wait_irq(struct drm_device *dev, void *data, struct drm_file *file_priv);
 extern int via_dma_blit_sync(struct drm_device *dev, void *data, struct drm_file *file_priv);
 extern int via_dma_blit(struct drm_device *dev, void *data, struct drm_file *file_priv);
@@ -203,9 +202,6 @@ extern void via_driver_irq_uninstall(struct drm_device *dev);
 extern int via_dma_cleanup(struct drm_device *dev);
 extern void via_init_command_verifier(void);
 extern int via_driver_dma_quiescent(struct drm_device *dev);
-extern void via_init_futex(drm_via_private_t *dev_priv);
-extern void via_cleanup_futex(drm_via_private_t *dev_priv);
-extern void via_release_futex(drm_via_private_t *dev_priv, int context);
 
 extern void via_dmablit_handler(struct drm_device *dev, int engine, int from_irq);
 extern void via_init_dmablit(struct drm_device *dev);
diff --git a/drivers/gpu/drm/via/via_video.c b/drivers/gpu/drm/via/via_video.c
deleted file mode 100644
index 53b1f58f99b4..000000000000
--- a/drivers/gpu/drm/via/via_video.c
+++ /dev/null
@@ -1,94 +0,0 @@
-/*
- * Copyright 2005 Thomas Hellstrom. All Rights Reserved.
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
- * THE AUTHOR(S), AND/OR THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
- * Author: Thomas Hellstrom 2005.
- *
- * Video and XvMC related functions.
- */
-
-#include <drm/drm_device.h>
-#include <drm/via_drm.h>
-
-#include "via_drv.h"
-
-void via_init_futex(drm_via_private_t *dev_priv)
-{
-	unsigned int i;
-
-	DRM_DEBUG("\n");
-
-	for (i = 0; i < VIA_NR_XVMC_LOCKS; ++i) {
-		init_waitqueue_head(&(dev_priv->decoder_queue[i]));
-		XVMCLOCKPTR(dev_priv->sarea_priv, i)->lock = 0;
-	}
-}
-
-void via_cleanup_futex(drm_via_private_t *dev_priv)
-{
-}
-
-void via_release_futex(drm_via_private_t *dev_priv, int context)
-{
-	unsigned int i;
-	volatile int *lock;
-
-	if (!dev_priv->sarea_priv)
-		return;
-
-	for (i = 0; i < VIA_NR_XVMC_LOCKS; ++i) {
-		lock = (volatile int *)XVMCLOCKPTR(dev_priv->sarea_priv, i);
-		if ((_DRM_LOCKING_CONTEXT(*lock) == context)) {
-			if (_DRM_LOCK_IS_HELD(*lock)
-			    && (*lock & _DRM_LOCK_CONT)) {
-				wake_up(&(dev_priv->decoder_queue[i]));
-			}
-			*lock = 0;
-		}
-	}
-}
-
-int via_decoder_futex(struct drm_device *dev, void *data, struct drm_file *file_priv)
-{
-	drm_via_futex_t *fx = data;
-	volatile int *lock;
-	drm_via_private_t *dev_priv = (drm_via_private_t *) dev->dev_private;
-	drm_via_sarea_t *sAPriv = dev_priv->sarea_priv;
-	int ret = 0;
-
-	DRM_DEBUG("\n");
-
-	if (fx->lock >= VIA_NR_XVMC_LOCKS)
-		return -EFAULT;
-
-	lock = (volatile int *)XVMCLOCKPTR(sAPriv, fx->lock);
-
-	switch (fx->func) {
-	case VIA_FUTEX_WAIT:
-		VIA_WAIT_ON(ret, dev_priv->decoder_queue[fx->lock],
-			    (fx->ms / 10) * (HZ / 100), *lock != fx->val);
-		return ret;
-	case VIA_FUTEX_WAKE:
-		wake_up(&(dev_priv->decoder_queue[fx->lock]));
-		return 0;
-	}
-	return 0;
-}
-- 
2.34.1

