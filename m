Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B439FE931
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD9F10E53D;
	Mon, 30 Dec 2024 16:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eE11UjXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB15710E53C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B1ijnfowIcz+OPNmF5MSit1uqKERNe7n5nKccOg1KDI=; b=eE11UjXFcEGRRwRsH/RbAcP5yE
 zqfo2IoCAZGYlhku7TBfIjnS0rMTg18hiY8tCzIvtX7asTpjSM9edjOi/AyJYSCWe++nQHmWPv5ca
 yVem3LDBGXcK2fHCSZtV2qhxB6yS1CWhMnRVq4bn2vFAX7PT5ldsWJrO/36sgSU9rC0VUBstb3wKk
 Ezd9r5ek8W3qA+uUSPvzi/azUcNfPfCSZnsvaPYifhXAhCp0pbAqAPTlkSYaTDUJS4HHBHMeAUJuJ
 vyRvZuC1t4OhDyg6jHRQbykIkEt6PvsyxSMSQi4JC6p771FY5U62tjJkNty8XfRnkkRLzogqHXEGv
 1Jf+y38A==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0z-009Zwm-5v; Mon, 30 Dec 2024 17:53:13 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 13/14] dma-fence: Add helper for custom fence context when
 merging fences
Date: Mon, 30 Dec 2024 16:52:58 +0000
Message-ID: <20241230165259.95855-14-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230165259.95855-1-tursulin@igalia.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Add a dma_fence_unwrap_merge_context() helper which works exactly the same
as the existing dma_fence_unwrap_merge() apart that instead of always
allocating a new fence context it allows the caller to specify it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/dma-buf/dma-fence-unwrap.c |  8 ++++----
 include/linux/dma-fence-unwrap.h   | 31 ++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 2a059ac0ed27..fd9813a50532 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -80,7 +80,8 @@ static int fence_cmp(const void *_a, const void *_b)
 }
 
 /* Implementation for the dma_fence_merge() marco, don't use directly */
-struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
+struct dma_fence *__dma_fence_unwrap_merge(u64 context,
+					   unsigned int num_fences,
 					   struct dma_fence **fences,
 					   struct dma_fence_unwrap *iter)
 {
@@ -156,9 +157,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	count = ++j;
 
 	if (count > 1) {
-		result = dma_fence_array_create(count, array,
-						dma_fence_context_alloc(1),
-						1, false);
+		result = dma_fence_array_create(count, array, context, 1,
+						false);
 		if (!result) {
 			for (i = 0; i < count; i++)
 				dma_fence_put(array[i]);
diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index 66b1e56fbb81..12e8c43848ce 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -8,6 +8,8 @@
 #ifndef __LINUX_DMA_FENCE_UNWRAP_H
 #define __LINUX_DMA_FENCE_UNWRAP_H
 
+#include <linux/types.h>
+
 struct dma_fence;
 
 /**
@@ -48,7 +50,8 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
 	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
 	     fence = dma_fence_unwrap_next(cursor))
 
-struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
+struct dma_fence *__dma_fence_unwrap_merge(u64 context,
+					   unsigned int num_fences,
 					   struct dma_fence **fences,
 					   struct dma_fence_unwrap *cursors);
 
@@ -69,7 +72,31 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 		struct dma_fence *__f[] = { __VA_ARGS__ };		\
 		struct dma_fence_unwrap __c[ARRAY_SIZE(__f)];		\
 									\
-		__dma_fence_unwrap_merge(ARRAY_SIZE(__f), __f, __c);	\
+		__dma_fence_unwrap_merge(dma_fence_context_alloc(1),	\
+					 ARRAY_SIZE(__f), __f, __c);	\
+	})
+
+/**
+ * dma_fence_unwrap_merge_context - unwrap and merge fences with context
+ *
+ * All fences given as parameters are unwrapped and merged back together as flat
+ * dma_fence_array. Useful if multiple containers need to be merged together.
+ *
+ * Implemented as a macro to allocate the necessary arrays on the stack and
+ * account the stack frame size to the caller.
+ *
+ * Fence context is passed in and not automatically allocated.
+ *
+ * Returns NULL on memory allocation failure, a dma_fence object representing
+ * all the given fences otherwise.
+ */
+#define dma_fence_unwrap_merge_context(context, ...)					\
+	({								\
+		struct dma_fence *__f[] = { __VA_ARGS__ };		\
+		struct dma_fence_unwrap __c[ARRAY_SIZE(__f)];		\
+									\
+		__dma_fence_unwrap_merge((context),			\
+					 ARRAY_SIZE(__f), __f, __c);	\
 	})
 
 #endif
-- 
2.47.1

