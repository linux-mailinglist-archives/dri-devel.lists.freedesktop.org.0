Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2C34B263A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B861110EBAC;
	Fri, 11 Feb 2022 12:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365CD10EB8A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:10 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ft32so6920311ejc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qT92IQc2aB3iwXs4kFd1kgA0VkgmJVRX8gFQEpzSsJE=;
 b=n6jV6A64nQZMb+22j1RdVy9b/E9LhL2NCNQNwDXC7OuIsWFYFQ+eaS2TALwaZKxSeG
 sjm8CvCFumO6MBkHlm7m82noEQHveZkeBlDnhOWxZ07FR4eZB265Fk5f4+NMG3ZQapOI
 WnybRW3bDidV4wUQRNlG93PiI6zN0LY5h6Z7h5ofpjUADLcwnS+5V0RlB127dbl8FJ9o
 1BOp/hULG/evEgMTi/2izbC4tA8BHa/mkoeJDcjR6w2UyWfyBO/X7uvLRY4HslySZDZy
 K8FG/jua1b1CghZcV1PtszCmkx4TkHc2jzwYPizgQLfKmsvYY50/3krh8J/PGk70LrH6
 upjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qT92IQc2aB3iwXs4kFd1kgA0VkgmJVRX8gFQEpzSsJE=;
 b=4hA9ATeHYVAjOYChpRBjnkwbmaM2VPdV1ir/PHrKuNBgE439hlle8rK26D/9cOd8k3
 DSKcgmBJUkIbnHUzgcZF/FSpUQTs86RwxfNUFLKgSHbB2+PawuyQIb1F8Sk89pxeIX8j
 1aF8HZcCYb2n+iyUkYuE0NWH3Wvqy03kp7tKfhKphiMmFHQ51ubidmXskrosZpgM/7Wm
 jAIGTAsA/C9Ks1Sh/3I8Szt8joa/iZqaAMhp+1a8QaQGWbGLLmou81QspPMpqhW3/krA
 sTOrIiIfxM+jDd1nvMVdSimDyFt5T7jffk2cuTokPXhB3eryloGv5IMlj0WG7CigpW2T
 AjMw==
X-Gm-Message-State: AOAM533jF5uZeXONagxYPaVx9u3gI6P446ApZ6pj2KghEEKwiwxHuAAM
 A/93CD/AvmvlyOyKgmAjzYs=
X-Google-Smtp-Source: ABdhPJw43PTYYiYA7p+ru4oq9y5YyrJjC0Lc7X4m4tRhtntMAMVID+eTnEqGmL9UiGaesavdYxMvJA==
X-Received: by 2002:a17:906:dc90:: with SMTP id
 cs16mr1285014ejc.295.1644583808316; 
 Fri, 11 Feb 2022 04:50:08 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:07 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/23] dma-buf: add dma_resv_replace_fences
Date: Fri, 11 Feb 2022 13:49:41 +0100
Message-Id: <20220211125003.918447-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

Then use this function in the amdkfd code when BOs are unmapped from the
process.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    | 43 ++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
 include/linux/dma-resv.h                      |  2 +
 3 files changed, 52 insertions(+), 42 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index b51416405e86..2230b8c4a595 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -289,6 +289,49 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
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

