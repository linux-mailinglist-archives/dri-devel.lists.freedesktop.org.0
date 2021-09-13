Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD90408C4C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD196E199;
	Mon, 13 Sep 2021 13:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173B76E194;
 Mon, 13 Sep 2021 13:17:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u16so14658158wrn.5;
 Mon, 13 Sep 2021 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ivU+OEHPZyTPE7GE4j0vohkEJckChOzR5FJoAf7dYnA=;
 b=J5pWzbtViRHhiLdvzRYSg/iy139gaerhwykupE9HkjblLjIXkXaLdMChYI/0qOX/OC
 rAx1Jka/f6UL9UwrbXw1pPP+HCmRzXo/rB1DMIRA8Ag5wWDk2SiFVEpz7hXs3IW2LMuy
 ULz8g75lc5aXJ/90nzVNIq7FemVAhsEC4kcMPT1RrIXbsr8/eYEPC1S++lU4jV6ZmWxj
 XbDwi2cCC8ZSDuXqmorI79dAkXuSfvRsWwBVLc6R+mbjyCf4wtUuhWTtaNcJM8s6QR0J
 rKoFCxi/wcmA1OTk4iNXi4Tkv2HdggHnBGM88llUxz72uxDMM8k2uCcqocXKkzZtsfbq
 JCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivU+OEHPZyTPE7GE4j0vohkEJckChOzR5FJoAf7dYnA=;
 b=Nn9ql+j2basn6C4zLG+DdpDjKFalHQGShYEoEbFnjId71rWLZr8/FBaY8qPaVc2dTt
 2TWKlDhBjZrM87aWJZ9uLVjmZYN5Gl/G6UcVyGuaFlbij1lMFfUFDHDHtQkyqe6GXqUv
 ukzhN6ZFEKQynn5LIdl5EEkudR03ilIJGWwrUrz1CC8zoeS03Vpn4x2A/pS396CR5Pgy
 b0RJtBesRYg+06Qzqf3OEt+rs9cg1Eqxb7CbkZX3Nv9ccvdYe29DJeLVXi1pZfRnOw2a
 vB9I2/mOGKGqI/5040Tri/yQ7QX+qLSftFqKuZppE3PbN65GHh3OGI02RJT7C5+ahKrb
 w3hg==
X-Gm-Message-State: AOAM533l22UkWLnHl8f+0nvE1ZqSGRPLHH0Ajc2ceHepbNZOUQb3Ixr1
 n+8WPS1tP1j4LAM5jN7JGZQ=
X-Google-Smtp-Source: ABdhPJy7uSu97RQXEG8GegudJHIf1HA6JvebsnWu5zCM57mF6N/7kCZqy7tbuUGVW9dQkNEF8c/BNw==
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr12588355wre.85.1631539038697; 
 Mon, 13 Sep 2021 06:17:18 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/26] dma-buf: use new iterator in dma_resv_get_fences v2
Date: Mon, 13 Sep 2021 15:16:45 +0200
Message-Id: <20210913131707.45639-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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
index 9a9c0bba772b..0a0e3ee62648 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -493,99 +493,63 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
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
+	struct dma_resv_cursor cursor;
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
+						 sizeof(void*),
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
+		if (cursor.is_exclusive && fence_excl)
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

