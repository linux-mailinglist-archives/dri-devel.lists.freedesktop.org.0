Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF6DA686E3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 09:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A4410E2EB;
	Wed, 19 Mar 2025 08:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C2810E232
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 08:34:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3A5721A22;
 Wed, 19 Mar 2025 08:33:53 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CAAD13A38;
 Wed, 19 Mar 2025 08:33:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cE0rIXGB2mc+OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Mar 2025 08:33:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/18] drm/sysfb: Add struct drm_sysfb_device
Date: Wed, 19 Mar 2025 08:45:04 +0100
Message-ID: <20250319083021.6472-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319083021.6472-1-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: C3A5721A22
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

Add struct drm_sysfb_device that stores the system display's hardware
settings. Further helpers for the mode-setting pipeline will use these
fields. Convert ofdrm and simpledrm by embedding the sysfb device in
their device structs.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/Kconfig            |  6 ++
 drivers/gpu/drm/sysfb/Makefile           |  2 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c |  8 +++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h | 35 +++++++++
 drivers/gpu/drm/sysfb/ofdrm.c            | 78 ++++++++++----------
 drivers/gpu/drm/sysfb/simpledrm.c        | 90 ++++++++++++------------
 6 files changed, 135 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.c
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.h

diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index 9eafc06b7192..87094da417f6 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -3,6 +3,10 @@
 menu "Drivers for system framebuffers"
 	depends on DRM
 
+config DRM_SYSFB_HELPER
+	tristate
+	depends on DRM
+
 config DRM_OFDRM
 	tristate "Open Firmware display driver"
 	depends on DRM && MMU && OF && (PPC || COMPILE_TEST)
@@ -10,6 +14,7 @@ config DRM_OFDRM
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
+	select DRM_SYSFB_HELPER
 	help
 	  DRM driver for Open Firmware framebuffers.
 
@@ -24,6 +29,7 @@ config DRM_SIMPLEDRM
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
+	select DRM_SYSFB_HELPER
 	help
 	  DRM driver for simple platform-provided framebuffers.
 
diff --git a/drivers/gpu/drm/sysfb/Makefile b/drivers/gpu/drm/sysfb/Makefile
index f6c03629accb..f1e8700c3e35 100644
--- a/drivers/gpu/drm/sysfb/Makefile
+++ b/drivers/gpu/drm/sysfb/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-$(CONFIG_DRM_SYSFB_HELPER)	+= drm_sysfb_helper.o
+
 obj-$(CONFIG_DRM_OFDRM)		+= ofdrm.o
 obj-$(CONFIG_DRM_SIMPLEDRM)	+= simpledrm.o
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
new file mode 100644
index 000000000000..c083d21fd9ca
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/module.h>
+
+#include "drm_sysfb_helper.h"
+
+MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
new file mode 100644
index 000000000000..8f05eee7f49e
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef DRM_SYSFB_HELPER_H
+#define DRM_SYSFB_HELPER_H
+
+#include <linux/container_of.h>
+#include <linux/iosys-map.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_modes.h>
+
+struct drm_format_info;
+
+/*
+ * Device
+ */
+
+struct drm_sysfb_device {
+	struct drm_device dev;
+
+	/* hardware settings */
+	struct drm_display_mode fb_mode;
+	const struct drm_format_info *fb_format;
+	unsigned int fb_pitch;
+
+	/* hardware-framebuffer kernel address */
+	struct iosys_map fb_addr;
+};
+
+static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *dev)
+{
+	return container_of(dev, struct drm_sysfb_device, dev);
+}
+
+#endif
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index 7d5beaf6a42c..d42704facb45 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -22,6 +22,8 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 
+#include "drm_sysfb_helper.h"
+
 #define DRIVER_NAME	"ofdrm"
 #define DRIVER_DESC	"DRM driver for OF platform devices"
 #define DRIVER_MAJOR	1
