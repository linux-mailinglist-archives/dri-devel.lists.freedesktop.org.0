Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F368B84B44
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 14:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5480C10E5DE;
	Thu, 18 Sep 2025 12:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A+0xIOMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500FB10E5DE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758200222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URFKUbaox8lk1r8FM9tjxxuv/0aDi97H7PmLem+xsaA=;
 b=A+0xIOMZwoUHhT1Cvh4Ggy74nPnU7RRBOxEYKL6QnGBaD7Jg3Mm0aKpeNhXVww6QLXdyV8
 h1TiOvlbYsxHtl4jl0OqdVAyfuiAlwjOXGFjU/eOij79zoUoPn3n4QXqE4nyDdalm2G9lF
 jisexuKy2JYrp1EdXY7DAPDSp4UJ75k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-f4cp9NEENXeQkfs9t_ei1Q-1; Thu, 18 Sep 2025 08:57:00 -0400
X-MC-Unique: f4cp9NEENXeQkfs9t_ei1Q-1
X-Mimecast-MFC-AGG-ID: f4cp9NEENXeQkfs9t_ei1Q_1758200220
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45f2f1a650dso6465695e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 05:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758200220; x=1758805020;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+G2G57brjzP7fDd4p7BLblfGFZKtja/hQGAuJj/LSS4=;
 b=fFysnUdXdrQiTZ8gXdVwaPoGiSKrDOgl/XjJFwAwsASkuChXiNMIhRTyCswoSWxHYh
 waLJHGXVUta9tI5fRfXzX2+nZZ7XG1NTMDCnLXTGQyxma+tZnkX6DLhjrC+Ehxlg3iEB
 xLuF4JCv/bh3atD/+IM1h1+HQ0vHzPaj1CcvqnWOJH1lJzDCYuCl4zLo/fNAXDyAgbzy
 9GiBX3TMnd6ZfnS6CImNF7LY6sRCBAJOnARrjkfgG6C58c4m0+2FsWEWn5t6M4zQBtvn
 YoviobwL3uyeloE2o7m509zOqTEARaM2ghTfleXAH+V8KlYV+N5Ej2CdZKNjSTSejxnp
 CCdg==
X-Gm-Message-State: AOJu0Yytz9bNWNBV+GjmoN6v7KgQj7A9sevyd5UOAIT3lRjgpL34zFY0
 LK7SAdUF/Vl26ZBCIdY2AR6q84cf3eRS0p2qDpDBWIp7SELcsVn+mdTGnffV9Fulkw7j9U8bKOu
 oB7OxnULeu8cHuCnbXj8ZRIGDpLGIt0B+2HHoQszwQzREvliFKshIqTpyq/cNHlLyCjPA5g==
X-Gm-Gg: ASbGncsXSFaEYyMheB5kJLwcgHIgT1rvAvL7376cB4ByOytzN7h51jvrdpt0hlkTemN
 0y5kW4nHl44V3Cj92HgL3KDbt/QPf+3adYI9jJWd0hstxu9SifWXIfeZ39KXv+KDp4As0lI0Gkb
 AKBaMiAt1mFRkzNJFZUX0mtLN69ddDB2X9+3zRDRIXK8iotaYMK9ps7hfpHxY6zOLn4/AW5gBhV
 z/4boepZ/bfUPOR0n0eW3tJ58VT28XNWcGGR8rTsJOUvz9+CbLY2zLRnTgXnlxuaQZETLfwX+Fu
 /Eo54zNb7tSOPpSK9+xVATNPIK/XJ/6z0xw9FDw4+/K3pX9ql2ITSMREeIz0oeW5rw==
X-Received: by 2002:a05:600c:3111:b0:45d:d287:d339 with SMTP id
 5b1f17b1804b1-4620683f1e4mr59189725e9.25.1758200219381; 
 Thu, 18 Sep 2025 05:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkjK8q6HLD65Yus/JNEtTpozWmfN8QjegT7AxCur8s6bhv3ZQXE6JS3HRhX04njJnsE1ESUA==
