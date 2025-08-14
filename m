Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D8B2616A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E68810E827;
	Thu, 14 Aug 2025 09:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzIDCjbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3311210E83B;
 Thu, 14 Aug 2025 09:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755164949; x=1786700949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QkPxUdpuqr1DUVmmOcH04Inx+a3RZmbXnCVVRgnM76I=;
 b=lzIDCjbdP+qGy95hJCWu/kZzb9EOXKNC4GS27FAowwm/unV4ai0OFV5/
 KaCN+Dj4d82hN+r5Stv9Zx7HzS3W9XgrN+ugYJmkaU+yMRI9KBPWTrRYX
 8CEneg9aRcau0jAxdcruQVd1R1iVRUN5YwzHkEMa7fYHM0+O2iu9o3y19
 3+Y2Fo1+YEnR7brDc1nV3IQG/vrW7G89OW6+yyLBVtl/6kbkwePnhJS1i
 nHZvkhpP9zutCKQgc1SwLsqqAY5aeKH8cQnm8/u08FbunI98a4sUcVchn
 4n/IGNuswHQI9z1fFuYapjgHpOPIbhU0oV40KTRYfj8udPyU4udG2bz4H Q==;
X-CSE-ConnectionGUID: rURr2hYXSMmRTpb+tZoGxA==
X-CSE-MsgGUID: BgSrmcMHQDO9NJFgerll+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67746991"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="67746991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:49:09 -0700
X-CSE-ConnectionGUID: Rs2vrowXQQyB6UfU1Y+Jjw==
X-CSE-MsgGUID: MVSGJjwDRbG3McwsLsRftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166980981"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.150])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:49:05 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 4/4] dma-buf/fence-chain: Speed up processing of rearmed
 callbacks
Date: Thu, 14 Aug 2025 10:16:15 +0200
Message-ID: <20250814094824.217142-10-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When first user starts waiting on a not yet signaled fence of a chain
link, a dma_fence_chain callback is added to a user fence of that link.
When the user fence of that chain link is then signaled, the chain is
traversed in search for a first not signaled link and the callback is
rearmed on a user fence of that link.

Since chain fences may be exposed to user space, e.g. over drm_syncobj
IOCTLs, users may start waiting on any link of the chain, then many links
of a chain may have signaling enabled and their callbacks added to their
user fences.  Once an arbitrary user fence is signaled, all
dma_fence_chain callbacks added to it so far must be rearmed to another
user fence of the chain.  In extreme scenarios, when all N links of a
chain are awaited and then signaled in reverse order, the dma_fence_chain
callback may be called up to N * (N + 1) / 2 times (an arithmetic series).

To avoid that potential excessive accumulation of dma_fence_chain
callbacks, rearm a trimmed-down, signal only callback version to the base
fence of a previous link, if not yet signaled, otherwise just signal the
base fence of the current link instead of traversing the chain in search
for a first not signaled link and moving all callbacks collected so far to
a user fence of that link.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/dma-buf/dma-fence-chain.c | 101 +++++++++++++++++++++++++-----
 1 file changed, 84 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a8a90acf4f34d..90eff264ee05c 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -119,46 +119,113 @@ static const char *dma_fence_chain_get_timeline_name(struct dma_fence *fence)
         return "unbound";
 }
 
-static void dma_fence_chain_irq_work(struct irq_work *work)
+static void signal_irq_work(struct irq_work *work)
 {
 	struct dma_fence_chain *chain;
 
 	chain = container_of(work, typeof(*chain), work);
 
-	/* Try to rearm the callback */
-	if (!dma_fence_chain_enable_signaling(&chain->base))
-		/* Ok, we are done. No more unsignaled fences left */
-		dma_fence_signal(&chain->base);
+	dma_fence_signal(&chain->base);
 	dma_fence_put(&chain->base);
 }
 
-static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
+static void signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
+{
+	struct dma_fence_chain *chain;
+
+	chain = container_of(cb, typeof(*chain), cb);
+	init_irq_work(&chain->work, signal_irq_work);
+	irq_work_queue(&chain->work);
+}
+
+static void rearm_irq_work(struct irq_work *work)
+{
+	struct dma_fence_chain *chain;
+	struct dma_fence *prev;
+
+	chain = container_of(work, typeof(*chain), work);
+
+	rcu_read_lock();
+	prev = rcu_dereference(chain->prev);
+	if (prev && dma_fence_add_callback(prev, &chain->cb, signal_cb))
+		prev = NULL;
+	rcu_read_unlock();
+	if (prev)
+		return;
+
+	/* Ok, we are done. No more unsignaled fences left */
+	signal_irq_work(work);
+}
+
+static inline bool fence_is_signaled__nested(struct dma_fence *fence)
+{
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return true;
+
+	if (fence->ops->signaled && fence->ops->signaled(fence)) {
+		unsigned long flags;
+
+		spin_lock_irqsave_nested(fence->lock, flags, SINGLE_DEPTH_NESTING);
+		dma_fence_signal_locked(fence);
+		spin_unlock_irqrestore(fence->lock, flags);
+
+		return true;
+	}
+
+	return false;
+}
+
+static bool prev_is_signaled(struct dma_fence_chain *chain)
+{
+	struct dma_fence *prev;
+	bool result;
+
+	rcu_read_lock();
+	prev = rcu_dereference(chain->prev);
+	result = !prev || fence_is_signaled__nested(prev);
+	rcu_read_unlock();
+
+	return result;
+}
+
+static void rearm_or_signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 {
 	struct dma_fence_chain *chain;
 
 	chain = container_of(cb, typeof(*chain), cb);
-	init_irq_work(&chain->work, dma_fence_chain_irq_work);
+	if (prev_is_signaled(chain)) {
+		/* Ok, we are done. No more unsignaled fences left */
+		init_irq_work(&chain->work, signal_irq_work);
+	} else {
+		/* Try to rearm the callback */
+		init_irq_work(&chain->work, rearm_irq_work);
+	}
+
 	irq_work_queue(&chain->work);
-	dma_fence_put(f);
 }
 
 static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_chain *head = to_dma_fence_chain(fence);
+	int err = -ENOENT;
 
-	dma_fence_get(&head->base);
-	dma_fence_chain_for_each(fence, &head->base) {
-		struct dma_fence *f = dma_fence_chain_contained(fence);
+	if (WARN_ON(!head))
+		return false;
 
-		dma_fence_get(f);
-		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
+	dma_fence_get(fence);
+	if (head->fence)
+		err = dma_fence_add_callback(head->fence, &head->cb, rearm_or_signal_cb);
+	if (err) {
+		if (prev_is_signaled(head)) {
 			dma_fence_put(fence);
-			return true;
+		} else {
+			init_irq_work(&head->work, rearm_irq_work);
+			irq_work_queue(&head->work);
+			err = 0;
 		}
-		dma_fence_put(f);
 	}
-	dma_fence_put(&head->base);
-	return false;
+
+	return !err;
 }
 
 static bool dma_fence_chain_signaled(struct dma_fence *fence)
-- 
2.50.1

