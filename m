Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBE11D4A04
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A646EC40;
	Fri, 15 May 2020 09:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41656EC37
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h17so2774366wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iP4HCCJA8AjIGmXzX15rGbOZS7T6ghNvHmXRpTbnWg0=;
 b=LPXkG9rOHYxlqP1E2ctzwa+/yE1lx87P4o7AmIRIk68+L/S1KVATl2ahAYtRbSprQr
 7GsN+OJFHEXW+IwVN2CQrAzyrestL4uf2c3Puz09MknAn0QPJ2XrqJO5QhNKoGxkZAVR
 1Y/HUm6rjvNrqEUo4OWRlsLoRElItUJCVLa8wp52PkDFSxocordBDDh8lh2iwIXgqY7P
 XzXNcfo+ZwvvSWkFpiR6jK/9FNKb4r0Ybf4wiieikZleWomDCPEaDeUikDRZs9jYMKH0
 lTGpPj3ZkvidJwE6eCSFaZAZo+8wwQAKLjEVTxlnu1/4YTtVkkDaG5gO5FtWOsxS7NgD
 26ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iP4HCCJA8AjIGmXzX15rGbOZS7T6ghNvHmXRpTbnWg0=;
 b=ZY99Wxq58tu/VDgSy6dxu8hYE0ECj+DazuksNfYe1ICqHhcwrNweE/mzblKU+1naSA
 SfQoy9zVjuKuyEueZ2yzbISEpbysDeqsbvxDVZptSgiLmA1obvHcQT5iNxOCKjUN4r+y
 4PRzY0qUTS1DMYzgZ1ZzTlCBAT3Hj9PKYfXoKQgv98X96QVnAKfgTbI/ePG4YLM0bx+d
 xbfyf/iAkmA0o9DAoevgwKZO4ZoijdLXEfObbrc0R/MqdsGVAzYbB7NXAqiMhdeJhk6z
 zNsyL0wN3ScwKwwusrmDVkOJldrU4CU0xmVllNcTjlQMwPh4NkBVfp4daPZ8yuyGZ8O5
 cwnQ==
X-Gm-Message-State: AOAM5305KhDgKr6JXF5rpbmHmzhPJEfoXNDuQTewOuqh5KbFATN9NFwc
 8bDigC9ntC2XBaqR7CeuO/sPqkBH
X-Google-Smtp-Source: ABdhPJxAdR2LXLXbZN1K6wNH52Ul4O2em3t1bCcdOlFIik+NEkH+E0CE1BTQnwo0IklefeHr9I+yAw==
X-Received: by 2002:adf:f487:: with SMTP id l7mr3175226wro.381.1589536455703; 
 Fri, 15 May 2020 02:54:15 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:15 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/38] drm: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:50:53 +0100
Message-Id: <20200515095118.2743122-14-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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

Pay special attention to the compat #define

v2: keep sed and #define removal separate

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)
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
 include/drm/drm_gem.h                        |  2 +-
 10 files changed, 34 insertions(+), 34 deletions(-)

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
index 2f7b86c0649c..10c5d561eb18 100644
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
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
