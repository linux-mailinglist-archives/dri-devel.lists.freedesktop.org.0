Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97BC96BCE
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 11:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B9B10E38E;
	Mon,  1 Dec 2025 10:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qr/O92Um";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D500D10E38E;
 Mon,  1 Dec 2025 10:51:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 51A4760137;
 Mon,  1 Dec 2025 10:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B853EC113D0;
 Mon,  1 Dec 2025 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764586268;
 bh=vLU4asfyOip/u8apYJb8xS5xSWEq5LKx5AZnLWJhf5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qr/O92UmvlYreeY2B2vJnfwo1e1iYbEvJk6Q2RlIH+GZj2YvMEwu1NqVImEVBRQVO
 VtcJ8XOnJvJHi9ZEs1SjjI/VSj7PXMWiDYSoS3n59zqvjCEeyT/ArJIZ+2iigI+jdg
 lxQqbybIcGCBhgR6XNUCYkZhtZvq+IZUkMPnvY860rM1GBHtpid9OrrpSHbBEPbJcF
 qs1xVsrmIPEqpZ3aBbNrF7Zmkz2AIfysfWQ8Ol9+O+VHuPa/6ieDua4K3/EfYvgnDd
 yjA/pgLDKiIE4H1YcBhcui5Uvp4mD/GjsTmJmXLM6p8IEEUUBdVov8loclOjjBHpD5
 4Gj8oykZgcKkA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 7/8] dma-buf/dma-fence: Remove return code of
 signaling-functions
Date: Mon,  1 Dec 2025 11:50:11 +0100
Message-ID: <20251201105011.19386-9-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251201105011.19386-2-phasta@kernel.org>
References: <20251201105011.19386-2-phasta@kernel.org>
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

All functions used for signaling a fence return an error code whose sole
purpose is to tell whether a fence was already signaled.

This is racy and has been used by almost no party in the kernel, and the
few users have been removed in preceding cleanup commits.

Turn all signaling-functions into void-functions.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 40 ++++++++++---------------------------
 include/linux/dma-fence.h   |  9 ++++-----
 2 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 146de62887cf..529a44371b35 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -360,11 +360,8 @@ void __dma_fence_might_wait(void)
  *
  * Unlike dma_fence_signal_timestamp(), this function must be called with
  * &dma_fence.lock held.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      ktime_t timestamp)
 {
 	struct dma_fence_cb *cur, *tmp;
@@ -374,7 +371,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 
 	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				      &fence->flags)))
-		return -EINVAL;
+		return;
 
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
@@ -387,8 +384,6 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 		INIT_LIST_HEAD(&cur->node);
 		cur->func(fence, cur);
 	}
-
-	return 0;
 }
 EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
 
@@ -403,23 +398,17 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
  * can only go from the unsignaled to the signaled state and not back, it will
  * only be effective the first time. Set the timestamp provided as the fence
  * signal timestamp.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
+void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
 {
 	unsigned long flags;
-	int ret;
 
 	if (WARN_ON(!fence))
-		return -EINVAL;
+		return;
 
 	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_timestamp_locked(fence, timestamp);
+	dma_fence_signal_timestamp_locked(fence, timestamp);
 	spin_unlock_irqrestore(fence->lock, flags);
-
-	return ret;
 }
 EXPORT_SYMBOL(dma_fence_signal_timestamp);
 
@@ -435,13 +424,10 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp);
  *
  * Unlike dma_fence_signal(), this function must be called with &dma_fence.lock
  * held.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal_locked(struct dma_fence *fence)
+void dma_fence_signal_locked(struct dma_fence *fence)
 {
-	return dma_fence_signal_timestamp_locked(fence, ktime_get());
+	dma_fence_signal_timestamp_locked(fence, ktime_get());
 }
 EXPORT_SYMBOL(dma_fence_signal_locked);
 
@@ -498,28 +484,22 @@ EXPORT_SYMBOL(dma_fence_check_and_signal);
  * dma_fence_add_callback(). Can be called multiple times, but since a fence
  * can only go from the unsignaled to the signaled state and not back, it will
  * only be effective the first time.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal(struct dma_fence *fence)
+void dma_fence_signal(struct dma_fence *fence)
 {
 	unsigned long flags;
-	int ret;
 	bool tmp;
 
 	if (WARN_ON(!fence))
-		return -EINVAL;
+		return;
 
 	tmp = dma_fence_begin_signalling();
 
 	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
+	dma_fence_signal_timestamp_locked(fence, ktime_get());
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_end_signalling(tmp);
-
-	return ret;
 }
 EXPORT_SYMBOL(dma_fence_signal);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 0504afe52c2a..d4c92fd35092 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -364,13 +364,12 @@ static inline void dma_fence_end_signalling(bool cookie) {}
 static inline void __dma_fence_might_wait(void) {}
 #endif
 
-int dma_fence_signal(struct dma_fence *fence);
+void dma_fence_signal(struct dma_fence *fence);
 bool dma_fence_check_and_signal(struct dma_fence *fence);
 bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
-int dma_fence_signal_locked(struct dma_fence *fence);
-int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
-int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
-				      ktime_t timestamp);
+void dma_fence_signal_locked(struct dma_fence *fence);
+void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
+void dma_fence_signal_timestamp_locked(struct dma_fence *fence, ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
 int dma_fence_add_callback(struct dma_fence *fence,
-- 
2.49.0

