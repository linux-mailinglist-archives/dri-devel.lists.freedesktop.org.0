Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65812447DF6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 11:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B678A6E955;
	Mon,  8 Nov 2021 10:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CA16E955
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 10:28:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2BFBE21B02;
 Mon,  8 Nov 2021 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636367329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqJ3PALj2N8mNSp5HF/ewLhmQXtB1FwQ53fCXX1lFLw=;
 b=rmnSqlyDX8NxHsoJUlQ7OsnPHLSTOBo6y+O4B7PK3khQJFab65TWpO9v36FlFPij0oUQiK
 GA92sF2pvLXkHSUgGjwl3EksMTZHAMSweU0IHGUysHl2AMMOs+ZrOxsXJAM7XR6tnmugNz
 SqMvDY606d5S7B8fG8cwkFH8FkoMbRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636367329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqJ3PALj2N8mNSp5HF/ewLhmQXtB1FwQ53fCXX1lFLw=;
 b=pikWo+BrPYVvgje5Km5ynjXlmML6EPsbnpIYweTsdor4z8xyzL/I1EI7YddJ/rcpJOwsSX
 hwKhYVsIIWVGUNDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF4F113B70;
 Mon,  8 Nov 2021 10:28:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ADOHMeD7iGHPHQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 10:28:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, oleksandr_andrushchenko@epam.com
Subject: [PATCH 2/3] drm/xen: Implement mmap as GEM object function
Date: Mon,  8 Nov 2021 11:28:45 +0100
Message-Id: <20211108102846.309-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108102846.309-1-tzimmermann@suse.de>
References: <20211108102846.309-1-tzimmermann@suse.de>
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
Cc: xen-devel@lists.xenproject.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

The respective xen functions are being removed. The file_operations
structure fops is now being created by the helper macro
DEFINE_DRM_GEM_FOPS().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/xen/xen_drm_front.c     |  16 +---
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 108 +++++++++---------------
 drivers/gpu/drm/xen/xen_drm_front_gem.h |   7 --
 3 files changed, 44 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 9f14d99c763c..434064c820e8 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -469,19 +469,7 @@ static void xen_drm_drv_release(struct drm_device *dev)
 	kfree(drm_info);
 }
 
