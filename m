Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2EC7508A4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC0310E513;
	Wed, 12 Jul 2023 12:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF65910E082;
 Wed, 12 Jul 2023 12:47:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-307d20548adso6970703f8f.0; 
 Wed, 12 Jul 2023 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689166028; x=1691758028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tdCxVQY6zUD0NCu5CO0Sn71XJFnwoJPf6cyzKz5R28s=;
 b=IvEQ4+8vz0AgSJGoItrIZIu5+p7CghVfK6454DuKK+na4ysuLbtbvORDgAjn1gUotJ
 WH3R06GpkuxO9c59yZw5RZ4vKILg64plzT4FdDrI4zzaz/ZhMTQBJWPB5GCF38gd0KR+
 Y4vFrvZLceQBUGLkDGFydq6bUEY1hnY2FFaWX/L5jQzVYGBYPHDkdtfeqwGbXwiBotet
 NEJvBBoEY5au+bw1cOiPm4jZvXrVEXE25sbU5RaxiTG8XsS36hJvi6v+expfTBCTkiE7
 nZiKbnyQ6lVoM/JWgPBKsMiBOyDTNQvL0bOZ8Irm1cp2xnZkde1DD9gzLB0EwYruOHuH
 3TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166028; x=1691758028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tdCxVQY6zUD0NCu5CO0Sn71XJFnwoJPf6cyzKz5R28s=;
 b=aWkb8s6oSYJc84+p+d6mq/3zFoOLtK+wmQMbJsFXD5axlEycoPv4l1t0D2f65Wk7dM
 02+FHXw7FYu81siwXw8f8UVA10dCvatM2w5FYQt60f+V90mY8/Ls/OZyM8ndamjA3MhM
 I3A/ZmcbH0kZl1A0/815ytKAMs5ilsFN7DpkAwJFn+LsHY3CMdRqf8UbrGL9BLt/Adhl
 q8TxPUMjx1ALpBRZU35JYrqnFPV1l9XGvmNyUPPNqQdyf37KIqaRsLwh9ir2F9C6DjI4
 SwQ4Qztt70Kkcgxg3OLrN5Z5iQatfFZJUHzAg15FqqAAVgQYkky0dr17C+Nvpls98g4V
 S0TQ==
X-Gm-Message-State: ABy/qLaMs0xwu/ZlZWBcVc5ZQwFnP9waMauzCQoSuuUhetWYgVY9iuL6
 4jNIpZlAUICMG2ouOEosrbrNIazcnvY=
X-Google-Smtp-Source: APBJJlGR80N/UcbSuewCFc/CgH5nSwFNyLqKuJvb63uLTILtLrC0BY6DmdVGbPYTuL5axL5dbuQCBg==
X-Received: by 2002:a5d:43ca:0:b0:2d1:3eb9:c3c2 with SMTP id
 v10-20020a5d43ca000000b002d13eb9c3c2mr15217334wrr.54.1689166027596; 
 Wed, 12 Jul 2023 05:47:07 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a00:e180:1557:4100:d4c4:2bb7:77d6:6d86])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b0031424950a99sm4989225wrm.81.2023.07.12.05.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:47:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/radeon: switch over to drm_exec
Date: Wed, 12 Jul 2023 14:46:58 +0200
Message-Id: <20230712124704.333004-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712124704.333004-1-christian.koenig@amd.com>
References: <20230712124704.333004-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a straightforward conversion without any optimization.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/radeon/Kconfig         |  1 +
 drivers/gpu/drm/radeon/radeon.h        |  7 ++--
 drivers/gpu/drm/radeon/radeon_cs.c     | 45 +++++++++++++-------------
 drivers/gpu/drm/radeon/radeon_gem.c    | 39 ++++++++++++----------
 drivers/gpu/drm/radeon/radeon_object.c | 25 +++++++-------
 drivers/gpu/drm/radeon/radeon_object.h |  2 +-
 drivers/gpu/drm/radeon/radeon_vm.c     | 10 +++---
 7 files changed, 66 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index fe498c8af1bb..fdfede471a6d 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -12,6 +12,7 @@ config DRM_RADEON
         select DRM_TTM
 	select DRM_TTM_HELPER
 	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
