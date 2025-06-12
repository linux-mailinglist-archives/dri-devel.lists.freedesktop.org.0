Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA9AD7499
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E73310E87F;
	Thu, 12 Jun 2025 14:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YBrPlBKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531FB10E065
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:51:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 514BAA4BDF1;
 Thu, 12 Jun 2025 14:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99461C4CEEA;
 Thu, 12 Jun 2025 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749739884;
 bh=0qTRo/pmUhEjT80nAp8EEXMwEdEowH/xG6PhDIwPuN8=;
 h=From:To:Cc:Subject:Date:From;
 b=YBrPlBKNH2a4/bws8W6neqOmymaes6R2+S7rFQ/FRrqsuxUIS+ukWKJupJBcEj0/d
 KsKX/GnYGqtJvT3Bz3/iGnT6cUja76N/vtSr93k8ISCvreiB7Vnwl34/Ow0MobvunE
 BRJG/c3t1O/P328EqHMyEWCb3UdWFZgD8LnOqw7cR/mwofBpastZO/GVVDwuyZT/nF
 W0HzDGXI7DPXc3tYr/Hi/Gg8IDIWcJ4J7+HGkSWoHU4U19olRiv3OTrbnFnnwAhkKs
 2Z8Tv26brwyFn4dJ5lNt35AaDWhy/kcdgpGB/yH7f5kWjvSG+feyD8s55eDCg+dxAT
 Byz24fe1YstxA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Date: Thu, 12 Jun 2025 16:49:54 +0200
Message-ID: <20250612144953.111829-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

struct drm_sched_init_args provides the possibility of letting the
scheduler use user-controlled workqueues, instead of the scheduler
creating its own workqueues. It's currently not documented who would
want to use that.

Not sharing the submit_wq between driver and scheduler has the advantage
of no negative intereference between them being able to occur (e.g.,
MMU notifier callbacks waiting for fences to get signaled).

Add a new docu section for concurrency in drm/sched.

Discourage the usage of own workqueues in the documentation. Document
when using them can make sense. Warn about pitfalls.

Co-authored-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Add new docu section for concurrency in the scheduler. (Sima)
  - Document what an ordered workqueue passed to the scheduler can be
    useful for. (Christian, Sima)
  - Warn more detailed about potential deadlocks. (Danilo)
---
 include/drm/gpu_scheduler.h | 54 ++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 81dcbfc8c223..00c528e62485 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -21,6 +21,49 @@
  *
  */
 
+/**
+ * DOC: Concurrency in drm/sched
+ *
+ * The DRM GPU Scheduler interacts with drivers through the callbacks defined in
+ * &struct drm_sched_backend_ops. These callbacks can be invoked by the scheduler
+ * at any point in time if not stated otherwise explicitly in the callback
+ * documentation.
+ *
+ * For most use cases, passing the recommended default parameters in &struct
+ * drm_sched_init_args is sufficient. There are some special circumstances,
+ * though:
+ *
+ * For timeout handling, it makes a lot of sense for drivers with HARDWARE
+ * scheduling to have the timeouts (e.g., for different hardware rings) occur
+ * sequentially, for example to allow for detecting which job timedout first
+ * and, therefore, caused the hang. Thereby, it is determined which &struct
+ * drm_sched_entity has to be killed and which entities' jobs must be
+ * resubmitted after a GPU reset.
+ *
+ * This can be achieved by passing an ordered workqueue in &struct
+ * drm_sched_init_args.timeout_wq. Also take a look at the documentation of
+ * &struct drm_sched_backend_ops.timedout_job.
+ *
+ * Furthermore, for drivers with hardware that supports FIRMWARE scheduling,
+ * the driver design can be simplified a bit by providing one ordered workqueue
+ * for both &struct drm_sched_init_args.timeout_wq and
+ * &struct drm_sched_init_args.submit_wq. Reason being that firmware schedulers
+ * should always have one scheduler instance per firmware runqueue and one
+ * entity per scheduler instance. If that scheduler instance then shares one
+ * ordered workqueue with the driver, locking can be very lightweight or
+ * dropped alltogether.
+ *
+ * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
+ * theoretically can deadlock. It must be guaranteed that submit_wq never has
+ * more than max_active - 1 active tasks, or if max_active tasks are reached at
+ * least one of them does not execute operations that may block on dma_fences
+ * that potentially make progress through this scheduler instance. Otherwise,
+ * it is possible that all max_active tasks end up waiting on a dma_fence (that
+ * can only make progress through this schduler instance), while the
+ * scheduler's queued work waits for at least one of the max_active tasks to
+ * finish. Thus, this can result in a deadlock.
+ */
+
 #ifndef _DRM_GPU_SCHEDULER_H_
 #define _DRM_GPU_SCHEDULER_H_
 
@@ -499,7 +542,7 @@ struct drm_sched_backend_ops {
 	 * timeout handlers of different schedulers. One way to achieve this
 	 * synchronization is to create an ordered workqueue (using
 	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
-	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
+	 * in &struct drm_sched_init_args.timeout_wq. This will guarantee
 	 * that timeout handlers are executed sequentially.
 	 *
 	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
@@ -590,14 +633,19 @@ struct drm_gpu_scheduler {
  *
  * @ops: backend operations provided by the driver
  * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
- *	       allocated and used.
+ *	       allocated and used. It is recommended to pass NULL unless there
+ *	       is a good reason not to. For details, see &DOC: Concurrency in
+ *	       drm/sched.
  * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
  *	     as there's usually one run-queue per priority, but may be less.
  * @credit_limit: the number of credits this scheduler can hold from all jobs
  * @hang_limit: number of times to allow a job to hang before dropping it.
  *		This mechanism is DEPRECATED. Set it to 0.
  * @timeout: timeout value in jiffies for submitted jobs.
- * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
+ * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
+ *		used. An ordered workqueue could be passed to achieve timeout
+ *		synchronization. See &DOC: Concurreny in drm/sched and &struct
+ *		drm_sched_backend_ops.timedout_job.
  * @score: score atomic shared with other schedulers. May be NULL.
  * @name: name (typically the driver's name). Used for debugging
  * @dev: associated device. Used for debugging
-- 
2.49.0

