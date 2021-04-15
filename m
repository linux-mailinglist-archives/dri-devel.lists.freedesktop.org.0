Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214D3607E0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 13:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21336E170;
	Thu, 15 Apr 2021 11:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B86C6E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 11:00:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8AA0CAF0D;
 Thu, 15 Apr 2021 11:00:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, marex@denx.de, stefan@agner.ch, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com
Subject: [PATCH 1/4] drm/vmwgfx: Make console emulation depend on
 DRM_FBDEV_EMULATION
Date: Thu, 15 Apr 2021 13:00:37 +0200
Message-Id: <20210415110040.23525-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415110040.23525-1-tzimmermann@suse.de>
References: <20210415110040.23525-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Respect DRM's kconfig setting for fbdev console emulation. If enabled,
it will select all required config options. So remove them from vmwgfx's
Kconfig file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/Kconfig      |  7 +------
 drivers/gpu/drm/vmwgfx/Makefile     |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 19 +++++++++++++++++++
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
index 15acdf2a7c0f..b3a34196935b 100644
--- a/drivers/gpu/drm/vmwgfx/Kconfig
+++ b/drivers/gpu/drm/vmwgfx/Kconfig
@@ -2,12 +2,7 @@
 config DRM_VMWGFX
 	tristate "DRM driver for VMware Virtual GPU"
 	depends on DRM && PCI && X86 && MMU
-	select FB_DEFERRED_IO
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
 	select DRM_TTM
-	select FB
 	select MAPPING_DIRTY_HELPERS
 	# Only needed for the transitional use of drm_crtc_init - can be removed
 	# again once vmwgfx sets up the primary plane itself.
@@ -20,7 +15,7 @@ config DRM_VMWGFX
 	  The compiled module will be called "vmwgfx.ko".
 
 config DRM_VMWGFX_FBCON
-	depends on DRM_VMWGFX && FB
+	depends on DRM_VMWGFX && DRM_FBDEV_EMULATION
 	bool "Enable framebuffer console under vmwgfx by default"
 	help
 	   Choose this option if you are shipping a new vmwgfx
diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index 8c02fa5852e7..9f5743013cbb 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
-	    vmwgfx_fb.o vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
+	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
 	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
 	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
 	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
@@ -11,5 +11,7 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
 	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
 	    ttm_object.o ttm_lock.o ttm_memory.o
 
+vmwgfx-$(CONFIG_DRM_FBDEV_EMULATION) += vmwgfx_fb.o
 vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) += vmwgfx_thp.o
+
 obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 7e6518709e14..e7836da190c4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1116,10 +1116,29 @@ extern void vmw_generic_waiter_remove(struct vmw_private *dev_priv,
  * Kernel framebuffer - vmwgfx_fb.c
  */
 
+#ifdef CONFIG_DRM_FBDEV_EMULATION
 int vmw_fb_init(struct vmw_private *vmw_priv);
 int vmw_fb_close(struct vmw_private *dev_priv);
 int vmw_fb_off(struct vmw_private *vmw_priv);
 int vmw_fb_on(struct vmw_private *vmw_priv);
+#else
+static inline int vmw_fb_init(struct vmw_private *vmw_priv)
+{
+	return 0;
+}
+static inline int vmw_fb_close(struct vmw_private *dev_priv)
+{
+	return 0;
+}
+static inline int vmw_fb_off(struct vmw_private *vmw_priv)
+{
+	return 0;
+}
+static inline int vmw_fb_on(struct vmw_private *vmw_priv)
+{
+	return 0;
+}
+#endif
 
 /**
  * Kernel modesetting - vmwgfx_kms.c
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
