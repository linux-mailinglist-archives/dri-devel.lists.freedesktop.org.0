Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056A9B3FD7A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0658910E666;
	Tue,  2 Sep 2025 11:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P8ghxtLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8328910E666
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:12:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 28ABC44A11;
 Tue,  2 Sep 2025 11:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D33C4CEF5;
 Tue,  2 Sep 2025 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756811553;
 bh=957bTBHXYSSNFWOxfDE0dIMqFGmytxcROeciI4THAZI=;
 h=From:To:Cc:Subject:Date:From;
 b=P8ghxtLkKeeGyi0OJcj7pijqNMCfHT1WwRg/vgSDYlbEPib6kFelaj/RcDuBxbiDr
 qHh9X8YTigWC53O/SaR0oaHTczfF3zWbcNHmcO9GJkFRSwQzsvFe+As0/GGgod1cyd
 EDZxGzAHmINGYSqYctHltwFOIRzBmTenZdmIiSIjQ7DgETrzqbsbSYL0bHoPUVAysd
 ibO5YpSO20daHq8vkf2e/Am3Qa1t0Z0M+TLFOd1aByqmwWHsQ19H0Dxw32Ih1ubljd
 k5SQ1txQNBbFQUHH2dzuJE9XwwduIGCeI8vQDuzOuviJAOnh0dyXl+D81//ZPJDQFc
 P0YNUTMJQ8SKw==
From: Philipp Stanner <phasta@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2] drm/sched: Extend and update documentation
Date: Tue,  2 Sep 2025 13:12:10 +0200
Message-ID: <20250902111209.64082-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

From: Philipp Stanner <pstanner@redhat.com>

The various objects and their memory lifetime used by the GPU scheduler
are currently not fully documented.

Add documentation describing the scheduler's objects. Improve the
general documentation at a few other places.

Co-developed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Changes in v2:
  - Rephrase drm_sched_fence docu to make it clearer why drivers would
    care about it.
---
 Documentation/gpu/drm-mm.rst           |  36 ++++
 drivers/gpu/drm/scheduler/sched_main.c | 229 ++++++++++++++++++++++---
 include/drm/gpu_scheduler.h            |   5 +-
 3 files changed, 239 insertions(+), 31 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index d55751cad67c..95ee95fd987a 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -556,12 +556,48 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
    :doc: Overview
 
+Job Object
+----------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Job Object
+
+Entity Object
+-------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Entity Object
+
+Hardware Fence Object
+---------------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Hardware Fence Object
+
+Scheduler Fence Object
+----------------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Scheduler Fence Object
+
+Scheduler and Run Queue Objects
+-------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Scheduler and Run Queue Objects
+
 Flow Control
 ------------
 
 .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
    :doc: Flow Control
 
