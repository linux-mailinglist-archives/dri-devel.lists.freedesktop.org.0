Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D873A1F0D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D996EB6C;
	Wed,  9 Jun 2021 21:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C456EB6A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:30:11 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so2442078pjz.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BG9tpybh3pbygSCt9T3vWKf6iagoboAQ8BQvwxHPpsE=;
 b=0PZCxFlqdgOwgUeiptjuRDmVy2XIV9oyTSVCRlWvGmx1Vd8WeDcP1xN9obHsdZrufu
 ppWBL0fUEXV5WNMkSz/XGAhJ8uA/X/mXcsbvjfSDFvV0j1mTum7GKswx2IWtlp0jGi29
 gtoAxZMKDyaIzHCaPwqaBCVrp1rGIIUzFJILX18zIybZGCGtrD6xFPkgufi+OJiUAANw
 eGqIBqqJrjpG4cDayoRmEJgZHWMZkRNFv85gb4PZOmDr2tbwDEhN/CTY2v+WkhHWQ06Z
 Fm56p103lltl14ZVv/E2jU4I3kMd9SwjEvlPKnFtvpsbLS0ssmsS7RjrYekk7ifsl46h
 uhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BG9tpybh3pbygSCt9T3vWKf6iagoboAQ8BQvwxHPpsE=;
 b=R67Dmxvx7gYKGxI/1jCFjcIC85Oi2iqLMxX/q2cIMbVhLOa8mROVRTX2bsajMfdQit
 bZwcyw3hEsHVZlEecQo5xZ0SAr2h/CTKkBADV9ey7LvS7cVkWlXNwJL4b/5vqmm5q60c
 qbJEY+I2KRXmvlWD39ic9pkqV1Ges3AQq1yoyCvyLrQtKz1LqLWRoPElxPzgKUOcbqp2
 wEdCH9xPz5l+DnpBie5safptEkE22u1Z5SraaeRiAbYamOdRrJb+VlN1M2svqkAZwILb
 CslgLvt2b9KI17qpIVbCaCJCL+wCYK7bWyqzElMhPehiz+6gab7OuVFnV+BljCFbF6Hd
 u4Aw==
X-Gm-Message-State: AOAM532FbZLeUoFbe7Nr0amq/UW21rlkJHss4Op0cVS2wn9WPe9+UbWe
 1NqTqtSsTbPevZb5/uIDs0xJJmI9ykKH1Q==
X-Google-Smtp-Source: ABdhPJyZHW5XcvVIrh9HZzGc7XNDtcQjWMJIthNTX7+zVQfEhrBNIFrI1YuDtk3oHBteH5HygmdYoQ==
X-Received: by 2002:a17:902:b687:b029:eb:6491:b3f7 with SMTP id
 c7-20020a170902b687b02900eb6491b3f7mr1713761pls.38.1623274210405; 
 Wed, 09 Jun 2021 14:30:10 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id u14sm519133pjx.14.2021.06.09.14.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:30:10 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: Stop using SLAB_TYPESAFE_BY_RCU for i915_request
Date: Wed,  9 Jun 2021 16:29:57 -0500
Message-Id: <20210609212959.471209-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609212959.471209-1-jason@jlekstrand.net>
References: <20210609212959.471209-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ever since 0eafec6d3244 ("drm/i915: Enable lockless lookup of request
tracking via RCU"), the i915 driver has used SLAB_TYPESAFE_BY_RCU (it
was called SLAB_DESTROY_BY_RCU at the time) in order to allow RCU on
i915_request.  As nifty as SLAB_TYPESAFE_BY_RCU may be, it comes with
some serious disclaimers.  In particular, objects can get recycled while
RCU readers are still in-flight.  This can be ok if everyone who touches
these objects knows about the disclaimers and is careful.  However,
because we've chosen to use SLAB_TYPESAFE_BY_RCU for i915_request and
because i915_request contains a dma_fence, we've leaked
SLAB_TYPESAFE_BY_RCU and its whole pile of disclaimers to every driver
in the kernel which may consume a dma_fence.

We've tried to keep it somewhat contained by doing most of the hard work
to prevent access of recycled objects via dma_fence_get_rcu_safe().
However, a quick grep of kernel sources says that, of the 30 instances
of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe().
It's likely there bear traps in DRM and related subsystems just waiting
for someone to accidentally step in them.

This commit gets stops us using SLAB_TYPESAFE_BY_RCU for i915_request
and, instead, does an RCU-safe slab free via rcu_call().  This should
let us keep most of the perf benefits of slab allocation while avoiding
the bear traps inherent in SLAB_TYPESAFE_BY_RCU.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 76 ++++++++++++++++-------------
 1 file changed, 43 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index e531c74f0b0e2..55fa938126100 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -111,9 +111,44 @@ void intel_engine_free_request_pool(struct intel_engine_cs *engine)
 	if (!engine->request_pool)
 		return;
 
