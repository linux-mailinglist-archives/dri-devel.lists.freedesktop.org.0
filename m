Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E372641387E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3A96E9BC;
	Tue, 21 Sep 2021 17:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C293C6E9B7;
 Tue, 21 Sep 2021 17:37:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t8so34599944wri.1;
 Tue, 21 Sep 2021 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsreTZOz3Mb7qsFiEa7uoiRjKKLfQUk3amxyH2msw+c=;
 b=HVJbPn4BuCPavgHPeC9SDcszwbfeFCFUvt1kjzhx++cx8sbsUVFYQ589IO3+WPXNGY
 lDVIpN8kHeSdHd64YII4u9T7i6xkPNnVg9NrSCi7JhALQKLNrmLZbzik9n9uHYYv/5Hd
 tigeJHlVhLm/Y/XZwyNNdo2auIqjIFwT1+vHMvu2IFUAZ7uSYkGp37+EKnpVA1JV+irh
 B7hZpMBASnm37eqggWMgLaNKTMrxLUYjfUHyANHaQdJtLyAhg1NP14Kpuf/7OYZBL8/H
 11F9UQlW9XiPvFqULDGZZKMyVbd9tscnRTPO3PC0Akve0mCz4MzO2tp0rVjl/8yIGH6i
 7Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsreTZOz3Mb7qsFiEa7uoiRjKKLfQUk3amxyH2msw+c=;
 b=YlbfQ5VgplFayiOUIVEm+8lbn1Y3hjf8SJ68xWSccxvcdmaeB9QLhzSUoeEvncS9aJ
 U0G96Dh+V7losG4qkbKtHQsTA7z5qxGEDMMAFp8FzFSeAw+/Fim76kgTChaNaRT9Zq0m
 RPCD15bnsknW7PRTMDmz7OxveEEu2veS/nMFxpTXqdgmncsOouXW/xBfaAOpdx8CQ1O0
 bsE3qVjalCbNy2WNBfrhB+ih4pbnVIkrN3vGG55geIK9e8QRHYVWb9WNio5XICFbDIIE
 QU7e5FQOLZG8Eer4LDWvmmoxqOh4mDoutEth2BoANxtFn9axGAuKSWU/a9zezlfKl9xZ
 JsOg==
X-Gm-Message-State: AOAM532ydBhV3E+7/OWysGxoDQJ4BemXP8GzeGTYYSbGCY8fO9yjj5mg
 PjHIRLb3ZkOiOu6w5piVsScnuaRP/E0=
X-Google-Smtp-Source: ABdhPJxeOBpCyOST96o+k1GeZ5AWinOdU20b2CLxVjq08+xAuc5PVve1dbzXUFcNcuY4E7pD11KcCw==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr37101506wrt.267.1632245824216; 
 Tue, 21 Sep 2021 10:37:04 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 03/26] dma-buf: use new iterator in dma_resv_copy_fences
Date: Tue, 21 Sep 2021 19:36:36 +0200
Message-Id: <20210921173659.246165-3-christian.koenig@amd.com>
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
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 84 +++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 52 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index e6819cbbcd23..a6d7404c978e 100644
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

