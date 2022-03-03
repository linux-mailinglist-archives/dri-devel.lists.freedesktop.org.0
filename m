Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F034CC776
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C56810EB12;
	Thu,  3 Mar 2022 20:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C730410E72D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:58:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5AAA91F386;
 Thu,  3 Mar 2022 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646341123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHr5544ROJhBojHHXpax9c0eRTjBslUEweLX/2Wuka8=;
 b=h31R2g0opHQRtiNxzQJ4h1xbA83FuI/rpRYQwjxavjHgbDVoMbYoGr5CyAtp88CYHY6amk
 rT3VaqMh2MnGJr0t6CxAA0ORf3G3pd1VCJ0f+9zwfZArzbwcnF/oAAu3G/W7QHqaL43HQ4
 8T3V1eafPycHxZf1+rrRCj8M+NSy2TE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646341123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHr5544ROJhBojHHXpax9c0eRTjBslUEweLX/2Wuka8=;
 b=1I0Mpdbc70c8rdPSSVacoJpDztDJc0IijqlKSxrUDi+kKBhDN62/iCsKgUbHyENNohtH10
 djXCYhpPqXMfDZDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 207BA139B5;
 Thu,  3 Mar 2022 20:58:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UDIDBwMsIWJoHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Mar 2022 20:58:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, deller@gmx.de, javierm@redhat.com
Subject: [PATCH 8/9] drm/gem-shmem: Implement fbdev dumb buffer and mmap
 helpers
Date: Thu,  3 Mar 2022 21:58:38 +0100
Message-Id: <20220303205839.28484-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303205839.28484-1-tzimmermann@suse.de>
References: <20220303205839.28484-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement struct drm_driver.dumb_create_fbdev for GEM SHMEM. The
created buffer object returned by this function implements deferred
I/O for its mmap operation.

Add this feature to a number of drivers that use GEM SHMEM helpers
as shadow planes over their regular video memory. The new macro
DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES sets the regular GEM
functions and dumb_create_fbdev in struct drm_driver. Fbdev emulation
on these drivers will now mmap the GEM SHMEM pages directly with
deferred I/O without an intermediate shadow buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 197 +++++++++++++++++++++---
 drivers/gpu/drm/gud/gud_drv.c           |   2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c   |   2 +-
 drivers/gpu/drm/tiny/cirrus.c           |   2 +-
 drivers/gpu/drm/tiny/gm12u320.c         |   2 +-
 drivers/gpu/drm/tiny/simpledrm.c        |   2 +-
 drivers/gpu/drm/udl/udl_drv.c           |   2 +-
 drivers/gpu/drm/vkms/vkms_drv.c         |   2 +-
 include/drm/drm_gem_shmem_helper.h      |  63 +++++++-
 10 files changed, 240 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ad0e02991ca..ab7cb7d896c3 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -19,6 +19,7 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
@@ -49,8 +50,20 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
+static const struct drm_gem_object_funcs drm_gem_shmem_funcs_fbdev = {
+	.free = drm_gem_shmem_object_free,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap_fbdev,
+	.vm_ops = &drm_gem_shmem_vm_ops_fbdev,
+};
+
 static struct drm_gem_shmem_object *
-__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
+__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private, bool fbdev)
 {
 	struct drm_gem_shmem_object *shmem;
 	struct drm_gem_object *obj;
@@ -70,8 +83,12 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 		obj = &shmem->base;
 	}
 
