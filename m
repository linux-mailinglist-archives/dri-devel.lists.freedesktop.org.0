Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C4E782043
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 23:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6891D10E164;
	Sun, 20 Aug 2023 21:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B90910E16C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 21:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692568462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ht3skAfRITnKNoVxIYGZtZJPcArvJuctUZOpE2xcjkQ=;
 b=MUWfyaYQDEvnwSH6GIIKAwsAP+2J+50fv8IFUkj4LwN//QeLVg7TT3XEpMLntJNhmH+mEw
 CYziEBgMMowNBluyRsggHRn0TlSxsBlwxKKoVHjy9cr76E+nsiOTAUMzkeh/cFpxwez5hY
 xbZvwQ2OnaD9WeNWzwQUbg1TDO9rMBY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-U4oVOkCgMZCchJDrBBlGjg-1; Sun, 20 Aug 2023 17:54:20 -0400
X-MC-Unique: U4oVOkCgMZCchJDrBBlGjg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-993831c639aso169428166b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 14:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692568460; x=1693173260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ht3skAfRITnKNoVxIYGZtZJPcArvJuctUZOpE2xcjkQ=;
 b=TLfmkFxSbkZ9hNgvRg4m15VXnjtDSFJGbp5l15ZCSJiHEqsE+kQvuzh6B19lW62mNr
 VvxdZ7GFxeJrSJUL+W8G0wigHjBarQICTC2cluZmxFYsJQ+e1BUxHPopuC0EP3LeGF0p
 /KD9x2b3fwMwj2rDN8eC45nSEb2KwD6ANz5E1HhzNJdu/bR+4Bs2ytBPyrh/Pa99jgkK
 Z7Mrj5j4nI/U8xdkhPfu4BDl0Fp2fseNJ7GnzrSyJWyhGZY++7XIKqWP1Ff95WD9DILh
 U8R3R88fJbhZg+Rt/OiVxNYxIhpyJVXTKMXfQn0EPq6kZ5yFieO7drokG92lFSmL2AxC
 /jrw==
X-Gm-Message-State: AOJu0YwzEi9Bz0Kmfd0Bpm6IHUEmkfw6B+8HTcIw+cbfe0RisLxRYXP3
 jftfR6iWshmO3TJgfMMsUBcFZMsGLBJS8gh9h0rUYN036+WXb49f1nyf/nNZdQHr6ISThXNIfTJ
 6VTzaAmK6xEWXwr4cAH8Jgq1Y38id
X-Received: by 2002:a17:906:8a44:b0:993:f744:d230 with SMTP id
 gx4-20020a1709068a4400b00993f744d230mr3582442ejc.16.1692568459700; 
 Sun, 20 Aug 2023 14:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS1ePlNjanjdL9qWHop92EoA2i4yVg8lqvUNWoB/pMbl7kiU/78Ljn1mkaybrloVCtaCQfRQ==
X-Received: by 2002:a17:906:8a44:b0:993:f744:d230 with SMTP id
 gx4-20020a1709068a4400b00993f744d230mr3582430ejc.16.1692568459352; 
 Sun, 20 Aug 2023 14:54:19 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ga10-20020a170906b84a00b00992b2c55c67sm5301351ejb.156.2023.08.20.14.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 14:54:18 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com
Subject: [PATCH drm-misc-next 3/3] drm/nouveau: gpuva mgr dma-resv/extobj
 handling, GEM validation
Date: Sun, 20 Aug 2023 23:53:10 +0200
Message-ID: <20230820215320.4187-4-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820215320.4187-1-dakr@redhat.com>
References: <20230820215320.4187-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make use of the DRM GPUVA managers GPU-VM common dma-resv, external GEM
object tracking, dma-resv locking, evicted GEM object tracking and
validation features.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    |   4 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  51 ++-----
 drivers/gpu/drm/nouveau/nouveau_gem.c   |   4 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h |   2 -
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 191 +++++++++++++++++-------
 5 files changed, 150 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 19cab37ac69c..64f50adb2856 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1060,17 +1060,18 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
+	struct drm_gem_object *obj = &bo->base;
 	struct ttm_resource *old_reg = bo->resource;
 	struct nouveau_drm_tile *new_tile = NULL;
 	int ret = 0;
 
