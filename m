Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D1DB0CABE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 20:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C7710E2C9;
	Mon, 21 Jul 2025 18:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mqXQJH0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9776110E2C9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 18:57:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 769E35C60EE;
 Mon, 21 Jul 2025 18:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B6EC4CEF4;
 Mon, 21 Jul 2025 18:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753124251;
 bh=3u19+HJbqZLGOkvO9EOVcJxRBd+pyMHDYhsiKgTxEtk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mqXQJH0tXgQZIPE5fhuL/ULHSjaem2QXkQJoDZmcqrVweiw3bR2jcKnEHqTWQxWxx
 0eRATsmQX8XMqP8YY1+YzL+tAx7zYq68IqbQRVzqmhxXa6PCFwVP1SLIJgRAxHvKwB
 zysbiLIZU2NLn841wk7vl7FFa9BUgpK9NBRfVla/tqqHarTZJ3YkpTYg0qWpqkpgjV
 pqcqvm0g83ituE+LgGUIrRvdg1gDhDkP0OXXVYj6WCfYlQwQ57fAS34j4Xa5um/Hzl
 to1nyf9loSMGGjhPSLh7mmMCq8LyZ2WJaazcpInzRvTpAJD00G7KqGZgbngwvYWUUN
 f8Q5Nc+HTY4Mg==
From: Mario Limonciello <superm1@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v4 1/1] PCI: Move boot display attribute to DRM
Date: Mon, 21 Jul 2025 13:57:26 -0500
Message-ID: <20250721185726.1264909-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721185726.1264909-1-superm1@kernel.org>
References: <20250721185726.1264909-1-superm1@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

The boot_display attribute is currently created by PCI core, but the
main reason it exists is for userspace software that interacts with
drm to make decisions. Move the attribute to DRM.

This also fixes a compilation failure when compiled without
CONFIG_VIDEO on sparc.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250718224118.5b3f22b0@canb.auug.org.au/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 Documentation/ABI/testing/sysfs-bus-pci   |  9 -----
 Documentation/ABI/testing/sysfs-class-drm |  8 ++++
 drivers/gpu/drm/drm_sysfs.c               | 41 +++++++++++++++++++++
 drivers/pci/pci-sysfs.c                   | 45 -----------------------
 4 files changed, 49 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-drm

diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/Documentation/ABI/testing/sysfs-bus-pci
index a2c74d4ebeadd..69f952fffec72 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci
+++ b/Documentation/ABI/testing/sysfs-bus-pci
@@ -612,12 +612,3 @@ Description:
 
 		  # ls doe_features
 		  0001:01        0001:02        doe_discovery
-
-What:		/sys/bus/pci/devices/.../boot_display
-Date:		October 2025
-Contact:	Linux PCI developers <linux-pci@vger.kernel.org>
-Description:
-		This file indicates that displays connected to the device were
-		used to display the boot sequence.  If a display connected to
-		the device was used to display the boot sequence the file will
-		be present and contain "1".
diff --git a/Documentation/ABI/testing/sysfs-class-drm b/Documentation/ABI/testing/sysfs-class-drm
new file mode 100644
index 0000000000000..536820afca05b
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-drm
@@ -0,0 +1,8 @@
+What:		/sys/class/drm/.../boot_display
+Date:		October 2025
+Contact:	Linux DRI developers <dri-devel@vger.kernel.org>
+Description:
+		This file indicates that displays connected to the device were
+		used to display the boot sequence.  If a display connected to
+		the device was used to display the boot sequence the file will
+		be present and contain "1".
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 60c1f26edb6fa..1bc2e6abaa1a9 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -18,6 +18,7 @@
 #include <linux/gfp.h>
 #include <linux/i2c.h>
 #include <linux/kdev_t.h>
+#include <linux/pci.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 
@@ -30,6 +31,8 @@
 #include <drm/drm_property.h>
 #include <drm/drm_sysfs.h>
 
+#include <asm/video.h>
+
 #include "drm_internal.h"
 #include "drm_crtc_internal.h"
 
