Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472E0AB8340
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD8B10E813;
	Thu, 15 May 2025 09:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="M51yFwzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F0D10E206;
 Thu, 15 May 2025 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8PBpHzT0posY/8hYMZRUjLsaZmxxP91alDxR/meOvvM=; b=M51yFwzfczL7p2GItQ+g5ernH4
 wG7fnVrrys+Y8g/kzXuTaS/bW4bF0lKjyNySO7HLNkdLtld7NggljjaL+i91osHVjpqpOT5/atBoI
 dFuG0SIYBX6pATmoPOJTvX+UWD1OO6TvBaYUs7ZEFyyJKVuWH1ECM4xZbjUGI1WNFaMFc6+/65F0A
 zUrGpb8d+1jovTtRC3BhD1s07CoUOeF6CXraDwDEccDIkW6X6mA6UQOmFIAjUQjoIxCELyK69lf6+
 g6Gv1xvfFW+40QhRGqu2B7tMLfa2yyghrQFXTesQl18AzuCilYveKeiE/a4vsq+7o4Sb0XXVzyrQI
 KMU9AkiQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFV8O-008ZQg-Sw; Thu, 15 May 2025 11:50:07 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v4 1/9] dma-fence: Change signature of __dma_fence_is_later
Date: Thu, 15 May 2025 10:49:56 +0100
Message-ID: <20250515095004.28318-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
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

With the goal of reducing the need for drivers to touch (and dereference)
fence->ops, we change the prototype of __dma_fence_is_later() to take
fence instead of fence->ops.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c |  2 +-
 drivers/dma-buf/sw_sync.c         |  2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c  |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c | 14 ++++++++------
 include/linux/dma-fence.h         |  9 ++++-----
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 9663ba1bb6ac..90424f23fd73 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -252,7 +252,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	chain->prev_seqno = 0;
 
 	/* Try to reuse the context of the previous chain node. */
-	if (prev_chain && __dma_fence_is_later(seqno, prev->seqno, prev->ops)) {
+	if (prev_chain && __dma_fence_is_later(prev, seqno, prev->seqno)) {
 		context = prev->context;
 		chain->prev_seqno = prev->seqno;
 	} else {
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 4f27ee93a00c..3c20f1d31cf5 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -170,7 +170,7 @@ static bool timeline_fence_signaled(struct dma_fence *fence)
 {
 	struct sync_timeline *parent = dma_fence_parent(fence);
 
-	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
+	return !__dma_fence_is_later(fence, fence->seqno, parent->value);
 }
 
 static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 0b4f12be3692..03eb8c6d1616 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -165,7 +165,7 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
 	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
 
 	return dma_fence->error ||
-		!__dma_fence_is_later(dma_fence->seqno, seqno, dma_fence->ops);
+		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
 }
 
 static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 1905ca590965..f0a6ce610948 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -216,15 +216,17 @@ void xe_sched_job_set_error(struct xe_sched_job *job, int error)
 
 bool xe_sched_job_started(struct xe_sched_job *job)
 {
+	struct dma_fence *fence = dma_fence_chain_contained(job->fence);
 	struct xe_lrc *lrc = job->q->lrc[0];
 
-	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
-				     xe_lrc_start_seqno(lrc),
-				     dma_fence_chain_contained(job->fence)->ops);
+	return !__dma_fence_is_later(fence,
+				     xe_sched_job_lrc_seqno(job),
+				     xe_lrc_start_seqno(lrc));
 }
 
 bool xe_sched_job_completed(struct xe_sched_job *job)
 {
+	struct dma_fence *fence = dma_fence_chain_contained(job->fence);
 	struct xe_lrc *lrc = job->q->lrc[0];
 
 	/*
@@ -232,9 +234,9 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 	 * parallel handshake is done.
 	 */
 
-	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
-				     xe_lrc_seqno(lrc),
-				     dma_fence_chain_contained(job->fence)->ops);
+	return !__dma_fence_is_later(fence,
+				     xe_sched_job_lrc_seqno(job),
+				     xe_lrc_seqno(lrc));
 }
 
 void xe_sched_job_arm(struct xe_sched_job *job)
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index b12776883d14..48b5202c531d 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -441,21 +441,20 @@ dma_fence_is_signaled(struct dma_fence *fence)
 
 /**
  * __dma_fence_is_later - return if f1 is chronologically later than f2
+ * @fence: fence in whose context to do the comparison
  * @f1: the first fence's seqno
  * @f2: the second fence's seqno from the same context
- * @ops: dma_fence_ops associated with the seqno
  *
  * Returns true if f1 is chronologically later than f2. Both fences must be
  * from the same context, since a seqno is not common across contexts.
  */
-static inline bool __dma_fence_is_later(u64 f1, u64 f2,
-					const struct dma_fence_ops *ops)
+static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
 {
 	/* This is for backward compatibility with drivers which can only handle
 	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
 	 * do so.
 	 */
-	if (ops->use_64bit_seqno)
+	if (fence->ops->use_64bit_seqno)
 		return f1 > f2;
 
 	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
@@ -475,7 +474,7 @@ static inline bool dma_fence_is_later(struct dma_fence *f1,
 	if (WARN_ON(f1->context != f2->context))
 		return false;
 
-	return __dma_fence_is_later(f1->seqno, f2->seqno, f1->ops);
+	return __dma_fence_is_later(f1, f1->seqno, f2->seqno);
 }
 
 /**
-- 
2.48.0

