Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25049A21D37
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 13:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470910E0A3;
	Wed, 29 Jan 2025 12:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="TLAA9Lue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF9B10E0A3;
 Wed, 29 Jan 2025 12:39:39 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YjhYg5tqBz9ssC;
 Wed, 29 Jan 2025 13:39:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1738154375; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdTmDjzJQpTpO4oJnblWVYume1/13l4BJMyQdCMDZCw=;
 b=TLAA9LueEDKJQ7bByhFcq8bo2Z9BRR4YdZIFKUOGcLIwMpueLNX65BLY4Ho09e+Uxxjo7w
 qkMZSpOLoddVYlbtPCloPEiq1Z29m2rb9eOT+XJnnSivlkxFRFd4oxGeyAsi6w4EpFdUn8
 TkTwyIjo2W+TQCRIVF07hZo2eUomMXfinuQM0FwvT/fyOe2AkZGbSbMArAuMDmlS7CUjlf
 UVUfYx+NXIhVxP7d0uodn/lCadaEO3U7rbmtC16uHlmPZPKxbmOxBDQRMu2iZPGvKusc5t
 Kf9enlSnoJ+nhu80I5vRNDYVxFENEnKSjzkonx+fGZaafg+jMW9cmITfWt2mOw==
Message-ID: <c5c3791df54b7ae4ba1a31159a4beda0b44d00cf.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,  Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>,  Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Sunil Khatri <sunil.khatri@amd.com>, Lijo
 Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,  Mario
 Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, Yunxiang
 Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org, 
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 13:39:23 +0100
In-Reply-To: <f8c9a876-4616-454d-a816-bb3c90960245@igalia.com>
References: <20250128142927.103290-2-phasta@kernel.org>
 <f8c9a876-4616-454d-a816-bb3c90960245@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: b6dde845dc131c14c0b