-static const struct file_operations xen_drm_dev_fops = {
-	.owner          = THIS_MODULE,
-	.open           = drm_open,
-	.release        = drm_release,
-	.unlocked_ioctl = drm_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl   = drm_compat_ioctl,
-#endif
-	.poll           = drm_poll,
-	.read           = drm_read,
-	.llseek         = no_llseek,
-	.mmap           = xen_drm_front_gem_mmap,
-};
+DEFINE_DRM_GEM_FOPS(xen_drm_dev_fops);
 
 static const struct drm_driver xen_drm_driver = {
 	.driver_features           = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
@@ -489,7 +477,7 @@ static const struct drm_driver xen_drm_driver = {
 	.prime_handle_to_fd        = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle        = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = xen_drm_front_gem_import_sg_table,
-	.gem_prime_mmap            = xen_drm_front_gem_prime_mmap,
+	.gem_prime_mmap            = drm_gem_prime_mmap,
 	.dumb_create               = xen_drm_drv_dumb_create,
 	.fops                      = &xen_drm_dev_fops,
 	.name                      = "xendrm-du",
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index b293c67230ef..dd358ba2bf8e 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -57,6 +57,47 @@ static void gem_free_pages_array(struct xen_gem_object *xen_obj)
 	xen_obj->pages = NULL;
 }
 
+static int xen_drm_front_gem_object_mmap(struct drm_gem_object *gem_obj,
+					 struct vm_area_struct *vma)
+{
+	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
+	int ret;
+
+	vma->vm_ops = gem_obj->funcs->vm_ops;
+
+	/*
+	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
+	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
+	 * the whole buffer.
+	 */
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_pgoff = 0;
+
+	/*
+	 * According to Xen on ARM ABI (xen/include/public/arch-arm.h):
+	 * all memory which is shared with other entities in the system
+	 * (including the hypervisor and other guests) must reside in memory
+	 * which is mapped as Normal Inner Write-Back Outer Write-Back
+	 * Inner-Shareable.
+	 */
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+
+	/*
+	 * vm_operations_struct.fault handler will be called if CPU access
+	 * to VM is here. For GPUs this isn't the case, because CPU  doesn't
+	 * touch the memory. Insert pages now, so both CPU and GPU are happy.
+	 *
+	 * FIXME: as we insert all the pages now then no .fault handler must
+	 * be called, so don't provide one
+	 */
+	ret = vm_map_pages(vma, xen_obj->pages, xen_obj->num_pages);
+	if (ret < 0)
+		DRM_ERROR("Failed to map pages into vma: %d\n", ret);
+
+	return ret;
+}
+
 static const struct vm_operations_struct xen_drm_drv_vm_ops = {
 	.open           = drm_gem_vm_open,
 	.close          = drm_gem_vm_close,
@@ -67,6 +108,7 @@ static const struct drm_gem_object_funcs xen_drm_front_gem_object_funcs = {
 	.get_sg_table = xen_drm_front_gem_get_sg_table,
 	.vmap = xen_drm_front_gem_prime_vmap,
 	.vunmap = xen_drm_front_gem_prime_vunmap,
+	.mmap = xen_drm_front_gem_object_mmap,
 	.vm_ops = &xen_drm_drv_vm_ops,
 };
 
@@ -238,58 +280,6 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 	return &xen_obj->base;
 }
 
-static int gem_mmap_obj(struct xen_gem_object *xen_obj,
-			struct vm_area_struct *vma)
-{
-	int ret;
-
-	/*
-	 * clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
-	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
-	 * the whole buffer.
-	 */
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
-	vma->vm_pgoff = 0;
-	/*
-	 * According to Xen on ARM ABI (xen/include/public/arch-arm.h):
-	 * all memory which is shared with other entities in the system
-	 * (including the hypervisor and other guests) must reside in memory
-	 * which is mapped as Normal Inner Write-Back Outer Write-Back
-	 * Inner-Shareable.
-	 */
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-
-	/*
-	 * vm_operations_struct.fault handler will be called if CPU access
-	 * to VM is here. For GPUs this isn't the case, because CPU
-	 * doesn't touch the memory. Insert pages now, so both CPU and GPU are
-	 * happy.
-	 * FIXME: as we insert all the pages now then no .fault handler must
-	 * be called, so don't provide one
-	 */
-	ret = vm_map_pages(vma, xen_obj->pages, xen_obj->num_pages);
-	if (ret < 0)
-		DRM_ERROR("Failed to map pages into vma: %d\n", ret);
-
-	return ret;
-}
-
-int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct xen_gem_object *xen_obj;
-	struct drm_gem_object *gem_obj;
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret < 0)
-		return ret;
-
-	gem_obj = vma->vm_private_data;
-	xen_obj = to_xen_gem_obj(gem_obj);
-	return gem_mmap_obj(xen_obj, vma);
-}
-
 int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj, struct dma_buf_map *map)
 {
 	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
@@ -313,17 +303,3 @@ void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
 {
 	vunmap(map->vaddr);
 }
-
-int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
-				 struct vm_area_struct *vma)
-{
-	struct xen_gem_object *xen_obj;
-	int ret;
-
-	ret = drm_gem_mmap_obj(gem_obj, gem_obj->size, vma);
-	if (ret < 0)
-		return ret;
-
-	xen_obj = to_xen_gem_obj(gem_obj);
-	return gem_mmap_obj(xen_obj, vma);
-}
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.h b/drivers/gpu/drm/xen/xen_drm_front_gem.h
index a4e67d0a149c..eaea470f7001 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.h
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.h
@@ -15,9 +15,7 @@ struct dma_buf_attachment;
 struct dma_buf_map;
 struct drm_device;
 struct drm_gem_object;
-struct file;
 struct sg_table;
-struct vm_area_struct;
 
 struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
 						size_t size);
@@ -33,15 +31,10 @@ struct page **xen_drm_front_gem_get_pages(struct drm_gem_object *obj);
 
 void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object *gem_obj);
 
-int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-
 int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj,
 				 struct dma_buf_map *map);
 
 void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
 				    struct dma_buf_map *map);
 
-int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
-				 struct vm_area_struct *vma);
-
 #endif /* __XEN_DRM_FRONT_GEM_H */
-- 
2.33.1

