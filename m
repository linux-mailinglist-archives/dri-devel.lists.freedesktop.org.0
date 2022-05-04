Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D55A51989F
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FD510F5D9;
	Wed,  4 May 2022 07:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AE010EFA3;
 Wed,  4 May 2022 07:47:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p18so759367edr.7;
 Wed, 04 May 2022 00:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/98pg8hSnef8YgwtgSLDWBmvtKRG7+Q1mzb/VYFizsE=;
 b=gd8pS+lGQiIAf6sD+pXZYHvDTQNdre3DnjJBlSKOTLxly3fdb7mwhBWZYepiOJ8IN+
 iiMPkrlOrktcuGsZS4M3lue6imOAKgVo/LGwa2mMWpEwZV9oMPUdH4UMSDIj5XZ2sovT
 i/Z6vdeIikRAebXce0ZgLWcrk0Ozrb6N/P1yrpeoSoLJPtiu7Pb3BIjFE/SCjvf6F2Gi
 gslSAAmhigOufD9DpP9nKQMakYy3XdrMgkle2Vill3ZEHnLiI2ac66X5Ug2gmk5+bYKx
 4d5NRDPyLvrtKWo70o2nSiFgRVEt/hMx3M39JP9o6MBJhYv1j+3Sbg7bBCtKi5VbZVWd
 lOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/98pg8hSnef8YgwtgSLDWBmvtKRG7+Q1mzb/VYFizsE=;
 b=RKffCbr7rf6dqmMEYQd9FrThNgfz34TuOKu7aP46LbH5N51kd4/MK5LS/TyFCm5Bjy
 BnkySdIaL0q/rmmsXuGgelYlsDj8IoXvk6pNDuW8BMhb0NCKLkVx1UvCQ6+7l6s1aA9Z
 rQCEGObKLsWOkvpQpsw8hsZeV4vIJIbSjEBorGUGj9A7wKqAI2NgJNtFMmZmRJ51DCal
 ete6ZeLKmJUlt7l85HuhRBYwU5wPK9xA7SiNmP4MekZkmPzkWkDKz7hvsQodc9SHIN5o
 CQurWxnyWposmcTLnp/WISm/SC/4vEIKKilEDBI6O313vWV+ARImd0/BYFdZtrlx+UKc
 vhAQ==
X-Gm-Message-State: AOAM532JJ/5STP55OQJDvTGclDDnmc/MO5lC+0E5RIBKR7t3uk7CPyXq
 kMmZ8mzwvY3wcfGR5LSWdSkHSwgIzOY=
X-Google-Smtp-Source: ABdhPJwzBFjX1OpUp4ac+UlOLRF+aU0WGN70lGk66/o5C8eHJ3eNMX0Tzk82XuS1Q6o7to4ouhYcmw==
X-Received: by 2002:a05:6402:128b:b0:425:d1d7:b321 with SMTP id
 w11-20020a056402128b00b00425d1d7b321mr21458849edv.179.1651650465824; 
 Wed, 04 May 2022 00:47:45 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214dc2sm5433686ejc.40.2022.05.04.00.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:47:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 4/8] drm/amdgpu: use drm_exec for GEM and CSA handling
Date: Wed,  4 May 2022 09:47:35 +0200
Message-Id: <20220504074739.2231-5-christian.koenig@amd.com>
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
index 84a53758e18e..99d6d3ab452e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -33,6 +33,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
 
 #include "amdgpu.h"
@@ -195,29 +196,23 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
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
@@ -227,6 +222,9 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 		goto out_unlock;
 
 	r = amdgpu_vm_clear_freed(adev, vm, &fence);
+	if (unlikely(r < 0))
+		dev_err(adev->dev, "failed to clear page "
+			"tables on GEM object close (%ld)\n", r);
 	if (r || !fence)
 		goto out_unlock;
 
@@ -234,10 +232,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	dma_fence_put(fence);
 
 out_unlock:
-	if (unlikely(r < 0))
-		dev_err(adev->dev, "failed to clear page "
-			"tables on GEM object close (%ld)\n", r);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 }
 
 static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
@@ -668,10 +663,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
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
@@ -721,36 +713,37 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
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
@@ -787,10 +780,8 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
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
2.25.1

