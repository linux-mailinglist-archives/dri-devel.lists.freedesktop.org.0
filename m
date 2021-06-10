Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D3A3A281D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A25B6EC97;
	Thu, 10 Jun 2021 09:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708946EC91;
 Thu, 10 Jun 2021 09:18:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso6078138wmg.2; 
 Thu, 10 Jun 2021 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BjeLzdv5CJdZ+kjl5N5cB4i0YWorPBc0kCEKEtj36hk=;
 b=Sa0V5bOX2duti/B0xp/yQlouSvyehGMybsJv64VJbDXSP65dmbnRyBeUk9rLYRRSk5
 iHCXkHaDMOiPw6cV09034/j4+RKyZOVY/q2M9BivE8lqrdPBwfCmJCuvJZ1l94H3FKhz
 o5bfgOaqhPJUVdFD/Gr+ngT4C12kmZ7TKzHtl+VOc+K59LyrE54GbOlOLILykjZqeKAR
 b/j061/L+rcqEMjBcK/nPSZuP56MuC5hUORRtYNKv8MPhsKFn2IVwaa2FnKMSB16a998
 Fm4XOb+v01liBGJeHGwqBOaLmkMHkDetFU5moO2jHD6NFNfQEe0go7gXutxFkZY68HxO
 23hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BjeLzdv5CJdZ+kjl5N5cB4i0YWorPBc0kCEKEtj36hk=;
 b=QPhVIeWjGGbJscaps+M9AP1lTNWWuzVsnCiK1it+QyJrAeZxwd4P2dX2VfsfX3SKpI
 SONlm9Ed6UoroPc71+ufgHhQkThPxQCITYiQgW6YWFdNdLLHeTI6l/C4GiSfyoTBgA9G
 x/BuDp2op2Y7lb8C7ad8GZ/PwAPpD2h3txcJKEIzaL5i2Z3rwkv2C69HCP0nqCeK8njN
 IN1Q+/1IKDCa9Raam4AmPyc3B2Qiq/mJaLrTpvgUFgywhOI/anPm1aOc8TPH8wRpZPWn
 B89MTZ7qjW8tvA/QaCQVChs74PaSrHxz4L1ES68u4IDMvS9oFJ2s8fxWG3B3sqIUbCm5
 uGUw==
X-Gm-Message-State: AOAM530+5D/YI0avsQ4IaPwQmzFX2YIbXnuIDzgerijKVVShYkxO67Dm
 vuWGC6jMlNWO91dQcOSAj4lvodDEOfc=
X-Google-Smtp-Source: ABdhPJzJom7o/I8KWbXJK9cMCt6ovyYn3xmDoLbM4QHhtCauCbjwYekHC0PhGdvlWORi9WNqh7h4vQ==
X-Received: by 2002:a1c:282:: with SMTP id 124mr14406988wmc.82.1623316685075; 
 Thu, 10 Jun 2021 02:18:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:561f:e43a:edf5:8f95])
 by smtp.gmail.com with ESMTPSA id v8sm3087445wrc.29.2021.06.10.02.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:18:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] dma-buf: add dma_fence_chain_garbage_collect
Date: Thu, 10 Jun 2021 11:17:57 +0200
Message-Id: <20210610091800.1833-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610091800.1833-1-christian.koenig@amd.com>
References: <20210610091800.1833-1-christian.koenig@amd.com>
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

Add some rather sophisticated lockless garbage collection
for dma_fence_chain objects.

For this keep all initialized dma_fence_chain nodes an a
queue and trigger garbage collection before a new one is
allocated.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 160 +++++++++++++++++++++++++-----
 include/linux/dma-fence-chain.h   |   5 +
 2 files changed, 142 insertions(+), 23 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 1b4cb3e5cec9..c2f0b69eabb7 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -9,8 +9,53 @@
 
 #include <linux/dma-fence-chain.h>
 
+static struct dma_fence_chain __rcu *fifo_front;
+static struct dma_fence_chain __rcu **fifo_back = &fifo_front;
+
 static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
 
