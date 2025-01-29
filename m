Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1423A2204B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 16:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0F810E821;
	Wed, 29 Jan 2025 15:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WewLZ/QD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59DC10E81B;
 Wed, 29 Jan 2025 15:28:53 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso79575145e9.2; 
 Wed, 29 Jan 2025 07:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738164532; x=1738769332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UFnAOzI6LRp9h4tf2slqgF3xBjZO6jkaEQzaSMIlNNQ=;
 b=WewLZ/QDBmCj/nvufu5vZ4dS0+NUqcNdRji/RXZgaLw9HWDEBK+o0mlqqIL7VjsvzZ
 ez57eF4/5gp1wcwUTWHprljCpKQWnNhgsrQaN/X1uY89La1IJCMRshq6LdaTFkXEG5EI
 1X/IWW1sd1CKAUe8Rc1C++6a7m/D7x1/06TeWtRgNy4R8pBibGmzroi/fjsk6R3lB1Ht
 swSZhWl1F/kIQoLdhIsvYMXGTUXULZejCFz8/3lN2OCpQgAqzpdkVCjhSkwoejOzhFS1
 6Mw2AvZT75smMGwL0qp9qlZ7yYBX9S7Vu2PesgNmCkv+g/fB3kr+SakOhEjKjmTn5Eje
 9ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738164532; x=1738769332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFnAOzI6LRp9h4tf2slqgF3xBjZO6jkaEQzaSMIlNNQ=;
 b=wIz2ij5eEtqEhmavhblTOY7iZxRn6mO/N3NpLPG2y3K+BkFA51ZrzqftbdAt+4T8+1
 buLJurovRH9EqECujA7BsM7V8Ke+eH22dKXE6oV2Kg60JVHHKQaBC02/0O6nP2y7s42I
 rRRrN4s3ytGWsMlTYA6JgRu+TqUT9OpedL54A8+12TqLnSIQlGKHjtQjpAk1uBICIaU+
 9eSwwuPR410lagszYI4U35Ti4qqGWX9NNaUcbK9otFilJx30oQnVan9joWXBVslE13TS
 v59t52h7bfEfh7oA0ZX9F7+KUP6MlkzfYZrg9IXfUGu8Xka3xEkPWHB5p/YKiN966GHc
 BLXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3MR/KxaHu3z4TZ82GVh42lupPIn4TGc4DojcEDg+irB7Zyd2K8oFtfpbj3tIRUoMnHuBe+tWiXtQy@lists.freedesktop.org,
 AJvYcCWdQ493g/1ADARZyXNY+IKCwgSOAoAb/3G2hLYOpPIkIkwi4QnYtMiy68dHmTG3X3Wkt6GvkEnw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+MEET7ftMxgD4AXRmtSt1k80L6Vv28/wbgqNPE88kibebM/ES
 JocNONcVuYrwruSsuZqy8+jiUnVdgE9n5Qfl/HARr6JNQZQ2tuow
X-Gm-Gg: ASbGncuYn6GRppKPoUcPHe+oHWTm9v5FVPyHKXx2q043zVoToLEPRqoIhVRvKrPtQA0
 W/ggXrzYt33gy0jZyqBrCikL/3hCd1p35TVNMKBKEmL+SzPzJl6bEsMJ3wkBJmVUm4Q1EcA3+mb
 QYLja+1sXZytCHbNqy6SaXugdRU2S/GReKLYiv426vDpK6dBLwRRUXISoYG0z+X4Fu8BLiMPZmr
 HbgkQLLyR7uRrIZ8c1hpjC7miJDlzx9BGVeldiurz8yyfnYMd6GYVZob1VSDiyeqVCuo5Y1ATby
 Smgmuk0VuRI6ozXxacaDduvyGOQr
X-Google-Smtp-Source: AGHT+IHxdTUxEELokA28m3LbW+4K5I7/GSWqeeD/YfRkam6CLVUUSeKxkIOqwyDH1wJNjsBlZsJJVw==
X-Received: by 2002:a05:600c:348c:b0:436:18e5:6917 with SMTP id
 5b1f17b1804b1-438dc34c0a9mr33093315e9.0.1738164531847; 
 Wed, 29 Jan 2025 07:28:51 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:155e:6600:f980:913c:b763:f23d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc1317fsm27280455e9.8.2025.01.29.07.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 07:28:51 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: James.Zhu@amd.com, Felix.Kuehling@amd.com, Philip.Yang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: remove all KFD fences from the BO on release
Date: Wed, 29 Jan 2025 16:28:49 +0100
Message-Id: <20250129152849.15777-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129152849.15777-1-christian.koenig@amd.com>
References: <20250129152849.15777-1-christian.koenig@amd.com>
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

