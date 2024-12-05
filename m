Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC49E5673
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB5710EE51;
	Thu,  5 Dec 2024 13:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g+k7Ps9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E2B10EE51
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733404805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/k0mKZFyQkafyDdzLQDOpDd1aRXoQv1cWCKJCPOTzrY=;
 b=g+k7Ps9AY0K2R7Tz1W/KlmmEjku04hEBCz1EtTslf2HSbZU0mGoTvIdp/WF7rxSMGBrfgK
 IdSFzJqOuxO47289XWKF2YLrvHPaoO/OgLc/82NZL4k24JbNZWptb2cYlNFKcFpWt2wpeK
 sV5FQkBAhH3jqiKn0RUPb0fSrk6Mffs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-iIRxiYdVOUKSc6_J2AyPLg-1; Thu, 05 Dec 2024 08:20:04 -0500
X-MC-Unique: iIRxiYdVOUKSc6_J2AyPLg-1
X-Mimecast-MFC-AGG-ID: iIRxiYdVOUKSc6_J2AyPLg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385ea3a3fe2so419957f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 05:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733404803; x=1734009603;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/k0mKZFyQkafyDdzLQDOpDd1aRXoQv1cWCKJCPOTzrY=;
 b=lDGXIFN5OYjfrNyG42SMfkKU67CbMZ/6+i4vbG3zeDOuztYZyKxsFyVGKETGl6CXZq
 QoSSbsab2UAiqseBIACR3sXkCjF3cfYjFFl0lrul0+BN6dnQzU/id3SOI7ITdVY/a4GU
 +3FKxxQsHiZOMY3YQHdPubNh//a1p7HTU9il4Eo1WI2uKijb0cwjUd0XPZz39TPmaEon
 L4r9YfsXJC3QpmUF75cNTrIlPyY4WFoYt878pIl+50tHGS44plfyPLhqCwdJqwSCjElA
 QMUj2pWDKwj444MyQfDcvuG/CEHr8QgeNS8uwSiiqu+wtN03Y4nxe8zBmFmyzS2mw0kS
 Jpvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWALVTi8zn6RW8iPsXwTo5Qj8Uq5CTwrhNgwfl+SW8GGDM38RtppU6nznjFk0u3FdCz5mBhut7VsP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVdIrZUJEpxx+Vkzrf1iNb6Dv0puDTgi17z9n5zOjeQAqjJXJx
 6Oq0q+e7ZIfM3WsyOFkT1KR1wSYoTF0eLaAwPMqV7EtbJu5DNmW5x8+lIgu4RmyZttZQfqxBRk9
 hJTE5rClu0YwsvgvdcquQ35y3kmRn3ep2YP0JJORwhu+v3gIYEp1vB8YDJzOgwZwWYw==
X-Gm-Gg: ASbGncusMNv4SuwloXIfhJIxJ7Ekz8378j+54/CfYAyazfzGSBOPMRdocFKqpCHdSr5
 Lo4cBDnDKEMWiKnhUwFU2PGl5RRhK8+i+FPDE3ChfYOzPvXTsCZxBXWaHZulH9ViBTJeihI+nR/
 4AMZg8WpYKi5Q1iMOa2/ADu0wmgzQKkS7GLHLTtYr5ssPMktZn61KahE2cQ02L+Ty0wAF4mIcLV
 0+UWWoE94wYzupKeobLBiAjlPyKt19AMdFE4+FCnCVVoSxzmHRteoFB+1Lp5pvlYDJc0JeS3Zex
X-Received: by 2002:a5d:5f45:0:b0:385:e4a7:def9 with SMTP id
 ffacd0b85a97d-385fd532811mr7422630f8f.50.1733404803026; 
 Thu, 05 Dec 2024 05:20:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0CT3E3LkPV1i3xbZmlzZzkEz3V9GibpUsI+FVebjTNBfnSjh6cTTbh0pbR0ZpvyxIWsJbYg==
X-Received: by 2002:a5d:5f45:0:b0:385:e4a7:def9 with SMTP id
 ffacd0b85a97d-385fd532811mr7422602f8f.50.1733404802456; 
 Thu, 05 Dec 2024 05:20:02 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861f59cd35sm1919323f8f.31.2024.12.05.05.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 05:20:01 -0800 (PST)
