Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D441779A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2806EE27;
	Fri, 24 Sep 2021 15:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA126EE2D;
 Fri, 24 Sep 2021 15:31:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w17so28581359wrv.10;
 Fri, 24 Sep 2021 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PWcrX/+AX77jPmOcO42ygzOFau6SefsmvnsKtVw/iNk=;
 b=RyXaAlvF4YkEyyjnBaQtd9nr2dDZOYaEhHNj4d/Unuu4kAoU+LOQHq7qnjTLEm75LP
 yA6YLFCDevuNggbY8Y6Wk5s1HbSt8NzQ3WZgHOBdWql7KRg0KBgLGgN27HhtsH935V1j
 d3Xl5D6bYN+9a068zT4nvdm6MKNx/4CvqPgwErC+LiGD9050bObTSpWsUWbsiwBoBgOs
 cIiHwgatxWHXEndRGLHImCPHvAkC4PrxuKt6buWEe62283bTSMQBT9ThbaNyJNG4Bgwi
 jI8jxjC04n039XqngoUNm8iGxczJC4UyHH8B8kHWQ8RFO2US2eFRpB633/Mvkpkitl9M
 CR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PWcrX/+AX77jPmOcO42ygzOFau6SefsmvnsKtVw/iNk=;
 b=BNV6vrOV+gw5Fs1bs7/623YOcVIHqMDRCt3XF1rfnc1poWlQsIwf5+BOKO8hnujMUD
 dkgdM20+1jS/jDZLb62dyDEn7mhoRjXLB+rLF0fElFF5tVBMbYpO2Yf17RKEu+HP0DAK
 wKk571r5sorJqgf9Qo1ooabF9N6J2yjzORGqtrb7B+Pj2mHdc7pnRF0qBbPtTGygBkD7
 aaFXJvcuG08ctvnLwL8ywTZxdmFmEP4Mhhoe53xV9ik9BBXR31PiDtWviQOQM+o2gDL/
 cbcnXJUWCGpL8OZPZ7B7N0TOtrHbofZIt54dtFQINrBgIHft1hGfzj2nYavFv0lYUd9t
 a5Og==
X-Gm-Message-State: AOAM531c8LVadRfpA9b0IEruTRjj8SfLuw8xrnaiyeq1vTzujU6layLB
 77DvVpyGQ/DCc2R4+L3Nz2c=
X-Google-Smtp-Source: ABdhPJxVz6e8g8VEXKuq7e7sEa6mOjNpVpagxm/btfJ1IZdusReUAaINnzyw4wkMg1yz3sgjejm4mg==
X-Received: by 2002:a05:600c:4ba5:: with SMTP id
 e37mr2743028wmp.65.1632497479308; 
 Fri, 24 Sep 2021 08:31:19 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 04/27] dma-buf: use new iterator in dma_resv_copy_fences
Date: Fri, 24 Sep 2021 17:30:50 +0200
Message-Id: <20210924153113.2159-4-christian.koenig@amd.com>
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
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 84 +++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 52 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 98cb0050c615..17ef7472830b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -476,74 +476,54 @@ EXPORT_SYMBOL_GPL(dma_resv_iter_next);
  */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_resv_list *src_list, *dst_list;
-	struct dma_fence *old, *new;
-	unsigned int i;
+	struct dma_resv_iter cursor;
+	struct dma_resv_list *list;
+	struct dma_fence *f, *excl;
 
 	dma_resv_assert_held(dst);
 
-	rcu_read_lock();
-	src_list = dma_resv_shared_list(src);
+	list = NULL;
+	excl = NULL;
 
-retry:
-	if (src_list) {
-		unsigned int shared_count = src_list->shared_count;
+	dma_resv_iter_begin(&cursor, src, true);
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
 
-		rcu_read_unlock();
+		if (dma_resv_iter_is_restarted(&cursor)) {
+			dma_resv_list_free(list);
+			dma_fence_put(excl);
 
-		dst_list = dma_resv_list_alloc(shared_count);
-		if (!dst_list)
-			return -ENOMEM;
+			if (cursor.fences) {
+				unsigned int cnt = cursor.fences->shared_count;
 
-		rcu_read_lock();
-		src_list = dma_resv_shared_list(src);
-		if (!src_list || src_list->shared_count > shared_count) {
-			kfree(dst_list);
-			goto retry;
-		}
-
-		dst_list->shared_count = 0;
-		for (i = 0; i < src_list->shared_count; ++i) {
-			struct dma_fence __rcu **dst;
-			struct dma_fence *fence;
+				list = dma_resv_list_alloc(cnt);
+				if (!list) {
+					dma_resv_iter_end(&cursor);
+					return -ENOMEM;
+				}
 
-			fence = rcu_dereference(src_list->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &fence->flags))
-				continue;
+				list->shared_count = 0;
 
-			if (!dma_fence_get_rcu(fence)) {
-				dma_resv_list_free(dst_list);
-				src_list = dma_resv_shared_list(src);
-				goto retry;
+			} else {
+				list = NULL;
 			}
-
-			if (dma_fence_is_signaled(fence)) {
-				dma_fence_put(fence);
-				continue;
-			}
-
-			dst = &dst_list->shared[dst_list->shared_count++];
-			rcu_assign_pointer(*dst, fence);
+			excl = NULL;
 		}
-	} else {
-		dst_list = NULL;
-	}
 
-	new = dma_fence_get_rcu_safe(&src->fence_excl);
-	rcu_read_unlock();
-
-	src_list = dma_resv_shared_list(dst);
-	old = dma_resv_excl_fence(dst);
+		dma_fence_get(f);
+		if (dma_resv_iter_is_exclusive(&cursor))
+			excl = f;
+		else
+			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
+	}
+	dma_resv_iter_end(&cursor);
 
 	write_seqcount_begin(&dst->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(dst->fence_excl, new);
-	RCU_INIT_POINTER(dst->fence, dst_list);
+	excl = rcu_replace_pointer(dst->fence_excl, excl, dma_resv_held(dst));
+	list = rcu_replace_pointer(dst->fence, list, dma_resv_held(dst));
 	write_seqcount_end(&dst->seq);
 
-	dma_resv_list_free(src_list);
-	dma_fence_put(old);
+	dma_resv_list_free(list);
+	dma_fence_put(excl);
 
 	return 0;
 }
-- 
2.25.1

