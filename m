Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34D7DE8FC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 00:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA1610E7FC;
	Wed,  1 Nov 2023 23:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E70D10E7F7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 23:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMJtWwwzOnXgVGgwdNTGwhIH6thK6PoDSMuGjW3JYsQ=;
 b=FkV0lBYDj0tC82X8dAxjG8J+TpRSDoYPJ+hZQicgFJGcJqJH9PjDY60l4IpD9rIWF2/sP5
 rKsoLKeZW/DQsJ73QJQci9NSDcTaH9fccurpe/zHHcQIAYIRhAtfbmHYcQSZIOuTTExY9I
 IXqFzC1YN+eA2Exr1MQN2XOEj7Xw8J4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-a8mnrMzaO2y4vcK7tssM6A-1; Wed, 01 Nov 2023 19:32:05 -0400
X-MC-Unique: a8mnrMzaO2y4vcK7tssM6A-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9ae57d8b502so19945866b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 16:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881524; x=1699486324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sMJtWwwzOnXgVGgwdNTGwhIH6thK6PoDSMuGjW3JYsQ=;
 b=ngQ4fXAWl6PLGfB4amUY4VvYP9iU7NXmp9yuvNJb2GH1P1bBBcmx319+KjjzLg8G2p
 oiDn+rCEYF31/LatI8rY9GqaCiBlqeplzGiIlMoVLccOTV6chSK99vlTek6+IeFaVWmg
 iZjReL2UB5+4kjSUuKgu7uK03QxqSZHDPsPWhT3JDjvNaGWT6+AGlzikx+vRVAGF5WAu
 2URUR9hsFouZv2MASnaAR5foCUtliM54ix+PKsIWSiH495CWakIINRUlc4c7EyYLFmyR
 8Vph3UXVCjzXl6aI5NkBgE4sNHFg8WbjHl/aGqmxVIVGrDT9JxClUyw4d8YoBn/gvKXj
 RTtQ==
X-Gm-Message-State: AOJu0YwEdw24hMsHsowCiI9JODyomsf8p5D8zg+6Lxk46+sA+j0wU7KM
 WQ11nU065ADyR/7SwoGzNygWrCHYNYiI3bhsoDcB2IzYBnRkpNjm1RSl+VxjAvDg9LVA8j31CaD
 93sv4sW2oojv21zyR+AQW0AyJ/UTb
X-Received: by 2002:a17:907:1392:b0:9d6:e1b5:1afa with SMTP id
 vs18-20020a170907139200b009d6e1b51afamr1984413ejb.46.1698881524521; 
 Wed, 01 Nov 2023 16:32:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7H/Bjvaw2o86RDVALW4ML+vTEPIQa7r6t0Wtvvx05um+pZ/Et1fSYofSvZqQdXpG46HLWAQ==
X-Received: by 2002:a17:907:1392:b0:9d6:e1b5:1afa with SMTP id
 vs18-20020a170907139200b009d6e1b51afamr1984405ejb.46.1698881524249; 
 Wed, 01 Nov 2023 16:32:04 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 pw9-20020a17090720a900b009c7608eb499sm460820ejb.94.2023.11.01.16.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:32:03 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v8 12/12] drm/nouveau: use GPUVM common
 infrastructure
Date: Thu,  2 Nov 2023 00:31:04 +0100
Message-ID: <20231101233113.8059-13-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
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

GPUVM provides common infrastructure to track external and evicted GEM
objects as well as locking and validation helpers.

Especially external and evicted object tracking is a huge improvement
compared to the current brute force approach of iterating all mappings
in order to lock and validate the GPUVM's GEM objects. Hence, make us of
it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  4 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  | 57 ++++----------
 drivers/gpu/drm/nouveau/nouveau_exec.h  |  4 -
 drivers/gpu/drm/nouveau/nouveau_sched.c |  9 ++-
 drivers/gpu/drm/nouveau/nouveau_sched.h |  7 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 99 ++++++++++++++++---------
 6 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7afad86da64b..b7dda486a7ea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1061,17 +1061,18 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
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
 
+	drm_gpuvm_bo_gem_evict(obj, evict);
 	nouveau_bo_move_ntfy(bo, new_reg);
 	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
@@ -1136,6 +1137,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 out_ntfy:
 	if (ret) {
 		nouveau_bo_move_ntfy(bo, bo->resource);
+		drm_gpuvm_bo_gem_evict(obj, !evict);
 	}
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index bf6c12f4342a..9d9835fb5970 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: MIT
 
-#include <drm/drm_exec.h>
-
 #include "nouveau_drv.h"
 #include "nouveau_gem.h"
 #include "nouveau_mem.h"
@@ -86,14 +84,12 @@
  */
 
 static int
