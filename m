Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C6044E76F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 14:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2639888FFB;
	Fri, 12 Nov 2021 13:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF8588E45
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636723973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMXWwiBK3RBqBYcPe7dwG1xZroSv2Emx7glA+9PY+OU=;
 b=WFOfEwybFJ2/TlUXS6kC/GMzg8kKdvUpO4qHKwAbOZDA/16M5IE2JSiud/ymWkPWZhfnIO
 r5fwx/Lv0aBUv7FJbIWxhPS9gADLq91NIPqf5dmoXlA1Gr7Et1rrN7oIEAQ/TMBb4PFi8F
 3xJ4OTA/NPHIJ+4Wmeagddbknq194c4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-I8ySnOwaOZ2tSrzcKkWzpQ-1; Fri, 12 Nov 2021 08:32:52 -0500
X-MC-Unique: I8ySnOwaOZ2tSrzcKkWzpQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso4289663wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gMXWwiBK3RBqBYcPe7dwG1xZroSv2Emx7glA+9PY+OU=;
 b=tqvoauR6eMBIgNu8Nn0oZupN2+pet6/kjd44QzBRcFniDxJCFrSfZknU2GbKapFR4U
 CAjDRFxUgC87+SLcwiW0+NfWhypmh/w8FX/RQswpcHKqtsRUP+MwXe4HVYcwd3AJtR5r
 apfkH6tPP3cMRvJBe7pXIjOCp8O1P18lVGFjQarpEIx809AxVqQ6l0uIXib2yLShs67D
 e0nBakxRK+1R9KIKK6A6rAbo2SDdQdvw8VjrsJhUW3vgwcE3bTCf7Dhyl1WbJNOkMEQe
 8QfYvrMJ3ygeuQy1NAFTUSvTNPWYEl+EfoIEpwmAVM+V76+MDjlrPILFVWXHisE4eZVo
 L4MQ==
X-Gm-Message-State: AOAM532MO+txnSw+f2pawNUrUC5BJpyxqrDxiZu6ObHLsusNw2vcKmHa
 r1nQHKhBbGtmkvq/6Htaml7ZsNwS1/0L8a0dzJNvE05cR+Ev4sXcVVER3iEPB3QwSbCgxTgo5SE
 DyQ2v3S8b9jeXSlQB/h6CkNJd9rpO
X-Received: by 2002:a5d:4107:: with SMTP id l7mr18181415wrp.209.1636723971011; 
 Fri, 12 Nov 2021 05:32:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN5jWm/y+clKDEz5Sg9mI0dcBKVnDcHzYrJ1KIuRHz/enh+HBIh96KNiC2v+8bLM5ypHHl3Q==
X-Received: by 2002:a5d:4107:: with SMTP id l7mr18181370wrp.209.1636723970768; 
 Fri, 12 Nov 2021 05:32:50 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z12sm5733470wrv.78.2021.11.12.05.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:32:50 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] drm: Move nomodeset kernel parameter to the DRM
 subsystem
Date: Fri, 12 Nov 2021 14:32:27 +0100
Message-Id: <20211112133230.1595307-4-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112133230.1595307-1-javierm@redhat.com>
References: <20211112133230.1595307-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "nomodeset" kernel cmdline parameter is handled by the vgacon driver
but the exported vgacon_text_force() symbol is only used by DRM drivers.

It makes much more sense for the parameter logic to be in the subsystem
of the drivers that are making use of it.

Let's move the vgacon_text_force() function and related logic to the DRM
subsystem. While doing that, rename it to drm_firmware_drivers_only() and
make it return true if "nomodeset" was used and false otherwise. This is
a better description of the condition that the drivers are testing for.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---

Changes in v5:
- Rename drm_get_modeset() to drm_firmware_drivers_only().

Changes in v3:
- Drop the drm_drv_enabled() function and just call to drm_get_modeset().
- Make drm_get_modeset() just a getter function and don't return an error.
- Move independent cleanups in drivers as separate preparatory patches.

