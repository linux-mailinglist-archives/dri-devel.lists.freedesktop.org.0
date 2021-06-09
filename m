Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6729E3A1F10
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19766EB83;
	Wed,  9 Jun 2021 21:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C237A6EB6F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:30:12 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id v11so4948353ply.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwH9BvcWQRM9Pbc0qvOae7i4EU7PPki/fj1kY1abKhQ=;
 b=vMpyc5vC6KwPg9tkOGnmFg5fdJ+apN1nFhKlt0jLKNoUzJgtYR3ETOK+7pQNTPMiQK
 BRSJuUPDHQHk9uXoPECKDNMMux5Ac4/gKzj6F8/aYwBlIvL9YyH+g4GOI2l3rM0q1/SQ
 U2/ztTlJ1iHqtceoEhB9BCq0LSoFmoQMq3PJScjso/0fOqbBUL5L6Ph8/4ahWk47w5MV
 7y4BltVRQQ0AKXKmkWxSy3rnbnqkBbtzwH4DuB1cSawdwHxPptAM7EhbBOCp4irYZYYM
 n7ybadOCx+LDrhEiTyxaXDAY2Mcr1Ei7EtdmRcVHx4uaWQYqPesYXiby34YwJVg8N0Bn
 zQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JwH9BvcWQRM9Pbc0qvOae7i4EU7PPki/fj1kY1abKhQ=;
 b=nPEOf5X8w4IIKAJWTprfDoQNT/RTUgSaJV4Y9GTgtrhrK11h3pjmHrf1AlK+zCRXsa
 KnwOqAWz2Hc+dCipzS+eLPLLVPoZ4k1OrlN3L00E4HMQ7J/nnuTcQSloCL2mMrgmHONF
 uLH0hh8SEe6c38lloZpnFcIqsuJLe1jJetSBfe4g+P6KN0IgW5WXW8Hc3cuxlD5eZMn+
 1ftGu9mCCIFf0XYKFkf2wBc4MJRqLydgm2J0H1zUSui7baAovELgF4So6oQKKZFyMyGx
 g23yFGucelyDZYfbd1zBLU3VW7IpMA7w6gtak8Yq85bmgE8I0OwVsXLxg28YgjhWpFp2
 KIkw==
X-Gm-Message-State: AOAM5313F9c30jJUIrX6tKOxYMvJpUfOJztA+Q78ixCxe3wPoIY0s/uw
 +5EHxlO13Y+NBqIf/NpioCU8NDuQgU+kSw==
X-Google-Smtp-Source: ABdhPJwGjhYeJkB8rrm1/R1AZmcp2jX5EPi12XfY9jYSLgOHeNj6siylXNjqy5X/GIpx8dGl3XK+vg==
X-Received: by 2002:a17:90a:e506:: with SMTP id
 t6mr1604852pjy.59.1623274211998; 
 Wed, 09 Jun 2021 14:30:11 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id u14sm519133pjx.14.2021.06.09.14.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:30:11 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] dma-buf: Stop using SLAB_TYPESAFE_BY_RCU in selftests
Date: Wed,  9 Jun 2021 16:29:58 -0500
Message-Id: <20210609212959.471209-5-jason@jlekstrand.net>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only real-world user of SLAB_TYPESAFE_BY_RCU was i915 and it doesn't
use that anymore so there's no need to be testing it in selftests.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/st-dma-fence-chain.c | 24 ++++--------------------
 drivers/dma-buf/st-dma-fence.c       | 27 +++++----------------------
 2 files changed, 9 insertions(+), 42 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 9525f7f561194..73010184559fe 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -19,36 +19,27 @@
 
 #define CHAIN_SZ (4 << 10)
 
-static struct kmem_cache *slab_fences;
-
-static inline struct mock_fence {
+struct mock_fence {
 	struct dma_fence base;
 	spinlock_t lock;
-} *to_mock_fence(struct dma_fence *f) {
-	return container_of(f, struct mock_fence, base);
-}
+};
 
 static const char *mock_name(struct dma_fence *f)
 {
 	return "mock";
 }
 
-static void mock_fence_release(struct dma_fence *f)
-{
-	kmem_cache_free(slab_fences, to_mock_fence(f));
-}
-
 static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
-	.release = mock_fence_release,
+	.release = dma_fence_free,
 };
 
 static struct dma_fence *mock_fence(void)
 {
 	struct mock_fence *f;
 
-	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
+	f = kmalloc(sizeof(*f), GFP_KERNEL);
 	if (!f)
 		return NULL;
 
@@ -701,14 +692,7 @@ int dma_fence_chain(void)
 	pr_info("sizeof(dma_fence_chain)=%zu\n",
 		sizeof(struct dma_fence_chain));
 
-	slab_fences = KMEM_CACHE(mock_fence,
-				 SLAB_TYPESAFE_BY_RCU |
-				 SLAB_HWCACHE_ALIGN);
-	if (!slab_fences)
-		return -ENOMEM;
-
 	ret = subtests(tests, NULL);
 
-	kmem_cache_destroy(slab_fences);
 	return ret;
 }
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index c8a12d7ad71ab..ca98cb0b9525b 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -14,25 +14,16 @@
 
 #include "selftest.h"
 
-static struct kmem_cache *slab_fences;
-
-static struct mock_fence {
+struct mock_fence {
 	struct dma_fence base;
 	struct spinlock lock;
-} *to_mock_fence(struct dma_fence *f) {
-	return container_of(f, struct mock_fence, base);
-}
+};
 
 static const char *mock_name(struct dma_fence *f)
 {
 	return "mock";
 }
 
-static void mock_fence_release(struct dma_fence *f)
-{
-	kmem_cache_free(slab_fences, to_mock_fence(f));
-}
-
 struct wait_cb {
 	struct dma_fence_cb cb;
 	struct task_struct *task;
@@ -77,14 +68,14 @@ static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
 	.wait = mock_wait,
-	.release = mock_fence_release,
+	.release = dma_fence_free,
 };
 
 static struct dma_fence *mock_fence(void)
 {
 	struct mock_fence *f;
 
-	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
+	f = kmalloc(sizeof(*f), GFP_KERNEL);
 	if (!f)
 		return NULL;
 
@@ -463,7 +454,7 @@ static int thread_signal_callback(void *arg)
 
 		rcu_read_lock();
 		do {
-			f2 = dma_fence_get_rcu_safe(&t->fences[!t->id]);
+			f2 = dma_fence_get_rcu(t->fences[!t->id]);
 		} while (!f2 && !kthread_should_stop());
 		rcu_read_unlock();
 
@@ -563,15 +554,7 @@ int dma_fence(void)
 
 	pr_info("sizeof(dma_fence)=%zu\n", sizeof(struct dma_fence));
 
-	slab_fences = KMEM_CACHE(mock_fence,
-				 SLAB_TYPESAFE_BY_RCU |
-				 SLAB_HWCACHE_ALIGN);
-	if (!slab_fences)
-		return -ENOMEM;
-
 	ret = subtests(tests, NULL);
 
-	kmem_cache_destroy(slab_fences);
-
 	return ret;
 }
-- 
2.31.1

