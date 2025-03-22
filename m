Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F57A6CCAB
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 22:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4142A10E189;
	Sat, 22 Mar 2025 21:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="hT9MwIsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DC810E181
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742678949; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZQEjg65LHK6Hyre+clODy/kFVAnhUEUtGGSwtd+zeP9DbhjsjlqeKfWgIwG1woLtAcOh2bu1Qz94hoktsRcPf0MhvOsf1LJmOBP6n9D3Ylvil8oOi0fXHI6wA8ihwEAFk2HPh8xjCB+u3vwAWGHTAYOZ6/84GB7TK3LqmMZnEk0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742678949;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=LjVCx4HPPPjAEOEwlwwb+wxeXy1KGr2YaLHwamK6ixM=; 
 b=QSk7u5w9KdDHv8TW3fWo6g/xnHBea5Z3Y3eSz4/1GMMZxDSRZZNHeEkLDflBg19LxPyE8Piinq0OL3amC3pw4p/ZES3RE65Ea/i8gOXYV/KL+XJYBcYFkPfT9NKcp+WfHyYmzgcCFmJ179NH7uXk7SHVCVMHbus7ktqTUktVXFQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742678949; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=LjVCx4HPPPjAEOEwlwwb+wxeXy1KGr2YaLHwamK6ixM=;
 b=hT9MwIszhr4rCxxqak3lNcpOYbqE58R0IkHOlXOFSB9SZ1z3GKFt6J7qLSIM0scH
 JxNZ+Qtng4EfxDxPPb/OJ9sKBPA40hF0YDuUenvbLtRVDLVu6B9F4KrGMY8iUS6oUfu
 kZGlj/gF2SM6oSkeKIA9rDmL2kGqk8gRIIyFtkWw=
Received: by mx.zohomail.com with SMTPS id 1742678949231263.8352177897817;
 Sat, 22 Mar 2025 14:29:09 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v20 01/10] drm/gem: Change locked/unlocked postfix of
 drm_gem_v/unmap() function names
Date: Sun, 23 Mar 2025 00:25:59 +0300
Message-ID: <20250322212608.40511-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make drm/gem API function names consistent by having locked function
use the _locked postfix in the name, while the unlocked variants don't
use the _unlocked postfix. Rename drm_gem_v/unmap() function names to
make them consistent with the rest of the API functions.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_client.c                 | 10 +++++-----
 drivers/gpu/drm/drm_gem.c                    | 20 ++++++++++----------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  6 +++---
 drivers/gpu/drm/drm_internal.h               |  4 ++--
 drivers/gpu/drm/drm_prime.c                  |  4 ++--
 drivers/gpu/drm/lima/lima_sched.c            |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_dump.c     |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c  |  6 +++---
 drivers/gpu/drm/panthor/panthor_gem.h        |  4 ++--
 drivers/gpu/drm/panthor/panthor_sched.c      |  4 ++--
 include/drm/drm_gem.h                        |  4 ++--
 11 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 549b28a5918c..f1de7faf9fb4 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -174,7 +174,7 @@ EXPORT_SYMBOL(drm_client_release);
 static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
 	if (buffer->gem) {
-		drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
+		drm_gem_vunmap(buffer->gem, &buffer->map);
 		drm_gem_object_put(buffer->gem);
 	}
 
@@ -252,7 +252,7 @@ int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
 
 	drm_gem_lock(gem);
 
-	ret = drm_gem_vmap(gem, map);
+	ret = drm_gem_vmap_locked(gem, map);
 	if (ret)
 		goto err_drm_gem_vmap_unlocked;
 	*map_copy = *map;
@@ -278,7 +278,7 @@ void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer)
 	struct drm_gem_object *gem = buffer->gem;
 	struct iosys_map *map = &buffer->map;
 
-	drm_gem_vunmap(gem, map);
+	drm_gem_vunmap_locked(gem, map);
 	drm_gem_unlock(gem);
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
@@ -316,7 +316,7 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer,
 	ret = drm_gem_pin_locked(gem);
 	if (ret)
 		goto err_drm_gem_pin_locked;
-	ret = drm_gem_vmap(gem, map);
+	ret = drm_gem_vmap_locked(gem, map);
 	if (ret)
 		goto err_drm_gem_vmap;
 
