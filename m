Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC4605E0A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 12:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F028F894EA;
	Thu, 20 Oct 2022 10:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CE110E748;
 Thu, 20 Oct 2022 10:38:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A354E22B51;
 Thu, 20 Oct 2022 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666262287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLRwQht7GVds7VAf8IghGhcOaIUvFQknjx/ZhV8AfTY=;
 b=OfKqDXQrx0s5mKpwEu8RYLibl9AJUy7JqASQ6ncrwB//WO/bumTz9ms/0UdT9KB+0xCwFD
 PE+0BNb/qwuhvTxvJ/At81mxe0b4WNdZbt29aYQojXTyY0vWQxKzzc2QlANmAbSMTRgSYo
 5YMM3LOv7zT1RPuTkvI1ymE/QA7G8/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666262287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLRwQht7GVds7VAf8IghGhcOaIUvFQknjx/ZhV8AfTY=;
 b=EhhRukINnbNQwtbxUaKk6QJXEjaachx5Ukf0wJYimFVm40mKuxe/Y07T6jRAXSWDec0eob
 n+7CbcztY22bkFAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5A3A13AF5;
 Thu, 20 Oct 2022 10:38:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sDtBNw4lUWPPYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 10:38:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 20/21] drm/fb-helper: Move generic fbdev emulation into
 separate source file
Date: Thu, 20 Oct 2022 12:37:54 +0200
Message-Id: <20221020103755.24058-21-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221020103755.24058-1-tzimmermann@suse.de>
References: <20221020103755.24058-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the generic fbdev implementation into its own source and header
file. Adapt drivers. No functonal changes, but some of the internal
helpers have been renamed to fit into the drm_fbdev_ naming scheme.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile                      |   2 +-
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |   2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |   2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |   2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |   2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |   2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 517 +-----------------
 drivers/gpu/drm/drm_fbdev.c                   | 512 +++++++++++++++++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |   2 +-
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   1 +
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |   2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |   2 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |   2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                 |   2 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c         |   2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +-
 drivers/gpu/drm/meson/meson_drv.c             |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   1 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |   2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   2 +-
 drivers/gpu/drm/solomon/ssd130x.c             |   2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |   2 +-
 drivers/gpu/drm/stm/drv.c                     |   2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |   2 +-
 drivers/gpu/drm/tiny/bochs.c                  |   2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   2 +-
 drivers/gpu/drm/tiny/gm12u320.c               |   2 +-
 drivers/gpu/drm/tiny/hx8357d.c                |   2 +-
 drivers/gpu/drm/tiny/ili9163.c                |   2 +-
 drivers/gpu/drm/tiny/ili9225.c                |   2 +-
 drivers/gpu/drm/tiny/ili9341.c                |   2 +-
 drivers/gpu/drm/tiny/ili9486.c                |   2 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |   2 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |   2 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   2 +-
 drivers/gpu/drm/tiny/repaper.c                |   2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   2 +-
 drivers/gpu/drm/tiny/st7586.c                 |   2 +-
 drivers/gpu/drm/tiny/st7735r.c                |   2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |   2 +-
 drivers/gpu/drm/udl/udl_drv.c                 |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |   2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |   2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   1 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |   2 +-
 include/drm/drm_fb_helper.h                   |   9 -
 include/drm/drm_fbdev.h                       |  15 +
 61 files changed, 586 insertions(+), 576 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fbdev.c
 create mode 100644 include/drm/drm_fbdev.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6ad98d3ceff76..beffde597ff68 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -115,7 +115,7 @@ drm_kms_helper-y := \
 	drm_self_refresh_helper.o \
 	drm_simple_kms_helper.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
-drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
+drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev.o drm_fb_helper.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
 #
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 9fce4239d4ad4..9124d9e3f4e71 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -9,7 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/component.h>
 #include <linux/pm_runtime.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include "komeda_dev.h"
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index a032003c340cc..fddcef0c373e0 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -26,7 +26,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 1d0b0c54ccc74..7665b651bbc59 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -19,7 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index a94f1a9e8f409..fa2fec7940b23 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -16,7 +16,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index bbeb5defc8f5c..44f5da586dad1 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -33,6 +33,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index f7e7f4e919c77..3d3e3dee7d8ec 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -19,7 +19,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d1afb420c6e06..f52a90263ac36 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -30,24 +30,17 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/console.h>
-#include <linux/dma-buf.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/slab.h>
 #include <linux/sysrq.h>
-#include <linux/vmalloc.h>
 
 #include <drm/drm_atomic.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
-#include "drm_crtc_helper_internal.h"
 #include "drm_internal.h"
 
 static bool drm_fbdev_emulation = true;
@@ -61,25 +54,6 @@ MODULE_PARM_DESC(drm_fbdev_overalloc,
 		 "Overallocation of the fbdev buffer (%) [default="
 		 __MODULE_STRING(CONFIG_DRM_FBDEV_OVERALLOC) "]");
 
