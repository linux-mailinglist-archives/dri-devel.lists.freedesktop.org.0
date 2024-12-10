Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF39EAC66
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 10:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECFB10E865;
	Tue, 10 Dec 2024 09:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SQvlKUB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AC910E862
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 09:37:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7AF7E5C03C4;
 Tue, 10 Dec 2024 09:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A56AC4CED6;
 Tue, 10 Dec 2024 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1733823447;
 bh=g+cB3JmBIhhfkoQBg9abWXL5AtPCBJ3vgcFnIa26Zbs=;
 h=Subject:To:Cc:From:Date:From;
 b=SQvlKUB45pq5snlaLfloRcnFElhcD3yHrzQSPhjBVrDT7visTAaYx3iNSFvB/hWWA
 1I0TAgUTJRwlczx0SlXyaWx+iBV8BNrzd6iP13oAskNNUZw1PzO7ZYIEuQv4yhBgvk
 FO0fc6tO9YAojn+2xujmaChZiGKenTrg3HfskkTo=
Subject: Patch "dma-fence: Use kernel's sort for merging fences" has been
 added to the 6.6-stable tree
To: 20241024124159.4519-3-christian.koenig@amd.com, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, friedrich.vock@gmx.de,
 gregkh@linuxfoundation.org, gustavo@padovan.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 tvrtko.ursulin@igalia.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 10 Dec 2024 10:35:54 +0100
Message-ID: <2024121054-scheming-galleria-6fb0@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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


This is a note to let you know that I've just added the patch titled

    dma-fence: Use kernel's sort for merging fences

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     dma-fence-use-kernel-s-sort-for-merging-fences.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From fe52c649438b8489c9456681d93a9b3de3d38263 Mon Sep 17 00:00:00 2001
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Fri, 15 Nov 2024 10:21:50 +0000
Subject: dma-fence: Use kernel's sort for merging fences
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

commit fe52c649438b8489c9456681d93a9b3de3d38263 upstream.

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
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241115102153.1980-3-tursulin@igalia.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/dma-buf/dma-fence-unwrap.c |  126 +++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 66 deletions(-)

--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -12,6 +12,7 @@
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-fence-unwrap.h>
 #include <linux/slab.h>
+#include <linux/sort.h>
 
 /* Internal helper to start new array iteration, don't use directly */
 static struct dma_fence *
@@ -59,6 +60,25 @@ struct dma_fence *dma_fence_unwrap_next(
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
@@ -67,8 +87,7 @@ struct dma_fence *__dma_fence_unwrap_mer
 	struct dma_fence_array *result;
 	struct dma_fence *tmp, **array;
 	ktime_t timestamp;
-	unsigned int i;
-	size_t count;
+	int i, j, count;
 
 	count = 0;
 	timestamp = ns_to_ktime(0);
@@ -96,80 +115,55 @@ struct dma_fence *__dma_fence_unwrap_mer
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
+	}
 
-		if (tmp) {
-			array[count++] = dma_fence_get(tmp);
-			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
-		}
-	} while (tmp);
+	if (count == 0 || count == 1)
+		goto return_fastpath;
 
-	if (count == 0) {
-		tmp = dma_fence_allocate_private_stub(ktime_get());
-		goto return_tmp;
-	}
+	sort(array, count, sizeof(*array), fence_cmp, NULL);
 
-	if (count == 1) {
-		tmp = array[0];
-		goto return_tmp;
+	/*
+	 * Only keep the most recent fence for each context.
+	 */
+	j = 0;
+	for (i = 1; i < count; i++) {
+		if (array[i]->context == array[j]->context)
+			dma_fence_put(array[i]);
+		else
+			array[++j] = array[i];
 	}
+	count = ++j;
 
-	result = dma_fence_array_create(count, array,
-					dma_fence_context_alloc(1),
-					1, false);
-	if (!result) {
-		for (i = 0; i < count; i++)
-			dma_fence_put(array[i]);
-		tmp = NULL;
-		goto return_tmp;
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
 	}
-	return &result->base;
+
+return_fastpath:
+	if (count == 0)
+		tmp = dma_fence_allocate_private_stub(timestamp);
+	else
+		tmp = array[0];
 
 return_tmp:
 	kfree(array);


Patches currently in stable-queue which might be from tvrtko.ursulin@igalia.com are

queue-6.6/dma-fence-use-kernel-s-sort-for-merging-fences.patch
queue-6.6/dma-buf-fix-dma_fence_array_signaled-v4.patch
queue-6.6/dma-fence-fix-reference-leak-on-fence-merge-failure-path.patch
