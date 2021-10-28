Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF6E43E208
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE0A6E824;
	Thu, 28 Oct 2021 13:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BA66E971;
 Thu, 28 Oct 2021 13:26:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 71so3532371wma.4;
 Thu, 28 Oct 2021 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v95g0BYyVm7oqc3UyTL12RDeRs7zSTqHv740e7M8i+c=;
 b=DTZiWj4oUApd/LXGV64BlgxEY2MI7EyYnhSPyEpXOm91e9yFWKWtmw9BYg0e+67uHl
 gwTiGIJUlWTSs99pUEpYtDpMYWNWE9CFCTrnTxyX9YVjC7JiP0+OWLIgx2fwKkShL5Er
 be2Z8GMtHE/04/GTOsEIGhB0yorCiYrjoTQHgVIiAXneuoOqy8ksrMmFlKktvP0hiIoW
 1RwrQXPfkaWVegZG+FDj+fBfIStvGhtlMpNXStYqhSl2e6vI4VLZQXH22EtyTgtAMf7h
 qEhln2QBHuRwefw7qiVsCrxyd720UMfl2cAw5s3QQjUEs9plFbMyuNR5mggzyayYf0Jl
 47Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v95g0BYyVm7oqc3UyTL12RDeRs7zSTqHv740e7M8i+c=;
 b=w4BO7PejZDxly1+3TFjL11/e9gX/uUbW5biZJl9qQOBMTwMNJU72AmCSSyoN/pSL3o
 cmYYuyMHgnDL5XZmM51n80B3IjAJsQLg6Amj7LZT3ZryH39jr7Qwun82ElGglrE8hdfO
 9IFdE8oS6rQ8F6koN57SFHBzJaeVIJLKwarKEnWWm8s65Q7S2WMC4Jt1aSjluOgDbDYC
 eF+bnxvrmDyHX+ISS2mFTWM1ELWiwW5tsnI91ryw69SBpXyJ1k4WhMSea06KNnM8QsIJ
 sQyBTw7utbUN9D2HR6oUB9cH0n2sx0zpHmZ67LKPVOTiFmqmdg/wkPBgZqdVfks8LHyO
 9ZYg==
X-Gm-Message-State: AOAM532Ib87URGKV4cja7rd2nqswqjfVZx4sk9MGdJgI3aKQk2V9+oi9
 cvQaZl9DrmOz9Prk7BftLSuJJ8I1y2Y=
X-Google-Smtp-Source: ABdhPJx4Q8FsdsnQCZwf86vBd7iSmUGW1h3XnB3MkdUYEpqxZQ3KrkKwCQ9ZrywPcc0fZVuYsEXcpQ==
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr12321707wms.130.1635427595432; 
 Thu, 28 Oct 2021 06:26:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l11sm2935695wrt.49.2021.10.28.06.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:26:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] dma-buf: drop excl_fence parameter from
 dma_resv_get_fences
Date: Thu, 28 Oct 2021 15:26:28 +0200
Message-Id: <20211028132630.2330-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028132630.2330-1-christian.koenig@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
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

Returning the exclusive fence separately is no longer used.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                   | 43 +++++++-------------
 drivers/dma-buf/st-dma-resv.c                | 26 +++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c  |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c      |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 +-
 include/linux/dma-resv.h                     |  4 +-
 6 files changed, 26 insertions(+), 56 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 64d4f95778c4..fb02860312fc 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -561,26 +561,21 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * dma_resv_get_fences - Get an object's shared and exclusive
  * fences without update side lock held
  * @obj: the reservation object
- * @fence_excl: the returned exclusive fence (or NULL)
- * @shared_count: the number of shared fences returned
- * @shared: the array of shared fence ptrs returned (array is krealloc'd to
- * the required size, and must be freed by caller)
+ * @num_fences: the number of fences returned
+ * @fences: the array of fence ptrs returned (array is krealloc'd to the
+ * required size, and must be freed by caller)
  *
- * Retrieve all fences from the reservation object. If the pointer for the
- * exclusive fence is not specified the fence is put into the array of the
- * shared fences as well. Returns either zero or -ENOMEM.
+ * Retrieve all fences from the reservation object.
+ * Returns either zero or -ENOMEM.
  */
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
-			unsigned int *shared_count, struct dma_fence ***shared)
+int dma_resv_get_fences(struct dma_resv *obj, unsigned int *num_fences,
+			struct dma_fence ***fences)
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	*shared_count = 0;
-	*shared = NULL;
-
-	if (fence_excl)
-		*fence_excl = NULL;
+	*num_fences = 0;
+	*fences = NULL;
 
 	dma_resv_iter_begin(&cursor, obj, true);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