-	if (!obj->funcs)
-		obj->funcs = &drm_gem_shmem_funcs;
+	if (!obj->funcs) {
+		if (fbdev)
+			obj->funcs = &drm_gem_shmem_funcs_fbdev;
+		else
+			obj->funcs = &drm_gem_shmem_funcs;
+	}
 
 	if (private) {
 		drm_gem_private_object_init(dev, obj, size);
@@ -124,7 +141,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
  */
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size)
 {
-	return __drm_gem_shmem_create(dev, size, false);
+	return __drm_gem_shmem_create(dev, size, false, false);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
@@ -415,12 +432,12 @@ EXPORT_SYMBOL(drm_gem_shmem_vunmap);
 static struct drm_gem_shmem_object *
 drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 				 struct drm_device *dev, size_t size,
-				 uint32_t *handle)
+				 bool fbdev, uint32_t *handle)
 {
 	struct drm_gem_shmem_object *shmem;
 	int ret;
 
-	shmem = drm_gem_shmem_create(dev, size);
+	shmem = __drm_gem_shmem_create(dev, size, false, fbdev);
 	if (IS_ERR(shmem))
 		return shmem;
 
@@ -496,6 +513,29 @@ bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL(drm_gem_shmem_purge);
 
+static int __drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
+				       bool fbdev, struct drm_mode_create_dumb *args)
+{
+	u32 min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	struct drm_gem_shmem_object *shmem;
+
+	if (!args->pitch || !args->size) {
+		args->pitch = min_pitch;
+		args->size = PAGE_ALIGN(args->pitch * args->height);
+	} else {
+		/* ensure sane minimum values */
+		if (args->pitch < min_pitch)
+			args->pitch = min_pitch;
+		if (args->size < args->pitch * args->height)
+			args->size = PAGE_ALIGN(args->pitch * args->height);
+	}
+
+	shmem = drm_gem_shmem_create_with_handle(file, dev, args->size, fbdev,
+						 &args->handle);
+
+	return PTR_ERR_OR_ZERO(shmem);
+}
+
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
  * @file: DRM file structure to create the dumb buffer for
