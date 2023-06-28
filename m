Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D03E740F1D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 12:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E1710E370;
	Wed, 28 Jun 2023 10:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CE010E0F0;
 Wed, 28 Jun 2023 10:44:55 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51d805cb33aso5862604a12.3; 
 Wed, 28 Jun 2023 03:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687949093; x=1690541093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=POKyD2TWf5iHX2y36QjF2En4p5m7c9J1R21h2hdc4kM=;
 b=S5JEU05c4JQV5CCz0hgtaK4tg27fz5SkS86mYJeKJ28uNl1v43z09gRf+Tehgu0u3x
 ezwRUVBlz/UEDcmWnD43Fi4g6uhhO912dp15DgY0FqEn15lQHk7X3rGR33fXJHtRNOoE
 UrKsGDwOf3s7eYU5HgcOzKukd0HrkssjuY4WZJb0Fim1q/iLCiDeLBWNxD++Fds8Xh04
 8CTf/S7YiTSI1sIS1Er1tsXM/wASe2fsF314lwXBzhfGLoAiboEo5msDDlkMmEf2ka6m
 /agVfdgu2XvuD/RykcHu8yr4AEiPq5L/La7bYdRm4oy51FbTIFmWfCOBIthXyqUZcXpF
 4SEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687949093; x=1690541093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POKyD2TWf5iHX2y36QjF2En4p5m7c9J1R21h2hdc4kM=;
 b=BEkePkkcjEndbxO7d1tYQlb6uXWBVEybdR9JksbcG8jQHHEocAzbz4wNgVGTk/NvSN
 V38LUUpqyE21PE7+R/PuR2wQbkY6JsnglRDDplMyQV6oZfiE5wElT0NwwO82SFtfZCWH
 PHdYcmWHFXqZ1sZjVS4CKUMf3hjh4aafcOK5tEx+jxjprOnYM8A45PRz23Y+LC15Hfqv
 zkxvVfLeXJPMrlyonjI1PWbVOebnDRZ1XpJunKRyN2+OoFX0NoUNINpPzSrbbgt0Q8L8
 n4eYR3R8plFXjka4UtDwn+COF+WrrHqoapJVZgjSG9wZQWFu5sM8/ybqKNr9XQNTNg7J
 RCug==
X-Gm-Message-State: AC+VfDyzec4ye/kBna5Ee2jvxu2Aw7sgRSczE3/oTaw7pzbSkQWqCfCO
 XwoN3i1oL/EBfbpexvIH80C0/GDQ1Hk=
X-Google-Smtp-Source: ACHHUZ46lMEi6MIhypTiQFRCbnUyXjwDwv0qWVGNHh9/HXre94a12DqMDTgba0axWs0A9ap87Y4i+A==
X-Received: by 2002:aa7:d058:0:b0:51d:9f6b:1b96 with SMTP id
 n24-20020aa7d058000000b0051d9f6b1b96mr4645529edo.40.1687949092892; 
 Wed, 28 Jun 2023 03:44:52 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15a4:6600:e1e8:ea62:da3f:c009])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056402515200b0051d9580b00esm3463537edd.11.2023.06.28.03.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 03:44:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Subject: [PATCH 5/6] drm/amdgpu: use drm_exec for MES testing
Date: Wed, 28 Jun 2023 12:44:45 +0200
Message-Id: <20230628104446.1369-6-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 90 ++++++++++++-------------
 1 file changed, 43 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index e9091ebfe230..bc28ce15b70d 100644
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
+                if (unlikely(r))
+			goto error_fini_exec;
+
+		r = amdgpu_vm_lock_pd(vm, &exec, 0);
+		drm_exec_retry_on_contention(&exec);
+                if (unlikely(r))
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
+                if (unlikely(r))
+			goto out_unlock;
+
+		r = amdgpu_vm_lock_pd(vm, &exec, 0);
+		drm_exec_retry_on_contention(&exec);
+                if (unlikely(r))
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