-
 	if (new_reg->mem_type == TTM_PL_TT) {
 		ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, new_reg);
 		if (ret)
 			return ret;
 	}
 
+	drm_gpuva_gem_evict(obj, evict);
 	nouveau_bo_move_ntfy(bo, new_reg);
 	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
@@ -1135,6 +1136,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 out_ntfy:
 	if (ret) {
 		nouveau_bo_move_ntfy(bo, bo->resource);
+		drm_gpuva_gem_evict(obj, !evict);
 	}
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 0f927adda4ed..fadb20824b26 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: MIT
 
-#include <drm/drm_exec.h>
-
 #include "nouveau_drv.h"
 #include "nouveau_gem.h"
 #include "nouveau_mem.h"
@@ -91,9 +89,6 @@ nouveau_exec_job_submit(struct nouveau_job *job)
 	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
 	struct nouveau_cli *cli = job->cli;
 	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
-	struct drm_exec *exec = &job->exec;
-	struct drm_gem_object *obj;
-	unsigned long index;
 	int ret;
 
 	ret = nouveau_fence_new(&exec_job->fence);
@@ -101,52 +96,30 @@ nouveau_exec_job_submit(struct nouveau_job *job)
 		return ret;
 
 	nouveau_uvmm_lock(uvmm);
-	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-			    DRM_EXEC_IGNORE_DUPLICATES);
-	drm_exec_until_all_locked(exec) {
-		struct drm_gpuva *va;
-
-		drm_gpuva_for_each_va(va, &uvmm->umgr) {
-			if (unlikely(va == &uvmm->umgr.kernel_alloc_node))
-				continue;
-
-			ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
-			drm_exec_retry_on_contention(exec);
-			if (ret)
-				goto err_uvmm_unlock;
-		}
+	ret = drm_gpuva_manager_lock(&uvmm->umgr, 1, false);
+	if (ret) {
+		nouveau_uvmm_unlock(uvmm);
+		return ret;
 	}
 	nouveau_uvmm_unlock(uvmm);
 
-	drm_exec_for_each_locked_object(exec, index, obj) {
-		struct nouveau_bo *nvbo = nouveau_gem_object(obj);
-
-		ret = nouveau_bo_validate(nvbo, true, false);
-		if (ret)
-			goto err_exec_fini;
+	ret = drm_gpuva_manager_validate(&uvmm->umgr);
+	if (ret) {
+		drm_gpuva_manager_unlock(&uvmm->umgr);
+		return ret;
 	}
 
 	return 0;
-
-err_uvmm_unlock:
-	nouveau_uvmm_unlock(uvmm);
-err_exec_fini:
-	drm_exec_fini(exec);
-	return ret;
-
 }
 
 static void
 nouveau_exec_job_armed_submit(struct nouveau_job *job)
 {
-	struct drm_exec *exec = &job->exec;
-	struct drm_gem_object *obj;
-	unsigned long index;
-
-	drm_exec_for_each_locked_object(exec, index, obj)
-		dma_resv_add_fence(obj->resv, job->done_fence, job->resv_usage);
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
 
-	drm_exec_fini(exec);
+	drm_gpuva_manager_resv_add_fence(&uvmm->umgr, job->done_fence,
+					 job->resv_usage, job->resv_usage);
+	drm_gpuva_manager_unlock(&uvmm->umgr);
 }
 
 static struct dma_fence *
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f39360870c70..dec34a88f8b2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -111,7 +111,7 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
 		return 0;
 
-	if (nvbo->no_share && uvmm && &uvmm->resv != nvbo->bo.base.resv)
+	if (nvbo->no_share && uvmm && uvmm->umgr.resv != nvbo->bo.base.resv)
 		return -EPERM;
 
 	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
@@ -245,7 +245,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		if (unlikely(!uvmm))
 			return -EINVAL;
 
-		resv = &uvmm->resv;
+		resv = uvmm->umgr.resv;
 	}
 
 	if (!(domain & (NOUVEAU_GEM_DOMAIN_VRAM | NOUVEAU_GEM_DOMAIN_GART)))
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 27ac19792597..ccedc80685b3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -5,7 +5,6 @@
 
 #include <linux/types.h>
 
-#include <drm/drm_exec.h>
 #include <drm/gpu_scheduler.h>
 
 #include "nouveau_drv.h"