@@ -516,26 +556,38 @@ EXPORT_SYMBOL(drm_gem_shmem_purge);
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args)
 {
-	u32 min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	struct drm_gem_shmem_object *shmem;
-
-	if (!args->pitch || !args->size) {
-		args->pitch = min_pitch;
-		args->size = PAGE_ALIGN(args->pitch * args->height);
-	} else {
-		/* ensure sane minimum values */
-		if (args->pitch < min_pitch)
-			args->pitch = min_pitch;
-		if (args->size < args->pitch * args->height)
-			args->size = PAGE_ALIGN(args->pitch * args->height);
-	}
-
-	shmem = drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);
-
-	return PTR_ERR_OR_ZERO(shmem);
+	return __drm_gem_shmem_dumb_create(file, dev, false, args);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 
+/**
+ * drm_gem_shmem_dumb_create_fbdev - Create a dumb shmem buffer object for fbdev
+ * @file: DRM file structure to create the dumb buffer for
+ * @dev: DRM device
+ * @args: IOCTL data
+ *
+ * This function computes the pitch of the dumb buffer and rounds it up to an
+ * integer number of bytes per pixel. Drivers for hardware that doesn't have
+ * any additional restrictions on the pitch can directly use this function as
+ * their &drm_driver.dumb_create_fbdev callback.
+ *
+ * For hardware with additional restrictions, drivers can adjust the fields
+ * set up by userspace before calling into this function.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_dumb_create_fbdev(struct drm_file *file, struct drm_device *dev,
+				    struct drm_mode_create_dumb *args)
+{
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
+	return __drm_gem_shmem_dumb_create(file, dev, true, args);
+#else
+	return -ENOSYS;
+#endif
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create_fbdev);
+
 static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
@@ -635,6 +687,103 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
 
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
+static vm_fault_t drm_gem_shmem_fault_fbdev(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct drm_gem_object *obj = vma->vm_private_data;
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	loff_t num_pages = obj->size >> PAGE_SHIFT;
+	struct drm_device *dev = obj->dev;
+	vm_fault_t ret;
+	struct page *page;
+	pgoff_t page_offset;
+
+	/* We don't use vmf->pgoff since that has the fake offset */
+	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+
+	mutex_lock(&shmem->pages_lock);
+
+	if (page_offset >= num_pages || WARN_ON_ONCE(!shmem->pages) || shmem->madv < 0) {
+		ret = VM_FAULT_SIGBUS;
+		goto err_mutex_unlock;
+	}
+
+	page = shmem->pages[page_offset];
+
+	get_page(page);
+
+	if (vmf->vma->vm_file)
+		page->mapping = vmf->vma->vm_file->f_mapping;
+	else
+		drm_err(dev, "no mapping available\n");
+
+	if (drm_WARN_ON_ONCE(dev, !page->mapping)) {
+		ret = VM_FAULT_SIGBUS;
+		goto err_put_page;
+	}
+
+	/* for page_mkclean(); include the fake offset in the page index */
+	page->index = vmf->pgoff;
+
+	vmf->page = page;
+
+	mutex_unlock(&shmem->pages_lock);
+
+	return 0;
+
+err_put_page:
+	put_page(page);
+err_mutex_unlock:
+	mutex_unlock(&shmem->pages_lock);
+	return ret;
+}
+
+static vm_fault_t drm_gem_shmem_vm_page_mkwrite_fbdev(struct vm_fault *vmf)
+{
+	struct drm_gem_object *obj = vmf->vma->vm_private_data;
+
+	return drm_fb_helper_vm_page_mkwrite(obj->dev->fb_helper, vmf);
+}
+
+const struct vm_operations_struct drm_gem_shmem_vm_ops_fbdev = {
+	.open = drm_gem_shmem_vm_open,
+	.close = drm_gem_shmem_vm_close,
+	.fault = drm_gem_shmem_fault_fbdev,
+	.page_mkwrite = drm_gem_shmem_vm_page_mkwrite_fbdev,
+};
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops_fbdev);
+
+int drm_gem_shmem_mmap_fbdev(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int ret;
+
+	if (obj->import_attach) {
+		/* Drop the reference drm_gem_mmap_obj() acquired.*/
+		drm_gem_object_put(obj);
+		vma->vm_private_data = NULL;
+
+		return dma_buf_mmap(obj->dma_buf, vma, 0);
+	}
+
+	ret = drm_gem_shmem_get_pages(shmem);
+	if (ret) {
+		drm_gem_vm_close(vma);
+		return ret;
+	}
+
+	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+	if (shmem->map_wc)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap_fbdev);
+#endif
+
 /**
  * drm_gem_shmem_print_info() - Print &drm_gem_shmem_object info for debugfs
  * @shmem: shmem GEM object
@@ -751,7 +900,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 	size_t size = PAGE_ALIGN(attach->dmabuf->size);
 	struct drm_gem_shmem_object *shmem;
 
-	shmem = __drm_gem_shmem_create(dev, size, true);
+	shmem = __drm_gem_shmem_create(dev, size, true, false);
 	if (IS_ERR(shmem))
 		return ERR_CAST(shmem);
 
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 3f9d4b9a1e3d..1ac1ff1b2f81 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -382,7 +382,7 @@ DEFINE_DRM_GEM_FOPS(gud_fops);
 static const struct drm_driver gud_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.fops			= &gud_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES,
 	.gem_prime_import	= gud_gem_prime_import,
 	.debugfs_init		= gud_debugfs_init,
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 4a8941fa0815..2701664c127b 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -38,7 +38,7 @@ static struct drm_driver hyperv_driver = {
 	.minor		 = DRIVER_MINOR,
 
 	.fops		 = &hv_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES,
 };
 
 static int hyperv_pci_probe(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 217844d71ab5..57dd5511e118 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -38,7 +38,7 @@ static const struct drm_driver mgag200_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES,
 };
 
 /*
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index c8e791840862..17d8ca07af94 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -542,7 +542,7 @@ static const struct drm_driver cirrus_driver = {
 	.minor		 = DRIVER_MINOR,
 
 	.fops		 = &cirrus_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES,
 };
 
 static int cirrus_pci_probe(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 648e585d40a8..97946f0637f3 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -620,7 +620,7 @@ static const struct drm_driver gm12u320_drm_driver = {
 	.minor		 = DRIVER_MINOR,
 
 	.fops		 = &gm12u320_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES,
 	.gem_prime_import = gm12u320_gem_prime_import,
 };
 
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 768242a78e2b..562d09627330 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -871,7 +871,7 @@ simpledrm_device_create(struct drm_driver *drv, struct platform_device *pdev)
 DEFINE_DRM_GEM_FOPS(simpledrm_fops);
 
 static struct drm_driver simpledrm_driver = {
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES,
 	.name			= DRIVER_NAME,
 	.desc			= DRIVER_DESC,
 	.date			= DRIVER_DATE,
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 5703277c6f52..87f7648e73a5 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -55,7 +55,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES,
 	.gem_prime_import = udl_driver_gem_prime_import,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..645b92149b8b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -116,7 +116,7 @@ static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES,
 
 	.debugfs_init           = vkms_config_debugfs_init,
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d0a57853c188..16b0f4b60d33 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -139,6 +139,11 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 
 extern const struct vm_operations_struct drm_gem_shmem_vm_ops;
 
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
+extern const struct vm_operations_struct drm_gem_shmem_vm_ops_fbdev;
+int drm_gem_shmem_mmap_fbdev(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
+#endif
+
 /*
  * GEM object functions
  */
