Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C34C498062
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E87210ED36;
	Mon, 24 Jan 2022 13:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4945710ECAC;
 Mon, 24 Jan 2022 13:03:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v13so13445019wrv.10;
 Mon, 24 Jan 2022 05:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MJIzfIJj7sWuWjvaqjpDxEclvLa+rSTBKh+L03ndIwY=;
 b=mayDO4SqOT6sf2NhBRvsP0DLMeVKsM7h9unw0ZHqmAWO5qafsGittBMwjgB4z6OJuQ
 jBzh/KUjDickCvFJoxImLwpQ+sWe+hi0m3cmoC8RVrEeGIbc44mSybgkJeLH095QjZfJ
 Iscy4NwK29NCxKpviz2Blk8d1UPvdiTwsE0Q+dNdpC7yeYOhs1683+YyjjZvAyyEnQQs
 wL7RdeiZpJaNpeQd4GrkUha0BCFhyDc9nau7zAFAdXS6j3kEoeWd6FpVnDtahI8vRzPq
 l+uXy/zp3B+bBcPruwUH842qiv29poaQp54esQjWkbHGlby30p3cPlz0mGDr/ELlnM6p
 XvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJIzfIJj7sWuWjvaqjpDxEclvLa+rSTBKh+L03ndIwY=;
 b=6C39EklZi/Y1WzL1NFqDpxhXoF3oSjFw2yOZtj4qEG1IAcfcdFYUbi5/I7FsgVjnaW
 PMpZShZCLHQqWn9wclh/ibXBmuax9Dnf/ZyMOdQFw/S3VcRLwNQYJCV1Kmfo2eaGNTvY
 2WOkLhM5Q0okMkMrD5bpBlrtA40tf2i9Eyhige8jIW84PR6JineDY/tSylFttDrcFYbe
 xevnIdKvlnNk9RaTlgd7N8e7/QCoQBu9K0IOjtq4A1PGaQjBV0NVILmaxSD31okacntL
 2UjGhfo8jUZ0znsDDm7WbGaQgBj3NCh7bCDkscO0+48Ndz/fAPBiDtmMjAnzUdGVbDRk
 KhXg==
X-Gm-Message-State: AOAM530L/YqamU2KPN7KLahb3W++CvH2JTvxi1WSfPXxitFM+YoCArWX
 v063yQdTcJFDurcYQwvyIUc=
X-Google-Smtp-Source: ABdhPJxs2g8ipzz/+fii/LaxWHZmuklRaYRFm9GrwFmRzJY1FJzjG8l+Js3pYAYVarlheQ8AYF0SAw==
X-Received: by 2002:adf:fe85:: with SMTP id l5mr13914919wrr.661.1643029421485; 
 Mon, 24 Jan 2022 05:03:41 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 05:03:41 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/11] drm/i915: use dma_fence extractor functions
Date: Mon, 24 Jan 2022 14:03:27 +0100
Message-Id: <20220124130328.2376-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

Instead of manually messing with the data structures use the iterators
and extraction helpers provided by the framework.

