Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767B81C941C
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06F76EA1E;
	Thu,  7 May 2020 15:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5156E9F5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:42 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y24so7260216wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/H9c3W6BnjhYWcBo1BUMN3D/f+FSm8f6UQ5824qrtw=;
 b=fSoD5RQnZMGYK7L9YTzrU7FfWx8JeBrLtW5lH+mJ6pgefvsZv4shcu/73o/Maqh72K
 Pe99a+xBpollDGaod0c+evSBYP0auCGXYU3eLAgUc7c4YQj1pMCGuQKSTLfqszVa8h43
 Pa5bBAXrF9nBgroC0w/wxLjQJbnrmDl/bHBBzrVogqz5KGQvO9KPsjREojDjBdFp+sJo
 0py7hHl0F+EatNxfcj9uDuCWI2TSaLCO9Kwfd4uqM1iKWAhw/2mIGqP/MvEabrBilY/F
 a/3O+QV5FuhiDiy1FSXglikcia86f2NnRBUu7geootjNHVAaZnVsnlt0k37HSt4idf1h
 MrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/H9c3W6BnjhYWcBo1BUMN3D/f+FSm8f6UQ5824qrtw=;
 b=j1zb1LYW3Kph/Y+3VaH0vhP4m3Yl0XjqWtBklm3rBcUVUWzwX7MBL+i+nqbsoaLsLX
 03XqsySPWcPKUU92HocByfyZyiKPyWUWuBhQhKMarEa46mCBkoYd9HHVodrMcy3BcXFm
 G+JOZg7F/RgDkZrjzpJx1sCLAn588Hu6s/dhFD7GM7rcWE0LpAr66eaIEAYv6FnMQhti
 etyfInzNWMkMBwuM98gba2JIwy8bvqFeNyj/GQj9uL2b/+6acOziw+Ruj9EJ9EQ9JaWV
 e0yt8VyEVeHyvv0DawWa7THp5qxhhUzsqbqy8YStxjymUFz/GS04TMpq6LQ7f60F50Gj
 +9dw==
X-Gm-Message-State: AGi0PuaLppTLerwWVkm2S9apuYDOZXdSCqy2lHNNlpc2a9j4yYjblowN
 CFXjyOq6oUy/VWvqmXdv1uqFevNC
X-Google-Smtp-Source: APiQypKuzKFtYwb8AnvKeeaALoFqu7A4sbH8Je34YjgIaER+gv14bNX/z7D+eS/zbJ6aMP4fsrJ5pg==
X-Received: by 2002:a05:600c:21ca:: with SMTP id
 x10mr10256254wmj.113.1588864300582; 
 Thu, 07 May 2020 08:11:40 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:39 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 36/36] drm/gem: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:22 +0100
Message-Id: <20200507150822.114464-37-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

With this patch, the _unlocked define is no longer needed - remove it.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 Documentation/gpu/drm-mm.rst                 |  2 +-
 drivers/gpu/drm/drm_client.c                 |  2 +-
 drivers/gpu/drm/drm_gem.c                    | 26 ++++++++++----------
 drivers/gpu/drm/drm_gem_cma_helper.c         |  8 +++---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  6 ++---
 drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +--
 drivers/gpu/drm/drm_gem_ttm_helper.c         |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c        | 10 ++++----
 drivers/gpu/drm/drm_prime.c                  |  6 ++---
 include/drm/drm_gem.h                        |  4 +--
 10 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 5ba2ead8f317..8c8540ee859c 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -178,7 +178,7 @@ GEM Objects Lifetime
 --------------------
 
 All GEM objects are reference-counted by the GEM core. References can be
-acquired and release by calling drm_gem_object_get() and drm_gem_object_put_unlocked()
+acquired and release by calling drm_gem_object_get() and drm_gem_object_put()
 respectively.
 
 When the last reference to a GEM object is released the GEM core calls
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 8cb93f5209a4..536a22747b51 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -237,7 +237,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 	drm_gem_vunmap(buffer->gem, buffer->vaddr);
 
 	if (buffer->gem)
