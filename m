Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070916F6A75
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B7A10E279;
	Thu,  4 May 2023 11:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D1410E144;
 Thu,  4 May 2023 11:52:10 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9659443fb56so56057366b.2; 
 Thu, 04 May 2023 04:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201128; x=1685793128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uaBFN8hJwiXpjYXiUk3us9OsHJB5bXBAhQjIDcvwboY=;
 b=Q3ITahgw1PFD4MZFcixjZoeScgQDZXvZRww4i86bM7Jx/j9nZHDF29XV6oulQx8AK+
 0R0UyjAxbU0agjpeVL54ZSO69vS4i2DGpDLL7pW6K9Jc/B4/XcagEoT8NJbGk21s5FKz
 tBkDYKdG7VJN4N1O4e91A4TcjsamtztpZzWGRQaMFqpVefdhNLrWEd64/onpMAnuvGky
 dNgBRV/Dni4nhhjIIgMKV8WPk+VZ9GsLBENuBcaVy4ER8H2wP3xmXGFYyW7pgmn4pAtq
 fRhb0uEcwAaYWwGKMbYCvLT4wYoPRZKwK0tXruBcUxULcAy772MBfj33mZZShptu9fuI
 2aBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201128; x=1685793128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uaBFN8hJwiXpjYXiUk3us9OsHJB5bXBAhQjIDcvwboY=;
 b=e7LyK/UMJA24qgcvQ/coz0fC4uOLQeIl44spj6G2BHW6KoprcB1AV/LnFV5vW6Vt4M
 fBEIN6be9ACl5tkg2Z2o0pOXQ3/TF7fbmUHZgxwzbZ8kTH8g4CGTUJAssVZrASW/if15
 eOoRBrJLlpCJ2+bBjc+xjodD+zSVRFjH6b4n2WbXpVEOKbgC9O5ffmf8gFKgzCOmtpuz
 YW3z6dFKpdSqzo84CoEnlEjkT9PJ2yZ2iVIMl3XWb4C8OFN3kW4//Q+6Fp1j4RV88cBb
 iBA3BSqwXhtKAiZOkfZMUNNtO9OOv4vK+1hw9o+9s5Lh+0ZjDRozzAZpbSLus2vzu3ld
 AFyw==
X-Gm-Message-State: AC+VfDwh9pzIIbW8QNNp8fcJJDxv2mFghm7tAuUUAvCR18gYdhGmGwL5
 ego6Vf2MgF249Z4t22bvZf0=
X-Google-Smtp-Source: ACHHUZ4o2lacCwSs7GxtcrnLyBiDxVQ9AzATJn6fzK92CD0MoZQohYLeWZEBM3BMQ5Ur5oKHDdWFRw==
X-Received: by 2002:a17:906:c152:b0:94a:845c:3529 with SMTP id
 dp18-20020a170906c15200b0094a845c3529mr6606250ejc.9.1683201128060; 
 Thu, 04 May 2023 04:52:08 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 04/13] drm/amdgpu: use drm_exec for GEM and CSA handling
Date: Thu,  4 May 2023 13:51:50 +0200
Message-Id: <20230504115159.2245-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504115159.2245-1-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
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

Start using the new component here as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c | 42 ++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 77 +++++++++++--------------
 2 files changed, 53 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index c6d4d41c4393..ea434c8de047 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -22,6 +22,8 @@
  * * Author: Monk.liu@amd.com
  */
 
+#include <drm/drm_exec.h>
+
 #include "amdgpu.h"
 
 uint64_t amdgpu_csa_vaddr(struct amdgpu_device *adev)
@@ -65,31 +67,25 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			  struct amdgpu_bo *bo, struct amdgpu_bo_va **bo_va,
 			  uint64_t csa_addr, uint32_t size)
 {
-	struct ww_acquire_ctx ticket;
-	struct list_head list;
-	struct amdgpu_bo_list_entry pd;
-	struct ttm_validate_buffer csa_tv;
+	struct drm_exec exec;
 	int r;
 
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&csa_tv.head);
-	csa_tv.bo = &bo->tbo;
-	csa_tv.num_shared = 1;
-
-	list_add(&csa_tv.head, &list);
-	amdgpu_vm_get_pd_bo(vm, &list, &pd);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
-	if (r) {
-		DRM_ERROR("failed to reserve CSA,PD BOs: err=%d\n", r);
-		return r;
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		r = amdgpu_vm_lock_pd(vm, &exec);
+		if (likely(!r))
+			r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 0);
+		drm_exec_continue_on_contention(&exec);
+		if (unlikely(r)) {
+			DRM_ERROR("failed to reserve CSA,PD BOs: err=%d\n", r);
+			goto error;
+		}
 	}
 
 	*bo_va = amdgpu_vm_bo_add(adev, vm, bo);
 	if (!*bo_va) {
-		ttm_eu_backoff_reservation(&ticket, &list);
-		DRM_ERROR("failed to create bo_va for static CSA\n");
-		return -ENOMEM;
+		r = -ENOMEM;
+		goto error;
 	}
 
 	r = amdgpu_vm_bo_map(adev, *bo_va, csa_addr, 0, size,
@@ -99,10 +95,10 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r) {
 		DRM_ERROR("failed to do bo_map on static CSA, err=%d\n", r);
 		amdgpu_vm_bo_del(adev, *bo_va);
-		ttm_eu_backoff_reservation(&ticket, &list);
-		return r;
+		goto error;
 	}
 
