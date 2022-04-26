Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E843850FECD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 15:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60EC10F330;
	Tue, 26 Apr 2022 13:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE2310F33A;
 Tue, 26 Apr 2022 13:22:23 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id j6so2196879ejc.13;
 Tue, 26 Apr 2022 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oMnEBFkcdULE+q/7BiOK0sG48A7P15PmH4FydP/yeEo=;
 b=GOSdDM4wPq9h25zWshCFf5AhPqC+MTVe3ZPgUQJMu6Ku5V3sMU60ncZ/KveyLVkVck
 HXn5/w6Y6RanqUQBe/md5k79gocGtsF7IMHiadaJg7D/xs4wjpYdF0CauCFX27Zc8Jb+
 ArQtNaloLBeQfJEt42bYGNedSF/mBjmy2nHTHdPNhHFgkEFYyyhweuAhptT6qupDrWHA
 Jy7bd7GGoKwK9FjkMBtRYBj6aTKZtJb/9m5dQ8rRIfbIMvUdUQYtDHlX1PW66QDsaYMU
 OhUqYuR5BKz88QvUXdB1Z2ixIyC9wSMsKmhbg4kSLSVMoEmv4gWILoy62GGeME++GZ+P
 ED+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oMnEBFkcdULE+q/7BiOK0sG48A7P15PmH4FydP/yeEo=;
 b=vLlKfSPammfPNQWEbHEbb5LX7eWudao79U82C/UxLZ/0ndFez7SL8FTVFyUJQurvHe
 X5n7D+Se/qt2K94RDPzhmmm22xyvrdNa4iTOutRKCw8jYQrpSnJrS3VcdXlmVin7pUFn
 wshwLd7f6WwNKWXq5KLUW+N/knJlJOBvbxEd5G4SCGorwZJ64fsgpu2pnBwUZ5tH3CsQ
 wyf9Fjguf2bjx+VGmISYk+qDtkj8xUBqZbcmXdKjg8TGBHu5QMyYXePMoUmpR8W4Whb+
 l1Vax61HT8IlMh4SaVOSRDibzmEbim/cuPLBA7sslrDcsYYS8G+JnQjNE+9h7I6N1Um7
 h5ew==
X-Gm-Message-State: AOAM530qubewxydcjqAyWA8AsDMSKJonh0XTJR/BAFqimzbU8JM1K9tK
 p2dS/jaONG/s1gQg9XIwHx0ovgh8l9A=
X-Google-Smtp-Source: ABdhPJzQNEXbhBRa7e8iNa7QtQC6fjs/GFZQ5Cz2eTFloztm1KCDhmA1jOvaEvSwNbbvugmg2tXz2g==
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id
 s5-20020a17090699c500b006df82154ccdmr21698715ejn.684.1650979341940; 
 Tue, 26 Apr 2022 06:22:21 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a1709060ee100b006e8a49f215dsm4889914eji.73.2022.04.26.06.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:22:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/amdgpu: use the new drm_exec object for CS
Date: Tue, 26 Apr 2022 15:22:08 +0200
Message-Id: <20220426132208.20801-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426132208.20801-1-christian.koenig@amd.com>
References: <20220426132208.20801-1-christian.koenig@amd.com>
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

Use the new component here as well and remove the old handling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c |  70 ++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 236 ++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h      |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  22 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |   3 -
 7 files changed, 126 insertions(+), 221 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index cdf0818088b3..08aae66557dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -55,7 +55,6 @@
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_gem.h>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 714178f1b6c6..cdd0f9995496 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -28,6 +28,7 @@
  *    Christian König <deathsimple@vodafone.de>
  */
 
+#include <linux/sort.h>
 #include <linux/uaccess.h>
 
 #include "amdgpu.h"
@@ -50,13 +51,20 @@ static void amdgpu_bo_list_free(struct kref *ref)
 						   refcount);
 	struct amdgpu_bo_list_entry *e;
 
