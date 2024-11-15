Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB709CDC72
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 11:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3756B10E839;
	Fri, 15 Nov 2024 10:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="d3JM5mkL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD22F10E835
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eqW/t25YKHYvQCP61dOJTS86fGo5Twr3i+hAXKR6SFs=; b=d3JM5mkLrgNDMY7ZKVqxqOLAJR
 CfEMDlY4jokEozFgJ/fqeikoDKgRJ0e5Aj+ZiMC65Tj3MEz+n2Yl7c1y23D8ijJgqZrVSBZtfdgNL
 iX48Tzv9eUoeGV/D0Q5gL+Y5jLrufJB6JDhA3bg3iTYhPYNL/+oT4sU4R+10nV3DuWj/vP8j3w/I4
 xMTyFupe7SFsDIzccpA49KYiVfayErsjZVeDbKjr4hdEei9E/si5Jn4i/I0geh2v4VnF2cE2gtByp
 9fQj0m+E5RnlHezDIdcJyROyHM2WHQOQS3cUBCxrbGFgPyBlEhPcgl0wMgTjBGw9hetjXB1+z/17x
 R5FvykJA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tBtSf-007EAe-2u; Fri, 15 Nov 2024 11:21:57 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: [PATCH 2/5] dma-fence: Use kernel's sort for merging fences
Date: Fri, 15 Nov 2024 10:21:50 +0000
Message-ID: <20241115102153.1980-3-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241115102153.1980-1-tursulin@igalia.com>
References: <20241115102153.1980-1-tursulin@igalia.com>
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

One alternative to the fix Christian proposed in
https://lore.kernel.org/dri-devel/20241024124159.4519-3-christian.koenig@amd.com/
is to replace the rather complex open coded sorting loops with the kernel
standard sort followed by a context squashing pass.

Proposed advantage of this would be readability but one concern Christian
raised was that there could be many fences, that they are typically mostly
sorted, and so the kernel's heap sort would be much worse by the proposed
algorithm.

I had a look running some games and vkcube to see what are the typical
number of input fences. Tested scenarios:

1) Hogwarts Legacy under Gamescope

450 calls per second to __dma_fence_unwrap_merge.

Percentages per number of fences buckets, before and after checking for
signalled status, sorting and flattening:

   N       Before      After
   0       0.91%
   1      69.40%
  2-3     28.72%       9.4%  (90.6% resolved to one fence)
  4-5      0.93%
  6-9      0.03%
  10+

2) Cyberpunk 2077 under Gamescope

1050 calls per second, amounting to 0.01% CPU time according to perf top.

   N       Before      After
   0       1.13%
   1      52.30%
  2-3     40.34%       55.57%
  4-5      1.46%        0.50%
  6-9      2.44%
  10+      2.34%

3) vkcube under Plasma

90 calls per second.

   N       Before      After
   0
   1
  2-3      100%         0%   (Ie. all resolved to a single fence)
  4-5
  6-9
  10+

In the case of vkcube all invocations in the 2-3 bucket were actually
just two input fences.

From these numbers it looks like the heap sort should not be a
disadvantage, given how the dominant case is <= 2 input fences which heap
sort solves with just one compare and swap. (And for the case of one input
fence we have a fast path in the previous patch.)

A complementary possibility is to implement a different sorting algorithm
under the same API as the kernel's sort() and so keep the simplicity,
potentially moving the new sort under lib/ if it would be found more
widely useful.

v2:
 * Hold on to fence references and reduce commentary. (Christian)
 * Record and use latest signaled timestamp in the 2nd loop too.
 * Consolidate zero or one fences fast paths.

v3:
 * Reverse the seqno sort order for a simpler squashing pass. (Christian)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 245a4a7b531c ("dma-buf: generalize dma_fence unwrap & merging v3")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3617
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org> # v6.0+
---
 drivers/dma-buf/dma-fence-unwrap.c | 128 ++++++++++++++---------------
 1 file changed, 61 insertions(+), 67 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index b19d0adf6086..6345062731f1 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -12,6 +12,7 @@
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-fence-unwrap.h>
 #include <linux/slab.h>
+#include <linux/sort.h>
 
 /* Internal helper to start new array iteration, don't use directly */
 static struct dma_fence *
@@ -59,6 +60,25 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
 }
 EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
 
