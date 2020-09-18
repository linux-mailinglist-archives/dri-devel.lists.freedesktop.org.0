Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598E326EBB0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 04:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EAC6E450;
	Fri, 18 Sep 2020 02:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859466E450
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 02:08:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85424238E3;
 Fri, 18 Sep 2020 02:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394887;
 bh=1skrjOFlpg33Li9byXbrIzTcZgSsfVl0JOdN91rhDYc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OQWz2lm//o0n2WPmIaRLsj1sHUvQhs7GSGMCrpHAjsnYXsXoqW/JY8TEUWU1slTgk
 SAgxdtf8P32RLB0rT5ZZpCvtL96i855iTq0yFMiExUOxIfJ/WNDToBD4r2rA8Bhl8u
 uAj+9IO2Zwqpt44wiLTNphy3W1Pv4krVxtnwnNP8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 003/206] dma-fence: Serialise signal enabling
 (dma_fence_enable_sw_signaling)
Date: Thu, 17 Sep 2020 22:04:39 -0400
Message-Id: <20200918020802.2065198-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

[ Upstream commit 9c98f021e4e717ffd9948fa65340ea3ef12b7935 ]

Make dma_fence_enable_sw_signaling() behave like its
dma_fence_add_callback() and dma_fence_default_wait() counterparts and
perform the test to enable signaling under the fence->lock, along with
the action to do so. This ensure that should an implementation be trying
to flush the cb_list (by signaling) on retirement before freeing the
fence, it can do so in a race-free manner.

See also 0fc89b6802ba ("dma-fence: Simply wrap dma_fence_signal_locked
with dma_fence_signal").

v2: Refactor all 3 enable_signaling paths to use a common function.
v3: Don't argue, just keep the tracepoint in the existing spot.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20191004101140.32713-1-chris@chris-wilson.co.uk
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 78 +++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 43 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 1551ca7df3941..8586cc05def17 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -244,6 +244,30 @@ void dma_fence_free(struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_fence_free);
 
+static bool __dma_fence_enable_signaling(struct dma_fence *fence)
+{
+	bool was_set;
+
+	lockdep_assert_held(fence->lock);
+
+	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+				   &fence->flags);
+
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return false;
+
+	if (!was_set && fence->ops->enable_signaling) {
+		trace_dma_fence_enable_signal(fence);
+
+		if (!fence->ops->enable_signaling(fence)) {
+			dma_fence_signal_locked(fence);
+			return false;
+		}
+	}
+
+	return true;
+}
+
 /**
  * dma_fence_enable_sw_signaling - enable signaling on fence
  * @fence: the fence to enable
@@ -256,19 +280,12 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 {
 	unsigned long flags;
 
-	if (!test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-			      &fence->flags) &&
-	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) &&
-	    fence->ops->enable_signaling) {
-		trace_dma_fence_enable_signal(fence);
-
-		spin_lock_irqsave(fence->lock, flags);
-
-		if (!fence->ops->enable_signaling(fence))
-			dma_fence_signal_locked(fence);
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return;
 
-		spin_unlock_irqrestore(fence->lock, flags);
-	}
+	spin_lock_irqsave(fence->lock, flags);
+	__dma_fence_enable_signaling(fence);
+	spin_unlock_irqrestore(fence->lock, flags);
 }
 EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 
@@ -302,7 +319,6 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 {
 	unsigned long flags;
 	int ret = 0;
-	bool was_set;
 
 	if (WARN_ON(!fence || !func))
 		return -EINVAL;
@@ -314,25 +330,14 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 
 	spin_lock_irqsave(fence->lock, flags);
 
-	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-				   &fence->flags);
-
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		ret = -ENOENT;
-	else if (!was_set && fence->ops->enable_signaling) {
-		trace_dma_fence_enable_signal(fence);
-
-		if (!fence->ops->enable_signaling(fence)) {
-			dma_fence_signal_locked(fence);
-			ret = -ENOENT;
-		}
-	}
-
-	if (!ret) {
+	if (__dma_fence_enable_signaling(fence)) {
 		cb->func = func;
 		list_add_tail(&cb->node, &fence->cb_list);
-	} else
+	} else {
 		INIT_LIST_HEAD(&cb->node);
+		ret = -ENOENT;
+	}
+
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	return ret;
@@ -432,7 +437,6 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	struct default_wait_cb cb;
 	unsigned long flags;
 	signed long ret = timeout ? timeout : 1;
-	bool was_set;
 
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return ret;
@@ -444,21 +448,9 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 		goto out;
 	}
 
-	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-				   &fence->flags);
-
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+	if (!__dma_fence_enable_signaling(fence))
 		goto out;
 
-	if (!was_set && fence->ops->enable_signaling) {
-		trace_dma_fence_enable_signal(fence);
-
-		if (!fence->ops->enable_signaling(fence)) {
-			dma_fence_signal_locked(fence);
-			goto out;
-		}
-	}
-
 	if (!timeout) {
 		ret = 0;
 		goto out;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