-/*
- * In order to keep user-space compatibility, we want in certain use-cases
- * to keep leaking the fbdev physical address to the user-space program
- * handling the fbdev buffer.
- * This is a bad habit essentially kept into closed source opengl driver
- * that should really be moved into open-source upstream projects instead
- * of using legacy physical addresses in user space to communicate with
- * other out-of-tree kernel modules.
- *
- * This module_param *should* be removed as soon as possible and be
- * considered as a broken and legacy behaviour from a modern fbdev device.
- */
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-static bool drm_leak_fbdev_smem = false;
-module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
-MODULE_PARM_DESC(drm_leak_fbdev_smem,
-		 "Allow unsafe leaking fbdev physical smem address [default=false]");
-#endif
-
 static LIST_HEAD(kernel_fb_helper_list);
 static DEFINE_MUTEX(kernel_fb_helper_lock);
 
@@ -372,80 +346,6 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
 	console_unlock();
 }
 
-static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
-					   struct drm_clip_rect *clip,
-					   struct iosys_map *dst)
-{
-	struct drm_framebuffer *fb = fb_helper->fb;
-	size_t offset = clip->y1 * fb->pitches[0];
-	size_t len = clip->x2 - clip->x1;
-	unsigned int y;
-	void *src;
-
-	switch (drm_format_info_bpp(fb->format, 0)) {
-	case 1:
-		offset += clip->x1 / 8;
-		len = DIV_ROUND_UP(len + clip->x1 % 8, 8);
-		break;
-	case 2:
-		offset += clip->x1 / 4;
-		len = DIV_ROUND_UP(len + clip->x1 % 4, 4);
-		break;
-	case 4:
-		offset += clip->x1 / 2;
-		len = DIV_ROUND_UP(len + clip->x1 % 2, 2);
-		break;
-	default:
-		offset += clip->x1 * fb->format->cpp[0];
-		len *= fb->format->cpp[0];
-		break;
-	}
-
-	src = fb_helper->info->screen_buffer + offset;
-	iosys_map_incr(dst, offset); /* go to first pixel within clip rect */
-
-	for (y = clip->y1; y < clip->y2; y++) {
-		iosys_map_memcpy_to(dst, 0, src, len);
-		iosys_map_incr(dst, fb->pitches[0]);
-		src += fb->pitches[0];
-	}
-}
-
-static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
-				     struct drm_clip_rect *clip)
-{
-	struct drm_client_buffer *buffer = fb_helper->buffer;
-	struct iosys_map map, dst;
-	int ret;
-
-	/*
-	 * We have to pin the client buffer to its current location while
-	 * flushing the shadow buffer. In the general case, concurrent
-	 * modesetting operations could try to move the buffer and would
-	 * fail. The modeset has to be serialized by acquiring the reservation
-	 * object of the underlying BO here.
-	 *
-	 * For fbdev emulation, we only have to protect against fbdev modeset
-	 * operations. Nothing else will involve the client buffer's BO. So it
-	 * is sufficient to acquire struct drm_fb_helper.lock here.
-	 */
-	mutex_lock(&fb_helper->lock);
-
-	ret = drm_client_buffer_vmap(buffer, &map);
-	if (ret)
-		goto out;
-
-	dst = map;
-	drm_fb_helper_damage_blit_real(fb_helper, clip, &dst);
-
-	drm_client_buffer_vunmap(buffer);
-
-out:
-	mutex_unlock(&fb_helper->lock);
-
-	return ret;
-}
-
 static void drm_fb_helper_damage_work(struct work_struct *work)
 {
 	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
@@ -2322,423 +2222,10 @@ EXPORT_SYMBOL(drm_fb_helper_lastclose);
  *
  * This function can be used as the
  * &drm_mode_config_funcs.output_poll_changed callback for drivers that only
- * need to call drm_fb_helper_hotplug_event().
+ * need to call drm_fbdev.hotplug_event().
  */
 void drm_fb_helper_output_poll_changed(struct drm_device *dev)
 {
 	drm_fb_helper_hotplug_event(dev->fb_helper);
 }
 EXPORT_SYMBOL(drm_fb_helper_output_poll_changed);
-
-static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
-{
-	struct drm_device *dev = fb_helper->dev;
-	struct drm_framebuffer *fb = fb_helper->fb;
-
-	return dev->mode_config.prefer_shadow_fbdev ||
-	       dev->mode_config.prefer_shadow ||
-	       fb->funcs->dirty;
-}
-
-/* @user: 1=userspace, 0=fbcon */
-static int drm_fbdev_fb_open(struct fb_info *info, int user)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-
-	/* No need to take a ref for fbcon because it unbinds on unregister */
-	if (user && !try_module_get(fb_helper->dev->driver->fops->owner))
-		return -ENODEV;
-
-	return 0;
-}
-
-static int drm_fbdev_fb_release(struct fb_info *info, int user)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-
-	if (user)
-		module_put(fb_helper->dev->driver->fops->owner);
-
-	return 0;
-}
-
-static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
-{
-	struct fb_info *fbi = fb_helper->info;
-	void *shadow = NULL;
-
-	if (!fb_helper->dev)
-		return;
-
-	if (fbi) {
-		if (fbi->fbdefio)
-			fb_deferred_io_cleanup(fbi);
-		if (drm_fbdev_use_shadow_fb(fb_helper))
-			shadow = fbi->screen_buffer;
-	}
-
-	drm_fb_helper_fini(fb_helper);
-
-	if (shadow)
-		vfree(shadow);
-	else if (fb_helper->buffer)
-		drm_client_buffer_vunmap(fb_helper->buffer);
-
-	drm_client_framebuffer_delete(fb_helper->buffer);
-}
-
-static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
-{
-	drm_fbdev_cleanup(fb_helper);
-	drm_client_release(&fb_helper->client);
-	kfree(fb_helper);
-}
-
-/*
- * fb_ops.fb_destroy is called by the last put_fb_info() call at the end of
- * unregister_framebuffer() or fb_release().
- */
-static void drm_fbdev_fb_destroy(struct fb_info *info)
-{
-	drm_fbdev_release(info->par);
-}
-
-static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-
-	if (drm_fbdev_use_shadow_fb(fb_helper))
-		return fb_deferred_io_mmap(info, vma);
-	else if (fb_helper->dev->driver->gem_prime_mmap)
-		return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
-	else
-		return -ENODEV;
-}
-
-static bool drm_fbdev_use_iomem(struct fb_info *info)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_client_buffer *buffer = fb_helper->buffer;
-
-	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
-}
-
-static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
-				 size_t count, loff_t *ppos)
-{
-	ssize_t ret;
-
-	if (drm_fbdev_use_iomem(info))
-		ret = drm_fb_helper_cfb_read(info, buf, count, ppos);
-	else
-		ret = drm_fb_helper_sys_read(info, buf, count, ppos);
-
-	return ret;
-}
-
-static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
-				  size_t count, loff_t *ppos)
-{
-	ssize_t ret;
-
-	if (drm_fbdev_use_iomem(info))
-		ret = drm_fb_helper_cfb_write(info, buf, count, ppos);
-	else
-		ret = drm_fb_helper_sys_write(info, buf, count, ppos);
-
-	return ret;
-}
-
-static void drm_fbdev_fb_fillrect(struct fb_info *info,
-				  const struct fb_fillrect *rect)
-{
-	if (drm_fbdev_use_iomem(info))
-		drm_fb_helper_cfb_fillrect(info, rect);
-	else
-		drm_fb_helper_sys_fillrect(info, rect);
-}
-
-static void drm_fbdev_fb_copyarea(struct fb_info *info,
-				  const struct fb_copyarea *area)
-{
-	if (drm_fbdev_use_iomem(info))
-		drm_fb_helper_cfb_copyarea(info, area);
-	else
-		drm_fb_helper_sys_copyarea(info, area);
-}
-
-static void drm_fbdev_fb_imageblit(struct fb_info *info,
-				   const struct fb_image *image)
-{
-	if (drm_fbdev_use_iomem(info))
-		drm_fb_helper_cfb_imageblit(info, image);
-	else
-		drm_fb_helper_sys_imageblit(info, image);
-}
-
-static const struct fb_ops drm_fbdev_fb_ops = {
-	.owner		= THIS_MODULE,
-	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_open	= drm_fbdev_fb_open,
-	.fb_release	= drm_fbdev_fb_release,
-	.fb_destroy	= drm_fbdev_fb_destroy,
-	.fb_mmap	= drm_fbdev_fb_mmap,
-	.fb_read	= drm_fbdev_fb_read,
-	.fb_write	= drm_fbdev_fb_write,
-	.fb_fillrect	= drm_fbdev_fb_fillrect,
-	.fb_copyarea	= drm_fbdev_fb_copyarea,
-	.fb_imageblit	= drm_fbdev_fb_imageblit,
-};
-
-static struct fb_deferred_io drm_fbdev_defio = {
-	.delay		= HZ / 20,
-	.deferred_io	= drm_fb_helper_deferred_io,
-};
-
-/*
- * This function uses the client API to create a framebuffer backed by a dumb buffer.
- *
- * The _sys_ versions are used for &fb_ops.fb_read, fb_write, fb_fillrect,
- * fb_copyarea, fb_imageblit.
- */
-static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
-				       struct drm_fb_helper_surface_size *sizes)
-{
-	struct drm_client_dev *client = &fb_helper->client;
-	struct drm_device *dev = fb_helper->dev;
-	struct drm_client_buffer *buffer;
-	struct drm_framebuffer *fb;
-	struct fb_info *fbi;
-	u32 format;
-	struct iosys_map map;
-	int ret;
-
-	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
-		    sizes->surface_width, sizes->surface_height,
-		    sizes->surface_bpp);
-
-	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
-	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
-					       sizes->surface_height, format);
-	if (IS_ERR(buffer))
-		return PTR_ERR(buffer);
-
-	fb_helper->buffer = buffer;
-	fb_helper->fb = buffer->fb;
-	fb = buffer->fb;
-
-	fbi = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(fbi))
-		return PTR_ERR(fbi);
-
-	fbi->fbops = &drm_fbdev_fb_ops;
-	fbi->screen_size = sizes->surface_height * fb->pitches[0];
-	fbi->fix.smem_len = fbi->screen_size;
-	fbi->flags = FBINFO_DEFAULT;
-
-	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
-
-	if (drm_fbdev_use_shadow_fb(fb_helper)) {
-		fbi->screen_buffer = vzalloc(fbi->screen_size);
-		if (!fbi->screen_buffer)
-			return -ENOMEM;
-		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
-
-		fbi->fbdefio = &drm_fbdev_defio;
-		fb_deferred_io_init(fbi);
-	} else {
-		/* buffer is mapped for HW framebuffer */
-		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
-		if (ret)
-			return ret;
-		if (map.is_iomem) {
-			fbi->screen_base = map.vaddr_iomem;
-		} else {
-			fbi->screen_buffer = map.vaddr;
-			fbi->flags |= FBINFO_VIRTFB;
-		}
-
-		/*
-		 * Shamelessly leak the physical address to user-space. As
-		 * page_to_phys() is undefined for I/O memory, warn in this
-		 * case.
-		 */
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0 &&
-		    !drm_WARN_ON_ONCE(dev, map.is_iomem))
-			fbi->fix.smem_start =
-				page_to_phys(virt_to_page(fbi->screen_buffer));
-#endif
-	}
-
-	return 0;
-}
-
-static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
-{
-	struct drm_device *dev = helper->dev;
-	int ret;
-
-	if (!drm_fbdev_use_shadow_fb(helper))
-		return 0;
-
-	/* Call damage handlers only if necessary */
-	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
-		return 0;
-
-	if (helper->buffer) {
-		ret = drm_fb_helper_damage_blit(helper, clip);
-		if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
-			return ret;
-	}
-
-	if (helper->fb->funcs->dirty) {
-		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
-		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
-			return ret;
-	}
-
-	return 0;
-}
-
-static const struct drm_fb_helper_funcs drm_fb_helper_generic_funcs = {
-	.fb_probe = drm_fb_helper_generic_probe,
-	.fb_dirty = drm_fbdev_fb_dirty,
-};
-
-static void drm_fbdev_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-
-	if (fb_helper->info)
-		/* drm_fbdev_fb_destroy() takes care of cleanup */
-		drm_fb_helper_unregister_info(fb_helper);
-	else
-		drm_fbdev_release(fb_helper);
-}
-
-static int drm_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
-	int ret;
-
-	/* Setup is not retried if it has failed */
-	if (!fb_helper->dev && fb_helper->funcs)
-		return 0;
-
-	if (dev->fb_helper)
-		return drm_fb_helper_hotplug_event(dev->fb_helper);
-
-	if (!dev->mode_config.num_connector) {
-		drm_dbg_kms(dev, "No connectors found, will not create framebuffer!\n");
-		return 0;
-	}
-
-	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
-
-	ret = drm_fb_helper_init(dev, fb_helper);
-	if (ret)
-		goto err;
-
-	if (!drm_drv_uses_atomic_modeset(dev))
-		drm_helper_disable_unused_functions(dev);
-
-	ret = drm_fb_helper_initial_config(fb_helper, fb_helper->preferred_bpp);
-	if (ret)
-		goto err_cleanup;
-
-	return 0;
-
-err_cleanup:
-	drm_fbdev_cleanup(fb_helper);
-err:
-	fb_helper->dev = NULL;
-	fb_helper->info = NULL;
-
-	drm_err(dev, "fbdev: Failed to setup generic emulation (ret=%d)\n", ret);
-
-	return ret;
-}
-
-static const struct drm_client_funcs drm_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= drm_fbdev_client_unregister,
-	.restore	= drm_fbdev_client_restore,
-	.hotplug	= drm_fbdev_client_hotplug,
-};
-
-/**
- * drm_fbdev_generic_setup() - Setup generic fbdev emulation
- * @dev: DRM device
- * @preferred_bpp: Preferred bits per pixel for the device.
- *                 @dev->mode_config.preferred_depth is used if this is zero.
- *
- * This function sets up generic fbdev emulation for drivers that supports
- * dumb buffers with a virtual address and that can be mmap'ed.
- * drm_fbdev_generic_setup() shall be called after the DRM driver registered
- * the new DRM device with drm_dev_register().
- *
- * Restore, hotplug events and teardown are all taken care of. Drivers that do
- * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
- * Simple drivers might use drm_mode_config_helper_suspend().
- *
- * Drivers that set the dirty callback on their framebuffer will get a shadow
- * fbdev buffer that is blitted onto the real buffer. This is done in order to
- * make deferred I/O work with all kinds of buffers. A shadow buffer can be
- * requested explicitly by setting struct drm_mode_config.prefer_shadow or
- * struct drm_mode_config.prefer_shadow_fbdev to true beforehand. This is
- * required to use generic fbdev emulation with SHMEM helpers.
- *
- * This function is safe to call even when there are no connectors present.
- * Setup will be retried on the next hotplug event.
- *
- * The fbdev is destroyed by drm_dev_unregister().
- */
-void drm_fbdev_generic_setup(struct drm_device *dev,
-			     unsigned int preferred_bpp)
-{
-	struct drm_fb_helper *fb_helper;
-	int ret;
-
-	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
-	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
-
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper) {
-		drm_err(dev, "Failed to allocate fb_helper\n");
-		return;
-	}
-
-	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
-	if (ret) {
-		kfree(fb_helper);
-		drm_err(dev, "Failed to register client: %d\n", ret);
-		return;
-	}
-
-	/*
-	 * FIXME: This mixes up depth with bpp, which results in a glorious
-	 * mess, resulting in some drivers picking wrong fbdev defaults and
-	 * others wrong preferred_depth defaults.
-	 */
-	if (!preferred_bpp)
-		preferred_bpp = dev->mode_config.preferred_depth;
-	if (!preferred_bpp)
-		preferred_bpp = 32;
-	fb_helper->preferred_bpp = preferred_bpp;
-
-	ret = drm_fbdev_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
-	drm_client_register(&fb_helper->client);
-}
-EXPORT_SYMBOL(drm_fbdev_generic_setup);
diff --git a/drivers/gpu/drm/drm_fbdev.c b/drivers/gpu/drm/drm_fbdev.c
new file mode 100644
index 0000000000000..64085bc8b3809
--- /dev/null
+++ b/drivers/gpu/drm/drm_fbdev.c
@@ -0,0 +1,512 @@
+// SPDX-License-Identifier: MIT
+
+#include <linux/moduleparam.h>
+
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
+
+#include <drm/drm_fbdev.h>
+
+/*
+ * In order to keep user-space compatibility, we want in certain use-cases
+ * to keep leaking the fbdev physical address to the user-space program
+ * handling the fbdev buffer.
+ * This is a bad habit essentially kept into closed source opengl driver
+ * that should really be moved into open-source upstream projects instead
+ * of using legacy physical addresses in user space to communicate with
+ * other out-of-tree kernel modules.
+ *
+ * This module_param *should* be removed as soon as possible and be
+ * considered as a broken and legacy behaviour from a modern fbdev device.
+ */
+#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
+static bool drm_leak_fbdev_smem;
+module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
+MODULE_PARM_DESC(drm_leak_fbdev_smem,
+		 "Allow unsafe leaking fbdev physical smem address [default=false]");
+#endif
+
+static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
+{
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_framebuffer *fb = fb_helper->fb;
+
+	return dev->mode_config.prefer_shadow_fbdev ||
+	       dev->mode_config.prefer_shadow ||
+	       fb->funcs->dirty;
+}
+
+/* @user: 1=userspace, 0=fbcon */
+static int drm_fbdev_fb_open(struct fb_info *info, int user)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	/* No need to take a ref for fbcon because it unbinds on unregister */
+	if (user && !try_module_get(fb_helper->dev->driver->fops->owner))
+		return -ENODEV;
+
+	return 0;
+}
+
+static int drm_fbdev_fb_release(struct fb_info *info, int user)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (user)
+		module_put(fb_helper->dev->driver->fops->owner);
+
+	return 0;
+}
+
+static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
+{
+	struct fb_info *fbi = fb_helper->info;
+	void *shadow = NULL;
+
+	if (!fb_helper->dev)
+		return;
+
+	if (fbi) {
+		if (fbi->fbdefio)
+			fb_deferred_io_cleanup(fbi);
+		if (drm_fbdev_use_shadow_fb(fb_helper))
+			shadow = fbi->screen_buffer;
+	}
+
+	drm_fb_helper_fini(fb_helper);
+
+	if (shadow)
+		vfree(shadow);
+	else if (fb_helper->buffer)
+		drm_client_buffer_vunmap(fb_helper->buffer);
+
+	drm_client_framebuffer_delete(fb_helper->buffer);
+}
+
+static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
+{
+	drm_fbdev_cleanup(fb_helper);
+	drm_client_release(&fb_helper->client);
+	kfree(fb_helper);
+}
+
+/*
+ * fb_ops.fb_destroy is called by the last put_fb_info() call at the end of
+ * unregister_framebuffer() or fb_release().
+ */
+static void drm_fbdev_fb_destroy(struct fb_info *info)
+{
+	drm_fbdev_release(info->par);
+}
+
+static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (drm_fbdev_use_shadow_fb(fb_helper))
+		return fb_deferred_io_mmap(info, vma);
+	else if (fb_helper->dev->driver->gem_prime_mmap)
+		return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
+	else
+		return -ENODEV;
+}
+
+static bool drm_fbdev_use_iomem(struct fb_info *info)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
+}
+
+static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	ssize_t ret;
+
+	if (drm_fbdev_use_iomem(info))
+		ret = drm_fb_helper_cfb_read(info, buf, count, ppos);
+	else
+		ret = drm_fb_helper_sys_read(info, buf, count, ppos);
+
+	return ret;
+}
+
+static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	ssize_t ret;
+
+	if (drm_fbdev_use_iomem(info))
+		ret = drm_fb_helper_cfb_write(info, buf, count, ppos);
+	else
+		ret = drm_fb_helper_sys_write(info, buf, count, ppos);
+
+	return ret;
+}
+
+static void drm_fbdev_fb_fillrect(struct fb_info *info,
+				  const struct fb_fillrect *rect)
+{
+	if (drm_fbdev_use_iomem(info))
+		drm_fb_helper_cfb_fillrect(info, rect);
+	else
+		drm_fb_helper_sys_fillrect(info, rect);
+}
+
+static void drm_fbdev_fb_copyarea(struct fb_info *info,
+				  const struct fb_copyarea *area)
+{
+	if (drm_fbdev_use_iomem(info))
+		drm_fb_helper_cfb_copyarea(info, area);
+	else
+		drm_fb_helper_sys_copyarea(info, area);
+}
+
+static void drm_fbdev_fb_imageblit(struct fb_info *info,
+				   const struct fb_image *image)
+{
+	if (drm_fbdev_use_iomem(info))
+		drm_fb_helper_cfb_imageblit(info, image);
+	else
+		drm_fb_helper_sys_imageblit(info, image);
+}
+
+static const struct fb_ops drm_fbdev_fb_ops = {
+	.owner		= THIS_MODULE,
+	DRM_FB_HELPER_DEFAULT_OPS,
+	.fb_open	= drm_fbdev_fb_open,
+	.fb_release	= drm_fbdev_fb_release,
+	.fb_destroy	= drm_fbdev_fb_destroy,
+	.fb_mmap	= drm_fbdev_fb_mmap,
+	.fb_read	= drm_fbdev_fb_read,
+	.fb_write	= drm_fbdev_fb_write,
+	.fb_fillrect	= drm_fbdev_fb_fillrect,
+	.fb_copyarea	= drm_fbdev_fb_copyarea,
+	.fb_imageblit	= drm_fbdev_fb_imageblit,
+};
+
+static struct fb_deferred_io drm_fbdev_defio = {
+	.delay		= HZ / 20,
+	.deferred_io	= drm_fb_helper_deferred_io,
+};
+
+/*
+ * This function uses the client API to create a framebuffer backed by a dumb buffer.
+ */
+static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
+			      struct drm_fb_helper_surface_size *sizes)
+{
+	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_client_buffer *buffer;
+	struct drm_framebuffer *fb;
+	struct fb_info *fbi;
+	u32 format;
+	struct iosys_map map;
+	int ret;
+
+	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
+		    sizes->surface_width, sizes->surface_height,
+		    sizes->surface_bpp);
+
+	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+					       sizes->surface_height, format);
+	if (IS_ERR(buffer))
+		return PTR_ERR(buffer);
+
+	fb_helper->buffer = buffer;
+	fb_helper->fb = buffer->fb;
+	fb = buffer->fb;
+
+	fbi = drm_fb_helper_alloc_info(fb_helper);
+	if (IS_ERR(fbi))
+		return PTR_ERR(fbi);
+
+	fbi->fbops = &drm_fbdev_fb_ops;
+	fbi->screen_size = sizes->surface_height * fb->pitches[0];
+	fbi->fix.smem_len = fbi->screen_size;
+	fbi->flags = FBINFO_DEFAULT;
+
+	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
+
+	if (drm_fbdev_use_shadow_fb(fb_helper)) {
+		fbi->screen_buffer = vzalloc(fbi->screen_size);
+		if (!fbi->screen_buffer)
+			return -ENOMEM;
+		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
+
+		fbi->fbdefio = &drm_fbdev_defio;
+		fb_deferred_io_init(fbi);
+	} else {
+		/* buffer is mapped for HW framebuffer */
+		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
+		if (ret)
+			return ret;
+		if (map.is_iomem) {
+			fbi->screen_base = map.vaddr_iomem;
+		} else {
+			fbi->screen_buffer = map.vaddr;
+			fbi->flags |= FBINFO_VIRTFB;
+		}
+
+		/*
+		 * Shamelessly leak the physical address to user-space. As
+		 * page_to_phys() is undefined for I/O memory, warn in this
+		 * case.
+		 */
+#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
+		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0 &&
+		    !drm_WARN_ON_ONCE(dev, map.is_iomem))
+			fbi->fix.smem_start =
+				page_to_phys(virt_to_page(fbi->screen_buffer));
+#endif
+	}
+
+	return 0;
+}
+
+static void drm_fbdev_damage_blit_real(struct drm_fb_helper *fb_helper,
+				       struct drm_clip_rect *clip,
+				       struct iosys_map *dst)
+{
+	struct drm_framebuffer *fb = fb_helper->fb;
+	size_t offset = clip->y1 * fb->pitches[0];
+	size_t len = clip->x2 - clip->x1;
+	unsigned int y;
+	void *src;
+
+	switch (drm_format_info_bpp(fb->format, 0)) {
+	case 1:
+		offset += clip->x1 / 8;
+		len = DIV_ROUND_UP(len + clip->x1 % 8, 8);
+		break;
+	case 2:
+		offset += clip->x1 / 4;
+		len = DIV_ROUND_UP(len + clip->x1 % 4, 4);
+		break;
+	case 4:
+		offset += clip->x1 / 2;
+		len = DIV_ROUND_UP(len + clip->x1 % 2, 2);
+		break;
+	default:
+		offset += clip->x1 * fb->format->cpp[0];
+		len *= fb->format->cpp[0];
+		break;
+	}
+
+	src = fb_helper->info->screen_buffer + offset;
+	iosys_map_incr(dst, offset); /* go to first pixel within clip rect */
+
+	for (y = clip->y1; y < clip->y2; y++) {
+		iosys_map_memcpy_to(dst, 0, src, len);
+		iosys_map_incr(dst, fb->pitches[0]);
+		src += fb->pitches[0];
+	}
+}
+
+static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
+				 struct drm_clip_rect *clip)
+{
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+	struct iosys_map map, dst;
+	int ret;
+
+	/*
+	 * We have to pin the client buffer to its current location while
+	 * flushing the shadow buffer. In the general case, concurrent
+	 * modesetting operations could try to move the buffer and would
+	 * fail. The modeset has to be serialized by acquiring the reservation
+	 * object of the underlying BO here.
+	 *
+	 * For fbdev emulation, we only have to protect against fbdev modeset
+	 * operations. Nothing else will involve the client buffer's BO. So it
+	 * is sufficient to acquire struct drm_fb_helper.lock here.
+	 */
+	mutex_lock(&fb_helper->lock);
+
+	ret = drm_client_buffer_vmap(buffer, &map);
+	if (ret)
+		goto out;
+
+	dst = map;
+	drm_fbdev_damage_blit_real(fb_helper, clip, &dst);
+
+	drm_client_buffer_vunmap(buffer);
+
+out:
+	mutex_unlock(&fb_helper->lock);
+
+	return ret;
+}
+
+static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
+{
+	struct drm_device *dev = helper->dev;
+	int ret;
+
+	if (!drm_fbdev_use_shadow_fb(helper))
+		return 0;
+
+	/* Call damage handlers only if necessary */
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->buffer) {
+		ret = drm_fbdev_damage_blit(helper, clip);
+		if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct drm_fb_helper_funcs drm_fb_helper_generic_funcs = {
+	.fb_probe = drm_fbdev_fb_probe,
+	.fb_dirty = drm_fbdev_fb_dirty,
+};
+
+static void drm_fbdev_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (fb_helper->info)
+		/* drm_fbdev_fb_destroy() takes care of cleanup */
+		drm_fb_helper_unregister_info(fb_helper);
+	else
+		drm_fbdev_release(fb_helper);
+}
+
+static int drm_fbdev_client_restore(struct drm_client_dev *client)
+{
+	drm_fb_helper_lastclose(client->dev);
+
+	return 0;
+}
+
+static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	int ret;
+
+	/* Setup is not retried if it has failed */
+	if (!fb_helper->dev && fb_helper->funcs)
+		return 0;
+
+	if (dev->fb_helper)
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
+
+	if (!dev->mode_config.num_connector) {
+		drm_dbg_kms(dev, "No connectors found, will not create framebuffer!\n");
+		return 0;
+	}
+
+	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
+
+	ret = drm_fb_helper_init(dev, fb_helper);
+	if (ret)
+		goto err;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
+
+	ret = drm_fb_helper_initial_config(fb_helper, fb_helper->preferred_bpp);
+	if (ret)
+		goto err_cleanup;
+
+	return 0;
+
+err_cleanup:
+	drm_fbdev_cleanup(fb_helper);
+err:
+	fb_helper->dev = NULL;
+	fb_helper->info = NULL;
+
+	drm_err(dev, "fbdev: Failed to setup generic emulation (ret=%d)\n", ret);
+
+	return ret;
+}
+
+static const struct drm_client_funcs drm_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= drm_fbdev_client_unregister,
+	.restore	= drm_fbdev_client_restore,
+	.hotplug	= drm_fbdev_client_hotplug,
+};
+
+/**
+ * drm_fbdev_generic_setup() - Setup generic fbdev emulation
+ * @dev: DRM device
+ * @preferred_bpp: Preferred bits per pixel for the device.
+ *                 @dev->mode_config.preferred_depth is used if this is zero.
+ *
+ * This function sets up generic fbdev emulation for drivers that supports
+ * dumb buffers with a virtual address and that can be mmap'ed.
+ * drm_fbdev_generic_setup() shall be called after the DRM driver registered
+ * the new DRM device with drm_dev_register().
+ *
+ * Restore, hotplug events and teardown are all taken care of. Drivers that do
+ * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
+ * Simple drivers might use drm_mode_config_helper_suspend().
+ *
+ * Drivers that set the dirty callback on their framebuffer will get a shadow
+ * fbdev buffer that is blitted onto the real buffer. This is done in order to
+ * make deferred I/O work with all kinds of buffers. A shadow buffer can be
+ * requested explicitly by setting struct drm_mode_config.prefer_shadow or
+ * struct drm_mode_config.prefer_shadow_fbdev to true beforehand. This is
+ * required to use generic fbdev emulation with SHMEM helpers.
+ *
+ * This function is safe to call even when there are no connectors present.
+ * Setup will be retried on the next hotplug event.
+ *
+ * The fbdev is destroyed by drm_dev_unregister().
+ */
+void drm_fbdev_generic_setup(struct drm_device *dev,
+			     unsigned int preferred_bpp)
+{
+	struct drm_fb_helper *fb_helper;
+	int ret;
+
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
+
+	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
+	if (!fb_helper)
+		return;
+
+	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
+	if (ret) {
+		kfree(fb_helper);
+		drm_err(dev, "Failed to register client: %d\n", ret);
+		return;
+	}
+
+	/*
+	 * FIXME: This mixes up depth with bpp, which results in a glorious
+	 * mess, resulting in some drivers picking wrong fbdev defaults and
+	 * others wrong preferred_depth defaults.
+	 */
+	if (!preferred_bpp)
+		preferred_bpp = dev->mode_config.preferred_depth;
+	if (!preferred_bpp)
+		preferred_bpp = 32;
+	fb_helper->preferred_bpp = preferred_bpp;
+
+	ret = drm_fbdev_client_hotplug(&fb_helper->client);
+	if (ret)
+		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
+
+	drm_client_register(&fb_helper->client);
+}
+EXPORT_SYMBOL(drm_fbdev_generic_setup);
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index b4acc3422ba45..5bf2d019dd5c4 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -20,7 +20,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 8d1630b8edac1..53e4630369c9c 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -18,7 +18,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index fe4269c5aa0ab..225f67bc18afe 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 73ee7f25f7346..47c22b8f37acd 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -19,7 +19,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index f84d39762a72b..c9fa5e152d059 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -11,7 +11,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 1defd6a40f11d..4f4267c95c76e 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -7,7 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 8dd8b0f912af6..a82c92f0a0d10 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -16,7 +16,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 99f86f1ba8bee..20d8953525876 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -32,7 +32,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 2382ccb3ee99d..0fc46b71e5bf5 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -15,7 +15,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index cc9a4e965f779..87bbfd55f7803 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -17,7 +17,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_print.h>
 
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 38c3907bb151a..52ec3f70ea087 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -69,7 +69,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 91f58db5915f5..450ba47bd8771 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -17,7 +17,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 3b24a924b7b97..c88a5eab9dad3 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -18,7 +18,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index ece6cd102dbb1..75132cfc8d6de 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 075002ed6fb09..d682b26f84c0b 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -16,7 +16,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mode_config.h>
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index b29b332ed3814..eec7c26d039f0 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -20,7 +20,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index b59472c29a40d..d37fc22527e1f 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -31,7 +31,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index eb25eedb5ee00..fdc40470e1a1f 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -48,7 +48,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 3044ca948ce22..34cda5b234100 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -37,6 +37,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index a2776f1d6f2c2..6b9e87a49e8e9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -20,7 +20,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 813f9f8c86982..8bf0a85a59b40 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -17,7 +17,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index f2795f90ea693..5a654201ff32c 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -23,7 +23,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 7abf010a32935..0d9607855ef66 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -14,7 +14,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index d7914f5122dff..9e7159eef7e2c 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -18,7 +18,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index d06ffd99d86e1..63d27244268ea 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -17,7 +17,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 15cd9b91b7e2a..0c5534194cd0f 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -14,7 +14,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index f72755b8ea14c..3fb1e8d0e8f80 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -16,7 +16,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index bb302a3fd6b5f..4d10c5bf2e601 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -12,7 +12,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index a51262289aefd..e7e46502612b1 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -7,7 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 354d5e854a6f0..f7181b2f8369d 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -30,7 +30,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_file.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 7441d992a5d7a..3a37138aeba96 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -12,7 +12,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_file.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index 48c24aa8c28a1..eefffa46bb78d 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -18,7 +18,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 9a1a5943bee01..0aa1d84995abc 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dbi.h>
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index a79da2b4af647..028e63e68a883 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -20,7 +20,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index 69b265e78096b..2a0b516ff1b44 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -17,7 +17,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index c80028bb1d110..f16cadc813ca7 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -16,7 +16,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index bc522fb3d94d1..5307d5d28df59 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -15,7 +15,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 0e1cc2369afcc..016372da72d12 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -11,7 +11,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 955a61d628e7c..7249cf8accec4 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -16,7 +16,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index e62f4d16b2c6b..347366a3d5767 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -26,7 +26,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index cbb100753154e..b9f541c058c55 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -15,7 +15,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index b6f620b902e6d..a9de2c6695d13 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -16,7 +16,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index c36ba08acda18..4d2d43c27582f 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -18,7 +18,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 611785e097576..684f319d94c70 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -40,7 +40,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 91effdcefb6d5..6ccfc23b9134c 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -7,7 +7,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 1cd716eb17a1c..61cc110440a54 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -14,7 +14,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 2027063fdc309..94d4a6b1cd3ab 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -33,7 +33,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_vblank.h>
 
 #include <soc/bcm2835/raspberrypi-firmware.h>
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 0035affc3e590..70c0f49ac895b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -35,6 +35,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_file.h>
 
 #include "virtgpu_drv.h"
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f75..e616d2e614dcb 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -17,7 +17,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 1de2d927c32b0..27c8a8218914b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -19,7 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 6581183618b89..933ca016f1224 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -285,9 +285,6 @@ int drm_fb_helper_debug_leave(struct fb_info *info);
 
 void drm_fb_helper_lastclose(struct drm_device *dev);
 void drm_fb_helper_output_poll_changed(struct drm_device *dev);
-
-void drm_fbdev_generic_setup(struct drm_device *dev,
-			     unsigned int preferred_bpp);
 #else
 static inline void drm_fb_helper_prepare(struct drm_device *dev,
 					struct drm_fb_helper *helper,
@@ -472,12 +469,6 @@ static inline void drm_fb_helper_lastclose(struct drm_device *dev)
 static inline void drm_fb_helper_output_poll_changed(struct drm_device *dev)
 {
 }
-
-static inline void
-drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
-{
-}
-
 #endif
 
 #endif
diff --git a/include/drm/drm_fbdev.h b/include/drm/drm_fbdev.h
new file mode 100644
index 0000000000000..d977087e94b6b
--- /dev/null
+++ b/include/drm/drm_fbdev.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_FBDEV_H
+#define DRM_FBDEV_H
+
+struct drm_device;
+
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp);
+#else
+static inline void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
+{ }
+#endif
+
+#endif
-- 
2.38.0