X-Received: by 2002:a05:600c:3111:b0:45d:d287:d339 with SMTP id
 5b1f17b1804b1-4620683f1e4mr59189255e9.25.1758200218756; 
 Thu, 18 Sep 2025 05:56:58 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613e849a41sm80188655e9.20.2025.09.18.05.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 05:56:58 -0700 (PDT)
Message-ID: <898dba7fa238b633a5b69700016605022d38172b.camel@redhat.com>
Subject: Re: [PATCH v2] drm/sched: Extend and update documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Thu, 18 Sep 2025 14:56:57 +0200
In-Reply-To: <20250902111209.64082-2-phasta@kernel.org>
References: <20250902111209.64082-2-phasta@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9vDKL2CMg_PU16ebaa1dUtwxcl2n0f4l4Zvt2ZAMfTc_1758200220
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

On Tue, 2025-09-02 at 13:12 +0200, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
>=20
> The various objects and their memory lifetime used by the GPU scheduler
> are currently not fully documented.
>=20
> Add documentation describing the scheduler's objects. Improve the
> general documentation at a few other places.
>=20
> Co-developed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> Changes in v2:
> =C2=A0 - Rephrase drm_sched_fence docu to make it clearer why drivers wou=
ld
> =C2=A0=C2=A0=C2=A0 care about it.

Ping.
Someone should review this :)

P.

