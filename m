Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E59A35C85
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 12:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184E410EC59;
	Fri, 14 Feb 2025 11:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CKRVIa2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9C710EC4C;
 Fri, 14 Feb 2025 11:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uRs6AxPXzEV2tmeDGMK2PLBZPtx4jPFgPqblfZldtdI=; b=CKRVIa2zRBrVFQXSBicSjssg9/
 Z8hqPPX31FOPwg7T2Zcba/Du4nZ838tmXbFPUC48z8Bbw6sU/cWSPvTZGCZ1FeeqK39VhfTkugzVb
 UhvXnOFcGIQJST0eXYN28zcB5H3ghenLiHEplEN8lHadZJd54+qMeKkccpuXMklhRmOltHYIy37Ac
 YZcGrzZKJ58SEG1zC5rLXdbpDofIEucMPBGfNheORaW2atwl9Zv69QyGWvgSuxze/FDaLAq0K8fFo
 gPnU+Km0l7oF9ybWm6CMtcYUk6Ymn9C+wMIV6n+cIOfrKOkVB7qmUfSPcJQg4HK0FOXIl86T1h4sp
 MaB1fhhw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1titra-000VGA-8d; Fri, 14 Feb 2025 12:28:12 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/5] drm/scheduler: Add scheduler unit testing infrastructure
 and some basic tests
Date: Fri, 14 Feb 2025 11:28:01 +0000
Message-ID: <20250214112805.20008-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250214112805.20008-1-tvrtko.ursulin@igalia.com>
References: <20250214112805.20008-1-tvrtko.ursulin@igalia.com>
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

Implement a mock scheduler backend and add some basic test to exercise the
core scheduler code paths.

Mock backend (kind of like a very simple mock GPU) can either process jobs
by tests manually advancing the "timeline" job at a time, or alternatively
jobs can be configured with a time duration in which case they get
completed asynchronously from the unit test code.

Core scheduler classes are subclassed to support this mock implementation.

The tests added are just a few simple submission patterns.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Philipp Stanner <phasta@kernel.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/Kconfig.debug                 |  12 +
 drivers/gpu/drm/scheduler/.kunitconfig        |  12 +
 drivers/gpu/drm/scheduler/Makefile            |   2 +
 drivers/gpu/drm/scheduler/tests/Makefile      |   6 +
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 316 ++++++++++++++++++
 drivers/gpu/drm/scheduler/tests/sched_tests.h | 218 ++++++++++++
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 196 +++++++++++
 7 files changed, 762 insertions(+)
 create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
 create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
 create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 601d7e07d421..6fd4c5669400 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -99,5 +99,17 @@ config DRM_TTM_KUNIT_TEST
 
 	  If in doubt, say "N".
 
+config DRM_SCHED_KUNIT_TEST
+	tristate "KUnit tests for the DRM scheduler" if !KUNIT_ALL_TESTS
+	select DRM_SCHED
+	depends on DRM && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Choose this option to build unit tests for the DRM scheduler.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+
 config DRM_EXPORT_FOR_TESTS
 	bool
diff --git a/drivers/gpu/drm/scheduler/.kunitconfig b/drivers/gpu/drm/scheduler/.kunitconfig
new file mode 100644
index 000000000000..cece53609fcf
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/.kunitconfig
@@ -0,0 +1,12 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_SCHED_KUNIT_TEST=y
+CONFIG_EXPERT=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_LOCK_DEBUGGING_SUPPORT=y
+CONFIG_PROVE_LOCKING=y
+CONFIG_LOCKDEP=y
+CONFIG_DEBUG_LOCKDEP=y
+CONFIG_DEBUG_LIST=y
diff --git a/drivers/gpu/drm/scheduler/Makefile b/drivers/gpu/drm/scheduler/Makefile
index 53863621829f..6e13e4c63e9d 100644
--- a/drivers/gpu/drm/scheduler/Makefile
+++ b/drivers/gpu/drm/scheduler/Makefile
@@ -23,3 +23,5 @@
 gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
 
 obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
