Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBB642254F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16016EB66;
	Tue,  5 Oct 2021 11:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FF56EB51;
 Tue,  5 Oct 2021 11:37:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r18so9476702wrg.6;
 Tue, 05 Oct 2021 04:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJ5wFCeJ74iADe7IPpi45lRFqxzlB4iYwmf3NxUu/pI=;
 b=AsQ2oZuy3qM4YGBgiQnTyxqFUT/eo24eFuP2HCc9pcsQFCjQSHbNH0mboo0gshfhbx
 DdH/hdLTpXFImXQskVyLE7Bj/MU0I0HPp0Mh0k6iyN9xtBeIsVRb0rxV9rPoO7zTlIuo
 r4Xes1Iiu682xu6OzlK4PZD/9NhQJCipPHTHMlIW6d1PR/LkiWZ+RUyf+nghbCWQleKK
 QBAZ8iVivU7IFUXB8wU0lyqtl+tDm7vkiHShD+6Fmmy1njkMB8I9bTGQesOQzBom17pZ
 +OtxxXe+rFv4HwmJDva+WaQbND8ve1TgqGPYoOhACTSMDsxWyMbIBVcCTk2n5nfzIXmW
 Oyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJ5wFCeJ74iADe7IPpi45lRFqxzlB4iYwmf3NxUu/pI=;
 b=LcStshEyOv3cqBYD8r2ToCMA/D4DbyDHegB3bY3j4aSg3BVKEM2ZI+RBIs+co/ZQ9L
 TRAzHpaCG3eNrEwZYxmzQTQG7M8qG+nJEQdsc+Mh1EVP3ZdC+JTsAbVSn+fnr6+b6Y3z
 mYmZt8CUliZwh2dU0DWRzcZBRcPYfJ3iJ+Lt/3jNEf3f/UZnRtU5kds2SM4+0hnlken9
 psScwRwBMz+2h+ZKTjFVGS/24wRMBrSJ+CWyQHNlXDeToEOpgaF3zcgEiEMj+XsjfjB0
 WCWOqHjHffqC426MUleZ3Gy1wIp5BGIdvCp+IvK86lKlXjxVvrGo7q/riHuvTGJXNoM8
 15Nw==
X-Gm-Message-State: AOAM530pHq7cmVnCiiS/m+13z+fOn9MfoW/D7o+2220DYLnbPLJijrwp
 GoQS5NEkg4cHC4xOOhAQ4mI=
X-Google-Smtp-Source: ABdhPJztr39unyHYn82kfLpklBr++cU4DCEL4qpw/oPU23p0ELK6XrOEQU+kdjE+e4dwY+3+ngqj+g==
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr21075821wri.300.1633433871242; 
 Tue, 05 Oct 2021 04:37:51 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 07/28] dma-buf: use new iterator in dma_resv_test_signaled
Date: Tue,  5 Oct 2021 13:37:21 +0200
Message-Id: <20211005113742.1101-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 57 +++++---------------------------------
 1 file changed, 7 insertions(+), 50 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 220c40dc5c11..41c2e951213c 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -633,22 +633,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
 
-static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
-{
-	struct dma_fence *fence, *lfence = passed_fence;
-	int ret = 1;
-
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &lfence->flags)) {
-		fence = dma_fence_get_rcu(lfence);
-		if (!fence)
-			return -1;
-
-		ret = !!dma_fence_is_signaled(fence);
-		dma_fence_put(fence);
-	}
-	return ret;
-}
-
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
@@ -665,43 +649,16 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	unsigned int seq;
-	int ret;
-
-	rcu_read_lock();
-retry:
-	ret = true;
-	seq = read_seqcount_begin(&obj->seq);
-
-	if (test_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i, shared_count;
-
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; ++i) {
-			fence = rcu_dereference(fobj->shared[i]);
-			ret = dma_resv_test_signaled_single(fence);
-			if (ret < 0)
-				goto retry;
-			else if (!ret)
-				break;
-		}
-	}
-
-	fence = dma_resv_excl_fence(obj);
-	if (ret && fence) {
-		ret = dma_resv_test_signaled_single(fence);
-		if (ret < 0)
-			goto retry;
 
+	dma_resv_iter_begin(&cursor, obj, test_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_resv_iter_end(&cursor);
+		return false;
 	}
-
-	if (read_seqcount_retry(&obj->seq, seq))
-		goto retry;
-
-	rcu_read_unlock();
-	return ret;
+	dma_resv_iter_end(&cursor);
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

