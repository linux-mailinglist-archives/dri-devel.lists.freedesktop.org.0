Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4ED382EE9
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FC96E97C;
	Mon, 17 May 2021 14:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D986E975
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:39 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t3so7080427edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4hl9LkBgTDZNkghancY8GMhZ7O5I9+El9vsdiOcuPs=;
 b=fQYGVX27EksNkiUL50HJSzt8F8u/lV9cFzhRPdpd5WR+9YpLf14V14Yg8PaBENLd1P
 pZarVPKO5mUrblTT0gaA1JM9KrL6xbHyeIG8NeHvWN85qmUYyR83xug4NrLxK8bIFZN6
 oSdL9hSMrNIkUEFtdhu52rTM3qt1Q7tYDsF0HAeUYzxuEb8f4cB+zih720g3m9UjLu9A
 vkZsd0PHYL+EByTXUxtYoOLpaoQe+++VT0/eabIaFWHlNTFA0croe8msRC94XJqK4Ldl
 Qb0vU4fkohFG7kwj4AMHG3YFOflfyvjIAHogoWuS6s+twzFp4ObDQMIAoo0QXwG8OtYQ
 1ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4hl9LkBgTDZNkghancY8GMhZ7O5I9+El9vsdiOcuPs=;
 b=ldXz4J9HurfiRTdUcxaWvNhrYEObRFSGA1yRkba6/JuAwTBnhHyFbHEHyOvxZ6dg1A
 16+a+zzZ1NC+XBTNGStK3OM7VhKOVEh23ay1NAkAlXaYsiIcZ+Qe55Um7ULzsXyYc0OZ
 OwkEUS9eDZOeh3cawxONzLgZxtwkvqwanbj56AvWyHPko8o4pBvozNs+q2QHS3v6b9xW
 d1208hnbeqNTxJ3wAPkFun+kBUoQZrU5TDwnlcXAq3ifvOJ4Nc5PN7Nf24CsTYalxnZH
 nwBxmkYiAhDt2n2rRPj/y5etCgQAcXYnFV4hEHISSv0OLNnLeCQMSxwBYbQDKbrDQ/ry
 Le+g==
X-Gm-Message-State: AOAM5330Le4Q4GBSPGrg+Am4Y/vNJ4ulMhzotSBy/Kjc+oCpaadYrWR4
 WC7sbqFzMgwsnDYKVxHmSpJXbYUrd+0=
X-Google-Smtp-Source: ABdhPJwJxRiQ2VXhLfy1TnjKY0TKGbkjj5BbUI0wCivWgnx6HJdVqJ10imCzJ/2CcwMzRlk/cITgGA==
X-Received: by 2002:aa7:d9c8:: with SMTP id v8mr272876eds.186.1621260697774;
 Mon, 17 May 2021 07:11:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/11] dma-buf: add dma_resv_replace_shared
Date: Mon, 17 May 2021 16:11:25 +0200
Message-Id: <20210517141129.2225-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517141129.2225-1-christian.koenig@amd.com>
References: <20210517141129.2225-1-christian.koenig@amd.com>
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

This function allows to replace fences from the shared fence list when
we can gurantee that the operation represented by the original fence has
finished or no accesses to the resources protected by the dma_resv
object any more when the new fence finishes.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    | 38 +++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 47 ++-----------------
 include/linux/dma-resv.h                      |  2 +
 3 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 49f3c1009821..5703e328b8ac 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -281,6 +281,44 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_shared_fence);
 
+/**
+ * dma_resv_replace_shared - replace shared fences
+ * @obj: the reservation object
+ * @context: the context of the fences to replace
+ * @fence: the new fence to use instead
+ *
+ * Replace fences with a specified context with a new fence. Only valid if the
+ * operation represented by the original fences is completed or has no longer
+ * access to the resources protected by the dma_resv object when the new fence
+ * completes. Takes the reference to the new fence.
+ */
+void dma_resv_replace_shared(struct dma_resv *obj, uint64_t context,
+			     struct dma_fence *fence)
+{
+	struct dma_resv_list *list;
+	unsigned int i;
+
+	list = dma_resv_shared(obj);
+	if (!list) {
+		dma_fence_put(fence);
+		return;
+	}
+
+	write_seqcount_begin(&obj->seq);
+	for (i = 0; i < list->shared_count; ++i) {
+		struct dma_fence *old = dma_resv_list_fence(obj, list, i);
+
+		if (old->context != context)
+			continue;
+
+		rcu_assign_pointer(list->shared[i], dma_fence_get(fence));
+		dma_fence_put(old);
+	}
+	write_seqcount_end(&obj->seq);
+	dma_fence_put(fence);
+}
+EXPORT_SYMBOL(dma_resv_replace_shared);
+
 /**
  * dma_resv_add_excl_fence - Add an exclusive fence.
  * @obj: the reservation object
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 88da0e400406..3e5a681a5482 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -238,53 +238,14 @@ void amdgpu_amdkfd_unreserve_memory_limit(struct amdgpu_bo *bo)
 static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 					struct amdgpu_amdkfd_fence *ef)
 {
-	struct dma_resv *resv = bo->tbo.base.resv;
-	struct dma_resv_list *old, *new;
-	unsigned int i, j, k;
-
 	if (!ef)
 		return -EINVAL;
 
-	old = dma_resv_shared(resv);
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
-	for (i = j, k = 0; i < old->shared_count; ++i) {
-		struct dma_fence *f;
-
-		f = rcu_dereference_protected(new->shared[i],
-					      dma_resv_held(resv));
-		dma_fence_put(f);
-	}
-	kfree_rcu(old, rcu);
-
+	dma_resv_replace_shared(bo->tbo.base.resv, ef->base.context,
+				dma_fence_get_stub());
 	return 0;
 }
 
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 98ac66fecb71..74b217b82f39 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -268,6 +268,8 @@ void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
+void dma_resv_replace_shared(struct dma_resv *obj, uint64_t context,
+			     struct dma_fence *fence);
 
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 
-- 
2.25.1

