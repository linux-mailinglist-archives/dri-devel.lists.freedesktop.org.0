Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A373718A8
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056C889623;
	Mon,  3 May 2021 15:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687226E8E8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:58:14 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id p12so3929596pgj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYabUSPE0YRQY2b5Ue+1QZI32n9lhIDHptBnWE+tKCo=;
 b=C23Tiy8W+9oXTZpTv6UPVBY9VxBF0U9wCPppmrI76vmdk2X7JSRYW4tvXntUyLIok9
 46M6OJ+tsY9Af0scujswx4Wnx3YtiA9bWc7HIuQZc0sxsWAtSCW7FP87eZklA4RpvrSf
 zNnRfh73KAVbhYAJ8rAHsHFG6FwzjigBmxBv5DQ+F2asA2JhZLjK8DKFuq2g64qx++Lx
 Bq+u5b+MVXDuN+NRHRbN75IOuMOFto7PHGwBwvXmh55629AllxXjygl+vOfjP1xHaLwA
 Ggyby+kMBxQMIhcmMm910M0ipNHta4ii0OaaIQ/I4NxkvEGMKrFIgmCWLPhlFIj9oOap
 aAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYabUSPE0YRQY2b5Ue+1QZI32n9lhIDHptBnWE+tKCo=;
 b=Vn2BsxTrLLFFPvvFRNQ55X3Zd4WlKW9/5a3FkUbnk6ho1z2WV+H9HUHgwYGptMY4Hm
 JBmiMbLXnIQTLWnPZZYCSC9GcD7aYu+PGteM47WgsQ+DM2a2AcjPZQUlVC9LNFQBtWdJ
 z+hi4ipX7TxEPcIMIK/LwokY9Tu3F9wezuwtI/kQUtBkFsjiPKfNIMSZMW6e6c/7rZKY
 mYosl3bYeAnOtxVuGmGPED79P1Uzd6UWEFFA3NUoHqynsOtQ4QHEUxQ9GY8Q6qcyelJ3
 kXOc7Vzm6Wc/HZ3o5y8D6SJ/nc6MpELIuymzk22sKpW1BJ9gJjddIWCTydp0Fdu6VteR
 Ir+g==
X-Gm-Message-State: AOAM530qTNZel5uuqVqhY2t3VRJg6G+UfPR62CCKHK0mb1SbKV8JTXq6
 o3OAl1JRN+xftdmDx54nbVp9hg==
X-Google-Smtp-Source: ABdhPJzRd/krqmd9dhhGvuGQso5RoQENfMwyoMKaCpZmenKWVODkF0kHaj9Ctv9ZFud49b6R0WPGNQ==
X-Received: by 2002:a62:ed0b:0:b029:25c:9ea2:abea with SMTP id
 u11-20020a62ed0b0000b029025c9ea2abeamr19646830pfh.46.1620057493887; 
 Mon, 03 May 2021 08:58:13 -0700 (PDT)
Received: from omlet.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id gf21sm9783296pjb.20.2021.05.03.08.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:58:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/27] drm/i915/request: Remove the hook from await_execution
Date: Mon,  3 May 2021 10:57:32 -0500
Message-Id: <20210503155748.1961781-12-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503155748.1961781-1-jason@jlekstrand.net>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was only ever used for FENCE_SUBMIT automatic engine selection
which was removed in the previous commit.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  3 +-
 drivers/gpu/drm/i915/i915_request.c           | 42 ++++---------------
 drivers/gpu/drm/i915/i915_request.h           |  4 +-
 3 files changed, 9 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index efb2fa3522a42..7024adcd5cf15 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3473,8 +3473,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	if (in_fence) {
 		if (args->flags & I915_EXEC_FENCE_SUBMIT)
 			err = i915_request_await_execution(eb.request,
-							   in_fence,
-							   NULL);
+							   in_fence);
 		else
 			err = i915_request_await_dma_fence(eb.request,
 							   in_fence);
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index bec9c3652188b..7e00218b8c105 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -49,7 +49,6 @@
 struct execute_cb {
 	struct irq_work work;
 	struct i915_sw_fence *fence;
-	void (*hook)(struct i915_request *rq, struct dma_fence *signal);
 	struct i915_request *signal;
 };
 
@@ -180,17 +179,6 @@ static void irq_execute_cb(struct irq_work *wrk)
 	kmem_cache_free(global.slab_execute_cbs, cb);
 }
 
