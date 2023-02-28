Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D66A5476
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED34910E653;
	Tue, 28 Feb 2023 08:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD0010E64D;
 Tue, 28 Feb 2023 08:34:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id ee7so36653195edb.2;
 Tue, 28 Feb 2023 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=clE43PlHbBeLhQySptwkgxMX8ZPTnLX3VD+t4/p7uhc=;
 b=SjGJ6+nXqG4ERwwac98WWxQOQzQ4N5XRl0rIs7leCtTlNkh58IsSRUYRYCQuU69ZHF
 QEGYdTKMTfwD1uwffnXjnEQyrL3WxXdhsEIy3mp0vLp/V1QmDT+Na9acbR0US7fK+ihB
 H4Uh5UvmlUGgK/2/pNWQaPzc95IiIX/yg7OP8G4696RIYOIOiJM8MFN10+acQk5qIZF6
 ywkN5TFH8IvnXJ+KGYpicrKvL1DKmepM/25dKiY0xl0G5JECVB2D4rzSZkjf3inwvvE6
 Zm/mnJXOrDwUi4xXVilvQMf6oNVXo5DmPk3JpcOoZ788YB8z8nV54uIo0f3Rw6jioJRj
 08eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=clE43PlHbBeLhQySptwkgxMX8ZPTnLX3VD+t4/p7uhc=;
 b=Ib6YsJ86790aeHVCvsMIa5Codij2/tUdbeABNpCd8LCZjp+ZWUnGjvUzfI1/8S0Jsk
 ElnyCoOQl1mLbIALSqA4Bo5zcdyEahQ4NINbwNb891aH/yifnhzeuq+CjMj/IRGFE+jD
 3Z6Gba/WFj7on2ERsB+4G1l0RCjkhoX889iraO6OYgrn3jt/K+yfIuqqyeOTn+red1bN
 NpQVlW4KK9VJNfTJ45KtT9XZao0ku5NkhhZckPhvpO4ik5IlUteXh+V1YMU3gJLY+ian
 b1vI/aUb15YGHT563yU8RX2tg30G1MoOLlhRhXSXHUiFGslK6C2a1ymMzXRy/uGNMxI1
 uVZQ==
X-Gm-Message-State: AO0yUKWlpV2eST/HPTRjq9TYIf0RW4X2y+4bpjqspSgpQ/PTXKpwB5RP
 z3AgSGBTTz3cYiuqhX5KKRMvxZfcvJo=
X-Google-Smtp-Source: AK7set/UrZbuN6+jBGVhLpdyxhBddR0DTKq9VGW9NSLYV4cNhKxkQJOAJEPUfynDV/9N5qGMCtP0kA==
X-Received: by 2002:a17:906:6543:b0:8a9:e031:c4ae with SMTP id
 u3-20020a170906654300b008a9e031c4aemr1921260ejn.2.1677573257536; 
 Tue, 28 Feb 2023 00:34:17 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ss17-20020a170907039100b008cf6f8798e1sm4296969ejb.54.2023.02.28.00.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:34:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/radeon: switch over to drm_exec
Date: Tue, 28 Feb 2023 09:34:04 +0100
Message-Id: <20230228083406.1720795-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228083406.1720795-1-christian.koenig@amd.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
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
Cc: dakr@redhat.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a straightforward conversion without any optimization.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon.h        |  7 ++--
 drivers/gpu/drm/radeon/radeon_cs.c     | 45 +++++++++++++-------------
 drivers/gpu/drm/radeon/radeon_gem.c    | 40 +++++++++++++----------
 drivers/gpu/drm/radeon/radeon_object.c | 25 +++++++-------
 drivers/gpu/drm/radeon/radeon_object.h |  2 +-
 drivers/gpu/drm/radeon/radeon_vm.c     | 10 +++---
 6 files changed, 66 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 57e20780a458..c67b537170e7 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -75,8 +75,8 @@
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_audio_component.h>
 
