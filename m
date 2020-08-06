Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D50B23D82E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 10:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5790A6E89C;
	Thu,  6 Aug 2020 08:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56E26E89C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 08:52:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BC37B620;
 Thu,  6 Aug 2020 08:53:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, emil.l.velikov@gmail.com,
 lyude@redhat.com, noralf@tronnes.org, zou_wei@huawei.com
Subject: [PATCH v2 3/4] drm/gem: Use struct drm_gem_membuf in vmap op and
 convert GEM backends
Date: Thu,  6 Aug 2020 10:52:38 +0200
Message-Id: <20200806085239.4606-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200806085239.4606-1-tzimmermann@suse.de>
References: <20200806085239.4606-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch replaces the vmap's use of raw pointers in GEM object
functions with instances of struct drm_gem_membuf. GEM backends are
converted as well.

For most GEM backends, this simply change the returned type. GEM VRAM
helpers are also updated to indicate whether the returned frmabuffer
address is in system or I/O memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c       | 29 ++++-----
 drivers/gpu/drm/ast/ast_drv.h          |  2 +-
 drivers/gpu/drm/drm_gem.c              | 17 ++---
 drivers/gpu/drm/drm_gem_cma_helper.c   | 15 +++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 31 +++++----
 drivers/gpu/drm/drm_gem_vram_helper.c  | 90 ++++++++++++++------------
 drivers/gpu/drm/drm_internal.h         |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c | 11 ++--
 drivers/gpu/drm/qxl/qxl_display.c      | 12 ++--
 drivers/gpu/drm/qxl/qxl_draw.c         | 14 ++--
 drivers/gpu/drm/qxl/qxl_drv.h          |  6 +-
 drivers/gpu/drm/qxl/qxl_object.c       | 19 +++---
 drivers/gpu/drm/qxl/qxl_object.h       |  2 +-
 drivers/gpu/drm/qxl/qxl_prime.c        | 12 ++--
 drivers/gpu/drm/tiny/cirrus.c          | 15 ++---
 drivers/gpu/drm/tiny/gm12u320.c        | 12 ++--
 drivers/gpu/drm/udl/udl_modeset.c      | 10 +--
 drivers/gpu/drm/vboxvideo/vbox_mode.c  | 11 ++--
 include/drm/drm_gem.h                  |  5 +-
 include/drm/drm_gem_cma_helper.h       |  4 +-
 include/drm/drm_gem_shmem_helper.h     |  4 +-
 include/drm/drm_gem_vram_helper.h      |  6 +-
 22 files changed, 175 insertions(+), 154 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 6c96f74cdb9e..bdcc3d619e0e 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -39,7 +39,7 @@ static void ast_cursor_fini(struct ast_private *ast)
 
 	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
 		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