X-MBO-RS-META: boujpu168mp6jrpemh5i7zsho1hyksw1
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-01-29 at 07:53 -0300, Ma=C3=ADra Canal wrote:
> Hi Philipp,
>=20
> On 28/01/25 11:29, Philipp Stanner wrote:
> > drm_sched_init() has a great many parameters and upcoming new
> > functionality for the scheduler might add even more. Generally, the
> > great number of parameters reduces readability and has already
> > caused
> > one missnaming in:
> >=20
> > commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> > nouveau_sched_init()").
> >=20
> > Introduce a new struct for the scheduler init parameters and port
> > all
> > users.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > Changes in v2:
> > =C2=A0=C2=A0 - Point out that the hang-limit is deprecated. (Christian)
> > =C2=A0=C2=A0 - Initialize the structs to 0 at declaration. (Planet Eart=
h)
> > =C2=A0=C2=A0 - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
> > =C2=A0=C2=A0 - Make the structs const where possible. (Boris)
> > =C2=A0=C2=A0 - v3d: Use just 1, universal, function for sched-init. (Ma=
=C3=ADra)
> > ---
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
> > =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0 | 20 +=
++----
> > =C2=A0 drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0 | 18 +=
+++--
> > =C2=A0 drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++--
> > =C2=A0 drivers/gpu/drm/msm/msm_ringbuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 17 +++---
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0 | 15 +=
++--
> > =C2=A0 drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0 | 20 +=
+++---
> > =C2=A0 drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 16 +++--
> > =C2=A0 drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0 | 29 +=
++++----
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 50 ++++++----------
> > =C2=A0 drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 68 +++++++++--------
> > -----
> > =C2=A0 drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++--
> > =C2=A0 drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 17 +++++-
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 ++++++++++--
> > =C2=A0 14 files changed, 206 insertions(+), 151 deletions(-)
> >=20
>=20
> [...]
>=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
> > b/drivers/gpu/drm/panthor/panthor_sched.c
> > index 5844a7f639e0..44713cfdcd74 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -3284,6 +3284,22 @@ static struct panthor_queue *
> > =C2=A0 group_create_queue(struct panthor_group *group,
> > =C2=A0=C2=A0		=C2=A0=C2=A0 const struct drm_panthor_queue_create *args)
> > =C2=A0 {
> > +	const struct drm_sched_init_args sched_args =3D {
> > +		.ops =3D &panthor_queue_sched_ops,
> > +		.submit_wq =3D group->ptdev->scheduler->wq,
> > +		.num_rqs =3D 1,
> > +		/*
> > +		 * The credit limit argument tells us the total
> > number of
> > +		 * instructions across all CS slots in the
> > ringbuffer, with
> > +		 * some jobs requiring twice as many as others,
> > depending on
> > +		 * their profiling status.
> > +		 */
> > +		.credit_limit =3D args->ringbuf_size / sizeof(u64),
> > +		.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> > +		.timeout_wq =3D group->ptdev->reset.wq,
> > +		.name =3D "panthor-queue",
> > +		.dev =3D group->ptdev->base.dev
> > +	};
> > =C2=A0=C2=A0	struct drm_gpu_scheduler *drm_sched;
> > =C2=A0=C2=A0	struct panthor_queue *queue;
> > =C2=A0=C2=A0	int ret;
> > @@ -3354,17 +3370,8 @@ group_create_queue(struct panthor_group
> > *group,
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto err_free_queue;
> > =C2=A0=20
> > -	/*
> > -	 * Credit limit argument tells us the total number of
> > instructions
> > -	 * across all CS slots in the ringbuffer, with some jobs
> > requiring
> > -	 * twice as many as others, depending on their profiling
> > status.
> > -	 */
> > -	ret =3D drm_sched_init(&queue->scheduler,
> > &panthor_queue_sched_ops,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->scheduler->wq, 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 args->ringbuf_size / sizeof(u64),
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->reset.wq,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "panthor-queue", group->ptdev-
> > >base.dev);
> > +
>=20
> Please don't use multiple blank lines.
>=20
> > +	ret =3D drm_sched_init(&queue->scheduler, &sched_args);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto err_free_queue;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index a48be16ab84f..6295b2654a7c 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1244,40 +1244,24 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> > =C2=A0=C2=A0 * drm_sched_init - Init a gpu scheduler instance
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > - * @ops: backend operations for this scheduler
> > - * @submit_wq: workqueue to use for submission. If NULL, an
> > ordered wq is
> > - *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used
> > - * @num_rqs: number of runqueues, one for each priority, up to
> > DRM_SCHED_PRIORITY_COUNT
> > - * @credit_limit: the number of credits this scheduler can hold
> > from all jobs
> > - * @hang_limit: number of times to allow a job to hang before
> > dropping it
> > - * @timeout: timeout value in jiffies for the scheduler
> > - * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > system_wq is
> > - *		used
> > - * @score: optional score atomic shared with other schedulers
> > - * @name: name used for debugging
> > - * @dev: target &struct device
> > + * @args: scheduler initialization arguments
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Return 0 on success, otherwise error code.
> > =C2=A0=C2=A0 */
> > -int drm_sched_init(struct drm_gpu_scheduler *sched,
> > -		=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > -		=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > -		=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> > hang_limit,
> > -		=C2=A0=C2=A0 long timeout, struct workqueue_struct
> > *timeout_wq,
> > -		=C2=A0=C2=A0 atomic_t *score, const char *name, struct
> > device *dev)
> > +int drm_sched_init(struct drm_gpu_scheduler *sched, const struct
> > drm_sched_init_args *args)
> > =C2=A0 {
> > =C2=A0=C2=A0	int i;
> > =C2=A0=20
> > -	sched->ops =3D ops;
> > -	sched->credit_limit =3D credit_limit;
> > -	sched->name =3D name;
> > -	sched->timeout =3D timeout;
> > -	sched->timeout_wq =3D timeout_wq ? : system_wq;
> > -	sched->hang_limit =3D hang_limit;
> > -	sched->score =3D score ? score : &sched->_score;
> > -	sched->dev =3D dev;
> > +	sched->ops =3D args->ops;
> > +	sched->credit_limit =3D args->credit_limit;
> > +	sched->name =3D args->name;
> > +	sched->timeout =3D args->timeout;
> > +	sched->timeout_wq =3D args->timeout_wq ? : system_wq;
> > +	sched->hang_limit =3D args->hang_limit;
> > +	sched->score =3D args->score ? args->score : &sched->_score;
>=20
> Could we keep it consistent and use the Elvis Operator here as well?
> Just like `sched->timeout_wq`.

This is literally just the old code.

And if at all, this insanely stupid GCC extension should not be used.
It's one of the typical compiler people rampages that make the C
language so terrible.

>=20
> > +	sched->dev =3D args->dev;
> > =C2=A0=20
> > -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > +	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > =C2=A0=C2=A0		/* This is a gross violation--tell drivers what
> > the=C2=A0 problem is.
> > =C2=A0=C2=A0		 */
> > =C2=A0=C2=A0		drm_err(sched, "%s: num_rqs cannot be greater than
> > DRM_SCHED_PRIORITY_COUNT\n",
> > @@ -1292,16 +1276,16 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> > =C2=A0=C2=A0		return 0;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	if (submit_wq) {
> > -		sched->submit_wq =3D submit_wq;
> > +	if (args->submit_wq) {
> > +		sched->submit_wq =3D args->submit_wq;
> > =C2=A0=C2=A0		sched->own_submit_wq =3D false;
> > =C2=A0=C2=A0	} else {
> > =C2=A0 #ifdef CONFIG_LOCKDEP
> > -		sched->submit_wq =3D
> > alloc_ordered_workqueue_lockdep_map(name,
> > +		sched->submit_wq =3D
> > alloc_ordered_workqueue_lockdep_map(args->name,
> > =C2=A0=C2=A0								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 WQ_MEM_RECLAIM,
> > =C2=A0=C2=A0								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 &drm_sched_lockdep_map);
> > =C2=A0 #else
> > -		sched->submit_wq =3D alloc_ordered_workqueue(name,
> > WQ_MEM_RECLAIM);
> > +		sched->submit_wq =3D alloc_ordered_workqueue(args-
> > >name, WQ_MEM_RECLAIM);
> > =C2=A0 #endif
> > =C2=A0=C2=A0		if (!sched->submit_wq)
> > =C2=A0=C2=A0			return -ENOMEM;
> > @@ -1309,11 +1293,11 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> > =C2=A0=C2=A0		sched->own_submit_wq =3D true;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched-
> > >sched_rq),
> > +	sched->sched_rq =3D kmalloc_array(args->num_rqs,
> > sizeof(*sched->sched_rq),
> > =C2=A0=C2=A0					GFP_KERNEL | __GFP_ZERO);
> > =C2=A0=C2=A0	if (!sched->sched_rq)
> > =C2=A0=C2=A0		goto Out_check_own;
> > -	sched->num_rqs =3D num_rqs;
> > +	sched->num_rqs =3D args->num_rqs;
> > =C2=A0=C2=A0	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
> > i++) {
> > =C2=A0=C2=A0		sched->sched_rq[i] =3D kzalloc(sizeof(*sched-
> > >sched_rq[i]), GFP_KERNEL);
> > =C2=A0=C2=A0		if (!sched->sched_rq[i])
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> > b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 961465128d80..dfccb4cda3a1 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -820,67 +820,57 @@ static const struct drm_sched_backend_ops
> > v3d_cpu_sched_ops =3D {
> > =C2=A0=C2=A0	.free_job =3D v3d_cpu_job_free
> > =C2=A0 };
> > =C2=A0=20
> > +/*
> > + * v3d's scheduler instances are all identical, except for ops and
> > name.
> > + */
>=20
> Could you remove this comment? The function is self-explanatory.
>=20
> > +static int
> > +v3d_queue_sched_init(struct v3d_dev *v3d, const struct
> > drm_sched_backend_ops *ops,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 enum v3d_queue queue, const char *name)
> > +{
> > +	struct drm_sched_init_args args =3D {
> > +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> > +		.credit_limit =3D 1,
> > +		.timeout =3D msecs_to_jiffies(500),
> > +		.dev =3D v3d->drm.dev
> > +	};
> > +
> > +	args.ops =3D ops;
> > +	args.name =3D name;
> > +
> > +	return drm_sched_init(&v3d->queue[queue].sched, &args);
> > +}
> > +
> > =C2=A0 int
> > =C2=A0 v3d_sched_init(struct v3d_dev *v3d)
> > =C2=A0 {
> > -	int hw_jobs_limit =3D 1;
> > -	int job_hang_limit =3D 0;
> > -	int hang_limit_ms =3D 500;
> > =C2=A0=C2=A0	int ret;
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_bin_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_bin", v3d->drm.dev);
> > +	ret =3D v3d_queue_sched_init(v3d, &v3d_bin_sched_ops,
> > V3D_BIN, "v3d_bin");
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		return ret;
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_render_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_render", v3d->drm.dev);
> > +	ret =3D v3d_queue_sched_init(v3d, &v3d_render_sched_ops,
> > V3D_RENDER,
> > +				=C2=A0=C2=A0 "v3d_render");
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto fail;
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_tfu_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_tfu", v3d->drm.dev);
> > +	ret =3D v3d_queue_sched_init(v3d, &v3d_tfu_sched_ops,
> > V3D_TFU, "v3d_tfu");
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto fail;
> > =C2=A0=20
> > =C2=A0=C2=A0	if (v3d_has_csd(v3d)) {
> > -		ret =3D drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_csd_sched_ops, NULL,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > job_hang_limit,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0
> > msecs_to_jiffies(hang_limit_ms), NULL,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_csd", v3d-
> > >drm.dev);
> > +		ret =3D v3d_queue_sched_init(v3d,
> > &v3d_csd_sched_ops, V3D_CSD,
> > +					=C2=A0=C2=A0 "v3d_csd");
> > =C2=A0=C2=A0		if (ret)
> > =C2=A0=C2=A0			goto fail;
> > =C2=A0=20
> > -		ret =3D drm_sched_init(&v3d-
> > >queue[V3D_CACHE_CLEAN].sched,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cache_clean_sched_ops,
> > NULL,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > job_hang_limit,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0
> > msecs_to_jiffies(hang_limit_ms), NULL,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cache_clean", v3d-
> > >drm.dev);
> > +		ret =3D v3d_queue_sched_init(v3d,
> > &v3d_cache_clean_sched_ops,
> > +					=C2=A0=C2=A0 V3D_CACHE_CLEAN,
> > "v3d_cache_clean");
> > =C2=A0=C2=A0		if (ret)
> > =C2=A0=C2=A0			goto fail;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	ret =3D drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cpu_sched_ops, NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 1, job_hang_limit,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cpu", v3d->drm.dev);
> > +	ret =3D v3d_queue_sched_init(v3d, &v3d_cpu_sched_ops,
> > V3D_CPU, "v3d_cpu");
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto fail;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > b/drivers/gpu/drm/xe/xe_execlist.c
> > index a8c416a48812..db1c52dcf1a6 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -332,6 +332,15 @@ static const struct drm_sched_backend_ops
> > drm_sched_ops =3D {
> > =C2=A0 static int execlist_exec_queue_init(struct xe_exec_queue *q)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct drm_gpu_scheduler *sched;
> > +	const struct drm_sched_init_args args =3D {
> > +		.ops =3D &drm_sched_ops,
> > +		.num_rqs =3D 1,
> > +		.credit_limit =3D q->lrc[0]->ring.size /
> > MAX_JOB_SIZE_BYTES,
> > +		.hang_limit =3D XE_SCHED_HANG_LIMIT,
> > +		.timeout =3D XE_SCHED_JOB_TIMEOUT,
> > +		.name =3D q->hwe->name,
> > +		.dev =3D gt_to_xe(q->gt)->drm.dev
> > +	};
> > =C2=A0=C2=A0	struct xe_execlist_exec_queue *exl;
> > =C2=A0=C2=A0	struct xe_device *xe =3D gt_to_xe(q->gt);
> > =C2=A0=C2=A0	int err;
> > @@ -346,11 +355,8 @@ static int execlist_exec_queue_init(struct
> > xe_exec_queue *q)
> > =C2=A0=20
> > =C2=A0=C2=A0	exl->q =3D q;
> > =C2=A0=20
> > -	err =3D drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 q->lrc[0]->ring.size /
> > MAX_JOB_SIZE_BYTES,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 XE_SCHED_HANG_LIMIT,
> > XE_SCHED_JOB_TIMEOUT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, q->hwe->name,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 gt_to_xe(q->gt)->drm.dev);
> > +
>=20
> Please don't use multiple blank lines.
>=20
> > +	err =3D drm_sched_init(&exl->sched, &args);
> > =C2=A0=C2=A0	if (err)
> > =C2=A0=C2=A0		goto err_free;
> > =C2=A0=20
>=20
> [...]
>=20
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index a0ff08123f07..f0f5435598a8 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -540,12 +540,39 @@ struct drm_gpu_scheduler {
> > =C2=A0=C2=A0	struct device			*dev;
> > =C2=A0 };
> > =C2=A0=20
> > +/**
> > + * struct drm_sched_init_args - parameters for initializing a DRM
> > GPU scheduler
> > + *
> > + * @ops: backend operations provided by the driver
> > + * @submit_wq: workqueue to use for submission. May be NULL.
> > + *	If NULL, an ordered wq is allocated and used.
>=20
> Could you align this line to the first word from the previous line?
> You
> have examples of correct alignment in this file, such as `struct
> drm_gpu_scheduler`. Also, you can check examples in [1].
>=20
> [1] https://docs.kernel.org/doc-guide/kernel-doc.html
>=20
> > + * @num_rqs: Number of run-queues. This may be at most
> > DRM_SCHED_PRIORITY_COUNT,
> > + *	as there's usually one run-queue per priority, but may be
> > less.
> > + * @credit_limit: the number of credits this scheduler can hold
> > from all jobs
> > + * @hang_limit: number of times to allow a job to hang before
> > dropping it.
> > + *	This mechanism is DEPRECATED. Set it to 0.
> > + * @timeout: timeout value in jiffies for the scheduler
> > + * @timeout_wq: workqueue to use for timeout work. May be NULL.
> > + *	If NULL, the system_wq is used.
> > + * @score: score atomic shared with other schedulers. May be NULL.
> > + * @name: name used for debugging
> > + * @dev: associated device. Used for debugging
>=20
> How do you feel about using the same description of `struct
> drm_gpu_scheduler` for @name and @dev?
>=20
> > + */
> > +struct drm_sched_init_args {
> > +	const struct drm_sched_backend_ops *ops;
> > +	struct workqueue_struct *submit_wq;
> > +	struct workqueue_struct *timeout_wq;
> > +	u32 num_rqs;
> > +	u32 credit_limit;
> > +	unsigned int hang_limit;
> > +	long timeout;
> > +	atomic_t *score;
> > +	const char *name;
> > +	struct device *dev;
> > +};
> > +
> > =C2=A0 int drm_sched_init(struct drm_gpu_scheduler *sched,
> > -		=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > -		=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > -		=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> > hang_limit,
> > -		=C2=A0=C2=A0 long timeout, struct workqueue_struct
> > *timeout_wq,
> > -		=C2=A0=C2=A0 atomic_t *score, const char *name, struct
> > device *dev);
> > +		const struct drm_sched_init_args *args);
>=20
> Could you keep it aligned to the "("?
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> > =C2=A0=20
> > =C2=A0 void drm_sched_fini(struct drm_gpu_scheduler *sched);
> > =C2=A0 int drm_sched_job_init(struct drm_sched_job *job,
>=20