+
+obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/scheduler/tests/Makefile b/drivers/gpu/drm/scheduler/tests/Makefile
new file mode 100644
index 000000000000..51d275a18cf4
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/tests/Makefile
@@ -0,0 +1,6 @@
+
+drm-sched-tests-y := \
+        mock_scheduler.o \
+        tests_basic.o
+
+obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) += drm-sched-tests.o
diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
new file mode 100644
index 000000000000..7624795c43fd
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "sched_tests.h"
+
+/*
+ * Here we implement the mock "GPU" (or the scheduler backend) which is used by
+ * the DRM scheduler unit tests in order to exercise the core functionality.
+ *
+ * Test cases are implemented in a separate file.
+ */
+
+/**
+ * drm_mock_new_sched_entity - Create a new mock scheduler entity
+ *
+ * @test: KUnit test owning the entity
+ * @priority: Scheduling priority
+ * @sched: Mock scheduler on which the entity can be scheduled
+ *
+ * Returns: New mock scheduler entity with allocation managed by the test
+ */
+struct drm_mock_sched_entity *
+drm_mock_new_sched_entity(struct kunit *test,
+			  enum drm_sched_priority priority,
+			  struct drm_mock_scheduler *sched)
+{
+	struct drm_mock_sched_entity *entity;
+	struct drm_gpu_scheduler *drm_sched;
+	int ret;
+
+	entity = kunit_kzalloc(test, sizeof(*entity), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, entity);
+
+	drm_sched = &sched->base;
+	ret = drm_sched_entity_init(&entity->base,
+				    priority,
+				    &drm_sched, 1,
+				    NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	entity->test = test;
+
+	return entity;
+}
+
+/**
+ * drm_mock_sched_entity_free - Destroys a mock scheduler entity
+ *
+ * @entity: Entity to destroy
+ *
+ * To be used from the test cases once done with the entity.
+ */
+void drm_mock_sched_entity_free(struct drm_mock_sched_entity *entity)
+{
+	drm_sched_entity_destroy(&entity->base);
+}
+
+static enum hrtimer_restart
+drm_mock_sched_job_signal_timer(struct hrtimer *hrtimer)
+{
+	struct drm_mock_sched_job *upto =
+		container_of(hrtimer, typeof(*upto), timer);
+	struct drm_mock_scheduler *sched =
+		drm_sched_to_mock_sched(upto->base.sched);
+	struct drm_mock_sched_job *job, *next;
+	ktime_t now = ktime_get();
+	unsigned long flags;
+	LIST_HEAD(signal);
+
+	spin_lock_irqsave(&sched->lock, flags);
+	list_for_each_entry_safe(job, next, &sched->job_list, link) {
+		if (!job->duration_us)
+			break;
+
+		if (ktime_before(now, job->finish_at))
+			break;
+
+		list_move_tail(&job->link, &signal);
+		sched->hw_timeline.cur_seqno = job->hw_fence.seqno;
+	}
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	list_for_each_entry(job, &signal, link) {
+		dma_fence_signal(&job->hw_fence);
+		dma_fence_put(&job->hw_fence);
+	}
+
+	return HRTIMER_NORESTART;
+}
+
+/**
+ * drm_mock_new_sched_job - Create a new mock scheduler job
+ *
+ * @test: KUnit test owning the job
+ * @entity: Scheduler entity of the job
+ *
+ * Returns: New mock scheduler job with allocation managed by the test
+ */
+struct drm_mock_sched_job *
+drm_mock_new_sched_job(struct kunit *test,
+		       struct drm_mock_sched_entity *entity)
+{
+	struct drm_mock_sched_job *job;
+	int ret;
+
+	job = kunit_kzalloc(test, sizeof(*job), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, job);
+
+	ret = drm_sched_job_init(&job->base,
+				 &entity->base,
+				 1,
+				 NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	job->test = test;
+
+	spin_lock_init(&job->lock);
+	INIT_LIST_HEAD(&job->link);
+	hrtimer_init(&job->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
+	job->timer.function = drm_mock_sched_job_signal_timer;
+
+	return job;
+}
+
+static const char *drm_mock_sched_hw_fence_driver_name(struct dma_fence *fence)
+{
+	return "drm_mock_sched";
+}
+
+static const char *
+drm_mock_sched_hw_fence_timeline_name(struct dma_fence *fence)
+{
+	struct drm_mock_sched_job *job =
+		container_of(fence, typeof(*job), hw_fence);
+
+	return (const char *)job->base.sched->name;
+}
+static void drm_mock_sched_hw_fence_release(struct dma_fence *fence)
+{
+	struct drm_mock_sched_job *job =
+		container_of(fence, typeof(*job), hw_fence);
+
+	hrtimer_cancel(&job->timer);
+
+	/* Freed by the kunit framework */
+}
+
+static const struct dma_fence_ops drm_mock_sched_hw_fence_ops = {
+	.get_driver_name = drm_mock_sched_hw_fence_driver_name,
+	.get_timeline_name = drm_mock_sched_hw_fence_timeline_name,
+	.release = drm_mock_sched_hw_fence_release,
+};
+
+static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
+{
+	struct drm_mock_scheduler *sched =
+		drm_sched_to_mock_sched(sched_job->sched);
+	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
+
+	dma_fence_init(&job->hw_fence,
+		       &drm_mock_sched_hw_fence_ops,
+		       &job->lock,
+		       sched->hw_timeline.context,
+		       atomic_inc_return(&sched->hw_timeline.next_seqno));
+
+	dma_fence_get(&job->hw_fence); /* Reference for the job_list */
+
+	spin_lock_irq(&sched->lock);
+	if (job->duration_us) {
+		ktime_t prev_finish_at = 0;
+
+		if (!list_empty(&sched->job_list)) {
+			struct drm_mock_sched_job *prev =
+				list_last_entry(&sched->job_list, typeof(*prev),
+						link);
+
+			prev_finish_at = prev->finish_at;
+		}
+
+		if (!prev_finish_at)
+			prev_finish_at = ktime_get();
+
+		job->finish_at = ktime_add_us(prev_finish_at, job->duration_us);
+	}
+	list_add_tail(&job->link, &sched->job_list);
+	if (job->finish_at)
+		hrtimer_start(&job->timer, job->finish_at, HRTIMER_MODE_ABS);
+	spin_unlock_irq(&sched->lock);
+
+	return &job->hw_fence;
+}
+
+static enum drm_gpu_sched_stat
+mock_sched_timedout_job(struct drm_sched_job *sched_job)
+{
+	return DRM_GPU_SCHED_STAT_ENODEV;
+}
+
+static void mock_sched_free_job(struct drm_sched_job *sched_job)
+{
+	drm_sched_job_cleanup(sched_job);
+}
+
+static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
+	.run_job = mock_sched_run_job,
+	.timedout_job = mock_sched_timedout_job,
+	.free_job = mock_sched_free_job
+};
+
+/**
+ * drm_mock_new_scheduler - Create a new mock scheduler
+ *
+ * @test: KUnit test owning the job
+ *
+ * Returns: New mock scheduler with allocation managed by the test
+ */
+struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test)
+{
+	struct drm_sched_init_args args = {
+		.ops 		= &drm_mock_scheduler_ops,
+		.num_rqs 	= DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit	= U32_MAX,
+		.hang_limit 	= UINT_MAX,
+		.timeout	= MAX_SCHEDULE_TIMEOUT,
+		.name 		= "drm-mock-scheduler",
+	};
+	struct drm_mock_scheduler *sched;
+	int ret;
+
+	sched = kunit_kzalloc(test, sizeof(*sched), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, sched);
+
+	ret = drm_sched_init(&sched->base, &args);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sched->test = test;
+	sched->hw_timeline.context = dma_fence_context_alloc(1);
+	atomic_set(&sched->hw_timeline.next_seqno, 0);
+	INIT_LIST_HEAD(&sched->job_list);
+	spin_lock_init(&sched->lock);
+
+	return sched;
+}
+
+/**
+ * drm_mock_scheduler_fini - Destroys a mock scheduler
+ *
+ * @sched: Scheduler to destroy
+ *
+ * To be used from the test cases once done with the scheduler.
+ */
+void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched)
+{
+	struct drm_mock_sched_job *job, *next;
+	unsigned long flags;
+	LIST_HEAD(signal);
+
+	spin_lock_irqsave(&sched->lock, flags);
+	list_for_each_entry_safe(job, next, &sched->job_list, link)
+		list_move_tail(&job->link, &signal);
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	list_for_each_entry(job, &signal, link) {
+		hrtimer_cancel(&job->timer);
+		dma_fence_put(&job->hw_fence);
+	}
+
+	drm_sched_fini(&sched->base);
+}
+
+/**
+ * drm_mock_sched_advance - Advances the mock scheduler timeline
+ *
+ * @sched: Scheduler timeline to advance
+ * @num: By how many jobs to advance
+ *
+ * Advancing the scheduler timeline by a number of seqnos will trigger
+ * signalling of the hardware fences and unlinking the jobs from the internal
+ * scheduler tracking.
+ *
+ * This can be used from test cases which want complete control of the simulated
+ * job execution timing. For example submitting one job with no set duration
+ * would never complete it before test cases advances the timeline by one.
+ */
+unsigned int drm_mock_sched_advance(struct drm_mock_scheduler *sched,
+				    unsigned int num)
+{
+	struct drm_mock_sched_job *job, *next;
+	unsigned int found = 0;
+	unsigned long flags;
+	LIST_HEAD(signal);
+
+	spin_lock_irqsave(&sched->lock, flags);
+	if (WARN_ON_ONCE(sched->hw_timeline.cur_seqno + num <
+			 sched->hw_timeline.cur_seqno))
+		goto unlock;
+	sched->hw_timeline.cur_seqno += num;
+	list_for_each_entry_safe(job, next, &sched->job_list, link) {
+		if (sched->hw_timeline.cur_seqno < job->hw_fence.seqno)
+			break;
+
+		list_move_tail(&job->link, &signal);
+		found++;
+	}
+unlock:
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	list_for_each_entry(job, &signal, link) {
+		dma_fence_signal(&job->hw_fence);
+		dma_fence_put(&job->hw_fence);
+	}
+
+	return found;
+}
+
+MODULE_DESCRIPTION("DRM mock scheduler and tests");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
new file mode 100644
index 000000000000..eae79365ff67
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -0,0 +1,218 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _SCHED_TESTS_H_
+#define _SCHED_TESTS_H_
+
+#include <kunit/test.h>
+#include <linux/atomic.h>
+#include <linux/dma-fence.h>
+#include <linux/hrtimer.h>
+#include <linux/ktime.h>
+#include <linux/list.h>
+#include <linux/atomic.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#include <drm/gpu_scheduler.h>
+
+/*
+ * DOC: Mock DRM scheduler data structures
+ *
+ * drm_mock_* data structures are used to implement a mock "GPU".
+ *
+ * They subclass the core DRM scheduler objects and add their data on top, which
+ * enables tracking the submitted jobs and simulating their execution with the
+ * attributes as specified by the test case.
+ */
+
+/**
+ * struct drm_mock_scheduler - implements a trivial mock GPU execution engine
+ *
+ * @base: DRM scheduler base class
+ * @test: Backpointer to owning the kunit test case
+ * @lock: Lock to protect the simulated @hw_timeline and the @job_list
+ * @job_list: List of jobs submitted to the mock GPU
+ * @hw_timeline: Simulated hardware timeline has a @context, @next_seqno and
+ *		 @cur_seqno for implementing a struct dma_fence signaling the
+ *		 simulated job completion.
+ *
+ * Trivial mock GPU execution engine tracks submitted jobs and enables
+ * completing them strictly in submission order.
+ */
+struct drm_mock_scheduler {
+	struct drm_gpu_scheduler base;
+
+	struct kunit		*test;
+
+	spinlock_t		lock;
+	struct list_head	job_list;
+
+	struct {
+		u64		context;
+		atomic_t	next_seqno;
+		unsigned int	cur_seqno;
+	} hw_timeline;
+};
+
+/**
+ * struct drm_mock_sched_entity - implements a mock GPU sched entity
+ *
+ * @base: DRM scheduler entity base class
+ * @test: Backpointer to owning the kunit test case
+ *
+ * Mock GPU sched entity is used by the test cases to submit jobs to the mock
+ * scheduler.
+ */
+ struct drm_mock_sched_entity {
+	struct drm_sched_entity base;
+
+	struct kunit		*test;
+};
+
+/**
+ * struct drm_mock_sched_job - implements a mock GPU job
+ *
+ * @base: DRM sched job base class
+ * @link: List head element used by job tracking by the drm_mock_scheduler
+ * @timer: Timer used for simulating job execution duration
+ * @duration_us: Simulated job duration in micro seconds, or zero if in manual
+ * 		 timeline advance mode
+ * @finish_at: Absolute time when the jobs with set duration will complete
+ * @lock: Lock used for @hw_fence
+ * @hw_fence: Fence returned to DRM scheduler as the hardware fence
+ * @test: Backpointer to owning the kunit test case
+ *
+ * Mock GPU sched job is used by the test cases to submit jobs to the mock
+ * scheduler.
+ */
+struct drm_mock_sched_job {
+	struct drm_sched_job	base;
+
+	struct list_head	link;
+	struct hrtimer		timer;
+
+	unsigned int		duration_us;
+	ktime_t			finish_at;
+
+	spinlock_t		lock;
+	struct dma_fence	hw_fence;
+
+	struct kunit		*test;
+};
+
+static inline struct drm_mock_scheduler *
+drm_sched_to_mock_sched(struct drm_gpu_scheduler *sched)
+{
+	return container_of(sched, struct drm_mock_scheduler, base);
+};
+
+static inline struct drm_mock_sched_entity *
+drm_sched_entity_to_mock_entity(struct drm_sched_entity *sched_entity)
+{
+	return container_of(sched_entity, struct drm_mock_sched_entity, base);
+};
+
+static inline struct drm_mock_sched_job *
+drm_sched_job_to_mock_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct drm_mock_sched_job, base);
+};
+
+struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test);
+void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched);
+unsigned int drm_mock_sched_advance(struct drm_mock_scheduler *sched,
+				    unsigned int num);
+
+struct drm_mock_sched_entity *
+drm_mock_new_sched_entity(struct kunit *test,
+			  enum drm_sched_priority priority,
+			  struct drm_mock_scheduler *sched);
+void drm_mock_sched_entity_free(struct drm_mock_sched_entity *entity);
+
+struct drm_mock_sched_job *
+drm_mock_new_sched_job(struct kunit *test,
+		       struct drm_mock_sched_entity *entity);
+
+/**
+ * drm_mock_sched_job_submit - Arm and submit a job in one go
+ *
+ * @job: Job to arm and submit
+ */
+static inline void drm_mock_sched_job_submit(struct drm_mock_sched_job *job)
+{
+	drm_sched_job_arm(&job->base);
+	drm_sched_entity_push_job(&job->base);
+}
+
+/**
+ * drm_mock_sched_job_set_duration_us - Set a job duration
+ *
+ * @job: Job to set the duration for
+ * @duration_us: Duration in micro seconds
+ *
+ * Jobs with duration set will be automatically completed by the mock scheduler
+ * as the timeline progress, unless a job without a set duration is encountered
+ * in the timelime in which case calling drm_mock_sched_advance will be required
+ * to bump the timeline.
+ */
+static inline void
+drm_mock_sched_job_set_duration_us(struct drm_mock_sched_job *job,
+				   unsigned int duration_us)
+{
+	job->duration_us = duration_us;
+}
+
+/**
+ * drm_mock_sched_job_is_finished - Check if a job is finished
+ *
+ * @job: Job to check
+ *
+ * Returns: true if finished
+ */
+static inline bool
+drm_mock_sched_job_is_finished(struct drm_mock_sched_job *job)
+{
+	return dma_fence_is_signaled(&job->base.s_fence->finished);
+}
+
+/**
+ * drm_mock_sched_job_wait_finished - Wait until a job is finished
+ *
+ * @job: Job to wait for
+ * @timeout: Wait time in jiffies
+ *
+ * Returns: true if finished within the timeout provided, otherwise false
+ */
+static inline bool
+drm_mock_sched_job_wait_finished(struct drm_mock_sched_job *job, long timeout)
+{
+	long ret;
+
+	ret = dma_fence_wait_timeout(&job->base.s_fence->finished,
+				      false,
+				      timeout);
+
+	return ret != 0;
+}
+
+/**
+ * drm_mock_sched_job_wait_finished - Wait until a job is scheduled
+ *
+ * @job: Job to wait for
+ * @timeout: Wait time in jiffies
+ *
+ * Returns: true if scheduled within the timeout provided, otherwise false
+ */
+static inline long
+drm_mock_sched_job_wait_scheduled(struct drm_mock_sched_job *job, long timeout)
+{
+	long ret;
+
+	ret = dma_fence_wait_timeout(&job->base.s_fence->scheduled,
+				      false,
+				      timeout);
+
+	return ret != 0;
+}
+
+#endif
diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
new file mode 100644
index 000000000000..2a1ab04e12b7
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "sched_tests.h"
+
+/*
+ * DRM scheduler basic tests should check the basic functional correctness of
+ * the scheduler, including some very light smoke testing. More targeted tests,
+ * for example focusing on testing specific bugs and other more complicated test
+ * scenarios, should be implemented in a separate source units.
+ */
+
+static int drm_sched_basic_init(struct kunit *test)
+{
+	test->priv = drm_mock_new_scheduler(test);
+
+	return 0;
+}
+
+static void drm_sched_basic_exit(struct kunit *test)
+{
+	struct drm_mock_scheduler *sched = test->priv;
+
+	drm_mock_scheduler_fini(sched);
+}
+
+static void drm_sched_basic_submit(struct kunit *test)
+{
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_sched_job *job;
+	unsigned int i;
+	bool done;
+
+	/*
+	 * Submit one job to the scheduler and verify that it gets scheduled
+	 * and completed only when the mock hw backend processes it.
+	 */
+
+	entity = drm_mock_new_sched_entity(test,
+					   DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+	job = drm_mock_new_sched_job(test, entity);
+
+	drm_mock_sched_job_submit(job);
+
+	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	KUNIT_ASSERT_EQ(test, done, true);
+
+	done = drm_mock_sched_job_wait_finished(job, HZ / 2);
+	KUNIT_ASSERT_EQ(test, done, false);
+
+	i = drm_mock_sched_advance(sched, 1);
+	KUNIT_ASSERT_EQ(test, i, 1);
+
+	done = drm_mock_sched_job_wait_finished(job, HZ);
+	KUNIT_ASSERT_EQ(test, done, true);
+
+	drm_mock_sched_entity_free(entity);
+}
+
+struct drm_sched_basic_params {
+	const char *description;
+	unsigned int queue_depth;
+	unsigned int num_entities;
+	unsigned int job_us;
+	bool dep_chain;
+};
+
+static const struct drm_sched_basic_params drm_sched_basic_cases[] = {
+	{
+		.description = "A queue of jobs in a single entity",
+		.queue_depth = 100,
+		.job_us = 1000,
+		.num_entities = 1,
+	},
+	{
+		.description = "A chain of dependent jobs across multiple entities",
+		.queue_depth = 100,
+		.job_us = 1000,
+		.num_entities = 1,
+		.dep_chain = true,
+	},
+	{
+		.description = "Multiple independent job queues",
+		.queue_depth = 100,
+		.job_us = 1000,
+		.num_entities = 4,
+	},
+	{
+		.description = "Multiple inter-dependent job queues",
+		.queue_depth = 100,
+		.job_us = 1000,
+		.num_entities = 4,
+		.dep_chain = true,
+	},
+};
+
+static void
+drm_sched_basic_desc(const struct drm_sched_basic_params *params, char *desc)
+{
+	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(drm_sched_basic, drm_sched_basic_cases, drm_sched_basic_desc);
+
+static void drm_sched_basic_test(struct kunit *test)
+{
+	const struct drm_sched_basic_params *params = test->param_value;
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_job *job, *prev = NULL;
+	struct drm_mock_sched_entity **entity;
+	unsigned int i, cur_ent = 0;
+	bool done;
+
+	entity = kunit_kcalloc(test, params->num_entities, sizeof(*entity),
+			       GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, entity);
+
+	for (i = 0; i < params->num_entities; i++)
+		entity[i] = drm_mock_new_sched_entity(test,
+						      DRM_SCHED_PRIORITY_NORMAL,
+						      sched);
+
+	for (i = 0; i < params->queue_depth; i++) {
+		job = drm_mock_new_sched_job(test, entity[cur_ent++]);
+		cur_ent %= params->num_entities;
+		drm_mock_sched_job_set_duration_us(job, params->job_us);
+		if (params->dep_chain && prev)
+			drm_sched_job_add_dependency(&job->base,
+						     dma_fence_get(&prev->base.s_fence->finished));
+		drm_mock_sched_job_submit(job);
+		prev = job;
+	}
+
+	done = drm_mock_sched_job_wait_finished(job, HZ);
+	KUNIT_ASSERT_EQ(test, done, true);
+
+	for (i = 0; i < params->num_entities; i++)
+		drm_mock_sched_entity_free(entity[i]);
+}
+
+static void drm_sched_basic_entity_cleanup(struct kunit *test)
+{
+	struct drm_mock_sched_job *job, *mid, *prev = NULL;
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_entity *entity[4];
+	const unsigned int qd = 100;
+	unsigned int i, cur_ent = 0;
+	bool done;
+
+	/*
+	 * Submit a queue of jobs across different entities with an explicit
+	 * chain of dependencies between them and trigger entity cleanup while
+	 * the queue is still being processed.
+	 */
+
+	for (i = 0; i < ARRAY_SIZE(entity); i++)
+		entity[i] = drm_mock_new_sched_entity(test,
+						      DRM_SCHED_PRIORITY_NORMAL,
+						      sched);
+
+	for (i = 0; i < qd; i++) {
+		job = drm_mock_new_sched_job(test, entity[cur_ent++]);
+		cur_ent %= ARRAY_SIZE(entity);
+		drm_mock_sched_job_set_duration_us(job, 1000);
+		if (prev)
+			drm_sched_job_add_dependency(&job->base,
+						     dma_fence_get(&prev->base.s_fence->finished));
+		drm_mock_sched_job_submit(job);
+		if (i == qd / 2)
+			mid = job;
+		prev = job;
+	}
+
+	done = drm_mock_sched_job_wait_finished(mid, HZ);
+	KUNIT_ASSERT_EQ(test, done, true);
+
+	/* Exit with half of the queue still pending to be executed. */
+	for (i = 0; i < ARRAY_SIZE(entity); i++)
+		drm_mock_sched_entity_free(entity[i]);}
+
+static struct kunit_case drm_sched_basic_tests[] = {
+	KUNIT_CASE(drm_sched_basic_submit),
+	KUNIT_CASE_PARAM(drm_sched_basic_test, drm_sched_basic_gen_params),
+	KUNIT_CASE(drm_sched_basic_entity_cleanup),
+	{}
+};
+
+static struct kunit_suite drm_sched_basic = {
+	.name = "drm_sched_basic_tests",
+	.init = drm_sched_basic_init,
+	.exit = drm_sched_basic_exit,
+	.test_cases = drm_sched_basic_tests,
+};
+
+kunit_test_suite(drm_sched_basic);
-- 
2.48.0

