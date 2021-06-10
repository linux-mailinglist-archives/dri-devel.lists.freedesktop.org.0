Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EC63A29DF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369B46ED00;
	Thu, 10 Jun 2021 11:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DACB6ECF7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:06:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so3048367wms.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 04:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XNkaxm6qpTRoQWj4Eqh59CtqZ/KzWJWH68PAlxMluo4=;
 b=gLaaJrGM7UPD0MI0dZ8op5evjVuMAc8XpEHztcjE42nhaMZbkqg0HBxnNmECZUv105
 xmDP0n+30htiyMhpoRuitKuRzAWejECqzxqrNg/QN7qMvKucrZAH0OxrtTOy34seivsZ
 hR44H5WLWHF2xTcyByNl1YJeimKvzNXgnURfOnOgRBx1jkZYu5xq0wFU7ZYcdM7VlJi3
 /ADL6p0izcKTAE1dOrCQRmBYbT+tLfv8z29TApPk22tScN4kZmJR8SvazjAVr5ZtdVPp
 o82JdOUOoblzlJPEGx0+p9u5MgFbXjOIi773+wde1xmrtVFZ3a4d65tBk5u8YBLijrQr
 tQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XNkaxm6qpTRoQWj4Eqh59CtqZ/KzWJWH68PAlxMluo4=;
 b=oeZjpaI+l3H/jwJg89D9AF9MD/gd/uEkyY2Gt/DTqfj5Ru4iK1wMUKVLEp9am2Jo4g
 pXc+B7/2tTF+9HHDRBiQ6B8dVy2gQp9A0Noo1Cy5VQz9t5MCy27M+fqUCNScTFKYNicW
 jkr0ApAwVdPyFeq68z96MQPvzXa4UUf3fMTc+odzFAWBXg4n1B5sxxf/CoHCcF0ANldC
 hFiKv4lpxsBGHuRwd8vMcTRE27ohWVbks3u5AGQNRibFGKlgK7g7Bw8usk4tqlHgDiu5
 WbeTxYbLwPvcjPlUaLqqcidK4gp3chvS7JcSTd6zuJtNWOpEUCXGIzjcIOOz/ZBp2KBq
 IU+w==
X-Gm-Message-State: AOAM531VGV0ksn/vjxI2Lo9H0EJKfgf7BgxxQfdAsg8YM601xraLRVrX
 Vfx8PsmePihy/Edp62s4j/M=
X-Google-Smtp-Source: ABdhPJw17/k4fmOequALV3dtcFE4UEuZVjHCdgX2TvNU9w9VTANJlM43+nAsuRfugRfnR99iEV0hVg==
X-Received: by 2002:a05:600c:21d1:: with SMTP id
 x17mr4361298wmj.167.1623323161906; 
 Thu, 10 Jun 2021 04:06:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:14a0:1c64:4cb2:9d16])
 by smtp.gmail.com with ESMTPSA id z12sm3234372wmc.5.2021.06.10.04.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 04:06:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas_os@shipmail.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/ttm: move the LRU into resource handling
Date: Thu, 10 Jun 2021 13:05:58 +0200
Message-Id: <20210610110559.1758-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610110559.1758-1-christian.koenig@amd.com>
References: <20210610110559.1758-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This way we finally fix the problem that new resource are
not immediately evict-able after allocation.

That has caused numerous problems including OOM on GDS handling
and not being able to use TTM as general resource manager.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   8 +-
 drivers/gpu/drm/ttm/ttm_bo.c           | 101 ++-------------------
 drivers/gpu/drm/ttm/ttm_bo_util.c      |   1 -
 drivers/gpu/drm/ttm/ttm_device.c       |   4 +-
 drivers/gpu/drm/ttm/ttm_resource.c     | 119 +++++++++++++++++++++++++
 include/drm/ttm/ttm_bo_api.h           |  16 ----
 include/drm/ttm/ttm_bo_driver.h        |  29 +-----
 include/drm/ttm/ttm_resource.h         |  35 ++++++++
 8 files changed, 168 insertions(+), 145 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index d1a229212e7a..7475bb760ec7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -643,12 +643,12 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 
 	if (vm->bulk_moveable) {
 		spin_lock(&adev->mman.bdev.lru_lock);
-		ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
+		ttm_bulk_move_lru_tail(&vm->lru_bulk_move);
 		spin_unlock(&adev->mman.bdev.lru_lock);
 		return;
 	}
 
