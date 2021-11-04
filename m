Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C634456CB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 17:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3E76FA07;
	Thu,  4 Nov 2021 16:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CBB6F89B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636042050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMYuAwq2kZGzN5/VuELoMfmwv1F+quUuAIH69GfkwlI=;
 b=bl79Jg/iAi8ilEbepdVxBop68CDNjfTXnJjMxgTTNp2D4bxsp6eUAG5H0Ais8oPzxxlReq
 Xbe+KCFCX65ai3SPOg0dbALTRdu1Fyt7FgsiOHNMxy22NUA2AYlLR0uic0o33+wOSBAMp3
 kLLZtD5G0KxSygcMj0+j4BNN4uTa854=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-xGON60w_PXWH1aPZCubPKw-1; Thu, 04 Nov 2021 12:07:30 -0400
X-MC-Unique: xGON60w_PXWH1aPZCubPKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so526876wrb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 09:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMYuAwq2kZGzN5/VuELoMfmwv1F+quUuAIH69GfkwlI=;
 b=5+7JzEZSd3Pz8h4zYHrpQbRmmhxFb81i8GiWEsajSv6PgfIXV7AiHP9IzopnhcjCks
 583ffg498moPVoQgIPn0lz/gDSpYJx3m8KEf6JRBCgQP5J92uZLXy+dCn6zHM2oXWHld
 Vj7srx+KT6sWp2NpjaAWrd9Olp0yDNnnyD0hEbpZ2vcdi/P+XPGOTs+QPdF44G849XWN
 v5sS5RXMGZhCz2jEJEa3o0HDPSR+u5fcNn4Q3LCeN5G4TwFalnwIv/W5ekq0KlYlIMtE
 I0uAwB/ZSUsRPFXZAxDfdWgGFurGYGHq43hCV91SkgZkkbLlBDJ8appIgZ4L822R+Raq
 MLWg==
X-Gm-Message-State: AOAM533hYPEANEc12UZvgD1YYFSAFA5N0RHV+cpMRReYduXClAewq47g
 TmskifRRLaAnOLnvBuk1hwfdYJnXA7iY6HJaLGXFNhaT5HXjUXVtLoTmxi2dK0jbB7YMJxouUfL
 DsGJa1kXzXNsKMRpYJCkk8HuEmHTS
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr63365898wrx.378.1636042048643; 
 Thu, 04 Nov 2021 09:07:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3dZUVMYHiVPQa0SS/EGiWcDUyY/JHgMR1tCntwMlfogl4Hym6V+DgtrDtWUFpz3Xq+0NcvA==
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr63365863wrx.378.1636042048414; 
 Thu, 04 Nov 2021 09:07:28 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id l18sm5877863wrt.81.2021.11.04.09.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:07:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm: Move nomodeset kernel parameter to the DRM
 subsystem
Date: Thu,  4 Nov 2021 17:07:07 +0100
Message-Id: <20211104160707.1407052-3-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211104160707.1407052-1-javierm@redhat.com>
References: <20211104160707.1407052-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "nomodeset" kernel cmdline parameter is handled by the vgacon driver
but the exported vgacon_text_force() symbol is only used by DRM drivers.

It makes much more sense for the parameter logic to be in the subsystem
of the drivers that are making use of it.

