Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F0AA35B5A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABEF10EC3B;
	Fri, 14 Feb 2025 10:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EC4NLsUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C917D10EC36;
 Fri, 14 Feb 2025 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wth6RLPrR49KejScMxkeEnirGpMWgHF4Gi2HS+qt7GY=; b=EC4NLsUZkV0l058OWK5xGcrNhn
 INyUqN1swyuOfbVKItSs0YuZAoVQpF+uRmPQGJBbMm54lOOTEYyr3hvYAuHX0KNKJx9bUVNQBvhBq
 cVdDJT2AdC/NvdrVIaxDe4CFTklsRW+Vk/qb3PIR9yGzgBoB9maKMV8UBsswr6WIq/rnTZs7wc4/k
 6AMGQXtWOuzQV9hp0VjVLFKxVPaHDOCR4ntTAW9Hb4nXRniGjuvKnCHoQV3SdmiIV6mAQ/sR5pqCn
 lZ+jRM/kEH+q4lunAxv4BPnN13CgcyoBVIzLbK6fboKZ/MzzetHtx8QDC9o+i7Ysl8HHE9l6VjCkF
 iqyLQETA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tisnT-00HYm1-6n; Fri, 14 Feb 2025 11:19:53 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v5 3/6] drm/sched: Remove a hole from struct drm_sched_job
Date: Fri, 14 Feb 2025 10:19:41 +0000
Message-ID: <20250214101944.19390-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
References: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
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

We can re-order some struct members and take u32 credits outside of the
pointer sandwich and also for the last_dependency member we can get away
with an unsigned int since for dependency we use xa_limit_32b.

Pahole report before:
        /* size: 160, cachelines: 3, members: 14 */
        /* sum members: 156, holes: 1, sum holes: 4 */
        /* last cacheline: 32 bytes */

And after:
        /* size: 152, cachelines: 3, members: 14 */
        /* last cacheline: 24 bytes */

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 include/drm/gpu_scheduler.h | 38 +++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 6bf458dbce84..1c1138308e66 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -338,8 +338,14 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * to schedule the job.
  */
 struct drm_sched_job {
-	struct spsc_node		queue_node;
-	struct list_head		list;
+	u64				id;
+
+	/**
+	 * @submit_ts:
+	 *
+	 * When the job was pushed into the entity queue.
+	 */
+	ktime_t                         submit_ts;
 
 	/**
 	 * @sched:
@@ -349,24 +355,30 @@ struct drm_sched_job {
 	 * has finished.
 	 */
 	struct drm_gpu_scheduler	*sched;
+
 	struct drm_sched_fence		*s_fence;
+	struct drm_sched_entity         *entity;
 
+	enum drm_sched_priority		s_priority;
 	u32				credits;
+	/** @last_dependency: tracks @dependencies as they signal */
+	unsigned int			last_dependency;
+	atomic_t			karma;
+
+	struct spsc_node		queue_node;
+	struct list_head		list;
 
 	/*
 	 * work is used only after finish_cb has been used and will not be
 	 * accessed anymore.
 	 */
 	union {
-		struct dma_fence_cb		finish_cb;
-		struct work_struct		work;
+		struct dma_fence_cb	finish_cb;
+		struct work_struct	work;
 	};
 
-	uint64_t			id;
-	atomic_t			karma;
-	enum drm_sched_priority		s_priority;
-	struct drm_sched_entity         *entity;
 	struct dma_fence_cb		cb;
+
 	/**
 	 * @dependencies:
 	 *
@@ -375,16 +387,6 @@ struct drm_sched_job {
 	 * drm_sched_job_add_implicit_dependencies().
 	 */
 	struct xarray			dependencies;
-
-	/** @last_dependency: tracks @dependencies as they signal */
-	unsigned long			last_dependency;
-
-	/**
-	 * @submit_ts:
-	 *
-	 * When the job was pushed into the entity queue.
-	 */
-	ktime_t                         submit_ts;
 };
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
-- 
2.48.0

