Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE7973DE60
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F51510E1E8;
	Mon, 26 Jun 2023 12:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F0D10E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:02:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C4CD46607152;
 Mon, 26 Jun 2023 13:02:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687780975;
 bh=8StPnC8cFjLppoEu1zuY4PPBYBiFmydbk7VeE+rIuhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EVqidSsHQ7mlBUUONOkt9Vz/0Kc5xCif98W9c2HDAuHutoAcufMZs1BboGElAT4+f
 O9h3NvgTsVoNq3DxmyjetMlOF7lzRiRPEYU+6h4KWWS6nywHcQkRoH0ybBBmALXOzm
 bFKoctBKVJDaZwTrXTchQI+MsxKtNvYO49SV5sDlUZnUeY7kSljNv1eijCzxolZ85p
 llvmGqYIIg10wZb1b8GnU/fMEmWwDocU567LVcVkalD6jrLm+vlC9kmFFQKq9M3s2u
 FXSjZNLapED3ODNr4uLwitWp/KCvhc6rp8M/OMvfHFxuAWIosPms990aiG23ylA8gM
 5+e5V0lr5FN3g==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/shmem-helper: Inline drm_gem_shmem_{get,put}_pages()
Date: Mon, 26 Jun 2023 14:02:45 +0200
Message-ID: <20230626120247.1337962-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626120247.1337962-1-boris.brezillon@collabora.com>
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move code drm_gem_shmem_{get,put}_pages() code to
drm_gem_shmem_{pin,unpin}_locked().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 108 ++++++++++---------------
 1 file changed, 41 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d6fc034164c0..f406556e42e0 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -128,46 +128,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
-static void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
-
-/**
- * drm_gem_shmem_free - Free resources associated with a shmem GEM object
- * @shmem: shmem GEM object to free
- *
- * This function cleans up the GEM object state and frees the memory used to
- * store the object itself.
- */
-void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
-{
-	struct drm_gem_object *obj = &shmem->base;
-
-	if (obj->import_attach) {
-		drm_prime_gem_destroy(obj, shmem->sgt);
-	} else {
-		dma_resv_lock(shmem->base.resv, NULL);
-
-		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
-
-		if (shmem->sgt) {
-			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
-					  DMA_BIDIRECTIONAL, 0);
-			sg_free_table(shmem->sgt);
-			kfree(shmem->sgt);
-		}
-		if (shmem->pages)
-			drm_gem_shmem_put_pages(shmem);
-
-		drm_WARN_ON(obj->dev, shmem->pages_use_count);
-
-		dma_resv_unlock(shmem->base.resv);
-	}
-
-	drm_gem_object_release(obj);
-	kfree(shmem);
-}
-EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
-
-static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
+static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
@@ -200,13 +161,7 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 	return 0;
 }
 
-/*
- * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
- * @shmem: shmem GEM object
- *
- * This function decreases the use count and puts the backing pages when use drops to zero.
- */
-static void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
+static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -229,23 +184,42 @@ static void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 	shmem->pages = NULL;
 }
 
-static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
+/**
+ * drm_gem_shmem_free - Free resources associated with a shmem GEM object
+ * @shmem: shmem GEM object to free
+ *
+ * This function cleans up the GEM object state and frees the memory used to
+ * store the object itself.
+ */
+void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
-	int ret;
+	struct drm_gem_object *obj = &shmem->base;
 
-	dma_resv_assert_held(shmem->base.resv);
+	if (obj->import_attach) {
+		drm_prime_gem_destroy(obj, shmem->sgt);
+	} else {
+		dma_resv_lock(shmem->base.resv, NULL);
 
-	ret = drm_gem_shmem_get_pages(shmem);
+		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
 
-	return ret;
-}
-
-static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
-{
-	dma_resv_assert_held(shmem->base.resv);
-
-	drm_gem_shmem_put_pages(shmem);
+		if (shmem->sgt) {
+			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
+					  DMA_BIDIRECTIONAL, 0);
+			sg_free_table(shmem->sgt);
+			kfree(shmem->sgt);
+		}
+		if (shmem->pages)
+			drm_gem_shmem_unpin_locked(shmem);
+
+		drm_WARN_ON(obj->dev, shmem->pages_use_count);
+
+		dma_resv_unlock(shmem->base.resv);
+	}
+
+	drm_gem_object_release(obj);
+	kfree(shmem);
 }
+EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
 /**
  * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
@@ -332,7 +306,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 			return 0;
 		}
 
-		ret = drm_gem_shmem_get_pages(shmem);
+		ret = drm_gem_shmem_pin_locked(shmem);
 		if (ret)
 			goto err_zero_use;
 
@@ -355,7 +329,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 err_put_pages:
 	if (!obj->import_attach)
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin_locked(shmem);
 err_zero_use:
 	shmem->vmap_use_count = 0;
 
@@ -392,7 +366,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 			return;
 
 		vunmap(shmem->vaddr);
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin_locked(shmem);
 	}
 
 	shmem->vaddr = NULL;
@@ -452,7 +426,7 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
 
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_unpin_locked(shmem);
 
 	shmem->madv = -1;
 
@@ -565,7 +539,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
 	dma_resv_lock(shmem->base.resv, NULL);
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_unpin_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 
 	drm_gem_vm_close(vma);
@@ -606,7 +580,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 	}
 
 	dma_resv_lock(shmem->base.resv, NULL);
-	ret = drm_gem_shmem_get_pages(shmem);
+	ret = drm_gem_shmem_pin_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 
 	if (ret)
@@ -674,7 +648,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	ret = drm_gem_shmem_get_pages(shmem);
+	ret = drm_gem_shmem_pin_locked(shmem);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -696,7 +670,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	sg_free_table(sgt);
 	kfree(sgt);
 err_put_pages:
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_unpin_locked(shmem);
 	return ERR_PTR(ret);
 }
 
-- 
2.41.0