+/**
+ * dma_fence_chain_enqueue - enqeue a chain node for garbage collection
+ * @chain: the chain node to enqueue
+ *
+ * Add the chain node to the end of the gc fifo.
+ */
+static void dma_fence_chain_enqueue(struct dma_fence_chain *chain)
+{
+	struct dma_fence_chain __rcu **tmp;
+
+	RCU_INIT_POINTER(chain->next, NULL);
+	tmp = xchg((struct dma_fence_chain __force ***)&fifo_back,
+		   &chain->next);
+
+	/* This is intentionally unordered since we only need the fifo for gc */
+	rcu_assign_pointer(*tmp, chain);
+}
+
+/**
+ * dma_fence_chain_dequeue - deqeueue a chain node for garbage collection
+ *
+ * Remove the first chain node from the gc fifo while making sure that always
+ * keep at least one node on the fifo for lockless fifo implementation.
+ * Returns the dequeued chain node or NULL.
+ */
+static struct dma_fence_chain *dma_fence_chain_dequeue(void)
+{
+	struct dma_fence_chain *chain, *tmp;
+
+	rcu_read_lock();
+	chain = rcu_dereference(fifo_front);
+	/* Never dequeue the last chain node for lockless fifo */
+	if (unlikely(!chain || !rcu_access_pointer(chain->next))) {
+		rcu_read_unlock();
+		return NULL;
+	}
+	tmp = cmpxchg((struct dma_fence_chain __force **)&fifo_front,
+		      chain, rcu_access_pointer(chain->next));
+	rcu_read_unlock();
+	return tmp == chain ? chain : NULL;
+}
+
 /**
  * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
  * @chain: chain node to get the previous node from
@@ -28,6 +73,43 @@ static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
 	return prev;
 }
 
+/**
+ * dma_fence_chain_try_replace - try to replace the prev node
+ * @chain: Chain node we try to replace prev.
+ * @prev: the old prev node
+ *
+ * Try to replace the previous chain node when it or its containing fence is
+ * signaled. Returns true if we tried, false if we need to wait.
+ */
+static bool dma_fence_chain_try_replace(struct dma_fence_chain *chain,
+					struct dma_fence *prev)
+{
+	struct dma_fence *replacement, *tmp;
+	struct dma_fence_chain *prev_chain;
+
+	prev_chain = to_dma_fence_chain(prev);
+	if (prev_chain) {
+		if (!dma_fence_is_signaled(prev_chain->fence))
+			return false;
+
+		replacement = dma_fence_chain_get_prev(prev_chain);
+	} else {
+		if (!dma_fence_is_signaled(prev))
+			return false;
+
+		replacement = NULL;
+	}
+
+	tmp = cmpxchg((struct dma_fence __force **)&chain->prev, prev,
+		      replacement);
+	if (tmp == prev)
+		dma_fence_put(tmp);
+	else
+		dma_fence_put(replacement);
+
+	return true;
+}
+
 /**
  * dma_fence_chain_walk - chain walking function
  * @fence: current chain node
@@ -38,8 +120,8 @@ static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
  */
 struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
 {
-	struct dma_fence_chain *chain, *prev_chain;
-	struct dma_fence *prev, *replacement, *tmp;
+	struct dma_fence_chain *chain;
+	struct dma_fence *prev;
 
 	chain = to_dma_fence_chain(fence);
 	if (!chain) {
@@ -48,26 +130,8 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
 	}
 
 	while ((prev = dma_fence_chain_get_prev(chain))) {
-
-		prev_chain = to_dma_fence_chain(prev);
-		if (prev_chain) {
-			if (!dma_fence_is_signaled(prev_chain->fence))
-				break;
-
-			replacement = dma_fence_chain_get_prev(prev_chain);
-		} else {
-			if (!dma_fence_is_signaled(prev))
-				break;
-
-			replacement = NULL;
-		}
-
-		tmp = cmpxchg((struct dma_fence __force **)&chain->prev,
-			      prev, replacement);
-		if (tmp == prev)
-			dma_fence_put(tmp);
-		else
-			dma_fence_put(replacement);
+		if (!dma_fence_chain_try_replace(chain, prev))
+			break;
 		dma_fence_put(prev);
 	}
 
@@ -205,7 +269,21 @@ static void dma_fence_chain_release(struct dma_fence *fence)
 	dma_fence_put(prev);
 
 	dma_fence_put(chain->fence);
-	dma_fence_free(fence);
+	WRITE_ONCE(chain->fence, NULL);
+
+	/*
+	 * Don't garbage collect here to avoid recursion and potential stack
+	 * overflow.
+	 */
+	chain = dma_fence_chain_dequeue();
+	if (!chain)
+		return;
+
+	if (kref_read(&chain->base.refcount) ||
+	    READ_ONCE(chain->fence))
+		dma_fence_chain_enqueue(chain);
+	else
+		dma_fence_free(&chain->base);
 }
 
 const struct dma_fence_ops dma_fence_chain_ops = {
@@ -218,6 +296,40 @@ const struct dma_fence_ops dma_fence_chain_ops = {
 };
 EXPORT_SYMBOL(dma_fence_chain_ops);
 
+/**
+ * dma_fence_chain_garbage_collect - cleanup chain nodes
+ *
+ * Do some garbage collection and try to release chain nodes.
+ */
+void dma_fence_chain_garbage_collect(void)
+{
+	struct dma_fence_chain *chain = dma_fence_chain_dequeue();
+
+	if (!chain)
+		return;
+
+	if (!dma_fence_get_rcu(&chain->base)) {
+		/* Unused, check if it's also clean */
+		if (likely(!READ_ONCE(chain->fence))) {
+			dma_fence_free(&chain->base);
+			return;
+		}
+
+	} else {
+		struct dma_fence *prev;
+
+		/* Used, do some chain walk */
+		prev = dma_fence_chain_get_prev(chain);
+		if (prev) {
+			dma_fence_chain_try_replace(chain, prev);
+			dma_fence_put(prev);
+		}
+		dma_fence_put(&chain->base);
+	}
+	dma_fence_chain_enqueue(chain);
+}
+EXPORT_SYMBOL(dma_fence_chain_garbage_collect);
+
 /**
  * dma_fence_chain_init - initialize a fence chain
  * @chain: the chain node to initialize
@@ -254,5 +366,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 
 	dma_fence_init(&chain->base, &dma_fence_chain_ops,
 		       &chain->lock, context, seqno);
+	dma_fence_chain_enqueue(chain);
 }
+
 EXPORT_SYMBOL(dma_fence_chain_init);
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index 5f45689a6d2e..b412b5396434 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -19,6 +19,7 @@
  * @base: fence base class
  * @lock: spinlock for fence handling
  * @prev: previous fence of the chain
+ * @next: next chain node for garbage collection
  * @prev_seqno: original previous seqno before garbage collection
  * @fence: encapsulated fence
  * @cb: callback structure for signaling
@@ -27,6 +28,7 @@
 struct dma_fence_chain {
 	struct dma_fence base;
 	struct dma_fence __rcu *prev;
+	struct dma_fence_chain __rcu *next;
 	u64 prev_seqno;
 	struct dma_fence *fence;
 	union {
@@ -38,6 +40,8 @@ struct dma_fence_chain {
 
 extern const struct dma_fence_ops dma_fence_chain_ops;
 
+void dma_fence_chain_garbage_collect(void);
+
 /**
  * to_dma_fence_chain - cast a fence to a dma_fence_chain
  * @fence: fence to cast to a dma_fence_array
@@ -61,6 +65,7 @@ to_dma_fence_chain(struct dma_fence *fence)
  */
 static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
 {
+	dma_fence_chain_garbage_collect();
 	return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
 };
 
-- 
2.25.1

