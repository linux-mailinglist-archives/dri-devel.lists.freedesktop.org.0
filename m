Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59674F608
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 18:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4685E10E0EB;
	Tue, 11 Jul 2023 16:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-43.mta1.migadu.com (out-43.mta1.migadu.com
 [IPv6:2001:41d0:203:375::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AB310E3FC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 16:48:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689093806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3RR0NYHlYchGZfrgsz7DmY+bKmfwkFHz2pu3a35dQQ=;
 b=I5qtNN0Jv0yHnIw8B0ZM96XkL6ofHnJuNvasaGbT3c0CVhy4JVql7lhBIKJ0a88pTkuhtr
 GI3YR/MbqyrF8nt9Trbqmz9FfuxH7ds+Ggs9yRPeUKr3JLALf2q+ykJMIcSd81gBIbYW8I
 qdfJeJA7PWO6a4kHkGs3M6fPaFjedmA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH v3 1/9] video/aperture: Add a helper to detect if an aperture
 contains firmware FB
Date: Wed, 12 Jul 2023 00:43:02 +0800
Message-Id: <20230711164310.791756-2-sui.jingfeng@linux.dev>
In-Reply-To: <20230711164310.791756-1-sui.jingfeng@linux.dev>
References: <20230711164310.791756-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

This patch adds the aperture_contain_firmware_fb() function to do the
determination. Unfortunately, due to the fact that the apertures list
will be freed dynamically, the location and size information of the
firmware FB will be lost after dedicated drivers call
aperture_remove_conflicting_devices(),
aperture_remove_conflicting_pci_devices() or
aperture_remove_all_conflicting_devices() functions
    
We solve this problem by introducing two static variables that record the
firmware framebuffer's start addrness and end addrness. It assumes that the
system has only one active firmware framebuffer driver at a time. We don't
use the global structure screen_info here, because PCI resources may get
reallocated (the VRAM BAR could be moved) during the kernel boot stage.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/drm_aperture.c | 16 ++++++++++++++++
 drivers/video/aperture.c       | 29 +++++++++++++++++++++++++++++
 include/drm/drm_aperture.h     |  2 ++
 include/linux/aperture.h       |  7 +++++++
 4 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 5729f3bb4398..f9c957aa5874 100644
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
+ * true if there exist a firmware framebuffer inside of the aperture passed in,
+ * or false otherwise.
+ */
+bool drm_aperture_contain_firmware_fb(resource_size_t base, resource_size_t size)
+{
+	return aperture_contain_firmware_fb(base, base + size);
+}
+EXPORT_SYMBOL(drm_aperture_contain_firmware_fb);
diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 561be8feca96..34eb962cfae8 100644
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
+ * true if there is a firmware framebuffer belong to the aperture passed in,
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

