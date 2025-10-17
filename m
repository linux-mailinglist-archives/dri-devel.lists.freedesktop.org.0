Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A9BBE7C2B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 11:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8F510EB86;
	Fri, 17 Oct 2025 09:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bRyZzAED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CDE10EB86
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 09:32:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6D4D74A7F1;
 Fri, 17 Oct 2025 09:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3027DC4CEE7;
 Fri, 17 Oct 2025 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760693576;
 bh=D5qz7gPz3Z7WJiNcS8DF4jAwdycwGxqYhESHvomlVHM=;
 h=From:To:Cc:Subject:Date:From;
 b=bRyZzAEDZvTQsSrM8jDioj0xQcUmN9HI3xZvcEd1GRs5N6BrKpdynAN5qsXPbfSjV
 hYEEyb8NS6M1thLgYl8maLp0uyIAXCOHDiUNsFzxTUQ/W0aZXC+20qzxFf5sqvQaNO
 1qsEb/8ZvNAzTbObedbKMNzwnHDERFjqPb3sZrJKylgWSb8rr7rH+qUaboHkCosI80
 MKga2jMIy7mwgTyrzlCrg+CNLD4uTuYosjYhmSA7px5J9WuHYm0Zid630UWYb2EP9d
 V5e+/MQMPrm+n6Vp2MbbAdfsU2N8sIo5F3auAd6E4JHAM0GsiB4GUDtdAGHtW94d2f
 8aU5t7ZK6HTwg==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 tursulin@ursulin.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC PATCH] dma-fence: Remove 64-bit flag
Date: Fri, 17 Oct 2025 11:31:47 +0200
Message-ID: <20251017093146.169996-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

It seems that DMA_FENCE_FLAG_SEQNO64_BIT has no real effects anymore,
since seqno is a u64 everywhere.

Remove the unneeded flag.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Seems to me that this flag doesn't really do anything anymore?

I *suspect* that it could be that some drivers pass a u32 to
dma_fence_init()? I guess they could be ported, couldn't they.

P.
---
 drivers/dma-buf/dma-fence.c |  3 +--
 include/linux/dma-fence.h   | 10 +---------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..24794c027813 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1078,8 +1078,7 @@ void
 dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
 		 spinlock_t *lock, u64 context, u64 seqno)
 {
-	__dma_fence_init(fence, ops, lock, context, seqno,
-			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
+	__dma_fence_init(fence, ops, lock, context, seqno, 0);
 }
 EXPORT_SYMBOL(dma_fence_init64);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 64639e104110..4eca2db28625 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -98,7 +98,6 @@ struct dma_fence {
 };
 
 enum dma_fence_flag_bits {
-	DMA_FENCE_FLAG_SEQNO64_BIT,
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
@@ -470,14 +469,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
  */
 static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
 {
-	/* This is for backward compatibility with drivers which can only handle
-	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
-	 * do so.
-	 */
-	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
-		return f1 > f2;
-
-	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
+	return f1 > f2;
 }
 
 /**
-- 
2.49.0

