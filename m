Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A6940D895
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38506ECEB;
	Thu, 16 Sep 2021 11:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07426ECE7;
 Thu, 16 Sep 2021 11:30:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q11so8912165wrr.9;
 Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtmlO413yj3/X7KD0lHveLpvVJwGO76Kiide216asC4=;
 b=pBH9OW9RXHjAXv6756IYEn28oYG9StlbNwM4l8uaixqrDE8n2tTBfuMXTw6P0KZMvQ
 eOw0F4dUF2zZAKmn2aYLLH0CYMxzQGYed2pTA0kMkeo3FM8beKwukv7TjLbet9J1CdAw
 2HXke1Wx2fJmsv+fDics2PRLJogFhjzLbLzuO6LZttwFmb8zrti5Tl2Oeul/5RpeLksM
 FwEaLm3vxzHtSP/SFp0q6Xz3cNhcpfcr8psgkCvp4bgQSYE2yiQ+2lKyzwjjKr4hGHMT
 dRFbHMhvoLgBzVi581snZwmQyp2uKIZZhOK3uLqPqNTI/uw0G19L/C2+fWFYTPAI/V3Y
 ofCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtmlO413yj3/X7KD0lHveLpvVJwGO76Kiide216asC4=;
 b=v2gcPgjzkxsqbqbzxYf0o68eSHMzSPU8N7wfvQTToprDCRrmG0kCugyprhRhdBcm3V
 FX3h9OXYj7L2w8NUyhEA1hdNr/Ni3U4e16Opwrvri4zWlKlSP5groqhPkK2FecYFODbM
 A683QK2IYBlntLag9Lq87bD6ffUS6prDBT8S3lF3euq+al8EC3VoQJoh60FFSc/P79WR
 qBxZr919MEEoB9bOhjgKFkSgUBNAKRig44BdBFJa38yz2u56MmexVgFEUM2spD7NVudS
 YEmtjSVb3jJfJvfPXgIA+nswTbh4UWLu2ZfrbXbdBtGM4J7KkCvXNFDUIQFrGHIfwdAh
 5PQw==
X-Gm-Message-State: AOAM531EHG/hM+aQmEDGT8g21/Ie6JX6rGUFHrrB2yvJrCXn9UJHhspa
 GSos3Zj3KCGXc6v+sXWM94wuE5Xi6ShwvtZH
X-Google-Smtp-Source: ABdhPJwU8W3gDpAkB3c368BsKqC/kHLjObVUyyjtU7xQoZmk2Om8w1eCgx0uwrMipzh+WwdrHD/ESg==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr5581411wrm.430.1631791849534; 
 Thu, 16 Sep 2021 04:30:49 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 04/26] dma-buf: use new iterator in dma_resv_get_fences v2
Date: Thu, 16 Sep 2021 13:30:20 +0200
Message-Id: <20210916113042.3631-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 110 +++++++++++++------------------------
 1 file changed, 37 insertions(+), 73 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 91c040cb7d63..bba328475304 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -491,99 +491,63 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
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
-
-		fence_excl = dma_resv_excl_fence(obj);
-		if (fence_excl && !dma_fence_get_rcu(fence_excl))
-			goto unlock;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-		fobj = dma_resv_shared_list(obj);
-		if (fobj)
-			sz += sizeof(*shared) * fobj->shared_max;
+	*shared_count = 0;
+	*shared = NULL;
 
-		if (!pfence_excl && fence_excl)
-			sz += sizeof(*shared);
+	if (fence_excl)
+		*fence_excl = NULL;
 
-		if (sz) {
-			struct dma_fence **nshared;
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj, &cursor, true, fence) {
 
-			nshared = krealloc(shared, sz,
-					   GFP_NOWAIT | __GFP_NOWARN);
-			if (!nshared) {
-				rcu_read_unlock();
+		if (cursor.is_first) {
+			unsigned int count;
 
-				dma_fence_put(fence_excl);
-				fence_excl = NULL;
+			while (*shared_count)
+				dma_fence_put((*shared)[--(*shared_count)]);
 
-				nshared = krealloc(shared, sz, GFP_KERNEL);
-				if (nshared) {
-					shared = nshared;
-					continue;
-				}
+			if (fence_excl)
+				dma_fence_put(*fence_excl);
 
-				ret = -ENOMEM;
-				break;
-			}
-			shared = nshared;
-			shared_count = fobj ? fobj->shared_count : 0;
-			for (i = 0; i < shared_count; ++i) {
-				shared[i] = rcu_dereference(fobj->shared[i]);
-				if (!dma_fence_get_rcu(shared[i]))
-					break;
-			}
-		}
+			count = cursor.fences ? cursor.fences->shared_count : 0;
+			count += fence_excl ? 0 : 1;
+			rcu_read_unlock();
 
-		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
-			while (i--)
-				dma_fence_put(shared[i]);
-			dma_fence_put(fence_excl);
-			goto unlock;
+			/* Eventually re-allocate the array */
+			*shared = krealloc_array(*shared, count,
+						 sizeof(void *),
+						 GFP_KERNEL);
+			if (count && !*shared)
+				return -ENOMEM;
+			rcu_read_lock();
 		}
 
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
+	rcu_read_unlock();
 
-	*pshared_count = shared_count;
-	*pshared = shared;
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
-- 
2.25.1