@@ -289,16 +291,10 @@ struct ofdrm_device_funcs {
 };
 
 struct ofdrm_device {
-	struct drm_device dev;
+	struct drm_sysfb_device sysfb;
 
 	const struct ofdrm_device_funcs *funcs;
 
-	/* firmware-buffer settings */
-	struct iosys_map screen_base;
-	struct drm_display_mode mode;
-	const struct drm_format_info *format;
-	unsigned int pitch;
-
 	/* colormap */
 	void __iomem *cmap_base;
 
@@ -312,7 +308,7 @@ struct ofdrm_device {
 
 static struct ofdrm_device *ofdrm_device_of_dev(struct drm_device *dev)
 {
-	return container_of(dev, struct ofdrm_device, dev);
+	return container_of(to_drm_sysfb_device(dev), struct ofdrm_device, sysfb);
 }
 
 /*
@@ -352,7 +348,7 @@ static void ofdrm_pci_release(void *data)
 
 static int ofdrm_device_init_pci(struct ofdrm_device *odev)
 {
-	struct drm_device *dev = &odev->dev;
+	struct drm_device *dev = &odev->sysfb.dev;
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct device_node *of_node = pdev->dev.of_node;
 	struct pci_dev *pcidev;
@@ -395,7 +391,7 @@ static int ofdrm_device_init_pci(struct ofdrm_device *odev)
 static struct resource *ofdrm_find_fb_resource(struct ofdrm_device *odev,
 					       struct resource *fb_res)
 {
-	struct platform_device *pdev = to_platform_device(odev->dev.dev);
+	struct platform_device *pdev = to_platform_device(odev->sysfb.dev.dev);
 	struct resource *res, *max_res = NULL;
 	u32 i;
 
@@ -421,7 +417,7 @@ static struct resource *ofdrm_find_fb_resource(struct ofdrm_device *odev,
 static void __iomem *get_cmap_address_of(struct ofdrm_device *odev, struct device_node *of_node,
 					 int bar_no, unsigned long offset, unsigned long size)
 {
-	struct drm_device *dev = &odev->dev;
+	struct drm_device *dev = &odev->sysfb.dev;
 	const __be32 *addr_p;
 	u64 max_size, address;
 	unsigned int flags;
@@ -454,7 +450,7 @@ static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
 					       struct device_node *of_node,
 					       u64 fb_base)
 {
-	struct drm_device *dev = &odev->dev;
+	struct drm_device *dev = &odev->sysfb.dev;
 	u64 address;
 	void __iomem *cmap_base;
 
@@ -616,7 +612,7 @@ static void __iomem *ofdrm_qemu_cmap_ioremap(struct ofdrm_device *odev,
 		cpu_to_be32(0x00),
 	};
 
-	struct drm_device *dev = &odev->dev;
+	struct drm_device *dev = &odev->sysfb.dev;
 	u64 address;
 	void __iomem *cmap_base;
 
@@ -646,7 +642,7 @@ static void ofdrm_qemu_cmap_write(struct ofdrm_device *odev, unsigned char index
 static void ofdrm_device_set_gamma_linear(struct ofdrm_device *odev,
 					  const struct drm_format_info *format)
 {
-	struct drm_device *dev = &odev->dev;
+	struct drm_device *dev = &odev->sysfb.dev;
 	int i;
 
 	switch (format->format) {
@@ -685,7 +681,7 @@ static void ofdrm_device_set_gamma(struct ofdrm_device *odev,
 				   const struct drm_format_info *format,
 				   struct drm_color_lut *lut)
 {
-	struct drm_device *dev = &odev->dev;
+	struct drm_device *dev = &odev->sysfb.dev;
 	int i;
 
 	switch (format->format) {
@@ -756,7 +752,7 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						   struct drm_atomic_state *new_state)
 {
 	struct drm_device *dev = plane->dev;
-	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
 	struct drm_shadow_plane_state *new_shadow_plane_state =
 		to_drm_shadow_plane_state(new_plane_state);
@@ -778,12 +774,12 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
-	if (new_fb->format != odev->format) {
+	if (new_fb->format != sysfb->fb_format) {
 		void *buf;
 
 		/* format conversion necessary; reserve buffer */
 		buf = drm_format_conv_state_reserve(&new_shadow_plane_state->fmtcnv_state,
-						    odev->pitch, GFP_KERNEL);
+						    sysfb->fb_pitch, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
 	}
@@ -800,13 +796,13 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						     struct drm_atomic_state *state)
 {
 	struct drm_device *dev = plane->dev;
-	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
-	unsigned int dst_pitch = odev->pitch;
-	const struct drm_format_info *dst_format = odev->format;
+	unsigned int dst_pitch = sysfb->fb_pitch;
+	const struct drm_format_info *dst_format = sysfb->fb_format;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int ret, idx;
@@ -820,7 +816,7 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		struct iosys_map dst = odev->screen_base;
+		struct iosys_map dst = sysfb->fb_addr;
 		struct drm_rect dst_clip = plane_state->dst;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
@@ -840,12 +836,12 @@ static void ofdrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 						      struct drm_atomic_state *state)
 {
 	struct drm_device *dev = plane->dev;
-	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
-	struct iosys_map dst = odev->screen_base;
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
+	struct iosys_map dst = sysfb->fb_addr;
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
-	unsigned int dst_pitch = odev->pitch;
-	const struct drm_format_info *dst_format = odev->format;
+	unsigned int dst_pitch = sysfb->fb_pitch;
+	const struct drm_format_info *dst_format = sysfb->fb_format;
 	struct drm_rect dst_clip;
 	unsigned long lines, linepixels, i;
 	int idx;
@@ -887,9 +883,9 @@ static const struct drm_plane_funcs ofdrm_primary_plane_funcs = {
 static enum drm_mode_status ofdrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
 							 const struct drm_display_mode *mode)
 {
-	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(crtc->dev);
 
-	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &odev->mode);
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sysfb->fb_mode);
 }
 
 static int ofdrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
