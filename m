Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 595473BC815
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 10:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED8D89D43;
	Tue,  6 Jul 2021 08:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBFF89D02;
 Tue,  6 Jul 2021 08:47:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 745E31FF34;
 Tue,  6 Jul 2021 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625561275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jhBCujPABZPNUH3fBBFSxVuzrudipOZC/VeSlBUNZGs=;
 b=tCSAPs0SnB2OiPsJETed+5QRiaW6k4ag2fZFC4OSut+GaHlGFJao2B9MShfG/GhXNLE0Bj
 NVteb7TVd93d2tM5pJqiHf5jcul1I00n0oegdvklHVOhynNOrSzrX6VmJSfOU+wykKkija
 1F9LC2PVW4QuuaBZIs4aozzztnqg+8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625561275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jhBCujPABZPNUH3fBBFSxVuzrudipOZC/VeSlBUNZGs=;
 b=QPeY/90fe2QVkyBl6oYrUDDWzt/dJkc21IhOjzeNp+0lC5eabr4oF6iVGeXSS6KEE/7yJE
 Ios9YN9NPnK2ruDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24B7A13A70;
 Tue,  6 Jul 2021 08:47:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lhv1B7sY5GCYfQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 08:47:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 jonathan@marek.ca, jordan@cosmicpenguin.net
Subject: [PATCH v2] drm/msm: Implement mmap as GEM object function
Date: Tue,  6 Jul 2021 10:47:53 +0200
Message-Id: <20210706084753.8194-1-tzimmermann@suse.de>
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

v2:
	* rebase onto latest upstream
	* remove declaration of msm_gem_mmap_obj() from msm_fbdev.c

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_drv.c       | 14 ++---------
 drivers/gpu/drm/msm/msm_drv.h       |  1 -
 drivers/gpu/drm/msm/msm_fbdev.c     | 12 ++--------
 drivers/gpu/drm/msm/msm_gem.c       | 37 ++++++++++-------------------
 drivers/gpu/drm/msm/msm_gem.h       |  3 ---
 drivers/gpu/drm/msm/msm_gem_prime.c | 11 ---------
 6 files changed, 16 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b8fa2ad0d84..a4d238e8d377 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1004,17 +1004,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
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
@@ -1034,7 +1024,7 @@ static const struct drm_driver msm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
-	.gem_prime_mmap     = msm_gem_prime_mmap,
+	.gem_prime_mmap     = drm_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 1a48a709ffb3..1a42903db347 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -309,7 +309,6 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 67fae60f2fa5..0daaeb54ff6f 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -8,13 +8,12 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_prime.h>

 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_kms.h"

-extern int msm_gem_mmap_obj(struct drm_gem_object *obj,
-					struct vm_area_struct *vma);
 static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma);

 /*
@@ -48,15 +47,8 @@ static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
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
index 141178754231..519a9601b219 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -218,31 +218,6 @@ static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
 	return prot;
 }

-int msm_gem_mmap_obj(struct drm_gem_object *obj,
-		struct vm_area_struct *vma)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
-	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
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
@@ -1114,6 +1089,17 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	kfree(msm_obj);
 }

+static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
+
+	return 0;
+}
+
 /* convenience method to construct a GEM buffer object, and userspace handle */
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		uint32_t size, uint32_t flags, uint32_t *handle,
@@ -1151,6 +1137,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.get_sg_table = msm_gem_prime_get_sg_table,
 	.vmap = msm_gem_prime_vmap,
 	.vunmap = msm_gem_prime_vunmap,
+	.mmap = msm_gem_object_mmap,
 	.vm_ops = &vm_ops,
 };

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 405f8411e395..aab548720bee 100644
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

