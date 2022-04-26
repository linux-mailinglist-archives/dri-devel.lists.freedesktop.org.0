Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A842750FECE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 15:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E8D10F12F;
	Tue, 26 Apr 2022 13:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3488710F329;
 Tue, 26 Apr 2022 13:22:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id i19so4364154eja.11;
 Tue, 26 Apr 2022 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/98pg8hSnef8YgwtgSLDWBmvtKRG7+Q1mzb/VYFizsE=;
 b=gxe0iaO9WPKnT9nmyTMIRHuKDVHS75AjXdhMoHevdeejjUw0OSl5xCTswsrJessKAM
 vsUz0zH/mYCxhToZFP1DdHwoY0mN2GEFxVa/pcSJzISf40LZQKO73vxdjePNgDWKZqC/
 79qyJ+fjwdBZuRXo2vEa0dBsrYKl2VH1+dTNOedWzxcVuyilE6FyVdxwlct9b9+YWggv
 Qbvb45sXpVyWAekH01MBMuvvpYzrm36sfJg1HEFUL1sJGqSVdZJmYLF8poU9yGlnpCZr
 v136mpzonbWdgaBPYiIFLCiKpPyAFZewWZnYUwIQxP07MHCEDM+jAXQK6CES8iSJ0XAT
 wkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/98pg8hSnef8YgwtgSLDWBmvtKRG7+Q1mzb/VYFizsE=;
 b=br+g3KW8ep+C5wntzoCSjY5cjpZJvsj/YNqoLCYvx0BYPMQ8dyucWf/qTGFJ5It2LZ
 WcAoF4+cat3ATpCfyC1gkz+0JRd+CBsicBxys4M9Oo807fDT3bNhH32AFauPN7QA2v/8
 MregOWQupQ5K7J/xTyvdhUTNEqFmHTZQT5fOhFY767/AKlEIcAdjmUrnHtJxNuTA6RvL
 CH/HCJmNRpf9dPnBDJ4b9arcEIYQRiqCe11sjcC030ERdHzUIPw4OYzhU1+kNMo/KOWN
 MBQorwCGFku5SvAnsXj2EJUK+kmKWMmlWFJjqcNlcu+HuANlOMrwybLyhvLPySyqDQEA
 1kzg==
X-Gm-Message-State: AOAM533aB1KUuJyIshuPxj12kBCgucgIO29/zDGO66Knb+Qu2/G4vQhm
 FvS7MmhlPN9drv1T6tbaXqPkxLVUaR4=
X-Google-Smtp-Source: ABdhPJxMKkSseWmYvmQugJMJ9ppZIWTvo6M5gdnxsGCuhIAIMS8DBC/L9lsu20yeZLbzzETOIfzp8A==
X-Received: by 2002:a17:906:6841:b0:6cf:9c02:8965 with SMTP id
 a1-20020a170906684100b006cf9c028965mr20957616ejs.440.1650979340661; 
 Tue, 26 Apr 2022 06:22:20 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a1709060ee100b006e8a49f215dsm4889914eji.73.2022.04.26.06.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:22:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/amdgpu: use drm_exec for GEM and CSA handling
Date: Tue, 26 Apr 2022 15:22:07 +0200
Message-Id: <20220426132208.20801-5-christian.koenig@amd.com>
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

