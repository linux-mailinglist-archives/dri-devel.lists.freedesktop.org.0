Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60129C06151
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B4310EA82;
	Fri, 24 Oct 2025 11:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="f6ct1l4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9999410EA81
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:49:58 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-63c0c9a408aso3247725a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761306597; x=1761911397; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8/RGl6b4ptj3iCJHoZpb3d4VHs25YKmPpIqQq+ADNx4=;
 b=f6ct1l4IgmqDcgoiLuarVGlb5eEkPsaC4udTVQrYYTm1z4Dq7wA0BxD0v/Vjcxem4A
 sLLZPW5gXLcrl2JbbTk8yA4c+kesY3q9t0V5qPsG8CX6j596x2gCfatdCzB1cKQVsxqH
 ojyHMwcNza96Ui1rf4Zy6U+8fPHj6avpN7JsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761306597; x=1761911397;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8/RGl6b4ptj3iCJHoZpb3d4VHs25YKmPpIqQq+ADNx4=;
 b=tzT+6yyq+IvoKtxrV77ueRrrBwcpaQz4Sk9fC/+FukfY1CtEdKCdzVJHjN5oJIcZJw
 7a1wNs1Jl71Jfg3SvlU+kJVKzBDTAhHzdInZjWUM8KkQ0cRnApgThdOm75A/fuZ9AM4e
 j5Ao+8K+NJyhIkKv6vTAzKm2swLo260e8X80djnnPa848sXh184UWogzDnlOwo2sjtnf
 QkO/KiJNUVxiHILHZ567ws1nxOJ4tWij6fAUtFsvXlxdeKFB4TQ52RoRlTbEZfthQF5I
 tXzYaFPemo6pmyHXsCC79LHhW+WJ5gDubdYkAbeqfDRdpWKlQJa21w50biapvViLPmuW
 xVpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5yA3q+t3rA5vINkVJwGd9RT0d+Lrvh8epeK4fOTXBL3ktNK8Uf8oxOB313SBAOVmkvKL7sjgfI4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSxYDK7TWFSg0geVG8aFuEDY7+gu4lvnNuwVfZALVL6hkNEwJD
 mNhaTs8TidR1DHZqltlul6U6hoDueDSoe4x3MZG9gazFTrY4evU+0/D5eUuXUXLzNoE=
X-Gm-Gg: ASbGnctw0KyOwLGFTxqE9pc6zT9uENQYV5oee1UwCNLqdTF/QA/oUd+NMx4juEm8X81
 ZZvfCtpk4ztskMSGf1WaTq7WxsqCx3mexayYk+qL3sPABX8DSzrC6RdNJlu8jlMC2P20RZipXUR
 E2PuOemRnD5mcLf6+7FGBfE84WhSn+IibkdTB3qhVcMnUqyl48+A/3KUaRIE/vJWn3VJfc5Pn5k
 B9PmjCc6Jewn6WXjo/xvNJfraTQ9QpfKK8MbFEsFz1PX7gQmfZq+VJB3R23McA9yZMWIn/ym+Xw
 asofe7fzWqD/239kav9GbJI5ysyfb9gyzvIXWWMI1seKhySYBYJdcsYU27nV4/qQVoW+Ss7NYWO
 oBtFyCauSXVO/5srQiARzSeqmF5GqSKoHMmvZTyZiiXSMDI4ebajTXHLbieGxGcS6A+VQ9RL+qz
 wVQbxeZMhSoQnQUhpR9yN9Cg==
X-Google-Smtp-Source: AGHT+IF7JGnxoZfL7beoGnpuKHkc6uZNkhf7zCj3Z6NjZryTXuBnPfp8zLrogiZLxJ7S2eAnUJU98A==
X-Received: by 2002:a17:906:684f:b0:b6d:7843:11c6 with SMTP id
 a640c23a62f3a-b6d78431ce3mr83123566b.25.1761306596978; 
 Fri, 24 Oct 2025 04:49:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5144d565sm512131166b.58.2025.10.24.04.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:49:56 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:49:54 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/sched: Extend and update documentation
Message-ID: <aPtn4pCub0R07r81@phenom.ffwll.local>
Mail-Followup-To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20251023143803.150978-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023143803.150978-2-phasta@kernel.org>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Thu, Oct 23, 2025 at 04:38:04PM +0200, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> The various objects and their memory lifetime used by the GPU scheduler
> are currently not fully documented.
> 
> Add documentation describing the scheduler's objects. Improve the
> general documentation at a few other places.
> 
> Co-developed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> Changes in v2:
>   - Fix some typos. (Bagas Sanjava)

