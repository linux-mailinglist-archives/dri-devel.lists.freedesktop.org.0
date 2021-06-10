Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9713A281F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC7A6EC9A;
	Thu, 10 Jun 2021 09:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3D26EC93;
 Thu, 10 Jun 2021 09:18:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so5943828wmq.5; 
 Thu, 10 Jun 2021 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HYG/Pd3+8jYUJEQI4+1pC4wnbrb3VmqLasRQxc0dxjM=;
 b=u7AHgaXEabzHVZFPfrVorFnYYGt9ad7x/O43kJdNPHXxsuULs48kQlCatjXOIWHjBS
 RMKwlmc1W63Jk0X6hGwgkF7/berNj/PHJCgC+KaCSiJ0RntzbvbcjXY+6vvaPDE0yQpl
 jpLnq2eHalT2R2Ot8htn4s9MKhCkArURCdbrV4qg0WsdBFWSPdEi18GYq2fIsWfeBhYx
 8g8ehtAxkY8ogO93UVndDYoj/+Uis2yqYOuE50e1hDG4N/1a6kMSiy8K9OdVBFvmqTmQ
 Y8g+RUhEMTNtfsqEegaf9QpyefZ3d66a4mWv+Z97HUdX1ciB6bPoB9z0Jof511aD6+Mo
 pkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYG/Pd3+8jYUJEQI4+1pC4wnbrb3VmqLasRQxc0dxjM=;
 b=IRh0QdncBZ5+dYzGvzADb6QTBBCCzwbMZItv4onH5g0fVxZ0tdLYlSk0U5zXPKefaV
 3djgs0yIMqOfznljvAKGWQXFizuhgMbkyb2VUEmgi/QQC9jX1T1oYx9czCko1E+/4dTF
 h8rBrXrkZ3+9NjCzECceQiS0eH4QVu8BRczIlYCSxCAt2iboXXSNI4p2njKU4zhPn7Sq
 lXEBFNzjtnLzmh/3IoxZVDqiTPwJ80Br+kqXCsJGI9n4j59DWOMFjKmoHIzNPBvKA2fD
 rIvA/9stughfm/FPhiXJdLdQzZdo7e6TyJE+D1ZXgOpsL8CcnzUVnD5FJ21GhBcQaCFC
 br0g==
X-Gm-Message-State: AOAM533lxAD9h1bMpzytOJjE6yQY1cVRz0YrUbk0yiLkk0bnacvWhK5e
 9NIeJeNbdURWMv2MC3GWzoY=
X-Google-Smtp-Source: ABdhPJzfPKCjaXBXFGNgt55iZuvja5GHEdwfoWbs3TuIv1xnzZw9GKIC0ucL4dkXi381KcwxR9BVwA==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr14529940wme.129.1623316686726; 
 Thu, 10 Jun 2021 02:18:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:561f:e43a:edf5:8f95])
 by smtp.gmail.com with ESMTPSA id v8sm3087445wrc.29.2021.06.10.02.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:18:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/amdgpu: rework dma_resv handling
Date: Thu, 10 Jun 2021 11:18:00 +0200
Message-Id: <20210610091800.1833-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610091800.1833-1-christian.koenig@amd.com>
References: <20210610091800.1833-1-christian.koenig@amd.com>
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

Drop the workaround and instead implement a better solution.

Basically we are now chaining all submissions using a dma_fence_chain
container and adding them as exclusive fence to the dma_resv object.

This way other drivers can still sync to the single exclusive fence
while amdgpu only sync to fences from different processes.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 54 +++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 65 ---------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 -
 6 files changed, 47 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index a130e766cbdb..c905a4cfc173 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -34,6 +34,7 @@ struct amdgpu_fpriv;
 struct amdgpu_bo_list_entry {
 	struct ttm_validate_buffer	tv;
 	struct amdgpu_bo_va		*bo_va;
+	struct dma_fence_chain		*chain;
 	uint32_t			priority;
 	struct page			**user_pages;
 	bool				user_invalidated;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 325e82621467..f6f3029f958d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -587,6 +587,20 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		goto out;
 	}
 
+	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+
+		e->bo_va = amdgpu_vm_bo_find(vm, bo);
+
+		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
+			e->chain = dma_fence_chain_alloc();
+			if (!e->chain) {
+				r = -ENOMEM;
+				goto error_validate;
+			}
+		}
+	}
+
 	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
 					  &p->bytes_moved_vis_threshold);
 	p->bytes_moved = 0;
@@ -614,15 +628,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	gws = p->bo_list->gws_obj;
 	oa = p->bo_list->oa_obj;
 
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-
-		/* Make sure we use the exclusive slot for shared BOs */
-		if (bo->prime_shared_count)
-			e->tv.num_shared = 0;
-		e->bo_va = amdgpu_vm_bo_find(vm, bo);
-	}
-
 	if (gds) {
 		p->job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
 		p->job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
@@ -644,8 +649,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	}
 
 error_validate:
-	if (r)
+	if (r) {
+		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+			dma_fence_chain_free(e->chain);
+			e->chain = NULL;
+		}
 		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
