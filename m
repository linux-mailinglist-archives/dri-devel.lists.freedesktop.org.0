Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCFB6CFE7B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 10:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466A10ED58;
	Thu, 30 Mar 2023 08:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C8610ED33
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 08:36:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D21841FEA0;
 Thu, 30 Mar 2023 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680165369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAK5DFara2lzZ9XnGKIu36712/QL2/u0vZ2Y5jUr2h8=;
 b=z4s1k77AFCmPNAIkKsv47/Q8PGPdFSGT9d9CIDAodGf9DzkftO2979YteP4nbzGbcpTJn7
 AUEctZeL8ef9fTn+QR3lmp7Dy/g5nDgzfearfe/T1dqY489rpt4G2wXXtwY99v5sNJYxo0
 T7FsJ8i7uxlb4IRiL3rI/ROZrTcfSs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680165369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAK5DFara2lzZ9XnGKIu36712/QL2/u0vZ2Y5jUr2h8=;
 b=5bBoNMP0OTJlPkJfl52foIDBZMIOy2yg4k1zf3h5XEmLbYRJuR1qqSdNu0WT7SiPEBqVW8
 FCw0RQz0DMhasBCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99DA61390D;
 Thu, 30 Mar 2023 08:36:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eEq5JPlJJWQHHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:36:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 5/7] drm/tegra: Hide fbdev support behind config option
Date: Thu, 30 Mar 2023 10:36:05 +0200
Message-Id: <20230330083607.12834-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083607.12834-1-tzimmermann@suse.de>
References: <20230330083607.12834-1-tzimmermann@suse.de>
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
Cc: linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only build tegra's fbdev emulation if CONFIG_DRM_FBDEV_EMULATION
has been enabled. As part of this change, move the code into its
own source file. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/Makefile |   2 +
 drivers/gpu/drm/tegra/drm.h    |  20 +++
 drivers/gpu/drm/tegra/fb.c     | 228 +--------------------------------
 drivers/gpu/drm/tegra/fbdev.c  | 226 ++++++++++++++++++++++++++++++++
 4 files changed, 252 insertions(+), 224 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/fbdev.c

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index bb0d2c144b55..6fc4b504e786 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -29,4 +29,6 @@ tegra-drm-y := \
 
 tegra-drm-y += trace.o
 
+tegra-drm-$(CONFIG_DRM_FBDEV_EMULATION) += fbdev.o
+
 obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 593a60b03189..576f03b8434e 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -185,13 +185,33 @@ struct tegra_bo *tegra_fb_get_plane(struct drm_framebuffer *framebuffer,
 bool tegra_fb_is_bottom_up(struct drm_framebuffer *framebuffer);
 int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 			struct tegra_bo_tiling *tiling);
+struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
+				       const struct drm_mode_fb_cmd2 *mode_cmd,
+				       struct tegra_bo **planes,
+				       unsigned int num_planes);
 struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 					struct drm_file *file,
 					const struct drm_mode_fb_cmd2 *cmd);
+
+#ifdef CONFIG_DRM_FBDEV_EMULATION
 int tegra_drm_fb_prepare(struct drm_device *drm);
 void tegra_drm_fb_free(struct drm_device *drm);
 int tegra_drm_fb_init(struct drm_device *drm);
 void tegra_drm_fb_exit(struct drm_device *drm);
+#else
+static inline int tegra_drm_fb_prepare(struct drm_device *drm)
+{
+	return 0;
+}
+static inline void tegra_drm_fb_free(struct drm_device *drm)
+{ }
+static inline int tegra_drm_fb_init(struct drm_device *drm)
+{
+	return 0;
+}
+static inline void tegra_drm_fb_exit(struct drm_device *drm)
+{ }
+#endif
 
 extern struct platform_driver tegra_display_hub_driver;
 extern struct platform_driver tegra_dc_driver;
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 12eb260d9f51..a719af1dc9a5 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -101,10 +101,10 @@ static const struct drm_framebuffer_funcs tegra_fb_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
 };
 
-static struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
-					      const struct drm_mode_fb_cmd2 *mode_cmd,
-					      struct tegra_bo **planes,
-					      unsigned int num_planes)
+struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
+				       const struct drm_mode_fb_cmd2 *mode_cmd,
+				       struct tegra_bo **planes,
+				       unsigned int num_planes)
 {
 	struct drm_framebuffer *fb;
 	unsigned int i;
@@ -179,223 +179,3 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 
 	return ERR_PTR(err);
 }