Changes in v2:
- Conditionally build drm_nomodeset.o if CONFIG_VGA_CONSOLE is set.
- Squash patches to move nomodeset logic to DRM and do the renaming.
- Name the function drm_check_modeset() and make it return -ENODEV.
- Squash patch to add drm_drv_enabled() and make drivers use it.
- Make the drivers changes before moving nomodeset logic to DRM.
- Make drm_drv_enabled() return an errno and -ENODEV if nomodeset.
- Remove debug and error messages in drivers.

 drivers/gpu/drm/Makefile                |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  3 +--
 drivers/gpu/drm/ast/ast_drv.c           |  3 +--
 drivers/gpu/drm/drm_nomodeset.c         | 26 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_module.c      |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  3 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  4 ++--
 drivers/gpu/drm/qxl/qxl_drv.c           |  3 +--
 drivers/gpu/drm/radeon/radeon_drv.c     |  3 +--
 drivers/gpu/drm/tiny/bochs.c            |  3 +--
 drivers/gpu/drm/tiny/cirrus.c           |  4 ++--
 drivers/gpu/drm/vboxvideo/vbox_drv.c    |  3 +--
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  3 +--
 drivers/video/console/vgacon.c          | 21 --------------------
 include/drm/drm_drv.h                   |  5 +++++
 include/linux/console.h                 |  6 ------
 17 files changed, 48 insertions(+), 51 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_nomodeset.c

diff --git drivers/gpu/drm/Makefile drivers/gpu/drm/Makefile
index 1c41156deb5f..c74810c285af 100644
--- drivers/gpu/drm/Makefile
+++ drivers/gpu/drm/Makefile
@@ -33,6 +33,8 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.
 
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
+obj-$(CONFIG_VGA_CONSOLE) += drm_nomodeset.o
+
 drm_cma_helper-y := drm_gem_cma_helper.o
 obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
 