+
+static int fence_cmp(const void *_a, const void *_b)
+{
+	struct dma_fence *a = *(struct dma_fence **)_a;
+	struct dma_fence *b = *(struct dma_fence **)_b;
+
+	if (a->context < b->context)
+		return -1;
+	else if (a->context > b->context)
+		return 1;
+
+	if (dma_fence_is_later(b, a))
+		return 1;
+	else if (dma_fence_is_later(a, b))
+		return -1;
+
+	return 0;
+}
+
 /* Implementation for the dma_fence_merge() marco, don't use directly */
 struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 					   struct dma_fence **fences,
@@ -67,8 +87,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	struct dma_fence_array *result;
 	struct dma_fence *tmp, **array;
 	ktime_t timestamp;
-	unsigned int i;
-	size_t count;
+	int i, j, count;
 
 	count = 0;
 	timestamp = ns_to_ktime(0);
@@ -96,80 +115,55 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	if (!array)
 		return NULL;
 
-	/*
-	 * This trashes the input fence array and uses it as position for the
-	 * following merge loop. This works because the dma_fence_merge()
-	 * wrapper macro is creating this temporary array on the stack together
-	 * with the iterators.
-	 */
-	for (i = 0; i < num_fences; ++i)
-		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
-
 	count = 0;
-	do {
-		unsigned int sel;
-
-restart:
-		tmp = NULL;
-		for (i = 0; i < num_fences; ++i) {
-			struct dma_fence *next;
-
-			while (fences[i] && dma_fence_is_signaled(fences[i]))
-				fences[i] = dma_fence_unwrap_next(&iter[i]);
-
-			next = fences[i];
-			if (!next)
-				continue;
-
-			/*
-			 * We can't guarantee that inpute fences are ordered by
-			 * context, but it is still quite likely when this
-			 * function is used multiple times. So attempt to order
-			 * the fences by context as we pass over them and merge
-			 * fences with the same context.
-			 */
-			if (!tmp || tmp->context > next->context) {
-				tmp = next;
-				sel = i;
-
-			} else if (tmp->context < next->context) {
-				continue;
-
-			} else if (dma_fence_is_later(tmp, next)) {
-				fences[i] = dma_fence_unwrap_next(&iter[i]);
-				goto restart;
+	for (i = 0; i < num_fences; ++i) {
+		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
+			if (!dma_fence_is_signaled(tmp)) {
+				array[count++] = dma_fence_get(tmp);
 			} else {
-				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
-				goto restart;
+				ktime_t t = dma_fence_timestamp(tmp);
+
+				if (ktime_after(t, timestamp))
+					timestamp = t;
 			}
 		}
-
-		if (tmp) {
-			array[count++] = dma_fence_get(tmp);
-			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
-		}
-	} while (tmp);
-
-	if (count == 0) {
-		tmp = dma_fence_allocate_private_stub(ktime_get());
-		goto return_tmp;
 	}
 
-	if (count == 1) {
-		tmp = array[0];
-		goto return_tmp;
-	}
+	if (count == 0 || count == 1)
+		goto return_fastpath;
+
+	sort(array, count, sizeof(*array), fence_cmp, NULL);
 
-	result = dma_fence_array_create(count, array,
-					dma_fence_context_alloc(1),
-					1, false);
-	if (!result) {
-		for (i = 0; i < count; i++)
+	/*
+	 * Only keep the most recent fence for each context.
+	 */
+	j = 0;
+	for (i = 1; i < count; i++) {
+		if (array[i]->context == array[j]->context)
 			dma_fence_put(array[i]);
-		tmp = NULL;
-		goto return_tmp;
+		else
+			array[++j] = array[i];
 	}
-	return &result->base;
+	count = ++j;
+
+	if (count > 1) {
+		result = dma_fence_array_create(count, array,
+						dma_fence_context_alloc(1),
+						1, false);
+		if (!result) {
+			for (i = 0; i < count; i++)
+				dma_fence_put(array[i]);
+			tmp = NULL;
+			goto return_tmp;
+		}
+		return &result->base;
+	}
+
+return_fastpath:
+	if (count == 0)
+		tmp = dma_fence_allocate_private_stub(timestamp);
+	else
+		tmp = array[0];
 
 return_tmp:
 	kfree(array);
-- 
2.46.0

