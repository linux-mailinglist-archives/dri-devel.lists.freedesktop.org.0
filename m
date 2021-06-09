Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BA3A1F11
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381E26EB61;
	Wed,  9 Jun 2021 21:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308C56EB8D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:30:15 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id e1so13412926pld.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TVM6IqkVxgF758A5cge42oRP8xpTXQAuAHmNBA0fFv0=;
 b=vgD4miESEhiOO5Ipfy3sfslWwzjyKiWCpZSzZlqy1cwgg/0zWGow0db1bcdXr3B5ia
 rtDv6xX9JPJYEWQ5kysiQSLrXXhR019g1tJ4DntjjzxJRSaa+Ao3f0QnSFUBAiwtw6sv
 Rr7n13Nn+zxAzb4t19CvQnBOQZOSGJ3R0HORQNdlCHufvfgBh7jCgEQpmcLKLOM/PJcH
 1pr5Uq66suhIxO7xa9XqwmzQV7wrx4MjhKBRPm0bPItaH8aEWWjLUBv3Fobfwg0lqGWg
 gNEp+5aQCRpHlaoNF5MP6jw7cIl7gYtcsl4ofbCPEdStThOpD2VI80+zSxoXdM+i8G39
 /scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TVM6IqkVxgF758A5cge42oRP8xpTXQAuAHmNBA0fFv0=;
 b=baxahVT8k9g2o3HinEW+v1PuNBmqFMxUSOlY/dyBYxK3O8+9rwU/3RS79q4ZgNzepq
 D0uLyo4CfFZhkw9V14XZT2J2N2EnDhSL2TnkgiZ9Vw/3LQSB5Glj0i2H3qXIhoOWnWwL
 iUeougxiq6rnCvTSD4iyqiRprgT/6l+KVmcPM3FkKIb5RQGB6YodRfzOSqq75HSAH7Gq
 mxc9nYJR/jFhSNSawHifv/8NWHULFuzM2oMxJqSaT0+ahf2GO+ad1Fe8akVmtDsFQIGg
 yXU/TQCUDNSdQGXfRl9DNwP5EgP4eRj9EoVqb4LRhJUDkpCRktBPn7nYCdq9utL8dYE0
 rKRQ==
X-Gm-Message-State: AOAM533eb7BM/ijC1cs/A4j46q6wpwp2ymdk9UioBC0+XWWSZoiQDgfx
 OFjHQXgCmFa5hSwZkQgWUPMLCm9U3ZTOqQ==
X-Google-Smtp-Source: ABdhPJxA7otZafFMLRTV6Q2ddhPEa1XgHZ6ZhrzXeSXf6tntPEcgFP6S38N9qoUqvaOPomgnSMqFzg==
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr6503097pjr.83.1623274214438; 
 Wed, 09 Jun 2021 14:30:14 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id u14sm519133pjx.14.2021.06.09.14.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:30:14 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
Date: Wed,  9 Jun 2021 16:29:59 -0500
Message-Id: <20210609212959.471209-6-jason@jlekstrand.net>
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

This helper existed to handle the weird corner-cases caused by using
SLAB_TYPESAFE_BY_RCU for backing dma_fence.  Now that no one is using
that anymore (i915 was the only real user), dma_fence_get_rcu is
sufficient.  The one slightly annoying thing we have to deal with here
is that dma_fence_get_rcu_safe did an rcu_dereference as well as a
SLAB_TYPESAFE_BY_RCU-safe dma_fence_get_rcu.  This means each call site
ends up being 3 lines instead of 1.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-fence-chain.c         |  8 ++--
 drivers/dma-buf/dma-resv.c                |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  4 +-
 drivers/gpu/drm/i915/i915_active.h        |  4 +-
 drivers/gpu/drm/i915/i915_vma.c           |  4 +-
 include/drm/drm_syncobj.h                 |  4 +-
 include/linux/dma-fence.h                 | 50 -----------------------
 include/linux/dma-resv.h                  |  4 +-
 8 files changed, 23 insertions(+), 59 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 7d129e68ac701..46dfc7d94d8ed 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -15,15 +15,17 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
  * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
  * @chain: chain node to get the previous node from
  *
- * Use dma_fence_get_rcu_safe to get a reference to the previous fence of the
- * chain node.
+ * Use rcu_dereference and dma_fence_get_rcu to get a reference to the
+ * previous fence of the chain node.
  */
 static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
 {
 	struct dma_fence *prev;
 
 	rcu_read_lock();
-	prev = dma_fence_get_rcu_safe(&chain->prev);
+	prev = rcu_dereference(chain->prev);
+	if (prev)
+		prev = dma_fence_get_rcu(prev);
 	rcu_read_unlock();
 	return prev;
 }
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f26c71747d43a..cfe0db3cca292 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -376,7 +376,9 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 		dst_list = NULL;
 	}
 
