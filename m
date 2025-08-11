Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A042FB211CF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 18:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC7410E527;
	Mon, 11 Aug 2025 16:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JA8t82pJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F0110E527
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 16:26:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5290D61446;
 Mon, 11 Aug 2025 16:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD920C4CEF5;
 Mon, 11 Aug 2025 16:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754929578;
 bh=8oRjOADqIdvBLd9hq9nnySSZk2IXEYoBELHbgdaVSds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JA8t82pJkPjKwB+BlXaucrt1METmOINHLzIeCi5xMpoqQNjpu407Y4+1s1PVvGv2V
 LNyfzFvh9geK+9rERIb7bSQ0nja/LGjn9o+0grASJUUUkVWHORObFrmNYRMpYwqpYH
 xvEbIAxj0YmfIow5lZPs/mH5fvq/62BdgqocYSzg2ofgoN3YmefAAlj1PUGXp+1GZc
 OthtooKItDvn584oVD62xdZ5LVZYkeAqk1Sk8k9HJxDbM7OheAEODvrZjd9bt//ZNT
 OdlC5VBSSB3H/H8aA5PfwXNJPEA4dl/f4sUeCZEZZkGhd7uaDVjlLX8G6xozUJjEgV
 KcKLzbiFqD56Q==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
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
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v10 4/4] DRM: Add a new 'boot_display' attribute
Date: Mon, 11 Aug 2025 11:26:06 -0500
Message-ID: <20250811162606.587759-5-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811162606.587759-1-superm1@kernel.org>
References: <20250811162606.587759-1-superm1@kernel.org>
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

On systems with multiple GPUs there can be uncertainty which GPU is the
primary one used to drive the display at bootup. In some desktop
environments this can lead to increased power consumption because
secondary GPUs may be used for rendering and never go to a low power
state. In order to disambiguate this add a new sysfs attribute
'boot_display' that uses the output of video_is_primary_device() to
populate whether the PCI device was used for driving the display.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/issues/23
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v10:
 * Rebase on 6.17-rc1
 * Drop Thomas' tag, as this is now in a totally different subsystem
   (although same code)
 * Squash "Adjust visibility of boot_display attribute instead of creation"
 * Squash "PCI: Move boot display attribute to DRM"
---
 Documentation/ABI/testing/sysfs-class-drm |  8 +++++
 drivers/gpu/drm/drm_sysfs.c               | 41 +++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-drm

diff --git a/Documentation/ABI/testing/sysfs-class-drm b/Documentation/ABI/testing/sysfs-class-drm
new file mode 100644
index 0000000000000..d23fed5e29a74
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-drm
@@ -0,0 +1,8 @@
+What:		/sys/class/drm/.../boot_display
+Date:		January 2026
+Contact:	Linux DRI developers <dri-devel@vger.kernel.org>
+Description:
+		This file indicates that displays connected to the device were
+		used to display the boot sequence.  If a display connected to
+		the device was used to display the boot sequence the file will
+		be present and contain "1".
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index a455c56dbbeb7..b01ffa4d65098 100644
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
 
-- 
2.43.0