+		drm_gem_vram_vunmap(gbo, &ast->cursor.buf[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -60,7 +60,7 @@ int ast_cursor_init(struct ast_private *ast)
 	struct drm_device *dev = &ast->base;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
-	void __iomem *vaddr;
+	struct drm_gem_membuf buf;
 	int ret;
 
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
@@ -77,16 +77,15 @@ int ast_cursor_init(struct ast_private *ast)
 			drm_gem_vram_put(gbo);
 			goto err_drm_gem_vram_put;
 		}
-		vaddr = drm_gem_vram_vmap(gbo);
-		if (IS_ERR(vaddr)) {
-			ret = PTR_ERR(vaddr);
+		ret = drm_gem_vram_vmap(gbo, &buf);
+		if (ret) {
 			drm_gem_vram_unpin(gbo);
 			drm_gem_vram_put(gbo);
 			goto err_drm_gem_vram_put;
 		}
 
 		ast->cursor.gbo[i] = gbo;
-		ast->cursor.vaddr[i] = vaddr;
+		ast->cursor.buf[i] = buf;
 	}
 
 	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
@@ -95,7 +94,7 @@ int ast_cursor_init(struct ast_private *ast)
 	while (i) {
 		--i;
 		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
+		drm_gem_vram_vunmap(gbo, &ast->cursor.buf[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -170,8 +169,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_gem_vram_object *gbo;
+	struct drm_gem_membuf buf;
 	int ret;
-	void *src;
 	void __iomem *dst;
 
 	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
@@ -183,18 +182,16 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	ret = drm_gem_vram_pin(gbo, 0);
 	if (ret)
 		return ret;
-	src = drm_gem_vram_vmap(gbo);
-	if (IS_ERR(src)) {
-		ret = PTR_ERR(src);
+	ret = drm_gem_vram_vmap(gbo, &buf);
+	if (ret)
 		goto err_drm_gem_vram_unpin;
-	}
 
-	dst = ast->cursor.vaddr[ast->cursor.next_index];
+	dst = ast->cursor.buf[ast->cursor.next_index].vaddr_iomem;
 
 	/* do data transfer to cursor BO */
-	update_cursor_image(dst, src, fb->width, fb->height);
+	update_cursor_image(dst, buf.vaddr, fb->width, fb->height);
 
-	drm_gem_vram_vunmap(gbo, src);
+	drm_gem_vram_vunmap(gbo, &buf);
 	drm_gem_vram_unpin(gbo);
 
 	return 0;
@@ -256,7 +253,7 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 	u8 __iomem *dst, __iomem *sig;
 	u8 jreg;
 
-	dst = ast->cursor.vaddr[ast->cursor.next_index];
+	dst = ast->cursor.buf[ast->cursor.next_index].vaddr;
 
 	sig = dst + AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c1af6b725933..fcedc6896c24 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -131,7 +131,7 @@ struct ast_private {
 
 	struct {
 		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
-		void __iomem *vaddr[AST_DEFAULT_HWC_NUM];
+		struct drm_gem_membuf buf[AST_DEFAULT_HWC_NUM];
 		unsigned int next_index;
 	} cursor;
 
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 36ded6a56fb2..e3235ec46733 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1224,29 +1224,30 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf)
 {
 	void *vaddr;
 
-	if (obj->funcs && obj->funcs->vmap)
-		vaddr = obj->funcs->vmap(obj);
-	else if (obj->dev->driver->gem_prime_vmap)
+	if (obj->funcs && obj->funcs->vmap) {
+		return obj->funcs->vmap(obj, buf);
+	} else if (obj->dev->driver->gem_prime_vmap) {
 		vaddr = obj->dev->driver->gem_prime_vmap(obj);
-	else
+		buf->vaddr = vaddr;
+		buf->is_iomem = false;
+	} else {
 		return -EOPNOTSUPP;
+	}
 
 	if (!vaddr)
 		return -ENOMEM;
 
-	buf->vaddr = vaddr;
-	buf->is_iomem = false;
 
 	return 0;
 }
 
-void drm_gem_vunmap(struct drm_gem_object *obj, const struct drm_gem_membuf *buf)
+void drm_gem_vunmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf)
 {
 	if (!buf || !buf->vaddr)
 		return;
 
 	if (obj->funcs && obj->funcs->vunmap)
-		obj->funcs->vunmap(obj, buf->vaddr);
+		obj->funcs->vunmap(obj, buf);
 	else if (obj->dev->driver->gem_prime_vunmap)
 		obj->dev->driver->gem_prime_vunmap(obj, buf->vaddr);
 }
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 822edeadbab3..dc9c526ea200 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -537,6 +537,8 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
  * drm_gem_cma_prime_vmap - map a CMA GEM object into the kernel's virtual
  *     address space
  * @obj: GEM object
+ * @buf: Returns the kernel virtual address of the CMA GEM object's backing
+ *       store.
  *
  * This function maps a buffer exported via DRM PRIME into the kernel's
  * virtual address space. Since the CMA buffers are already mapped into the
@@ -545,13 +547,16 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
  * driver's &drm_driver.gem_prime_vmap callback.
  *
  * Returns:
- * The kernel virtual address of the CMA GEM object's backing store.
+ * 0 on success, or a negative error code otherwise.
  */
-void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj)
+int drm_gem_cma_prime_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf)
 {
 	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
 
-	return cma_obj->vaddr;
+	buf->vaddr = cma_obj->vaddr;
+	buf->is_iomem = false; /* TODO: should we declare this as I/O memory? */
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
 
@@ -559,14 +564,14 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
  * drm_gem_cma_prime_vunmap - unmap a CMA GEM object from the kernel's virtual
  *     address space
  * @obj: GEM object
- * @vaddr: kernel virtual address where the CMA GEM object was mapped
+ * @buf: Kernel virtual address where the CMA GEM object was mapped
  *
  * This function removes a buffer exported via DRM PRIME from the kernel's
  * virtual address space. This is a no-op because CMA buffers cannot be
  * unmapped from kernel space. Drivers using the CMA helpers should set this
  * as their &drm_driver.gem_prime_vunmap callback.
  */
-void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
+void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf)
 {
 	/* Nothing to do */
 }
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4b7cfbac4daa..6115663b5dcf 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -258,13 +258,13 @@ void drm_gem_shmem_unpin(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
-static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
+static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct drm_gem_membuf *buf)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
 	if (shmem->vmap_use_count++ > 0)
-		return shmem->vaddr;
+		goto out;
 
 	if (obj->import_attach) {
 		shmem->vaddr = dma_buf_vmap(obj->import_attach->dmabuf);
@@ -287,7 +287,11 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
 		goto err_put_pages;
 	}
 
-	return shmem->vaddr;
+out:
+	buf->vaddr = shmem->vaddr;
+	buf->is_iomem = false;
+
+	return 0;
 
 err_put_pages:
 	if (!obj->import_attach)
@@ -295,12 +299,14 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
 err_zero_use:
 	shmem->vmap_use_count = 0;
 
-	return ERR_PTR(ret);
+	return ret;
 }
 
 /*
  * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
+ * @buf: Returns the kernel virtual address of the SHMEM GEM object's backing
+ *       store.
  *
  * This function makes sure that a contiguous kernel virtual address mapping
  * exists for the buffer backing the shmem GEM object.
@@ -314,23 +320,23 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-void *drm_gem_shmem_vmap(struct drm_gem_object *obj)
+int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	void *vaddr;
 	int ret;
 
 	ret = mutex_lock_interruptible(&shmem->vmap_lock);
 	if (ret)
-		return ERR_PTR(ret);
-	vaddr = drm_gem_shmem_vmap_locked(shmem);
+		return ret;
+	ret = drm_gem_shmem_vmap_locked(shmem, buf);
 	mutex_unlock(&shmem->vmap_lock);
 
-	return vaddr;
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_shmem_vmap);
 
-static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
+static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
+					struct drm_gem_membuf *buf)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -352,6 +358,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
 /*
  * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM object
  * @shmem: shmem GEM object
+ * @buf: Kernel virtual address where the SHMEM GEM object was mapped
  *
  * This function cleans up a kernel virtual address mapping acquired by
  * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
@@ -361,12 +368,12 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
  * also be called by drivers directly, in which case it will hide the
  * differences between dma-buf imported and natively allocated objects.
  */