-nouveau_exec_job_submit(struct nouveau_job *job)
+nouveau_exec_job_submit(struct nouveau_job *job,
+			struct drm_gpuvm_exec *vme)
 {
 	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
 	struct nouveau_cli *cli = job->cli;
 	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
-	struct drm_exec *exec = &job->exec;
-	struct drm_gem_object *obj;
-	unsigned long index;
 	int ret;
 
 	/* Create a new fence, but do not emit yet. */
@@ -102,52 +98,29 @@ nouveau_exec_job_submit(struct nouveau_job *job)
 		return ret;
 
 	nouveau_uvmm_lock(uvmm);
-	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-			    DRM_EXEC_IGNORE_DUPLICATES);
-	drm_exec_until_all_locked(exec) {
-		struct drm_gpuva *va;
-
-		drm_gpuvm_for_each_va(va, &uvmm->base) {
-			if (unlikely(va == &uvmm->base.kernel_alloc_node))
-				continue;
-
-			ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
-			drm_exec_retry_on_contention(exec);
-			if (ret)
-				goto err_uvmm_unlock;
-		}
+	ret = drm_gpuvm_exec_lock(vme);
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
+	ret = drm_gpuvm_exec_validate(vme);
+	if (ret) {
+		drm_gpuvm_exec_unlock(vme);
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
-nouveau_exec_job_armed_submit(struct nouveau_job *job)
+nouveau_exec_job_armed_submit(struct nouveau_job *job,
+			      struct drm_gpuvm_exec *vme)
 {
-	struct drm_exec *exec = &job->exec;
-	struct drm_gem_object *obj;
-	unsigned long index;
-
-	drm_exec_for_each_locked_object(exec, index, obj)
-		dma_resv_add_fence(obj->resv, job->done_fence, job->resv_usage);
-
-	drm_exec_fini(exec);
+	drm_gpuvm_exec_resv_add_fence(vme, job->done_fence,
+				      job->resv_usage, job->resv_usage);
+	drm_gpuvm_exec_unlock(vme);
 }
 
 static struct dma_fence *
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h b/drivers/gpu/drm/nouveau/nouveau_exec.h
index 778cacd90f65..b815de2428f3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.h
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
@@ -3,16 +3,12 @@
 #ifndef __NOUVEAU_EXEC_H__
 #define __NOUVEAU_EXEC_H__
 
-#include <drm/drm_exec.h>
-
 #include "nouveau_drv.h"
 #include "nouveau_sched.h"
 
 struct nouveau_exec_job_args {
 	struct drm_file *file_priv;
 	struct nouveau_sched_entity *sched_entity;
-
-	struct drm_exec exec;
 	struct nouveau_channel *chan;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 7e64b5ef90fb..0416fd6b6a40 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -263,6 +263,11 @@ nouveau_job_submit(struct nouveau_job *job)
 {
 	struct nouveau_sched_entity *entity = to_nouveau_sched_entity(job->base.entity);
 	struct dma_fence *done_fence = NULL;
+	struct drm_gpuvm_exec vm_exec = {
+		.vm = &nouveau_cli_uvmm(job->cli)->base,
+		.flags = DRM_EXEC_IGNORE_DUPLICATES,
+		.num_fences = 1,
+	};
 	int ret;
 
 	ret = nouveau_job_add_deps(job);
@@ -282,7 +287,7 @@ nouveau_job_submit(struct nouveau_job *job)
 	 * successfully.
 	 */
 	if (job->ops->submit) {
-		ret = job->ops->submit(job);
+		ret = job->ops->submit(job, &vm_exec);
 		if (ret)
 			goto err_cleanup;
 	}
@@ -315,7 +320,7 @@ nouveau_job_submit(struct nouveau_job *job)
 	set_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &job->done_fence->flags);
 
 	if (job->ops->armed_submit)
-		job->ops->armed_submit(job);
+		job->ops->armed_submit(job, &vm_exec);
 
 	nouveau_job_fence_attach(job);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 27ac19792597..0f87697dbc9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -5,7 +5,7 @@
 
 #include <linux/types.h>
 
-#include <drm/drm_exec.h>
+#include <drm/drm_gpuvm.h>
 #include <drm/gpu_scheduler.h>
 
 #include "nouveau_drv.h"
@@ -54,7 +54,6 @@ struct nouveau_job {
 	struct drm_file *file_priv;
 	struct nouveau_cli *cli;
 
-	struct drm_exec exec;
 	enum dma_resv_usage resv_usage;
 	struct dma_fence *done_fence;
 
@@ -76,8 +75,8 @@ struct nouveau_job {
 		/* If .submit() returns without any error, it is guaranteed that
 		 * armed_submit() is called.
 		 */
-		int (*submit)(struct nouveau_job *);
-		void (*armed_submit)(struct nouveau_job *);
+		int (*submit)(struct nouveau_job *, struct drm_gpuvm_exec *);
+		void (*armed_submit)(struct nouveau_job *, struct drm_gpuvm_exec *);
 		struct dma_fence *(*run)(struct nouveau_job *);
 		void (*free)(struct nouveau_job *);
 		enum drm_gpu_sched_stat (*timeout)(struct nouveau_job *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index eda7bb8624f1..2bb72fff06e0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -438,8 +438,9 @@ nouveau_uvma_region_complete(struct nouveau_uvma_region *reg)
 static void
 op_map_prepare_unwind(struct nouveau_uvma *uvma)
 {
+	struct drm_gpuva *va = &uvma->va;
 	nouveau_uvma_gem_put(uvma);
-	drm_gpuva_remove(&uvma->va);
+	drm_gpuva_remove(va);
 	nouveau_uvma_free(uvma);
 }
 
@@ -468,6 +469,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			break;
 		case DRM_GPUVA_OP_REMAP: {
 			struct drm_gpuva_op_remap *r = &op->remap;
+			struct drm_gpuva *va = r->unmap->va;
 
 			if (r->next)
 				op_map_prepare_unwind(new->next);
@@ -475,7 +477,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			if (r->prev)
 				op_map_prepare_unwind(new->prev);
 
-			op_unmap_prepare_unwind(r->unmap->va);
+			op_unmap_prepare_unwind(va);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
@@ -634,6 +636,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 					goto unwind;
 				}
 			}
+
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP: {
@@ -1135,12 +1138,44 @@ bind_link_gpuvas(struct bind_job_op *bop)
 }
 
 static int
-nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
+bind_lock_extra(struct drm_gpuvm_exec *vme)
+{
+	struct nouveau_uvmm_bind_job *bind_job = vme->extra.priv;
+	struct drm_exec *exec = &vme->exec;
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
+			ret = drm_exec_prepare_obj(exec, obj, vme->num_fences);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int
+nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
+			     struct drm_gpuvm_exec *vme)
 {
 	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
 	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
 	struct nouveau_sched_entity *entity = job->entity;
-	struct drm_exec *exec = &job->exec;
 	struct bind_job_op *op;
 	int ret;
 
@@ -1157,6 +1192,8 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 			dma_resv_unlock(obj->resv);
 			if (IS_ERR(op->vm_bo))
 				return PTR_ERR(op->vm_bo);
+
+			drm_gpuvm_bo_extobj_add(op->vm_bo);
 		}
 
 		ret = bind_validate_op(job, op);
@@ -1179,6 +1216,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 	 * unwind all GPU VA space changes on failure.
 	 */
 	nouveau_uvmm_lock(uvmm);
+
 	list_for_each_op(op, &bind_job->ops) {
 		switch (op->op) {
 		case OP_MAP_SPARSE:
@@ -1290,30 +1328,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 		}
 	}
 
-	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-			    DRM_EXEC_IGNORE_DUPLICATES);
-	drm_exec_until_all_locked(exec) {
-		list_for_each_op(op, &bind_job->ops) {
-			struct drm_gpuva_op *va_op;
+	vme->extra.fn = bind_lock_extra;
+	vme->extra.priv = bind_job;
 
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
+	ret = drm_gpuvm_exec_lock(vme);
+	if (ret)
+		goto unwind_continue;
 
 	list_for_each_op(op, &bind_job->ops) {
 		struct drm_gpuva_op *va_op;
@@ -1413,21 +1433,17 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 	}
 
 	nouveau_uvmm_unlock(uvmm);
-	drm_exec_fini(exec);
+	drm_gpuvm_exec_unlock(vme);
 	return ret;
 }
 
 static void
-nouveau_uvmm_bind_job_armed_submit(struct nouveau_job *job)
+nouveau_uvmm_bind_job_armed_submit(struct nouveau_job *job,
+				   struct drm_gpuvm_exec *vme)
 {
-	struct drm_exec *exec = &job->exec;
-	struct drm_gem_object *obj;
-	unsigned long index;
-
-	drm_exec_for_each_locked_object(exec, index, obj)
-		dma_resv_add_fence(obj->resv, job->done_fence, job->resv_usage);
-
-	drm_exec_fini(exec);
+	drm_gpuvm_exec_resv_add_fence(vme, job->done_fence,
+				      job->resv_usage, job->resv_usage);
+	drm_gpuvm_exec_unlock(vme);
 }
 
 static struct dma_fence *
@@ -1815,8 +1831,17 @@ nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
 	kfree(uvmm);
 }
 
+static int
+nouveau_uvmm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(vm_bo->obj);
+
+	return nouveau_bo_validate(nvbo, true, false);
+}
+
 static const struct drm_gpuvm_ops gpuvm_ops = {
 	.vm_free = nouveau_uvmm_free,
+	.vm_bo_validate = nouveau_uvmm_bo_validate,
 };
 
 int
-- 
2.41.0