-	memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
+	ttm_bulk_move_init(&vm->lru_bulk_move);
 
 	spin_lock(&adev->mman.bdev.lru_lock);
 	list_for_each_entry(bo_base, &vm->idle, vm_status) {
@@ -657,11 +657,9 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 		if (!bo->parent)
 			continue;
 
-		ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
-					&vm->lru_bulk_move);
+		ttm_bo_move_to_lru_tail(&bo->tbo, &vm->lru_bulk_move);
 		if (bo->shadow)
 			ttm_bo_move_to_lru_tail(&bo->shadow->tbo,
-						bo->shadow->tbo.resource,
 						&vm->lru_bulk_move);
 	}
 	spin_unlock(&adev->mman.bdev.lru_lock);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index db53fecca696..e081d48aad76 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -69,95 +69,15 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 	}
 }
 
-static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
-{
-	struct ttm_device *bdev = bo->bdev;
-
-	list_del_init(&bo->lru);
-
-	if (bdev->funcs->del_from_lru_notify)
-		bdev->funcs->del_from_lru_notify(bo);
-}
-
-static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
-				     struct ttm_buffer_object *bo)
-{
-	if (!pos->first)
-		pos->first = bo;
-	pos->last = bo;
-}
-
 void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
-			     struct ttm_resource *mem,
 			     struct ttm_lru_bulk_move *bulk)
 {
-	struct ttm_device *bdev = bo->bdev;
-	struct ttm_resource_manager *man;
-
-	if (!bo->deleted)
-		dma_resv_assert_held(bo->base.resv);
-
-	if (bo->pin_count) {
-		ttm_bo_del_from_lru(bo);
-		return;
-	}
-
-	man = ttm_manager_type(bdev, mem->mem_type);
-	list_move_tail(&bo->lru, &man->lru[bo->priority]);
-
-	if (bdev->funcs->del_from_lru_notify)
-		bdev->funcs->del_from_lru_notify(bo);
-
-	if (bulk && !bo->pin_count) {
-		switch (bo->resource->mem_type) {
-		case TTM_PL_TT:
-			ttm_bo_bulk_move_set_pos(&bulk->tt[bo->priority], bo);
-			break;
+	dma_resv_assert_held(bo->base.resv);
 
-		case TTM_PL_VRAM:
-			ttm_bo_bulk_move_set_pos(&bulk->vram[bo->priority], bo);
-			break;
-		}
-	}
+	ttm_resource_move_to_lru_tail(bo->resource, bulk);
 }
 EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
 
-void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
-{
-	unsigned i;
-
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
-		struct ttm_resource_manager *man;
-
-		if (!pos->first)
-			continue;
-
-		dma_resv_assert_held(pos->first->base.resv);
-		dma_resv_assert_held(pos->last->base.resv);
-
-		man = ttm_manager_type(pos->first->bdev, TTM_PL_TT);
-		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
-				    &pos->last->lru);
-	}
-
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
-		struct ttm_resource_manager *man;
-
-		if (!pos->first)
-			continue;
-
-		dma_resv_assert_held(pos->first->base.resv);
-		dma_resv_assert_held(pos->last->base.resv);
-
-		man = ttm_manager_type(pos->first->bdev, TTM_PL_VRAM);
-		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
-				    &pos->last->lru);
-	}
-}
-EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
-
 static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 				  struct ttm_resource *mem, bool evict,
 				  struct ttm_operation_ctx *ctx,
@@ -339,7 +259,6 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	ttm_bo_del_from_lru(bo);
 	list_del_init(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 	ttm_bo_cleanup_memtype_use(bo);
@@ -440,7 +359,7 @@ static void ttm_bo_release(struct kref *kref)
 		 */
 		if (bo->pin_count) {
 			bo->pin_count = 0;
-			ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
+			ttm_resource_move_to_lru_tail(bo->resource, NULL);
 		}
 
 		kref_init(&bo->kref);
@@ -453,7 +372,6 @@ static void ttm_bo_release(struct kref *kref)
 	}
 
 	spin_lock(&bo->bdev->lru_lock);
-	ttm_bo_del_from_lru(bo);
 	list_del(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 
@@ -637,15 +555,17 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ww_acquire_ctx *ticket)
 {
 	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
+	struct ttm_resource *res;
 	bool locked = false;
 	unsigned i;
 	int ret;
 
 	spin_lock(&bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		list_for_each_entry(bo, &man->lru[i], lru) {
+		list_for_each_entry(res, &man->lru[i], lru) {
 			bool busy;
 
+			bo = res->bo;
 			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
 							    &locked, &busy)) {
 				if (busy && !busy_bo && ticket !=
@@ -663,7 +583,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		}
 
 		/* If the inner loop terminated early, we have our candidate */
-		if (&bo->lru != &man->lru[i])
+		if (&res->lru != &man->lru[i])
 			break;
 
 		bo = NULL;
@@ -837,9 +757,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	}
 
 error:
-	if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_mem_space);
@@ -1001,7 +918,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	bo->destroy = destroy ? destroy : ttm_bo_default_destroy;
 
 	kref_init(&bo->kref);
-	INIT_LIST_HEAD(&bo->lru);
 	INIT_LIST_HEAD(&bo->ddestroy);
 	bo->bdev = bdev;
 	bo->type = type;
@@ -1051,8 +967,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 		return ret;
 	}
 
