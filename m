Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F4461486
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C056FA54;
	Mon, 29 Nov 2021 12:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD216FA54
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a18so36284910wrn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QADmDIJ6uafvkbWTgBnifMSyLYGo2GFMs8el97OfdE=;
 b=dnKpofsBRMsUDAUb2JIJjkS6vC9U6IDxnTssoitwG0AP5JGHvrZOmiPlbIV/q3wn0O
 9/9Lg4MzmlAwOorvqfup6d8ZzkgyIuSpX3e+KbviQT/qQ20XlVz6eG062A5IrzvikXah
 QX+nJ14AKb9msY0GW6Rt8q+oxTpIdoltC2d9UxbJsiU0Sav7KgfPf6wZiADLi3nI6Fgr
 Q5aLh9dltY3UJe3wbUzU9f1bML8PxGB5qCbhLutT25uYx5QsgTFEzr8ImAp6t8vP/JML
 MaWd8OOm8OLR+nLuP5O2leR+jxg1p1wf+QZGvW/9uEU5F6qB3JSLKkDs8f5XJojdfoOe
 Zmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QADmDIJ6uafvkbWTgBnifMSyLYGo2GFMs8el97OfdE=;
 b=zDL7zzkj82UdTsfRVv3uDttWeHkeI1Qwxe+iYg3FVEd8v1NSL2CZCzxtChsuGJi714
 QLZSVy6qhNV+0VxprkenRyZ/51bqGmjiP/ZlWonMUHXJJKV/vUlMgloG7zlrhcd//kT7
 TstuWF3w1R/ttRYpzx2BtFls7ObvmXxmEqAjJseAX4cuG41ptN61Cvxm1eUm3Y3NQX8W
 i7SPcHbCzhu8A69CYvA6JOYvX0sIZ9tKvwRu5UIfgZZDwbWoA/s4DP/i/TVX1QrcnGrT
 StqoFxd0GO6VOlqnTp0w1Jg89IDBMzk1tytGut8mSI9xhgW/J0TN44r+UprpFpzICoCO
 nklg==
X-Gm-Message-State: AOAM531cXlIsZWgQJEWGeRUfrrZfPNtiiZ4clPBvquaLnh6zUFtEgFhW
 4k58+N9ZxuFUDSRPvIiFC4M=
X-Google-Smtp-Source: ABdhPJxjiZnvdza2N79CcoURnlCo5mu2gBFnj2KSL1PgfKAxyannBdhaGEomOA/bnawDW5jVQdh0Ug==
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr33972446wrt.413.1638187627485; 
 Mon, 29 Nov 2021 04:07:07 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:07 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 05/28] dma-buf: add dma_resv_replace_fences
Date: Mon, 29 Nov 2021 13:06:36 +0100
Message-Id: <20211129120659.1815-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function allows to replace fences from the shared fence list when
we can gurantee that the operation represented by the original fence has
finished or no accesses to the resources protected by the dma_resv
object any more when the new fence finishes.

Then use this function in the amdkfd code when BOs are unmapped from the
process.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    | 43 ++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
 include/linux/dma-resv.h                      |  2 +
 3 files changed, 52 insertions(+), 42 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 4deea75c0b9c..a688dbded3d3 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -284,6 +284,49 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_shared_fence);
 
+/**
+ * dma_resv_replace_fences - replace fences in the dma_resv obj
+ * @obj: the reservation object
+ * @context: the context of the fences to replace
+ * @replacement: the new fence to use instead
+ *
+ * Replace fences with a specified context with a new fence. Only valid if the
+ * operation represented by the original fences is completed or has no longer
+ * access to the resources protected by the dma_resv object when the new fence
+ * completes.
+ */
+void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
+			     struct dma_fence *replacement)
+{
+	struct dma_resv_list *list;
+	struct dma_fence *old;
+	unsigned int i;
+
+	dma_resv_assert_held(obj);
+
+	write_seqcount_begin(&obj->seq);
+
+	old = dma_resv_excl_fence(obj);
+	if (old->context == context) {
+		RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
+		dma_fence_put(old);
+	}
+
+	list = dma_resv_shared_list(obj);
+	for (i = 0; list && i < list->shared_count; ++i) {
+		old = rcu_dereference_protected(list->shared[i],
+						dma_resv_held(obj));
+		if (old->context != context)
+			continue;
+
+		rcu_assign_pointer(list->shared[i], dma_fence_get(replacement));
+		dma_fence_put(old);
+	}
+
+	write_seqcount_end(&obj->seq);
+}
+EXPORT_SYMBOL(dma_resv_replace_fences);
+
 /**
  * dma_resv_add_excl_fence - Add an exclusive fence.
  * @obj: the reservation object
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 71acd577803e..b558ef0f8c4a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -236,53 +236,18 @@ void amdgpu_amdkfd_release_notify(struct amdgpu_bo *bo)
 static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 					struct amdgpu_amdkfd_fence *ef)
 {
-	struct dma_resv *resv = bo->tbo.base.resv;
-	struct dma_resv_list *old, *new;
-	unsigned int i, j, k;
+	struct dma_fence *replacement;
 
 	if (!ef)
 		return -EINVAL;
 
-	old = dma_resv_shared_list(resv);
-	if (!old)
-		return 0;
-
-	new = kmalloc(struct_size(new, shared, old->shared_max), GFP_KERNEL);
-	if (!new)
-		return -ENOMEM;
-
-	/* Go through all the shared fences in the resevation object and sort
-	 * the interesting ones to the end of the list.
+	/* TODO: Instead of block before we should use the fence of the page
+	 * table update and TLB flush here directly.
 	 */
-	for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; ++i) {
-		struct dma_fence *f;
-
-		f = rcu_dereference_protected(old->shared[i],
-					      dma_resv_held(resv));
-
-		if (f->context == ef->base.context)
-			RCU_INIT_POINTER(new->shared[--j], f);
-		else
-			RCU_INIT_POINTER(new->shared[k++], f);
-	}
-	new->shared_max = old->shared_max;
-	new->shared_count = k;
-
-	/* Install the new fence list, seqcount provides the barriers */
-	write_seqcount_begin(&resv->seq);
-	RCU_INIT_POINTER(resv->fence, new);
-	write_seqcount_end(&resv->seq);
-
-	/* Drop the references to the removed fences or move them to ef_list */
-	for (i = j; i < old->shared_count; ++i) {
-		struct dma_fence *f;
-
-		f = rcu_dereference_protected(new->shared[i],
-					      dma_resv_held(resv));
-		dma_fence_put(f);
-	}
-	kfree_rcu(old, rcu);
-
+	replacement = dma_fence_get_stub();
+	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
+				replacement);
+	dma_fence_put(replacement);
 	return 0;
 }
 
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index eebf04325b34..e0be34265eae 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -457,6 +457,8 @@ void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
+void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
+			     struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 			unsigned *pshared_count, struct dma_fence ***pshared);
-- 
2.25.1