-void drm_gem_shmem_vunmap(struct drm_gem_object *obj, void *vaddr)
+void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
 	mutex_lock(&shmem->vmap_lock);
-	drm_gem_shmem_vunmap_locked(shmem);
+	drm_gem_shmem_vunmap_locked(shmem, buf);
 	mutex_unlock(&shmem->vmap_lock);
 }
 EXPORT_SYMBOL(drm_gem_shmem_vunmap);
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index a6af198e26ea..b5bd44e3d61a 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -408,8 +408,8 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
-static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
-				      bool map, bool *is_iomem)
+static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo, bool map,
+				    struct drm_gem_membuf *buf)
 {
 	int ret;
 	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
@@ -422,22 +422,28 @@ static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 
 	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
 out:
 	if (!kmap->virtual) {
-		if (is_iomem)
-			*is_iomem = false;
-		return NULL; /* not mapped; don't increment ref */
+		buf->vaddr = NULL;
+		buf->is_iomem = false;
+		return 0; /* not mapped; don't increment ref */
 	}
 	++gbo->kmap_use_count;
-	if (is_iomem)
-		return ttm_kmap_obj_virtual(kmap, is_iomem);
-	return kmap->virtual;
+	buf->vaddr = ttm_kmap_obj_virtual(kmap, &buf->is_iomem);
+	return 0;
 }
 
