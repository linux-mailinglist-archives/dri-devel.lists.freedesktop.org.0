Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2684AB1895
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C96310EA64;
	Fri,  9 May 2025 15:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZzqhQC/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E1410EA64;
 Fri,  9 May 2025 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1vhPhUpo7XYOjEiM3EN6oBLXztk5z+K99Cobporw1Bc=; b=ZzqhQC/fia/9vdAn8j3+3NrHA+
 nBX68px/1RI5OPFyT18OXnxmea9OW4YVEaJHpTq5RrIonySM0BNxyMy4emD5s4PPBcAAVbN7ArENH
 NsIfI9jzZwfXJHaheDLqwFr15LUK/ZyGEuanX8fHm0ZANfkJd17/jBbs0bXW3vBACf+vFSmPr6hTS
 nbbPnKF4nCDP2l2oRio/ujhg2u6QK5QtG1HuldL8hqkFcMk09d75siQIsvTNFgTVpjmwTDnECf2wM
 lYPhMJ4IUcjJkCcG6bbK4EqAWaejdGz2qEbl94Gce6deUoBz2JBxvvhmgum4CT3iOYRpz3gSoyoUZ
 ++VGjhig==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uDPfH-005oEO-Bl; Fri, 09 May 2025 17:34:08 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC v2 02/13] dma-fence: Change signature of __dma_fence_is_later
Date: Fri,  9 May 2025 16:33:41 +0100
Message-ID: <20250509153352.7187-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
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

With the goal of reducing the need for drivers to touch (and dereference)
fence->ops, we change the prototype of __dma_fence_is_later() to take
fence instead of fence->ops.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
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