-	ttm_bo_move_to_lru_tail_unlocked(bo);
-
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_init_reserved);
@@ -1151,7 +1065,6 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		return 0;
 	}
 
-	ttm_bo_del_from_lru(bo);
 	/* TODO: Cleanup the locking */
 	spin_unlock(&bo->bdev->lru_lock);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 2f57f824e6db..d10acd9f3a5b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -229,7 +229,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 
 	atomic_inc(&ttm_glob.bo_count);
 	INIT_LIST_HEAD(&fbo->base.ddestroy);
-	INIT_LIST_HEAD(&fbo->base.lru);
 	fbo->base.moving = NULL;
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 460953dcad11..a6e533c3ac56 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -132,6 +132,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 {
 	struct ttm_resource_manager *man;
 	struct ttm_buffer_object *bo;
+	struct ttm_resource *res;
 	unsigned i, j;
 	int ret;
 
@@ -142,9 +143,10 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 			continue;
 
 		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
-			list_for_each_entry(bo, &man->lru[j], lru) {
+			list_for_each_entry(res, &man->lru[j], lru) {
 				uint32_t num_pages;
 
+				bo = res->bo;
 				if (!bo->ttm ||
 				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
 				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 5df1c63373cf..bc2b71922235 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -29,6 +29,115 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
+/**
+ * ttm_bulk_move_init - initialize a bulk move structure
+ * @bulk: the structure to init
+ *
+ * For now just memset the structure to zero.
+ */
+void ttm_bulk_move_init(struct ttm_lru_bulk_move *bulk)
+{
+	memset(bulk, 0, sizeof(*bulk));
+}
+EXPORT_SYMBOL(ttm_bulk_move_init);
+
+/**
+ * ttm_bo_bulk_move_lru_tail
+ *
+ * @bulk: bulk move structure
+ *
+ * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
+ * resource order never changes. Should be called with ttm_device::lru_lock held.
+ */
+void ttm_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
+{
+	unsigned i;
+
+	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
+		struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
+		struct ttm_resource_manager *man;
+
+		if (!pos->first)
+			continue;
+
+		dma_resv_assert_held(pos->first->bo->base.resv);
+		dma_resv_assert_held(pos->last->bo->base.resv);
+
+		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_TT);
+		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
+				    &pos->last->lru);
+	}
+
+	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
+		struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
+		struct ttm_resource_manager *man;
+
+		if (!pos->first)
+			continue;
+
+		dma_resv_assert_held(pos->first->bo->base.resv);
+		dma_resv_assert_held(pos->last->bo->base.resv);
+
+		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_VRAM);
+		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
+				    &pos->last->lru);
+	}
+}
+EXPORT_SYMBOL(ttm_bulk_move_lru_tail);
+
+/* Record a resource position in a bulk move structure */
+static void ttm_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
+				  struct ttm_resource *res)
+{
+	if (!pos->first)
+		pos->first = res;
+	pos->last = res;
+}
+
+/* Remove a resource from the LRU */
+static void ttm_resource_del_from_lru(struct ttm_resource *res)
+{
+	struct ttm_device *bdev = res->bo->bdev;
+
+	list_del_init(&res->lru);
+
+	if (bdev->funcs->del_from_lru_notify)
+		bdev->funcs->del_from_lru_notify(res->bo);
+}
+
+/* Move a resource to the LRU tail and track the bulk position */
+void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
+				   struct ttm_lru_bulk_move *bulk)
+{
+	struct ttm_buffer_object *bo = res->bo;
+	struct ttm_device *bdev = bo->bdev;
+	struct ttm_resource_manager *man;
+
+	if (bo->pin_count) {
+		ttm_resource_del_from_lru(res);
+		return;
+	}
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	list_move_tail(&res->lru, &man->lru[bo->priority]);
+
+	if (bdev->funcs->del_from_lru_notify)
+		bdev->funcs->del_from_lru_notify(bo);
+
+	if (!bulk)
+		return;
+
+	switch (res->mem_type) {
+	case TTM_PL_TT:
+		ttm_bulk_move_set_pos(&bulk->tt[bo->priority], res);
+		break;
+
+	case TTM_PL_VRAM:
+		ttm_bulk_move_set_pos(&bulk->vram[bo->priority], res);
+		break;
+	}
+}
+
 void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res)
@@ -42,11 +151,21 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
 	res->bo = bo;