@@ -588,30 +583,22 @@ int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
 		if (dma_resv_iter_is_restarted(&cursor)) {
 			unsigned int count;
 
-			while (*shared_count)
-				dma_fence_put((*shared)[--(*shared_count)]);
-
-			if (fence_excl)
-				dma_fence_put(*fence_excl);
+			while (*num_fences)
+				dma_fence_put((*fences)[--(*num_fences)]);
 
-			count = cursor.shared_count;
-			count += fence_excl ? 0 : 1;
+			count = cursor.shared_count + 1;
 
 			/* Eventually re-allocate the array */
-			*shared = krealloc_array(*shared, count,
+			*fences = krealloc_array(*fences, count,
 						 sizeof(void *),
 						 GFP_KERNEL);
-			if (count && !*shared) {
+			if (count && !*fences) {
 				dma_resv_iter_end(&cursor);
 				return -ENOMEM;
 			}
 		}
 
-		dma_fence_get(fence);
-		if (dma_resv_iter_is_exclusive(&cursor) && fence_excl)
-			*fence_excl = fence;
-		else
-			(*shared)[(*shared_count)++] = fence;
+		(*fences)[(*num_fences)++] = dma_fence_get(fence);
 	}
 	dma_resv_iter_end(&cursor);
 
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index bc32b3eedcb6..fd742a60f7e0 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -275,7 +275,7 @@ static int test_shared_for_each_unlocked(void *arg)
 
 static int test_get_fences(void *arg, bool shared)
 {
-	struct dma_fence *f, *excl = NULL, **fences = NULL;
+	struct dma_fence *f, **fences = NULL;
 	struct dma_resv resv;
 	int r, i;
 
@@ -304,35 +304,19 @@ static int test_get_fences(void *arg, bool shared)
 	}
 	dma_resv_unlock(&resv);
 
-	r = dma_resv_get_fences(&resv, &excl, &i, &fences);
+	r = dma_resv_get_fences(&resv, &i, &fences);
 	if (r) {
 		pr_err("get_fences failed\n");
 		goto err_free;
 	}
 
-	if (shared) {
-		if (excl != NULL) {
-			pr_err("get_fences returned unexpected excl fence\n");
-			goto err_free;
-		}
-		if (i != 1 || fences[0] != f) {
-			pr_err("get_fences returned unexpected shared fence\n");
-			goto err_free;
-		}
-	} else {
-		if (excl != f) {
-			pr_err("get_fences returned unexpected excl fence\n");
-			goto err_free;
-		}
-		if (i != 0) {
-			pr_err("get_fences returned unexpected shared fence\n");
-			goto err_free;
-		}
+	if (i != 1 || fences[0] != f) {
+		pr_err("get_fences returned unexpected fence\n");
+		goto err_free;
 	}
 
 	dma_fence_signal(f);
 err_free:
-	dma_fence_put(excl);
 	while (i--)
 		dma_fence_put(fences[i]);
 	kfree(fences);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 68108f151dad..b8cf3740dd28 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -200,8 +200,8 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 		goto unpin;
 	}
 
-	r = dma_resv_get_fences(new_abo->tbo.base.resv, NULL,
-				&work->shared_count, &work->shared);
+	r = dma_resv_get_fences(new_abo->tbo.base.resv, &work->shared_count,
+				&work->shared);
 	if (unlikely(r != 0)) {
 		DRM_ERROR("failed to get fences for buffer\n");
 		goto unpin;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index b7fb72bff2c1..4500d6b4fcd3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -112,7 +112,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	unsigned count;
 	int r;
 
-	r = dma_resv_get_fences(resv, NULL, &count, &fences);
+	r = dma_resv_get_fences(resv, &count, &fences);
 	if (r)
 		goto fallback;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index b5e8ce86dbe7..982bd7135a66 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -189,8 +189,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			continue;
 
 		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
-			ret = dma_resv_get_fences(robj, NULL,
-						  &bo->nr_shared,
+			ret = dma_resv_get_fences(robj, &bo->nr_shared,
 						  &bo->shared);
 			if (ret)
 				return ret;
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index e0558429a5ee..cde0147e8830 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -459,8 +459,8 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_prune_unlocked(struct dma_resv *obj);
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
-			unsigned *pshared_count, struct dma_fence ***pshared);
+int dma_resv_get_fences(struct dma_resv *obj, unsigned int *num_fences,
+			struct dma_fence ***fences);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
-- 
2.25.1

