Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E1A170D3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 17:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32F610E44C;
	Mon, 20 Jan 2025 16:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="O9DnDauo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA7410E44B;
 Mon, 20 Jan 2025 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bzknq5mAmEKvxp1IjETJYNytA/cYZ4r62a24cB1hXN4=; b=O9DnDauoOxebVYYnvkqTv95K9I
 sg+MFnnxP1YfmiSZQArSanOlZVNRZCtLRcMZFzIqRm61hJYr7xgsnB1n0GF2c13tGQKpm/+zyHWSz
 rdRn+qoh9h05B3J6Wf4XwnovwlqXSJ4EVh7TXqXLSMkxxDc0T9niYMpERxMnrjOsCUXlKE3RJj1LJ
 e2ZlltYfHw8oL6y6HjEsxnhUOhgAktuID6+61R9LlzmeCDaxmDaX9spEIVh0doeMb6ykpi0dVkFe6
 qSzT6xgma74WHvMRqc3pfnJKiyf11zkJKI+XyGUYKvEAEF+5gaLLDaX3/R97e43nkpk1hMDAJH/XV
 uz08K6EQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tZv15-000v9k-JB; Mon, 20 Jan 2025 17:52:47 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 4/4] drm/sched: Make the type of
 drm_sched_job->last_dependency consistent
Date: Mon, 20 Jan 2025 16:52:40 +0000
Message-ID: <20250120165240.9105-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
References: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
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

Dependency tracking via xarray uses xa_limit_32b so there is not need for
the struct member to be unsigned long.

At the same time re-order some struct members and take u32 credits outside
of the pointer sandwich and avoid a hole.

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
---
 include/drm/gpu_scheduler.h | 38 +++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 092242f2464f..9feb7ce6eff0 100644
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
2.47.1

