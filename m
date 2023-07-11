Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711A74F54D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 18:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EA510E3ED;
	Tue, 11 Jul 2023 16:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-61.mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE53A10E3EF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 16:32:25 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689093143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBy5pJ1hlnJ55l3+0FoW8CoU4fx5kPQd0O17NeAPNiY=;
 b=KYZlRghveBlPMMdTqgJuH2AOo5abl3+OkOVDjyy45nGSjfPLiaDVmnhOlljKyx8oMCa60y
 d7BFmREY8tPS1z9BIqw+xfPILjT53tOeW9fmTmFDOC4vkTkMTAw4mABB/S2iui/+v/n05V
 4vY56OUQGLAxs6SUJ/Lz8uxkPskosok=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Helge Deller <deller@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v3 2/9] video/aperture: Add a helper for determining if an
 unmoved aperture contain FB
Date: Wed, 12 Jul 2023 00:31:48 +0800
Message-Id: <20230711163155.791522-3-sui.jingfeng@linux.dev>
In-Reply-To: <20230711163155.791522-1-sui.jingfeng@linux.dev>
References: <20230711163155.791522-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
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
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

This patch is intended to form a uniform approach to determining if an
unmoved aperture contains the firmware FB. I believe that the global
screen_info is more about video-specific things.

Putting it in video/aperture.c helps form a uniform approach.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/video/aperture.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/aperture.h |  7 +++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 34eb962cfae8..f03dfcabc303 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -6,6 +6,7 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/screen_info.h>
 #include <linux/slab.h>
 #include <linux/sysfb.h>
 #include <linux/types.h>
@@ -406,3 +407,38 @@ bool aperture_contain_firmware_fb(resource_size_t ap_start, resource_size_t ap_e
 	return false;
 }
 EXPORT_SYMBOL(aperture_contain_firmware_fb);
+
+/**
+ * aperture_contain_firmware_fb_nonreloc - Detect if the firmware framebuffer
+ * belong to a non-relocatable aperture, such as the aperture of platform
+ * device. Note that this function relay on the global screen info.
+ * @ap_start: the aperture's start address in physical memory
+ * @ap_end: the aperture's end address in physical memory
+ *
+ * Returns:
+ * true if there is a firmware framebuffer belong to the aperture passed in,
+ * or false otherwise.
+ */
+bool aperture_contain_firmware_fb_nonreloc(resource_size_t ap_start, resource_size_t ap_end)
+{
+	u64 fb_start;
+	u64 fb_end;
+
+	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE) {
+		fb_start = (u64)screen_info.ext_lfb_base << 32 | screen_info.lfb_base;
+		fb_end = fb_start + screen_info.lfb_size;
+	} else {
+		fb_start = screen_info.lfb_base;
+		fb_end = fb_start + screen_info.lfb_size;
+	}
+
+	/* No firmware framebuffer support */
+	if (!fb_start || !fb_end)
+		return false;
+
+	if (fb_start >= ap_start && fb_end <= ap_end)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL(aperture_contain_firmware_fb_nonreloc);
diff --git a/include/linux/aperture.h b/include/linux/aperture.h
index d4dc5917c49b..906d23532b56 100644
--- a/include/linux/aperture.h
+++ b/include/linux/aperture.h
@@ -21,6 +21,8 @@ int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev);
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name);
 
 bool aperture_contain_firmware_fb(resource_size_t ap_start, resource_size_t ap_end);
+
+bool aperture_contain_firmware_fb_nonreloc(resource_size_t ap_start, resource_size_t ap_end);
 #else
 static inline int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
 							    resource_size_t base,
@@ -49,6 +51,11 @@ static inline bool aperture_contain_firmware_fb(resource_size_t ap_start, resour
 {
 	return false;
 }
+
+static bool aperture_contain_firmware_fb_nonreloc(resource_size_t ap_start, resource_size_t ap_end)
+{
+	return false;
+}
 #endif
 
 /**
-- 
2.25.1