+Error and Timeout handling
+--------------------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Error and Timeout handling
+
 Scheduler Function References
 -----------------------------
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 46119aacb809..ec8165fa9ac3 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -24,48 +24,221 @@
 /**
  * DOC: Overview
  *
- * The GPU scheduler provides entities which allow userspace to push jobs
- * into software queues which are then scheduled on a hardware run queue.
- * The software queues have a priority among them. The scheduler selects the entities
- * from the run queue using a FIFO. The scheduler provides dependency handling
- * features among jobs. The driver is supposed to provide callback functions for
- * backend operations to the scheduler like submitting a job to hardware run queue,
- * returning the dependencies of a job etc.
+ * The GPU scheduler is shared infrastructure intended to help drivers managing
+ * command submission to their hardware.
  *
- * The organisation of the scheduler is the following:
+ * To do so, it offers a set of scheduling facilities that interact with the
+ * driver through callbacks which the latter can register.
  *
- * 1. Each hw run queue has one scheduler
- * 2. Each scheduler has multiple run queues with different priorities
- *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
- * 3. Each scheduler run queue has a queue of entities to schedule
- * 4. Entities themselves maintain a queue of jobs that will be scheduled on
- *    the hardware.
+ * In particular, the scheduler takes care of:
+ *   - Ordering command submissions
+ *   - Signalling dma_fences, e.g., for finished commands
+ *   - Taking dependencies between command submissions into account
+ *   - Handling timeouts for command submissions
  *
- * The jobs in an entity are always scheduled in the order in which they were pushed.
+ * All callbacks the driver needs to implement are restricted by dma_fence
+ * signaling rules to guarantee deadlock free forward progress. This especially
+ * means that for normal operation no memory can be allocated in a callback.
+ * All memory which is needed for pushing the job to the hardware must be
+ * allocated before arming a job. It also means that no locks can be taken
+ * under which memory might be allocated.
  *
- * Note that once a job was taken from the entities queue and pushed to the
- * hardware, i.e. the pending queue, the entity must not be referenced anymore
- * through the jobs entity pointer.
+ * Optional memory, for example for device core dumping or debugging, *must* be
+ * allocated with GFP_NOWAIT and appropriate error handling if that allocation
+ * fails. GFP_ATOMIC should only be used if absolutely necessary since dipping
+ * into the special atomic reserves is usually not justified for a GPU driver.
+ *
+ * Note especially the following about the scheduler's historic background that
+ * lead to sort of a double role it plays today:
+ *
+ * In classic setups N ("hardware scheduling") entities share one scheduler,
+ * and the scheduler decides which job to pick from which entity and move it to
+ * the hardware ring next (that is: "scheduling").
+ *
+ * Many (especially newer) GPUs, however, can have an almost arbitrary number
+ * of hardware rings and it's a firmware scheduler which actually decides which
+ * job will run next. In such setups, the GPU scheduler is still used (e.g., in
+ * Nouveau) but does not "schedule" jobs in the classical sense anymore. It
+ * merely serves to queue and dequeue jobs and resolve dependencies. In such a
+ * scenario, it is recommended to have one scheduler per entity.
+ */
+
+/**
+ * DOC: Job Object
+ *
+ * The base job object (&struct drm_sched_job) contains submission dependencies
+ * in the form of &struct dma_fence objects. Drivers can also implement an
+ * optional prepare_job callback which returns additional dependencies as
+ * dma_fence objects. It's important to note that this callback can't allocate
+ * memory or grab locks under which memory is allocated.
+ *
+ * Drivers should use this as base class for an object which contains the
+ * necessary state to push the command submission to the hardware.
+ *
+ * The lifetime of the job object needs to last at least from submitting it to
+ * the scheduler (through drm_sched_job_arm()) until the scheduler has invoked
+ * &struct drm_sched_backend_ops.free_job and, thereby, has indicated that it
+ * does not need the job anymore. Drivers can of course keep their job object
+ * alive for longer than that, but that's outside of the scope of the scheduler
+ * component.
+ *
+ * Job initialization is split into two stages:
+ *   1. drm_sched_job_init() which serves for basic preparation of a job.
+ *      Drivers don't have to be mindful of this function's consequences and
+ *      its effects can be reverted through drm_sched_job_cleanup().
+ *   2. drm_sched_job_arm() which irrevokably arms a job for execution. This
+ *      initializes the job's fences and the job has to be submitted with
+ *      drm_sched_entity_push_job(). Once drm_sched_job_arm() has been called,
+ *      the job structure has to be valid until the scheduler invoked
+ *      drm_sched_backend_ops.free_job().
+ *
+ * It's important to note that after arming a job drivers must follow the
+ * dma_fence rules and can't easily allocate memory or takes locks under which
+ * memory is allocated.
+ */
+
+/**
+ * DOC: Entity Object
+ *
+ * The entity object (&struct drm_sched_entity) is a container for jobs which
+ * should execute sequentially. Drivers should create an entity for each
+ * individual context they maintain for command submissions which can run in
+ * parallel.
+ *
+ * The lifetime of the entity *should not* exceed the lifetime of the
+ * userspace process it was created for and drivers should call the
+ * drm_sched_entity_flush() function from their file_operations.flush()
+ * callback. It is possible that an entity object is not alive anymore
+ * while jobs previously fetched from it are still running on the hardware.
+ *
+ * This is done because all results of a command submission should become
+ * visible externally even after a process exits. This is normal POSIX
+ * behavior for I/O operations.
+ *
+ * The problem with this approach is that GPU submissions contain executable
+ * shaders enabling processes to evade their termination by offloading work to
+ * the GPU. So when a process is terminated with a SIGKILL the entity object
+ * makes sure that jobs are freed without running them while still maintaining
+ * correct sequential order for signaling fences.
+ *
+ * All entities associated with a scheduler have to be torn down before that
+ * scheduler.
+ */
+
+/**
+ * DOC: Hardware Fence Object
+ *
+ * The hardware fence object is a dma_fence provided by the driver through
+ * &struct drm_sched_backend_ops.run_job. The driver signals this fence once the
+ * hardware has completed the associated job.
+ *
+ * Drivers need to make sure that the normal dma_fence semantics are followed
+ * for this object. It's important to note that the memory for this object can
+ * *not* be allocated in &struct drm_sched_backend_ops.run_job since that would
+ * violate the requirements for the dma_fence implementation. The scheduler
+ * maintains a timeout handler which triggers if this fence doesn't signal
+ * within a configurable amount of time.
+ *
+ * The lifetime of this object follows dma_fence refcounting rules. The
+ * scheduler takes ownership of the reference returned by the driver and
+ * drops it when it's not needed any more.
+ *
+ * See &struct drm_sched_backend_ops.run_job for precise refcounting rules.
+ */
+
+/**
+ * DOC: Scheduler Fence Object
+ *
+ * The scheduler fence object (&struct drm_sched_fence) encapsulates the whole
+ * time from pushing the job into the scheduler until the hardware has finished
+ * processing it. It is managed by the scheduler. The implementation provides
+ * dma_fence interfaces for signaling both scheduling of a command submission
+ * as well as finishing of processing. &struct drm_sched_fence.finished is the
+ * fence typically used to synchronize userspace, e.g., in a &struct drm_syncobj.
+ *
+ * The lifetime of this object also follows normal dma_fence refcounting rules.
+ */
+
+/**
+ * DOC: Scheduler and Run Queue Objects
+ *
+ * The scheduler object itself (&struct drm_gpu_scheduler) does the actual
+ * scheduling: it picks the next entity to run a job from and pushes that job
+ * onto the hardware. Both FIFO and RR selection algorithms are supported, with
+ * FIFO being the default and the recommended one.
+ *
+ * The lifetime of the scheduler is managed by the driver using it. Before
+ * destroying the scheduler the driver must ensure that all hardware processing
+ * involving this scheduler object has finished by calling for example
+ * disable_irq(). It is *not* sufficient to wait for the hardware fence here
+ * since this doesn't guarantee that all callback processing has finished.
+ *
+ * The run queue object (&struct drm_sched_rq) is a container for entities of a
+ * certain priority level. This object is internally managed by the scheduler
+ * and drivers must not touch it directly. The lifetime of a run queue is bound
+ * to the scheduler's lifetime.
+ *
+ * All entities associated with a scheduler must be torn down before it. Drivers
+ * should implement &struct drm_sched_backend_ops.cancel_job to avoid pending
+ * jobs (those that were pulled from an entity into the scheduler, but have not
+ * been completed by the hardware yet) from leaking.
  */
 
 /**
  * DOC: Flow Control
  *
  * The DRM GPU scheduler provides a flow control mechanism to regulate the rate
- * in which the jobs fetched from scheduler entities are executed.
+ * at which jobs fetched from scheduler entities are executed.
  *
- * In this context the &drm_gpu_scheduler keeps track of a driver specified
- * credit limit representing the capacity of this scheduler and a credit count;
- * every &drm_sched_job carries a driver specified number of credits.
+ * In this context the &struct drm_gpu_scheduler keeps track of a driver
+ * specified credit limit representing the capacity of this scheduler and a
+ * credit count; every &struct drm_sched_job carries a driver-specified number
+ * of credits.
  *
- * Once a job is executed (but not yet finished), the job's credits contribute
- * to the scheduler's credit count until the job is finished. If by executing
- * one more job the scheduler's credit count would exceed the scheduler's
- * credit limit, the job won't be executed. Instead, the scheduler will wait
- * until the credit count has decreased enough to not overflow its credit limit.
- * This implies waiting for previously executed jobs.
+ * Once a job is being executed, the job's credits contribute to the
+ * scheduler's credit count until the job is finished. If by executing one more
+ * job the scheduler's credit count would exceed the scheduler's credit limit,
+ * the job won't be executed. Instead, the scheduler will wait until the credit
+ * count has decreased enough to not overflow its credit limit. This implies
+ * waiting for previously executed jobs.
  */
 