Message-ID: <5fefbb14c7597404e0c06050d2beca9662699439.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Extend and update documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Thu, 05 Dec 2024 14:20:00 +0100
In-Reply-To: <CAH5fLghFVxYUz0PRKq3_xsvaYpaaCGXBg9AOUnkYfiUpo70dTg@mail.gmail.com>
References: <20241115103548.90605-2-pstanner@redhat.com>
 <CAH5fLghFVxYUz0PRKq3_xsvaYpaaCGXBg9AOUnkYfiUpo70dTg@mail.gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dY-aVx5Vixf4icRGcKblehYpOhQCu0fLcL8oE7sAdfY_1733404803
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

On Thu, 2024-11-21 at 17:05 +0100, Alice Ryhl wrote:
> On Fri, Nov 15, 2024 at 11:36=E2=80=AFAM Philipp Stanner
> <pstanner@redhat.com> wrote:
> >=20
> > The various objects defined and used by the GPU scheduler are
> > currently
> > not fully documented. Furthermore, there is no documentation yet
> > informing drivers about how they should handle timeouts.
> >=20
> > Add documentation describing the scheduler's objects and timeout
> > procedure. Consistently, update
> > drm_sched_backend_ops.timedout_job()'s
> > documentation.
> >=20
> > Co-developed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > I shamelessly stole- ahm, borrowed this documentation patch that
> > Christian had submitted a year ago:
> >=20
> > https://lore.kernel.org/dri-devel/20231116141547.206695-1-christian.koe=
nig@amd.com/
> >=20
> > I took feedback from last year into account where applicable, but
> > it's
> > probably a good idea if you all take a close look again.
> >=20
> > P.
> > ---
> > =C2=A0Documentation/gpu/drm-mm.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 +++++
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 200
> > ++++++++++++++++++++++---
> > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
> > =C2=A03 files changed, 225 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-
> > mm.rst
> > index d55751cad67c..95ee95fd987a 100644
> > --- a/Documentation/gpu/drm-mm.rst
> > +++ b/Documentation/gpu/drm-mm.rst
> > @@ -556,12 +556,48 @@ Overview
> > =C2=A0.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> > =C2=A0=C2=A0=C2=A0 :doc: Overview
> >=20
> > +Job Object
> > +----------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> > +=C2=A0=C2=A0 :doc: Job Object
> > +
> > +Entity Object
> > +-------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> > +=C2=A0=C2=A0 :doc: Entity Object
> > +
> > +Hardware Fence Object
> > +---------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> > +=C2=A0=C2=A0 :doc: Hardware Fence Object
> > +
> > +Scheduler Fence Object
> > +----------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> > +=C2=A0=C2=A0 :doc: Scheduler Fence Object
> > +
> > +Scheduler and Run Queue Objects
> > +-------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> > +=C2=A0=C2=A0 :doc: Scheduler and Run Queue Objects
> > +
> > =C2=A0Flow Control
> > =C2=A0------------
> >=20
> > =C2=A0.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> > =C2=A0=C2=A0=C2=A0 :doc: Flow Control
> >=20
> > +Error and Timeout handling
> > +--------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> > +=C2=A0=C2=A0 :doc: Error and Timeout handling
> > +
> > =C2=A0Scheduler Function References
> > =C2=A0-----------------------------
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index e97c6c60bc96..76eb46281985 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -24,28 +24,155 @@
> > =C2=A0/**
> > =C2=A0 * DOC: Overview
> > =C2=A0 *
> > - * The GPU scheduler provides entities which allow userspace to
> > push jobs
> > - * into software queues which are then scheduled on a hardware run
> > queue.
> > - * The software queues have a priority among them. The scheduler
> > selects the entities
> > - * from the run queue using a FIFO. The scheduler provides
> > dependency handling
> > - * features among jobs. The driver is supposed to provide callback
> > functions for
> > - * backend operations to the scheduler like submitting a job to
> > hardware run queue,
> > - * returning the dependencies of a job etc.
> > + * The GPU scheduler is shared infrastructure intended to help
> > drivers managing
> > + * command submission to their hardware.
> > =C2=A0 *
> > - * The organisation of the scheduler is the following:
> > + * To do so, it offers a set of scheduling facilities that
> > interact with the
> > + * driver through callbacks which the latter can register.
> > =C2=A0 *
> > - * 1. Each hw run queue has one scheduler
> > - * 2. Each scheduler has multiple run queues with different
> > priorities
> > - *=C2=A0=C2=A0=C2=A0 (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> > - * 3. Each scheduler run queue has a queue of entities to schedule
> > - * 4. Entities themselves maintain a queue of jobs that will be
> > scheduled on
> > - *=C2=A0=C2=A0=C2=A0 the hardware.
> > + * In particular, the scheduler takes care of:
> > + *=C2=A0=C2=A0 - Ordering command submissions
> > + *=C2=A0=C2=A0 - Signalling DMA fences, e.g., for finished commands
> > + *=C2=A0=C2=A0 - Taking dependencies between command submissions into
> > account
> > + *=C2=A0=C2=A0 - Handling timeouts for command submissions
>=20
> For the signalling case, you say "e.g.". Does that mean it also
> signals DMA fences in other cases?

Good question =E2=80=93 it does signal another fence when a job is being
scheduled, but that's not really relevant for the scheduler user IMO.
On the other hand, the docu further down does refer to that fence.

I think we could mention them both here.

>=20
> > - * The jobs in a entity are always scheduled in the order that
> > they were pushed.
> > + * All callbacks the driver needs to implement are restricted by
> > DMA-fence
> > + * signaling rules to guarantee deadlock free forward progress.
> > This especially
> > + * means that for normal operation no memory can be allocated in a
> > callback.
> > + * All memory which is needed for pushing the job to the hardware
> > must be
> > + * allocated before arming a job. It also means that no locks can
> > be taken
> > + * under which memory might be allocated as well.
> > =C2=A0 *
> > - * Note that once a job was taken from the entities queue and
> > pushed to the
> > - * hardware, i.e. the pending queue, the entity must not be
> > referenced anymore
> > - * through the jobs entity pointer.
> > + * Memory which is optional to allocate, for example for device
> > core dumping or
> > + * debugging, *must* be allocated with GFP_NOWAIT and appropriate
> > error
> > + * handling if that allocation fails. GFP_ATOMIC should only be
> > used if
> > + * absolutely necessary since dipping into the special atomic
> > reserves is
> > + * usually not justified for a GPU driver.
> > + *
> > + * Note especially the following about the scheduler's historic
> > background that
> > + * lead to sort of a double role it plays today:
> > + *
> > + * In classic setups N entities share one scheduler, and the
> > scheduler decides
> > + * which job to pick from which entity and move it to the hardware
> > ring next
> > + * (that is: "scheduling").
> > + *
> > + * Many (especially newer) GPUs, however, can have an almost
> > arbitrary number
> > + * of hardware rings and it's a firmware scheduler which actually
> > decides which
> > + * job will run next. In such setups, the GPU scheduler is still
> > used (e.g., in
> > + * Nouveau) but does not "schedule" jobs in the classical sense
> > anymore. It
> > + * merely serves to queue and dequeue jobs and resolve
> > dependencies. In such a
> > + * scenario, it is recommended to have one scheduler per entity.
> > + */
> > +
> > +/**
> > + * DOC: Job Object
> > + *
> > + * The base job object (drm_sched_job) contains submission
> > dependencies in the
> > + * form of DMA-fence objects. Drivers can also implement an
> > optional
> > + * prepare_job callback which returns additional dependencies as
> > DMA-fence
> > + * objects. It's important to note that this callback can't
> > allocate memory or
> > + * grab locks under which memory is allocated.
> > + *
> > + * Drivers should use this as base class for an object which
> > contains the
> > + * necessary state to push the command submission to the hardware.
> > + *
> > + * The lifetime of the job object needs to last at least from
> > submitting it to
> > + * the scheduler (through drm_sched_job_arm()) until the scheduler
> > has invoked
> > + * drm_sched_backend_ops.free_job() and, thereby, has indicated
> > that it does
> > + * not need the job anymore. Drivers can of course keep their job
> > object alive
> > + * for longer than that, but that's outside of the scope of the
> > scheduler
> > + * component.
> > + *
> > + * Job initialization is split into two stages:
> > + *=C2=A0=C2=A0 1. drm_sched_job_init() which serves for basic preparat=
ion of
> > a job.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Drivers don't have to be mindful of t=
his function's
> > consequences and
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 its effects can be reverted through
> > drm_sched_job_cleanup().
> > + *=C2=A0=C2=A0 2. drm_sched_job_arm() which irrevokably arms a job for
> > execution. This
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 activates the job's fence, i.e., it r=
egisters the
> > callbacks. Thus,
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inevitably, the callbacks will access=
 the job and its
> > memory at some
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 point in the future. This means that =
once
> > drm_sched_job_arm() has been
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 called, the job structure has to be v=
alid until the
> > scheduler invoked
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job().
>=20
> This is written as-if there could be multiple callbacks in a single
> job. Is that the case?
>=20

No, arm() just arms the software fence that will fire after the
scheduler is done with the job and calls free_job().

Will adjust.

>=20
>=20
>=20
> Also typo: "invoked" -> "invokes".

Past tense actually was done on purpose, but I think present tense is
better indeed, because the validity ends once the function starts
executing.

>=20
> > + * It's important to note that after arming a job drivers must
> > follow the
> > + * DMA-fence rules and can't easily allocate memory or takes locks
> > under which
> > + * memory is allocated.
>=20
> comma? "job, drivers"
> typo: "or takes" -> "or take"

ACK

>=20
> > +
> > +/**
> > + * DOC: Entity Object
> > + *
> > + * The entity object (drm_sched_entity) which is a container for
> > jobs which
> > + * should execute sequentially. Drivers should create an entity
> > for each
> > + * individual context they maintain for command submissions which
> > can run in
> > + * parallel.
>=20
> This is a bit awkward, how about: "The entity object is a container
> for jobs that should execute sequentially."

ACK

>=20
> > + * The lifetime of the entity *should not* exceed the lifetime of
> > the
> > + * userspace process it was created for and drivers should call
> > the
> > + * drm_sched_entity_flush() function from their
> > file_operations.flush()
> > + * callback. It is possible that an entity object is not alive
> > anymore
> > + * while jobs previously fetched from it are still running on the
> > hardware.
>=20
> To be clear ... this is about not letting processes run code after
> dying, and not because something you're using gets freed after
> flush(), correct?

Not sure if I can fully follow, but this section is not really about
preventing processes from anything. It's just that an entity is created
as a job-container for a specific process, so it doesn't make sense
that the entity lives longer than the process.

If the driver wouldn't ensure that it would simply mean that the
scheduler keeps pulling jobs from that entity, but since the userspace
process is gone by then it wouldn't really matter. I'm not aware of
this really being harmful, as long as the entity gets cleaned up at
some point.

>=20
> > + * This is done because all results of a command submission should
> > become
> > + * visible externally even after a process exits. This is normal
> > POSIX
> > + * behavior for I/O operations.
> > + *
> > + * The problem with this approach is that GPU submissions contain
> > executable
> > + * shaders enabling processes to evade their termination by
> > offloading work to
> > + * the GPU. So when a process is terminated with a SIGKILL the
> > entity object
> > + * makes sure that jobs are freed without running them while still
> > maintaining
> > + * correct sequential order for signaling fences.
> > + */
> > +
> > +/**
> > + * DOC: Hardware Fence Object
> > + *
> > + * The hardware fence object is a DMA-fence provided by the driver
> > as result of
> > + * running jobs. Drivers need to make sure that the normal DMA-
> > fence semantics
> > + * are followed for this object. It's important to note that the
> > memory for
> > + * this object can *not* be allocated in
> > drm_sched_backend_ops.run_job() since
> > + * that would violate the requirements for the DMA-fence
> > implementation. The
> > + * scheduler maintains a timeout handler which triggers if this
> > fence doesn't
> > + * signal within a configurable amount of time.
> > + *
> > + * The lifetime of this object follows DMA-fence refcounting
> > rules. The
> > + * scheduler takes ownership of the reference returned by the
> > driver and
> > + * drops it when it's not needed any more.
> > + */
> > +
> > +/**
> > + * DOC: Scheduler Fence Object
> > + *
> > + * The scheduler fence object (drm_sched_fence) which encapsulates
> > the whole
> > + * time from pushing the job into the scheduler until the hardware
> > has finished
> > + * processing it. This is internally managed by the scheduler, but
> > drivers can
> > + * grab additional reference to it after arming a job. The
> > implementation
> > + * provides DMA-fence interfaces for signaling both scheduling of
> > a command
> > + * submission as well as finishing of processing.
>=20
> typo: "an additional reference" or "additional references"
>=20
> > + * The lifetime of this object also follows normal DMA-fence
> > refcounting rules.
> > + * The finished fence is the one normally exposed to the outside
> > world, but the
> > + * driver can grab references to both the scheduled as well as the
> > finished
> > + * fence when needed for pipelining optimizations.
>=20
> When you refer to the "scheduled fence" and the "finished fence",
> these are referring to "a fence indicating when the job was scheduled
> / finished", rather than "a fence which was scheduled for execution
> and has now become finished", correct? I think the wording could be a
> bit clearer here.

If anything it would have to be "A fence signaling once a job has been
scheduled".

I'll try to come up with a better wording

Thx,
P.


>=20
> Alice
>=20

