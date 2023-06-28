Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54503740F1F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 12:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4266610E374;
	Wed, 28 Jun 2023 10:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB4710E0F0;
 Wed, 28 Jun 2023 10:44:54 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b6b98ac328so14032061fa.0; 
 Wed, 28 Jun 2023 03:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687949092; x=1690541092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p0oW2q6azBGKtfRt1x4tFj1UvR4WLKBBFat1fkERR2o=;
 b=Xvhix+tU0PayN59WP99QcVYoNheWxLMqsBb8odaL2etPV0uR9JY3SNzFkTjMkjmfsh
 ZqOrAfDvq6S3slrzN6I/hybcLv+JJsUVImKpPnIfnXcpeGwI1n2YAJpVKzM6sgF3sPqU
 HNd8k4us6kO+hO8D8OfWFtMhpnrYazFPDKiCs5AnB1YDV2BRFtlXfbG6dn/DfNj4xopU
 v8eMV9pHz9FuwqY49dOlEI2QszEJhfOTudcsmg/q9KlIkOkYINk8UkzRKX8oXwsKdvB6
 +r5Fga3qj3k0QnHG8DXV8KlyaSxQeU+IW/ApXUe521f1JsdHhAnUKJsvaOY/GQNTBiJZ
 mC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687949092; x=1690541092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0oW2q6azBGKtfRt1x4tFj1UvR4WLKBBFat1fkERR2o=;
 b=BO1fOJfcR6NOG3Cecy9v2wJPpmRDcmy7WZyADCuuFO8JOw/0cViK96GBwdP8g209C+
 QEhf1OGJeVlzvMH+6E3sgLx55W6C5xkk9dFwDrqe3ektQZNwlWwRKAkjaMQ5JXWLhnb3
 1w6GPcRpbMW+e4tqwBb4WoGUXo60tAVNmkDDUwL60c/kASNorHS7MumRBKR2zuDYRxcW
 jMsJJjA9ge3mYz4aRQRjiR3Jqtw26ZTMqWyH5jMKejKIirWYSio+yFuQsEbSMz9KNMI9
 LO8riii4bdKVJWpKUWqxeRGvdzWjyrOGagHmJbXHiuC7X0NHUkV2jXbXi6TFsGnQQ3eZ
 jZAg==
X-Gm-Message-State: AC+VfDx8FeI5unt3J8UXppJX9dLD7aiDtcbGj5gsQTq/59Abpq5zjMCX
 oTDgXaMfaVgD38gfeAi+/VoCJeal8Do=
X-Google-Smtp-Source: ACHHUZ6T5EthyDHKd1miRy8r9divgRG9Q+0S6rkYMcQNj8j+wEpptQxSFr3VDPRM/Ty1Y7QTGODkaw==
X-Received: by 2002:a2e:9bd4:0:b0:2b6:9f0d:86df with SMTP id
 w20-20020a2e9bd4000000b002b69f0d86dfmr6549641ljj.31.1687949092091; 
 Wed, 28 Jun 2023 03:44:52 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15a4:6600:e1e8:ea62:da3f:c009])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056402515200b0051d9580b00esm3463537edd.11.2023.06.28.03.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 03:44:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Subject: [PATCH 4/6] drm/amdgpu: use drm_exec for GEM and CSA handling
Date: Wed, 28 Jun 2023 12:44:44 +0200
Message-Id: <20230628104446.1369-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628104446.1369-1-christian.koenig@amd.com>
References: <20230628104446.1369-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c | 78 +++++++++++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 80 ++++++++++++-------------
 2 files changed, 71 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index 23d054526e7c..720011019741 100644
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
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec) {
+		r = amdgpu_vm_lock_pd(vm, &exec, 0);
+		if (likely(!r))
+			r = drm_exec_lock_obj(&exec, &bo->tbo.base);
+		drm_exec_retry_on_contention(&exec);
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
@@ -99,48 +95,42 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
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
 
 int amdgpu_unmap_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			    struct amdgpu_bo *bo, struct amdgpu_bo_va *bo_va,
 			    uint64_t csa_addr)
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
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec) {
+		r = amdgpu_vm_lock_pd(vm, &exec, 0);
+		if (likely(!r))
+			r = drm_exec_lock_obj(&exec, &bo->tbo.base);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(r)) {
+			DRM_ERROR("failed to reserve CSA,PD BOs: err=%d\n", r);
+			goto error;
+		}
 	}
 
 	r = amdgpu_vm_bo_unmap(adev, bo_va, csa_addr);
 	if (r) {
 		DRM_ERROR("failed to do bo_unmap on static CSA, err=%d\n", r);
-		ttm_eu_backoff_reservation(&ticket, &list);
-		return r;
+		goto error;
 	}
 
 	amdgpu_vm_bo_del(adev, bo_va);
 
-	ttm_eu_backoff_reservation(&ticket, &list);
-
-	return 0;
+error:
+	drm_exec_fini(&exec);
+	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 74055cba3dc9..6811fc866494 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -33,6 +33,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/ttm/ttm_tt.h>
 
@@ -198,29 +199,24 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
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
+	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
+	drm_exec_until_all_locked(&exec) {
+		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(r))
+			goto out_unlock;
+
+		r = amdgpu_vm_lock_pd(vm, &exec, 0);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(r))
+			goto out_unlock;
 	}
+
 	bo_va = amdgpu_vm_bo_find(vm, bo);
 	if (!bo_va || --bo_va->ref_count)
 		goto out_unlock;
@@ -230,6 +226,9 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 		goto out_unlock;
 
 	r = amdgpu_vm_clear_freed(adev, vm, &fence);
+	if (unlikely(r < 0))
+		dev_err(adev->dev, "failed to clear page "
+			"tables on GEM object close (%ld)\n", r);
 	if (r || !fence)
 		goto out_unlock;
 
@@ -237,10 +236,9 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	dma_fence_put(fence);
 
 out_unlock:
-	if (unlikely(r < 0))
-		dev_err(adev->dev, "failed to clear page "
-			"tables on GEM object close (%ld)\n", r);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	if (r)
+		dev_err(adev->dev, "leaking bo va (%ld)\n", r);
+	drm_exec_fini(&exec);
 }
 
 static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
@@ -675,10 +673,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
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
@@ -728,36 +723,37 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
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
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec) {
+		if (gobj) {
+			r = drm_exec_lock_obj(&exec, gobj);
+			drm_exec_retry_on_contention(&exec);
+			if (unlikely(r))
+				goto error;
+		}
 
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, &duplicates);
-	if (r)
-		goto error_unref;
+		r = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
+		drm_exec_retry_on_contention(&exec);
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
@@ -794,10 +790,8 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
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

