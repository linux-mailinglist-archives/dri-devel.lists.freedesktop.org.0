Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF86A5478
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0F10E657;
	Tue, 28 Feb 2023 08:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079C10E641;
 Tue, 28 Feb 2023 08:34:15 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eg37so36387657edb.12;
 Tue, 28 Feb 2023 00:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7mi95YwcJWHbZuY10t5rp9JU/rAQHm+Y4I/jOyv4Qg=;
 b=UxST0pCL2g5/1JoCdsj2gYJ91cHarOqJHCHAoNILh8uO8DcQDhMHC6/uW6n1BwG/qY
 3/6gDN5GXSp6zeBX8gYhL4yed23kHivTJaBJVDhvLBmMndTu0hOjvLVOenrwc1ZCwk/a
 qZVXJMWW3FCZ1cJlaDaj4uEhW923fE+gdaz5eznjCcZA9Zrh80VMOV8aJ7MPmUDLCYjr
 9Rn6P2aFb2D2lG6eKjoyPii5bjbTwxDDNc9AblUGOgtQkbC8pUjAquzqdYJiSLsKGobb
 IWy739dvcs18qmgQGE6Fnq5THncKANAceomavPfnW3XJaJnfVi76uI5eaDGkB4OO1fwZ
 rKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7mi95YwcJWHbZuY10t5rp9JU/rAQHm+Y4I/jOyv4Qg=;
 b=Krd12w0V+0XyIuWhX+/rvpDU0k35tLQ9KFzXwSc85H6jO0qX5eUngOs74bNqSHKhQD
 P4k9LJO/0Ma3EwhfTgvP8wMhEe+R8SOrw2UCUYYS++yYPAkKbq6+j2XaQQnsqXOI0Rd5
 zn1PmxMG6ft46U6KBFjek/fh9xZaUpbgxGtSN8FGbN4FnE7I3wCbuD/lUn53GmFh0dG+
 C0GJO3MTc/pBzHp0fvgJZ7z13LiZWVXJ7DbWETF6/2ebC8JEYKeKBDZiKxto3yBmfJpc
 Ti9gpHQgBDww2V7Mr5ZFMWjqUeUSZM5Df5lGUAOS9VAAHb1V9G0W4yjFchr+XoYbydM8
 NXMg==
X-Gm-Message-State: AO0yUKWJOXGIMPXS9IaXOqbjtvXtAvM9WKVEcgX6T+h4bk/9ULXV8mcV
 jO1T6sg5VcI3j329mFxaa5o0Ko5kHgs=
X-Google-Smtp-Source: AK7set8SXpelyhWX7xenOfJenxE6twwqSjAFV2mv66gx9WfUH20NgntoYeYdUtKAdJKv9aBr/29h5A==
X-Received: by 2002:a17:906:39ca:b0:87f:89f2:c012 with SMTP id
 i10-20020a17090639ca00b0087f89f2c012mr1564169eje.24.1677573255156; 
 Tue, 28 Feb 2023 00:34:15 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ss17-20020a170907039100b008cf6f8798e1sm4296969ejb.54.2023.02.28.00.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:34:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/amdgpu: use drm_exec for MES testing
Date: Tue, 28 Feb 2023 09:34:02 +0100
Message-Id: <20230228083406.1720795-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228083406.1720795-1-christian.koenig@amd.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
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
Cc: dakr@redhat.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start using the new component here as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 86 +++++++++++--------------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 82e27bd4f038..95292a65fd25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -22,6 +22,7 @@
  */
 
 #include <linux/firmware.h>
+#include <drm/drm_exec.h>
 
 #include "amdgpu_mes.h"
 #include "amdgpu.h"
@@ -1126,34 +1127,29 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
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
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		r = drm_exec_prepare_obj(&exec,
+					 &ctx_data->meta_data_obj->tbo.base,
+					 0);
+		if (likely(!r))
+			r = amdgpu_vm_lock_pd(vm, &exec);
+		drm_exec_continue_on_contention(&exec);
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
@@ -1163,33 +1159,35 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 
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
@@ -1200,34 +1198,28 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
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
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		r = drm_exec_prepare_obj(&exec,
+					 &ctx_data->meta_data_obj->tbo.base,
+					 0);
+		if (likely(!r))
+			r = amdgpu_vm_lock_pd(vm, &exec);
+		drm_exec_continue_on_contention(&exec);
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
@@ -1246,7 +1238,7 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 out_unlock:
 	if (unlikely(r < 0))
 		dev_err(adev->dev, "failed to clear page tables (%ld)\n", r);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 
 	return r;
 }
-- 
2.34.1