-	amdgpu_bo_list_for_each_entry(e, list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+	amdgpu_bo_list_for_each_entry(e, list)
+		amdgpu_bo_unref(&e->bo);
+	call_rcu(&list->rhead, amdgpu_bo_list_free_rcu);
+}
 
-		amdgpu_bo_unref(&bo);
-	}
+static int amdgpu_bo_list_entry_cmp(const void *_a, const void *_b)
+{
+	const struct amdgpu_bo_list_entry *a = _a, *b = _b;
 
-	call_rcu(&list->rhead, amdgpu_bo_list_free_rcu);
+	if (a->priority > b->priority)
+		return 1;
+	if (a->priority < b->priority)
+		return -1;
+	return 0;
 }
 
 int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
@@ -118,7 +126,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 
 		entry->priority = min(info[i].bo_priority,
 				      AMDGPU_BO_LIST_MAX_PRIORITY);
-		entry->tv.bo = &bo->tbo;
+		entry->bo = bo;
 
 		if (bo->preferred_domains == AMDGPU_GEM_DOMAIN_GDS)
 			list->gds_obj = bo;
@@ -133,6 +141,8 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 
 	list->first_userptr = first_userptr;
 	list->num_entries = num_entries;
+	sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
+	     amdgpu_bo_list_entry_cmp, NULL);
 
 	trace_amdgpu_cs_bo_status(list->num_entries, total_size);
 
@@ -140,16 +150,10 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 	return 0;
 
 error_free:
-	for (i = 0; i < last_entry; ++i) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(array[i].tv.bo);
-
-		amdgpu_bo_unref(&bo);
-	}
-	for (i = first_userptr; i < num_entries; ++i) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(array[i].tv.bo);
-
-		amdgpu_bo_unref(&bo);
-	}
+	for (i = 0; i < last_entry; ++i)
+		amdgpu_bo_unref(&array[i].bo);
+	for (i = first_userptr; i < num_entries; ++i)
+		amdgpu_bo_unref(&array[i].bo);
 	kvfree(list);
 	return r;
 
@@ -181,40 +185,6 @@ int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,
 	return -ENOENT;
 }
 
