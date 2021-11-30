Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE83463413
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 13:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB5B6E4AB;
	Tue, 30 Nov 2021 12:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDEA6E284;
 Tue, 30 Nov 2021 12:19:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="234926324"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="234926324"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 04:19:57 -0800
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="459577076"
Received: from hekner-mobl5.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.206])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 04:19:54 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/2] dma-fence: Avoid excessive recursive fence locking
 from enable_signaling() callbacks
Date: Tue, 30 Nov 2021 13:19:36 +0100
Message-Id: <20211130121936.586031-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
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
Cc: linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some dma-fence containers lock other fence's locks from their
enable_signaling() callbacks. We allow one level of nesting from
the dma_fence_add_callback_nested() function, but we would also like to
allow for example dma_fence_chain to point to a dma_fence_array and
vice versa, even though that would create additional levels of nesting.

To do that we need to break longer recursive chains of fence locking and
we can do that either by deferring dma_fence_add_callback_nested() to
a worker for affected fences or to call enable_signaling() early on
affected fences. Opt for the latter, and define a
DMA_FENCE_FLAG_LOCK_RECURSIVE_BIT for fence classes that takes fence
locks recursively from within their enable_signaling() callback.

Note that a user could of course also call enable_signaling() manually
on these fences before publishing them, but this solution attempts to
do that only when necessary.

Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 12 +++++++++++-
 drivers/dma-buf/dma-fence-chain.c |  9 +++++++++
 include/linux/dma-fence.h         |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 0322b92909fe..63ae9909bcfa 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -178,8 +178,18 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 	fence->error = PENDING_ERROR;
 
-	if (signal_on_any)
+	set_bit(DMA_FENCE_FLAG_LOCK_RECURSIVE_BIT, &fence->flags);
+
+	if (signal_on_any) {
 		dma_fence_enable_sw_signaling(fence);
+	} else {
+		int i;
+
+		for (i = 0; i < num_fences; i++, fences++)
+			if (test_bit(DMA_FENCE_FLAG_LOCK_RECURSIVE_BIT,
+				     &(*fences)->flags))
+				dma_fence_enable_sw_signaling(*fences);
+	}
 
 	return array;
 }
diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 0518e53880f6..b4012dbef0c9 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -255,5 +255,14 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 
 	dma_fence_init(&chain->base, &dma_fence_chain_ops,
 		       &chain->lock, context, seqno);
+
+	set_bit(DMA_FENCE_FLAG_LOCK_RECURSIVE_BIT, &chain->base.flags);
+	if (test_bit(DMA_FENCE_FLAG_LOCK_RECURSIVE_BIT, &fence->flags)) {
+		/*
+		 * Disable further calls into @fence's enable_signaling
+		 * To prohibit further recursive locking
+		 */
+		dma_fence_enable_sw_signaling(fence);
+	}
 }
 EXPORT_SYMBOL(dma_fence_chain_init);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 405cd83936f6..48bf5e14636e 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+	DMA_FENCE_FLAG_LOCK_RECURSIVE_BIT,
 	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
 };
 
-- 
2.31.1

