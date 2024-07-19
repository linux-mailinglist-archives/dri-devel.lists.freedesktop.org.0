Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277CE9376A2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 12:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EEE10EBCA;
	Fri, 19 Jul 2024 10:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YrjymrR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DA510EBCA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721384959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dT5rlvIegmNIz/VgnezeaktvGPPJD0p8ZPZYVCYmYsA=;
 b=YrjymrR8DX7cc9D3LxaiQ3VhWt9o2l8fIE2okOVvwGun+EZD+9acjo7yWmmH3qEbgUqp7+
 B5JYG51f7ypAP/GRCv1re7e2+/LOCQuHrooiGRRMJZGWkqA+oytxiJGwvHNtYw6qKdFZIc
 e+ud3iWy1W75Z+UTcEKROSKDu05CsQw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-UyEw2Y7sMl-eelCCXtnsQQ-1; Fri, 19 Jul 2024 06:29:18 -0400
X-MC-Unique: UyEw2Y7sMl-eelCCXtnsQQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-367a13df177so73949f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 03:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721384957; x=1721989757;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dT5rlvIegmNIz/VgnezeaktvGPPJD0p8ZPZYVCYmYsA=;
 b=P5/CeaX4FGNr6jjDxN/UvfKFvQTwy6metb/9T0qykeYusBZl2gAchrjBVNRnS4zQW+
 xs6RsScvBunfW//LHXHxufWbVxDLQq2fRj5K/1D1OcYSiL/AkHYfqJwhvMc8QdbhxNZL
 XXGpmBaJtuMv1A/1yysHP/dRHFMzXjx8/z58jtwH8aibKmnOWdn8+1ttlSGydiwk0Ham
 H7LezVPKXy9AP0ST2wPp8rc8wIIBSR6XE5R0vIIYIgw8OwP4QkRX89vwpngy2/2cFxPx
 PaxovYoCe6Izl7c3e3PVsByqwM9qULRX5QDCbh1p6tFFLnWFEz42675qDeFb9gh/kWMN
 LWVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdXLwkSDnYKGavuGRzyNrVbSO2zMfl1/+H3Cq4wyiQu0pKfDqHZojZ3KQzb8/0aBmC3EDWgEYzIgh7Esz/SubhZTcKhM2My8tsGYBIkjlv
X-Gm-Message-State: AOJu0YwU1nn4E8A2w/fa51Yw2rGsB+aJSisZefh/5ATfTg1Y74lQXP2w
 W3d+cdhVvJCuoTBQwHFywf9dnMZiI3DFU4O3Z3a0dL0rPfbFAIh0UOXZKLmSDiuN4/4EBjod7s3
 szSMwrRtvx4s0X5XuqevFeUDQL5MLTHAhkIbqlK+yIxwAaRYfVOa0J4+mw9dfbF0IWA==
X-Received: by 2002:a05:6000:1867:b0:35f:1edb:4695 with SMTP id
 ffacd0b85a97d-36872c8d500mr816269f8f.6.1721384956834; 
 Fri, 19 Jul 2024 03:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCELDoctMyvr+KfQbUjn9brn/B0HqomdlcvegpkvwKfxvd9KQNvAURUIyydcCtsimZuN/gxQ==
X-Received: by 2002:a05:6000:1867:b0:35f:1edb:4695 with SMTP id
 ffacd0b85a97d-36872c8d500mr816256f8f.6.1721384956335; 
 Fri, 19 Jul 2024 03:29:16 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868bb00sm1214263f8f.43.2024.07.19.03.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 03:29:15 -0700 (PDT)
Message-ID: <12bfeb46149e77dc04a4d158be6a28af55fc4c43.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/scheduler: improve GPU scheduler documentation v2
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dakr@redhat.com, airlied@gmail.com, ltuikov89@gmail.com,
 matthew.brost@intel.com,  boris.brezillon@collabora.com, daniel@ffwll.ch,
 alexander.deucher@amd.com,  dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Fri, 19 Jul 2024 12:29:14 +0200
In-Reply-To: <20231116141547.206695-1-christian.koenig@amd.com>
References: <20231116141547.206695-1-christian.koenig@amd.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 2023-11-16 at 15:15 +0100, Christian K=C3=B6nig wrote:
> Start to improve the scheduler document. Especially document the
> lifetime of each of the objects as well as the restrictions around
> DMA-fence handling and userspace compatibility.

Hallo Christian,

thanks for working on this.

I'm currently looking deeper into the scheduler and am documenting the
pitfalls etc. that I have found so far.


What are your current plans with this documentation series? If you
don't intend to get it upstreamed in the foreseeable future, I would
like to hijack the series and use it as a basis for my own improvements
to the documentation.

Please tell me what you think,


Regards,
P.