-	new = dma_fence_get_rcu_safe(&src->fence_excl);
+	new = rcu_dereference(src->fence_excl);
+	if (new)
+		new = dma_fence_get_rcu(new);
 	rcu_read_unlock();
 
 	src_list = dma_resv_shared_list(dst);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 72d9b92b17547..0aeb6117f3893 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -161,7 +161,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
 		struct dma_fence *old;
 
 		rcu_read_lock();
-		old = dma_fence_get_rcu_safe(ptr);
+		old = rcu_dereference(*ptr);
+		if (old)
+			old = dma_fence_get_rcu(old);
 		rcu_read_unlock();
 
 		if (old) {
diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
index d0feda68b874f..bd89cfc806ca5 100644
--- a/drivers/gpu/drm/i915/i915_active.h
+++ b/drivers/gpu/drm/i915/i915_active.h
@@ -103,7 +103,9 @@ i915_active_fence_get(struct i915_active_fence *active)
 	struct dma_fence *fence;
 
 	rcu_read_lock();
-	fence = dma_fence_get_rcu_safe(&active->fence);
+	fence = rcu_dereference(active->fence);
+	if (fence)
+		fence = dma_fence_get_rcu(fence);
 	rcu_read_unlock();
 
 	return fence;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 0f227f28b2802..ed0388d99197e 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -351,7 +351,9 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
 		struct dma_fence *fence;
 
 		rcu_read_lock();
-		fence = dma_fence_get_rcu_safe(&vma->active.excl.fence);
+		fence = rcu_dereference(vma->active.excl.fence);
+		if (fence)
+			fence = dma_fence_get_rcu(fence);
 		rcu_read_unlock();
 		if (fence) {
 			err = dma_fence_wait(fence, MAX_SCHEDULE_TIMEOUT);
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 6cf7243a1dc5e..6c45d52988bcc 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -105,7 +105,9 @@ drm_syncobj_fence_get(struct drm_syncobj *syncobj)
 	struct dma_fence *fence;
 
 	rcu_read_lock();
-	fence = dma_fence_get_rcu_safe(&syncobj->fence);
+	fence = rcu_dereference(syncobj->fence);
+	if (fence)
+		fence = dma_fence_get_rcu(syncobj->fence);
 	rcu_read_unlock();
 
 	return fence;
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c63715..f4a2ab2b1ae46 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -307,56 +307,6 @@ static inline struct dma_fence *dma_fence_get_rcu(struct dma_fence *fence)
 		return NULL;
 }
 
-/**
- * dma_fence_get_rcu_safe  - acquire a reference to an RCU tracked fence
- * @fencep: pointer to fence to increase refcount of
- *
- * Function returns NULL if no refcount could be obtained, or the fence.
- * This function handles acquiring a reference to a fence that may be
- * reallocated within the RCU grace period (such as with SLAB_TYPESAFE_BY_RCU),
- * so long as the caller is using RCU on the pointer to the fence.
- *
- * An alternative mechanism is to employ a seqlock to protect a bunch of
- * fences, such as used by struct dma_resv. When using a seqlock,
- * the seqlock must be taken before and checked after a reference to the
- * fence is acquired (as shown here).
- *
- * The caller is required to hold the RCU read lock.
- */
-static inline struct dma_fence *
-dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
-{
-	do {
-		struct dma_fence *fence;
-
-		fence = rcu_dereference(*fencep);
-		if (!fence)
-			return NULL;
-
-		if (!dma_fence_get_rcu(fence))
-			continue;
-
-		/* The atomic_inc_not_zero() inside dma_fence_get_rcu()
-		 * provides a full memory barrier upon success (such as now).
-		 * This is paired with the write barrier from assigning
-		 * to the __rcu protected fence pointer so that if that
-		 * pointer still matches the current fence, we know we
-		 * have successfully acquire a reference to it. If it no
-		 * longer matches, we are holding a reference to some other
-		 * reallocated pointer. This is possible if the allocator
-		 * is using a freelist like SLAB_TYPESAFE_BY_RCU where the
-		 * fence remains valid for the RCU grace period, but it
-		 * may be reallocated. When using such allocators, we are
-		 * responsible for ensuring the reference we get is to
-		 * the right fence, as below.
-		 */
-		if (fence == rcu_access_pointer(*fencep))
-			return rcu_pointer_handoff(fence);
-
-		dma_fence_put(fence);
-	} while (1);
-}
-
 #ifdef CONFIG_LOCKDEP
 bool dma_fence_begin_signalling(void);
 void dma_fence_end_signalling(bool cookie);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 562b885cf9c3d..a38c021f379af 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -248,7 +248,9 @@ dma_resv_get_excl_unlocked(struct dma_resv *obj)
 		return NULL;
 
 	rcu_read_lock();
-	fence = dma_fence_get_rcu_safe(&obj->fence_excl);
+	fence = rcu_dereference(obj->fence_excl);
+	if (fence)
+		fence = dma_fence_get_rcu(fence);
 	rcu_read_unlock();
 
 	return fence;
-- 
2.31.1