Let's move the vgacon_text_force() function and related logic to the DRM
subsystem. While doing that, rename the function to drm_check_modeset()
which better reflects what the function is really used to test for.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Conditionally build drm_nomodeset.o if CONFIG_VGA_CONSOLE is set.
- Squash patches to move nomodeset logic to DRM and do the renaming.
- Name the function drm_check_modeset() and make it return -ENODEV.

 drivers/gpu/drm/Makefile                |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 -
 drivers/gpu/drm/ast/ast_drv.c           |  1 -
 drivers/gpu/drm/drm_drv.c               |  9 +++++----
 drivers/gpu/drm/drm_nomodeset.c         | 26 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_module.c      |  2 --
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 -
 drivers/gpu/drm/qxl/qxl_drv.c           |  1 -
 drivers/gpu/drm/radeon/radeon_drv.c     |  1 -
 drivers/gpu/drm/tiny/bochs.c            |  1 -
 drivers/gpu/drm/tiny/cirrus.c           |  1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.c    |  1 -
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  1 -
 drivers/video/console/vgacon.c          | 21 --------------------
 include/drm/drm_mode_config.h           |  6 ++++++
 include/linux/console.h                 |  6 ------
 18 files changed, 39 insertions(+), 44 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_nomodeset.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1c41156deb5f..c74810c285af 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -33,6 +33,8 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.
 
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
+obj-$(CONFIG_VGA_CONSOLE) += drm_nomodeset.o
+
 drm_cma_helper-y := drm_gem_cma_helper.o
 obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 7fde40d06181..b4b6993861e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -31,7 +31,6 @@
 #include "amdgpu_drv.h"
 
 #include <drm/drm_pciids.h>
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 802063279b86..6222082c3082 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -26,7 +26,6 @@
  * Authors: Dave Airlie <airlied@redhat.com>
  */
 
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3fb567d62881..80b85b8ea776 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -986,12 +986,13 @@ EXPORT_SYMBOL(drm_dev_set_unique);
  */
 int drm_drv_enabled(const struct drm_driver *driver)
 {
-	if (vgacon_text_force()) {
+	int ret;
+
+	ret = drm_check_modeset();
+	if (ret)
 		DRM_INFO("%s driver is disabled\n", driver->name);
-		return -ENODEV;
-	}
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(drm_drv_enabled);
 
diff --git a/drivers/gpu/drm/drm_nomodeset.c b/drivers/gpu/drm/drm_nomodeset.c
new file mode 100644
index 000000000000..6683e396d2c5
--- /dev/null
+++ b/drivers/gpu/drm/drm_nomodeset.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/types.h>
+
+static bool drm_nomodeset;
+
+int drm_check_modeset(void)
+{
+	return drm_nomodeset ? -ENODEV : 0;
+}
+EXPORT_SYMBOL(drm_check_modeset);
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
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index 45cb3e540eff..c890c1ca20c4 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -4,8 +4,6 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <linux/console.h>
-
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_object.h"
 #include "i915_active.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 2a581094ba2b..8e000cac11ba 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -6,7 +6,6 @@
  *          Dave Airlie
  */
 
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/vmalloc.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 8844d3602d87..bd1456521b7c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -22,7 +22,6 @@
  * Authors: Ben Skeggs
  */
 
-#include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/pci.h>
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 3ac2ef2bf545..ff070ac76111 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -29,7 +29,6 @@
 
 #include "qxl_drv.h"
 
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/vgaarb.h>
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 56d688c04346..f59cc971ec95 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -31,7 +31,6 @@
 
 
 #include <linux/compat.h>
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index ee6b1ff9128b..6e9a31f1a0f3 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#include <linux/console.h>
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 4706c5bc3067..659208d5aef9 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -16,7 +16,6 @@
  * Copyright 1999-2001 Jeff Garzik <jgarzik@pobox.com>
  */
 
-#include <linux/console.h>
 #include <linux/dma-buf-map.h>
 #include <linux/module.h>
 #include <linux/pci.h>
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index e4377c37cf33..b1e63fd543bb 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -7,7 +7,6 @@
  *          Michael Thayer <michael.thayer@oracle.com,
  *          Hans de Goede <hdegoede@redhat.com>
  */
-#include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/vt_kern.h>
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 28200dfba2d1..ba9c0c2f8ae6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -27,7 +27,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/console.h>
 #include <linux/pci.h>
 #include <linux/poll.h>
 #include <linux/wait.h>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 05e9949293d5..115ec9518277 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -25,7 +25,6 @@
  *
  **************************************************************************/
 
-#include <linux/console.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/pci.h>
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index ef9c57ce0906..d4320b147956 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
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
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 48b7de80daf5..18982d3507e4 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -969,4 +969,10 @@ static inline int drm_mode_config_init(struct drm_device *dev)
 void drm_mode_config_reset(struct drm_device *dev);
 void drm_mode_config_cleanup(struct drm_device *dev);
 
+#ifdef CONFIG_VGA_CONSOLE
+extern int drm_check_modeset(void);
+#else
+static inline int drm_check_modeset(void) { return 0; }
+#endif
+
 #endif
diff --git a/include/linux/console.h b/include/linux/console.h
index 20874db50bc8..d4dd8384898b 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
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

