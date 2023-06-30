Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76A743A09
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6C210E43A;
	Fri, 30 Jun 2023 10:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 60E5910E43D;
 Fri, 30 Jun 2023 10:58:00 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxPMc3tZ5klUQEAA--.6834S3;
 Fri, 30 Jun 2023 18:57:59 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxJ801tZ5k5GETAA--.63992S3; 
 Fri, 30 Jun 2023 18:57:58 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v1 1/4] video/aperture: Add a helper to detect if an aperture
 contains firmware FB
Date: Fri, 30 Jun 2023 18:57:54 +0800
Message-Id: <20230630105757.141582-2-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230630105757.141582-1-suijingfeng@loongson.cn>
References: <20230630105757.141582-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxJ801tZ5k5GETAA--.63992S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WF1UKFW5JrWrArW8Zr4fJFc_yoW7CFWrpF
 sxAFZ8Gr4UKF1Fyay3CrW09r1rXa1SgFWrW39xA3s3AF47CFykAr17AFykJrZxJrZrAFya
 gFsxtryrCa1DAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
 6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
 vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4Xo7DUUUU
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds the aperture_contain_firmware_fb() function to do the
determination. Unfortunately due to the fact that apertures list will be
freed dynamically, the location and size information of the firmware fb
will be lost after dedicated drivers call
aperture_remove_conflicting_devices(),
aperture_remove_conflicting_pci_devices() or
aperture_remove_all_conflicting_devices() functions

We handle this problem by introducing two static variables which record the
firmware framebuffer's start addrness and end addrness. It assumes that the
system has only one active firmware framebuffer driver at a time.

We don't use the global structure screen_info here, because PCI resource
may get reallocated(the VRAM BAR could be moved) at kernel boot stage.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/drm_aperture.c | 16 ++++++++++++++++
 drivers/video/aperture.c       | 29 +++++++++++++++++++++++++++++
 include/drm/drm_aperture.h     |  2 ++
 include/linux/aperture.h       |  7 +++++++
 4 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 5729f3bb4398..6e5d8a08683c 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -190,3 +190,19 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 	return aperture_remove_conflicting_pci_devices(pdev, req_driver->name);
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);
+
+/**
+ * drm_aperture_contain_firmware_fb - Determine if a aperture contains firmware framebuffer
+ *
+ * @base: the aperture's base address in physical memory
+ * @size: aperture size in bytes
+ *
+ * Returns:
+ * true on if there is a firmware framebuffer belong to the aperture passed in,
+ * or false otherwise.
+ */
+bool drm_aperture_contain_firmware_fb(resource_size_t base, resource_size_t size)
+{
+	return aperture_contain_firmware_fb(base, base + size);
+}
+EXPORT_SYMBOL(drm_aperture_contain_firmware_fb);
diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 561be8feca96..5a5422cec669 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -141,6 +141,9 @@ struct aperture_range {
 static LIST_HEAD(apertures);
 static DEFINE_MUTEX(apertures_lock);
 
+static resource_size_t firm_fb_start;
+static resource_size_t firm_fb_end;
+
 static bool overlap(resource_size_t base1, resource_size_t end1,
 		    resource_size_t base2, resource_size_t end2)
 {
@@ -170,6 +173,9 @@ static int devm_aperture_acquire(struct device *dev,
 
 	mutex_lock(&apertures_lock);
 
+	firm_fb_start = base;
+	firm_fb_end = end;
+
 	list_for_each(pos, &apertures) {
 		ap = container_of(pos, struct aperture_range, lh);
 		if (overlap(base, end, ap->base, ap->base + ap->size)) {
@@ -377,3 +383,26 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 
 }
 EXPORT_SYMBOL(aperture_remove_conflicting_pci_devices);
+
+/**
+ * aperture_contain_firmware_fb - Detect if the firmware framebuffer belong to
+ *                                a aperture.
+ * @ap_start: the aperture's start address in physical memory
+ * @ap_end: the aperture's end address in physical memory
+ *
+ * Returns:
+ * true on if there is a firmware framebuffer belong to the aperture passed in,
+ * or false otherwise.
+ */
+bool aperture_contain_firmware_fb(resource_size_t ap_start, resource_size_t ap_end)
+{
+	/* No firmware framebuffer support */
+	if (!firm_fb_start || !firm_fb_end)
+		return false;
+
+	if (firm_fb_start >= ap_start && firm_fb_end <= ap_end)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL(aperture_contain_firmware_fb);
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
index cbe33b49fd5d..6a0b9bacb081 100644
--- a/include/drm/drm_aperture.h
+++ b/include/drm/drm_aperture.h
@@ -35,4 +35,6 @@ drm_aperture_remove_framebuffers(const struct drm_driver *req_driver)
 							    req_driver);
 }
 
+bool drm_aperture_contain_firmware_fb(resource_size_t base, resource_size_t size);
+
 #endif
diff --git a/include/linux/aperture.h b/include/linux/aperture.h
index 1a9a88b11584..d4dc5917c49b 100644
--- a/include/linux/aperture.h
+++ b/include/linux/aperture.h
@@ -19,6 +19,8 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev);
 
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name);
+
+bool aperture_contain_firmware_fb(resource_size_t ap_start, resource_size_t ap_end);
 #else
 static inline int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
 							    resource_size_t base,
@@ -42,6 +44,11 @@ static inline int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev,
 {
 	return 0;
 }
+
+static inline bool aperture_contain_firmware_fb(resource_size_t ap_start, resource_size_t ap_end)
+{
+	return false;
+}
 #endif
 
 /**
-- 
2.25.1