diff --git drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 289d04999ced..fc761087c358 100644
--- drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -31,7 +31,6 @@
 #include "amdgpu_drv.h"
 
 #include <drm/drm_pciids.h>
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
@@ -2514,7 +2513,7 @@ static int __init amdgpu_init(void)
 {
 	int r;
 
-	if (vgacon_text_force())
+	if (drm_firmware_drivers_only())
 		return -EINVAL;
 
 	r = amdgpu_sync_init();
diff --git drivers/gpu/drm/ast/ast_drv.c drivers/gpu/drm/ast/ast_drv.c
index 86d5cd7b6318..6d8613f6fe1c 100644
--- drivers/gpu/drm/ast/ast_drv.c
+++ drivers/gpu/drm/ast/ast_drv.c
@@ -26,7 +26,6 @@
  * Authors: Dave Airlie <airlied@redhat.com>
  */
 
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 
@@ -233,7 +232,7 @@ static struct pci_driver ast_pci_driver = {
 
 static int __init ast_init(void)
 {
-	if (vgacon_text_force() && ast_modeset == -1)
+	if (drm_firmware_drivers_only() && ast_modeset == -1)
 		return -EINVAL;
 
 	if (ast_modeset == 0)
diff --git drivers/gpu/drm/drm_nomodeset.c drivers/gpu/drm/drm_nomodeset.c
new file mode 100644
index 000000000000..287edfb18b5d
--- /dev/null
+++ drivers/gpu/drm/drm_nomodeset.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/types.h>
+
+static bool drm_nomodeset;
+
+bool drm_firmware_drivers_only(void)
+{
+	return drm_nomodeset;
+}
+EXPORT_SYMBOL(drm_firmware_drivers_only);
+
+static int __init disable_modeset(char *str)
+{
+	drm_nomodeset = true;
+
+	pr_warn("You have booted with nomodeset. This means your GPU drivers are DISABLED\n");
+	pr_warn("Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly\n");
+	pr_warn("Unless you actually understand what nomodeset does, you should reboot without enabling it\n");
+
+	return 1;
+}
+
+/* Disable kernel modesetting */
+__setup("nomodeset", disable_modeset);
diff --git drivers/gpu/drm/i915/i915_module.c drivers/gpu/drm/i915/i915_module.c
index ab2295dd4500..1df66bf276ce 100644
--- drivers/gpu/drm/i915/i915_module.c
+++ drivers/gpu/drm/i915/i915_module.c
@@ -4,7 +4,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <linux/console.h>
+#include <drm/drm_drv.h>
 
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_object.h"
@@ -31,7 +31,7 @@ static int i915_check_nomodeset(void)
 	if (i915_modparams.modeset == 0)
 		use_kms = false;
 
-	if (vgacon_text_force() && i915_modparams.modeset == -1)
+	if (drm_firmware_drivers_only() && i915_modparams.modeset == -1)
 		use_kms = false;
 
 	if (!use_kms) {
diff --git drivers/gpu/drm/mgag200/mgag200_drv.c drivers/gpu/drm/mgag200/mgag200_drv.c
index 6b9243713b3c..740108a006ba 100644
--- drivers/gpu/drm/mgag200/mgag200_drv.c
+++ drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -6,7 +6,6 @@
  *          Dave Airlie
  */
 
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/vmalloc.h>
@@ -378,7 +377,7 @@ static struct pci_driver mgag200_pci_driver = {
 
 static int __init mgag200_init(void)
 {
-	if (vgacon_text_force() && mgag200_modeset == -1)
+	if (drm_firmware_drivers_only() && mgag200_modeset == -1)
 		return -EINVAL;
 
 	if (mgag200_modeset == 0)
diff --git drivers/gpu/drm/nouveau/nouveau_drm.c drivers/gpu/drm/nouveau/nouveau_drm.c
index 1f828c9f691c..b8158064c377 100644
--- drivers/gpu/drm/nouveau/nouveau_drm.c
+++ drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -22,7 +22,6 @@
  * Authors: Ben Skeggs
  */
 
-#include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -32,6 +31,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_vblank.h>
@@ -1322,7 +1322,7 @@ nouveau_drm_init(void)
 	nouveau_display_options();
 
 	if (nouveau_modeset == -1) {
-		if (vgacon_text_force())
+		if (drm_firmware_drivers_only())
 			nouveau_modeset = 0;
 	}
 
diff --git drivers/gpu/drm/qxl/qxl_drv.c drivers/gpu/drm/qxl/qxl_drv.c
index fc47b0deb021..e4b16421500b 100644
--- drivers/gpu/drm/qxl/qxl_drv.c
+++ drivers/gpu/drm/qxl/qxl_drv.c
@@ -29,7 +29,6 @@
 
 #include "qxl_drv.h"
 
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/vgaarb.h>
@@ -295,7 +294,7 @@ static struct drm_driver qxl_driver = {
 
 static int __init qxl_init(void)
 {
-	if (vgacon_text_force() && qxl_modeset == -1)
+	if (drm_firmware_drivers_only() && qxl_modeset == -1)
 		return -EINVAL;
 
 	if (qxl_modeset == 0)
diff --git drivers/gpu/drm/radeon/radeon_drv.c drivers/gpu/drm/radeon/radeon_drv.c
index 380adc61e71c..956c72b5aa33 100644
--- drivers/gpu/drm/radeon/radeon_drv.c
+++ drivers/gpu/drm/radeon/radeon_drv.c
@@ -31,7 +31,6 @@
 
 
 #include <linux/compat.h>
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
@@ -637,7 +636,7 @@ static struct pci_driver radeon_kms_pci_driver = {
 
 static int __init radeon_module_init(void)
 {
-	if (vgacon_text_force() && radeon_modeset == -1)
+	if (drm_firmware_drivers_only() && radeon_modeset == -1)
 		radeon_modeset = 0;
 
 	if (radeon_modeset == 0)
diff --git drivers/gpu/drm/tiny/bochs.c drivers/gpu/drm/tiny/bochs.c
index 2ce3bd903b70..fc26a1ce11ee 100644
--- drivers/gpu/drm/tiny/bochs.c
+++ drivers/gpu/drm/tiny/bochs.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#include <linux/console.h>
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
@@ -719,7 +718,7 @@ static struct pci_driver bochs_pci_driver = {
 
 static int __init bochs_init(void)
 {
-	if (vgacon_text_force() && bochs_modeset == -1)
+	if (drm_firmware_drivers_only() && bochs_modeset == -1)
 		return -EINVAL;
 
 	if (bochs_modeset == 0)
diff --git drivers/gpu/drm/tiny/cirrus.c drivers/gpu/drm/tiny/cirrus.c
index 9327001d35dd..c95d9ff7d600 100644
--- drivers/gpu/drm/tiny/cirrus.c
+++ drivers/gpu/drm/tiny/cirrus.c
@@ -16,7 +16,6 @@
  * Copyright 1999-2001 Jeff Garzik <jgarzik@pobox.com>
  */
 
-#include <linux/console.h>
 #include <linux/dma-buf-map.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -636,8 +635,9 @@ static struct pci_driver cirrus_pci_driver = {
 
 static int __init cirrus_init(void)
 {
-	if (vgacon_text_force())
+	if (drm_firmware_drivers_only())
 		return -EINVAL;
+
 	return pci_register_driver(&cirrus_pci_driver);
 }
 
diff --git drivers/gpu/drm/vboxvideo/vbox_drv.c drivers/gpu/drm/vboxvideo/vbox_drv.c
index fd7abb029c65..f35d9e44c6b7 100644
--- drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -7,7 +7,6 @@
  *          Michael Thayer <michael.thayer@oracle.com,
  *          Hans de Goede <hdegoede@redhat.com>
  */
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/vt_kern.h>
@@ -193,7 +192,7 @@ static const struct drm_driver driver = {
 
 static int __init vbox_init(void)
 {
-	if (vgacon_text_force() && vbox_modeset == -1)
+	if (drm_firmware_drivers_only() && vbox_modeset == -1)
 		return -EINVAL;
 
 	if (vbox_modeset == 0)
diff --git drivers/gpu/drm/virtio/virtgpu_drv.c drivers/gpu/drm/virtio/virtgpu_drv.c
index 749db18dcfa2..81eab9be57ea 100644
--- drivers/gpu/drm/virtio/virtgpu_drv.c
+++ drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -27,7 +27,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/console.h>
 #include <linux/pci.h>
 #include <linux/poll.h>
 #include <linux/wait.h>
@@ -104,7 +103,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 	struct drm_device *dev;
 	int ret;
 
-	if (vgacon_text_force() && virtio_gpu_modeset == -1)
+	if (drm_firmware_drivers_only() && virtio_gpu_modeset == -1)
 		return -EINVAL;
 
 	if (virtio_gpu_modeset == 0)
diff --git drivers/gpu/drm/vmwgfx/vmwgfx_drv.c drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index ab9a1750e1df..695b0ec725cd 100644
--- drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -25,7 +25,6 @@
  *
  **************************************************************************/
 
-#include <linux/console.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -1651,7 +1650,7 @@ static int __init vmwgfx_init(void)
 {
 	int ret;
 
-	if (vgacon_text_force())
+	if (drm_firmware_drivers_only())
 		return -EINVAL;
 
 	ret = pci_register_driver(&vmw_pci_driver);
diff --git drivers/video/console/vgacon.c drivers/video/console/vgacon.c
index ef9c57ce0906..d4320b147956 100644
--- drivers/video/console/vgacon.c
+++ drivers/video/console/vgacon.c
@@ -97,30 +97,9 @@ static int 		vga_video_font_height;
 static int 		vga_scan_lines		__read_mostly;
 static unsigned int 	vga_rolled_over; /* last vc_origin offset before wrap */
 
-static bool vgacon_text_mode_force;
 static bool vga_hardscroll_enabled;
 static bool vga_hardscroll_user_enable = true;
 
-bool vgacon_text_force(void)
-{
-	return vgacon_text_mode_force;
-}
-EXPORT_SYMBOL(vgacon_text_force);
-
-static int __init text_mode(char *str)
-{
-	vgacon_text_mode_force = true;
-
-	pr_warn("You have booted with nomodeset. This means your GPU drivers are DISABLED\n");
-	pr_warn("Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly\n");
-	pr_warn("Unless you actually understand what nomodeset does, you should reboot without enabling it\n");
-
-	return 1;
-}
-
-/* force text mode - used by kernel modesetting */
-__setup("nomodeset", text_mode);
-
 static int __init no_scroll(char *str)
 {
 	/*
diff --git include/drm/drm_drv.h include/drm/drm_drv.h
index a84eb4028e5b..89e26a732175 100644
--- include/drm/drm_drv.h
+++ include/drm/drm_drv.h
@@ -601,5 +601,10 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
 
 int drm_dev_set_unique(struct drm_device *dev, const char *name);
 
+#ifdef CONFIG_VGA_CONSOLE
+extern bool drm_firmware_drivers_only(void);
+#else
+static inline bool drm_firmware_drivers_only(void) { return false; }
+#endif
 
 #endif
diff --git include/linux/console.h include/linux/console.h
index 20874db50bc8..d4dd8384898b 100644
--- include/linux/console.h
+++ include/linux/console.h
@@ -217,12 +217,6 @@ extern atomic_t ignore_console_lock_warning;
 #define VESA_HSYNC_SUSPEND      2
 #define VESA_POWERDOWN          3
 
-#ifdef CONFIG_VGA_CONSOLE
-extern bool vgacon_text_force(void);
-#else
-static inline bool vgacon_text_force(void) { return false; }
-#endif
-
 extern void console_init(void);
 
 /* For deferred console takeover */
-- 
2.33.1