Remove all KFD BOs from the private dma_resv object.

This prevents the KFD from being evitec unecessarily when an exported BO
is released.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 52 ++++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 38 ++++++++------
 3 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 4b80ad860639..62917f76da33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -192,7 +192,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
 #if IS_ENABLED(CONFIG_HSA_AMD)
 bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
-int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo);
+void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
 int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
 				unsigned long cur_seq, struct kgd_mem *mem);
 int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
@@ -212,9 +212,8 @@ struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
 }
 
 static inline
-int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo)
+void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo)
 {
-	return 0;
 }
 
 static inline
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index f30548f4c3b3..609b27fe1cda 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -370,40 +370,32 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	return 0;
 }
 
-int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo)
+/**
+ * amdgpu_amdkfd_remove_all_eviction_fences - Remove all eviction fences
+ * @bo: the BO where to remove the evictions fences from.
+ *
+ * This functions should only be used on release when all references to the BO
+ * are already dropped. We remove the eviction fence from the private copy of
+ * the dma_resv object here since that is what is used during release to
+ * determine of the BO is idle or not.
+ */
+void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo)
 {
-	struct amdgpu_bo *root = bo;
-	struct amdgpu_vm_bo_base *vm_bo;
-	struct amdgpu_vm *vm;
-	struct amdkfd_process_info *info;
-	struct amdgpu_amdkfd_fence *ef;
-	int ret;
-
-	/* we can always get vm_bo from root PD bo.*/
-	while (root->parent)
-		root = root->parent;
+	struct dma_resv *resv = &bo->tbo.base._resv;
+	struct dma_fence *fence, *stub;
+	struct dma_resv_iter cursor;
 
-	vm_bo = root->vm_bo;
-	if (!vm_bo)
-		return 0;
+	dma_resv_assert_held(resv);
 
-	vm = vm_bo->vm;
-	if (!vm)
-		return 0;
-
-	info = vm->process_info;
-	if (!info || !info->eviction_fence)
-		return 0;
-
-	ef = container_of(dma_fence_get(&info->eviction_fence->base),
-			struct amdgpu_amdkfd_fence, base);
-
-	BUG_ON(!dma_resv_trylock(bo->tbo.base.resv));
-	ret = amdgpu_amdkfd_remove_eviction_fence(bo, ef);
-	dma_resv_unlock(bo->tbo.base.resv);
+	stub = dma_fence_get_stub();
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, fence) {
+		if (!to_amdgpu_amdkfd_fence(fence))
+			continue;
 
-	dma_fence_put(&ef->base);
-	return ret;
+		dma_resv_replace_fences(resv, fence->context, stub,
+					DMA_RESV_USAGE_BOOKKEEP);
+	}
+	dma_fence_put(stub);
 }
 
 static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index fc94b8b9b86d..d12be7a1eb6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1194,28 +1194,36 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (abo->kfd_bo)
 		amdgpu_amdkfd_release_notify(abo);
 
-	/* We only remove the fence if the resv has individualized. */
-	WARN_ON_ONCE(bo->type == ttm_bo_type_kernel
-			&& bo->base.resv != &bo->base._resv);
-	if (bo->base.resv == &bo->base._resv)
-		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
+	/*
+	 * We lock the private dma_resv object here and since the BO is about to
+	 * be released nobody else should have a pointer to it.
+	 * So when this locking here fails something is wrong with the reference
+	 * counting.
+	 */
+	if (WARN_ON_ONCE(!dma_resv_trylock(&bo->base._resv)))
+		return;
+
+	amdgpu_amdkfd_remove_all_eviction_fences(abo);
 
 	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
 	    adev->in_suspend || drm_dev_is_unplugged(adev_to_drm(adev)))
-		return;
+		goto out;
 
-	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
-		return;
+	r = dma_resv_reserve_fences(&bo->base._resv, 1);
+	if (r)
+		goto out;
 
-	r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
-	if (!WARN_ON(r)) {
-		amdgpu_vram_mgr_set_cleared(bo->resource);
-		amdgpu_bo_fence(abo, fence, false);
-		dma_fence_put(fence);
-	}
+	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
+	if (WARN_ON(r))
+		goto out;
+
+	amdgpu_vram_mgr_set_cleared(bo->resource);
+	dma_resv_add_fence(&bo->base._resv, fence, DMA_RESV_USAGE_KERNEL);
+	dma_fence_put(fence);
 
-	dma_resv_unlock(bo->base.resv);
+out:
+	dma_resv_unlock(&bo->base._resv);
 }
 
 /**
-- 
2.34.1

