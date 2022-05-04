Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DC95198A0
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521C510F01C;
	Wed,  4 May 2022 07:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BD010F004;
 Wed,  4 May 2022 07:47:49 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dk23so1277743ejb.8;
 Wed, 04 May 2022 00:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S2QqEHD2Egdz9++2oqHb1SW1FSA1JfKu1HyPL5s0QoQ=;
 b=A0htlhsMVs13KXWU9+GdD6xqHBRHdoeaMQxo0iT+CxKWmfJk8Z/jadrl1Fifd1RsfN
 JZ0hFUJDE+euLQszBE4dADtIWOllDeEyBWolD3TbsCBMz8w+NNJQrArutDvBvvNt554H
 xx6mfFAgNwa+93J7fz8OqaHWGp6w1lPBLsUMgVZq6Bx9iltPVvqJEdDC26BgDVFIdAt8
 +8N0E6nUU6W+bbX5ZPVmFTH5IQNmOSCiuhzcfxDUuBHfpFtPfZqeAzSiDIWt4Xp/iC7x
 uBZGIn1256yt29SOP+wR8xkJ73ABXtZgQNjqvQrxUy6eWwNMe/yUqH+1ZSovIOBTQyPS
 LzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S2QqEHD2Egdz9++2oqHb1SW1FSA1JfKu1HyPL5s0QoQ=;
 b=76TW5xAC1EQG+wdvHy250sKVqXty5mv3+Dv1YmoDyOXJWQSjgN8I+B9B88KjTRVi9H
 +glMu6W0xjQiNgt5KyiR4hLeQjJz8m2Ta7jA4CsngfTmyybO3SqL9GM6f2vUfUPWjIJ+
 azPBCVQeme5qwOu+9F/a9Ilx7S3RPRQ/R1cDQ8BPgcFTyFRZPcMmmcQWqk3Mbg2KwdF3
 /vpz1inYhF6gDyzFpb08DiC5fPUgts9k/PQfeXQspKB7RffQQMHLhsIrNfUVuKQOhsxU
 jEfOqE3vN+i6+MJOcAhewEsP1zELuU1M4HtMioHZMPPxGccW9d8yiqCmHhU/8xuOV8ro
 2FJQ==
X-Gm-Message-State: AOAM533SNbzK2T5Nl9prLspwNgPAE2Se90LlfD9Z8FoYfOB0oQAg4A0e
 yOQv7QDrmsrdUUgH00R2eqx/JixVXCY=
X-Google-Smtp-Source: ABdhPJxf7/30PYK0fFYpqo9nUsAHjaCx+sUkp2u51185GGCxcSfOnrZpXQl/gIwBmTXEww7/z1DKKQ==
X-Received: by 2002:a17:906:b006:b0:6f3:dcf0:6f6f with SMTP id
 v6-20020a170906b00600b006f3dcf06f6fmr20161114ejy.649.1651650467811; 
 Wed, 04 May 2022 00:47:47 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214dc2sm5433686ejc.40.2022.05.04.00.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:47:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 6/8] drm/radeon: switch over to drm_exec
Date: Wed,  4 May 2022 09:47:37 +0200
Message-Id: <20220504074739.2231-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504074739.2231-1-christian.koenig@amd.com>
References: <20220504074739.2231-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
index 08f83bf2c330..841b463a0bea 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -76,8 +76,8 @@
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 
 #include "radeon_family.h"
@@ -458,7 +458,8 @@ struct radeon_mman {
 
 struct radeon_bo_list {
 	struct radeon_bo		*robj;
-	struct ttm_validate_buffer	tv;
+	struct list_head		list;
+	bool				shared;
 	uint64_t			gpu_offset;
 	unsigned			preferred_domains;
 	unsigned			allowed_domains;
@@ -1069,6 +1070,7 @@ struct radeon_cs_parser {
 	struct radeon_bo_list	*vm_bos;
 	struct list_head	validated;
 	unsigned		dma_reloc_idx;
+	struct drm_exec		exec;
 	/* indices of various chunks */
 	struct radeon_cs_chunk  *chunk_ib;
 	struct radeon_cs_chunk  *chunk_relocs;
@@ -1082,7 +1084,6 @@ struct radeon_cs_parser {
 	u32			cs_flags;
 	u32			ring;
 	s32			priority;
-	struct ww_acquire_ctx	ticket;
 };
 
 static inline u32 radeon_get_ib_value(struct radeon_cs_parser *p, int idx)
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 446f7bae54c4..50613a2f0c90 100644
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
 	return (int)la->robj->tbo.resource->num_pages -
@@ -413,11 +410,13 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
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
@@ -429,15 +428,17 @@ static void radeon_cs_parser_fini(struct radeon_cs_parser *parser, int error, bo
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
@@ -689,7 +690,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	r = radeon_cs_parser_init(&parser, data);
 	if (r) {
 		DRM_ERROR("Failed to initialize parser !\n");
-		radeon_cs_parser_fini(&parser, r, false);
+		radeon_cs_parser_fini(&parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
@@ -703,7 +704,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	}
 
 	if (r) {
-		radeon_cs_parser_fini(&parser, r, false);
+		radeon_cs_parser_fini(&parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
@@ -720,7 +721,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		goto out;
 	}
 out:
-	radeon_cs_parser_fini(&parser, r, true);
+	radeon_cs_parser_fini(&parser, r);
 	up_read(&rdev->exclusive_lock);
 	r = radeon_cs_handle_lockup(rdev, r);
 	return r;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 8c01a7f0e027..cd4540e1a306 100644
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
index 6c4a6802ca96..7138d1a588d2 100644
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
+			if (unlikely(r))
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
2.25.1