@@ -54,7 +53,6 @@ struct nouveau_job {
 	struct drm_file *file_priv;
 	struct nouveau_cli *cli;
 
-	struct drm_exec exec;
 	enum dma_resv_usage resv_usage;
 	struct dma_fence *done_fence;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 3a1e8538f205..ce1975cca8a9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -71,6 +71,7 @@ struct bind_job_op {
 		u32 handle;
 		u64 offset;
 		struct drm_gem_object *obj;
+		struct drm_gpuva_gem *vm_bo;
 	} gem;
 
 	struct nouveau_uvma_region *reg;
@@ -436,8 +437,10 @@ nouveau_uvma_region_complete(struct nouveau_uvma_region *reg)
 static void
 op_map_prepare_unwind(struct nouveau_uvma *uvma)
 {
+	struct drm_gpuva *va = &uvma->va;
 	nouveau_uvma_gem_put(uvma);
-	drm_gpuva_remove(&uvma->va);
+	drm_gpuva_remove(va);
+	drm_gpuva_extobj_put(va->mgr, va->gem.obj);
 	nouveau_uvma_free(uvma);
 }
 
@@ -445,6 +448,7 @@ static void
 op_unmap_prepare_unwind(struct drm_gpuva *va)
 {
 	drm_gpuva_insert(va->mgr, va);
+	drm_gpuva_extobj_get(va->mgr, va->gem.obj);
 }
 
 static void
@@ -466,14 +470,17 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			break;
 		case DRM_GPUVA_OP_REMAP: {
 			struct drm_gpuva_op_remap *r = &op->remap;
+			struct drm_gpuva *va = r->unmap->va;
 
+			drm_gpuva_extobj_get(va->mgr, va->gem.obj);
 			if (r->next)
 				op_map_prepare_unwind(new->next);
 
 			if (r->prev)
 				op_map_prepare_unwind(new->prev);
 
-			op_unmap_prepare_unwind(r->unmap->va);
+			op_unmap_prepare_unwind(va);
+			drm_gpuva_extobj_put(va->mgr, va->gem.obj);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
@@ -589,7 +596,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
 	uvma->region = args->region;
 	uvma->kind = args->kind;
 
-	drm_gpuva_map(&uvmm->umgr, &uvma->va, op);
+	drm_gpuva_map_get(&uvmm->umgr, &uvma->va, op);
 
 	/* Keep a reference until this uvma is destroyed. */
 	nouveau_uvma_gem_get(uvma);
@@ -601,7 +608,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
 static void
 op_unmap_prepare(struct drm_gpuva_op_unmap *u)
 {
-	drm_gpuva_unmap(u);
+	drm_gpuva_unmap_put(u);
 }
 
 static int
@@ -632,6 +639,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 					goto unwind;
 				}
 			}
+
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP: {
@@ -644,6 +652,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 			u64 urange = va->va.range;
 			u64 uend = ustart + urange;
 
+			drm_gpuva_extobj_get(va->mgr, va->gem.obj);
 			op_unmap_prepare(r->unmap);
 
 			if (r->prev) {
@@ -668,6 +677,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 				if (args)
 					vmm_get_end = ustart;
 			}
+			drm_gpuva_extobj_put(va->mgr, va->gem.obj);
 
 			if (args && (r->prev && r->next))
 				vmm_get_start = vmm_get_end = 0;
@@ -1112,22 +1122,34 @@ bind_validate_region(struct nouveau_job *job)
 }
 
 static void
-bind_link_gpuvas(struct drm_gpuva_ops *ops, struct nouveau_uvma_prealloc *new)
+bind_link_gpuvas(struct bind_job_op *bop)
 {
+	struct nouveau_uvma_prealloc *new = &bop->new;
+	struct drm_gpuva_gem *vm_bo = bop->gem.vm_bo;
+	struct drm_gpuva_ops *ops = bop->ops;
 	struct drm_gpuva_op *op;
 
 	drm_gpuva_for_each_op(op, ops) {
 		switch (op->op) {
 		case DRM_GPUVA_OP_MAP:
-			drm_gpuva_link(&new->map->va);
+			drm_gpuva_link(&new->map->va, vm_bo);
 			break;
-		case DRM_GPUVA_OP_REMAP:
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva *va = op->remap.unmap->va;
+			struct drm_gpuva_gem *vm_bo;
+
+			vm_bo = drm_gpuva_gem_find(va->mgr, va->gem.obj);
+			BUG_ON(!vm_bo);
+
 			if (op->remap.prev)
-				drm_gpuva_link(&new->prev->va);
+				drm_gpuva_link(&new->prev->va, vm_bo);
 			if (op->remap.next)
-				drm_gpuva_link(&new->next->va);
-			drm_gpuva_unlink(op->remap.unmap->va);
+				drm_gpuva_link(&new->next->va, vm_bo);
+			drm_gpuva_unlink(va);
+
+			drm_gpuva_gem_put(vm_bo);
 			break;
+		}
 		case DRM_GPUVA_OP_UNMAP:
 			drm_gpuva_unlink(op->unmap.va);
 			break;
@@ -1137,22 +1159,72 @@ bind_link_gpuvas(struct drm_gpuva_ops *ops, struct nouveau_uvma_prealloc *new)
 	}
 }
 