@@ -348,7 +348,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 	struct iosys_map *map = &buffer->map;
 
 	drm_gem_lock(gem);
-	drm_gem_vunmap(gem, map);
+	drm_gem_vunmap_locked(gem, map);
 	drm_gem_unpin_locked(gem);
 	drm_gem_unlock(gem);
 }
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6240bab3fa5..27778e5ce0c0 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1216,7 +1216,7 @@ void drm_gem_unpin(struct drm_gem_object *obj)
 	dma_resv_unlock(obj->resv);
 }
 
-int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+int drm_gem_vmap_locked(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	int ret;
 
@@ -1233,9 +1233,9 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_gem_vmap);
+EXPORT_SYMBOL(drm_gem_vmap_locked);
 
-void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
+void drm_gem_vunmap_locked(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	dma_resv_assert_held(obj->resv);
 
@@ -1248,7 +1248,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 	/* Always set the mapping to NULL. Callers may rely on this. */
 	iosys_map_clear(map);
 }
-EXPORT_SYMBOL(drm_gem_vunmap);
+EXPORT_SYMBOL(drm_gem_vunmap_locked);
 
 void drm_gem_lock(struct drm_gem_object *obj)
 {
@@ -1262,25 +1262,25 @@ void drm_gem_unlock(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_unlock);
 
-int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
+int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	int ret;
 
 	dma_resv_lock(obj->resv, NULL);
-	ret = drm_gem_vmap(obj, map);
+	ret = drm_gem_vmap_locked(obj, map);
 	dma_resv_unlock(obj->resv);
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_vmap_unlocked);
+EXPORT_SYMBOL(drm_gem_vmap);
 
-void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
+void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	dma_resv_lock(obj->resv, NULL);
-	drm_gem_vunmap(obj, map);
+	drm_gem_vunmap_locked(obj, map);
 	dma_resv_unlock(obj->resv);
 }