+/**
+ * DOC: Error and Timeout handling
+ *
+ * Errors are signaled by using dma_fence_set_error() on the hardware fence
+ * object before signaling it with dma_fence_signal(). Errors are then bubbled
+ * up from the hardware fence to the scheduler fence.
+ *
+ * The entity allows querying errors on the last run submission using the
+ * drm_sched_entity_error() function which can be used to cancel queued
+ * submissions in &struct drm_sched_backend_ops.run_job as well as preventing
+ * pushing further ones into the entity in the driver's submission function.
+ *
+ * When the hardware fence doesn't signal within a configurable amount of time
+ * &struct drm_sched_backend_ops.timedout_job gets invoked. The driver should
+ * then follow the procedure described in that callback's documentation.
+ *
+ * (TODO: The timeout handler should probably switch to using the hardware
+ * fence as parameter instead of the job. Otherwise the handling will always
+ * race between timing out and signaling the fence).
+ *
+ * The scheduler also used to provided functionality for re-submitting jobs
+ * and, thereby, replaced the hardware fence during reset handling. This
+ * functionality is now deprecated. This has proven to be fundamentally racy
+ * and not compatible with dma_fence rules and shouldn't be used in new code.
+ *
+ * Additionally, there is the function drm_sched_increase_karma() which tries
+ * to find the entity which submitted a job and increases its 'karma' atomic
+ * variable to prevent resubmitting jobs from this entity. This has quite some
+ * overhead and resubmitting jobs is now marked as deprecated. Thus, using this
+ * function is discouraged.
+ *
+ * Drivers can still recreate the GPU state in case it should be lost during
+ * timeout handling *if* they can guarantee that forward progress will be made
+ * and this doesn't cause another timeout. But this is strongly hardware
+ * specific and out of the scope of the general GPU scheduler.
+ */
 #include <linux/export.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 323a505e6e6a..0f0687b7ae9c 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -458,8 +458,8 @@ struct drm_sched_backend_ops {
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
 	/**
-	 * @timedout_job: Called when a job has taken too long to execute,
-	 * to trigger GPU recovery.
+	 * @timedout_job: Called when a hardware fence didn't signal within a
+	 * configurable amount of time. Triggers GPU recovery.
 	 *
 	 * @sched_job: The job that has timed out
 	 *
@@ -506,7 +506,6 @@ struct drm_sched_backend_ops {
 	 * that timeout handlers are executed sequentially.
 	 *
 	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
-	 *
 	 */
 	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
 
-- 
2.49.0

