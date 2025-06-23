Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C5EAE4D03
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 20:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7A710E2A2;
	Mon, 23 Jun 2025 18:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FlkMMZKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D5B10E296
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 18:48:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A192F442EE;
 Mon, 23 Jun 2025 18:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67266C4CEF2;
 Mon, 23 Jun 2025 18:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750704507;
 bh=g0M2DgNSBrZnHKAamPsJaiVPp+me19vm+3rXOtUbK/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FlkMMZKxXH4xc4d/NdzCCYVUetE3wjUW1moJk+VXz2ScXAxwhw4X/eBTRPOEUiySb
 xpMzQsa5eZBih7XLT6A+uzq868tEhMg39SD3aOBE2tB91mCIeTvz47jq3DkqOonftl
 CnMa/QMh/IU4uJlRZhEKFUj4Q8XAOfQ83FBfEJadeNboHj/cZSbv6w0L89rcqiMT1D
 lBTSaQfCUP/Uq75Q1KyiENvNd166/Bx8SPFKoWsV4VOIvt6ARbV0keyauZrrPSYECw
 Dga5ESJrQILf4NHNBcXkHLYpJ6B8VrSDgL6l9ttNg5FJhtQ2/Pj5d/Jxk7tDR2UbWZ
 h3MyOb0LfkFJw==
From: Mario Limonciello <superm1@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 iommu@lists.linux.dev (open list:INTEL IOMMU (VT-d)),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 kvm@vger.kernel.org (open list:VFIO DRIVER),
 linux-sound@vger.kernel.org (open list:SOUND),
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v4 8/8] PCI: Add a new 'boot_display' attribute
Date: Mon, 23 Jun 2025 13:47:57 -0500
Message-ID: <20250623184757.3774786-9-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623184757.3774786-1-superm1@kernel.org>
References: <20250623184757.3774786-1-superm1@kernel.org>
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

On systems with multiple GPUs there can be uncertainty which GPU is the
primary one used to drive the display at bootup. In order to disambiguate
this add a new sysfs attribute 'boot_display' that uses the output of
video_is_primary_device() to populate whether a PCI device was used for
driving the display.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4:
 * new patch
---
 Documentation/ABI/testing/sysfs-bus-pci |  9 +++++++++
 drivers/pci/pci-sysfs.c                 | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/Documentation/ABI/testing/sysfs-bus-pci
index 69f952fffec72..2e6f85fbe2e2e 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci
+++ b/Documentation/ABI/testing/sysfs-bus-pci
@@ -612,3 +612,12 @@ Description:
 
 		  # ls doe_features
 		  0001:01        0001:02        doe_discovery
+
+What:		/sys/bus/pci/devices/.../boot_display
+Date:		October 2025
+Contact:	Linux PCI developers <linux-pci@vger.kernel.org>
+Description:
+		This file indicates whether the device was used as a boot
+		display. If the device was used as the boot display, the file
+		will contain "1". If the device is a display device but wasn't
+		used as a boot display, the file will contain "0".
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 268c69daa4d57..5bbf79b1b953d 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -30,6 +30,7 @@
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/aperture.h>
+#include <asm/video.h>
 #include "pci.h"
 
 #ifndef ARCH_PCI_DEV_GROUPS
@@ -679,6 +680,13 @@ const struct attribute_group *pcibus_groups[] = {
 	NULL,
 };
 
+static ssize_t boot_display_show(struct device *dev, struct device_attribute *attr,
+				 char *buf)
+{
+	return sysfs_emit(buf, "%u\n", video_is_primary_device(dev));
+}
+static DEVICE_ATTR_RO(boot_display);
+
 static ssize_t boot_vga_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
@@ -1698,6 +1706,7 @@ late_initcall(pci_sysfs_init);
 
 static struct attribute *pci_dev_dev_attrs[] = {
 	&dev_attr_boot_vga.attr,
+	&dev_attr_boot_display.attr,
 	NULL,
 };
 
@@ -1710,6 +1719,11 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
 	if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
 		return a->mode;
 
+#ifdef CONFIG_VIDEO
+	if (a == &dev_attr_boot_display.attr && pci_is_display(pdev))
+		return a->mode;
+#endif
+
 	return 0;
 }
 
-- 
2.43.0

