Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0C474F031
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44D10E396;
	Tue, 11 Jul 2023 13:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A8D10E38E;
 Tue, 11 Jul 2023 13:31:31 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e57870becso2954248a12.2; 
 Tue, 11 Jul 2023 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689082289; x=1691674289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ilgTrSNlmUYsHrWn+5bQ2FFg0cWYUcfgMI/Lgfzfbbk=;
 b=VyTmH4qz4T+YDcv6Q7LPd7oG8jyDGbz9sJTdM+I3weoEjrUpw9sYUdAN1vZpbi2tbk
 SVAT6C9ALJHN19Q33Z60c2G8n+lyg7XpOQ59p5WSk5JYa6iZHQc9hXMmR3VDFnzRuO52
 Yn4Ds6jmRRLsIUYxLG9zWCQ0sQu5XwrK8wwNx7CaFbGkchncQ4gVsMXT56YGOm+HCtqc
 tRGmaD6ENlhgCuto4iSMcMJUnnN9NDeypKBNjM4HruDawA6Jd7F1cSVynbO9YePHl28n
 i2I5oAwfiUhEFuKfespEh5N3MPP0Y7SOJFw/2SYa7/yHRdbvE1IKOHmMgYPbKO+K2fGk
 Ve1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689082289; x=1691674289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ilgTrSNlmUYsHrWn+5bQ2FFg0cWYUcfgMI/Lgfzfbbk=;
 b=Q0y+aDbWdsc+SusuTfr1S5HCqkMVdnEXmIXJbu8UcloyLp72Ooi/fjWt1+sKKK7jbu
 8e0bS5mONLOXius5+AetbV662jM0ySC8rkD6mH15aEo0AgAs6WOyEIhVlAW5kbaiUbUd
 iWAFW4IlLrp5pa4c3qhUoljDK6rO4iKXFQCrk5PpWPIhEABTOdMesaHFofNBwvt93Tp7
 x4KAgrOJ3FOrFM93mV9Yk6Dp3R1vjBLq4EzZnz5nYiq/aePp0xGTAeu35wffl8N2VNlz
 0gDAPrOByyDzoF28smM/Do/T5BXSbHZzcSdyLnTQ7+YtnbSFIqTuzknFc0YyPQVO9sCz
 Nb4A==
X-Gm-Message-State: ABy/qLbCdSq+w7Q3pl6o8yTMSQKiGgO3XcMTy9uNVVWBqVUnRZ6lqvLM
 B4rJAly3uaTEQ/47Di+drably+HSFMU=
X-Google-Smtp-Source: APBJJlHzzdNqMaQvZu+9vanCtOHBssZk1dF2gPjVRa/Zd3IyOqR/xP82zpQFeRgF0DrZ0OyyMxfHtQ==
X-Received: by 2002:a17:906:2097:b0:993:f349:c98d with SMTP id
 23-20020a170906209700b00993f349c98dmr10091722ejq.1.1689082288919; 
 Tue, 11 Jul 2023 06:31:28 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:448d:6e36:e62e:af18])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a1709060d9b00b009932337747esm1176967eji.86.2023.07.11.06.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 06:31:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: alexdeucher@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amdgpu: use drm_exec for MES testing
Date: Tue, 11 Jul 2023 15:31:21 +0200
Message-Id: <20230711133122.3710-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711133122.3710-1-christian.koenig@amd.com>
References: <20230711133122.3710-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 90 ++++++++++++-------------
 1 file changed, 43 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index e9091ebfe230..3e3dadd6d0f3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -22,6 +22,7 @@
  */
 
 #include <linux/firmware.h>
+#include <drm/drm_exec.h>
 
 #include "amdgpu_mes.h"
 #include "amdgpu.h"
@@ -1168,34 +1169,31 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 				 struct amdgpu_mes_ctx_data *ctx_data)
 {
 	struct amdgpu_bo_va *bo_va;
-	struct ww_acquire_ctx ticket;
-	struct list_head list;
-	struct amdgpu_bo_list_entry pd;
-	struct ttm_validate_buffer csa_tv;
 	struct amdgpu_sync sync;
+	struct drm_exec exec;
 	int r;
 
 	amdgpu_sync_create(&sync);
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&csa_tv.head);
 
