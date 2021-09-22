Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCD541449B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2110E6EB2A;
	Wed, 22 Sep 2021 09:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB556EB26;
 Wed, 22 Sep 2021 09:10:54 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w17so4589834wrv.10;
 Wed, 22 Sep 2021 02:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1xaTsfCXeko5njaG8B2RhED43a0eg4BazdMvUEhM6I=;
 b=d5lVyioqicgfH7dBoTAc2AyX5B2BNkItSGkUb6UHGPyeis0H+rh+V7alozTyOghTm5
 7lUslSzgbvUFUFyHV9yTn03p6LrmdYDfppea6pmeXXMK/7ulfLg2mHR8lK0PY8BCHTP9
 nJdNhYkwuYqKwNSZPlAwW17yW4IDnbF9abKVWqSyQ5h90YScjjn38NO+QPZHOTTJv0i2
 2FVsJ0xUAsEQ84loEDC7SXzcxqm+I3iK6NHGhgldX893mXhqIFKDCGSLDok965LXKrgU
 qaGsbQuAfmmlsIZuizCcB49yjrbQj7wiHmsK9LAAEilWQDyfuSSNcUrZ9GAijbrnUKd/
 vRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1xaTsfCXeko5njaG8B2RhED43a0eg4BazdMvUEhM6I=;
 b=FbL4ktRjAhAIauyqWE/vElhdS6tILtZLBg4EIxfqeOPFGoNkL7Qct+vgs+fNg2e46G
 I4fNtRxehnbiW0ChXXR9MQEKn62WK5UekRuPGWvF9qln8YyvmtLwc+FFpBxW/aBdrjVd
 yqGW5mAC396LJHfabLwiPC8i3YwKR+VLAHxrngEvDWp8Z/OwL/GUUFRAp36jCrlEvPhl
 Y7iX3uWQKgosALdOY080WDAvCOQRm+mClQ2OMtRzvVuH2/2LGBe8JVnX2PdAYBbWGWwE
 tPS6In46ZfaYDn8FoxqQdO9v6di9zzEjIkNuu6NoqKCqU6UGP2etg8n3//X3ClWA8GPo
 T3sg==
X-Gm-Message-State: AOAM5311LtSXPwQAQVmgm2+WcOQGz2dh4MCUS6CmDTVxfM0jOwXf/WIL
 qFx5aCcx/vv3m2NzuV8nYqQ=
X-Google-Smtp-Source: ABdhPJyDDVl/axkhxSQIjqYzAnv9hwypnbX5PzpHFdIDeRD4GHXk++EOyggL7EQUkQCauPDLF70nPw==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr8871144wmq.16.1632301852531; 
 Wed, 22 Sep 2021 02:10:52 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:10:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 06/26] dma-buf: use new iterator in dma_resv_test_signaled
Date: Wed, 22 Sep 2021 11:10:24 +0200
Message-Id: <20210922091044.2612-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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
index d0e26cd13ecd..fe9b84b308a3 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -627,22 +627,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
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
@@ -659,43 +643,16 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
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