+static int
+bind_lock_extra(struct drm_gpuva_manager *mgr, void *priv,
+		unsigned int num_fences)
+{
+	struct nouveau_uvmm_bind_job *bind_job = priv;
+	struct bind_job_op *op;
+	int ret;
+
+	list_for_each_op(op, &bind_job->ops) {
+		struct drm_gpuva_op *va_op;
+
+		if (IS_ERR_OR_NULL(op->ops))
+			continue;
+
+		drm_gpuva_for_each_op(va_op, op->ops) {
+			struct drm_gem_object *obj = op_gem_obj(va_op);
+
+			if (unlikely(!obj))
+				continue;
+
+			if (va_op->op != DRM_GPUVA_OP_UNMAP)
+				continue;
+
+			ret = drm_exec_prepare_obj(DRM_GPUVA_EXEC(mgr), obj,
+						   num_fences);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int
 nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 {
 	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
 	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
 	struct nouveau_sched_entity *entity = job->entity;
-	struct drm_exec *exec = &job->exec;
 	struct bind_job_op *op;
 	int ret;
 
 	list_for_each_op(op, &bind_job->ops) {
 		if (op->op == OP_MAP) {
-			op->gem.obj = drm_gem_object_lookup(job->file_priv,
-							    op->gem.handle);
-			if (!op->gem.obj)
+			struct drm_gem_object *obj;
+
+			obj = drm_gem_object_lookup(job->file_priv,
+						    op->gem.handle);
+			if (!obj)
 				return -ENOENT;
+
+			dma_resv_lock(obj->resv, NULL);
+			op->gem.vm_bo = drm_gpuva_gem_obtain(&uvmm->umgr, obj);
+			dma_resv_unlock(obj->resv);
+			if (IS_ERR(op->gem.vm_bo)) {
+				drm_gem_object_put(obj);
+				return PTR_ERR(op->gem.vm_bo);
+			}
+
+			ret = drm_gpuva_extobj_insert(&uvmm->umgr, obj);
+			if (ret) {
+				drm_gem_object_put(obj);
+				return ret;
+			}
+
+			op->gem.obj = obj;
 		}
 
 		ret = bind_validate_op(job, op);
@@ -1286,30 +1358,10 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 		}
 	}
 
-	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-			    DRM_EXEC_IGNORE_DUPLICATES);
-	drm_exec_until_all_locked(exec) {
-		list_for_each_op(op, &bind_job->ops) {
-			struct drm_gpuva_op *va_op;
-
-			if (IS_ERR_OR_NULL(op->ops))
-				continue;
-
-			drm_gpuva_for_each_op(va_op, op->ops) {
-				struct drm_gem_object *obj = op_gem_obj(va_op);
-
-				if (unlikely(!obj))
-					continue;
-
-				ret = drm_exec_prepare_obj(exec, obj, 1);
-				drm_exec_retry_on_contention(exec);
-				if (ret) {
-					op = list_last_op(&bind_job->ops);
-					goto unwind;
-				}
-			}
-		}
-	}
+	ret = drm_gpuva_manager_lock_extra(&uvmm->umgr, bind_lock_extra,
+					   bind_job, 1, false);
+	if (ret)
+		goto unwind_continue;
 
 	list_for_each_op(op, &bind_job->ops) {
 		struct drm_gpuva_op *va_op;
@@ -1363,7 +1415,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 		case OP_UNMAP_SPARSE:
 		case OP_MAP:
 		case OP_UNMAP:
-			bind_link_gpuvas(op->ops, &op->new);
+			bind_link_gpuvas(op);
 			break;
 		default:
 			break;
@@ -1409,21 +1461,18 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 	}
 
 	nouveau_uvmm_unlock(uvmm);
-	drm_exec_fini(exec);
+	drm_gpuva_manager_unlock(&uvmm->umgr);
 	return ret;
 }
 
 static void
 nouveau_uvmm_bind_job_armed_submit(struct nouveau_job *job)
 {
-	struct drm_exec *exec = &job->exec;
-	struct drm_gem_object *obj;
-	unsigned long index;
-
-	drm_exec_for_each_locked_object(exec, index, obj)
-		dma_resv_add_fence(obj->resv, job->done_fence, job->resv_usage);
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
 
-	drm_exec_fini(exec);
+	drm_gpuva_manager_resv_add_fence(&uvmm->umgr, job->done_fence,
+					 job->resv_usage, job->resv_usage);
+	drm_gpuva_manager_unlock(&uvmm->umgr);
 }
 
 static struct dma_fence *
@@ -1510,8 +1559,16 @@ nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
 		if (!IS_ERR_OR_NULL(op->ops))
 			drm_gpuva_ops_free(&uvmm->umgr, op->ops);
 
-		if (obj)
+		if (!IS_ERR_OR_NULL(op->gem.vm_bo)) {
+			dma_resv_lock(obj->resv, NULL);
+			drm_gpuva_gem_put(op->gem.vm_bo);
+			dma_resv_unlock(obj->resv);
+		}
+
+		if (obj) {
+			drm_gpuva_extobj_put(&uvmm->umgr, obj);
 			drm_gem_object_put(obj);
+		}
 	}
 
 	spin_lock(&entity->job.list.lock);
