Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D0C04D8D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E5F10E9F0;
	Fri, 24 Oct 2025 07:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dxp+Vwjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F1F10E198
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:51:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 59AC643E45;
 Fri, 24 Oct 2025 07:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5A6C4CEF1;
 Fri, 24 Oct 2025 07:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761292266;
 bh=/eIIVwq/ALP8llik2NduZiThoe5CQyT9xK6kpQ9T/zk=;
 h=From:To:Cc:Subject:Date:From;
 b=dxp+Vwjxc0q/4xxNMbBSVe0wfjeBoUAgvvk4GO0J4BEjljt8FSBdlEzI27U7yFV7D
 l3BgRq6oD7XxuKD72SAi6bNz3tno5IscDLL/U4Km4YAB2z67ipIpw2pYmWRiqS4BIO
 2z2MZCMEjdaIk3VMY+t8V0wlDEZ4jfl7Sa7BH9gfAR+g15wWUFi3pLySqaQOsDpTCP
 sszrCbwAeLwdsko+M8aW4srtjpR8pwObW3ffVdKGKFMmmFXW2yhB3rqsc8nofiH35X
 s0n6KHJ98UhXLF1rEsUMB5ztgp82Oph7EaENA1V9WUjXbJ0PKTKbtd6l8x6O3Xv3mg
 2Sq+UUqSeAgcQ==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
Date: Fri, 24 Oct 2025 09:50:18 +0200
Message-ID: <20251024075019.162351-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

To decouple the dma_fence_ops lifetime from dma_fences lifetime RCU
support was added to said function, coupled with using the signaled bit
to detect whether the fence_ops might be gone already.

When implementing that a wrong string was set as a default return
parameter, indicating that every driver whose fence is already signalled
must be detached, which is frankly wrong.

Reported-by: Danilo Krummrich <dakr@kernel.org>
Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document the rules")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
When this was merged, it sadly slipped by me. I think this entire RCU
mechanism was / is an overengineered idea.

If we look at who actually uses dma_fence_driver_name() and
dma_fence_timeline_name() – functions from which the largest share of
the fence_ops vs. fence lifetime issue stems from – we discover that
there is a single user:

i915.

Isn't that driver even deprecated?

I think the better thing to do is: remove these functions alltogether,
or at least deprecate them. Then the only lifetime issue left so solve
is the callback functions.

P.
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..1875a0abebd3 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1111,7 +1111,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return fence->ops->get_driver_name(fence);
 	else
-		return "detached-driver";
+		return "driver-whose-fence-is-already-signalled";
 }
 EXPORT_SYMBOL(dma_fence_driver_name);
 
-- 
2.49.0