-static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
+static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
+				       struct drm_gem_membuf *buf)
 {
+	struct drm_device *dev = gbo->bo.base.dev;
+	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
+
+	if (drm_WARN_ON_ONCE(dev, kmap->virtual != buf->vaddr))
+		return; /* BUG: buf not mapped from this BO */
+
 	if (WARN_ON_ONCE(!gbo->kmap_use_count))
 		return;
 	if (--gbo->kmap_use_count > 0)
@@ -454,7 +460,9 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
 /**
  * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
  *                       space
- * @gbo:	The GEM VRAM object to map
+ * @gbo: The GEM VRAM object to map
+ * @buf: Returns the kernel virtual address of the VRAM GEM object's backing
+ *       store.
  *
  * The vmap function pins a GEM VRAM object to its current location, either
  * system or video memory, and maps its buffer into kernel address space.
@@ -463,48 +471,46 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
  * unmap and unpin the GEM VRAM object.
  *
  * Returns:
- * The buffer's virtual address on success, or
- * an ERR_PTR()-encoded error code otherwise.
+ * 0 on success, or a negative error code otherwise.
  */
-void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
+int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo,
+			struct drm_gem_membuf *buf)
 {
 	int ret;
-	void *base;
 
 	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
 	ret = drm_gem_vram_pin_locked(gbo, 0);
 	if (ret)
 		goto err_ttm_bo_unreserve;
-	base = drm_gem_vram_kmap_locked(gbo, true, NULL);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
+	ret = drm_gem_vram_kmap_locked(gbo, true, buf);
+	if (ret)
 		goto err_drm_gem_vram_unpin_locked;
-	}
 
 	ttm_bo_unreserve(&gbo->bo);
 
-	return base;
+	return 0;
 
 err_drm_gem_vram_unpin_locked:
 	drm_gem_vram_unpin_locked(gbo);
 err_ttm_bo_unreserve:
 	ttm_bo_unreserve(&gbo->bo);
-	return ERR_PTR(ret);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_vmap);
 
 /**
  * drm_gem_vram_vunmap() - Unmaps and unpins a GEM VRAM object
- * @gbo:	The GEM VRAM object to unmap
- * @vaddr:	The mapping's base address as returned by drm_gem_vram_vmap()
+ * @gbo: The GEM VRAM object to unmap
+ * @buf: Kernel virtual address where the VRAM GEM object was mapped
  *
  * A call to drm_gem_vram_vunmap() unmaps and unpins a GEM VRAM buffer. See
  * the documentation for drm_gem_vram_vmap() for more information.
  */
-void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr)
+void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
+			 struct drm_gem_membuf *buf)
 {
 	int ret;
 
@@ -512,7 +518,7 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr)
 	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
 		return;
 
-	drm_gem_vram_kunmap_locked(gbo);
+	drm_gem_vram_kunmap_locked(gbo, buf);
 	drm_gem_vram_unpin_locked(gbo);
 
 	ttm_bo_unreserve(&gbo->bo);
@@ -860,37 +866,35 @@ static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
 }
 
 /**
- * drm_gem_vram_object_vmap() - \
-	Implements &struct drm_gem_object_funcs.vmap
- * @gem:	The GEM object to map
+ * drm_gem_vram_object_vmap() -
+ *	Implements &struct drm_gem_object_funcs.vmap
+ * @gem: The GEM object to map
+ * @buf: Returns the kernel virtual address of the VRAM GEM object's backing
+ *       store.
  *
  * Returns:
- * The buffers virtual address on success, or
- * NULL otherwise.
+ * 0 on success, or a negative error code otherwise.
  */
-static void *drm_gem_vram_object_vmap(struct drm_gem_object *gem)
+static int drm_gem_vram_object_vmap(struct drm_gem_object *gem,
+				    struct drm_gem_membuf *buf)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
-	void *base;
 
-	base = drm_gem_vram_vmap(gbo);
-	if (IS_ERR(base))
-		return NULL;
-	return base;
+	return drm_gem_vram_vmap(gbo, buf);
 }
 
 /**
- * drm_gem_vram_object_vunmap() - \
-	Implements &struct drm_gem_object_funcs.vunmap
- * @gem:	The GEM object to unmap
- * @vaddr:	The mapping's base address
+ * drm_gem_vram_object_vunmap() -
+ *	Implements &struct drm_gem_object_funcs.vunmap
+ * @gem: The GEM object to unmap
+ * @buf: Kernel virtual address where the VRAM GEM object was mapped
  */
 static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem,