@@ -1004,9 +1000,9 @@ static const struct drm_encoder_funcs ofdrm_encoder_funcs = {
 
 static int ofdrm_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ofdrm_device *odev = ofdrm_device_of_dev(connector->dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(connector->dev);
 
-	return drm_connector_helper_get_modes_fixed(connector, &odev->mode);
+	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
 }
 
 static const struct drm_connector_helper_funcs ofdrm_connector_helper_funcs = {
@@ -1094,6 +1090,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 {
 	struct device_node *of_node = pdev->dev.of_node;
 	struct ofdrm_device *odev;
+	struct drm_sysfb_device *sysfb;
 	struct drm_device *dev;
 	enum ofdrm_model model;
 	bool big_endian;
@@ -1111,10 +1108,11 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	size_t nformats;
 	int ret;
 
-	odev = devm_drm_dev_alloc(&pdev->dev, drv, struct ofdrm_device, dev);
+	odev = devm_drm_dev_alloc(&pdev->dev, drv, struct ofdrm_device, sysfb.dev);
 	if (IS_ERR(odev))
 		return ERR_CAST(odev);
-	dev = &odev->dev;
+	sysfb = &odev->sysfb;
+	dev = &sysfb->dev;
 	platform_set_drvdata(pdev, dev);
 
 	ret = ofdrm_device_init_pci(odev);
@@ -1252,12 +1250,12 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	 * Firmware framebuffer
 	 */
 
-	iosys_map_set_vaddr_iomem(&odev->screen_base, screen_base);
-	odev->mode = ofdrm_mode(width, height);
-	odev->format = format;
-	odev->pitch = linebytes;
+	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
+	sysfb->fb_mode = ofdrm_mode(width, height);
+	sysfb->fb_format = format;
+	sysfb->fb_pitch = linebytes;
 
-	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&odev->mode));
+	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sysfb->fb_mode));
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, linebytes=%d byte\n",
 		&format->format, width, height, linebytes);
 
