Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494DC168FC1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C4F6E954;
	Sat, 22 Feb 2020 15:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F38D6E05A
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:24:56 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F5B0563;
 Sat, 22 Feb 2020 16:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582385094;
 bh=CapCRf6TfR9cHAYmYT7tzcJGXy50CVUo4TZu3HlBctE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ixfk7qd0Wey0kldLflosizcsYnRQrIxl8k5SivnESJ6dvT2ntIO5LcY3fSRkBjFfm
 niq58Uy8Qe13F4F945YVkq3uuAqVUOv/XjvGZq9lpNLLCVaEPpXbCZlVA5O6iE0OnG
 LyqaBoyNY+yOG0TmDe82gxQDKlc0gU5EibrpWP18=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH/RFC 1/3] drm: Move legacy device list out of drm_driver
Date: Sat, 22 Feb 2020 17:24:28 +0200
Message-Id: <20200222152430.2984-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_driver structure contains a single field (legacy_dev_list) that
is modified by the DRM core, used to store a linked list of legacy DRM
devices associated with the driver. In order to make the structure
const, move the field out to a global variable. This requires locking
access to the global where the local field didn't require serialization,
but this only affects legacy drivers, and isn't in any hot path.

While at it, compile-out the legacy_dev_list field when DRM_LEGACY isn't
defined.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_pci.c | 30 ++++++++++++++++++++++--------
 include/drm/drm_device.h  |  2 ++
 include/drm/drm_drv.h     |  2 --
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index c6bb98729a26..44805ac3177c 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -24,6 +24,8 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 
@@ -36,6 +38,12 @@
 #include "drm_internal.h"
 #include "drm_legacy.h"
 
+#ifdef CONFIG_DRM_LEGACY
+/* List of devices hanging off drivers with stealth attach. */
+static LIST_HEAD(legacy_dev_list);
+static DEFINE_MUTEX(legacy_dev_list_lock);
+#endif
+
 /**
  * drm_pci_alloc - Allocate a PCI consistent memory block, for DMA.
  * @dev: DRM device
@@ -236,10 +244,13 @@ int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
 	if (ret)
 		goto err_agp;
 
-	/* No locking needed since shadow-attach is single-threaded since it may
-	 * only be called from the per-driver module init hook. */
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
-		list_add_tail(&dev->legacy_dev_list, &driver->legacy_dev_list);
+#ifdef CONFIG_DRM_LEGACY
+	if (drm_core_check_feature(dev, DRIVER_LEGACY)) {
+		mutex_lock(&legacy_dev_list_lock);
+		list_add_tail(&dev->legacy_dev_list, &legacy_dev_list);
+		mutex_unlock(&legacy_dev_list_lock);
+	}
+#endif
 
 	return 0;
 
@@ -275,7 +286,6 @@ int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver)
 		return -EINVAL;
 
 	/* If not using KMS, fall back to stealth mode manual scanning. */
-	INIT_LIST_HEAD(&driver->legacy_dev_list);
 	for (i = 0; pdriver->id_table[i].vendor != 0; i++) {
 		pid = &pdriver->id_table[i];
 
@@ -317,11 +327,15 @@ void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
 	if (!(driver->driver_features & DRIVER_LEGACY)) {
 		WARN_ON(1);
 	} else {
-		list_for_each_entry_safe(dev, tmp, &driver->legacy_dev_list,
+		mutex_lock(&legacy_dev_list_lock);
+		list_for_each_entry_safe(dev, tmp, &legacy_dev_list,
 					 legacy_dev_list) {
-			list_del(&dev->legacy_dev_list);
-			drm_put_dev(dev);
+			if (dev->driver == driver) {
+				list_del(&dev->legacy_dev_list);
+				drm_put_dev(dev);
+			}
 		}
+		mutex_unlock(&legacy_dev_list_lock);
 	}
 	DRM_INFO("Module unloaded\n");
 }
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index bb60a949f416..215b3472c773 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -51,12 +51,14 @@ enum switch_power_state {
  * may contain multiple heads.
  */
 struct drm_device {
+#ifdef CONFIG_DRM_LEGACY
 	/**
 	 * @legacy_dev_list:
 	 *
 	 * List of devices per driver for stealth attach cleanup
 	 */
 	struct list_head legacy_dev_list;
+#endif
 
 	/** @if_version: Highest interface version set */
 	int if_version;
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 97109df5beac..7dcf3b7bb5e6 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -601,8 +601,6 @@ struct drm_driver {
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 
-	/* List of devices hanging off this driver with stealth attach. */
-	struct list_head legacy_dev_list;
 	int (*firstopen) (struct drm_device *);
 	void (*preclose) (struct drm_device *, struct drm_file *file_priv);
 	int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_file *file_priv);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
