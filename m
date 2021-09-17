Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DF40F7D0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FCB6EC4F;
	Fri, 17 Sep 2021 12:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFBD6EC42;
 Fri, 17 Sep 2021 12:35:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t8so14939993wrq.4;
 Fri, 17 Sep 2021 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/rwiQ+ATFs+sDMWUu+w6Rs7NoUiJd4ETVjWIVuhdiI=;
 b=m5MN00i4b006eFm3fu30uWdf+tyKgl+dyeP/mt021jNoHcFFZBwd7lLGzdmZ3slJUE
 fvBhHXbSoBdhVXBre0nDAb1aYrEazpdHFbf5aN+d0nYJ9WAsf5NIVAsAYdXYJkrHcVQE
 q8GzAjxdoQzmViGD5bNdd/u6a5tfhPM/AxCHS+kJDVDckphIbIEOBw9OA3ZGfdNpyFpq
 Vg2uXeHuH7oveqGzYIhK59a2yDbIyrNWwNkfUDULRauR3ThZqyVdIE5QV1BFHLpy/wq9
 jKuFLEGtWE5pVosH6Yih0WBwFeTBzPhBGk6otWzgrAwrd4JN90TkbGqkRMRZod4GXwtG
 rraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/rwiQ+ATFs+sDMWUu+w6Rs7NoUiJd4ETVjWIVuhdiI=;
 b=LTfKDAUPjo66qaxH88ymikmxPhBn6qW+MAPGcU5Hx8hize7yPhz+WkIEEKcTUregie
 HEgniXlE8pxRUXftxcGlCpE2JdFpPVnVCIF+CKS/hK0JUkXaeW2O7DBSfcyb+ytzAEVn
 WDRTpTGoYnN41RB2UKGLj4vzEHDyCXZkuRsXEBWF9Cgfuxj9cMRnrmb0KSaa1i9SCnuL
 p5VCXLzoM3H/RogPOc/jpQisPKw2l5dJ1eJPcQn1VlkdcMt+ccvar6uhCuhJFOhGLcOS
 UqF5kKE/Pvth6cUwgY3Cd/GuoAftw0r7Bup+T4sh8VWFXftt0xlXdEldhDiDvbpQ5HIq
 i7Fw==
X-Gm-Message-State: AOAM5302FASoFKd6TQtVAuukNd1ixPzr246LI5YGzOumZrCtgI8BVWRA
 ZzfSJCb08am5fY534a62pek=
X-Google-Smtp-Source: ABdhPJw2Xk+DGoJdfDUIjxpO8TN5jWGOTM3tr7l7PGRy9eESCcjoRc/3WnWS7CZs6hfj9f3STavDNw==
X-Received: by 2002:a5d:5981:: with SMTP id n1mr11975526wri.82.1631882119510; 
 Fri, 17 Sep 2021 05:35:19 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 04/26] dma-buf: use new iterator in dma_resv_get_fences v2
Date: Fri, 17 Sep 2021 14:34:51 +0200
Message-Id: <20210917123513.1106-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

v2: use sizeof(void*) instead

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 112 +++++++++++++------------------------
 1 file changed, 40 insertions(+), 72 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 406150dea5e4..9b90bd9ac018 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -487,99 +487,67 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * dma_resv_get_fences - Get an object's shared and exclusive
  * fences without update side lock held
  * @obj: the reservation object
- * @pfence_excl: the returned exclusive fence (or NULL)
- * @pshared_count: the number of shared fences returned
- * @pshared: the array of shared fence ptrs returned (array is krealloc'd to
+ * @fence_excl: the returned exclusive fence (or NULL)
+ * @shared_count: the number of shared fences returned
+ * @shared: the array of shared fence ptrs returned (array is krealloc'd to
  * the required size, and must be freed by caller)
  *
  * Retrieve all fences from the reservation object. If the pointer for the
  * exclusive fence is not specified the fence is put into the array of the
  * shared fences as well. Returns either zero or -ENOMEM.
  */
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
-			unsigned int *pshared_count,
-			struct dma_fence ***pshared)
+int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
+			unsigned int *shared_count, struct dma_fence ***shared)
 {
-	struct dma_fence **shared = NULL;
-	struct dma_fence *fence_excl;
-	unsigned int shared_count;
-	int ret = 1;
-
-	do {
-		struct dma_resv_list *fobj;
-		unsigned int i, seq;
-		size_t sz = 0;
-
-		shared_count = i = 0;
-
-		rcu_read_lock();
-		seq = read_seqcount_begin(&obj->seq);
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-		fence_excl = dma_resv_excl_fence(obj);
-		if (fence_excl && !dma_fence_get_rcu(fence_excl))
-			goto unlock;
+	*shared_count = 0;
+	*shared = NULL;
 
-		fobj = dma_resv_shared_list(obj);
-		if (fobj)
-			sz += sizeof(*shared) * fobj->shared_max;
+	if (fence_excl)
+		*fence_excl = NULL;
 
-		if (!pfence_excl && fence_excl)
-			sz += sizeof(*shared);
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, obj, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-		if (sz) {
-			struct dma_fence **nshared;
+		if (cursor.is_first) {
+			unsigned int count;
 
-			nshared = krealloc(shared, sz,
-					   GFP_NOWAIT | __GFP_NOWARN);
-			if (!nshared) {
-				rcu_read_unlock();
+			while (*shared_count)
+				dma_fence_put((*shared)[--(*shared_count)]);
 
-				dma_fence_put(fence_excl);
-				fence_excl = NULL;
+			if (fence_excl)
+				dma_fence_put(*fence_excl);
 
-				nshared = krealloc(shared, sz, GFP_KERNEL);
-				if (nshared) {
-					shared = nshared;
-					continue;
-				}
+			count = cursor.fences ? cursor.fences->shared_count : 0;
+			count += fence_excl ? 0 : 1;
+			rcu_read_unlock();
 
-				ret = -ENOMEM;
-				break;
-			}
-			shared = nshared;
-			shared_count = fobj ? fobj->shared_count : 0;
-			for (i = 0; i < shared_count; ++i) {
-				shared[i] = rcu_dereference(fobj->shared[i]);
-				if (!dma_fence_get_rcu(shared[i]))
-					break;
+			/* Eventually re-allocate the array */
+			*shared = krealloc_array(*shared, count,
+						 sizeof(void *),
+						 GFP_KERNEL);
+			if (count && !*shared) {
+				dma_resv_iter_end(&cursor);
+				return -ENOMEM;
 			}
+			rcu_read_lock();
 		}
 
-		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
-			while (i--)
-				dma_fence_put(shared[i]);
-			dma_fence_put(fence_excl);
-			goto unlock;
-		}
-
-		ret = 0;
-unlock:
-		rcu_read_unlock();
-	} while (ret);
-
-	if (pfence_excl)
-		*pfence_excl = fence_excl;
-	else if (fence_excl)
-		shared[shared_count++] = fence_excl;
+		if (dma_resv_iter_is_exclusive(&cursor) && fence_excl)
+			*fence_excl = fence;
+		else
+			(*shared)[(*shared_count)++] = fence;
 
-	if (!shared_count) {
-		kfree(shared);
-		shared = NULL;
+		/* Don't drop the reference */
+		fence = NULL;
 	}
+	dma_resv_iter_end(&cursor);
+	rcu_read_unlock();
 
-	*pshared_count = shared_count;
-	*pshared = shared;
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
-- 
2.25.1