+	/*
+	 * It's safe to free this right away because we always put a fresh
+	 * i915_request in the cache that's never been touched by an RCU
+	 * reader.
+	 */
 	kmem_cache_free(global.slab_requests, engine->request_pool);
 }
 
+static void __i915_request_free(struct rcu_head *head)
+{
+	struct i915_request *rq = container_of(head, typeof(*rq), fence.rcu);
+
+	kmem_cache_free(global.slab_requests, rq);
+}
+
+static void i915_request_free_rcu(struct i915_request *rq)
+{
+	/*
+	 * Because we're on a slab allocator, memory may be re-used the
+	 * moment we free it.  There is no kfree_rcu() equivalent for
+	 * slabs.  Instead, we hand-roll it here with call_rcu().  This
+	 * gives us all the perf benefits to slab allocation while ensuring
+	 * that we never release a request back to the slab until there are
+	 * no more readers.
+	 *
+	 * We do have to be careful, though, when calling kmem_cache_destroy()
+	 * as there may be outstanding free requests.  This is solved by
+	 * inserting an rcu_barrier() before kmem_cache_destroy().  An RCU
+	 * barrier is sufficient and we don't need synchronize_rcu()
+	 * because the call_rcu() here will wait on any outstanding RCU
+	 * readers and the rcu_barrier() will wait on any outstanding
+	 * call_rcu() callbacks.  So, if there are any readers who once had
+	 * valid references to a request, rcu_barrier() will end up waiting
+	 * on them by transitivity.
+	 */
+	call_rcu(&rq->fence.rcu, __i915_request_free);
+}
+
 static void i915_fence_release(struct dma_fence *fence)
 {
 	struct i915_request *rq = to_request(fence);
@@ -127,8 +162,7 @@ static void i915_fence_release(struct dma_fence *fence)
 	 */
 	i915_sw_fence_fini(&rq->submit);
 	i915_sw_fence_fini(&rq->semaphore);
-
-	kmem_cache_free(global.slab_requests, rq);
+	i915_request_free_rcu(rq);
 }
 
 const struct dma_fence_ops i915_fence_ops = {
@@ -933,35 +967,6 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 	 */
 	ensure_cached_request(&ce->engine->request_pool, gfp);
 
-	/*
-	 * Beware: Dragons be flying overhead.
-	 *
-	 * We use RCU to look up requests in flight. The lookups may
-	 * race with the request being allocated from the slab freelist.
-	 * That is the request we are writing to here, may be in the process
-	 * of being read by __i915_active_request_get_rcu(). As such,
-	 * we have to be very careful when overwriting the contents. During
-	 * the RCU lookup, we change chase the request->engine pointer,
-	 * read the request->global_seqno and increment the reference count.
-	 *
-	 * The reference count is incremented atomically. If it is zero,
-	 * the lookup knows the request is unallocated and complete. Otherwise,
-	 * it is either still in use, or has been reallocated and reset
-	 * with dma_fence_init(). This increment is safe for release as we
-	 * check that the request we have a reference to and matches the active
-	 * request.
-	 *
-	 * Before we increment the refcount, we chase the request->engine
-	 * pointer. We must not call kmem_cache_zalloc() or else we set
-	 * that pointer to NULL and cause a crash during the lookup. If
-	 * we see the request is completed (based on the value of the
-	 * old engine and seqno), the lookup is complete and reports NULL.
-	 * If we decide the request is not completed (new engine or seqno),
-	 * then we grab a reference and double check that it is still the
-	 * active request - which it won't be and restart the lookup.
-	 *
-	 * Do not use kmem_cache_zalloc() here!
-	 */
 	rq = kmem_cache_alloc(global.slab_requests,
 			      gfp | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 	if (unlikely(!rq)) {
@@ -2116,6 +2121,12 @@ static void i915_global_request_shrink(void)
 
 static void i915_global_request_exit(void)
 {
+	/*
+	 * We need to rcu_barrier() before destroying slab_requests.  See
+	 * i915_request_free_rcu() for more details.
+	 */
+	rcu_barrier();
+
 	kmem_cache_destroy(global.slab_execute_cbs);
 	kmem_cache_destroy(global.slab_requests);
 }
@@ -2132,8 +2143,7 @@ int __init i915_global_request_init(void)
 				  sizeof(struct i915_request),
 				  __alignof__(struct i915_request),
 				  SLAB_HWCACHE_ALIGN |
-				  SLAB_RECLAIM_ACCOUNT |
-				  SLAB_TYPESAFE_BY_RCU,
+				  SLAB_RECLAIM_ACCOUNT,
 				  __i915_request_ctor);
 	if (!global.slab_requests)
 		return -ENOMEM;
-- 
2.31.1

