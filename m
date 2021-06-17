Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE63AB243
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBFA6E8F0;
	Thu, 17 Jun 2021 11:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6576E112
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:16:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id n20so3452285edv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f39rGZT5veqFjxPrNuWB2TiXiQPmiaT54Z6hZqWOR7o=;
 b=RNe0rSmGaU+5s+VrIHUQqg4naOJSdYobgxmh7WvqRqImdOpANraMgE5pu/oy4P8pYT
 M9zK4r41DUTtvR0QXRj0RanQYmkhu22PvsweGK4dPehIuBZ3ns+fzANw46807M+d7SpY
 GTtclYSaKX1Sp7dcLITRI2MvZVdQ2/cOo1M32uYF13zwvEv9XBjPycR0nUIzvE+wRMo+
 IishIVHeVMElBcs3PrPppAxpaoClrphTrgInFhNwL+cFAdOce3ddFuE/ROgqzY+dT2W9
 JWDY6fvVKR/JgWStdtSQrdYXTw4doKPqXEOrGzZ/SwYCNReYAEFlhTg+8GuEZcWF9UOo
 dXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f39rGZT5veqFjxPrNuWB2TiXiQPmiaT54Z6hZqWOR7o=;
 b=VNcXU/+fH/ye1z6eqprSY2gfOrsDOYFsIjkV1W2hQEUmo4mzp0vq7IuVk7z0Knk6Y5
 uO53pRHraPncniOCfMBm4xTHWAxabL6fg53I7CFpUP+H1+jj2cQWKEU+YSv67OJ0ZUmi
 ahLELEFK0rjZd/gborJU95yNHvZY5Xy/D8QExuUFXbZ+DmsmR1wjvQNtKL1v0RyOSfMJ
 yFxzgwfd80KaBBHok/sUlME/9cdv4fhO5cX/Laffw0zOs8UQpmJXKqrR/llw1odHkvJR
 fDD14E/zoljdPWQ6n0J8CuQUoUHsZe/2x6Tqs09QcslgT7wWTdxXSdN1lzIsF/dUJIYO
 4cdA==
X-Gm-Message-State: AOAM531QS1Nmj44GxVzdx0mdqrrj77f75y4VhudgXtXP8+nxjBSLaVV9
 ob+SbRyYAEZ/R7ZeaCEMt3uNqTj4LnY=
X-Google-Smtp-Source: ABdhPJzAxNQq7o0c8Az9z4kWtTT6sk40psjeZ0p7jq+xVfK4Wgh4poK36RFnx2T6ZmZk0Jy7KIbgzw==
X-Received: by 2002:a05:6402:190a:: with SMTP id
 e10mr5759983edz.160.1623928564796; 
 Thu, 17 Jun 2021 04:16:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
 by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:16:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 05/16] dma-buf: use new iterator in dma_resv_wait_timeout
Date: Thu, 17 Jun 2021 13:15:47 +0200
Message-Id: <20210617111558.28486-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 64 +++++---------------------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index b77bf46c0f48..5192cf4271ac 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -564,74 +564,24 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_cursor cursor;
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
+	dma_resv_for_each_fence_unlocked(obj, &cursor, wait_all, fence) {
+		rcu_read_unlock();
 
-		if (dma_fence_is_signaled(fence)) {
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
 			dma_fence_put(fence);
-			fence = NULL;
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

