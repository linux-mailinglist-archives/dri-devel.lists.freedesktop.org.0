Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE5D3C165D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859686E8FC;
	Thu,  8 Jul 2021 15:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB2E6E8FC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:52 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id j65so2160941oih.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pFMwKIcvctwuKS1bGVunVyZHpZepUagjcn/JbCKlIg4=;
 b=PaF1/sLPSEmdF3PxqrF1E1PIJvtbdfuZBv4AON+5dT8pRNfkGyPbMf6RYfoM4IWMxo
 npLEfc0zC4BmoAKXadZJ5W38E5ayaruNopxbLcWL3FGBeQ/jjzxdL8RvK9Op4d1gC5cS
 h8M5Md65TfdFduYderDIRbSLQzKIkMp/ZH0k/YVL6Qm7ZeZwuz0BEeONfAi+OEE06m8j
 wgmRe67Ofdz5b3tsnvKOwb17FypxmLyzoFuEEcaY75XsGDJ8B0PL8fggOo218GBt2XcA
 xq1MudR3+752/ZM7IV0hKf98iLfsIpZXuRn6qgJXitGllg8EzExkYZPtNhNpwqWdz6g8
 A4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pFMwKIcvctwuKS1bGVunVyZHpZepUagjcn/JbCKlIg4=;
 b=JAmo6AUcoxoD0EmH0DmV0+C6IXA7uZLN8mqN7UFvYUOwc1vq2R8B0Jhg52+BezBcW3
 ZBwpdrUYKCqszBc7MLb0BS/WTXri/SMKWhN6YIS9kIU4Sy4k4eTvlcgLC+3TiX/ySp42
 zw3+TYQIxL2pyxaEWKFZW8572Ig0tnmtFAO917PB/kDvZ5UoPUOXd1BTFOrCWzXWNoKG
 9jFPUlfYKT4+X6OJ3oTtwA9KXX9c44K6/V5aLGlArkrJ2fuVCHLtneiPbf1M1TzYnHa7
 H6irOVSkY3oB3j32BHEVeouOPrUh9ekeJh7LwT8hY6mVkFH+AWdqCbjeHlVYOp4iUWui
 xY4Q==
X-Gm-Message-State: AOAM5321B+mIzk1sgo+SKBvXAPVlBizCvXUEdbcOYtMuXqbjcDtd/PF4
 bxeAW2GcXwAe2zjp4OKo7Ay0j2DTMGsSnA==
X-Google-Smtp-Source: ABdhPJxNqzVYdQUna3KNcZyYFipaL1IHAH25yAk49z0/ncS95Ljqm7D8rBee391l2FXAlsXg7yi5HQ==
X-Received: by 2002:aca:f257:: with SMTP id q84mr4199177oih.154.1625759331989; 
 Thu, 08 Jul 2021 08:48:51 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:51 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/30] drm/i915/request: Remove the hook from await_execution
Date: Thu,  8 Jul 2021 10:48:16 -0500
Message-Id: <20210708154835.528166-12-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was only ever used for FENCE_SUBMIT automatic engine selection
which was removed in the previous commit.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  3 +-
 drivers/gpu/drm/i915/i915_request.c           | 42 ++++---------------
 drivers/gpu/drm/i915/i915_request.h           |  4 +-
 3 files changed, 9 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 30498948c83d0..9aa7e10d16308 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3492,8 +3492,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
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
index c5989c0b83d3e..86b4c9f2613d5 100644
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
index 239964bec1fa9..5deb65ec5fa52 100644
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

