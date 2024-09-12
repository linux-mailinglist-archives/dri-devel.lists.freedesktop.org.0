Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC95976D20
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 17:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA3610EBC7;
	Thu, 12 Sep 2024 15:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="il+MZ1Ic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30ED10EBCC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726153818;
 bh=WFCEiEx9rmYI/Ru6Mrp556KRJvQVjj0d6TdUq840A8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=il+MZ1Ichdkk1lXP84H6CXUjkKStMKlYDj3LC4/xJuS5bLLoAX/b8cKs38m6OwXfp
 VHHKZMQ8QW/N6w25oO3aFTWniul78CD59UP5dHsi1Dq9tUd+NgP8Uk99XxkdjFqSqZ
 Y++6uPtQzhyNk73wL2s35cu/smAZLxT4AbqnFPuvYqIi6o1cTXgAsm/kHyiA2eWnr7
 KP7lApiafLe/qOyCZrwTa0pOxY2rXUV71R0DdfZbL53w26x340vKMzYH9Qqe1t8NQR
 RqlTRquqw3IVRF0qmOXEwPxBpENAVRM8+7z8Vft212wpD7g1liuJ905D0YWPjkx0Ve
 z9S9bkHqJclgw==
Received: from localhost (unknown [37.167.110.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 60AE717E35CC;
 Thu, 12 Sep 2024 17:10:16 +0200 (CEST)
Date: Thu, 12 Sep 2024 17:10:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 1/4] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <20240912171010.5d6fd24b@collabora.com>
In-Reply-To: <unnhhn4dzqs56wsme7lyrlwf373xd6gqydfwvkqmv7gkzz6dfy@pbmsoynwp5rx>
References: <20240903202541.430225-1-adrian.larumbe@collabora.com>
 <20240903202541.430225-2-adrian.larumbe@collabora.com>
 <20240904094915.1d92661d@collabora.com>
 <unnhhn4dzqs56wsme7lyrlwf373xd6gqydfwvkqmv7gkzz6dfy@pbmsoynwp5rx>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Thu, 12 Sep 2024 16:03:37 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Hi Boris, thanks for the remarks,
>=20
> On 04.09.2024 09:49, Boris Brezillon wrote:
> > On Tue,  3 Sep 2024 21:25:35 +0100
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> >  =20
> > > Enable calculations of job submission times in clock cycles and wall
> > > time. This is done by expanding the boilerplate command stream when r=
unning
> > > a job to include instructions that compute said times right before an=
 after
> > > a user CS.
> > >=20
> > > A separate kernel BO is created per queue to store those values. Jobs=
 can
> > > access their sampled data through a slots buffer-specific index diffe=
rent
> > > from that of the queue's ringbuffer. The reason for this is saving me=
mory
> > > on the profiling information kernel BO, since the amount of simultane=
ous
> > > profiled jobs we can write into the queue's ringbuffer might be much
> > > smaller than for regular jobs, as the former take more CSF instructio=
ns.
> > >=20
> > > This commit is done in preparation for enabling DRM fdinfo support in=
 the
> > > Panthor driver, which depends on the numbers calculated herein.
> > >=20
> > > A profile mode mask has been added that will in a future commit allow=
 UM to
> > > toggle performance metric sampling behaviour, which is disabled by de=
fault
> > > to save power. When a ringbuffer CS is constructed, timestamp and cyc=
ling
> > > sampling instructions are added depending on the enabled flags in the
> > > profiling mask.
> > >=20
> > > A helper was provided that calculates the number of instructions for a
> > > given set of enablement mask, and these are passed as the number of c=
redits
> > > when initialising a DRM scheduler job.
> > >=20
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_device.h |  22 ++
> > >  drivers/gpu/drm/panthor/panthor_sched.c  | 327 ++++++++++++++++++++-=
--
> > >  2 files changed, 305 insertions(+), 44 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/d=
rm/panthor/panthor_device.h
> > > index e388c0472ba7..a48e30d0af30 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > > @@ -66,6 +66,25 @@ struct panthor_irq {
> > >  	atomic_t suspended;
> > >  };
> > > =20
> > > +/**
> > > + * enum panthor_device_profiling_mode - Profiling state
> > > + */
> > > +enum panthor_device_profiling_flags {
> > > +	/** @PANTHOR_DEVICE_PROFILING_DISABLED: Profiling is disabled. */
> > > +	PANTHOR_DEVICE_PROFILING_DISABLED =3D 0,
> > > +
> > > +	/** @PANTHOR_DEVICE_PROFILING_CYCLES: Sampling job cycles. */
> > > +	PANTHOR_DEVICE_PROFILING_CYCLES =3D BIT(0),
> > > +
> > > +	/** @PANTHOR_DEVICE_PROFILING_TIMESTAMP: Sampling job timestamp. */
> > > +	PANTHOR_DEVICE_PROFILING_TIMESTAMP =3D BIT(1),
> > > +
> > > +	/** @PANTHOR_DEVICE_PROFILING_ALL: Sampling everything. */
> > > +	PANTHOR_DEVICE_PROFILING_ALL =3D
> > > +	PANTHOR_DEVICE_PROFILING_CYCLES |
> > > +	PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > > +};
> > > +
> > >  /**
> > >   * struct panthor_device - Panthor device
> > >   */
> > > @@ -162,6 +181,9 @@ struct panthor_device {
> > >  		 */
> > >  		struct page *dummy_latest_flush;
> > >  	} pm;
> > > +
> > > +	/** @profile_mask: User-set profiling flags for job accounting. */
> > > +	u32 profile_mask;
> > >  };
> > > =20
> > >  /**
> > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/dr=
m/panthor/panthor_sched.c
> > > index c426a392b081..b087648bf59a 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > @@ -93,6 +93,9 @@
> > >  #define MIN_CSGS				3
> > >  #define MAX_CSG_PRIO				0xf
> > > =20
> > > +#define NUM_INSTRS_PER_CACHE_LINE		(64 / sizeof(u64))
> > > +#define MAX_INSTRS_PER_JOB			32
> > > +
> > >  struct panthor_group;
> > > =20
> > >  /**
> > > @@ -476,6 +479,18 @@ struct panthor_queue {
> > >  		 */
> > >  		struct list_head in_flight_jobs;
> > >  	} fence_ctx;
> > > +
> > > +	/** @profiling_info: Job profiling data slots and access informatio=
n. */
> > > +	struct {
> > > +		/** @slots: Kernel BO holding the slots. */
> > > +		struct panthor_kernel_bo *slots;
> > > +
> > > +		/** @slot_count: Number of jobs ringbuffer can hold at once. */
> > > +		u32 slot_count;
> > > +
> > > +		/** @profiling_seqno: Index of the next available profiling inform=
ation slot. */
> > > +		u32 profiling_seqno; =20
> >=20
> > Nit: no need to repeat profiling as it's under the profiling_info
> > struct. I would simply name that one 'seqno'.
> >  =20
> > > +	} profiling_info; =20
> >=20
> > s/profiling_info/profiling/ ?
> >  =20
> > >  };
> > > =20
> > >  /**
> > > @@ -661,6 +676,18 @@ struct panthor_group {
> > >  	struct list_head wait_node;
> > >  };
> > > =20
> > > +struct panthor_job_profiling_data {
> > > +	struct {
> > > +		u64 before;
> > > +		u64 after;
> > > +	} cycles;
> > > +
> > > +	struct {
> > > +		u64 before;
> > > +		u64 after;
> > > +	} time;
> > > +};
> > > +
> > >  /**
> > >   * group_queue_work() - Queue a group work
> > >   * @group: Group to queue the work for.
> > > @@ -774,6 +801,12 @@ struct panthor_job {
> > > =20
> > >  	/** @done_fence: Fence signaled when the job is finished or cancell=
ed. */
> > >  	struct dma_fence *done_fence;
> > > +
> > > +	/** @profile_mask: Current device job profiling enablement bitmask.=
 */