This whole handling should essentially go away when boost handling is
implemented in the core dma-buf framework.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 40 ++++++--------------
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 31 ++++------------
 drivers/gpu/drm/i915/i915_request.c      | 47 +++++++-----------------
 3 files changed, 33 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 470fdfd61a0f..4ea7a5b26405 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -41,6 +41,8 @@ static __always_inline unsigned int
 __busy_set_if_active(struct dma_fence *fence, u32 (*flag)(u16 id))
 {
 	const struct i915_request *rq;
+	struct dma_fence *current_fence;
+	unsigned int i;
 
 	/*
 	 * We have to check the current hw status of the fence as the uABI
@@ -58,40 +60,22 @@ __busy_set_if_active(struct dma_fence *fence, u32 (*flag)(u16 id))
 	 *
 	 * 2. A single i915 request.
 	 */
-	if (dma_fence_is_array(fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(fence);
-		struct dma_fence **child = array->fences;
-		unsigned int nchild = array->num_fences;
-
-		do {
-			struct dma_fence *current_fence = *child++;
-
-			/* Not an i915 fence, can't be busy per above */
-			if (!dma_fence_is_i915(current_fence) ||
-			    !test_bit(I915_FENCE_FLAG_COMPOSITE,
-				      &current_fence->flags)) {
-				return 0;
-			}
-
-			rq = to_request(current_fence);
-			if (!i915_request_completed(rq))
-				return flag(rq->engine->uabi_class);
-		} while (--nchild);
-
-		/* All requests in array complete, not busy */
-		return 0;
-	} else {
-		if (!dma_fence_is_i915(fence))
-			return 0;
+	dma_fence_array_for_each(current_fence, i, fence) {
 
-		rq = to_request(fence);
-		if (i915_request_completed(rq))
+		/* Not an i915 fence, can't be busy per above */
+		if (!dma_fence_is_i915(current_fence) ||
+		    !test_bit(I915_FENCE_FLAG_COMPOSITE, &current_fence->flags))
 			return 0;
 
+		rq = to_request(current_fence);
 		/* Beware type-expansion follies! */
 		BUILD_BUG_ON(!typecheck(u16, rq->engine->uabi_class));
-		return flag(rq->engine->uabi_class);
+		if (!i915_request_completed(rq))
+			return flag(rq->engine->uabi_class);
 	}
+
+	/* All requests in array complete, not busy */
+	return 0;
 }
 
 static __always_inline unsigned int
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index dab3d30c09a0..13f37b6aedf7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -72,11 +72,6 @@ static void fence_set_priority(struct dma_fence *fence,
 	rcu_read_unlock();
 }
 
-static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
-{
-	return fence->ops == &dma_fence_chain_ops;
-}
-
 void i915_gem_fence_wait_priority(struct dma_fence *fence,
 				  const struct i915_sched_attr *attr)
 {
@@ -85,25 +80,15 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
 
 	local_bh_disable();
 
-	/* Recurse once into a fence-array */
-	if (dma_fence_is_array(fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(fence);
-		int i;
+	/* The chain is ordered; if we boost the last, we boost all */
+	dma_fence_chain_for_each(fence, fence) {
+		struct dma_fence *array, *element;
+		unsigned int i;
 
-		for (i = 0; i < array->num_fences; i++)
-			fence_set_priority(array->fences[i], attr);
-	} else if (__dma_fence_is_chain(fence)) {
-		struct dma_fence *iter;
-
-		/* The chain is ordered; if we boost the last, we boost all */
-		dma_fence_chain_for_each(iter, fence) {
-			fence_set_priority(to_dma_fence_chain(iter)->fence,
-					   attr);
-			break;
-		}
-		dma_fence_put(iter);
-	} else {
-		fence_set_priority(fence, attr);
+		/* Recurse once into a fence-array */
+		array = dma_fence_chain_contained(fence);
+		dma_fence_array_for_each(element, i, array)
+			fence_set_priority(element, attr);
 	}
 
 	local_bh_enable(); /* kick the tasklets if queues were reprioritised */
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ad175d662b4e..2d8add5b5da9 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1345,18 +1345,15 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
 	struct dma_fence *iter;
 	int err = 0;
 
-	if (!to_dma_fence_chain(fence))
-		return __i915_request_await_external(rq, fence);
-
 	dma_fence_chain_for_each(iter, fence) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(iter);
+		struct dma_fence *tmp = dma_fence_chain_contained(iter);
 
-		if (!dma_fence_is_i915(chain->fence)) {
+		if (!dma_fence_is_i915(tmp)) {
 			err = __i915_request_await_external(rq, iter);
 			break;
 		}
 
-		err = i915_request_await_dma_fence(rq, chain->fence);
+		err = i915_request_await_dma_fence(rq, tmp);
 		if (err < 0)
 			break;
 	}
@@ -1386,24 +1383,14 @@ static bool is_same_parallel_context(struct i915_request *to,
 
 int
 i915_request_await_execution(struct i915_request *rq,
-			     struct dma_fence *fence)
+			     struct dma_fence *array)
 {
-	struct dma_fence **child = &fence;
-	unsigned int nchild = 1;
+	struct dma_fence *fence;
+	unsigned int i;
 	int ret;
 
-	if (dma_fence_is_array(fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(fence);
-
-		/* XXX Error for signal-on-any fence arrays */
+	dma_fence_array_for_each(fence, i, array) {
 
-		child = array->fences;
-		nchild = array->num_fences;
-		GEM_BUG_ON(!nchild);
-	}
-
-	do {
-		fence = *child++;
 		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 			continue;
 
@@ -1425,7 +1412,7 @@ i915_request_await_execution(struct i915_request *rq,
 		}
 		if (ret < 0)
 			return ret;
-	} while (--nchild);
+	}
 
 	return 0;
 }
@@ -1482,10 +1469,10 @@ i915_request_await_request(struct i915_request *to, struct i915_request *from)
 }
 
 int
-i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
+i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *array)
 {
-	struct dma_fence **child = &fence;
-	unsigned int nchild = 1;
+	struct dma_fence *fence;
+	unsigned int i;
 	int ret;
 
 	/*
@@ -1496,16 +1483,8 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
 	 * amdgpu and we should not see any incoming fence-array from
 	 * sync-file being in signal-on-any mode.
 	 */
-	if (dma_fence_is_array(fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(fence);
-
-		child = array->fences;
-		nchild = array->num_fences;
-		GEM_BUG_ON(!nchild);
-	}
+	dma_fence_array_for_each(fence, i, array) {
 
-	do {
-		fence = *child++;
 		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 			continue;
 
@@ -1537,7 +1516,7 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
 		if (fence->context)
 			intel_timeline_sync_set(i915_request_timeline(rq),
 						fence);
-	} while (--nchild);
+	}
 
 	return 0;
 }
-- 
2.25.1

