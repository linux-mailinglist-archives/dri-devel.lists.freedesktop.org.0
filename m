Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD583B2BE3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626E66EA4F;
	Thu, 24 Jun 2021 09:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37886EA4F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:55:04 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 83EFF1FD35;
 Thu, 24 Jun 2021 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624528503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=y89PAPzhBNVoaWez7lt5Zhqw9cAexX0Sfmxbsofr47E=;
 b=mHwAxzxiWRY7vhRToxdzayjcujo4t7LoaZ6EV72d6HdZ4ohdahHUhqpnbvfJocTqZsnbdW
 gtpXpgX2P09Aw4ynuuP2GH9jsV5qRsWYIIkPx44EVPENwfBiAeID8KPf3Id2mvjzdj+igb
 8vh8RhfGZML3MbQJgxUZ/dGZc1R9Re8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624528503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=y89PAPzhBNVoaWez7lt5Zhqw9cAexX0Sfmxbsofr47E=;
 b=S7oPQAmv3YL7GktbW6vKREv/1lrE6LPjNlOmmCSH5DDIMZGl32tW6hTqmmjMb6FpqTC2pX
 lbZWhfZ0ZVlRWKDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5394911A97;
 Thu, 24 Jun 2021 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624528503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=y89PAPzhBNVoaWez7lt5Zhqw9cAexX0Sfmxbsofr47E=;
 b=mHwAxzxiWRY7vhRToxdzayjcujo4t7LoaZ6EV72d6HdZ4ohdahHUhqpnbvfJocTqZsnbdW
 gtpXpgX2P09Aw4ynuuP2GH9jsV5qRsWYIIkPx44EVPENwfBiAeID8KPf3Id2mvjzdj+igb
 8vh8RhfGZML3MbQJgxUZ/dGZc1R9Re8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624528503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=y89PAPzhBNVoaWez7lt5Zhqw9cAexX0Sfmxbsofr47E=;
 b=S7oPQAmv3YL7GktbW6vKREv/1lrE6LPjNlOmmCSH5DDIMZGl32tW6hTqmmjMb6FpqTC2pX
 lbZWhfZ0ZVlRWKDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id mVxjE3dW1GB5UQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 09:55:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/rockchip: Implement mmap as GEM object function
Date: Thu, 24 Jun 2021 11:55:02 +0200
Message-Id: <20210624095502.8945-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

The respective rockchip functions are being removed. The file_operations
structure fops is now being created by the helper macro
DEFINE_DRM_GEM_FOPS().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   | 13 +-----
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 44 +++++--------------
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |  7 ---
 4 files changed, 15 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index b730b8d5d949..2e3ab573a817 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -208,16 +208,7 @@ static void rockchip_drm_unbind(struct device *dev)
 	drm_dev_put(drm_dev);
 }
 
-static const struct file_operations rockchip_drm_driver_fops = {
-	.owner = THIS_MODULE,
-	.open = drm_open,
-	.mmap = rockchip_gem_mmap,
-	.poll = drm_poll,
-	.read = drm_read,
-	.unlocked_ioctl = drm_ioctl,
-	.compat_ioctl = drm_compat_ioctl,
-	.release = drm_release,
-};
+DEFINE_DRM_GEM_FOPS(rockchip_drm_driver_fops);
 
 static const struct drm_driver rockchip_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
@@ -226,7 +217,7 @@ static const struct drm_driver rockchip_drm_driver = {
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table	= rockchip_gem_prime_import_sg_table,
-	.gem_prime_mmap		= rockchip_gem_mmap_buf,
+	.gem_prime_mmap		= drm_gem_prime_mmap,
 	.fops			= &rockchip_drm_driver_fops,
 	.name	= DRIVER_NAME,
 	.desc	= DRIVER_DESC,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
index 2fdc455c4ad7..d8418dd39d0e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
@@ -7,6 +7,7 @@
 #include <drm/drm.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
 
 #include "rockchip_drm_drv.h"
@@ -24,7 +25,7 @@ static int rockchip_fbdev_mmap(struct fb_info *info,
 	struct drm_fb_helper *helper = info->par;
 	struct rockchip_drm_private *private = to_drm_private(helper);
 
-	return rockchip_gem_mmap_buf(private->fbdev_bo, vma);
+	return drm_gem_prime_mmap(private->fbdev_bo, vma);
 }
 
 static const struct fb_ops rockchip_drm_fbdev_ops = {
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 7971f57436dd..63eb73b624aa 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -240,12 +240,22 @@ static int rockchip_drm_gem_object_mmap(struct drm_gem_object *obj,
 	int ret;
 	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
 
+	/*
+	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
+	 * whole buffer from the start.
+	 */
+	vma->vm_pgoff = 0;
+
 	/*
 	 * We allocated a struct page table for rk_obj, so clear
 	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
 	 */
+	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_flags &= ~VM_PFNMAP;
 
+	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	if (rk_obj->pages)
 		ret = rockchip_drm_gem_object_mmap_iommu(obj, vma);
 	else
@@ -257,39 +267,6 @@ static int rockchip_drm_gem_object_mmap(struct drm_gem_object *obj,
 	return ret;
 }
 
-int rockchip_gem_mmap_buf(struct drm_gem_object *obj,
-			  struct vm_area_struct *vma)
-{
-	int ret;
-
-	ret = drm_gem_mmap_obj(obj, obj->size, vma);
-	if (ret)
-		return ret;
-
-	return rockchip_drm_gem_object_mmap(obj, vma);
-}
-
-/* drm driver mmap file operations */
-int rockchip_gem_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_gem_object *obj;
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret)
-		return ret;
-
-	/*
-	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
-	 * whole buffer from the start.
-	 */
-	vma->vm_pgoff = 0;
-
-	obj = vma->vm_private_data;
-
-	return rockchip_drm_gem_object_mmap(obj, vma);
-}
-
 static void rockchip_gem_release_object(struct rockchip_gem_object *rk_obj)
 {
 	drm_gem_object_release(&rk_obj->base);
@@ -301,6 +278,7 @@ static const struct drm_gem_object_funcs rockchip_gem_object_funcs = {
 	.get_sg_table = rockchip_gem_prime_get_sg_table,
 	.vmap = rockchip_gem_prime_vmap,
 	.vunmap	= rockchip_gem_prime_vunmap,
+	.mmap = rockchip_drm_gem_object_mmap,
 	.vm_ops = &drm_gem_cma_vm_ops,
 };
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
index 5a70a56cd406..47c1861eece0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
@@ -34,13 +34,6 @@ rockchip_gem_prime_import_sg_table(struct drm_device *dev,
 int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 
-/* drm driver mmap file operations */
-int rockchip_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-
-/* mmap a gem object to userspace. */
-int rockchip_gem_mmap_buf(struct drm_gem_object *obj,
-			  struct vm_area_struct *vma);
-
 struct rockchip_gem_object *
 	rockchip_gem_create_object(struct drm_device *drm, unsigned int size,
 				   bool alloc_kmap);
-- 
2.32.0