-void amdgpu_bo_list_get_list(struct amdgpu_bo_list *list,
-			     struct list_head *validated)
-{
-	/* This is based on the bucket sort with O(n) time complexity.
-	 * An item with priority "i" is added to bucket[i]. The lists are then
-	 * concatenated in descending order.
-	 */
-	struct list_head bucket[AMDGPU_BO_LIST_NUM_BUCKETS];
-	struct amdgpu_bo_list_entry *e;
-	unsigned i;
-
-	for (i = 0; i < AMDGPU_BO_LIST_NUM_BUCKETS; i++)
-		INIT_LIST_HEAD(&bucket[i]);
-
-	/* Since buffers which appear sooner in the relocation list are
-	 * likely to be used more often than buffers which appear later
-	 * in the list, the sort mustn't change the ordering of buffers
-	 * with the same priority, i.e. it must be stable.
-	 */
-	amdgpu_bo_list_for_each_entry(e, list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-		unsigned priority = e->priority;
-
-		if (!bo->parent)
-			list_add_tail(&e->tv.head, &bucket[priority]);
-
-		e->user_pages = NULL;
-	}
-
-	/* Connect the sorted buckets in the output list. */
-	for (i = 0; i < AMDGPU_BO_LIST_NUM_BUCKETS; i++)
-		list_splice(&bucket[i], validated);
-}
-
 void amdgpu_bo_list_put(struct amdgpu_bo_list *list)
 {
 	kref_put(&list->refcount, amdgpu_bo_list_free);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index 529d52a204cf..248d9dc6c1fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -23,16 +23,17 @@
 #ifndef __AMDGPU_BO_LIST_H__
 #define __AMDGPU_BO_LIST_H__
 
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/amdgpu_drm.h>
 
+struct drm_file;
+
 struct amdgpu_device;
 struct amdgpu_bo;
 struct amdgpu_bo_va;
 struct amdgpu_fpriv;
 
 struct amdgpu_bo_list_entry {
-	struct ttm_validate_buffer	tv;
+	struct amdgpu_bo		*bo;
 	struct amdgpu_bo_va		*bo_va;
 	uint32_t			priority;
 	struct page			**user_pages;
@@ -51,8 +52,6 @@ struct amdgpu_bo_list {
 
 int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,
 		       struct amdgpu_bo_list **result);
-void amdgpu_bo_list_get_list(struct amdgpu_bo_list *list,
-			     struct list_head *validated);
 void amdgpu_bo_list_put(struct amdgpu_bo_list *list);
 int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 				      struct drm_amdgpu_bo_list_entry **info_param);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 8de283997769..a28b7947a034 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -44,7 +44,6 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
 				      uint32_t *offset)
 {
 	struct drm_gem_object *gobj;
-	struct amdgpu_bo *bo;
 	unsigned long size;
 	int r;
 
@@ -52,21 +51,16 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
 	if (gobj == NULL)
 		return -EINVAL;
 
-	bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
-	p->uf_entry.priority = 0;
-	p->uf_entry.tv.bo = &bo->tbo;
-	/* One for TTM and two for the CS job */
-	p->uf_entry.tv.num_shared = 3;
-
+	p->uf_bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
 	drm_gem_object_put(gobj);
 
-	size = amdgpu_bo_size(bo);
+	size = amdgpu_bo_size(p->uf_bo);
 	if (size != PAGE_SIZE || (data->offset + 8) > size) {
 		r = -EINVAL;
 		goto error_unref;
 	}
 
-	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) {
+	if (amdgpu_ttm_tt_get_usermm(p->uf_bo->tbo.ttm)) {
 		r = -EINVAL;
 		goto error_unref;
 	}
@@ -76,7 +70,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
 	return 0;
 
 error_unref:
-	amdgpu_bo_unref(&bo);
+	amdgpu_bo_unref(&p->uf_bo);
 	return r;
 }
 
@@ -115,6 +109,8 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
 	int i;
 	int ret;
 
+	drm_exec_init(&p->exec, true);
+
 	if (cs->in.num_chunks == 0)
 		return 0;
 
@@ -235,7 +231,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
 		goto free_all_kdata;
 	}
 
-	if (p->uf_entry.tv.bo)
+	if (p->uf_bo)
 		p->job->uf_addr = uf_offset;
 	kvfree(chunk_array);
 
@@ -449,57 +445,20 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 	return r;
 }
 
-static int amdgpu_cs_list_validate(struct amdgpu_cs_parser *p,
-			    struct list_head *validated)
-{
-	struct ttm_operation_ctx ctx = { true, false };
-	struct amdgpu_bo_list_entry *lobj;
-	int r;
-
-	list_for_each_entry(lobj, validated, tv.head) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(lobj->tv.bo);
-		struct mm_struct *usermm;
-
-		usermm = amdgpu_ttm_tt_get_usermm(bo->tbo.ttm);
-		if (usermm && usermm != current->mm)
-			return -EPERM;
-
-		if (amdgpu_ttm_tt_is_userptr(bo->tbo.ttm) &&
-		    lobj->user_invalidated && lobj->user_pages) {
-			amdgpu_bo_placement_from_domain(bo,
-							AMDGPU_GEM_DOMAIN_CPU);
-			r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-			if (r)
-				return r;
-
-			amdgpu_ttm_tt_set_user_pages(bo->tbo.ttm,
-						     lobj->user_pages);
-		}
-
-		r = amdgpu_cs_bo_validate(p, bo);
-		if (r)
-			return r;
-
-		kvfree(lobj->user_pages);
-		lobj->user_pages = NULL;
-	}
-	return 0;
-}
-
 static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 				union drm_amdgpu_cs *cs)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct ttm_operation_ctx ctx = { true, false };
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
-	struct list_head duplicates;
+	struct drm_gem_object *obj;
 	struct amdgpu_bo *gds;
 	struct amdgpu_bo *gws;
 	struct amdgpu_bo *oa;