> > > +	u32 profile_mask;
> > > +
> > > +	/** @profile_slot: Job profiling information index in the profiling=
 slots BO. */
> > > +	u32 profiling_slot; =20
> >=20
> > Nit: we tend to group fields together under sub-structs, so I'd say:
> >=20
> > 	struct {
> > 		u32 mask; // or flags
> > 		u32 slot;
> > 	} profiling;
> >  =20
> > >  };
> > > =20
> > >  static void
> > > @@ -838,6 +871,7 @@ static void group_free_queue(struct panthor_group=
 *group, struct panthor_queue *
> > > =20
> > >  	panthor_kernel_bo_destroy(queue->ringbuf);
> > >  	panthor_kernel_bo_destroy(queue->iface.mem);
> > > +	panthor_kernel_bo_destroy(queue->profiling_info.slots);
> > > =20
> > >  	/* Release the last_fence we were holding, if any. */
> > >  	dma_fence_put(queue->fence_ctx.last_fence);
> > > @@ -1982,8 +2016,6 @@ tick_ctx_init(struct panthor_scheduler *sched,
> > >  	}
> > >  }
> > > =20
> > > -#define NUM_INSTRS_PER_SLOT		16
> > > -
> > >  static void
> > >  group_term_post_processing(struct panthor_group *group)
> > >  {
> > > @@ -2815,65 +2847,211 @@ static void group_sync_upd_work(struct work_=
struct *work)
> > >  	group_put(group);
> > >  }
> > > =20
> > > -static struct dma_fence *
> > > -queue_run_job(struct drm_sched_job *sched_job)
> > > +struct panthor_job_ringbuf_instrs {
> > > +	u64 buffer[MAX_INSTRS_PER_JOB];
> > > +	u32 count;
> > > +};
> > > +
> > > +struct panthor_job_instr {
> > > +	u32 profile_mask;
> > > +	u64 instr;
> > > +};
> > > +
> > > +#define JOB_INSTR(__prof, __instr) \
> > > +	{ \
> > > +		.profile_mask =3D __prof, \
> > > +		.instr =3D __instr, \
> > > +	}
> > > +
> > > +static void
> > > +copy_instrs_to_ringbuf(struct panthor_queue *queue,
> > > +		       struct panthor_job *job,
> > > +		       struct panthor_job_ringbuf_instrs *instrs)
> > > +{
> > > +	ssize_t ringbuf_size =3D panthor_kernel_bo_size(queue->ringbuf);
> > > +	u32 start =3D job->ringbuf.start & (ringbuf_size - 1);
> > > +	ssize_t size, written;
> > > +
> > > +	/*
> > > +	 * We need to write a whole slot, including any trailing zeroes
> > > +	 * that may come at the end of it. Also, because instrs.buffer had
> > > +	 * been zero-initialised, there's no need to pad it with 0's
> > > +	 */
> > > +	instrs->count =3D ALIGN(instrs->count, NUM_INSTRS_PER_CACHE_LINE);
> > > +	size =3D instrs->count * sizeof(u64);
> > > +	written =3D min(ringbuf_size - start, size);
> > > +
> > > +	memcpy(queue->ringbuf->kmap + start, instrs->buffer, written);
> > > +
> > > +	if (written < size)
> > > +		memcpy(queue->ringbuf->kmap,
> > > +		       &instrs->buffer[(ringbuf_size - start)/sizeof(u64)],
> > > +		       size - written);
> > > +}
> > > +
> > > +struct panthor_job_cs_params {
> > > +	u32 profile_mask;
> > > +	u64 addr_reg; u64 val_reg;
> > > +	u64 cycle_reg; u64 time_reg;
> > > +	u64 sync_addr; u64 times_addr;
> > > +	u64 cs_start; u64 cs_size;
> > > +	u32 last_flush; u32 waitall_mask;
> > > +};
> > > +
> > > +static void
> > > +get_job_cs_params(struct panthor_job *job, struct panthor_job_cs_par=
ams *params)
> > >  {
> > > -	struct panthor_job *job =3D container_of(sched_job, struct panthor_=
job, base);
> > >  	struct panthor_group *group =3D job->group;
> > >  	struct panthor_queue *queue =3D group->queues[job->queue_idx];
> > >  	struct panthor_device *ptdev =3D group->ptdev;
> > >  	struct panthor_scheduler *sched =3D ptdev->scheduler;
> > > -	u32 ringbuf_size =3D panthor_kernel_bo_size(queue->ringbuf);
> > > -	u32 ringbuf_insert =3D queue->iface.input->insert & (ringbuf_size -=
 1);
> > > -	u64 addr_reg =3D ptdev->csif_info.cs_reg_count -
> > > -		       ptdev->csif_info.unpreserved_cs_reg_count;
> > > -	u64 val_reg =3D addr_reg + 2;
> > > -	u64 sync_addr =3D panthor_kernel_bo_gpuva(group->syncobjs) +
> > > -			job->queue_idx * sizeof(struct panthor_syncobj_64b);
> > > -	u32 waitall_mask =3D GENMASK(sched->sb_slot_count - 1, 0);
> > > -	struct dma_fence *done_fence;
> > > -	int ret;
> > > =20
> > > -	u64 call_instrs[NUM_INSTRS_PER_SLOT] =3D {
> > > +	params->addr_reg =3D ptdev->csif_info.cs_reg_count -
> > > +			   ptdev->csif_info.unpreserved_cs_reg_count;
> > > +	params->val_reg =3D params->addr_reg + 2;
> > > +	params->cycle_reg =3D params->addr_reg;
> > > +	params->time_reg =3D params->val_reg;
> > > +
> > > +	params->sync_addr =3D panthor_kernel_bo_gpuva(group->syncobjs) +
> > > +			    job->queue_idx * sizeof(struct panthor_syncobj_64b);
> > > +	params->times_addr =3D panthor_kernel_bo_gpuva(queue->profiling_inf=
o.slots) +
> > > +			     (job->profiling_slot * sizeof(struct panthor_job_profiling_d=
ata));
> > > +	params->waitall_mask =3D GENMASK(sched->sb_slot_count - 1, 0);
> > > +
> > > +	params->cs_start =3D job->call_info.start;
> > > +	params->cs_size =3D job->call_info.size;
> > > +	params->last_flush =3D job->call_info.latest_flush;
> > > +
> > > +	params->profile_mask =3D job->profile_mask;
> > > +}
> > > +
> > > +static void
> > > +prepare_job_instrs(const struct panthor_job_cs_params *params,
> > > +		   struct panthor_job_ringbuf_instrs *instrs)
> > > +{
> > > +	const struct panthor_job_instr instr_seq[] =3D {
> > >  		/* MOV32 rX+2, cs.latest_flush */
> > > -		(2ull << 56) | (val_reg << 48) | job->call_info.latest_flush,
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > > +			  (2ull << 56) | (params->val_reg << 48) | params->last_flush),
> > > =20
> > >  		/* FLUSH_CACHE2.clean_inv_all.no_wait.signal(0) rX+2 */
> > > -		(36ull << 56) | (0ull << 48) | (val_reg << 40) | (0 << 16) | 0x233,
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > > +			  (36ull << 56) | (0ull << 48) | (params->val_reg << 40) | (0 << =
16) | 0x233),
> > > +
> > > +		/* MOV48 rX:rX+1, cycles_offset */
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> > > +			  (1ull << 56) | (params->cycle_reg << 48) |
> > > +			  (params->times_addr +
> > > +			   offsetof(struct panthor_job_profiling_data, cycles.before))),
> > > +		/* STORE_STATE cycles */
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> > > +			  (40ull << 56) | (params->cycle_reg << 40) | (1ll << 32)),
> > > +		/* MOV48 rX:rX+1, time_offset */
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > > +			  (1ull << 56) | (params->time_reg << 48) |
> > > +			  (params->times_addr +
> > > +			   offsetof(struct panthor_job_profiling_data, time.before))),
> > > +		/* STORE_STATE timer */
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > > +			  (40ull << 56) | (params->time_reg << 40) | (0ll << 32)),
> > > =20
> > >  		/* MOV48 rX:rX+1, cs.start */
> > > -		(1ull << 56) | (addr_reg << 48) | job->call_info.start,
> > > -
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > > +			  (1ull << 56) | (params->addr_reg << 48) | params->cs_start),
> > >  		/* MOV32 rX+2, cs.size */
> > > -		(2ull << 56) | (val_reg << 48) | job->call_info.size,
> > > -
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > > +			  (2ull << 56) | (params->val_reg << 48) | params->cs_size),
> > >  		/* WAIT(0) =3D> waits for FLUSH_CACHE2 instruction */
> > > -		(3ull << 56) | (1 << 16),
> > > -
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED, (3ull << 56) | (1 << =
16)),
> > >  		/* CALL rX:rX+1, rX+2 */
> > > -		(32ull << 56) | (addr_reg << 40) | (val_reg << 32),
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > > +			  (32ull << 56) | (params->addr_reg << 40) | (params->val_reg << =
32)),
> > > +
> > > +		/* MOV48 rX:rX+1, cycles_offset */
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> > > +			  (1ull << 56) | (params->cycle_reg << 48) |
> > > +			  (params->times_addr +
> > > +			   offsetof(struct panthor_job_profiling_data, cycles.after))),
> > > +		/* STORE_STATE cycles */
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> > > +			  (40ull << 56) | (params->cycle_reg << 40) | (1ll << 32)),
> > > +
> > > +		/* MOV48 rX:rX+1, time_offset */
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > > +			  (1ull << 56) | (params->time_reg << 48) |
> > > +			  (params->times_addr +
> > > +			   offsetof(struct panthor_job_profiling_data, time.after))),
> > > +		/* STORE_STATE timer */
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > > +			  (40ull << 56) | (params->time_reg << 40) | (0ll << 32)),
> > > =20
> > >  		/* MOV48 rX:rX+1, sync_addr */
> > > -		(1ull << 56) | (addr_reg << 48) | sync_addr,
> > > -
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > > +			  (1ull << 56) | (params->addr_reg << 48) | params->sync_addr),
> > >  		/* MOV48 rX+2, #1 */
> > > -		(1ull << 56) | (val_reg << 48) | 1,
> > > -
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > > +			  (1ull << 56) | (params->val_reg << 48) | 1),
> > >  		/* WAIT(all) */
> > > -		(3ull << 56) | (waitall_mask << 16),
> > > -
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > > +			  (3ull << 56) | (params->waitall_mask << 16)),
> > >  		/* SYNC_ADD64.system_scope.propage_err.nowait rX:rX+1, rX+2*/
> > > -		(51ull << 56) | (0ull << 48) | (addr_reg << 40) | (val_reg << 32) =
| (0 << 16) | 1,
> > > -
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > > +			  (51ull << 56) | (0ull << 48) | (params->addr_reg << 40) |
> > > +			  (params->val_reg << 32) | (0 << 16) | 1),
> > >  		/* ERROR_BARRIER, so we can recover from faults at job
> > >  		 * boundaries.
> > >  		 */
> > > -		(47ull << 56),
> > > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED, (47ull << 56)),
> > > +	};
> > > +	u32 pad;
> > > +
> > > +	/* NEED to be cacheline aligned to please the prefetcher. */
> > > +	static_assert(sizeof(instrs->buffer) % 64 =3D=3D 0,
> > > +		      "panthor_job_ringbuf_instrs::buffer is not aligned on a cach=
eline");
> > > +
> > > +	/* Make sure we have enough storage to store the whole sequence. */
> > > +	static_assert(ALIGN(ARRAY_SIZE(instr_seq), NUM_INSTRS_PER_CACHE_LIN=
E) <=3D
> > > +		      ARRAY_SIZE(instrs->buffer),
> > > +		      "instr_seq vs panthor_job_ringbuf_instrs::buffer size mismat=
ch"); =20
> >=20
> > We probably want to catch situations where instrs->buffer has gone
> > bigger than needed (say we found a way to drop instructions), so I
> > would turn the '<=3D' condition into an '=3D=3D'. =20
>=20
> I did this but it's triggering the static assert, because the instr_seq a=
rray has 19 elements,
> which when aligned to NUM_INSTRS_PER_CACHE_LINE (8 I think) renders 24, s=
till less than the
> 32 slots in instrs->buffer. Having a slightly oversized instrs.buffer arr=
ay isn't a problem
> though because instrs.count is being used when copying them into the ring=
buffer, so I think
> leaving this assert as an <=3D should be alright.=20

The whole point is to have a buffer that's the right size, rather than
bigger than needed. So I'd suggest changing the MAX_INSTRS definition
to make it 24 instead.
