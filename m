Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935A57EA5C3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 23:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8084D10E225;
	Mon, 13 Nov 2023 22:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7421E10E225
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 22:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699913529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mCBG2MF09Lke3UWn7scu87Nn96rKGBeruwjDZgwD05Y=;
 b=ibdDPr/OKCHfpylE3hxlhAt1e4v8jvvw+B3hP8hwlvsEc2cowAcOas7dz1q476t3J9+f0K
 aJpPn3EnMs3xhFmFF6VueQU+6kJkbNq+OlvAPgK+i/zQmo1MiyWx4Zc9vuDu91uOMC9yPj
 GzTmiPhMCK2XwgWwS+BgT0FN7P2WYPM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-M8SYUsIgNCuX6_fNAsaVXA-1; Mon, 13 Nov 2023 17:12:08 -0500
X-MC-Unique: M8SYUsIgNCuX6_fNAsaVXA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-54356d8ea43so3301887a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 14:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699913526; x=1700518326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mCBG2MF09Lke3UWn7scu87Nn96rKGBeruwjDZgwD05Y=;
 b=Aq6NkDHUvNtxIPnFAy+dB3QH5yqj+cGgOKKh4R9Mwnk4ymR2ONVqLO0VCbhRb+dIO4
 EhJS96kA9bpGnzgiYnNkYjBuxpxPLA0RCdk6kqQgm9EZJtyNz4rqLOm93jf6A2L7osaF
 EF3whV1kt2wLyk9+JalJuqCQCwk2OkxJz6f+8d5gvJ1AY/qJS/IIumymEF81LFZvZ15d
 rfbZ+zyq6sCAQAz4G7kv7664vL8XV0aHvcC0Vl0B+kNEBl50PFMncXT0Jyt4Vc0oYl06
 hFFz/RMEUX8gxH2vtwGR/lXPIP3363PBDoMdc3AyQzVb2w6HWDy4cAKBKXQw/nkiBc2p
 NKbA==
X-Gm-Message-State: AOJu0Yz4N1HV8V1NxftjLNwzqQGBzLidkBBCuasrf0EevJJlZ3TwX8ry
 76LO1Jx/Ul82wY2k8ltXJhlsyAsutRx5syrNN8I2xAA+X2NxWUkRdaYsR/+bD7knqi2z9cP+8XW
 HrZNE0ABCoEP8iJQF1mJFhPzQQPS/hO+Jr2bx
X-Received: by 2002:aa7:d314:0:b0:543:b9ae:a0d5 with SMTP id
 p20-20020aa7d314000000b00543b9aea0d5mr6082847edq.4.1699913526537; 
 Mon, 13 Nov 2023 14:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlER9gR6IBXgRNTerLG8K2/Buok6xv0zEfT1Uk4Xa/xkuoC09EPOXP3RhBpRhow0YP/yxR7g==
X-Received: by 2002:aa7:d314:0:b0:543:b9ae:a0d5 with SMTP id
 p20-20020aa7d314000000b00543b9aea0d5mr6082830edq.4.1699913526169; 
 Mon, 13 Nov 2023 14:12:06 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 k10-20020aa7d8ca000000b0054354da96e5sm4252093eds.55.2023.11.13.14.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 14:12:05 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH drm-misc-next] drm/nouveau: use GPUVM common infrastructure
Date: Mon, 13 Nov 2023 23:12:00 +0100
Message-ID: <20231113221202.7203-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: dri-devel@lists.freedesktop.org, kherbst@redhat.com,
 Danilo Krummrich <dakr@redhat.com>
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
Originally, this patch was part of [1]. However, while applying the series,
I noticed that this patch needs another iteration, hence I held it back to
rework it and send it separately.

Changes since detached from [1]:
================================
- Don't use drm_gpuvm_exec_lock() since it would, unnecessarily, lock all the
  backing buffer's dma-resv locks. Instead, lock only the GEMs affected by the
  requested mapping operations, directly or indirectly through map, remap or
  unmap.