+	unsigned long index;
 	int r;
 
-	INIT_LIST_HEAD(&p->validated);
-
 	/* p->bo_list could already be assigned if AMDGPU_CHUNK_ID_BO_HANDLES is present */
 	if (cs->in.bo_list_handle) {
 		if (p->bo_list)
@@ -517,25 +476,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			return r;
 	}
 
-	/* One for TTM and one for the CS job */
-	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.num_shared = 2;
-
-	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
-
-	INIT_LIST_HEAD(&duplicates);
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd);
-
-	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
-		list_add(&p->uf_entry.tv.head, &p->validated);
-
 	/* Get userptr backing pages. If pages are updated after registered
 	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
 	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
 	 */
 	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
 		bool userpage_invalidated = false;
+		struct amdgpu_bo *bo = e->bo;
 		int i;
 
 		e->user_pages = kvmalloc_array(bo->tbo.ttm->num_pages,
@@ -562,18 +509,53 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		e->user_invalidated = userpage_invalidated;
 	}
 
-	r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
-				   &duplicates);
-	if (unlikely(r != 0)) {
-		if (r != -ERESTARTSYS)
-			DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
-		goto out;
+	drm_exec_while_not_all_locked(&p->exec) {
+		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec);
+		drm_exec_continue_on_contention(&p->exec);
+		if (unlikely(r))
+			return r;
+
+		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base, 2);
+			drm_exec_break_on_contention(&p->exec);
+			if (unlikely(r))
+				return r;
+
+			e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
+		}
+		drm_exec_continue_on_contention(&p->exec);
+
+		if (p->uf_bo) {
+			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
+						 2);
+			drm_exec_continue_on_contention(&p->exec);
+			if (unlikely(r))
+				return r;
+		}
 	}
 
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
+		struct mm_struct *usermm;
+
+		usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
+		if (usermm && usermm != current->mm)
+			return -EPERM;
+
+		if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
+		    e->user_invalidated && e->user_pages) {
+			amdgpu_bo_placement_from_domain(e->bo,
+							AMDGPU_GEM_DOMAIN_CPU);
+			r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
+					    &ctx);
+			if (r)
+				return r;
+
+			amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
+						     e->user_pages);
+		}
 
-		e->bo_va = amdgpu_vm_bo_find(vm, bo);
+		kvfree(e->user_pages);
+		e->user_pages = NULL;
 	}
 
 	/* Move fence waiting after getting reservation lock of
@@ -583,7 +565,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	if (unlikely(r != 0)) {
 		if (r != -ERESTARTSYS)
 			DRM_ERROR("amdgpu_ctx_wait_prev_fence failed.\n");
-		goto error_validate;
+		return r;
 	}
 
 	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
@@ -595,16 +577,20 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 				      amdgpu_cs_bo_validate, p);
 	if (r) {
 		DRM_ERROR("amdgpu_vm_validate_pt_bos() failed.\n");
-		goto error_validate;
+		return r;
 	}
 
-	r = amdgpu_cs_list_validate(p, &duplicates);
-	if (r)
-		goto error_validate;
+	drm_exec_for_each_duplicate_object(&p->exec, index, obj) {
+		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
+		if (unlikely(r))
+			return r;
+	}
 
-	r = amdgpu_cs_list_validate(p, &p->validated);
-	if (r)
-		goto error_validate;
+	drm_exec_for_each_locked_object(&p->exec, index, obj) {
+		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
+		if (unlikely(r))
+			return r;
+	}
 
 	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
 				     p->bytes_moved_vis);
@@ -626,28 +612,25 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		p->job->oa_size = amdgpu_bo_size(oa) >> PAGE_SHIFT;
 	}
 
-	if (!r && p->uf_entry.tv.bo) {
-		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(p->uf_entry.tv.bo);
+	if (p->uf_bo) {
+		r = amdgpu_ttm_alloc_gart(&p->uf_bo->tbo);
+		if (unlikely(r))
+			return r;
 
-		r = amdgpu_ttm_alloc_gart(&uf->tbo);
-		p->job->uf_addr += amdgpu_bo_gpu_offset(uf);
+		p->job->uf_addr += amdgpu_bo_gpu_offset(p->uf_bo);
 	}
-
-error_validate:
-	if (r)
-		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
-out:
-	return r;
+	return 0;
 }
 
 static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct amdgpu_bo_list_entry *e;
+	struct drm_gem_object *obj;
+	unsigned long index;
 	int r;
 
-	list_for_each_entry(e, &p->validated, tv.head) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+	drm_exec_for_each_locked_object(&p->exec, index, obj) {
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 		struct dma_resv *resv = bo->tbo.base.resv;
 		enum amdgpu_sync_mode sync_mode;
 
@@ -664,20 +647,14 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 /**
  * amdgpu_cs_parser_fini() - clean parser states
  * @parser:	parser structure holding parsing context.
- * @error:	error number
- * @backoff:	indicator to backoff the reservation
  *
- * If error is set then unvalidate buffer, otherwise just free memory
- * used by parsing context.
+ * Just free memory used by parsing context.
  **/
