Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC7C45A542
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A9A6E59D;
	Tue, 23 Nov 2021 14:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E756E578
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a9so39243018wrr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/HKiuvsLvtggr8wqFG79/kykHy5z0YuU04uWMf5ENc=;
 b=YwrlxJJSIcNyF4Ry5YW0SnT6p6dpgvKvskfDIOCH8d4EqSG7z3kMnI84B2KTj25PI5
 VNnfBT8nGAGfIxFQQ4B8NN9Bf449kUnOmMVEpHnfCmcqo64QvW5sdhTMNoAsOObvIsKM
 Enq1QTHnSFhtd2k3MSN9tGhC7XXMdKlle9kLcMXO2GS2JM1x83HUiNeV6TuwH/j07x7a
 TpvoF7lqfsHOVNa8v1/AWG6lg37RuPcXm8FASXSt1E5KH0zsBS7IZ6iYzq5TBYa7KDa3
 RFua3xqBQIZdeaAs4ryhsQuxtdp64/l1iBZ8yml+oAOcyVcRywF6jEQOQoXnW55xFyBY
 hXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/HKiuvsLvtggr8wqFG79/kykHy5z0YuU04uWMf5ENc=;
 b=onfsAndTCtRCUWedI23LMfbAFjQjBeDiQkDWpBWGdf1eBb2onuh6A8vx7wapE+4VHM
 ksqPL883lFtn9W70u1HhhAhZjdlvY6a0rb5S+FQl1rlOywUpblUq72IYY7jB27ggVEe+
 P+XJ5JsVLLrlpZOF8nTRK2fRYnBKez5LL/H59d9Jl1IRGZOmfUreoybRusDsXHcRXx/B
 2CvWSQj/LVmZ7jgaBmUDgGDHd1GBzKccuhMm/iOqTDdL0phBMuaVKpRUAlfVzHn5A/UP
 4wF6TgLL+uEA+pCjWQCqOdiz3vjoWOp/avjFa3g8nMnJ1ooCpuxPh1WwsTJvSRNcWWeM
 3V2Q==
X-Gm-Message-State: AOAM533UxDCInQTwQl9KdFHwKqqf+XkaV1o/OMnApKbu/YbcgKi7SlMi
 gbnw9vLkZO/Db4NAdPnFP8c=
X-Google-Smtp-Source: ABdhPJy/Oxm3/2cPVW0DILaOGjbR1vdCwE8aul25iOb3IDZgJ7HF7jb4JTtR6Qs2OxK9XpWcMe3uPQ==
X-Received: by 2002:adf:a389:: with SMTP id l9mr7717381wrb.121.1637677287705; 
 Tue, 23 Nov 2021 06:21:27 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 07/26] dma-buf: drop excl_fence parameter from
 dma_resv_get_fences
Date: Tue, 23 Nov 2021 15:20:52 +0100
Message-Id: <20211123142111.3885-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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

Returning the exclusive fence separately is no longer used.

Instead add a write parameter to indicate the use case.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                   | 48 ++++++++------------
 drivers/dma-buf/st-dma-resv.c                | 26 ++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c  |  6 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c      |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 +-
 include/linux/dma-resv.h                     |  4 +-
 6 files changed, 31 insertions(+), 58 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 611bba5528ad..0a69f4b7e6b5 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -675,57 +675,45 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * dma_resv_get_fences - Get an object's shared and exclusive
  * fences without update side lock held
  * @obj: the reservation object
- * @fence_excl: the returned exclusive fence (or NULL)
- * @shared_count: the number of shared fences returned
- * @shared: the array of shared fence ptrs returned (array is krealloc'd to
- * the required size, and must be freed by caller)
- *
- * Retrieve all fences from the reservation object. If the pointer for the
- * exclusive fence is not specified the fence is put into the array of the
- * shared fences as well. Returns either zero or -ENOMEM.
+ * @write: true if we should return all fences
+ * @num_fences: the number of fences returned
+ * @fences: the array of fence ptrs returned (array is krealloc'd to the
+ * required size, and must be freed by caller)
+ *
+ * Retrieve all fences from the reservation object.
+ * Returns either zero or -ENOMEM.
  */
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
-			unsigned int *shared_count, struct dma_fence ***shared)
+int dma_resv_get_fences(struct dma_resv *obj, bool write,
+			unsigned int *num_fences, struct dma_fence ***fences)
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
 
-	dma_resv_iter_begin(&cursor, obj, true);
+	dma_resv_iter_begin(&cursor, obj, write);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
 			unsigned int count;
 
-			while (*shared_count)
-				dma_fence_put((*shared)[--(*shared_count)]);
+			while (*num_fences)
+				dma_fence_put((*fences)[--(*num_fences)]);
 
-			if (fence_excl)
-				dma_fence_put(*fence_excl);
-
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
index bc32b3eedcb6..cbe999c6e7a6 100644
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
+	r = dma_resv_get_fences(&resv, shared, &i, &fences);
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
index 68108f151dad..d17e1c911689 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -200,8 +200,10 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 		goto unpin;
 	}
 
-	r = dma_resv_get_fences(new_abo->tbo.base.resv, NULL,
-				&work->shared_count, &work->shared);
+	/* TODO: Unify this with other drivers */
+	r = dma_resv_get_fences(new_abo->tbo.base.resv, true,
+				&work->shared_count,
+				&work->shared);
 	if (unlikely(r != 0)) {
 		DRM_ERROR("failed to get fences for buffer\n");
 		goto unpin;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index b7fb72bff2c1..be48487e2ca7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -112,7 +112,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	unsigned count;
 	int r;
 
-	r = dma_resv_get_fences(resv, NULL, &count, &fences);
+	r = dma_resv_get_fences(resv, true, &count, &fences);
 	if (r)
 		goto fallback;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index b5e8ce86dbe7..64c90ff348f2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -189,8 +189,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			continue;
 
 		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
-			ret = dma_resv_get_fences(robj, NULL,
-						  &bo->nr_shared,
+			ret = dma_resv_get_fences(robj, true, &bo->nr_shared,
 						  &bo->shared);
 			if (ret)
 				return ret;
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index e0cec3a57c08..09b676b87c35 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -438,8 +438,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_prune(struct dma_resv *obj);
 void dma_resv_prune_unlocked(struct dma_resv *obj);
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
-			unsigned *pshared_count, struct dma_fence ***pshared);
+int dma_resv_get_fences(struct dma_resv *obj, bool write,
+			unsigned int *num_fences, struct dma_fence ***fences);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
-- 
2.25.1