- Validate backing buffers in drm_exec loop directly.

[1] https://lore.kernel.org/dri-devel/20231108001259.15123-1-dakr@redhat.com/T/#u
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    |   4 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  57 +++-------
 drivers/gpu/drm/nouveau/nouveau_exec.h  |   4 -
 drivers/gpu/drm/nouveau/nouveau_sched.c |   9 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h |   7 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 134 +++++++++++++-----------
 6 files changed, 100 insertions(+), 115 deletions(-)

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
index 1b2cc3f2e1c7..c0fa94db9972 100644
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
index eda7bb8624f1..90e6732ee9b5 100644
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
@@ -1135,12 +1138,53 @@ bind_link_gpuvas(struct bind_job_op *bop)
 }
 
 static int
-nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
+bind_lock_validate(struct nouveau_job *job, struct drm_exec *exec,
+		   unsigned int num_fences)
+{
+	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
+	struct bind_job_op *op;
+	int ret;
+
+	list_for_each_op(op, &bind_job->ops) {
+		struct drm_gpuva_op *va_op;
+
+		if (!op->ops)
+			continue;
+
+		drm_gpuva_for_each_op(va_op, op->ops) {
+			struct drm_gem_object *obj = op_gem_obj(va_op);
+
+			if (unlikely(!obj))
+				continue;
+
+			ret = drm_exec_prepare_obj(exec, obj, num_fences);
+			if (ret)
+				return ret;
+
+			/* Don't validate GEMs backing mappings we're about to
+			 * unmap, it's not worth the effort.
+			 */
+			if (va_op->op == DRM_GPUVA_OP_UNMAP)
+				continue;
+
+			ret = nouveau_bo_validate(nouveau_gem_object(obj),
+						  true, false);
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
+	struct drm_exec *exec = &vme->exec;
 	struct bind_job_op *op;
 	int ret;
 
@@ -1157,6 +1201,8 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 			dma_resv_unlock(obj->resv);
 			if (IS_ERR(op->vm_bo))
 				return PTR_ERR(op->vm_bo);
+
+			drm_gpuvm_bo_extobj_add(op->vm_bo);
 		}
 
 		ret = bind_validate_op(job, op);
@@ -1179,6 +1225,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 	 * unwind all GPU VA space changes on failure.
 	 */
 	nouveau_uvmm_lock(uvmm);
+
 	list_for_each_op(op, &bind_job->ops) {
 		switch (op->op) {
 		case OP_MAP_SPARSE:
@@ -1290,55 +1337,13 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 		}
 	}
 
-	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-			    DRM_EXEC_IGNORE_DUPLICATES);
+	drm_exec_init(exec, vme->flags);
 	drm_exec_until_all_locked(exec) {
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
-
-	list_for_each_op(op, &bind_job->ops) {
-		struct drm_gpuva_op *va_op;
-
-		if (IS_ERR_OR_NULL(op->ops))
-			continue;
-
-		drm_gpuva_for_each_op(va_op, op->ops) {
-			struct drm_gem_object *obj = op_gem_obj(va_op);
-
-			if (unlikely(!obj))
-				continue;
-
-			/* Don't validate GEMs backing mappings we're about to
-			 * unmap, it's not worth the effort.
-			 */
-			if (unlikely(va_op->op == DRM_GPUVA_OP_UNMAP))
-				continue;
-
-			ret = nouveau_bo_validate(nouveau_gem_object(obj),
-						  true, false);
-			if (ret) {
-				op = list_last_op(&bind_job->ops);
-				goto unwind;
-			}
+		ret = bind_lock_validate(job, exec, vme->num_fences);
+		drm_exec_retry_on_contention(exec);
+		if (ret) {
+			op = list_last_op(&bind_job->ops);
+			goto unwind;
 		}
 	}
 
@@ -1413,21 +1418,17 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
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
@@ -1815,8 +1816,17 @@ nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
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

base-commit: 50c1a36f594bb3dd33f3f9386c5d960cd12327d8
-- 
2.41.0