@@ -508,6 +511,43 @@ void drm_sysfs_connector_property_event(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_sysfs_connector_property_event);
 
+static ssize_t boot_display_show(struct device *dev, struct device_attribute *attr,
+				 char *buf)
+{
+	return sysfs_emit(buf, "1\n");
+}
+static DEVICE_ATTR_RO(boot_display);
+
+static struct attribute *display_attrs[] = {
+	&dev_attr_boot_display.attr,
+	NULL
+};
+
+static umode_t boot_display_visible(struct kobject *kobj,
+				    struct attribute *a, int n)
+{
+	struct device *dev = kobj_to_dev(kobj)->parent;
+
+	if (dev_is_pci(dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+
+		if (video_is_primary_device(&pdev->dev))
+			return a->mode;
+	}
+
+	return 0;
+}
+
+static const struct attribute_group display_attr_group = {
+	.attrs = display_attrs,
+	.is_visible = boot_display_visible,
+};
+
+static const struct attribute_group *card_dev_groups[] = {
+	&display_attr_group,
+	NULL
+};
+
 struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 {
 	const char *minor_str;
@@ -531,6 +571,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 
 		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
 		kdev->class = drm_class;
+		kdev->groups = card_dev_groups;
 		kdev->type = &drm_sysfs_device_minor;
 	}
 
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 6ccd65f5b1051..b3fb6024e0ba7 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -680,13 +680,6 @@ const struct attribute_group *pcibus_groups[] = {
 	NULL,
 };
 
-static ssize_t boot_display_show(struct device *dev,
-				 struct device_attribute *attr, char *buf)
-{
-	return sysfs_emit(buf, "1\n");
-}
-static DEVICE_ATTR_RO(boot_display);
-
 static ssize_t boot_vga_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
@@ -1059,37 +1052,6 @@ void pci_remove_legacy_files(struct pci_bus *b)
 }
 #endif /* HAVE_PCI_LEGACY */
 
-/**
- * pci_create_boot_display_file - create "boot_display"
- * @pdev: dev in question
- *
- * Create "boot_display" in sysfs for the PCI device @pdev if it is the
- * boot display device.
- */
-static int pci_create_boot_display_file(struct pci_dev *pdev)
-{
-#ifdef CONFIG_VIDEO
-	if (video_is_primary_device(&pdev->dev))
-		return sysfs_create_file(&pdev->dev.kobj, &dev_attr_boot_display.attr);
-#endif
-	return 0;
-}
-
-/**
- * pci_remove_boot_display_file - remove "boot_display"
- * @pdev: dev in question
- *
- * Remove "boot_display" in sysfs for the PCI device @pdev if it is the
- * boot display device.
- */
-static void pci_remove_boot_display_file(struct pci_dev *pdev)
-{
-#ifdef CONFIG_VIDEO
-	if (video_is_primary_device(&pdev->dev))
-		sysfs_remove_file(&pdev->dev.kobj, &dev_attr_boot_display.attr);
-#endif
-}
-
 #if defined(HAVE_PCI_MMAP) || defined(ARCH_GENERIC_PCI_MMAP_RESOURCE)
 /**
  * pci_mmap_resource - map a PCI resource into user memory space
@@ -1693,15 +1655,9 @@ static const struct attribute_group pci_dev_resource_resize_group = {
 
 int __must_check pci_create_sysfs_dev_files(struct pci_dev *pdev)
 {
-	int retval;
-
 	if (!sysfs_initialized)
 		return -EACCES;
 
-	retval = pci_create_boot_display_file(pdev);
-	if (retval)
-		return retval;
-
 	return pci_create_resource_files(pdev);
 }
 
@@ -1716,7 +1672,6 @@ void pci_remove_sysfs_dev_files(struct pci_dev *pdev)
 	if (!sysfs_initialized)
 		return;
 
-	pci_remove_boot_display_file(pdev);
 	pci_remove_resource_files(pdev);
 }
 
-- 
2.43.0