+	}
 out:
 	return r;
 }
@@ -685,9 +695,17 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
 {
 	unsigned i;
 
-	if (error && backoff)
+	if (error && backoff) {
+		struct amdgpu_bo_list_entry *e;
+
+		amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
+			dma_fence_chain_free(e->chain);
+			e->chain = NULL;
+		}
+
 		ttm_eu_backoff_reservation(&parser->ticket,
 					   &parser->validated);
+	}
 
 	for (i = 0; i < parser->num_post_deps; i++) {
 		drm_syncobj_put(parser->post_deps[i].syncobj);
@@ -1260,6 +1278,20 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
+	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+		struct dma_resv *resv = e->tv.bo->base.resv;
+		struct dma_fence_chain *chain = e->chain;
+
+		if (!chain)
+			continue;
+
+		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
+				     dma_fence_get(p->fence), 1);
+
+		rcu_assign_pointer(resv->fence_excl, &chain->base);
+		e->chain = NULL;
+	}
+
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 	mutex_unlock(&p->adev->notifier_lock);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index c3053b83b80c..23219fc3b28c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -42,48 +42,6 @@
 #include <linux/pci-p2pdma.h>
 #include <linux/pm_runtime.h>
 
-static int
-__dma_resv_make_exclusive(struct dma_resv *obj)
-{
-	struct dma_fence **fences;
-	unsigned int count;
-	int r;
-
-	if (!dma_resv_shared_list(obj)) /* no shared fences to convert */
-		return 0;
-
-	r = dma_resv_get_fences(obj, NULL, &count, &fences);
-	if (r)
-		return r;
-
-	if (count == 0) {
-		/* Now that was unexpected. */
-	} else if (count == 1) {
-		dma_resv_add_excl_fence(obj, fences[0]);
-		dma_fence_put(fences[0]);
-		kfree(fences);
-	} else {
-		struct dma_fence_array *array;
-
-		array = dma_fence_array_create(count, fences,
-					       dma_fence_context_alloc(1), 0,
-					       false);
-		if (!array)
-			goto err_fences_put;
-
-		dma_resv_add_excl_fence(obj, &array->base);
-		dma_fence_put(&array->base);
-	}
-
-	return 0;
-
-err_fences_put:
-	while (count--)
-		dma_fence_put(fences[count]);
-	kfree(fences);
-	return -ENOMEM;
-}
-
 /**
  * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
  *
@@ -110,24 +68,6 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 	if (r < 0)
 		goto out;
 
-	r = amdgpu_bo_reserve(bo, false);
-	if (unlikely(r != 0))
-		goto out;
-
-	/*
-	 * We only create shared fences for internal use, but importers
-	 * of the dmabuf rely on exclusive fences for implicitly
-	 * tracking write hazards. As any of the current fences may
-	 * correspond to a write, we need to convert all existing
-	 * fences on the reservation object into a single exclusive
-	 * fence.
-	 */
-	r = __dma_resv_make_exclusive(bo->tbo.base.resv);
-	if (r)
-		goto out;
-
-	bo->prime_shared_count++;
-	amdgpu_bo_unreserve(bo);
 	return 0;
 
 out:
@@ -150,9 +90,6 @@ static void amdgpu_dma_buf_detach(struct dma_buf *dmabuf,
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 
-	if (attach->dev->driver != adev->dev->driver && bo->prime_shared_count)
-		bo->prime_shared_count--;
-
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 }
@@ -406,8 +343,6 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 	bo = gem_to_amdgpu_bo(gobj);
 	bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
 	bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
-	if (dma_buf->ops != &amdgpu_dmabuf_ops)
-		bo->prime_shared_count = 1;
 
 	dma_resv_unlock(resv);
 	return gobj;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 1c3e3b608332..5d82120fc160 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -829,7 +829,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		break;
 	}
 	case AMDGPU_GEM_OP_SET_PLACEMENT:
-		if (robj->prime_shared_count && (args->value & AMDGPU_GEM_DOMAIN_VRAM)) {
+		if (robj->tbo.base.import_attach &&
+		    args->value & AMDGPU_GEM_DOMAIN_VRAM) {
 			r = -EINVAL;
 			amdgpu_bo_unreserve(robj);
 			break;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 96447e1d4c9c..30951b593809 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -871,7 +871,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
 		return -EINVAL;
 
 	/* A shared bo cannot be migrated to VRAM */
-	if (bo->prime_shared_count || bo->tbo.base.import_attach) {
+	if (bo->tbo.base.import_attach) {
 		if (domain & AMDGPU_GEM_DOMAIN_GTT)
 			domain = AMDGPU_GEM_DOMAIN_GTT;
 		else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index b35962702278..55d7e90eaa72 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -98,7 +98,6 @@ struct amdgpu_bo {
 	struct ttm_buffer_object	tbo;
 	struct ttm_bo_kmap_obj		kmap;
 	u64				flags;
-	unsigned			prime_shared_count;
 	/* per VM structure for page tables and with virtual addresses */
 	struct amdgpu_vm_bo_base	*vm_bo;
 	/* Constant after initialization */
-- 
2.25.1

