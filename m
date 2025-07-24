Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70896B10E4D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 17:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D184C10E025;
	Thu, 24 Jul 2025 15:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eZTeUo4d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDE410E025
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753369638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/a8VlbaEngCx8IcTUGbOyinyFACg4mSk67Ts3n7PQBw=;
 b=eZTeUo4dXcDXBgYEQFhfNxHI647bAdsrywLu/4K0cSToyo3S1d7OLf9+Abu1OR6X6KWLUw
 JQZ/2zOtCX+APY2vCdv2zIEINAD88FWFhy8oFYP7mry6v39F4oZBIWfv6wfQMk4G0vVzEV
 GpNKGYchV714dpO7/Q+/Z504UY2NQ3Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-qT9dtRZDP4WQ7Q-HigT6OQ-1; Thu, 24 Jul 2025 11:07:16 -0400
X-MC-Unique: qT9dtRZDP4WQ7Q-HigT6OQ-1
X-Mimecast-MFC-AGG-ID: qT9dtRZDP4WQ7Q-HigT6OQ_1753369635
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ae3b2630529so108303066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753369635; x=1753974435;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=goool6zZHxbiYeT5PZTG+2TGMC8C7c+FdN7P0zvEbNc=;
 b=LPQfiVFAOhFsMKm9AM3Wn+LPPJsr1Mg46InFf2mgRJ43lm3ZcfMsykDNNiDV4Wiw4+
 o7kOcVU1nCE3+OZu60/8YSjm3d/W8CHCcQYCr5qI4KEMu9sibznlEAlBsRUt2gwIhQQj
 BsKZDDLYCEd8mj3bOoTAp1KH4wi2GNEgKECOPpZEtyK/HD086bwUXk6fwh/82QqypNUg
 SLWuCTRl9JyYkSMQzYtatlGgOkbGNxCpowiLLqRRUmFfeSjzVWU/srs8WutZaokkN+W3
 rHxEJcIUklIL+2T9qYExyxES+SDVTSz0Z2g17ON5Fhk1KfHMS/2i8n6/tjkdVZKr1iEQ
 aOJw==
X-Gm-Message-State: AOJu0YyyHeCuTwoGO7zT6KOgL7DqFPsKNtfkwD8RyMY9IjjgZ9kFAcCF
 BP6LFqgpSrNz8gwoE+76cs+LRQkgcsGTCS5E3Cs53Jg6bTMLCc+lWFO9Rp4rHLK499pl+EJ/0h5
 zisXxSScm6Udr29d/sfIvCpMvZU3qCuZf5c+avualaO7zxuFYScGOy1i+mB5gdJTlQMDa7w==
X-Gm-Gg: ASbGncvzk4+hjeG794XtqG05iFhQxTnHgiy6CqeQURPd/G/XlB8IqYPHkExJ4jDUEYh
 beu6MFykIwa0AakexaIOyf7ANNa/D4PfonQBcxNz24f8cp+nlQC/rersMXoCi4cyjHX2fpm5tlk
 pg4TG+kcizVhaTFp4xgXo/cR7XMjSKaEl0v+/BqRSDOlxsMUg/1yzsOfYp1CLtwTS9Vr5biic2e
 27PyeSn1dFiMd8cctA4BdItDlCHsGJ3N4h8GA34xvj9KKT5EMvcpv/9EbP5PdwXHzrLhYaZawVc
 hbA5fjOf3kWY35uIxewCeOAg4e0XhHvCHuCboKHM7zEFWSQIIMmQEHK2HsWoqqogi99U7Qp6++g
 zVCkCsP6Ow5g=
X-Received: by 2002:a17:906:4fd0:b0:ade:44f8:569 with SMTP id
 a640c23a62f3a-af2f8d4b875mr744969366b.42.1753369634798; 
 Thu, 24 Jul 2025 08:07:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAFluBZU3m5JKhU2ovOhD302OI8fxKvv5Lg9wR8FzqLUzAc8MbyYgITS3m3obeKvUPi0BF7Q==
X-Received: by 2002:a17:906:4fd0:b0:ade:44f8:569 with SMTP id
 a640c23a62f3a-af2f8d4b875mr744963466b.42.1753369634115; 
 Thu, 24 Jul 2025 08:07:14 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3df8:b00:49b5:ffbc:d28a:6af0?
 ([2001:16b8:3df8:b00:49b5:ffbc:d28a:6af0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47c496eefsm125727266b.25.2025.07.24.08.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 08:07:13 -0700 (PDT)
Message-ID: <f064a8c305bd2f2c0684251d3cd2470699c28d5e.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Extend and update documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Thu, 24 Jul 2025 17:07:11 +0200
In-Reply-To: <20250724140121.70873-2-phasta@kernel.org>
References: <20250724140121.70873-2-phasta@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O5yoNGalthZ8Ig-Cav3kKjAefqWjTuFGrG9F4w_oMk8_1753369635
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

Two comments from myself to open up room for discussion:

On Thu, 2025-07-24 at 16:01 +0200, Philipp Stanner wrote:
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
> The first draft for this docu was posted by Christian in late 2023 IIRC.
>=20
> This is an updated version. Please review.
>=20
> @Christian: As we agreed on months (a year?) ago I kept your Signed-off
> by. Just tell me if there's any issue or sth.
> ---
> =C2=A0Documentation/gpu/drm-mm.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 ++++
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 228 ++++++++++++++++++++++=
---
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A03 files changed, 238 insertions(+), 31 deletions(-)
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
> index 5a550fd76bf0..2e7bc1e74186 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,48 +24,220 @@
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
> + * as well as finishing of processing.
> + *
> + * The lifetime of this object also follows normal dma_fence refcounting=
 rules.
> + */

The relict I'm most unsure about is this docu for the scheduler fence.
I know that some drivers are accessing the s_fence, but I strongly
suspect that this is a) unncessary and b) dangerous.

But the original draft from Christian hinted at that. So, @Christian,
this would be an opportunity to discuss this matter.

Otherwise I'd drop this docu section in v2. What users don't know, they
cannot misuse.

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

This TODO can probably removed, too. The recently merged
DRM_GPU_SCHED_STAT_NO_HANG has solved this issue.


P.

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