@@ -272,6 +277,27 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
 	return drm_gem_shmem_mmap(shmem, vma);
 }
 
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
+/**
+ * drm_gem_shmem_object_mmap_fbdev - GEM object function for drm_gem_shmem_mmap_fbdev()
+ * @obj: GEM object
+ * @vma: VMA for the area to be mapped
+ *
+ * This function wraps drm_gem_shmem_mmap(). Drivers that employ the shmem helpers should
+ * use it as their &drm_gem_object_funcs.mmap handler.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_gem_shmem_object_mmap_fbdev(struct drm_gem_object *obj,
+						  struct vm_area_struct *vma)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	return drm_gem_shmem_mmap_fbdev(shmem, vma);
+}
+#endif
+
 /*
  * Driver ops
  */
@@ -282,18 +308,47 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 				    struct sg_table *sgt);
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args);
+int drm_gem_shmem_dumb_create_fbdev(struct drm_file *file, struct drm_device *dev,
+				    struct drm_mode_create_dumb *args);
 
 /**
- * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
+ * DRM_GEM_SHMEM_DRIVER_OPS_WITH_DUMB_CREATE - Default shmem GEM operations
+ * @dumb_create_func: callback function for .dumb_create
+ * @dumb_create_fbdev_func: callback function for .dumb_create_fbdev
  *
  * This macro provides a shortcut for setting the shmem GEM operations in
- * the &drm_driver structure.
+ * the &drm_driver structure. The callbacks for creating dumb buffers are
+ * given as parameters. Use DRM_GEM_SHMEM_DRIVER_OPS or
+ * DRM_GEM_SHMEM_OPS_WITH_SHADOW_PLANES if possible.
  */
-#define DRM_GEM_SHMEM_DRIVER_OPS \
+#define DRM_GEM_SHMEM_DRIVER_OPS_WITH_DUMB_CREATE(dumb_create_func, dumb_create_fbdev_func) \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
 	.gem_prime_mmap		= drm_gem_prime_mmap, \
-	.dumb_create		= drm_gem_shmem_dumb_create
+	.dumb_create		= dumb_create_func, \
+	.dumb_create_fbdev	= dumb_create_fbdev_func
+
+/**
+ * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
+ *
+ * This macro provides a shortcut for setting the shmem GEM operations in
+ * the &drm_driver structure.
+ */
+#define DRM_GEM_SHMEM_DRIVER_OPS \
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_shmem_dumb_create, NULL)
+
+/**
+ * DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES - Default shmem GEM operations
+ *                                               for drivers that use shadow
+ *                                               planes
+ *
+ * This macro provides a shortcut for setting the shmem GEM operations in
+ * the &drm_driver structure. Drivers that employ shmem GEM for shadow
+ * buffering should use this macro.
+ */
+#define DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES \
+	DRM_GEM_SHMEM_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_shmem_dumb_create, \
+						  drm_gem_shmem_dumb_create_fbdev)
 
 #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
-- 
2.35.1