@@ -1775,15 +1832,18 @@ void
 nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbo, struct nouveau_mem *mem)
 {
 	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuva_gem *vm_bo;
 	struct drm_gpuva *va;
 
 	dma_resv_assert_held(obj->resv);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		struct nouveau_uvma *uvma = uvma_from_va(va);
+	drm_gem_for_each_gpuva_gem(vm_bo, obj) {
+		drm_gpuva_gem_for_each_va(va, vm_bo) {
+			struct nouveau_uvma *uvma = uvma_from_va(va);
 
-		nouveau_uvma_map(uvma, mem);
-		drm_gpuva_invalidate(va, false);
+			nouveau_uvma_map(uvma, mem);
+			drm_gpuva_invalidate(va, false);
+		}
 	}
 }
 
@@ -1791,18 +1851,33 @@ void
 nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 {
 	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuva_gem *vm_bo;
 	struct drm_gpuva *va;
 
 	dma_resv_assert_held(obj->resv);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		struct nouveau_uvma *uvma = uvma_from_va(va);
+	drm_gem_for_each_gpuva_gem(vm_bo, obj) {
+		drm_gpuva_gem_for_each_va(va, vm_bo) {
+			struct nouveau_uvma *uvma = uvma_from_va(va);
 
-		nouveau_uvma_unmap(uvma);
-		drm_gpuva_invalidate(va, true);
+			nouveau_uvma_unmap(uvma);
+			drm_gpuva_invalidate(va, true);
+		}
 	}
 }
 
+static int
+nouveau_uvmm_bo_validate(struct drm_gem_object *obj)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+
+	return nouveau_bo_validate(nvbo, true, false);
+}
+
+static const struct drm_gpuva_fn_ops nouveau_uvmm_gpuva_ops = {
+	.bo_validate = nouveau_uvmm_bo_validate,
+};
+
 int
 nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		  u64 kernel_managed_addr, u64 kernel_managed_size)
@@ -1835,11 +1910,11 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuva_manager_init(&uvmm->umgr, cli->name,
+	drm_gpuva_manager_init(&uvmm->umgr, cli->drm->dev, cli->name,
 			       NOUVEAU_VA_SPACE_START,
 			       NOUVEAU_VA_SPACE_END,
 			       kernel_managed_addr, kernel_managed_size,
-			       NULL);
+			       &nouveau_uvmm_gpuva_ops);
 
 	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
 			    cli->vmm.vmm.object.oclass, RAW,
-- 
2.41.0