-				       void *vaddr)
+				       struct drm_gem_membuf *buf)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
 
-	drm_gem_vram_vunmap(gbo, vaddr);
+	drm_gem_vram_vunmap(gbo, buf);
 }
 
 /*
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 201d71249954..15582bab6d7a 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -188,7 +188,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
 int drm_gem_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
-void drm_gem_vunmap(struct drm_gem_object *obj, const struct drm_gem_membuf *buf);
+void drm_gem_vunmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
 
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 38672f9e5c4f..5d23a4a4c340 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1556,15 +1556,16 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
 		      struct drm_rect *clip)
 {
 	struct drm_device *dev = &mdev->base;
-	void *vmap;
+	struct drm_gem_membuf buf;
+	int ret;
 
-	vmap = drm_gem_shmem_vmap(fb->obj[0]);
-	if (drm_WARN_ON(dev, !vmap))
+	ret = drm_gem_shmem_vmap(fb->obj[0], &buf);
+	if (drm_WARN_ON(dev, ret))
 		return; /* BUG: SHMEM BO should always be vmapped */
 
-	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
+	drm_fb_memcpy_dstclip(mdev->vram, buf.vaddr, fb, clip);
 
-	drm_gem_shmem_vunmap(fb->obj[0], vmap);
+	drm_gem_shmem_vunmap(fb->obj[0], &buf);
 
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 099dca48b0ff..95c224b275ca 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -579,7 +579,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 	struct drm_gem_object *obj;
 	struct qxl_bo *cursor_bo = NULL, *user_bo = NULL, *old_cursor_bo = NULL;
 	int ret;