-static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
-				  bool backoff)
+static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser)
 {
 	unsigned i;
 
-	if (error && backoff)
-		ttm_eu_backoff_reservation(&parser->ticket,
-					   &parser->validated);
+	drm_exec_fini(&parser->exec);
 
 	for (i = 0; i < parser->num_post_deps; i++) {
 		drm_syncobj_put(parser->post_deps[i].syncobj);
@@ -698,11 +675,7 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
 	kvfree(parser->chunks);
 	if (parser->job)
 		amdgpu_job_free(parser->job);
-	if (parser->uf_entry.tv.bo) {
-		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(parser->uf_entry.tv.bo);
-
-		amdgpu_bo_unref(&uf);
-	}
+	amdgpu_bo_unref(&parser->uf_bo);
 }
 
 static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
@@ -806,11 +779,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	}
 
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		/* ignore duplicates */
-		bo = ttm_to_amdgpu_bo(e->tv.bo);
-		if (!bo)
-			continue;
-
+		bo = e->bo;
 		bo_va = e->bo_va;
 		if (bo_va == NULL)
 			continue;
@@ -840,15 +809,8 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 
 	if (amdgpu_vm_debug) {
 		/* Invalidate all BOs to test for userspace bugs */
-		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-
-			/* ignore duplicates */
-			if (!bo)
-				continue;
-
-			amdgpu_vm_bo_invalidate(adev, bo, false);
-		}
+		amdgpu_bo_list_for_each_entry(e, p->bo_list)
+			amdgpu_vm_bo_invalidate(adev, e->bo, false);
 	}
 
 	return amdgpu_cs_sync_rings(p);
@@ -1197,7 +1159,9 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct drm_sched_entity *entity = p->entity;
 	struct amdgpu_bo_list_entry *e;
+	struct drm_gem_object *gobj;
 	struct amdgpu_job *job;
+	unsigned long index;
 	uint64_t seq;
 	int r;
 
@@ -1219,11 +1183,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	/* If userptr are invalidated after amdgpu_cs_parser_bos(), return
 	 * -EAGAIN, drmIoctl in libdrm will restart the amdgpu_cs_ioctl.
 	 */
-	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-
-		r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
-	}
+	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list)
+		r |= !amdgpu_ttm_tt_get_user_pages_done(e->bo->tbo.ttm);
 	if (r) {
 		r = -EAGAIN;
 		goto error_abort;
@@ -1246,16 +1207,20 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_job_free_resources(job);
 
 	trace_amdgpu_cs_ioctl(job);
-	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
+	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->exec.ticket);
 	drm_sched_entity_push_job(&job->base);
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
-	/* Make sure all BOs are remembered as writers */
-	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.num_shared = 0;
+	drm_exec_for_each_duplicate_object(&p->exec, index, gobj) {
+		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
+		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
+	}
+	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
+		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
+		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
+	}
 
