Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10222294D31
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 15:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97746E133;
	Wed, 21 Oct 2020 13:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA486E133
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 13:07:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5286CAFE8;
 Wed, 21 Oct 2020 13:07:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 1/3] drm: Add reference to USB device to struct drm_device
Date: Wed, 21 Oct 2020 15:07:30 +0200
Message-Id: <20201021130732.4048-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021130732.4048-1-tzimmermann@suse.de>
References: <20201021130732.4048-1-tzimmermann@suse.de>
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

We have DRM drivers that operate on USB devices. So far they had
to store a pointer to the USB device structure. Move the reference
into struct drm_device. Putting the USB device into a union with
the PCI data saves a few bytes. Both should mutually exclusive.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_device.h | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index f4f68e7a9149..9871fcabd720 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -25,6 +25,7 @@ struct inode;
 struct pci_dev;
 struct pci_controller;
 
+struct usb_device;
 
 /**
  * enum drm_switch_power - power state of drm device
@@ -283,16 +284,24 @@ struct drm_device {
 	 */
 	spinlock_t event_lock;
 
-	/** @agp: AGP data */
-	struct drm_agp_head *agp;
+	union {
+		struct {
+			/** @agp: AGP data */
+			struct drm_agp_head *agp;
 
-	/** @pdev: PCI device structure */
-	struct pci_dev *pdev;
+			/** @pdev: PCI device structure */
+			struct pci_dev *pdev;
 
 #ifdef __alpha__
-	/** @hose: PCI hose, only used on ALPHA platforms. */
-	struct pci_controller *hose;
+			/** @hose: PCI hose, only used on ALPHA platforms. */
+			struct pci_controller *hose;
 #endif
+		};
+
+		/** @udev: USB device structure */
+		struct usb_device *udev;
+	};
+
 	/** @num_crtcs: Number of CRTCs on this device */
 	unsigned int num_crtcs;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
