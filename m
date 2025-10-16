Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D16BE5717
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF8910E34E;
	Thu, 16 Oct 2025 20:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxJio2Xk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD10D10E34E;
 Thu, 16 Oct 2025 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760647711; x=1792183711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6l4J7yc8IHjmZvnu01km7PtkTZL4GC/1cKFsgs2oE50=;
 b=mxJio2XkXswj1PdjoZhJS4CPpBOB6U1w6QvW9CPBdxWc+M4a87bi+GXn
 ZvvbXVAS8VmcO6I8VYApf4z/qTXpgZ5e053XjbhpDK1l6cjTg7Rhh3cjE
 +wgbKfcbezPnTjH05wd9RSmPjBTAM00u9yZ5CjHmYE8277hbIuntuR11x
 LfCxVUzoh3G9hyMV75I0PFgfrEmJ1YBuE94UNVJqViTQ/qIIt98WaC0ez
 RkCQAIEJ0AwoQueAppwq5LuMBLZluwfsGKMdBvC0CrsV130AeeYTdNOHg
 nbSpLd8Lrrv9uIauWl5W8sVzGPpWHqwNXVqUTzBtvpq8qYM5s3Rc6rmcJ g==;
X-CSE-ConnectionGUID: q6IXMFerQdKFo4gqNYn0ug==
X-CSE-MsgGUID: SWjza7o8Q02zZGHZWPoJRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65472190"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65472190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
X-CSE-ConnectionGUID: SitfUXWzRDmVyKSiNP3fSw==
X-CSE-MsgGUID: GTAhHv7PTrmqN8cMG5PieQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186572840"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [PATCH v3 3/7] drm/xe: Add dedicated message lock
Date: Thu, 16 Oct 2025 13:48:22 -0700
Message-Id: <20251016204826.284077-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016204826.284077-1-matthew.brost@intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
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

Stop abusing DRM scheduler job list lock for messages, add dedicated
message lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 5 +++--
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       | 4 ++--
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h | 2 ++
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index f91e06d03511..f4f23317191f 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -77,6 +77,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	};
 
 	sched->ops = xe_ops;
+	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
 
@@ -117,7 +118,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 			     struct xe_sched_msg *msg)
 {
-	lockdep_assert_held(&sched->base.job_list_lock);
+	lockdep_assert_held(&sched->msg_lock);
 
 	list_add_tail(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
@@ -131,7 +132,7 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
 			   struct xe_sched_msg *msg)
 {
-	lockdep_assert_held(&sched->base.job_list_lock);
+	lockdep_assert_held(&sched->msg_lock);
 
 	list_add(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 9955397aaaa9..b971b6b69419 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -33,12 +33,12 @@ void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
 
 static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
 {
-	spin_lock(&sched->base.job_list_lock);
+	spin_lock(&sched->msg_lock);
 }
 
 static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sched)
 {
-	spin_unlock(&sched->base.job_list_lock);
+	spin_unlock(&sched->msg_lock);
 }
 
 static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 6731b13da8bb..63d9bf92583c 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -47,6 +47,8 @@ struct xe_gpu_scheduler {
 	const struct xe_sched_backend_ops	*ops;
 	/** @msgs: list of messages to be processed in @work_process_msg */
 	struct list_head			msgs;
+	/** @msg_lock: Message lock */
+	spinlock_t				msg_lock;
 	/** @work_process_msg: processes messages */
 	struct work_struct		work_process_msg;
 };
-- 
2.34.1

