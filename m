Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 918857D40BC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 22:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A7010E244;
	Mon, 23 Oct 2023 20:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EED10E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 20:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698092254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbVKWGK7uyRXo+8Lpq+i0JrJsJxQTDqSgjGZQLwp4jM=;
 b=ePkTPU1zVFFNIQVgUHOLgi8HTTLURdR74Dj4km5Djbfc2TyCjxsxBykWG44ExuABA2y/0R
 DGXsi6HYAaVH3r971y7GewF7lVnL6caWQzIVsmKLwWLqDi2hPrxThr9XjgqFRJZj4oOq21
 vi5diqhK3oDjrsnRj6kN3wGbPwBYOU0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-lfLwZibcPiC9UzhX3VPDaw-1; Mon, 23 Oct 2023 16:17:32 -0400
X-MC-Unique: lfLwZibcPiC9UzhX3VPDaw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-53e3120ae44so2573799a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 13:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698092251; x=1698697051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AbVKWGK7uyRXo+8Lpq+i0JrJsJxQTDqSgjGZQLwp4jM=;
 b=JCqRM75Z8usW4n+kJhP/G80q3F2bTHzQoWf0fD271UzT4qQfEP3x0B5bdA91VIrnmb
 jW9CposAArMAmLGRpzlckyRK76K6erNKqyLVrIT6ggB+lA0wGhdGZMbm5YIhte05QVeh
 /BLE5lI4n9CveNmj+G0WrH2Cak75XlhZeXb18j4S3DjPdcvg05pjbRJXI2Gb2M1SsK4V
 1sBvcjKm6TP1mG81xcqj9no+Jb06bPrsVNeyLcdT80+xUcisYBkvSJF6XMZEKf+5Pm4a
 ZQOikO4lmv9WM+7XTneOlywwJC5fOsfyo1sQeHbQ24s0CXVyXfooDNwilRttTIBBN0W5
 lAXQ==
X-Gm-Message-State: AOJu0YxE/2a92oT846+7RqJvA1pIUudqbEkkzkBLWAr4wQEj2b2v4ubc
 uOG2YG37/WUBsz8qiKopDSRU5xahE/QDRmM7s6dV18Wk99L5tLRDLqRKwxm1JEbyrmFdPiZLddo
 I5W9LD+0Mn+FA/qQkf1cWZ8RUB667
X-Received: by 2002:a17:907:94c3:b0:9bf:4e0b:fb06 with SMTP id
 dn3-20020a17090794c300b009bf4e0bfb06mr8230745ejc.14.1698092251402; 
 Mon, 23 Oct 2023 13:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjyQa10TVC0Mn8k3bG7KCs0/Z4ymJJNzUrrxit0yUzLptt0lnXF0S5pKO5pIClvyypJ8Mlcw==
X-Received: by 2002:a17:907:94c3:b0:9bf:4e0b:fb06 with SMTP id
 dn3-20020a17090794c300b009bf4e0bfb06mr8230722ejc.14.1698092251091; 
 Mon, 23 Oct 2023 13:17:31 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906019100b009ad8d444be4sm7048512ejb.43.2023.10.23.13.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 13:17:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v7 7/7] drm/nouveau: use GPUVM common
 infrastructure
Date: Mon, 23 Oct 2023 22:16:53 +0200
Message-ID: <20231023201659.25332-8-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023201659.25332-1-dakr@redhat.com>
References: <20231023201659.25332-1-dakr@redhat.com>
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
 drivers/gpu/drm/nouveau/nouveau_bo.c    |   4 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  57 ++++---------
 drivers/gpu/drm/nouveau/nouveau_exec.h  |   4 -
 drivers/gpu/drm/nouveau/nouveau_sched.c |   9 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h |   7 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 104 +++++++++++++++---------
 6 files changed, 94 insertions(+), 91 deletions(-)

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
index 88217185e0f3..9700efb0fd59 100644
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
index 005bb9c77990..390711e6ce89 100644
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
@@ -1147,12 +1150,44 @@ bind_link_gpuvas(struct bind_job_op *bop)
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
 
@@ -1170,6 +1205,8 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 			dma_resv_unlock(obj->resv);
 			if (IS_ERR(op->vm_bo))
 				return PTR_ERR(op->vm_bo);
+
+			drm_gpuvm_bo_extobj_add(op->vm_bo);
 		}
 
 		ret = bind_validate_op(job, op);
@@ -1192,6 +1229,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 	 * unwind all GPU VA space changes on failure.
 	 */
 	nouveau_uvmm_lock(uvmm);
+
 	list_for_each_op(op, &bind_job->ops) {
 		switch (op->op) {
 		case OP_MAP_SPARSE:
@@ -1303,30 +1341,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
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
@@ -1426,21 +1446,17 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
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
@@ -1832,6 +1848,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 	}
 }
 
+static int
+nouveau_uvmm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(vm_bo->obj);
+
+	return nouveau_bo_validate(nvbo, true, false);
+}
+
+static const struct drm_gpuvm_ops gpuvm_ops = {
+	.vm_bo_validate = nouveau_uvmm_bo_validate,
+};
+
 int
 nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		  u64 kernel_managed_addr, u64 kernel_managed_size)
@@ -1875,7 +1903,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
-		       NULL);
+		       &gpuvm_ops);
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
-- 
2.41.0