@@ -1362,19 +1360,21 @@ static struct drm_driver ofdrm_driver = {
 static int ofdrm_probe(struct platform_device *pdev)
 {
 	struct ofdrm_device *odev;
+	struct drm_sysfb_device *sysfb;
 	struct drm_device *dev;
 	int ret;
 
 	odev = ofdrm_device_create(&ofdrm_driver, pdev);
 	if (IS_ERR(odev))
 		return PTR_ERR(odev);
-	dev = &odev->dev;
+	sysfb = &odev->sysfb;
+	dev = &sysfb->dev;
 
 	ret = drm_dev_register(dev, 0);
 	if (ret)
 		return ret;
 
-	drm_client_setup(dev, odev->format);
+	drm_client_setup(dev, sysfb->fb_format);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index d949713f5ff6..f258d8cdb6b6 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -29,6 +29,8 @@
 #include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
+#include "drm_sysfb_helper.h"
+
 #define DRIVER_NAME	"simpledrm"
 #define DRIVER_DESC	"DRM driver for simple-framebuffer platform devices"
 #define DRIVER_MAJOR	1
@@ -217,7 +219,7 @@ simplefb_get_memory_of(struct drm_device *dev, struct device_node *of_node)
  */
 
 struct simpledrm_device {
-	struct drm_device dev;
+	struct drm_sysfb_device sysfb;
 
 	/* clocks */
 #if defined CONFIG_OF && defined CONFIG_COMMON_CLK
@@ -236,14 +238,6 @@ struct simpledrm_device {
 	struct device_link **pwr_dom_links;
 #endif
 
-	/* simplefb settings */
-	struct drm_display_mode mode;
-	const struct drm_format_info *format;
-	unsigned int pitch;
-
-	/* memory management */
-	struct iosys_map screen_base;
-
 	/* modesetting */
 	uint32_t formats[8];
 	struct drm_plane primary_plane;
@@ -254,7 +248,7 @@ struct simpledrm_device {
 
 static struct simpledrm_device *simpledrm_device_of_dev(struct drm_device *dev)
 {
-	return container_of(dev, struct simpledrm_device, dev);
+	return container_of(to_drm_sysfb_device(dev), struct simpledrm_device, sysfb);
 }
 
 /*
@@ -296,7 +290,7 @@ static void simpledrm_device_release_clocks(void *res)
 
 static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
 {
-	struct drm_device *dev = &sdev->dev;
+	struct drm_device *dev = &sdev->sysfb.dev;
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct device_node *of_node = pdev->dev.of_node;
 	struct clk *clock;
@@ -394,7 +388,7 @@ static void simpledrm_device_release_regulators(void *res)
 
 static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 {
-	struct drm_device *dev = &sdev->dev;
+	struct drm_device *dev = &sdev->sysfb.dev;
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct device_node *of_node = pdev->dev.of_node;
 	struct property *prop;
@@ -515,7 +509,7 @@ static void simpledrm_device_detach_genpd(void *res)
 
 static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
 {
-	struct device *dev = sdev->dev.dev;
+	struct device *dev = sdev->sysfb.dev.dev;
 	int i;
 
 	sdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
@@ -547,7 +541,7 @@ static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
 				simpledrm_device_detach_genpd(sdev);
 				return ret;
 			}
-			drm_warn(&sdev->dev,
+			drm_warn(&sdev->sysfb.dev,
 				 "pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
 			continue;
 		}
@@ -558,7 +552,7 @@ static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
 							 DL_FLAG_PM_RUNTIME |
 							 DL_FLAG_RPM_ACTIVE);
 		if (!sdev->pwr_dom_links[i])
-			drm_warn(&sdev->dev, "failed to link power-domain %d\n", i);
+			drm_warn(&sdev->sysfb.dev, "failed to link power-domain %d\n", i);
 	}
 
 	return devm_add_action_or_reset(dev, simpledrm_device_detach_genpd, sdev);
@@ -589,7 +583,7 @@ static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 	struct drm_device *dev = plane->dev;
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
 	int ret;
 
 	if (new_crtc)
@@ -604,12 +598,12 @@ static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
-	if (new_fb->format != sdev->format) {
+	if (new_fb->format != sysfb->fb_format) {
 		void *buf;
 
 		/* format conversion necessary; reserve buffer */
 		buf = drm_format_conv_state_reserve(&new_shadow_plane_state->fmtcnv_state,
-						    sdev->pitch, GFP_KERNEL);
+						    sysfb->fb_pitch, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
 	}
@@ -625,7 +619,7 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_device *dev = plane->dev;
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int ret, idx;
@@ -640,13 +634,15 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		struct drm_rect dst_clip = plane_state->dst;
-		struct iosys_map dst = sdev->screen_base;
+		struct iosys_map dst = sysfb->fb_addr;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
-		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
-		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
+		iosys_map_incr(&dst, drm_fb_clip_offset(sysfb->fb_pitch, sysfb->fb_format,
+							&dst_clip));
+		drm_fb_blit(&dst, &sysfb->fb_pitch, sysfb->fb_format->format,
+			    shadow_plane_state->data,
 			    fb, &damage, &shadow_plane_state->fmtcnv_state);
 	}
 
@@ -659,14 +655,14 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 							  struct drm_atomic_state *state)
 {
 	struct drm_device *dev = plane->dev;
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(plane->dev);
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
 	/* Clear screen to black if disabled */
-	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mode.vdisplay);
+	iosys_map_memset(&sysfb->fb_addr, 0, 0, sysfb->fb_pitch * sysfb->fb_mode.vdisplay);
 
 	drm_dev_exit(idx);
 }
@@ -674,13 +670,13 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 static int simpledrm_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
 							     struct drm_scanout_buffer *sb)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(plane->dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(plane->dev);
 
-	sb->width = sdev->mode.hdisplay;
-	sb->height = sdev->mode.vdisplay;
-	sb->format = sdev->format;
-	sb->pitch[0] = sdev->pitch;
-	sb->map[0] = sdev->screen_base;
+	sb->width = sysfb->fb_mode.hdisplay;
+	sb->height = sysfb->fb_mode.vdisplay;
+	sb->format = sysfb->fb_format;
+	sb->pitch[0] = sysfb->fb_pitch;
+	sb->map[0] = sysfb->fb_addr;
 
 	return 0;
 }