-	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 	mutex_unlock(&p->adev->notifier_lock);
 
 	return 0;
@@ -1285,7 +1250,6 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	union drm_amdgpu_cs *cs = data;
 	struct amdgpu_cs_parser parser = {};
-	bool reserved_buffers = false;
 	int r;
 
 	if (amdgpu_ras_intr_triggered())
@@ -1323,8 +1287,6 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		goto out;
 	}
 
-	reserved_buffers = true;
-
 	trace_amdgpu_cs_ibs(&parser);
 
 	r = amdgpu_cs_vm_handling(&parser);
@@ -1333,7 +1295,7 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 
 	r = amdgpu_cs_submit(&parser, cs);
 out:
-	amdgpu_cs_parser_fini(&parser, r, reserved_buffers);
+	amdgpu_cs_parser_fini(&parser);
 
 	return r;
 }
@@ -1665,7 +1627,7 @@ int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
 	*map = mapping;
 
 	/* Double check that the BO is reserved by this CS */
-	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->ticket)
+	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->exec.ticket)
 		return -EINVAL;
 
 	if (!((*bo)->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
index 30ecc4917f81..f447a9c533b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
@@ -23,6 +23,8 @@
 #ifndef __AMDGPU_CS_H__
 #define __AMDGPU_CS_H__
 
+#include <drm/drm_exec.h>
+
 #include "amdgpu_job.h"
 #include "amdgpu_bo_list.h"
 #include "amdgpu_ring.h"
@@ -55,11 +57,9 @@ struct amdgpu_cs_parser {
 	struct drm_sched_entity	*entity;
 
 	/* buffer objects */
-	struct ww_acquire_ctx		ticket;
+	struct drm_exec			exec;
 	struct amdgpu_bo_list		*bo_list;
 	struct amdgpu_mn		*mn;
-	struct amdgpu_bo_list_entry	vm_pd;
-	struct list_head		validated;
 	struct dma_fence		*fence;
 	uint64_t			bytes_moved_threshold;
 	uint64_t			bytes_moved_vis_threshold;
@@ -67,7 +67,7 @@ struct amdgpu_cs_parser {
 	uint64_t			bytes_moved_vis;
 
 	/* user fence */
-	struct amdgpu_bo_list_entry	uf_entry;
+	struct amdgpu_bo		*uf_bo;
 
 	unsigned			num_post_deps;
 	struct amdgpu_cs_post_dep	*post_deps;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index c82c580f1df5..7e5cc8323329 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -618,28 +618,6 @@ static void amdgpu_vm_pt_next_dfs(struct amdgpu_device *adev,
 	     amdgpu_vm_pt_continue_dfs((start), (entry));			\
 	     (entry) = (cursor).entry, amdgpu_vm_pt_next_dfs((adev), &(cursor)))
 
-/**
- * amdgpu_vm_get_pd_bo - add the VM PD to a validation list
- *
- * @vm: vm providing the BOs
- * @validated: head of validation list
- * @entry: entry to add
- *
- * Add the page directory to the list of BOs to
- * validate for command submission.
- */
-void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
-			 struct list_head *validated,
-			 struct amdgpu_bo_list_entry *entry)
-{
-	entry->priority = 0;
-	entry->tv.bo = &vm->root.bo->tbo;
-	/* Two for VM updates, one for TTM and one for the CS job */
-	entry->tv.num_shared = 4;
-	entry->user_pages = NULL;
-	list_add(&entry->tv.head, validated);
-}
-
 /**
  * amdgpu_vm_lock_pd - lock PD in drm_exec
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 15d26f442e70..75c8f10b5a39 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -382,9 +382,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
-void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
-			 struct list_head *validated,
-			 struct amdgpu_bo_list_entry *entry);
 int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec);
 bool amdgpu_vm_ready(struct amdgpu_vm *vm);
 int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-- 
2.25.1

