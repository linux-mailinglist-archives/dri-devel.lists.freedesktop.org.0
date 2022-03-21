Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65794E2891
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DFD10E42F;
	Mon, 21 Mar 2022 13:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3588B10E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:58:59 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n35so6976581wms.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l4xlwsl8U5gDz9vpl2+ZyzmUGnyErqboIt3KOk2V3m4=;
 b=hf9/3/QzkN9/IfRKPRHO9wzaI4QbrQ1HLITDxRYTGxmw+co9263PjR3hJv4hIBCUD4
 6rkYmGGvbLjxKdSuVuinSzcjTD1xLJWVzx3uf18O4IvqvvLtaet4+opRGds3Ck0DVD+Y
 ImR92qp9v87i6jaDZ+YAPsID1/6Y58+O8Zgh+hPxXnwO3A207/UgMvw7bVa+mrNqQ+Or
 JNj2yllUJ4Hl5IwnN+VXBVIqGDIj7eb1a8qaMM4XDKCk3E8N2Tstx0gDw9CwW1uskh6h
 Bd9YtT1WadbwUkWV1e0k/0cb+J5sMBkjzSkZKBfyce2rdzJGEQgN3aPhHjGm1KWJ24dG
 j4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l4xlwsl8U5gDz9vpl2+ZyzmUGnyErqboIt3KOk2V3m4=;
 b=O/FBXQyPA+ZIeg11QEWmtSqPUDWBfAUsQfWOBp6O6XvKGawNZOYmjYcyPfhcZtL9G2
 MPvjhPKY/vREGnd+fvSMvqUxy17pYdOIdpTI2SlPLP2ZwSpyQjPIHSZhg2zVact3aiRk
 bf1dDyFk5lKdodIGX5UxIQUIBKKdhBLW0Sb6Zpv194z2O9RxyonV5lg+X3qjDw6oL7PW
 joxHyFMRtTkt4harrBCIzXu90/NlWSeg+K6SAJfynsieJJq50ZwEvhWXSsI06WYCQcy+
 ZQIlOdQwYMd5ADJlOdR1iXE7OaThYDfCuhbffUo3jO9dOjxuG+gyEkIWCItHTHaqllrq
 yJ5g==
X-Gm-Message-State: AOAM533wAdYWGOvTU3tR2oaL+mj4lldCCAcNhSho+MOJ6xqnXMFIR8BH
 vucN5kiPkghzSYR0+h0+eKw=
X-Google-Smtp-Source: ABdhPJwQUGJQztResFyfurEfPGWbOiTYCb5Yjxf5XfZuIrd0l0JGKbjbkBx1udxjgV3KScYtWfLPxw==
X-Received: by 2002:a05:600c:1c20:b0:38c:ae37:c1ae with SMTP id
 j32-20020a05600c1c2000b0038cae37c1aemr2446642wms.203.1647871137706; 
 Mon, 21 Mar 2022 06:58:57 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:58:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/23] dma-buf: add dma_resv_replace_fences v2
Date: Mon, 21 Mar 2022 14:58:34 +0100
Message-Id: <20220321135856.1331-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

This function allows to replace fences from the shared fence list when
we can gurantee that the operation represented by the original fence has
finished or no accesses to the resources protected by the dma_resv
object any more when the new fence finishes.

Then use this function in the amdkfd code when BOs are unmapped from the
process.

v2: add an example when this is usefull.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    | 45 +++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
 include/linux/dma-resv.h                      |  2 +
 3 files changed, 54 insertions(+), 42 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index b51416405e86..509060861cf3 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -289,6 +289,51 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_shared_fence);
 
+/**
+ * dma_resv_replace_fences - replace fences in the dma_resv obj
+ * @obj: the reservation object
+ * @context: the context of the fences to replace
+ * @replacement: the new fence to use instead
+ *
+ * Replace fences with a specified context with a new fence. Only valid if the
+ * operation represented by the original fence has no longer access to the
+ * resources represented by the dma_resv object when the new fence completes.
+ *
+ * And example for using this is replacing a preemption fence with a page table
+ * update fence which makes the resource inaccessible.
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
index f9bab963a948..b6f266f612ea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -253,53 +253,18 @@ void amdgpu_amdkfd_release_notify(struct amdgpu_bo *bo)
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
index afdfdfac729f..3f53177bdb46 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -468,6 +468,8 @@ void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
+void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
+			     struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 int dma_resv_get_fences(struct dma_resv *obj, bool write,
 			unsigned int *num_fences, struct dma_fence ***fences);
-- 
2.25.1

