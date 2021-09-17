Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9840F79D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AC76EC4B;
	Fri, 17 Sep 2021 12:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B517D6EC46;
 Fri, 17 Sep 2021 12:35:22 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t18so15000452wrb.0;
 Fri, 17 Sep 2021 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RfHqvcyiEJW+8Dv+evs+CpAicHAPfkZinp9Xu/Tw2t0=;
 b=G+urs6mPARXC3SO9XXPNshssXO2BZh8WmFOl5MT5iJsXIosexKxo9uUcPiDxc7Kv5F
 BGAQkNlQam50WpDy+MshUUpJXDnL1hz8tbvPjAmFzFTi1rFDuLh36jCcMM6I2fiukfbD
 7MLfH4IZSg4W8HX0l0Sv6wKVm9bxkQcSVkIo0pthgQgdIzxvqeKdhm3qwyGSGT++Xuz6
 leDyZ0/k0v7czH4H3Av2UNU2LMO45W0dExZQRovMrm5InsyI740pVD2CE8bqDdeUaH4/
 E+zZKqDY1hkYiRgnqorvXl4fnJfnqpEIQWCCeaNACIVDp81PEFGSJM204n4VXsUCK0Gm
 xNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RfHqvcyiEJW+8Dv+evs+CpAicHAPfkZinp9Xu/Tw2t0=;
 b=7uECP3Hgs2ntgxumHQtAR3FP5yZmJop7Qi3kOEeWZmkqTs7TbOYRiRvt3jq9Yg03V3
 yuxaJGVHpcW8KO9KLB9DKoNJVubQZ8WGMneLbnoNzw6ipfgx8B6ypqwanu/Te9LPuQa7
 Wp9pxCJRTGLqPFc7B+bLRLw0e/WC3w+lt1i52hqkg/zabJkgwGwHft37RNp2IClRKZy+
 Q/+hvxuKYCIpLc7vieZIDRcakeqwgH72M5XDV4wTPd/Gk/rHJ3+QR1eLqm7ZBmZlW6I+
 XZXHZYDhAn+2+H1IS3OiqxPLAXjlY6UhzvxwUzCqCLMeUk1N4jtEGyOtbn33lt0cSWTW
 /4TA==
X-Gm-Message-State: AOAM530yy5jyEq02QwIvvth7muAgwS8GGOmn+6UoLzsnPVEHXeQKnHqh
 MsR2GPIKlubiL2rY8EZ3ZtA=
X-Google-Smtp-Source: ABdhPJwP6PF7du9OAVJXVkoGkr0OBbNqSGCyO09T5wU1+fJSM9j6cy3vh+oonWYU/jK7vx2nVaGXDA==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr12126933wrb.237.1631882121293; 
 Fri, 17 Sep 2021 05:35:21 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 06/26] dma-buf: use new iterator in dma_resv_test_signaled
Date: Fri, 17 Sep 2021 14:34:53 +0200
Message-Id: <20210917123513.1106-7-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 56 ++++++--------------------------------
 1 file changed, 9 insertions(+), 47 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index c7db553ab115..d8f428ddaedd 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -593,22 +593,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
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
@@ -625,43 +609,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	unsigned int seq;
-	int ret;
 
 	rcu_read_lock();
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
+	dma_resv_iter_begin(&cursor, obj, test_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (!dma_fence_is_signaled(fence)) {
+			dma_resv_iter_end(&cursor);
+			rcu_read_unlock();
+			return false;
 		}
 	}
-
-	fence = dma_resv_excl_fence(obj);
-	if (ret && fence) {
-		ret = dma_resv_test_signaled_single(fence);
-		if (ret < 0)
-			goto retry;
-
-	}
-
-	if (read_seqcount_retry(&obj->seq, seq))
-		goto retry;
-
+	dma_resv_iter_end(&cursor);
 	rcu_read_unlock();
-	return ret;
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