+	select DRM_EXEC
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	select POWER_SUPPLY
 	select HWMON
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 8afb03bbce29..37a932a5195f 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -75,8 +75,8 @@
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_audio_component.h>
 #include <drm/drm_suballoc.h>
@@ -458,7 +458,8 @@ struct radeon_mman {
 
 struct radeon_bo_list {
 	struct radeon_bo		*robj;
-	struct ttm_validate_buffer	tv;
+	struct list_head		list;
+	bool				shared;
 	uint64_t			gpu_offset;
 	unsigned			preferred_domains;
 	unsigned			allowed_domains;
@@ -1031,6 +1032,7 @@ struct radeon_cs_parser {
 	struct radeon_bo_list	*vm_bos;
 	struct list_head	validated;
 	unsigned		dma_reloc_idx;
+	struct drm_exec		exec;
 	/* indices of various chunks */
 	struct radeon_cs_chunk  *chunk_ib;
 	struct radeon_cs_chunk  *chunk_relocs;
@@ -1044,7 +1046,6 @@ struct radeon_cs_parser {
 	u32			cs_flags;
 	u32			ring;
 	s32			priority;
-	struct ww_acquire_ctx	ticket;
 };
 
 static inline u32 radeon_get_ib_value(struct radeon_cs_parser *p, int idx)
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index a6700d7278bf..ea0a1ed56bd8 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -182,11 +182,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 			}
 		}
 
-		p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
-		p->relocs[i].tv.num_shared = !r->write_domain;
-
-		radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
-				      priority);
+		p->relocs[i].shared = !r->write_domain;
+		radeon_cs_buckets_add(&buckets, &p->relocs[i].list, priority);
 	}
 
 	radeon_cs_buckets_get_list(&buckets, &p->validated);
@@ -197,7 +194,7 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 	if (need_mmap_lock)
 		mmap_read_lock(current->mm);
 
-	r = radeon_bo_list_validate(p->rdev, &p->ticket, &p->validated, p->ring);
+	r = radeon_bo_list_validate(p->rdev, &p->exec, &p->validated, p->ring);
 
 	if (need_mmap_lock)
 		mmap_read_unlock(current->mm);
@@ -253,12 +250,11 @@ static int radeon_cs_sync_rings(struct radeon_cs_parser *p)
 	struct radeon_bo_list *reloc;
 	int r;
 