-	ttm_eu_backoff_reservation(&ticket, &list);
-	return 0;
+error:
+	drm_exec_fini(&exec);
+	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 863cb668e000..c5f74f241366 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -33,6 +33,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/ttm/ttm_tt.h>
 
@@ -197,29 +198,23 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	struct amdgpu_fpriv *fpriv = file_priv->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
 
-	struct amdgpu_bo_list_entry vm_pd;
-	struct list_head list, duplicates;
 	struct dma_fence *fence = NULL;
-	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
 	struct amdgpu_bo_va *bo_va;
+	struct drm_exec exec;
 	long r;
 
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&duplicates);
-
-	tv.bo = &bo->tbo;
-	tv.num_shared = 2;
-	list_add(&tv.head, &list);
-
-	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, false, &duplicates);
-	if (r) {
-		dev_err(adev->dev, "leaking bo va because "
-			"we fail to reserve bo (%ld)\n", r);
-		return;
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 0);
+		if (likely(!r))
+			r = amdgpu_vm_lock_pd(vm, &exec);
+		drm_exec_continue_on_contention(&exec);
+		if (unlikely(r)) {
+			dev_err(adev->dev, "leaking bo va (%ld)\n", r);
+			goto out_unlock;
+		}
 	}
+
 	bo_va = amdgpu_vm_bo_find(vm, bo);
 	if (!bo_va || --bo_va->ref_count)
 		goto out_unlock;
@@ -229,6 +224,9 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 		goto out_unlock;
 
 	r = amdgpu_vm_clear_freed(adev, vm, &fence);
+	if (unlikely(r < 0))
+		dev_err(adev->dev, "failed to clear page "
+			"tables on GEM object close (%ld)\n", r);
 	if (r || !fence)
 		goto out_unlock;
 
@@ -236,10 +234,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	dma_fence_put(fence);
 
 out_unlock:
-	if (unlikely(r < 0))
-		dev_err(adev->dev, "failed to clear page "
-			"tables on GEM object close (%ld)\n", r);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 }
 
 static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
@@ -673,10 +668,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 	struct amdgpu_bo *abo;
 	struct amdgpu_bo_va *bo_va;
-	struct amdgpu_bo_list_entry vm_pd;
-	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
-	struct list_head list, duplicates;
+	struct drm_exec exec;
 	uint64_t va_flags;
 	uint64_t vm_size;
 	int r = 0;
@@ -726,36 +718,37 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&duplicates);
 	if ((args->operation != AMDGPU_VA_OP_CLEAR) &&
 	    !(args->flags & AMDGPU_VM_PAGE_PRT)) {
 		gobj = drm_gem_object_lookup(filp, args->handle);
 		if (gobj == NULL)
 			return -ENOENT;
 		abo = gem_to_amdgpu_bo(gobj);
-		tv.bo = &abo->tbo;
-		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
-			tv.num_shared = 1;
-		else
-			tv.num_shared = 0;
-		list_add(&tv.head, &list);
 	} else {
 		gobj = NULL;
 		abo = NULL;
 	}
 
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &list, &vm_pd);
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		if (gobj) {
+			r = drm_exec_prepare_obj(&exec, gobj, 0);
+			drm_exec_continue_on_contention(&exec);
+			if (unlikely(r))
+				goto error;
+		}
 
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, &duplicates);
-	if (r)
-		goto error_unref;
+		r = amdgpu_vm_lock_pd(&fpriv->vm, &exec);
+		drm_exec_continue_on_contention(&exec);
+		if (unlikely(r))
+			goto error;
+	}
 
 	if (abo) {
 		bo_va = amdgpu_vm_bo_find(&fpriv->vm, abo);
 		if (!bo_va) {
 			r = -ENOENT;
-			goto error_backoff;
+			goto error;
 		}
 	} else if (args->operation != AMDGPU_VA_OP_CLEAR) {
 		bo_va = fpriv->prt_va;
@@ -792,10 +785,8 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
 					args->operation);
 
-error_backoff:
-	ttm_eu_backoff_reservation(&ticket, &list);
-
-error_unref:
+error:
+	drm_exec_fini(&exec);
 	drm_gem_object_put(gobj);
 	return r;
 }
-- 
2.34.1

