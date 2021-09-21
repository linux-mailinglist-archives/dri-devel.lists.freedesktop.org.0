Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8A413875
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE316E9C1;
	Tue, 21 Sep 2021 17:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F3C6E9B7;
 Tue, 21 Sep 2021 17:37:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t18so41545241wrb.0;
 Tue, 21 Sep 2021 10:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rN1BCMfZa7Rucgdcz3i7G9Tllqx41CXv+op3rJ+vCck=;
 b=HMMSXpfEK8PGbnlBP0nhu6B4ZDIRpdeF8aCSYcUBtyO6cETdQdw8VJp9x1ycGo5Lpu
 4vkDSpDrQN7BR2xM4eXpZ+6tiufAIIcb0s6IEVygnjl9iLQbdoAVWfsAti1qy+SofCOL
 mQCIywD5bmMYubPdcIA0Dv3YaYeXaG+3gxXmgIPxvdGoNbyQ5jK8xPJaY6MEO6Elrlrl
 cJD7b1uoP+JfnnYa1fA4NG9ZDGL2Mal+ijRxEvUIgpr3BkoDoR0Dqv3PKy5y12dNCGSL
 PwN84tN/dr20j7F4TOmjmBGoj/mOc1+7GrQvQ8U3WL8LG+BnGUpkzXRcmg8XBaSd2YBA
 RsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rN1BCMfZa7Rucgdcz3i7G9Tllqx41CXv+op3rJ+vCck=;
 b=pZ1Aifh+53m9m0xGxNaaUKEt9i3JOM/9JOS0YjK9gOBBrwFUygaTAdBAqgaVPlSDqB
 8KVeZ+fXsGS2D0I5tG8n91T6VcYmMy2w8mQ2XlAD8MIs1IrId+XlpAyo0NSazLKftO7l
 29pkdlQFMF2sTmcMPMbk1jxgnO9xep94a1jUtLYOF/E4kJ6tTJ2bbgXBsyivqz4TUVzu
 m0SP01UfP0VhLP2hVC6mggIoG+IrhP5VI3G4sD7rN4zm0yK1zWZEftwx91zYcH+1pkwA
 w4i2vb26reWlOD27Ei7aPD4LFL7WXMOFztbfVnJc9XKBLIBA+zfMrDwkSCJ0L5ZZ4SAV
 UmLA==
X-Gm-Message-State: AOAM530iQCT4KepWn2iNBRajUV1XIB9Fg+NVFLsUx6PiP9taayjCiiWH
 AfByHPnWb9vaEF362RfceXk=
X-Google-Smtp-Source: ABdhPJzASTPwSLGxeukkHkv9kOF300nngKTvPI8L8ekvfo85fYfGbzZLg8qHc0tVFlVHzMTPQk0wNw==
X-Received: by 2002:a5d:5246:: with SMTP id k6mr35847936wrc.431.1632245825269; 
 Tue, 21 Sep 2021 10:37:05 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 04/26] dma-buf: use new iterator in dma_resv_get_fences v2
Date: Tue, 21 Sep 2021 19:36:37 +0200
Message-Id: <20210921173659.246165-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 108 +++++++++++++------------------------
 1 file changed, 36 insertions(+), 72 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a6d7404c978e..2b749cdcba02 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -533,99 +533,63 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
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
+	dma_resv_iter_begin(&cursor, obj, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-		if (sz) {
-			struct dma_fence **nshared;
+		if (dma_resv_iter_is_restarted(&cursor)) {
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
 
-	*pshared_count = shared_count;
-	*pshared = shared;
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
-- 
2.25.1

