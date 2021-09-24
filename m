Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F02B4177A6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8132D6EE36;
	Fri, 24 Sep 2021 15:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726AE6E1D7;
 Fri, 24 Sep 2021 15:31:23 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w29so28587040wra.8;
 Fri, 24 Sep 2021 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cS5iGWKRJZl9e2of130B6u1H96gfOwZtKEhbMlq6Irk=;
 b=I32ZkThQcwKx3to2uBUfDeM5WLqc9uTo/9yKtWlyaVTvtwfxVLqaZkC4oA6eProDkH
 FNaURTTrDBl21EAO+tZRAmjlApg+LCOQ4ijfwScl5XyESPI7OUsnkA5aE781VgCQfqzO
 ng8k2LWOISV9vRzV22rk4rnrPAro1vrJdl4O/Ygv3ozRRCs/bESZ0r07u1meES3+rSyH
 2aXc+DLkA7TWxduJ9LVMopq5WKqF5SKmfPB//BmfNWxR0WjA+J12bQ59HaiKgMzslLJ1
 jrTdIRgBDiCwbpazj2rFmIlrjpnfvduc7LzMxLDr9JlSXJzJ0O4nKS5HfKv39fxFt73n
 XKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cS5iGWKRJZl9e2of130B6u1H96gfOwZtKEhbMlq6Irk=;
 b=gbTopSIeoMTC+67lG/M9s0ZMZdi0K8jvWg5tx9+ZqSEGM2cMT5ytFJed1wyOuOwI/M
 8YMcC0w5rHMfAT/Xdi74oWBI99w3eBqtpnJvfWg1a78cTo0azUWus2h1Qf3WAZy0rCLV
 tqggpvBbdCH2wdFGoeEwmouHqvwSdNlyzQBrPYut9FIztpqZiEBEGTwRgRqVWzsPaPNV
 I9s+F7GLY08mXq5NcxI/XOpmZhi5OA8SO1DeY/iTD0cxGjkj4S6BJvNB89k7Aw4Ghf93
 XZZgJYcK65n8jSdiacGgFmpi/CuigCV99Q56IjzqnsASqhIjFS9h0BNwY5GN2ISHPU31
 QhPQ==
X-Gm-Message-State: AOAM5327a7AL8m71PEr32uoU+tHWoYPxa3CeLNmiuejgkfy1Zj6Alc1K
 XSccc2FtfVPixrmvqPQQYXg=
X-Google-Smtp-Source: ABdhPJz5UL0/fv33FZR1HQor/mYzMpKSGiWoxeRCAkd4oZHML1sJxXeamhANPXgWuOMxqrZVbjzmKg==
X-Received: by 2002:a7b:c92f:: with SMTP id h15mr2845866wml.60.1632497482031; 
 Fri, 24 Sep 2021 08:31:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 07/27] dma-buf: use new iterator in dma_resv_test_signaled
Date: Fri, 24 Sep 2021 17:30:53 +0200
Message-Id: <20210924153113.2159-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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
index ce6d0ac43911..42ed72db9801 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -628,22 +628,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
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
@@ -660,43 +644,16 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
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