@@ -457,7 +457,8 @@ struct radeon_mman {
 
 struct radeon_bo_list {
 	struct radeon_bo		*robj;
-	struct ttm_validate_buffer	tv;
+	struct list_head		list;
+	bool				shared;
 	uint64_t			gpu_offset;
 	unsigned			preferred_domains;
 	unsigned			allowed_domains;
@@ -1068,6 +1069,7 @@ struct radeon_cs_parser {
 	struct radeon_bo_list	*vm_bos;
 	struct list_head	validated;
 	unsigned		dma_reloc_idx;
+	struct drm_exec		exec;
 	/* indices of various chunks */
 	struct radeon_cs_chunk  *chunk_ib;
 	struct radeon_cs_chunk  *chunk_relocs;
@@ -1081,7 +1083,6 @@ struct radeon_cs_parser {
 	u32			cs_flags;
 	u32			ring;
 	s32			priority;
-	struct ww_acquire_ctx	ticket;
 };
 
 static inline u32 radeon_get_ib_value(struct radeon_cs_parser *p, int idx)
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 46a27ebf4588..5c681a44cec7 100644
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
@@ -275,6 +271,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 	s32 priority = 0;
 
 	INIT_LIST_HEAD(&p->validated);
+	drm_exec_init(&p->exec, true);
 
 	if (!cs->num_chunks) {
 		return 0;
@@ -396,8 +393,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 static int cmp_size_smaller_first(void *priv, const struct list_head *a,
 				  const struct list_head *b)
 {
-	struct radeon_bo_list *la = list_entry(a, struct radeon_bo_list, tv.head);
-	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, tv.head);
+	struct radeon_bo_list *la = list_entry(a, struct radeon_bo_list, list);
+	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, list);
 
 	/* Sort A before B if A is smaller. */
 	if (la->robj->tbo.base.size > lb->robj->tbo.base.size)
@@ -416,11 +413,13 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
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
@@ -432,15 +431,17 @@ static void radeon_cs_parser_fini(struct radeon_cs_parser *parser, int error, bo
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
@@ -692,7 +693,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	r = radeon_cs_parser_init(&parser, data);
 	if (r) {
 		DRM_ERROR("Failed to initialize parser !\n");
-		radeon_cs_parser_fini(&parser, r, false);
+		radeon_cs_parser_fini(&parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
@@ -706,7 +707,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	}
 
 	if (r) {
-		radeon_cs_parser_fini(&parser, r, false);
+		radeon_cs_parser_fini(&parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
@@ -723,7 +724,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		goto out;
 	}
 out:
-	radeon_cs_parser_fini(&parser, r, true);
+	radeon_cs_parser_fini(&parser, r);
 	up_read(&rdev->exclusive_lock);
 	r = radeon_cs_handle_lockup(rdev, r);
 	return r;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 261fcbae88d7..c67b69b3e4d2 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -625,33 +625,41 @@ int radeon_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
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
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		list_for_each_entry(entry, &list, list) {
+			r = drm_exec_prepare_obj(&exec, &entry->robj->tbo.base,
+						 1);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(r))
+				goto error_cleanup;
+		}
+		drm_exec_continue_on_contention(&exec);
 
-	list_for_each_entry(entry, &list, head) {
-		domain = radeon_mem_type_to_domain(entry->bo->resource->mem_type);
+		r = drm_exec_prepare_obj(&exec, &bo_va->bo->tbo.base, 1);
+		drm_exec_continue_on_contention(&exec);
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
@@ -665,10 +673,8 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
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
index 10c0fbd9d2b4..508a6e9a2dca 100644
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
+	drm_exec_while_not_all_locked(exec) {
+		list_for_each_entry(lobj, head, list) {
+			r = drm_exec_prepare_obj(exec, &lobj->robj->tbo.base,
+						 1);
+			drm_exec_break_on_contention(exec);
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
index 0a6ef49e990a..04c7c17e8287 100644
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