+	INIT_LIST_HEAD(&res->lru);
+
+	spin_lock(&bo->bdev->lru_lock);
+	ttm_resource_move_to_lru_tail(res, NULL);
+	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
 void ttm_resource_fini(struct ttm_resource *res)
 {
+	struct ttm_device *bdev = res->bo->bdev;
+
+	spin_lock(&bdev->lru_lock);
+	ttm_resource_del_from_lru(res);
+	spin_unlock(&bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_fini);
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index f681bbdbc698..0928d8cfb45a 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -56,8 +56,6 @@ struct ttm_placement;
 
 struct ttm_place;
 
-struct ttm_lru_bulk_move;
-
 /**
  * enum ttm_bo_type
  *
@@ -95,7 +93,6 @@ struct ttm_tt;
  * @ttm: TTM structure holding system pages.
  * @evicted: Whether the object was evicted without user-space knowing.
  * @deleted: True if the object is only a zombie and already deleted.
- * @lru: List head for the lru list.
  * @ddestroy: List head for the delayed destroy list.
  * @swap: List head for swap LRU list.
  * @moving: Fence set when BO is moving
@@ -144,7 +141,6 @@ struct ttm_buffer_object {
 	 * Members protected by the bdev::lru_lock.
 	 */
 
-	struct list_head lru;
 	struct list_head ddestroy;
 
 	/**
@@ -308,7 +304,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
  * ttm_bo_move_to_lru_tail
  *
  * @bo: The buffer object.
- * @mem: Resource object.
  * @bulk: optional bulk move structure to remember BO positions
  *
  * Move this BO to the tail of all lru lists used to lookup and reserve an
@@ -316,19 +311,8 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
  * held, and is used to make a BO less likely to be considered for eviction.
  */
 void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
-			     struct ttm_resource *mem,
 			     struct ttm_lru_bulk_move *bulk);
 
-/**
- * ttm_bo_bulk_move_lru_tail
- *
- * @bulk: bulk move structure
- *
- * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
- * BO order never changes. Should be called with ttm_global::lru_lock held.
- */
-void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
-
 /**
  * ttm_bo_lock_delayed_workqueue
  *
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 68d6069572aa..fba2f7d3d34e 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -45,33 +45,6 @@
 #include "ttm_tt.h"
 #include "ttm_pool.h"
 
-/**
- * struct ttm_lru_bulk_move_pos
- *
- * @first: first BO in the bulk move range
- * @last: last BO in the bulk move range
- *
- * Positions for a lru bulk move.
- */
-struct ttm_lru_bulk_move_pos {
-	struct ttm_buffer_object *first;
-	struct ttm_buffer_object *last;
-};
-
-/**
- * struct ttm_lru_bulk_move
- *
- * @tt: first/last lru entry for BOs in the TT domain
- * @vram: first/last lru entry for BOs in the VRAM domain
- * @swap: first/last lru entry for BOs on the swap list
- *
- * Helper structure for bulk moves on the LRU list.
- */
-struct ttm_lru_bulk_move {
-	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
-	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
-};
-
 /*
  * ttm_bo.c
  */
@@ -182,7 +155,7 @@ static inline void
 ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
 {
 	spin_lock(&bo->bdev->lru_lock);
-	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
+	ttm_bo_move_to_lru_tail(bo, NULL);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 7fc42db688b8..56583b2392ed 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -26,9 +26,11 @@
 #define _TTM_RESOURCE_H_
 
 #include <linux/types.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/dma-buf-map.h>
 #include <linux/dma-fence.h>
+
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
@@ -172,6 +174,33 @@ struct ttm_resource {
 	uint32_t placement;
 	struct ttm_bus_placement bus;
 	struct ttm_buffer_object *bo;
+	struct list_head lru;
+};
+
+/**
+ * struct ttm_lru_bulk_move_pos
+ *
+ * @first: first res in the bulk move range
+ * @last: last res in the bulk move range
+ *
+ * Positions for a lru bulk move.
+ */
+struct ttm_lru_bulk_move_pos {
+	struct ttm_resource *first;
+	struct ttm_resource *last;
+};
+
+/**
+ * struct ttm_lru_bulk_move
+ *
+ * @tt: first/last lru entry for resources in the TT domain
+ * @vram: first/last lru entry for resources in the VRAM domain
+ *
+ * Helper structure for bulk moves on the LRU list.
+ */
+struct ttm_lru_bulk_move {
+	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
+	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
 };
 
 /**
@@ -260,6 +289,12 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 	man->move = NULL;
 }
 
+void ttm_bulk_move_init(struct ttm_lru_bulk_move *bulk);
+void ttm_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
+
+void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
+				   struct ttm_lru_bulk_move *bulk);
+
 void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res);
-- 
2.25.1