-
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-static int tegra_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
-{
-	struct drm_fb_helper *helper = info->par;
-	struct tegra_bo *bo;
-	int err;
-
-	bo = tegra_fb_get_plane(helper->fb, 0);
-
-	err = drm_gem_mmap_obj(&bo->gem, bo->gem.size, vma);
-	if (err < 0)
-		return err;
-
-	return __tegra_gem_mmap(&bo->gem, vma);
-}
-
-static const struct fb_ops tegra_fb_ops = {
-	.owner = THIS_MODULE,
-	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_read = drm_fb_helper_sys_read,
-	.fb_write = drm_fb_helper_sys_write,
-	.fb_fillrect = drm_fb_helper_sys_fillrect,
-	.fb_copyarea = drm_fb_helper_sys_copyarea,
-	.fb_imageblit = drm_fb_helper_sys_imageblit,
-	.fb_mmap = tegra_fb_mmap,
-};
-
-static int tegra_fbdev_probe(struct drm_fb_helper *helper,
-			     struct drm_fb_helper_surface_size *sizes)
-{
-	struct tegra_drm *tegra = helper->dev->dev_private;
-	struct drm_device *drm = helper->dev;
-	struct drm_mode_fb_cmd2 cmd = { 0 };
-	unsigned int bytes_per_pixel;
-	struct drm_framebuffer *fb;
-	unsigned long offset;
-	struct fb_info *info;
-	struct tegra_bo *bo;
-	size_t size;
-	int err;
-
-	bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
-
-	cmd.width = sizes->surface_width;
-	cmd.height = sizes->surface_height;
-	cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
-				  tegra->pitch_align);
-
-	cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-						     sizes->surface_depth);
-
-	size = cmd.pitches[0] * cmd.height;
-
-	bo = tegra_bo_create(drm, size, 0);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	info = drm_fb_helper_alloc_info(helper);
-	if (IS_ERR(info)) {
-		dev_err(drm->dev, "failed to allocate framebuffer info\n");
-		drm_gem_object_put(&bo->gem);
-		return PTR_ERR(info);
-	}
-
-	fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
-	if (IS_ERR(fb)) {
-		err = PTR_ERR(fb);
-		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
-			err);
-		drm_gem_object_put(&bo->gem);
-		return PTR_ERR(fb);
-	}
-
-	helper->fb = fb;
-	helper->info = info;
-
-	info->fbops = &tegra_fb_ops;
-
-	drm_fb_helper_fill_info(info, helper, sizes);
-
-	offset = info->var.xoffset * bytes_per_pixel +
-		 info->var.yoffset * fb->pitches[0];
-
-	if (bo->pages) {
-		bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
-				 pgprot_writecombine(PAGE_KERNEL));
-		if (!bo->vaddr) {
-			dev_err(drm->dev, "failed to vmap() framebuffer\n");
-			err = -ENOMEM;
-			goto destroy;
-		}
-	}
-
-	info->screen_base = (void __iomem *)bo->vaddr + offset;
-	info->screen_size = size;
-	info->fix.smem_start = (unsigned long)(bo->iova + offset);
-	info->fix.smem_len = size;
-
-	return 0;
-
-destroy:
-	drm_framebuffer_remove(fb);
-	return err;
-}
-
-static const struct drm_fb_helper_funcs tegra_fb_helper_funcs = {
-	.fb_probe = tegra_fbdev_probe,
-};
-
-static struct drm_fb_helper *tegra_fbdev_create(struct drm_device *drm)
-{
-	struct drm_fb_helper *helper;
-
-	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
-	if (!helper) {
-		dev_err(drm->dev, "failed to allocate DRM fbdev\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	drm_fb_helper_prepare(drm, helper, 32, &tegra_fb_helper_funcs);
-
-	return helper;
-}
-
-static void tegra_fbdev_free(struct drm_fb_helper *helper)
-{
-	drm_fb_helper_unprepare(helper);
-	kfree(helper);
-}
-
-static int tegra_fbdev_init(struct drm_fb_helper *helper,
-			    unsigned int num_crtc,
-			    unsigned int max_connectors)
-{
-	struct drm_device *drm = helper->dev;
-	int err;
-
-	err = drm_fb_helper_init(drm, helper);
-	if (err < 0) {
-		dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
-			err);
-		return err;
-	}
-
-	err = drm_fb_helper_initial_config(helper);
-	if (err < 0) {
-		dev_err(drm->dev, "failed to set initial configuration: %d\n",
-			err);
-		goto fini;
-	}
-
-	return 0;
-
-fini:
-	drm_fb_helper_fini(helper);
-	return err;
-}
-
-static void tegra_fbdev_exit(struct drm_fb_helper *helper)
-{
-	struct drm_framebuffer *fb = helper->fb;
-
-	drm_fb_helper_unregister_info(helper);
-
-	if (fb) {
-		struct tegra_bo *bo = tegra_fb_get_plane(fb, 0);
-
-		/* Undo the special mapping we made in fbdev probe. */
-		if (bo && bo->pages) {
-			vunmap(bo->vaddr);
-			bo->vaddr = NULL;
-		}
-
-		drm_framebuffer_remove(fb);
-	}
-
-	drm_fb_helper_fini(helper);
-	tegra_fbdev_free(helper);
-}
-#endif
-
-int tegra_drm_fb_prepare(struct drm_device *drm)
-{
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	drm->fb_helper = tegra_fbdev_create(drm);
-	if (IS_ERR(drm->fb_helper))
-		return PTR_ERR(drm->fb_helper);
-#endif
-
-	return 0;
-}
-
-void tegra_drm_fb_free(struct drm_device *drm)
-{
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	tegra_fbdev_free(drm->fb_helper);
-#endif
-}
-
-int tegra_drm_fb_init(struct drm_device *drm)
-{
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	int err;
-
-	err = tegra_fbdev_init(drm->fb_helper, drm->mode_config.num_crtc,
-			       drm->mode_config.num_connector);
-	if (err < 0)
-		return err;
-#endif
-
-	return 0;
-}
-
-void tegra_drm_fb_exit(struct drm_device *drm)
-{
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	tegra_fbdev_exit(drm->fb_helper);
-#endif
-}
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
new file mode 100644
index 000000000000..2400d42f82e4
--- /dev/null
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2012-2013 Avionic Design GmbH
+ * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
+ *
+ * Based on the KMS/FB DMA helpers
+ *   Copyright (C) 2012 Analog Devices Inc.
+ */
+
+#include <linux/console.h>
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper.h>
+
+#include "drm.h"
+#include "gem.h"
+
+static int tegra_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *helper = info->par;
+	struct tegra_bo *bo;
+	int err;
+
+	bo = tegra_fb_get_plane(helper->fb, 0);
+
+	err = drm_gem_mmap_obj(&bo->gem, bo->gem.size, vma);
+	if (err < 0)
+		return err;
+
+	return __tegra_gem_mmap(&bo->gem, vma);
+}
+
+static const struct fb_ops tegra_fb_ops = {
+	.owner = THIS_MODULE,
+	DRM_FB_HELPER_DEFAULT_OPS,
+	.fb_read = drm_fb_helper_sys_read,
+	.fb_write = drm_fb_helper_sys_write,
+	.fb_fillrect = drm_fb_helper_sys_fillrect,
+	.fb_copyarea = drm_fb_helper_sys_copyarea,
+	.fb_imageblit = drm_fb_helper_sys_imageblit,
+	.fb_mmap = tegra_fb_mmap,
+};
+
+static int tegra_fbdev_probe(struct drm_fb_helper *helper,
+			     struct drm_fb_helper_surface_size *sizes)
+{
+	struct tegra_drm *tegra = helper->dev->dev_private;
+	struct drm_device *drm = helper->dev;
+	struct drm_mode_fb_cmd2 cmd = { 0 };
+	unsigned int bytes_per_pixel;
+	struct drm_framebuffer *fb;
+	unsigned long offset;
+	struct fb_info *info;
+	struct tegra_bo *bo;
+	size_t size;
+	int err;
+
+	bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
+
+	cmd.width = sizes->surface_width;
+	cmd.height = sizes->surface_height;
+	cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
+				  tegra->pitch_align);
+
+	cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
+						     sizes->surface_depth);
+
+	size = cmd.pitches[0] * cmd.height;
+
+	bo = tegra_bo_create(drm, size, 0);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	info = drm_fb_helper_alloc_info(helper);
+	if (IS_ERR(info)) {
+		dev_err(drm->dev, "failed to allocate framebuffer info\n");
+		drm_gem_object_put(&bo->gem);
+		return PTR_ERR(info);
+	}
+
+	fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
+	if (IS_ERR(fb)) {
+		err = PTR_ERR(fb);
+		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
+			err);
+		drm_gem_object_put(&bo->gem);
+		return PTR_ERR(fb);
+	}
+
+	helper->fb = fb;
+	helper->info = info;
+
+	info->fbops = &tegra_fb_ops;
+
+	drm_fb_helper_fill_info(info, helper, sizes);
+
+	offset = info->var.xoffset * bytes_per_pixel +
+		 info->var.yoffset * fb->pitches[0];
+
+	if (bo->pages) {
+		bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
+				 pgprot_writecombine(PAGE_KERNEL));
+		if (!bo->vaddr) {
+			dev_err(drm->dev, "failed to vmap() framebuffer\n");
+			err = -ENOMEM;
+			goto destroy;
+		}
+	}
+
+	info->screen_base = (void __iomem *)bo->vaddr + offset;
+	info->screen_size = size;
+	info->fix.smem_start = (unsigned long)(bo->iova + offset);
+	info->fix.smem_len = size;
+
+	return 0;
+
+destroy:
+	drm_framebuffer_remove(fb);
+	return err;
+}
+
+static const struct drm_fb_helper_funcs tegra_fb_helper_funcs = {
+	.fb_probe = tegra_fbdev_probe,
+};
+
+static struct drm_fb_helper *tegra_fbdev_create(struct drm_device *drm)
+{
+	struct drm_fb_helper *helper;
+
+	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
+	if (!helper)
+		return ERR_PTR(-ENOMEM);
+
+	drm_fb_helper_prepare(drm, helper, 32, &tegra_fb_helper_funcs);
+
+	return helper;
+}
+
+static void tegra_fbdev_free(struct drm_fb_helper *helper)
+{
+	drm_fb_helper_unprepare(helper);
+	kfree(helper);
+}
+
+static int tegra_fbdev_init(struct drm_fb_helper *helper,
+			    unsigned int num_crtc,
+			    unsigned int max_connectors)
+{
+	struct drm_device *drm = helper->dev;
+	int err;
+
+	err = drm_fb_helper_init(drm, helper);
+	if (err < 0) {
+		dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
+			err);
+		return err;
+	}
+
+	err = drm_fb_helper_initial_config(helper);
+	if (err < 0) {
+		dev_err(drm->dev, "failed to set initial configuration: %d\n",
+			err);
+		goto fini;
+	}
+
+	return 0;
+
+fini:
+	drm_fb_helper_fini(helper);
+	return err;
+}
+
+static void tegra_fbdev_exit(struct drm_fb_helper *helper)
+{
+	struct drm_framebuffer *fb = helper->fb;
+
+	drm_fb_helper_unregister_info(helper);
+
+	if (fb) {
+		struct tegra_bo *bo = tegra_fb_get_plane(fb, 0);
+
+		/* Undo the special mapping we made in fbdev probe. */
+		if (bo && bo->pages) {
+			vunmap(bo->vaddr);
+			bo->vaddr = NULL;
+		}
+
+		drm_framebuffer_remove(fb);
+	}
+
+	drm_fb_helper_fini(helper);
+	tegra_fbdev_free(helper);
+}
+
+int tegra_drm_fb_prepare(struct drm_device *drm)
+{
+	drm->fb_helper = tegra_fbdev_create(drm);
+	if (IS_ERR(drm->fb_helper))
+		return PTR_ERR(drm->fb_helper);
+
+	return 0;
+}
+
+void tegra_drm_fb_free(struct drm_device *drm)
+{
+	tegra_fbdev_free(drm->fb_helper);
+}
+
+int tegra_drm_fb_init(struct drm_device *drm)
+{
+	int err;
+
+	err = tegra_fbdev_init(drm->fb_helper, drm->mode_config.num_crtc,
+			       drm->mode_config.num_connector);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+void tegra_drm_fb_exit(struct drm_device *drm)
+{
+	tegra_fbdev_exit(drm->fb_helper);
+}
-- 
2.40.0

