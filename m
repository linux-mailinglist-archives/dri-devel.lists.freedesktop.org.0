Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2383CA2C636
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FB910EB36;
	Fri,  7 Feb 2025 14:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hssFJ1H5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D0D10E27D;
 Fri,  7 Feb 2025 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=atNQ9+FOqEG6xis71uXtc3Frf8OMQZgyMBTp26azcv4=; b=hssFJ1H5o6AVGZJHr3x2Lpgnqm
 oowi79S6KvBkwp+UNC3WDPZmkZQHNzdS9yjhlMuEfJk1MgGMf9hHQpHiRseCJjuCWP6Q8WB5lt6TN
 g1myN1T/kklDIP0S6wSn3SbIpA/LmSvViM1x/VXBxarhy9Bg5ib2zP8kPnpLsv5f6va4FGxPD6sQp
 3Myx/5SRgU5zwQIkzazgScpQQQPjj9Y0oPohONQS5auTrUWAVghB1iOhCxZ5c8bQpzmSd+FUKCugZ
 gByca8qW7OWdCQcpt5cn/P9iXu+ljl/5y5gNc8WXEnT8vdCuvQ91AgLTb/Iz7KEDdGLotMXtWCMAA
 J9kNKziQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tgPhC-005spG-7Z; Fri, 07 Feb 2025 15:51:12 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 3/6] drm/sched: Remove a hole from struct drm_sched_job
Date: Fri,  7 Feb 2025 14:51:01 +0000
Message-ID: <20250207145104.60455-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
References: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
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
---
 include/drm/gpu_scheduler.h | 38 +++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index cf88f2bd020f..5188c7f3bd3b 100644
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