> ---
> =C2=A0Documentation/gpu/drm-mm.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 ++++
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 229 ++++++++++++++++++++++=
---
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A03 files changed, 239 insertions(+), 31 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d55751cad67c..95ee95fd987a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -556,12 +556,48 @@ Overview
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
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 46119aacb809..ec8165fa9ac3 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,48 +24,221 @@
> =C2=A0/**
> =C2=A0 * DOC: Overview
> =C2=A0 *
> - * The GPU scheduler provides entities which allow userspace to push job=
s
> - * into software queues which are then scheduled on a hardware run queue=
.
> - * The software queues have a priority among them. The scheduler selects=
 the entities
> - * from the run queue using a FIFO. The scheduler provides dependency ha=
ndling
> - * features among jobs. The driver is supposed to provide callback funct=
ions for
> - * backend operations to the scheduler like submitting a job to hardware=
 run queue,
> - * returning the dependencies of a job etc.
> + * The GPU scheduler is shared infrastructure intended to help drivers m=
anaging
> + * command submission to their hardware.
> =C2=A0 *
> - * The organisation of the scheduler is the following:
> + * To do so, it offers a set of scheduling facilities that interact with=
 the
> + * driver through callbacks which the latter can register.
> =C2=A0 *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *=C2=A0=C2=A0=C2=A0 (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be schedule=
d on
> - *=C2=A0=C2=A0=C2=A0 the hardware.
> + * In particular, the scheduler takes care of:
> + *=C2=A0=C2=A0 - Ordering command submissions
> + *=C2=A0=C2=A0 - Signalling dma_fences, e.g., for finished commands
> + *=C2=A0=C2=A0 - Taking dependencies between command submissions into ac=
count
> + *=C2=A0=C2=A0 - Handling timeouts for command submissions
> =C2=A0 *
> - * The jobs in an entity are always scheduled in the order in which they=
 were pushed.
> + * All callbacks the driver needs to implement are restricted by dma_fen=
ce
> + * signaling rules to guarantee deadlock free forward progress. This esp=
ecially
> + * means that for normal operation no memory can be allocated in a callb=
ack.
> + * All memory which is needed for pushing the job to the hardware must b=
e
> + * allocated before arming a job. It also means that no locks can be tak=
en
> + * under which memory might be allocated.
> =C2=A0 *
> - * Note that once a job was taken from the entities queue and pushed to =
the
> - * hardware, i.e. the pending queue, the entity must not be referenced a=
nymore
> - * through the jobs entity pointer.
> + * Optional memory, for example for device core dumping or debugging, *m=
ust* be
> + * allocated with GFP_NOWAIT and appropriate error handling if that allo=
cation
> + * fails. GFP_ATOMIC should only be used if absolutely necessary since d=
ipping
> + * into the special atomic reserves is usually not justified for a GPU d=
river.
> + *
> + * Note especially the following about the scheduler's historic backgrou=
nd that
> + * lead to sort of a double role it plays today:
> + *
> + * In classic setups N ("hardware scheduling") entities share one schedu=
ler,
> + * and the scheduler decides which job to pick from which entity and mov=
e it to
> + * the hardware ring next (that is: "scheduling").
> + *
> + * Many (especially newer) GPUs, however, can have an almost arbitrary n=
umber
> + * of hardware rings and it's a firmware scheduler which actually decide=
s which
> + * job will run next. In such setups, the GPU scheduler is still used (e=
.g., in
> + * Nouveau) but does not "schedule" jobs in the classical sense anymore.=
 It
> + * merely serves to queue and dequeue jobs and resolve dependencies. In =
such a
> + * scenario, it is recommended to have one scheduler per entity.
> + */
> +
> +/**
> + * DOC: Job Object
> + *
> + * The base job object (&struct drm_sched_job) contains submission depen=
dencies
> + * in the form of &struct dma_fence objects. Drivers can also implement =
an
> + * optional prepare_job callback which returns additional dependencies a=
s
> + * dma_fence objects. It's important to note that this callback can't al=
locate
> + * memory or grab locks under which memory is allocated.
> + *
> + * Drivers should use this as base class for an object which contains th=
e
> + * necessary state to push the command submission to the hardware.
> + *
> + * The lifetime of the job object needs to last at least from submitting=
 it to
> + * the scheduler (through drm_sched_job_arm()) until the scheduler has i=
nvoked
> + * &struct drm_sched_backend_ops.free_job and, thereby, has indicated th=
at it
> + * does not need the job anymore. Drivers can of course keep their job o=
bject
> + * alive for longer than that, but that's outside of the scope of the sc=
heduler
> + * component.
> + *
> + * Job initialization is split into two stages:
> + *=C2=A0=C2=A0 1. drm_sched_job_init() which serves for basic preparatio=
n of a job.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Drivers don't have to be mindful of thi=
s function's consequences and
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 its effects can be reverted through drm=
_sched_job_cleanup().
> + *=C2=A0=C2=A0 2. drm_sched_job_arm() which irrevokably arms a job for e=
xecution. This
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initializes the job's fences and the jo=
b has to be submitted with
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_push_job(). Once drm_s=
ched_job_arm() has been called,
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the job structure has to be valid until=
 the scheduler invoked
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job().
> + *
> + * It's important to note that after arming a job drivers must follow th=
e
> + * dma_fence rules and can't easily allocate memory or takes locks under=
 which
> + * memory is allocated.
> + */
> +
> +/**
> + * DOC: Entity Object
> + *
> + * The entity object (&struct drm_sched_entity) is a container for jobs =
which
> + * should execute sequentially. Drivers should create an entity for each
> + * individual context they maintain for command submissions which can ru=
n in
> + * parallel.
> + *
> + * The lifetime of the entity *should not* exceed the lifetime of the
> + * userspace process it was created for and drivers should call the
> + * drm_sched_entity_flush() function from their file_operations.flush()
> + * callback. It is possible that an entity object is not alive anymore
> + * while jobs previously fetched from it are still running on the hardwa=
re.
> + *
> + * This is done because all results of a command submission should becom=
e
> + * visible externally even after a process exits. This is normal POSIX
> + * behavior for I/O operations.
> + *
> + * The problem with this approach is that GPU submissions contain execut=
able
> + * shaders enabling processes to evade their termination by offloading w=
ork to
> + * the GPU. So when a process is terminated with a SIGKILL the entity ob=
ject
> + * makes sure that jobs are freed without running them while still maint=
aining
> + * correct sequential order for signaling fences.
> + *
> + * All entities associated with a scheduler have to be torn down before =
that
> + * scheduler.
> + */
> +
> +/**
> + * DOC: Hardware Fence Object
> + *
> + * The hardware fence object is a dma_fence provided by the driver throu=
gh
> + * &struct drm_sched_backend_ops.run_job. The driver signals this fence =
once the
> + * hardware has completed the associated job.
> + *
> + * Drivers need to make sure that the normal dma_fence semantics are fol=
lowed
> + * for this object. It's important to note that the memory for this obje=
ct can
> + * *not* be allocated in &struct drm_sched_backend_ops.run_job since tha=
t would
> + * violate the requirements for the dma_fence implementation. The schedu=
ler
> + * maintains a timeout handler which triggers if this fence doesn't sign=
al
> + * within a configurable amount of time.
> + *
> + * The lifetime of this object follows dma_fence refcounting rules. The
> + * scheduler takes ownership of the reference returned by the driver and
> + * drops it when it's not needed any more.
> + *
> + * See &struct drm_sched_backend_ops.run_job for precise refcounting rul=
es.
> + */
> +
> +/**
> + * DOC: Scheduler Fence Object
> + *
> + * The scheduler fence object (&struct drm_sched_fence) encapsulates the=
 whole
> + * time from pushing the job into the scheduler until the hardware has f=
inished
> + * processing it. It is managed by the scheduler. The implementation pro=
vides
> + * dma_fence interfaces for signaling both scheduling of a command submi=
ssion
> + * as well as finishing of processing. &struct drm_sched_fence.finished =
is the
> + * fence typically used to synchronize userspace, e.g., in a &struct drm=
_syncobj.
> + *
> + * The lifetime of this object also follows normal dma_fence refcounting=
 rules.
> + */
> +
> +/**
> + * DOC: Scheduler and Run Queue Objects
> + *
> + * The scheduler object itself (&struct drm_gpu_scheduler) does the actu=
al
> + * scheduling: it picks the next entity to run a job from and pushes tha=
t job
> + * onto the hardware. Both FIFO and RR selection algorithms are supporte=
d, with
> + * FIFO being the default and the recommended one.
> + *
> + * The lifetime of the scheduler is managed by the driver using it. Befo=
re
> + * destroying the scheduler the driver must ensure that all hardware pro=
cessing
> + * involving this scheduler object has finished by calling for example
> + * disable_irq(). It is *not* sufficient to wait for the hardware fence =
here
> + * since this doesn't guarantee that all callback processing has finishe=
d.
> + *
> + * The run queue object (&struct drm_sched_rq) is a container for entiti=
es of a
> + * certain priority level. This object is internally managed by the sche=
duler
> + * and drivers must not touch it directly. The lifetime of a run queue i=
s bound
> + * to the scheduler's lifetime.
> + *
> + * All entities associated with a scheduler must be torn down before it.=
 Drivers
> + * should implement &struct drm_sched_backend_ops.cancel_job to avoid pe=
nding
> + * jobs (those that were pulled from an entity into the scheduler, but h=
ave not
> + * been completed by the hardware yet) from leaking.
> =C2=A0 */
> =C2=A0
> =C2=A0/**
> =C2=A0 * DOC: Flow Control
> =C2=A0 *
> =C2=A0 * The DRM GPU scheduler provides a flow control mechanism to regul=
ate the rate
> - * in which the jobs fetched from scheduler entities are executed.
> + * at which jobs fetched from scheduler entities are executed.
> =C2=A0 *
> - * In this context the &drm_gpu_scheduler keeps track of a driver specif=
ied
> - * credit limit representing the capacity of this scheduler and a credit=
 count;
> - * every &drm_sched_job carries a driver specified number of credits.
> + * In this context the &struct drm_gpu_scheduler keeps track of a driver
> + * specified credit limit representing the capacity of this scheduler an=
d a
> + * credit count; every &struct drm_sched_job carries a driver-specified =
number
> + * of credits.
> =C2=A0 *
> - * Once a job is executed (but not yet finished), the job's credits cont=
ribute
> - * to the scheduler's credit count until the job is finished. If by exec=
uting
> - * one more job the scheduler's credit count would exceed the scheduler'=
s
> - * credit limit, the job won't be executed. Instead, the scheduler will =
wait
> - * until the credit count has decreased enough to not overflow its credi=
t limit.
> - * This implies waiting for previously executed jobs.
> + * Once a job is being executed, the job's credits contribute to the
> + * scheduler's credit count until the job is finished. If by executing o=
ne more
> + * job the scheduler's credit count would exceed the scheduler's credit =
limit,
> + * the job won't be executed. Instead, the scheduler will wait until the=
 credit
> + * count has decreased enough to not overflow its credit limit. This imp=
lies
> + * waiting for previously executed jobs.
> =C2=A0 */
> =C2=A0
> +/**
> + * DOC: Error and Timeout handling
> + *
> + * Errors are signaled by using dma_fence_set_error() on the hardware fe=
nce
> + * object before signaling it with dma_fence_signal(). Errors are then b=
ubbled
> + * up from the hardware fence to the scheduler fence.
> + *
> + * The entity allows querying errors on the last run submission using th=
e
> + * drm_sched_entity_error() function which can be used to cancel queued
> + * submissions in &struct drm_sched_backend_ops.run_job as well as preve=
nting
> + * pushing further ones into the entity in the driver's submission funct=
ion.
> + *
> + * When the hardware fence doesn't signal within a configurable amount o=
f time
> + * &struct drm_sched_backend_ops.timedout_job gets invoked. The driver s=
hould
> + * then follow the procedure described in that callback's documentation.
> + *
> + * (TODO: The timeout handler should probably switch to using the hardwa=
re
> + * fence as parameter instead of the job. Otherwise the handling will al=
ways
> + * race between timing out and signaling the fence).
> + *
> + * The scheduler also used to provided functionality for re-submitting j=
obs
> + * and, thereby, replaced the hardware fence during reset handling. This
> + * functionality is now deprecated. This has proven to be fundamentally =
racy
> + * and not compatible with dma_fence rules and shouldn't be used in new =
code.
> + *
> + * Additionally, there is the function drm_sched_increase_karma() which =
tries
> + * to find the entity which submitted a job and increases its 'karma' at=
omic
> + * variable to prevent resubmitting jobs from this entity. This has quit=
e some
> + * overhead and resubmitting jobs is now marked as deprecated. Thus, usi=
ng this
> + * function is discouraged.
> + *
> + * Drivers can still recreate the GPU state in case it should be lost du=
ring
> + * timeout handling *if* they can guarantee that forward progress will b=
e made
> + * and this doesn't cause another timeout. But this is strongly hardware
> + * specific and out of the scope of the general GPU scheduler.
> + */
> =C2=A0#include <linux/export.h>
> =C2=A0#include <linux/wait.h>
> =C2=A0#include <linux/sched.h>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 323a505e6e6a..0f0687b7ae9c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -458,8 +458,8 @@ struct drm_sched_backend_ops {
> =C2=A0=09struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
> =C2=A0
> =C2=A0=09/**
> -=09 * @timedout_job: Called when a job has taken too long to execute,
> -=09 * to trigger GPU recovery.
> +=09 * @timedout_job: Called when a hardware fence didn't signal within a
> +=09 * configurable amount of time. Triggers GPU recovery.
> =C2=A0=09 *
> =C2=A0=09 * @sched_job: The job that has timed out
> =C2=A0=09 *
> @@ -506,7 +506,6 @@ struct drm_sched_backend_ops {
> =C2=A0=09 * that timeout handlers are executed sequentially.
> =C2=A0=09 *
> =C2=A0=09 * Return: The scheduler's status, defined by &enum drm_gpu_sche=
d_stat
> -=09 *
> =C2=A0=09 */
> =C2=A0=09enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sc=
hed_job);
> =C2=A0