-EXPORT_SYMBOL(drm_gem_vunmap_unlocked);
+EXPORT_SYMBOL(drm_gem_vunmap);
 
 /**
  * drm_gem_lock_reservations - Sets up the ww context and acquires
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 0fbeb686e561..6f72e7a0f427 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -362,7 +362,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
 			ret = -EINVAL;
 			goto err_drm_gem_vunmap;
 		}
-		ret = drm_gem_vmap_unlocked(obj, &map[i]);
+		ret = drm_gem_vmap(obj, &map[i]);
 		if (ret)
 			goto err_drm_gem_vunmap;
 	}
@@ -384,7 +384,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
 		obj = drm_gem_fb_get_obj(fb, i);
 		if (!obj)
 			continue;
-		drm_gem_vunmap_unlocked(obj, &map[i]);
+		drm_gem_vunmap(obj, &map[i]);
 	}
 	return ret;
 }
@@ -411,7 +411,7 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct iosys_map *map)
 			continue;
 		if (iosys_map_is_null(&map[i]))
 			continue;
-		drm_gem_vunmap_unlocked(obj, &map[i]);
+		drm_gem_vunmap(obj, &map[i]);
 	}
 }
 EXPORT_SYMBOL(drm_gem_fb_vunmap);
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b2b6a8e49dda..e44f28fd81d3 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -179,8 +179,8 @@ int drm_gem_pin_locked(struct drm_gem_object *obj);
 void drm_gem_unpin_locked(struct drm_gem_object *obj);
 int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
-int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
-void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
+int drm_gem_vmap_locked(struct drm_gem_object *obj, struct iosys_map *map);
+void drm_gem_vunmap_locked(struct drm_gem_object *obj, struct iosys_map *map);
 
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 4b8c6075e46a..d828502268b8 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -707,7 +707,7 @@ int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	return drm_gem_vmap(obj, map);
+	return drm_gem_vmap_locked(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 
@@ -723,7 +723,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_vunmap(obj, map);
+	drm_gem_vunmap_locked(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 825135a26aa4..7934098e651b 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -371,7 +371,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 		} else {
 			buffer_chunk->size = lima_bo_size(bo);
 
-			ret = drm_gem_vmap_unlocked(&bo->base.base, &map);
+			ret = drm_gem_vmap(&bo->base.base, &map);
 			if (ret) {
 				kvfree(et);
 				goto out;
@@ -379,7 +379,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 
 			memcpy(buffer_chunk + 1, map.vaddr, buffer_chunk->size);
 
-			drm_gem_vunmap_unlocked(&bo->base.base, &map);
+			drm_gem_vunmap(&bo->base.base, &map);
 		}
 
 		buffer_chunk = (void *)(buffer_chunk + 1) + buffer_chunk->size;
diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
index 47751302f1bc..4042afe2fbf4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_dump.c
+++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
@@ -209,7 +209,7 @@ void panfrost_core_dump(struct panfrost_job *job)
 			goto dump_header;
 		}
 
-		ret = drm_gem_vmap_unlocked(&bo->base.base, &map);
+		ret = drm_gem_vmap(&bo->base.base, &map);
 		if (ret) {
 			dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
 			iter.hdr->bomap.valid = 0;
@@ -228,7 +228,7 @@ void panfrost_core_dump(struct panfrost_job *job)
 		vaddr = map.vaddr;
 		memcpy(iter.data, vaddr, bo->base.base.size);
 
-		drm_gem_vunmap_unlocked(&bo->base.base, &map);
+		drm_gem_vunmap(&bo->base.base, &map);
 
 		iter.hdr->bomap.valid = 1;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index ba9b6e2b2636..52befead08c6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -106,7 +106,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 		goto err_close_bo;
 	}
 
-	ret = drm_gem_vmap_unlocked(&bo->base, &map);
+	ret = drm_gem_vmap(&bo->base, &map);
 	if (ret)
 		goto err_put_mapping;
 	perfcnt->buf = map.vaddr;
@@ -165,7 +165,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	return 0;
 
 err_vunmap:
-	drm_gem_vunmap_unlocked(&bo->base, &map);
+	drm_gem_vunmap(&bo->base, &map);
 err_put_mapping:
 	panfrost_gem_mapping_put(perfcnt->mapping);
 err_close_bo:
@@ -195,7 +195,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
 
 	perfcnt->user = NULL;
-	drm_gem_vunmap_unlocked(&perfcnt->mapping->obj->base.base, &map);
+	drm_gem_vunmap(&perfcnt->mapping->obj->base.base, &map);
 	perfcnt->buf = NULL;
 	panfrost_gem_close(&perfcnt->mapping->obj->base.base, file_priv);
 	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 5749ef2ebe03..1a363bb814f4 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -112,7 +112,7 @@ panthor_kernel_bo_vmap(struct panthor_kernel_bo *bo)
 	if (bo->kmap)
 		return 0;
 
-	ret = drm_gem_vmap_unlocked(bo->obj, &map);
+	ret = drm_gem_vmap(bo->obj, &map);
 	if (ret)
 		return ret;
 
@@ -126,7 +126,7 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
 	if (bo->kmap) {
 		struct iosys_map map = IOSYS_MAP_INIT_VADDR(bo->kmap);
 
-		drm_gem_vunmap_unlocked(bo->obj, &map);
+		drm_gem_vunmap(bo->obj, &map);
 		bo->kmap = NULL;
 	}
 }
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 4d31d1967716..446ec780eb4a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -840,7 +840,7 @@ panthor_queue_put_syncwait_obj(struct panthor_queue *queue)
 	if (queue->syncwait.kmap) {
 		struct iosys_map map = IOSYS_MAP_INIT_VADDR(queue->syncwait.kmap);
 
-		drm_gem_vunmap_unlocked(queue->syncwait.obj, &map);
+		drm_gem_vunmap(queue->syncwait.obj, &map);
 		queue->syncwait.kmap = NULL;
 	}
 
@@ -866,7 +866,7 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 		goto err_put_syncwait_obj;
 
 	queue->syncwait.obj = &bo->base.base;
-	ret = drm_gem_vmap_unlocked(queue->syncwait.obj, &map);
+	ret = drm_gem_vmap(queue->syncwait.obj, &map);
 	if (drm_WARN_ON(&ptdev->base, ret))
 		goto err_put_syncwait_obj;
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 2bf893eabb4b..13c312ca07ae 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -537,8 +537,8 @@ void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 void drm_gem_lock(struct drm_gem_object *obj);
 void drm_gem_unlock(struct drm_gem_object *obj);
 
-int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
-void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
+int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
+void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 
 int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 			   int count, struct drm_gem_object ***objs_out);
-- 
2.49.0