@@ -703,9 +699,9 @@ static const struct drm_plane_funcs simpledrm_primary_plane_funcs = {
 static enum drm_mode_status simpledrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
 							     const struct drm_display_mode *mode)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(crtc->dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(crtc->dev);
 
-	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sdev->mode);
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sysfb->fb_mode);
 }
 
 /*
@@ -733,9 +729,9 @@ static const struct drm_encoder_funcs simpledrm_encoder_funcs = {
 
 static int simpledrm_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(connector->dev);
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(connector->dev);
 
-	return drm_connector_helper_get_modes_fixed(connector, &sdev->mode);
+	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
 }
 
 static const struct drm_connector_helper_funcs simpledrm_connector_helper_funcs = {
@@ -778,6 +774,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
 	struct device_node *of_node = pdev->dev.of_node;
 	struct simpledrm_device *sdev;
+	struct drm_sysfb_device *sysfb;
 	struct drm_device *dev;
 	int width, height, stride;
 	int width_mm = 0, height_mm = 0;
@@ -792,10 +789,11 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	size_t nformats;
 	int ret;
 
-	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device, dev);
+	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device, sysfb.dev);
 	if (IS_ERR(sdev))
 		return ERR_CAST(sdev);
-	dev = &sdev->dev;
+	sysfb = &sdev->sysfb;
+	dev = &sysfb->dev;
 	platform_set_drvdata(pdev, sdev);
 
 	/*
@@ -866,11 +864,11 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (!height_mm)
 		height_mm = DRM_MODE_RES_MM(height, 96ul);
 
-	sdev->mode = simpledrm_mode(width, height, width_mm, height_mm);
-	sdev->format = format;
-	sdev->pitch = stride;
+	sysfb->fb_mode = simpledrm_mode(width, height, width_mm, height_mm);
+	sysfb->fb_format = format;
+	sysfb->fb_pitch = stride;
 
-	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sdev->mode));
+	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sysfb->fb_mode));
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
 		&format->format, width, height, stride);
 
@@ -894,7 +892,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		if (IS_ERR(screen_base))
 			return screen_base;
 
-		iosys_map_set_vaddr(&sdev->screen_base, screen_base);
+		iosys_map_set_vaddr(&sysfb->fb_addr, screen_base);
 	} else {
 		void __iomem *screen_base;
 
@@ -927,7 +925,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		if (!screen_base)
 			return ERR_PTR(-ENOMEM);
 
-		iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
+		iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
 	}
 
 	/*
@@ -1026,19 +1024,21 @@ static struct drm_driver simpledrm_driver = {
 static int simpledrm_probe(struct platform_device *pdev)
 {
 	struct simpledrm_device *sdev;
+	struct drm_sysfb_device *sysfb;
 	struct drm_device *dev;
 	int ret;
 
 	sdev = simpledrm_device_create(&simpledrm_driver, pdev);
 	if (IS_ERR(sdev))
 		return PTR_ERR(sdev);
-	dev = &sdev->dev;
+	sysfb = &sdev->sysfb;
+	dev = &sysfb->dev;
 
 	ret = drm_dev_register(dev, 0);
 	if (ret)
 		return ret;
 
-	drm_client_setup(dev, sdev->format);
+	drm_client_setup(dev, sdev->sysfb.fb_format);
 
 	return 0;
 }
@@ -1046,7 +1046,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 static void simpledrm_remove(struct platform_device *pdev)
 {
 	struct simpledrm_device *sdev = platform_get_drvdata(pdev);
-	struct drm_device *dev = &sdev->dev;
+	struct drm_device *dev = &sdev->sysfb.dev;
 
 	drm_dev_unplug(dev);
 }
-- 
2.48.1