Thanks a lot for doing these!

> ---
>  Documentation/gpu/drm-mm.rst           |  36 ++++
>  drivers/gpu/drm/scheduler/sched_main.c | 229 ++++++++++++++++++++++---
>  include/drm/gpu_scheduler.h            |   5 +-
>  3 files changed, 239 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d55751cad67c..95ee95fd987a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -556,12 +556,48 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Overview
>  
> +Job Object
> +----------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Job Object
> +
> +Entity Object
> +-------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Entity Object
> +
> +Hardware Fence Object
> +---------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Hardware Fence Object
> +
> +Scheduler Fence Object
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler Fence Object
> +
> +Scheduler and Run Queue Objects
> +-------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler and Run Queue Objects
> +
>  Flow Control
>  ------------
>  
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Flow Control
>  
> +Error and Timeout handling
> +--------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Error and Timeout handling
> +
>  Scheduler Function References
>  -----------------------------
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 46119aacb809..4ade766b8f00 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,48 +24,221 @@
>  /**
>   * DOC: Overview
>   *
> - * The GPU scheduler provides entities which allow userspace to push jobs
> - * into software queues which are then scheduled on a hardware run queue.
> - * The software queues have a priority among them. The scheduler selects the entities
> - * from the run queue using a FIFO. The scheduler provides dependency handling
> - * features among jobs. The driver is supposed to provide callback functions for
> - * backend operations to the scheduler like submitting a job to hardware run queue,
> - * returning the dependencies of a job etc.
> + * The GPU scheduler is a shared infrastructure intended to help drivers
> + * managing command submission to their hardware.
>   *
> - * The organisation of the scheduler is the following:
> + * To do so, it offers a set of scheduling facilities that interact with the
> + * driver through callbacks which the latter can register.
>   *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> - *    the hardware.
> + * In particular, the scheduler takes care of:
> + *   - Ordering command submissions
> + *   - Signalling dma_fences, e.g., for finished commands
> + *   - Taking dependencies between command submissions into account
> + *   - Handling timeouts for command submissions
>   *
> - * The jobs in an entity are always scheduled in the order in which they were pushed.
> + * All callbacks the driver needs to implement are restricted by dma_fence
> + * signaling rules to guarantee deadlock free forward progress. This especially
> + * means that for normal operation no memory can be allocated in a callback.
> + * All memory which is needed for pushing the job to the hardware must be
> + * allocated before arming a job. It also means that no locks can be taken
> + * under which memory might be allocated.
>   *
> - * Note that once a job was taken from the entities queue and pushed to the
> - * hardware, i.e. the pending queue, the entity must not be referenced anymore
> - * through the jobs entity pointer.
> + * Optional memory, for example for device core dumping or debugging, *must* be
> + * allocated with GFP_NOWAIT and appropriate error handling if that allocation
> + * fails. GFP_ATOMIC should only be used if absolutely necessary since dipping
> + * into the special atomic reserves is usually not justified for a GPU driver.
> + *
> + * Note especially the following about the scheduler's historic background that
> + * lead to sort of a double role it plays today:
> + *
> + * In classic setups N ("hardware scheduling") entities share one scheduler,
> + * and the scheduler decides which job to pick from which entity and move it to
> + * the hardware ring next (that is: "scheduling").
> + *
> + * Many (especially newer) GPUs, however, can have an almost arbitrary number
> + * of hardware rings and it's a firmware scheduler which actually decides which
> + * job will run next. In such setups, the GPU scheduler is still used (e.g., in
> + * Nouveau) but does not "schedule" jobs in the classical sense anymore. It
> + * merely serves to queue and dequeue jobs and resolve dependencies. In such a
> + * scenario, it is recommended to have one scheduler per entity.
> + */
> +
> +/**
> + * DOC: Job Object

Bit a bikeshed, but I'd put these into the relevant structure
documentations so that it's a bit easier to find from the code side of
things. You can still to a nice overview by linking to the structs instead
of the inline DOC: sections.

Also if the current struct kdoc are too cumbersome then switching them all
over the inline-style helps a _lot_

If you think this is the best I think you should at least add a reference
to each struct kdoc that links back to these, so that they can be
discovered somehow by clicking around in docs. But imo that's a really
cumbersome style.

Cheers, Sima

> + *
> + * The base job object (&struct drm_sched_job) contains submission dependencies
> + * in the form of &struct dma_fence objects. Drivers can also implement an
> + * optional prepare_job callback which returns additional dependencies as
> + * dma_fence objects. It's important to note that this callback can't allocate
> + * memory or grab locks under which memory is allocated.
> + *
> + * Drivers should use this as base class for an object which contains the
> + * necessary state to push the command submission to the hardware.
> + *
> + * The lifetime of the job object needs to last at least from submitting it to
> + * the scheduler (through drm_sched_job_arm()) until the scheduler has invoked
> + * &struct drm_sched_backend_ops.free_job and, thereby, has indicated that it
> + * does not need the job anymore. Drivers can of course keep their job object
> + * alive for longer than that, but that's outside of the scope of the scheduler
> + * component.
> + *
> + * Job initialization is split into two stages:
> + *   1. drm_sched_job_init() which serves for basic preparation of a job.
> + *      Drivers don't have to be mindful of this function's consequences and
> + *      its effects can be reverted through drm_sched_job_cleanup().
> + *   2. drm_sched_job_arm() which irrevocably arms a job for execution. This
> + *      initializes the job's fences and the job has to be submitted with
> + *      drm_sched_entity_push_job(). Once drm_sched_job_arm() has been called,
> + *      the job structure has to be valid until the scheduler invoked
> + *      drm_sched_backend_ops.free_job().
> + *
> + * It's important to note that after arming a job drivers must follow the
> + * dma_fence rules and can't easily allocate memory or takes locks under which
> + * memory is allocated.
> + */
> +
> +/**
> + * DOC: Entity Object
> + *
> + * The entity object (&struct drm_sched_entity) is a container for jobs which
> + * should execute sequentially. Drivers should create an entity for each
> + * individual context they maintain for command submissions which can run in
> + * parallel.
> + *
> + * The lifetime of the entity *should not* exceed the lifetime of the
> + * userspace process it was created for and drivers should call the
> + * drm_sched_entity_flush() function from their file_operations.flush()
> + * callback. It is possible that an entity object is not alive anymore
> + * while jobs previously fetched from it are still running on the hardware.
> + *
> + * This is done because all results of a command submission should become
> + * visible externally even after a process exits. This is normal POSIX
> + * behavior for I/O operations.
> + *
> + * The problem with this approach is that GPU submissions contain executable
> + * shaders enabling processes to evade their termination by offloading work to
> + * the GPU. So when a process is terminated with a SIGKILL the entity object
> + * makes sure that jobs are freed without running them while still maintaining
> + * correct sequential order for signaling fences.
> + *
> + * All entities associated with a scheduler have to be torn down before that
> + * scheduler.
> + */
> +
> +/**
> + * DOC: Hardware Fence Object
> + *
> + * The hardware fence object is a dma_fence provided by the driver through
> + * &struct drm_sched_backend_ops.run_job. The driver signals this fence once the
> + * hardware has completed the associated job.
> + *
> + * Drivers need to make sure that the normal dma_fence semantics are followed
> + * for this object. It's important to note that the memory for this object can
> + * *not* be allocated in &struct drm_sched_backend_ops.run_job since that would
> + * violate the requirements for the dma_fence implementation. The scheduler
> + * maintains a timeout handler which triggers if this fence doesn't signal
> + * within a configurable amount of time.
> + *
> + * The lifetime of this object follows dma_fence refcounting rules. The
> + * scheduler takes ownership of the reference returned by the driver and
> + * drops it when it's not needed any more.
> + *
> + * See &struct drm_sched_backend_ops.run_job for precise refcounting rules.
> + */
> +
> +/**
> + * DOC: Scheduler Fence Object
> + *
> + * The scheduler fence object (&struct drm_sched_fence) encapsulates the whole
> + * time from pushing the job into the scheduler until the hardware has finished
> + * processing it. It is managed by the scheduler. The implementation provides
> + * dma_fence interfaces for signaling both scheduling of a command submission
> + * as well as finishing of processing. &struct drm_sched_fence.finished is the
> + * fence typically used to synchronize userspace, e.g., in a &struct drm_syncobj.
> + *
> + * The lifetime of this object also follows normal dma_fence refcounting rules.
> + */
> +
> +/**
> + * DOC: Scheduler and Run Queue Objects
> + *
> + * The scheduler object itself (&struct drm_gpu_scheduler) does the actual
> + * scheduling: it picks the next entity to run a job from and pushes that job
> + * onto the hardware. Both FIFO and RR selection algorithms are supported, with
> + * FIFO being the default and the recommended one.
> + *
> + * The lifetime of the scheduler is managed by the driver using it. Before
> + * destroying the scheduler the driver must ensure that all hardware processing
> + * involving this scheduler object has finished by calling for example
> + * disable_irq(). It is *not* sufficient to wait for the hardware fence here
> + * since this doesn't guarantee that all callback processing has finished.
> + *
> + * The run queue object (&struct drm_sched_rq) is a container for entities of a
> + * certain priority level. This object is internally managed by the scheduler
> + * and drivers must not touch it directly. The lifetime of a run queue is bound
> + * to the scheduler's lifetime.
> + *
> + * All entities associated with a scheduler must be torn down before it. Drivers
> + * should implement &struct drm_sched_backend_ops.cancel_job to avoid pending
> + * jobs (those that were pulled from an entity into the scheduler, but have not
> + * been completed by the hardware yet) from leaking.
>   */
>  
>  /**
>   * DOC: Flow Control
>   *
>   * The DRM GPU scheduler provides a flow control mechanism to regulate the rate
> - * in which the jobs fetched from scheduler entities are executed.
> + * at which jobs fetched from scheduler entities are executed.
>   *
> - * In this context the &drm_gpu_scheduler keeps track of a driver specified
> - * credit limit representing the capacity of this scheduler and a credit count;
> - * every &drm_sched_job carries a driver specified number of credits.
> + * In this context the &struct drm_gpu_scheduler keeps track of a driver
> + * specified credit limit representing the capacity of this scheduler and a
> + * credit count; every &struct drm_sched_job carries a driver-specified number
> + * of credits.
>   *
> - * Once a job is executed (but not yet finished), the job's credits contribute
> - * to the scheduler's credit count until the job is finished. If by executing
> - * one more job the scheduler's credit count would exceed the scheduler's
> - * credit limit, the job won't be executed. Instead, the scheduler will wait
> - * until the credit count has decreased enough to not overflow its credit limit.
> - * This implies waiting for previously executed jobs.
> + * Once a job is being executed, the job's credits contribute to the
> + * scheduler's credit count until the job is finished. If by executing one more
> + * job the scheduler's credit count would exceed the scheduler's credit limit,
> + * the job won't be executed. Instead, the scheduler will wait until the credit
> + * count has decreased enough to not overflow its credit limit. This implies
> + * waiting for previously executed jobs.
>   */
>  
> +/**
> + * DOC: Error and Timeout handling
> + *
> + * Errors are signaled by using dma_fence_set_error() on the hardware fence
> + * object before signaling it with dma_fence_signal(). Errors are then bubbled
> + * up from the hardware fence to the scheduler fence.
> + *
> + * The entity allows querying errors on the last run submission using the
> + * drm_sched_entity_error() function which can be used to cancel queued
> + * submissions in &struct drm_sched_backend_ops.run_job as well as preventing
> + * pushing further ones into the entity in the driver's submission function.
> + *
> + * When the hardware fence doesn't signal within a configurable amount of time
> + * &struct drm_sched_backend_ops.timedout_job gets invoked. The driver should
> + * then follow the procedure described in that callback's documentation.
> + *
> + * (TODO: The timeout handler should probably switch to using the hardware
> + * fence as parameter instead of the job. Otherwise the handling will always
> + * race between timing out and signaling the fence).
> + *
> + * The scheduler also used to provided functionality for re-submitting jobs
> + * and, thereby, replaced the hardware fence during reset handling. This
> + * functionality is now deprecated. This has proven to be fundamentally racy
> + * and not compatible with dma_fence rules and shouldn't be used in new code.
> + *
> + * Additionally, there is the function drm_sched_increase_karma() which tries
> + * to find the entity which submitted a job and increases its 'karma' atomic
> + * variable to prevent resubmitting jobs from this entity. This has quite some
> + * overhead and resubmitting jobs is now marked as deprecated. Thus, using this
> + * function is discouraged.
> + *
> + * Drivers can still recreate the GPU state in case it should be lost during
> + * timeout handling *if* they can guarantee that forward progress will be made
> + * and this doesn't cause another timeout. But this is strongly hardware
> + * specific and out of the scope of the general GPU scheduler.
> + */
>  #include <linux/export.h>
>  #include <linux/wait.h>
>  #include <linux/sched.h>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..a97351435d9e 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -458,8 +458,8 @@ struct drm_sched_backend_ops {
>  	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>  
>  	/**
> -	 * @timedout_job: Called when a job has taken too long to execute,
> -	 * to trigger GPU recovery.
> +	 * @timedout_job: Called when a hardware fence didn't signal within a
> +	 * configurable amount of time. Triggers GPU recovery.
>  	 *
>  	 * @sched_job: The job that has timed out
>  	 *
> @@ -506,7 +506,6 @@ struct drm_sched_backend_ops {
>  	 * that timeout handlers are executed sequentially.
>  	 *
>  	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
> -	 *
>  	 */
>  	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
>  
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