>=20
> v2: Some improvements suggested by Danilo, add section about error
> =C2=A0=C2=A0=C2=A0 handling.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0Documentation/gpu/drm-mm.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 +++++
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 174 +++++++++++++++++++++-=
-
> --
> =C2=A02 files changed, 188 insertions(+), 22 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-
> mm.rst
> index acc5901ac840..112463fa9f3a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -552,12 +552,48 @@ Overview
> =C2=A0.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> =C2=A0=C2=A0=C2=A0 :doc: Overview
> =C2=A0
> +Job Object
> +----------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +=C2=A0=C2=A0 :doc: Job Object
> +
> +Entity Object
> +-------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +=C2=A0=C2=A0 :doc: Entity Object
> +
> +Hardware Fence Object
> +---------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +=C2=A0=C2=A0 :doc: Hardware Fence Object
> +
> +Scheduler Fence Object
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +=C2=A0=C2=A0 :doc: Scheduler Fence Object
> +
> +Scheduler and Run Queue Objects
> +-------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +=C2=A0=C2=A0 :doc: Scheduler and Run Queue Objects
> +
> =C2=A0Flow Control
> =C2=A0------------
> =C2=A0
> =C2=A0.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> =C2=A0=C2=A0=C2=A0 :doc: Flow Control
> =C2=A0
> +Error and Timeout handling
> +--------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +=C2=A0=C2=A0 :doc: Error and Timeout handling
> +
> =C2=A0Scheduler Function References
> =C2=A0-----------------------------
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 044a8c4875ba..026123497b0e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,28 +24,122 @@
> =C2=A0/**
> =C2=A0 * DOC: Overview
> =C2=A0 *
> - * The GPU scheduler provides entities which allow userspace to push
> jobs
> - * into software queues which are then scheduled on a hardware run
> queue.
> - * The software queues have a priority among them. The scheduler
> selects the entities
> - * from the run queue using a FIFO. The scheduler provides
> dependency handling
> - * features among jobs. The driver is supposed to provide callback
> functions for
> - * backend operations to the scheduler like submitting a job to
> hardware run queue,
> - * returning the dependencies of a job etc.
> - *
> - * The organisation of the scheduler is the following:
> - *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different
> priorities
> - *=C2=A0=C2=A0=C2=A0 (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be
> scheduled on
> - *=C2=A0=C2=A0=C2=A0 the hardware.
> - *
> - * The jobs in a entity are always scheduled in the order that they
> were pushed.
> - *
> - * Note that once a job was taken from the entities queue and pushed
> to the
> - * hardware, i.e. the pending queue, the entity must not be
> referenced anymore
> - * through the jobs entity pointer.
> + * The GPU scheduler implements some logic to decide which command
> submission
> + * to push next to the hardware. Another major use case of the GPU
> scheduler
> + * is to enforce correct driver behavior around those command
> submissions.
> + * Because of this it's also used by drivers which don't need the
> actual
> + * scheduling functionality.
> + *
> + * All callbacks the driver needs to implement are restricted by
> DMA-fence
> + * signaling rules to guarantee deadlock free forward progress. This
> especially
> + * means that for normal operation no memory can be allocated in a
> callback.
> + * All memory which is needed for pushing the job to the hardware
> must be
> + * allocated before arming a job. It also means that no locks can be
> taken
> + * under which memory might be allocated as well.
> + *
> + * Memory which is optional to allocate, for example for device core
> dumping or
> + * debugging, *must* be allocated with GFP_NOWAIT and appropriate
> error
> + * handling taking if that allocation fails. GFP_ATOMIC should only
> be used if
> + * absolutely necessary since dipping into the special atomic
> reserves is
> + * usually not justified for a GPU driver.
> + */
> +
> +/**
> + * DOC: Job Object
> + *
> + * The base job object contains submission dependencies in the form
> of DMA-fence
> + * objects. Drivers can also implement an optional prepare_job
> callback which
> + * returns additional dependencies as DMA-fence objects. It's
> important to note
> + * that this callback can't allocate memory or grab locks under
> which memory is
> + * allocated.
> + *
> + * Drivers should use this as base class for an object which
> contains the
> + * necessary state to push the command submission to the hardware.
> + *
> + * The lifetime of the job object should at least be from pushing it
> into the
> + * scheduler until the scheduler notes through the free callback
> that a job
> + * isn't needed any more. Drivers can of course keep their job
> object alive
> + * longer than that, but that's outside of the scope of the
> scheduler
> + * component. Job initialization is split into two parts,
> drm_sched_job_init()
> + * and drm_sched_job_arm(). It's important to note that after arming
> a job
> + * drivers must follow the DMA-fence rules and can't easily allocate
> memory
> + * or takes locks under which memory is allocated.
> + */
> +
> +/**
> + * DOC: Entity Object
> + *
> + * The entity object which is a container for jobs which should
> execute
> + * sequentially. Drivers should create an entity for each individual
> context
> + * they maintain for command submissions which can run in parallel.
> + *
> + * The lifetime of the entity should *not* exceed the lifetime of
> the
> + * userspace process it was created for and drivers should call the
> + * drm_sched_entity_flush() function from their
> file_operations.flush
> + * callback. So it's possible that an entity object is not alive any
> + * more while jobs from it are still running on the hardware.
> + *
> + * Background is that for compatibility reasons with existing
> + * userspace all results of a command submission should become
> visible
> + * externally even after after a process exits. This is normal POSIX
> behavior
> + * for I/O operations.
> + *
> + * The problem with this approach is that GPU submissions contain
> executable
> + * shaders enabling processes to evade their termination by
> offloading work to
> + * the GPU. So when a process is terminated with a SIGKILL the
> entity object
> + * makes sure that jobs are freed without running them while still
> maintaining
> + * correct sequential order for signaling fences.
> + */
> +
> +/**
> + * DOC: Hardware Fence Object
> + *
> + * The hardware fence object is a DMA-fence provided by the driver
> as result of
> + * running jobs. Drivers need to make sure that the normal DMA-fence
> semantics
> + * are followed for this object. It's important to note that the
> memory for
> + * this object can *not* be allocated in the run_job callback since
> that would
> + * violate the requirements for the DMA-fence implementation. The
> scheduler
> + * maintains a timeout handler which triggers if this fence doesn't
> signal in
> + * a configurable time frame.
> + *
> + * The lifetime of this object follows DMA-fence ref-counting rules,
> the
> + * scheduler takes ownership of the reference returned by the driver
> and drops
> + * it when it's not needed any more.
> + */
> +
> +/**
> + * DOC: Scheduler Fence Object
> + *
> + * The scheduler fence object which encapsulates the whole time from
> pushing
> + * the job into the scheduler until the hardware has finished
> processing it.
> + * This is internally managed by the scheduler, but drivers can grab
> additional
> + * reference to it after arming a job. The implementation provides
> DMA-fence
> + * interfaces for signaling both scheduling of a command submission
> as well as
> + * finishing of processing.
> + *
> + * The lifetime of this object also follows normal DMA-fence ref-
> counting
> + * rules. The finished fence is the one normally exposed outside of
> the
> + * scheduler, but the driver can grab references to both the
> scheduled as well
> + * as the finished fence when needed for pipe-lining optimizations.
> + */
> +
> +/**
> + * DOC: Scheduler and Run Queue Objects
> + *
> + * The scheduler object itself does the actual work of selecting a
> job and
> + * pushing it to the hardware. Both FIFO and RR selection algorithm
> are
> + * supported, but FIFO is preferred for many use cases.
> + *
> + * The lifetime of the scheduler is managed by the driver using it.
> Before
> + * destroying the scheduler the driver must ensure that all hardware
> processing
> + * involving this scheduler object has finished by calling for
> example
> + * disable_irq(). It is *not* sufficient to wait for the hardware
> fence here
> + * since this doesn't guarantee that all callback processing has
> finished.
> + *
> + * The run queue object is a container of entities for a certain
> priority
> + * level. This object is internally managed by the scheduler and
> drivers
> + * shouldn't touch them directly. The lifetime of run queues are
> bound to the
> + * schedulers lifetime.
> =C2=A0 */
> =C2=A0
> =C2=A0/**
> @@ -72,6 +166,42 @@
> =C2=A0 * limit.
> =C2=A0 */
> =C2=A0
> +/**
> + * DOC: Error and Timeout handling
> + *
> + * Errors schould be signaled by using dma_fence_set_error() on the
> hardware
> + * fence object before signaling it. Errors are then bubbled up from
> the
> + * hardware fence to the scheduler fence.
> + *
> + * The entity allows querying errors on the last run submission
> using the
> + * drm_sched_entity_error() function which can be used to cancel
> queued
> + * submissions in the run_job callback as well as preventing pushing
> further
> + * ones into the entity in the drivers submission function.
> + *
> + * When the hardware fence fails to signal in a configurable amount
> of time the
> + * timedout_job callback is issued. The driver should then follow
> the procedure
> + * described on the &struct drm_sched_backend_ops.timedout_job
> callback (TODO:
> + * The timeout handler should probably switch to using the hardware
> fence as
> + * parameter instead of the job. Otherwise the handling will always
> race
> + * between timing out and signaling the fence).
> + *
> + * The scheduler also used to provided functionality for re-
> submitting jobs
> + * with replacing the hardware fence during reset handling. This
> functionality
> + * is now marked as deprecated. This has proven to be fundamentally
> racy and
> + * not compatible with DMA-fence rules and shouldn't be used in any
> new code.
> + *
> + * Additional there is the drm_sched_increase_karma() function which
> tries to
> + * find the entity which submitted a job and increases it's 'karma'
> + * atomic variable to prevent re-submitting jobs from this entity.
> This has
> + * quite some overhead and re-submitting jobs is now marked as
> deprecated. So
> + * using this function is rather discouraged.
> + *
> + * Drivers can still re-create the GPU state should it be lost
> during timeout
> + * handling when they can guarantee that forward progress is made
> and this
> + * doesn't cause another timeout. But this is strongly hardware
> specific and
> + * out of the scope of the general GPU scheduler.
> + */
> +
> =C2=A0#include <linux/wait.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/completion.h>

