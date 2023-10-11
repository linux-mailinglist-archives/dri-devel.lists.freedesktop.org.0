Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7FF7C5650
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 16:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D44C10E4F6;
	Wed, 11 Oct 2023 14:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A670810E4F6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 14:03:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1557FB82134;
 Wed, 11 Oct 2023 14:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D101C433C8;
 Wed, 11 Oct 2023 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697033027;
 bh=Zh3bJ54D4zW63Ncr/mu6xJinQ4B8/2BBuvC0nnjCJ+c=;
 h=Date:From:To:Cc:Subject:From;
 b=ZkP4DcvHTv+CAU+Bxp7bY8mRMIANtm2V9mIigWhS4C7tKd8ksjtwI42hJdKV47med
 Zbh8xz/Qia5Y0t4GtL+bAr4a4l8PKf5ZgCLjus2Zq+ODqvNMgmih9PufW6kUfk51mI
 BZ2j/V/EkLskGGRbRjul2+hRAY8mXTUH+y05qVcxCZRllwFjc8O5kvg564yw6Vctkm
 ZesOPr/II66swDL/BQ1+W5CawaE4hg0vrD8HdvBIFpSIZaSt82Px8k4kKlJeQRwDR6
 Sz+vbYcmtVygTHd5vsfk0MRCm6zl/6eriAYykaLUak4pPitWYW56gTGnVIVmUAQGoo
 c3iDm5VQFx7OQ==
Date: Wed, 11 Oct 2023 08:03:43 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>
Subject: [PATCH][next] dma-buf: Fix NULL pointer dereference in
 dma_fence_enable_sw_signaling()
Message-ID: <ZSarP0/+hG8/87//@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, a NULL pointer dereference will happen in function
`dma_fence_enable_sw_signaling()` (at line 615), in case `chain`
is not allocated in `mock_chain()` and this function returns
`NULL` (at line 86). See below:

drivers/dma-buf/st-dma-fence-chain.c:
 86         chain = mock_chain(NULL, f, 1);
 87         if (!chain)
 88                 err = -ENOMEM;
 89
 90         dma_fence_enable_sw_signaling(chain);

drivers/dma-buf/dma-fence.c:
 611 void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 612 {
 613         unsigned long flags;
 614
 615         spin_lock_irqsave(fence->lock, flags);
			       ^^^^^^^^^^^
				    |
			  NULL pointer reference
			  if fence == NULL

 616         __dma_fence_enable_signaling(fence);
 617         spin_unlock_irqrestore(fence->lock, flags);
 618 }

Fix this by adding a NULL check before dereferencing `fence` in
`dma_fence_enable_sw_signaling()`. This will prevent any other NULL
pointer dereference when the `fence` passed as an argument is `NULL`.

Addresses-Coverity: ("Dereference after null check")
Fixes: d62c43a953ce ("dma-buf: Enable signaling on fence for selftests")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 9 ++++++++-
 include/linux/dma-fence.h   | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 8aa8f8cb7071..4d2f13560d0f 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -607,14 +607,21 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
  * This will request for sw signaling to be enabled, to make the fence
  * complete as soon as possible. This calls &dma_fence_ops.enable_signaling
  * internally.
+ *
+ * Returns 0 on success and a negative error value when @fence is NULL.
  */
-void dma_fence_enable_sw_signaling(struct dma_fence *fence)
+int dma_fence_enable_sw_signaling(struct dma_fence *fence)
 {
 	unsigned long flags;
 
+	if (!fence)
+		return -EINVAL;
+
 	spin_lock_irqsave(fence->lock, flags);
 	__dma_fence_enable_signaling(fence);
 	spin_unlock_irqrestore(fence->lock, flags);
+
+	return 0;
 }
 EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index ebe78bd3d121..1e4025e925e6 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -399,7 +399,7 @@ int dma_fence_add_callback(struct dma_fence *fence,
 			   dma_fence_func_t func);
 bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
-void dma_fence_enable_sw_signaling(struct dma_fence *fence);
+int dma_fence_enable_sw_signaling(struct dma_fence *fence);
 
 /**
  * dma_fence_is_signaled_locked - Return an indication if the fence
-- 
2.34.1