-	void *user_ptr;
+	struct drm_gem_membuf user_buf;
+	struct drm_gem_membuf cursor_buf;
 	int size = 64*64*4;
 
 	ret = qxl_alloc_release_reserved(qdev, sizeof(*cmd),
@@ -593,7 +594,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		user_bo = gem_to_qxl_bo(obj);
 
 		/* pinning is done in the prepare/cleanup framevbuffer */
-		ret = qxl_bo_kmap(user_bo, &user_ptr);
+		ret = qxl_bo_kmap(user_bo, &user_buf);
 		if (ret)
 			goto out_free_release;
 
@@ -611,7 +612,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		if (ret)
 			goto out_unpin;
 
-		ret = qxl_bo_kmap(cursor_bo, (void **)&cursor);
+		ret = qxl_bo_kmap(cursor_bo, &cursor_buf);
 		if (ret)
 			goto out_backoff;
 
@@ -625,7 +626,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		cursor->chunk.next_chunk = 0;
 		cursor->chunk.prev_chunk = 0;
 		cursor->chunk.data_size = size;
-		memcpy(cursor->chunk.data, user_ptr, size);
+		memcpy(cursor->chunk.data, user_buf.vaddr, size);
 		qxl_bo_kunmap(cursor_bo);
 		qxl_bo_kunmap(user_bo);
 
@@ -1136,6 +1137,7 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
 {
 	int ret;
 	struct drm_gem_object *gobj;
+	struct drm_gem_membuf buf;
 	int monitors_config_size = sizeof(struct qxl_monitors_config) +
 		qxl_num_crtc * sizeof(struct qxl_head);
 
@@ -1152,7 +1154,7 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
 	if (ret)
 		return ret;
 
-	qxl_bo_kmap(qdev->monitors_config_bo, NULL);
+	qxl_bo_kmap(qdev->monitors_config_bo, &buf);
 
 	qdev->monitors_config = qdev->monitors_config_bo->kptr;
 	qdev->ram_header->monitors_config =
diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.c
index 3599db096973..406bfd8fe6f5 100644
--- a/drivers/gpu/drm/qxl/qxl_draw.c
+++ b/drivers/gpu/drm/qxl/qxl_draw.c
@@ -42,13 +42,15 @@ static struct qxl_rect *drawable_set_clipping(struct qxl_device *qdev,
 					      unsigned int num_clips,
 					      struct qxl_bo *clips_bo)
 {
+	struct drm_gem_membuf buf;
 	struct qxl_clip_rects *dev_clips;
 	int ret;
 
-	ret = qxl_bo_kmap(clips_bo, (void **)&dev_clips);
-	if (ret) {
+	ret = qxl_bo_kmap(clips_bo, &buf);
+	if (ret)
 		return NULL;
-	}
+
+	dev_clips = buf.vaddr;
 	dev_clips->num_rects = num_clips;
 	dev_clips->chunk.next_chunk = 0;
 	dev_clips->chunk.prev_chunk = 0;
@@ -142,7 +144,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
 	int stride = fb->pitches[0];
 	/* depth is not actually interesting, we don't mask with it */
 	int depth = fb->format->cpp[0] * 8;
-	uint8_t *surface_base;
+	struct drm_gem_membuf surface_buf;
 	struct qxl_release *release;
 	struct qxl_bo *clips_bo;
 	struct qxl_drm_image *dimage;
@@ -197,11 +199,11 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
 	if (ret)
 		goto out_release_backoff;
 
-	ret = qxl_bo_kmap(bo, (void **)&surface_base);
+	ret = qxl_bo_kmap(bo, &surface_buf);
 	if (ret)
 		goto out_release_backoff;
 
-	ret = qxl_image_init(qdev, release, dimage, surface_base,
+	ret = qxl_image_init(qdev, release, dimage, surface_buf.vaddr,
 			     left - dumb_shadow_offset,
 			     top, width, height, depth, stride);
 	qxl_bo_kunmap(bo);
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 9691449aefdb..fdb7548b12ee 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -336,7 +336,6 @@ int qxl_gem_object_open(struct drm_gem_object *obj, struct drm_file *file_priv);
 void qxl_gem_object_close(struct drm_gem_object *obj,
 			  struct drm_file *file_priv);
 void qxl_bo_force_delete(struct qxl_device *qdev);
-int qxl_bo_kmap(struct qxl_bo *bo, void **ptr);
 
 /* qxl_dumb.c */
 int qxl_mode_dumb_create(struct drm_file *file_priv,
@@ -446,8 +445,9 @@ struct sg_table *qxl_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *qxl_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
-void *qxl_gem_prime_vmap(struct drm_gem_object *obj);
-void qxl_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
+int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
+void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
+			  struct drm_gem_membuf *buf);
 int qxl_gem_prime_mmap(struct drm_gem_object *obj,
 				struct vm_area_struct *vma);
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 80e7a17aaddd..679bab3dae9f 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -143,24 +143,22 @@ int qxl_bo_create(struct qxl_device *qdev,
 	return 0;
 }
 
-int qxl_bo_kmap(struct qxl_bo *bo, void **ptr)
+int qxl_bo_kmap(struct qxl_bo *bo, struct drm_gem_membuf *buf)
 {
-	bool is_iomem;
 	int r;
 
 	if (bo->kptr) {
-		if (ptr)
-			*ptr = bo->kptr;
 		bo->map_count++;
-		return 0;
+		goto out;
 	}
 	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages, &bo->kmap);
 	if (r)
 		return r;
-	bo->kptr = ttm_kmap_obj_virtual(&bo->kmap, &is_iomem);
-	if (ptr)
-		*ptr = bo->kptr;
 	bo->map_count = 1;
+	bo->kptr = bo->kmap.virtual;
+
+out:
+	buf->vaddr = ttm_kmap_obj_virtual(&bo->kmap, &buf->is_iomem);
 	return 0;
 }
 
@@ -170,6 +168,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 	void *rptr;
 	int ret;
 	struct io_mapping *map;
+	struct drm_gem_membuf buf;
 
 	if (bo->tbo.mem.mem_type == TTM_PL_VRAM)
 		map = qdev->vram_mapping;
@@ -187,11 +186,11 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 		return rptr;
 	}
 
-	ret = qxl_bo_kmap(bo, &rptr);
+	ret = qxl_bo_kmap(bo, &buf);
 	if (ret)
 		return NULL;
 
-	rptr += page_offset * PAGE_SIZE;
+	rptr = buf.vaddr + page_offset * PAGE_SIZE;
 	return rptr;
 }
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 21fa81048f4f..a0bbff992047 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -86,7 +86,7 @@ extern int qxl_bo_create(struct qxl_device *qdev,
 			 bool kernel, bool pinned, u32 domain,
 			 struct qxl_surface *surf,
 			 struct qxl_bo **bo_ptr);
-extern int qxl_bo_kmap(struct qxl_bo *bo, void **ptr);
+extern int qxl_bo_kmap(struct qxl_bo *bo, struct drm_gem_membuf *buf);
 extern void qxl_bo_kunmap(struct qxl_bo *bo);
 void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
 void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 7d3816fca5a8..ab299d4803ec 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -54,20 +54,20 @@ struct drm_gem_object *qxl_gem_prime_import_sg_table(
 	return ERR_PTR(-ENOSYS);
 }
 
-void *qxl_gem_prime_vmap(struct drm_gem_object *obj)
+int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
-	void *ptr;
 	int ret;
 
-	ret = qxl_bo_kmap(bo, &ptr);
+	ret = qxl_bo_kmap(bo, buf);
 	if (ret < 0)
-		return ERR_PTR(ret);
+		return ret;
 
-	return ptr;
+	return 0;
 }
 
