Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A315046BB28
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385356E802;
	Tue,  7 Dec 2021 12:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CD66EAC5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:17 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u1so29095475wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4QADmDIJ6uafvkbWTgBnifMSyLYGo2GFMs8el97OfdE=;
 b=OcqB2Z+/dE4v+hu2vfbEeT6tH7Udlo64hxD0Vdy/AI5AgRnP8yAYDdhciOwgnO/5zj
 ogeC9wd6c4bjcN2g9cZScrq4BOYPWkdRw79SU7o3VGn8gTTRDsO4mEY5w1nv8xDLRcvX
 VoFIWyj7etsgvUCrR4p2dv/pEIiNbbFoQxETEkQAbBeQrEu6F2mxq3qQUZXWhv8gyybg
 gjSWCs1b7ECd4ZVxQnOYKSZnaYATiucR+jgcxD2rDF8Om+3b2f+gKtLR1BkcH1H4GPik
 IAV114epXHzzA6tjO8lVoYjfy8518ERnzHb0k8G97+k5cHDB9K3g5AVJFYmkdz/gL67V
 tX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QADmDIJ6uafvkbWTgBnifMSyLYGo2GFMs8el97OfdE=;
 b=tuTLDRnhMkhazxR9mJ+I6msEisaZtJZtyAYu+75hEWRUthTTKmHGSM6GalfjwkTCTb
 R1qkhM9tTB+nsqDGL+OJ17Xogk0y+/i9QBCpTCVwCbMbWcOznDq02n6917G6DayDZsN7
 ZtRpIAkyKkwFeuOVnEtNb9aAxNc8rEn8dYQIXPTtXElP/+nHzuw12o56Bsj3Qi8uNhuo
 HAz45zxevpgRRTKZs1hDC3+GyjNGkPfk4tspqSMgQL9H4g+XmjnETH6tQNV14UIjTqfz
 nlLZVP/2r0UguWxg+bgjlcMu8kC35E59Qs3HsV3+PAH+ydwTuKxpoiG2KxmEel/miPqG
 hCGg==
X-Gm-Message-State: AOAM531bz61d6Lulyq3d1sGEDv1LJf7dQWPwk4Dmu4jQgbm9CHa6+BDJ
 95RkuQGsErprq4J/vSutVTY=
X-Google-Smtp-Source: ABdhPJz0wSQVWKVXvYIclIT9h8xBqTOoM/j3uZrRtvGxNjj4jBKROftRAhSxvU+7HBFnC/3rOZA4pA==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr47781512wri.224.1638880455793; 
 Tue, 07 Dec 2021 04:34:15 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:15 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/24] dma-buf: add dma_resv_replace_fences
Date: Tue,  7 Dec 2021 13:33:48 +0100
Message-Id: <20211207123411.167006-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