-		drm_gem_object_put_unlocked(buffer->gem);
+		drm_gem_object_put(buffer->gem);
 
 	if (buffer->handle)
 		drm_mode_destroy_dumb(dev, buffer->handle, buffer->client->file);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index f21327ebc562..ae02b3842c90 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -235,7 +235,7 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	mutex_unlock(&dev->object_name_lock);
 
 	if (final)
-		drm_gem_object_put_unlocked(obj);
+		drm_gem_object_put(obj);
 }
 
 /*
@@ -331,7 +331,7 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 
 	*offset = drm_vma_node_offset_addr(&obj->vma_node);
 out:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
@@ -690,7 +690,7 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
  * Returns:
  *
  * @objs filled in with GEM object pointers. Returned GEM objects need to be
- * released with drm_gem_object_put_unlocked(). -ENOENT is returned on a lookup
+ * released with drm_gem_object_put(). -ENOENT is returned on a lookup
  * failure. 0 is returned on success.
  *
  */
@@ -785,7 +785,7 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 	else if (ret > 0)
 		ret = 0;
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
@@ -860,7 +860,7 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
 
 err:
 	mutex_unlock(&dev->object_name_lock);
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return ret;
 }
 
@@ -898,7 +898,7 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
 
 	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
 	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	if (ret)
 		return ret;
 
@@ -991,7 +991,7 @@ EXPORT_SYMBOL(drm_gem_object_free);
  * driver doesn't use &drm_device.struct_mutex for anything.
  *
  * For drivers not encumbered with legacy locking use
- * drm_gem_object_put_unlocked() instead.
+ * drm_gem_object_put() instead.
  */
 void
 drm_gem_object_put_locked(struct drm_gem_object *obj)
@@ -1030,7 +1030,7 @@ void drm_gem_vm_close(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 }
 EXPORT_SYMBOL(drm_gem_vm_close);
 