-void qxl_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
+void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
+			  struct drm_gem_membuf *buf)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 744a8e337e41..17ad923972c9 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -314,36 +314,35 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
-	void *vmap;
+	struct drm_gem_membuf buf;
 	int idx, ret;
 
 	ret = -ENODEV;
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		goto out;
 
-	ret = -ENOMEM;
-	vmap = drm_gem_shmem_vmap(fb->obj[0]);
-	if (!vmap)
+	ret = drm_gem_shmem_vmap(fb->obj[0], &buf);
+	if (ret)
 		goto out_dev_exit;
 
 	if (cirrus->cpp == fb->format->cpp[0])
 		drm_fb_memcpy_dstclip(cirrus->vram,
-				      vmap, fb, rect);
+				      buf.vaddr, fb, rect);
 
 	else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2)
 		drm_fb_xrgb8888_to_rgb565_dstclip(cirrus->vram,
 						  cirrus->pitch,
-						  vmap, fb, rect, false);
+						  buf.vaddr, fb, rect, false);
 
 	else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3)
 		drm_fb_xrgb8888_to_rgb888_dstclip(cirrus->vram,
 						  cirrus->pitch,
-						  vmap, fb, rect);
+						  buf.vaddr, fb, rect);
 
 	else
 		WARN_ON_ONCE("cpp mismatch");
 
-	drm_gem_shmem_vunmap(fb->obj[0], vmap);
+	drm_gem_shmem_vunmap(fb->obj[0], &buf);
 	ret = 0;
 
 out_dev_exit:
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index cc397671f689..52409e63733e 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -248,7 +248,7 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 {
 	int block, dst_offset, len, remain, ret, x1, x2, y1, y2;
 	struct drm_framebuffer *fb;
-	void *vaddr;
+	struct drm_gem_membuf buf;
 	u8 *src;
 
 	mutex_lock(&gm12u320->fb_update.lock);
@@ -262,9 +262,9 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 	y1 = gm12u320->fb_update.rect.y1;
 	y2 = gm12u320->fb_update.rect.y2;
 
-	vaddr = drm_gem_shmem_vmap(fb->obj[0]);
-	if (IS_ERR(vaddr)) {
-		GM12U320_ERR("failed to vmap fb: %ld\n", PTR_ERR(vaddr));
+	ret = drm_gem_shmem_vmap(fb->obj[0], &buf);
+	if (ret) {
+		GM12U320_ERR("failed to vmap fb: %d\n", ret);
 		goto put_fb;
 	}
 
@@ -277,7 +277,7 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 		}
 	}
 
-	src = vaddr + y1 * fb->pitches[0] + x1 * 4;
+	src = buf.vaddr + y1 * fb->pitches[0] + x1 * 4;
 
 	x1 += (GM12U320_REAL_WIDTH - GM12U320_USER_WIDTH) / 2;
 	x2 += (GM12U320_REAL_WIDTH - GM12U320_USER_WIDTH) / 2;
@@ -318,7 +318,7 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
 	}
 vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], vaddr);
+	drm_gem_shmem_vunmap(fb->obj[0], &buf);
 put_fb:
 	drm_framebuffer_put(fb);
 	gm12u320->fb_update.fb = NULL;
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index fef43f4e3bac..87a0467b8752 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -276,7 +276,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 	struct urb *urb;
 	struct drm_rect clip;
 	int log_bpp;
