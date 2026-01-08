Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6ED038B4
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A7B10E787;
	Thu,  8 Jan 2026 14:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DE710E788
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:51:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC2A734308;
 Thu,  8 Jan 2026 14:51:03 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7384C3EA65;
 Thu,  8 Jan 2026 14:51:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YK36GlfEX2n0WQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jan 2026 14:51:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/8] video/aperture: Support coreboot devices
Date: Thu,  8 Jan 2026 15:19:45 +0100
Message-ID: <20260108145058.56943-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108145058.56943-1-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: BC2A734308
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for coreboot devices. Until now, all devices with system
framebuffers were on the platform bus. On systems with a coreboot
firmware, the system framebuffer can be represented as coreboot device
on the coreboot bus. Handling the related graphics apertures requires
new interfaces and a custom way of removing the coreboot device. The
core aperture code is independent from the type of device.

Also move around a comment that refers to both, platform and coreboot,
devices.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/aperture.c | 60 ++++++++++++++++++++++++++++++++--------
 include/linux/aperture.h | 16 +++++++++++
 2 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 2b5a1e666e9b..15e664a4478b 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 
 #include <linux/aperture.h>
+#include <linux/coreboot.h>
 #include <linux/device.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -197,22 +198,47 @@ static int devm_aperture_acquire(struct device *dev,
 	return devm_add_action_or_reset(dev, devm_aperture_acquire_release, ap);
 }
 
+#if defined(CONFIG_GOOGLE_COREBOOT_TABLE)
+static void aperture_detach_coreboot_device(struct device *dev)
+{
+	struct coreboot_device *cbdev = dev_to_coreboot_device(dev);
+
+	device_unregister(&cbdev->dev);
+}
+
+/**
+ * devm_aperture_acquire_for_coreboot_device - Acquires ownership of an aperture
+ *                                             on behalf of a coreboot device.
+ * @cbdev:	the coreboot device to own the aperture
+ * @base:	the aperture's byte offset in physical memory
+ * @size:	the aperture size in bytes
+ *
+ * Installs the given device as the new owner of the aperture. The function
+ * expects the aperture to be provided by a coreboot device. If another
+ * driver takes over ownership of the aperture, aperture helpers will then
+ * unregister the coreboot device automatically. All acquired apertures are
+ * released automatically when the underlying device goes away.
+ *
+ * The function fails if the aperture, or parts of it, is currently
+ * owned by another device. To evict current owners, callers should use
+ * remove_conflicting_devices() et al. before calling this function.
+ *
+ * Returns:
+ * 0 on success, or a negative errno value otherwise.
+ */
+int devm_aperture_acquire_for_coreboot_device(struct coreboot_device *cbdev,
+					      resource_size_t base,
+					      resource_size_t size)
+{
+	return devm_aperture_acquire(&cbdev->dev, base, size, aperture_detach_coreboot_device);
+}
+EXPORT_SYMBOL(devm_aperture_acquire_for_coreboot_device);
+#endif
+
 static void aperture_detach_platform_device(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 
-	/*
-	 * Remove the device from the device hierarchy. This is the right thing
-	 * to do for firmware-based fb drivers, such as EFI, VESA or VGA. After
-	 * the new driver takes over the hardware, the firmware device's state
-	 * will be lost.
-	 *
-	 * For non-platform devices, a new callback would be required.
-	 *
-	 * If the aperture helpers ever need to handle native drivers, this call
-	 * would only have to unplug the DRM device, so that the hardware device
-	 * stays around after detachment.
-	 */
 	platform_device_unregister(pdev);
 }
 
@@ -264,6 +290,16 @@ static void aperture_detach_devices(resource_size_t base, resource_size_t size)
 		ap->dev = NULL; /* detach from device */
 		list_del(&ap->lh);
 
+		/*
+		 * Remove the device from the device hierarchy. This is the right thing
+		 * to do for firmware-based fb drivers, such as EFI, VESA or VGA. After
+		 * the new driver takes over the hardware, the firmware device's state
+		 * will be lost.
+		 *
+		 * If the aperture helpers ever need to handle native drivers, this call
+		 * would only have to unplug the DRM device, so that the hardware device
+		 * stays around after detachment.
+		 */
 		ap->detach(dev);
 	}
 
diff --git a/include/linux/aperture.h b/include/linux/aperture.h
index 1a9a88b11584..459823f86dc8 100644
--- a/include/linux/aperture.h
+++ b/include/linux/aperture.h
@@ -5,10 +5,17 @@
 
 #include <linux/types.h>
 
+struct coreboot_device;
 struct pci_dev;
 struct platform_device;
 
 #if defined(CONFIG_APERTURE_HELPERS)
+#if defined(CONFIG_GOOGLE_COREBOOT_TABLE)
+int devm_aperture_acquire_for_coreboot_device(struct coreboot_device *cbdev,
+					      resource_size_t base,
+					      resource_size_t size);
+#endif
+
 int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
 					      resource_size_t base,
 					      resource_size_t size);
@@ -20,6 +27,15 @@ int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev);
 
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name);
 #else
+#if defined(CONFIG_GOOGLE_COREBOOT_TABLE)
+static inline int devm_aperture_acquire_for_coreboot_device(struct coreboot_device *cbdev,
+							    resource_size_t base,
+							    resource_size_t size)
+{
+	return 0;
+}
+#endif
+
 static inline int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
 							    resource_size_t base,
 							    resource_size_t size)
-- 
2.52.0

