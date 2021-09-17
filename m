Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03540F797
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BB76EC44;
	Fri, 17 Sep 2021 12:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AFD6EC44;
 Fri, 17 Sep 2021 12:35:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t8so14940038wrq.4;
 Fri, 17 Sep 2021 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8mVOVFn7bmhLuGrJEX+tbk0DRLKzhF9YYGPZtBVZ3ao=;
 b=YTrxJf7awtIaUN3OnOFQEAl2GGNFeguMpbirVAdGdLJu6EUqVOoKBMgt12jNkIJQD9
 S5Zwo1vUZwqgFMs+SX1NEHcSW3WzHNPhBufMmXMNGNV1B0LaNWafQXIkAO7zjMB9rTD8
 bOMi8foA42njV5ZGTcx2NVGk3bPKVfjKwfkLBbzDDkIbKUoJMLZnWEC08sMzvYMgvYqr
 1q6aZgWYLwecii6sK6+GRlFHUdL77y+l3gDJ0D9H3De2T9xSOtgIhIDUSnqhRCGJ1nD1
 F0CUK9aXnFaw6nGV6oeYyfJg+DCxR/gSX7ziuiZeibLKQDDHn18L4BZKz1f7FaACyOR/
 AAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8mVOVFn7bmhLuGrJEX+tbk0DRLKzhF9YYGPZtBVZ3ao=;
 b=FUsVeZ4EHm9sa4T/o4X0ajK959Xyi492lNhBxUEi8m9ZVkQnroZGS9TsOLL4eEasFz
 EsQk6XuR0kfc1uslckxPThfAmT4VRgM1YX6Dn+Lz07WwnKgOK3dpM8yWhNyKP7+h3zmf
 GVQDmGxTWFtenBF4a6a64xKrkgGYjJSXdfUMtPYE4Q0e7/dRs4fUcRKacq2X2sRnOZFc
 WfpdLHu2Mp0h4GXXBsTK+HJPrVnx0yS3pXEnCGIjmNadJwEz5g3zhkG83EXjf4h6+UDl
 kPGeFbT46HDKJv0oUH/XyIsuz0X73YaFSuM8NcwhZ4OPULpmmzo/HsY0VuAYal+G3Q6G
 2drw==
X-Gm-Message-State: AOAM533tbekf3gGn9mOP6JEsyQvckqFZy7VFCYCC3YtbIla1WLT1EJu3
 jiG+R6oWQL5dx8ihFSJwZRk=
X-Google-Smtp-Source: ABdhPJzp1OVanxiZTCCd7q1OJ3U2i8eSj4o2Z3hjO5r02JdQZtaKMhfkZHZMaQ58TWu9KG8LIATbYA==
X-Received: by 2002:adf:e546:: with SMTP id z6mr11951871wrm.346.1631882120404; 
 Fri, 17 Sep 2021 05:35:20 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 05/26] dma-buf: use new iterator in dma_resv_wait_timeout
Date: Fri, 17 Sep 2021 14:34:52 +0200
Message-Id: <20210917123513.1106-6-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 68 ++++++--------------------------------
 1 file changed, 10 insertions(+), 58 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 9b90bd9ac018..c7db553ab115 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -569,74 +569,26 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
 
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
 	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
+	dma_resv_iter_begin(&cursor, obj, wait_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		rcu_read_unlock();
 
-		if (dma_fence_is_signaled(fence)) {
-			dma_fence_put(fence);
-			fence = NULL;
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
+			dma_resv_iter_end(&cursor);
+			return ret;
 		}
 
-	} else {
-		fence = NULL;
-	}
-
-	if (wait_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-
-		if (fobj)
-			shared_count = fobj->shared_count;
-
-		for (i = 0; !fence && i < shared_count; ++i) {
-			struct dma_fence *lfence;
-
-			lfence = rcu_dereference(fobj->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &lfence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
-
-			fence = lfence;
-			break;
-		}
+		rcu_read_lock();
 	}
-
+	dma_resv_iter_end(&cursor);
 	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
 
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		dma_fence_put(fence);
-		if (ret > 0 && wait_all && (i + 1 < shared_count))
-			goto retry;
-	}
 	return ret;
-
-unlock_retry:
-	rcu_read_unlock();
-	goto retry;
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
-- 
2.25.1