-static void irq_execute_cb_hook(struct irq_work *wrk)
-{
-	struct execute_cb *cb = container_of(wrk, typeof(*cb), work);
-
-	cb->hook(container_of(cb->fence, struct i915_request, submit),
-		 &cb->signal->fence);
-	i915_request_put(cb->signal);
-
-	irq_execute_cb(wrk);
-}
-
 static __always_inline void
 __notify_execute_cb(struct i915_request *rq, bool (*fn)(struct irq_work *wrk))
 {
@@ -517,17 +505,12 @@ static bool __request_in_flight(const struct i915_request *signal)
 static int
 __await_execution(struct i915_request *rq,
 		  struct i915_request *signal,
-		  void (*hook)(struct i915_request *rq,
-			       struct dma_fence *signal),
 		  gfp_t gfp)
 {
 	struct execute_cb *cb;
 
-	if (i915_request_is_active(signal)) {
-		if (hook)
-			hook(rq, &signal->fence);
+	if (i915_request_is_active(signal))
 		return 0;
-	}
 
 	cb = kmem_cache_alloc(global.slab_execute_cbs, gfp);
 	if (!cb)
@@ -537,12 +520,6 @@ __await_execution(struct i915_request *rq,
 	i915_sw_fence_await(cb->fence);
 	init_irq_work(&cb->work, irq_execute_cb);
 
-	if (hook) {
-		cb->hook = hook;
-		cb->signal = i915_request_get(signal);
-		cb->work.func = irq_execute_cb_hook;
-	}
-
 	/*
 	 * Register the callback first, then see if the signaler is already
 	 * active. This ensures that if we race with the
@@ -1253,7 +1230,7 @@ emit_semaphore_wait(struct i915_request *to,
 		goto await_fence;
 
 	/* Only submit our spinner after the signaler is running! */
-	if (__await_execution(to, from, NULL, gfp))
+	if (__await_execution(to, from, gfp))
 		goto await_fence;
 
 	if (__emit_semaphore_wait(to, from, from->fence.seqno))
@@ -1284,16 +1261,14 @@ static int intel_timeline_sync_set_start(struct intel_timeline *tl,
 
 static int
 __i915_request_await_execution(struct i915_request *to,
-			       struct i915_request *from,
-			       void (*hook)(struct i915_request *rq,
-					    struct dma_fence *signal))
+			       struct i915_request *from)
 {
 	int err;
 
 	GEM_BUG_ON(intel_context_is_barrier(from->context));
 
 	/* Submit both requests at the same time */
-	err = __await_execution(to, from, hook, I915_FENCE_GFP);
+	err = __await_execution(to, from, I915_FENCE_GFP);
 	if (err)
 		return err;
 
@@ -1406,9 +1381,7 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
 
 int
 i915_request_await_execution(struct i915_request *rq,
-			     struct dma_fence *fence,
-			     void (*hook)(struct i915_request *rq,
-					  struct dma_fence *signal))
+			     struct dma_fence *fence)
 {
 	struct dma_fence **child = &fence;
 	unsigned int nchild = 1;
@@ -1441,8 +1414,7 @@ i915_request_await_execution(struct i915_request *rq,
 
 		if (dma_fence_is_i915(fence))
 			ret = __i915_request_await_execution(rq,
-							     to_request(fence),
-							     hook);
+							     to_request(fence));
 		else
 			ret = i915_request_await_external(rq, fence);
 		if (ret < 0)
@@ -1468,7 +1440,7 @@ await_request_submit(struct i915_request *to, struct i915_request *from)
 							&from->submit,
 							I915_FENCE_GFP);
 	else
-		return __i915_request_await_execution(to, from, NULL);
+		return __i915_request_await_execution(to, from);
 }
 
 static int
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 270f6cd37650c..63b087a7f5707 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -352,9 +352,7 @@ int i915_request_await_object(struct i915_request *to,
 int i915_request_await_dma_fence(struct i915_request *rq,
 				 struct dma_fence *fence);
 int i915_request_await_execution(struct i915_request *rq,
-				 struct dma_fence *fence,
-				 void (*hook)(struct i915_request *rq,
-					      struct dma_fence *signal));
+				 struct dma_fence *fence);
 
 void i915_request_add(struct i915_request *rq);
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
