Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A423B2B04
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140006E9F7;
	Thu, 24 Jun 2021 09:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC786E9F7;
 Thu, 24 Jun 2021 09:03:45 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 056BF21966;
 Thu, 24 Jun 2021 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624525424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/wTWL02/ZGtmm6qLgcS2qa07ZCZmv3vn08NiAa+vqJ0=;
 b=kSpxLp5K1bRDwz72LcYaqqRmVeCp4gNLQustc3A+3vOMUEND1Rd6q9aVMbMJzjyZiDdUa6
 REoLeGl0kVT8k1iOUBAe7pfc9LRMVRWMT+erZQxuqwoq34eIJdxAKW3K6X/vraRxDHvTDm
 +9mb6pHkK7TE4i44glfsSsSu7ZBPMsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624525424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/wTWL02/ZGtmm6qLgcS2qa07ZCZmv3vn08NiAa+vqJ0=;
 b=R1x2/YUi3HuYHhSJerkAxe+2XoaOhPf9VBGVS/Jptp4Y+FZy8yMkttPCTY6dyy1R3yExKK
 WBLpf4f0jiGe/7Bg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CFFE511A97;
 Thu, 24 Jun 2021 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624525424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/wTWL02/ZGtmm6qLgcS2qa07ZCZmv3vn08NiAa+vqJ0=;
 b=kSpxLp5K1bRDwz72LcYaqqRmVeCp4gNLQustc3A+3vOMUEND1Rd6q9aVMbMJzjyZiDdUa6
 REoLeGl0kVT8k1iOUBAe7pfc9LRMVRWMT+erZQxuqwoq34eIJdxAKW3K6X/vraRxDHvTDm
 +9mb6pHkK7TE4i44glfsSsSu7ZBPMsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624525424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/wTWL02/ZGtmm6qLgcS2qa07ZCZmv3vn08NiAa+vqJ0=;
 b=R1x2/YUi3HuYHhSJerkAxe+2XoaOhPf9VBGVS/Jptp4Y+FZy8yMkttPCTY6dyy1R3yExKK
 WBLpf4f0jiGe/7Bg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id A0HYMW9K1GDZNAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 09:03:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm: Implement mmap as GEM object function
Date: Thu, 24 Jun 2021 11:03:41 +0200
Message-Id: <20210624090341.8249-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

The respective msm functions are being removed. The file_operations
structure fops is now being created by the helper macro
DEFINE_DRM_GEM_FOPS().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_drv.c       | 14 +-----
 drivers/gpu/drm/msm/msm_drv.h       |  1 -
 drivers/gpu/drm/msm/msm_fbdev.c     | 10 +----
 drivers/gpu/drm/msm/msm_gem.c       | 67 ++++++++++++-----------------
 drivers/gpu/drm/msm/msm_gem.h       |  3 --
 drivers/gpu/drm/msm/msm_gem_prime.c | 11 -----
 6 files changed, 31 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index fe7d17cd35ec..f62eaedfc0d7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -985,17 +985,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
 };
 
-static const struct file_operations fops = {
-	.owner              = THIS_MODULE,
-	.open               = drm_open,
-	.release            = drm_release,
-	.unlocked_ioctl     = drm_ioctl,
-	.compat_ioctl       = drm_compat_ioctl,
-	.poll               = drm_poll,
-	.read               = drm_read,
-	.llseek             = no_llseek,
-	.mmap               = msm_gem_mmap,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 static const struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
@@ -1015,7 +1005,7 @@ static const struct drm_driver msm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
-	.gem_prime_mmap     = msm_gem_prime_mmap,
+	.gem_prime_mmap     = drm_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2668941df529..8f1e0d7c8bbb 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -300,7 +300,6 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 227404077e39..07225907fd2d 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -8,6 +8,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_prime.h>
 
 #include "msm_drv.h"
 #include "msm_gem.h"
@@ -48,15 +49,8 @@ static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
 	struct msm_fbdev *fbdev = to_msm_fbdev(helper);
 	struct drm_gem_object *bo = msm_framebuffer_bo(fbdev->fb, 0);
-	int ret = 0;
 
-	ret = drm_gem_mmap_obj(bo, bo->size, vma);
-	if (ret) {
-		pr_err("%s:drm_gem_mmap_obj fail\n", __func__);
-		return ret;
-	}
-
-	return msm_gem_mmap_obj(bo, vma);
+	return drm_gem_prime_mmap(bo, vma);
 }
 
 static int msm_fbdev_create(struct drm_fb_helper *helper,
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b61f5466e522..71d835bc575d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -211,46 +211,6 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
 	msm_gem_unlock(obj);
 }
 
-int msm_gem_mmap_obj(struct drm_gem_object *obj,
-		struct vm_area_struct *vma)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
-
-	if (msm_obj->flags & MSM_BO_WC) {
-		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
-	} else if (msm_obj->flags & MSM_BO_UNCACHED) {
-		vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
-	} else {
-		/*
-		 * Shunt off cached objs to shmem file so they have their own
-		 * address_space (so unmap_mapping_range does what we want,
-		 * in particular in the case of mmap'd dmabufs)
-		 */
-		vma->vm_pgoff = 0;
-		vma_set_file(vma, obj->filp);
-
-		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-	}
-
-	return 0;
-}
-
-int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret) {
-		DBG("mmap failed: %d", ret);
-		return ret;
-	}
-
-	return msm_gem_mmap_obj(vma->vm_private_data, vma);
-}
-
 static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
@@ -1119,6 +1079,32 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	kfree(msm_obj);
 }
 
+static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_flags |= VM_MIXEDMAP;
+
+	if (msm_obj->flags & MSM_BO_WC) {
+		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+	} else if (msm_obj->flags & MSM_BO_UNCACHED) {
+		vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
+	} else {
+		/*
+		 * Shunt off cached objs to shmem file so they have their own
+		 * address_space (so unmap_mapping_range does what we want,
+		 * in particular in the case of mmap'd dmabufs)
+		 */
+		vma->vm_pgoff = 0;
+		vma_set_file(vma, obj->filp);
+
+		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	}
+
+	return 0;
+}
+
 /* convenience method to construct a GEM buffer object, and userspace handle */
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		uint32_t size, uint32_t flags, uint32_t *handle,
@@ -1156,6 +1142,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.get_sg_table = msm_gem_prime_get_sg_table,
 	.vmap = msm_gem_prime_vmap,
 	.vunmap = msm_gem_prime_vunmap,
+	.mmap = msm_gem_object_mmap,
 	.vm_ops = &vm_ops,
 };
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 03e2cc2a2ce1..8508163088a9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -112,9 +112,6 @@ struct msm_gem_object {
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
-int msm_gem_mmap_obj(struct drm_gem_object *obj,
-			struct vm_area_struct *vma);
-int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 9880348a4dc7..fc94e061d6a7 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -39,17 +39,6 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	msm_gem_put_vaddr(obj);
 }
 
-int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
-{
-	int ret;
-
-	ret = drm_gem_mmap_obj(obj, obj->size, vma);
-	if (ret < 0)
-		return ret;
-
-	return msm_gem_mmap_obj(vma->vm_private_data, vma);
-}
-
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg)
 {
-- 
2.32.0