-	void *vaddr;
+	struct drm_gem_membuf buf;
 
 	ret = udl_log_cpp(fb->format->cpp[0]);
 	if (ret < 0)
@@ -296,8 +296,8 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 			return ret;
 	}
 
-	vaddr = drm_gem_shmem_vmap(fb->obj[0]);
-	if (IS_ERR(vaddr)) {
+	ret = drm_gem_shmem_vmap(fb->obj[0], &buf);
+	if (ret) {
 		DRM_ERROR("failed to vmap fb\n");
 		goto out_dma_buf_end_cpu_access;
 	}
@@ -312,7 +312,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 		const int byte_offset = line_offset + (clip.x1 << log_bpp);
 		const int dev_byte_offset = (fb->width * i + clip.x1) << log_bpp;
 		const int byte_width = (clip.x2 - clip.x1) << log_bpp;
-		ret = udl_render_hline(dev, log_bpp, &urb, (char *)vaddr,
+		ret = udl_render_hline(dev, log_bpp, &urb, buf.vaddr,
 				       &cmd, byte_offset, dev_byte_offset,
 				       byte_width);
 		if (ret)
@@ -333,7 +333,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 	ret = 0;
 
 out_drm_gem_shmem_vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], vaddr);
+	drm_gem_shmem_vunmap(fb->obj[0], &buf);
 out_dma_buf_end_cpu_access:
 	if (import_attach) {
 		tmp_ret = dma_buf_end_cpu_access(import_attach->dmabuf,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 4fcc0a542b8a..a35d4d6ddaf3 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -384,7 +384,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	u32 height = plane->state->crtc_h;
 	size_t data_size, mask_size;
 	u32 flags;
-	u8 *src;
+	struct drm_gem_membuf buf;
+	int ret;
 
 	/*
 	 * VirtualBox uses the host windowing system to draw the cursor so
@@ -397,8 +398,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 
 	vbox_crtc->cursor_enabled = true;
 
-	src = drm_gem_vram_vmap(gbo);
-	if (IS_ERR(src)) {
+	ret = drm_gem_vram_vmap(gbo, &buf);
+	if (ret) {
 		/*
 		 * BUG: we should have pinned the BO in prepare_fb().
 		 */
@@ -415,8 +416,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	mask_size = ((width + 7) / 8 * height + 3) & ~3;
 	data_size = width * height * 4 + mask_size;
 
-	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
-	drm_gem_vram_vunmap(gbo, src);
+	copy_cursor_image(buf.vaddr, vbox->cursor_data, width, height, mask_size);
+	drm_gem_vram_vunmap(gbo, &buf);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 337a48321705..a2a291116859 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -39,6 +39,7 @@
 
 #include <drm/drm_vma_manager.h>
 
+struct drm_gem_membuf;
 struct drm_gem_object;
 
 /**
@@ -138,7 +139,7 @@ struct drm_gem_object_funcs {
 	 *
 	 * This callback is optional.
 	 */
-	void *(*vmap)(struct drm_gem_object *obj);
+	int (*vmap)(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
 
 	/**
 	 * @vunmap:
@@ -148,7 +149,7 @@ struct drm_gem_object_funcs {
 	 *
 	 * This callback is optional.
 	 */
-	void (*vunmap)(struct drm_gem_object *obj, void *vaddr);
+	void (*vunmap)(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
 
 	/**
 	 * @mmap:
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 2bfa2502607a..b8ceee4c765e 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -103,8 +103,8 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 				  struct sg_table *sgt);
 int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma);
-void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj);
-void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
+int drm_gem_cma_prime_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
+void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
 
 struct drm_gem_object *
 drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5381f0c8cf6f..650f8848ee6a 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -113,8 +113,8 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_object *obj);
 void drm_gem_shmem_unpin(struct drm_gem_object *obj);
-void *drm_gem_shmem_vmap(struct drm_gem_object *obj);
-void drm_gem_shmem_vunmap(struct drm_gem_object *obj, void *vaddr);
+int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
+void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
 
 int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv);
 
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index b34f1da89cc7..0872c223a786 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -101,8 +101,10 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
-void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo);
-void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr);
+int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo,
+		      struct drm_gem_membuf *buf);
+void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
+			 struct drm_gem_membuf *buf);
 
 int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