-	list_for_each_entry(reloc, &p->validated, tv.head) {
+	list_for_each_entry(reloc, &p->validated, list) {
 		struct dma_resv *resv;
 
 		resv = reloc->robj->tbo.base.resv;
-		r = radeon_sync_resv(p->rdev, &p->ib.sync, resv,
-				     reloc->tv.num_shared);
+		r = radeon_sync_resv(p->rdev, &p->ib.sync, resv, reloc->shared);
 		if (r)
 			return r;
 	}
@@ -276,6 +272,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 	s32 priority = 0;
 
 	INIT_LIST_HEAD(&p->validated);
+	drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 
 	if (!cs->num_chunks) {
 		return 0;
@@ -397,8 +394,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 static int cmp_size_smaller_first(void *priv, const struct list_head *a,
 				  const struct list_head *b)
 {
-	struct radeon_bo_list *la = list_entry(a, struct radeon_bo_list, tv.head);
-	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, tv.head);
+	struct radeon_bo_list *la = list_entry(a, struct radeon_bo_list, list);
+	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, list);
 
 	/* Sort A before B if A is smaller. */
 	if (la->robj->tbo.base.size > lb->robj->tbo.base.size)
@@ -417,11 +414,13 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
  * If error is set than unvalidate buffer, otherwise just free memory
  * used by parsing context.
  **/
-static void radeon_cs_parser_fini(struct radeon_cs_parser *parser, int error, bool backoff)
+static void radeon_cs_parser_fini(struct radeon_cs_parser *parser, int error)
 {
 	unsigned i;
 
 	if (!error) {
+		struct radeon_bo_list *reloc;
+
 		/* Sort the buffer list from the smallest to largest buffer,
 		 * which affects the order of buffers in the LRU list.
 		 * This assures that the smallest buffers are added first
@@ -433,15 +432,17 @@ static void radeon_cs_parser_fini(struct radeon_cs_parser *parser, int error, bo
 		 * per frame under memory pressure.
 		 */
 		list_sort(NULL, &parser->validated, cmp_size_smaller_first);
-
-		ttm_eu_fence_buffer_objects(&parser->ticket,
-					    &parser->validated,
-					    &parser->ib.fence->base);
-	} else if (backoff) {
-		ttm_eu_backoff_reservation(&parser->ticket,
-					   &parser->validated);
+		list_for_each_entry(reloc, &parser->validated, list) {
+			dma_resv_add_fence(reloc->robj->tbo.base.resv,
+					   &parser->ib.fence->base,
+					   reloc->shared ?
+					   DMA_RESV_USAGE_READ :
+					   DMA_RESV_USAGE_WRITE);
+		}
 	}
 
+	drm_exec_fini(&parser->exec);
+
 	if (parser->relocs != NULL) {
 		for (i = 0; i < parser->nrelocs; i++) {
 			struct radeon_bo *bo = parser->relocs[i].robj;
@@ -693,7 +694,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	r = radeon_cs_parser_init(&parser, data);
 	if (r) {
 		DRM_ERROR("Failed to initialize parser !\n");
-		radeon_cs_parser_fini(&parser, r, false);
+		radeon_cs_parser_fini(&parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
@@ -707,7 +708,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	}
 
 	if (r) {
-		radeon_cs_parser_fini(&parser, r, false);
+		radeon_cs_parser_fini(&parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
@@ -724,7 +725,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		goto out;
 	}
 out:
-	radeon_cs_parser_fini(&parser, r, true);
+	radeon_cs_parser_fini(&parser, r);
 	up_read(&rdev->exclusive_lock);
 	r = radeon_cs_handle_lockup(rdev, r);
 	return r;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index d0119c5f7eb3..3af518895603 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -623,33 +623,40 @@ int radeon_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
 static void radeon_gem_va_update_vm(struct radeon_device *rdev,
 				    struct radeon_bo_va *bo_va)
 {
-	struct ttm_validate_buffer tv, *entry;
-	struct radeon_bo_list *vm_bos;
-	struct ww_acquire_ctx ticket;
+	struct radeon_bo_list *vm_bos, *entry;
 	struct list_head list;
+	struct drm_exec exec;
 	unsigned domain;
 	int r;
 
 	INIT_LIST_HEAD(&list);
 
-	tv.bo = &bo_va->bo->tbo;
-	tv.num_shared = 1;
-	list_add(&tv.head, &list);
-
 	vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
 	if (!vm_bos)
 		return;
 
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
-	if (r)
-		goto error_free;
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec) {
+		list_for_each_entry(entry, &list, list) {
+			r = drm_exec_prepare_obj(&exec, &entry->robj->tbo.base,
+						 1);
+			drm_exec_retry_on_contention(&exec);
+			if (unlikely(r))
+				goto error_cleanup;
+		}
 
-	list_for_each_entry(entry, &list, head) {
-		domain = radeon_mem_type_to_domain(entry->bo->resource->mem_type);
+		r = drm_exec_prepare_obj(&exec, &bo_va->bo->tbo.base, 1);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(r))
+			goto error_cleanup;
+	}
+
+	list_for_each_entry(entry, &list, list) {
+		domain = radeon_mem_type_to_domain(entry->robj->tbo.resource->mem_type);
 		/* if anything is swapped out don't swap it in here,
 		   just abort and wait for the next CS */
 		if (domain == RADEON_GEM_DOMAIN_CPU)
-			goto error_unreserve;
+			goto error_cleanup;
 	}
 
 	mutex_lock(&bo_va->vm->mutex);
@@ -663,10 +670,8 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
 error_unlock:
 	mutex_unlock(&bo_va->vm->mutex);
 
-error_unreserve:
-	ttm_eu_backoff_reservation(&ticket, &list);
-
-error_free:
+error_cleanup:
+	drm_exec_fini(&exec);
 	kvfree(vm_bos);
 
 	if (r && r != -ERESTARTSYS)
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 10c0fbd9d2b4..e47f04c001b8 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -468,23 +468,26 @@ static u64 radeon_bo_get_threshold_for_moves(struct radeon_device *rdev)
 }
 
 int radeon_bo_list_validate(struct radeon_device *rdev,
-			    struct ww_acquire_ctx *ticket,
+			    struct drm_exec *exec,
 			    struct list_head *head, int ring)
 {
 	struct ttm_operation_ctx ctx = { true, false };
 	struct radeon_bo_list *lobj;
-	struct list_head duplicates;
-	int r;
 	u64 bytes_moved = 0, initial_bytes_moved;
 	u64 bytes_moved_threshold = radeon_bo_get_threshold_for_moves(rdev);
+	int r;
 
-	INIT_LIST_HEAD(&duplicates);
-	r = ttm_eu_reserve_buffers(ticket, head, true, &duplicates);
-	if (unlikely(r != 0)) {
-		return r;
+	drm_exec_until_all_locked(exec) {
+		list_for_each_entry(lobj, head, list) {
+			r = drm_exec_prepare_obj(exec, &lobj->robj->tbo.base,
+						 1);
+			drm_exec_retry_on_contention(exec);
+			if (unlikely(r && r != -EALREADY))
+				return r;
+		}
 	}
 
-	list_for_each_entry(lobj, head, tv.head) {
+	list_for_each_entry(lobj, head, list) {
 		struct radeon_bo *bo = lobj->robj;
 		if (!bo->tbo.pin_count) {
 			u32 domain = lobj->preferred_domains;
@@ -523,7 +526,6 @@ int radeon_bo_list_validate(struct radeon_device *rdev,
 					domain = lobj->allowed_domains;
 					goto retry;
 				}
-				ttm_eu_backoff_reservation(ticket, head);
 				return r;
 			}
 		}
@@ -531,11 +533,6 @@ int radeon_bo_list_validate(struct radeon_device *rdev,
 		lobj->tiling_flags = bo->tiling_flags;
 	}
 
-	list_for_each_entry(lobj, &duplicates, tv.head) {
-		lobj->gpu_offset = radeon_bo_gpu_offset(lobj->robj);
-		lobj->tiling_flags = lobj->robj->tiling_flags;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 39cc87a59a9a..d7bbb52db546 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -152,7 +152,7 @@ extern void radeon_bo_force_delete(struct radeon_device *rdev);
 extern int radeon_bo_init(struct radeon_device *rdev);
 extern void radeon_bo_fini(struct radeon_device *rdev);
 extern int radeon_bo_list_validate(struct radeon_device *rdev,
-				   struct ww_acquire_ctx *ticket,
+				   struct drm_exec *exec,
 				   struct list_head *head, int ring);
 extern int radeon_bo_set_tiling_flags(struct radeon_bo *bo,
 				u32 tiling_flags, u32 pitch);
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 987cabbf1318..647c4a07d92a 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -142,10 +142,9 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
 	list[0].robj = vm->page_directory;
 	list[0].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
 	list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
-	list[0].tv.bo = &vm->page_directory->tbo;
-	list[0].tv.num_shared = 1;
+	list[0].shared = true;
 	list[0].tiling_flags = 0;
-	list_add(&list[0].tv.head, head);
+	list_add(&list[0].list, head);
 
 	for (i = 0, idx = 1; i <= vm->max_pde_used; i++) {
 		if (!vm->page_tables[i].bo)
@@ -154,10 +153,9 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
 		list[idx].robj = vm->page_tables[i].bo;
 		list[idx].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
 		list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
-		list[idx].tv.bo = &list[idx].robj->tbo;
-		list[idx].tv.num_shared = 1;
+		list[idx].shared = true;
 		list[idx].tiling_flags = 0;
-		list_add(&list[idx++].tv.head, head);
+		list_add(&list[idx++].list, head);
 	}
 
 	return list;
-- 
2.34.1