-	csa_tv.bo = &ctx_data->meta_data_obj->tbo;
-	csa_tv.num_shared = 1;
-
-	list_add(&csa_tv.head, &list);
-	amdgpu_vm_get_pd_bo(vm, &list, &pd);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
-	if (r) {
-		DRM_ERROR("failed to reserve meta data BO: err=%d\n", r);
-		return r;
+	drm_exec_init(&exec, 0);
+	drm_exec_until_all_locked(&exec) {
+		r = drm_exec_lock_obj(&exec,
+				      &ctx_data->meta_data_obj->tbo.base);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(r))
+			goto error_fini_exec;
+
+		r = amdgpu_vm_lock_pd(vm, &exec, 0);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(r))
+			goto error_fini_exec;
 	}
 
 	bo_va = amdgpu_vm_bo_add(adev, vm, ctx_data->meta_data_obj);
 	if (!bo_va) {
-		ttm_eu_backoff_reservation(&ticket, &list);
 		DRM_ERROR("failed to create bo_va for meta data BO\n");
-		return -ENOMEM;
+		r = -ENOMEM;
+		goto error_fini_exec;
 	}
 
 	r = amdgpu_vm_bo_map(adev, bo_va, ctx_data->meta_data_gpu_addr, 0,
@@ -1205,33 +1203,35 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 
 	if (r) {
 		DRM_ERROR("failed to do bo_map on meta data, err=%d\n", r);
-		goto error;
+		goto error_del_bo_va;
 	}
 
 	r = amdgpu_vm_bo_update(adev, bo_va, false);
 	if (r) {
 		DRM_ERROR("failed to do vm_bo_update on meta data\n");
-		goto error;
+		goto error_del_bo_va;
 	}
 	amdgpu_sync_fence(&sync, bo_va->last_pt_update);
 
 	r = amdgpu_vm_update_pdes(adev, vm, false);
 	if (r) {
 		DRM_ERROR("failed to update pdes on meta data\n");
-		goto error;
+		goto error_del_bo_va;
 	}
 	amdgpu_sync_fence(&sync, vm->last_update);
 
 	amdgpu_sync_wait(&sync, false);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 
 	amdgpu_sync_free(&sync);
 	ctx_data->meta_data_va = bo_va;
 	return 0;
 
-error:
+error_del_bo_va:
 	amdgpu_vm_bo_del(adev, bo_va);
-	ttm_eu_backoff_reservation(&ticket, &list);
+
+error_fini_exec:
+	drm_exec_fini(&exec);
 	amdgpu_sync_free(&sync);
 	return r;
 }
@@ -1242,34 +1242,30 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 	struct amdgpu_bo_va *bo_va = ctx_data->meta_data_va;
 	struct amdgpu_bo *bo = ctx_data->meta_data_obj;
 	struct amdgpu_vm *vm = bo_va->base.vm;
-	struct amdgpu_bo_list_entry vm_pd;
-	struct list_head list, duplicates;
-	struct dma_fence *fence = NULL;
-	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
-	long r = 0;
-
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
-		return r;
+	struct dma_fence *fence;
+	struct drm_exec exec;
+	long r;
+
+	drm_exec_init(&exec, 0);
+	drm_exec_until_all_locked(&exec) {
+		r = drm_exec_lock_obj(&exec,
+				      &ctx_data->meta_data_obj->tbo.base);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(r))
+			goto out_unlock;
+
+		r = amdgpu_vm_lock_pd(vm, &exec, 0);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(r))
+			goto out_unlock;
 	}
 
 	amdgpu_vm_bo_del(adev, bo_va);
 	if (!amdgpu_vm_ready(vm))
 		goto out_unlock;
 
-	r = dma_resv_get_singleton(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP, &fence);
+	r = dma_resv_get_singleton(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
+				   &fence);
 	if (r)
 		goto out_unlock;
 	if (fence) {
@@ -1288,7 +1284,7 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 out_unlock:
 	if (unlikely(r < 0))
 		dev_err(adev->dev, "failed to clear page tables (%ld)\n", r);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 
 	return r;
 }
-- 
2.34.1