@@ -1079,7 +1079,7 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 	if (obj->funcs && obj->funcs->mmap) {
 		ret = obj->funcs->mmap(obj, vma);
 		if (ret) {
-			drm_gem_object_put_unlocked(obj);
+			drm_gem_object_put(obj);
 			return ret;
 		}
 		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
@@ -1089,7 +1089,7 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 		else if (dev->driver->gem_vm_ops)
 			vma->vm_ops = dev->driver->gem_vm_ops;
 		else {
-			drm_gem_object_put_unlocked(obj);
+			drm_gem_object_put(obj);
 			return -EINVAL;
 		}
 
@@ -1155,13 +1155,13 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 		return -EINVAL;
 
 	if (!drm_vma_node_is_allowed(node, priv)) {
-		drm_gem_object_put_unlocked(obj);
+		drm_gem_object_put(obj);
 		return -EACCES;
 	}
 
 	if (node->readonly) {
 		if (vma->vm_flags & VM_WRITE) {
-			drm_gem_object_put_unlocked(obj);
+			drm_gem_object_put(obj);
 			return -EINVAL;
 		}
 
@@ -1171,7 +1171,7 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	ret = drm_gem_mmap_obj(obj, drm_vma_node_size(node) << PAGE_SHIFT,
 			       vma);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 12e98fb28229..b3db3ca7bd7a 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -114,7 +114,7 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 	return cma_obj;
 
 error:
-	drm_gem_object_put_unlocked(&cma_obj->base);
+	drm_gem_object_put(&cma_obj->base);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_create);
@@ -156,7 +156,7 @@ drm_gem_cma_create_with_handle(struct drm_file *file_priv,
 	 */
 	ret = drm_gem_handle_create(file_priv, gem_obj, handle);
 	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -380,13 +380,13 @@ unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
 		return -EINVAL;
 
 	if (!drm_vma_node_is_allowed(node, priv)) {
-		drm_gem_object_put_unlocked(obj);
+		drm_gem_object_put(obj);
 		return -EACCES;
 	}
 
 	cma_obj = to_drm_gem_cma_obj(obj);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return cma_obj->vaddr ? (unsigned long)cma_obj->vaddr : -EINVAL;
 }
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index ccc2c71fa491..109d11fb4cd4 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -95,7 +95,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
 	int i;
 
 	for (i = 0; i < 4; i++)
-		drm_gem_object_put_unlocked(fb->obj[i]);
+		drm_gem_object_put(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
@@ -175,7 +175,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 			 + mode_cmd->offsets[i];
 
 		if (objs[i]->size < min_size) {
-			drm_gem_object_put_unlocked(objs[i]);
+			drm_gem_object_put(objs[i]);
 			ret = -EINVAL;
 			goto err_gem_object_put;
 		}
@@ -189,7 +189,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 
 err_gem_object_put:
 	for (i--; i >= 0; i--)
-		drm_gem_object_put_unlocked(objs[i]);
+		drm_gem_object_put(objs[i]);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index df31e5782eed..339eee79ea52 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -360,7 +360,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 	 */
 	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
 	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put_unlocked(&shmem->base);
+	drm_gem_object_put(&shmem->base);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -684,7 +684,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 err_free_array:
 	kvfree(shmem->pages);
 err_free_gem:
-	drm_gem_object_put_unlocked(&shmem->base);
+	drm_gem_object_put(&shmem->base);
 
 	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
index 605a8a3da7f9..892b2288a104 100644
--- a/drivers/gpu/drm/drm_gem_ttm_helper.c
+++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
@@ -74,7 +74,7 @@ int drm_gem_ttm_mmap(struct drm_gem_object *gem,
 	 * ttm has its own object refcounting, so drop gem reference
 	 * to avoid double accounting counting.
 	 */
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 8b2d5c945c95..0023ce1d2cf7 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -618,9 +618,9 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 
 	ret = drm_gem_handle_create(file, &gbo->bo.base, &handle);
 	if (ret)
-		goto err_drm_gem_object_put_unlocked;
+		goto err_drm_gem_object_put;
 
-	drm_gem_object_put_unlocked(&gbo->bo.base);
+	drm_gem_object_put(&gbo->bo.base);
 
 	args->pitch = pitch;
 	args->size = size;
@@ -628,8 +628,8 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 
 	return 0;
 
-err_drm_gem_object_put_unlocked:
-	drm_gem_object_put_unlocked(&gbo->bo.base);
+err_drm_gem_object_put:
+	drm_gem_object_put(&gbo->bo.base);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_fill_create_dumb);
@@ -737,7 +737,7 @@ int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
 	gbo = drm_gem_vram_of_gem(gem);
 	*offset = drm_gem_vram_mmap_offset(gbo);
 
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 282774e469ac..bbfc713bfdc3 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -270,7 +270,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
 	struct drm_device *dev = obj->dev;
 
 	/* drop the reference on the export fd holds */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	drm_dev_put(dev);
 }
@@ -329,7 +329,7 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 
 	/* _handle_create_tail unconditionally unlocks dev->object_name_lock. */
 	ret = drm_gem_handle_create_tail(file_priv, obj, handle);
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	if (ret)
 		goto out_put;
 
@@ -500,7 +500,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 fail_put_dmabuf:
 	dma_buf_put(dmabuf);
 out:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 out_unlock:
 	mutex_unlock(&file_priv->prime.lock);
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 70c0059ee72b..eeb6f2cd5d24 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -188,7 +188,7 @@ struct drm_gem_object {
 	 * Reference count of this object
 	 *
 	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put_locked()
-	 * or drm_gem_object_put_unlocked() to release a reference to a GEM
+	 * or drm_gem_object_put() to release a reference to a GEM
 	 * buffer object.
 	 */
 	struct kref refcount;
@@ -376,8 +376,6 @@ drm_gem_object_put(struct drm_gem_object *obj)
 	kref_put(&obj->refcount, drm_gem_object_free);
 }
 
-#define drm_gem_object_put_unlocked drm_gem_object_put
-
 void drm_gem_object_put_locked(struct drm_gem_object *obj);
 
 int drm_gem_handle_create(struct drm_file *file_priv,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
