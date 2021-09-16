Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECD540D893
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F3C6ECE6;
	Thu, 16 Sep 2021 11:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6994E6ECE4;
 Thu, 16 Sep 2021 11:30:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so4232168wml.3; 
 Thu, 16 Sep 2021 04:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lk3oe7jd0ROGelEGuVWrKv7P02+XgNlJcG1PQH1ynXw=;
 b=QxoNOnVr12YzBjC8i8hbtYkXQP448dxlKr+yyOwXrDRQjlKQGftvNOmPTAbyU95Rq0
 TZvsz6Z/j+AkwK8fM8fp4iA0c4ILoXvfCP+qB0vdF7clGS7jeVkCq16sLABJ16FTE7ZF
 ou+aXCaqkoey19Dp8rYXYe1DbG1mok2DLIFa8dMZZpNiK0wnv5ZyFiUXF8bt3PYkpNqg
 j8UlMA70NxVy50eFNvmxcOpX7IT7PhPQr3R6A/gO7ZbxItI6Ql4/pdpAVMGUrad4uVLP
 HlrUO31kskAvfSwTbsoME5iGLBuiWlk+rAqNpwIS/wdyX2BjC61lrzkMbSLy58pfM33/
 llNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lk3oe7jd0ROGelEGuVWrKv7P02+XgNlJcG1PQH1ynXw=;
 b=6PyM78r5mGIb2K6qy48TAk3bvcDnIuZHrPa77pZSVbM3g/6/9QSHyOgUg3Za7LmOn3
 q0HI5cTuIQpGsgVzleCpldjG+n3Bc9HT7M/fAcQpXpBsUyoyd20Txi7idYeBxdPmnNWG
 wO92ve24OfqEyl4g4lwHUVYncisCg5Y6gHrPUMyD4C6OGRWn0NoGiwHkrRPEj3Vj3RaA
 yPqkdsB1bT7e9FfMHz/MZrhdatPrEqFNRxigI06s2A+he7V5aDkWaLAzTGgiY79HbbLc
 np4x4OYGYySanEHG/hdcsN3ZV39s0HBtTD8OTmceBzypafT7UpSLmmeuceCib4vlmmNE
 ThPg==
X-Gm-Message-State: AOAM530Su9CJsRvwsiaFYPFaJ/HF38tNC9FhduIWzB99wbidWUajtDKe
 1WPtphelc1kgTGGciVdmiZySS1O1LOT0xrLq
X-Google-Smtp-Source: ABdhPJxJWeVOcQBoyg8E/JZygcbHAE61VaITutgDRIte/T1bn/u8pbsBr8OEao7h6dKqE3B+9enw2w==
X-Received: by 2002:a1c:1dcd:: with SMTP id d196mr4408782wmd.9.1631791846961; 
 Thu, 16 Sep 2021 04:30:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v2
Date: Thu, 16 Sep 2021 13:30:17 +0200
Message-Id: <20210916113042.3631-2-christian.koenig@amd.com>
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

Abstract the complexity of iterating over all the fences
in a dma_resv object.

The new loop handles the whole RCU and retry dance and
returns only fences where we can be sure we grabbed the
right one.

v2: fix accessing the shared fences while they might be freed,
    improve kerneldoc, rename _cursor to _iter, add
    dma_resv_iter_is_exclusive

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 62 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 50 ++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 84fbe60629e3..77083170ec3b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,68 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
+ * @obj: the dma_resv object
+ * @cursor: cursor to record the current position
+ * @all_fences: true returns also the shared fences
+ * @first: if we should start over
+ *
+ * Return all the fences in the dma_resv object which are not yet signaled.
+ * The returned fence has an extra local reference so will stay alive.
+ * If a concurrent modify is detected the whole iterator is started over again.
+ */
+struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
+					 struct dma_resv_iter *cursor,
+					 bool all_fences, bool first)
+{
+	struct dma_fence *fence = NULL;
+
+	first |= read_seqcount_retry(&obj->seq, cursor->seq);
+	do {
+		/* Drop the reference from the previous round */
+		dma_fence_put(fence);
+
+		cursor->is_first = first;
+		if (first) {
+			cursor->seq = read_seqcount_begin(&obj->seq);
+			cursor->index = -1;
+			cursor->fences = dma_resv_shared_list(obj);
+
+			fence = dma_resv_excl_fence(obj);
+			if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+					      &fence->flags))
+				fence = NULL;
+		} else {
+			fence = NULL;
+		}
+
+		if (fence) {
+			fence = dma_fence_get_rcu(fence);
+		} else if (all_fences && cursor->fences) {
+			struct dma_resv_list *fences = cursor->fences;
+
+			while (++cursor->index < fences->shared_count) {
+				fence = rcu_dereference(
+					fences->shared[cursor->index]);
+				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+					      &fence->flags))
+					break;
+			}
+			if (cursor->index < fences->shared_count)
+				fence = dma_fence_get_rcu(fence);
+			else
+				fence = NULL;
+		}
+
+		/* For the eventually next round */
+		first = true;
+	} while (read_seqcount_retry(&obj->seq, cursor->seq));
+
+	return fence;
+}
+EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 9100dd3dc21f..1cd686384c71 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -149,6 +149,53 @@ struct dma_resv {
 	struct dma_resv_list __rcu *fence;
 };
 
+/**
+ * struct dma_resv_iter - current position into the dma_resv fences
+ *
+ * Don't touch this directly in the driver, use the accessor function instead.
+ */
+struct dma_resv_iter {
+	/** @seq: sequence number to check for modifications */
+	unsigned int seq;
+
+	/** @index: index into the shared fences */
+	unsigned int index;
+
+	/** @fences: the shared fences */
+	struct dma_resv_list *fences;
+
+	/** @is_first: true if this is the first returned fence */
+	bool is_first;
+};
+
+/**
+ * dma_resv_for_each_fence_unlocked - fence iterator
+ * @obj: a dma_resv object pointer
+ * @cursor: a struct dma_resv_iter pointer
+ * @all_fences: true if all fences should be returned
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object without holding the
+ * dma_resv::lock. The RCU read side lock must be hold when using this, but can
+ * be dropped and re-taken as necessary inside the loop. @all_fences controls
+ * if the shared fences are returned as well.
+ */
+#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, fence)    \
+	for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, true); \
+	     fence; dma_fence_put(fence),				    \
+	     fence = dma_resv_walk_unlocked(obj, cursor, all_fences, false))
+
+/**
+ * dma_resv_iter_is_exclusive - test if the current fence is the exclusive one
+ * @cursor: the cursor of the current position
+ *
+ * Returns true if the currently returned fence is the exclusive one.
+ */
+static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
+{
+	return cursor->index == -1;
+}
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
@@ -366,6 +413,9 @@ void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
+					 struct dma_resv_iter *cursor,
+					 bool first, bool all_fences);
 int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 			unsigned *pshared_count, struct dma_fence ***pshared);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
-- 
2.25.1

