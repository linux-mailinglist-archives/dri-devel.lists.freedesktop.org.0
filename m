Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71517C89FA5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B577810E5F6;
	Wed, 26 Nov 2025 13:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ixu2iZTZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C471D10E5F1;
 Wed, 26 Nov 2025 13:20:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AAFEF44381;
 Wed, 26 Nov 2025 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732D8C116B1;
 Wed, 26 Nov 2025 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764163240;
 bh=2pw/MJl6LY/oCnTL3+ZydHGGLHEVdvEQCODhNg8b1NQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ixu2iZTZtYLH17YMkWe3wgu1khWIu1Btj2ZXZ0yppvuSfVrDVJwz4hvsSE5lbhvLv
 v+ExMAHWV1q4rJG+OCiWwImm3OoF+GHOxZCug5HdXMdNdSxwXRx+cQJ3rHZMTZ/vLH
 2nWKlIQOPYQfdFZ3Wu8eot2tUTBqKV7TKLo+zR2DwReVr051qui5adYQ12uI9mEjmM
 8CcZyLymsWhgqA7HdvfILFC+ahuAbLzJLvxgL1mlD1MUhHZUMNCf/hHgiqmZEIe+Io
 gEuLpALwLvhJStMxBEKR4CYPvoexnFADl4gwHHolqjWk7HyVtuXg3BuMihjZi8waxF
 Ww+QKUEf7OKaw==
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
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 6/6] dma-buf/dma-fence: Remove return code of
 signaling-functions
Date: Wed, 26 Nov 2025 14:19:15 +0100
Message-ID: <20251126131914.149445-8-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251126131914.149445-2-phasta@kernel.org>
References: <20251126131914.149445-2-phasta@kernel.org>
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
index 25117a906846..bed8d0c27217 100644
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
@@ -373,7 +370,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 	lockdep_assert_held(fence->lock);
 
 	if (unlikely(dma_fence_test_signaled_flag(fence)))
-		return -EINVAL;
+		return;
 
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
@@ -386,8 +383,6 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 		INIT_LIST_HEAD(&cur->node);
 		cur->func(fence, cur);
 	}
-
-	return 0;
 }
 EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
 
@@ -402,23 +397,17 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
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
 
@@ -434,13 +423,10 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp);
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
 
@@ -453,28 +439,22 @@ EXPORT_SYMBOL(dma_fence_signal_locked);
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
index 19972f5d176f..188f7641050f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -364,11 +364,10 @@ static inline void dma_fence_end_signalling(bool cookie) {}
 static inline void __dma_fence_might_wait(void) {}
 #endif
 
-int dma_fence_signal(struct dma_fence *fence);
-int dma_fence_signal_locked(struct dma_fence *fence);
-int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
-int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
-				      ktime_t timestamp);
+void dma_fence_signal(struct dma_fence *fence);
+void dma_fence_signal_locked(struct dma_fence *fence);
+void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
+void dma_fence_signal_timestamp_locked(struct dma_fence *fence, ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
 int dma_fence_add_callback(struct dma_fence *fence,
-- 
2.49.0

