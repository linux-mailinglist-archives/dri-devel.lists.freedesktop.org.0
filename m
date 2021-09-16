Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3740D899
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE716ECEA;
	Thu, 16 Sep 2021 11:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A971C6ECE7;
 Thu, 16 Sep 2021 11:30:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so4249747wms.2; 
 Thu, 16 Sep 2021 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ebd8laWfrRXRVYC2x90kb6hWWHZBsznwPVLfAGFP3Cg=;
 b=eXHYHYmPtSpM3wfumd8tg58thGlqQfZQDAWbOQcyO100fMpp4sjMK0RlXDf27FzX6f
 nqUUUvuNNY9yo9zLzJeEAUQNjH0fo0SBqMizA4YawN+O46psezyRLQGtnQRil339mWEZ
 XwAdv1jaK39fOgrM4bFU6i5NVPK8IthQ93tkVuWZ1MH5kTvEHPaWRCKWcwwBmNoaAcxm
 brlpqWTfTOaU0cZCzS0M6GAexCyjMwtZuM8TdX1Zp59LyUNuckw0YSLTfQ1llw3MHVbS
 Lwj1S6a383VxqvlkAewie08hSWZVRYHpXORWI828smxzrnxpbcWLglxoqpuSKjbtUzbD
 +hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ebd8laWfrRXRVYC2x90kb6hWWHZBsznwPVLfAGFP3Cg=;
 b=opMbVz0mraR9RKKR7Cy6JJWxA3qs+Qp2v0GI7df6KvaqHDIfWC3ZIEj/t9HprbaX6P
 V9bX6d7jn0Fa1yOHes1HsahahgxBYs0lvzJYfqREDHBgIFNkEJhPytFDuTJm518PiPdn
 MaUWud/25F8pzVEoIvh1qIuhRfDjqegC8EmmKmmdj8D3YPLjJ65w3ePMoPGm8vDB57hR
 mYhimThMgu2IQwWK64EObEz8KM51h96B5ahRqeqL112I2lQQTfodqxz71x+J2lRqTPxk
 eXt5kFALSfvi+3XUEg3WsYMx6YMjHRqUgsVN7/Qm9E/ILaI7yQnSIDFwrswbzVTH0ldw
 p7LQ==
X-Gm-Message-State: AOAM530rzQ7UhdQhCkTEuq5v0JaCc7joOmQe0K73E+u1gOxj41QYG3qr
 hb+92k1b9x6dySMniGujdQ0=
X-Google-Smtp-Source: ABdhPJyorbxNxa60K9WQkm/2GEcheiaw3NO/7p7meOad00zcBgn/nggLJXXlWan4M4ZyizaIe9t0Ig==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr9621602wmd.55.1631791851256; 
 Thu, 16 Sep 2021 04:30:51 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 06/26] dma-buf: use new iterator in dma_resv_test_signaled
Date: Thu, 16 Sep 2021 13:30:22 +0200
Message-Id: <20210916113042.3631-7-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 54 +++++---------------------------------
 1 file changed, 7 insertions(+), 47 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 764a71ec2347..fae881a5d336 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -591,22 +591,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
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
@@ -623,43 +607,19 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
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
+	dma_resv_for_each_fence_unlocked(obj, &cursor, test_all, fence) {
+		if (!dma_fence_is_signaled(fence)) {
+			rcu_read_unlock();
+			dma_fence_put(fence);
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
 	rcu_read_unlock();
-	return ret;
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

