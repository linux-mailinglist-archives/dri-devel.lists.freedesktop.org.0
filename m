Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5687F956AAA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 14:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC2610E255;
	Mon, 19 Aug 2024 12:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=boris.brezillon@collabora.com header.b="J+Y6G6bW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7A910E255
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 12:22:41 +0000 (UTC)
Delivered-To: adrian.larumbe@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724070149; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lbrCuRDi2b8TTE0uILQKAQr2JaQM+zbpeaz+gGY7SLbw+2uLn2ZODXD7Q247cGNsFmQT8UxksSy7F0yrp1r9nOQApZ3OTjsazrlYJbQwkE3g+InWgbUjNrNTI2WSx0CDWL3kOEFpOWdk1gJ4sNRUdcXZbzYjMB1M9YPT3Uy4it0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724070149;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=v58YvdbH5F26ghoiybS4a6zu1SOtPE3yXwioSFKF11E=; 
 b=AQQq2+at5vHKqn0O9VV84+74WbsVdp0acQptkseuLzNcoogR96V5AU26T7gH4O1kdMh8QuuUC1FwLPTKcSTVSDwmElcHi4nQ4VIaTyLlAdlWN8LVpjhqByxR64ekxbhDrqgOv3JlAhUzrqB1CwndYvQaQkOyUOshgBICKUdbNHY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=boris.brezillon@collabora.com;
 dmarc=pass header.from=<boris.brezillon@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724070149; 
 s=zohomail; d=collabora.com; i=boris.brezillon@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=v58YvdbH5F26ghoiybS4a6zu1SOtPE3yXwioSFKF11E=;
 b=J+Y6G6bW7jpWVSx/T1O72m/RJ76hfaMWovSqGz36BHl99yf59Zw8QRY1QMqqZy1m
 RPjcvq9+7zee2yDWFzHIyCyE5VfWquckXMMj1Pz1cwwjCZWndTE+iY+o9v4lGRem52o
 6pJmLhJOwHU5PbAAclMuYxx0B4sdMgwxx+cz6tVA=
Received: by mx.zohomail.com with SMTPS id 1724070149070910.5299131862226;
 Mon, 19 Aug 2024 05:22:29 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:22:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <20240819142220.10ed0c10@collabora.com>
In-Reply-To: <20240716201302.2939894-2-adrian.larumbe@collabora.com>
References: <20240716201302.2939894-1-adrian.larumbe@collabora.com>
 <20240716201302.2939894-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
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

Hi Adrian,

Sorry for chiming so late, but I think I have a few concerns with this
patch. Nothing major, but I'd prefer to have it addressed now rather
than in a follow-up series.

On Tue, 16 Jul 2024 21:11:40 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Enable calculations of job submission times in clock cycles and wall
> time. This is done by expanding the boilerplate command stream when runni=
ng
> a job to include instructions that compute said times right before an aft=
er
> a user CS.
>=20
> Those numbers are stored in the queue's group's sync objects BO, right
> after them. Because the queues in a group might have a different number of
> slots, one must keep track of the overall slot tally when reckoning the
> offset of a queue's time sample structs, one for each slot.
>=20
> This commit is done in preparation for enabling DRM fdinfo support in the
> Panthor driver, which depends on the numbers calculated herein.
>=20
> A profile mode device flag has been added that will in a future commit
> allow UM to toggle time sampling behaviour, which is disabled by default =
to
> save power. It also enables marking jobs as being profiled and picks one =
of
> two call instruction arrays to insert into the ring buffer. One of them
> includes FW logic to sample the timestamp and cycle counter registers and
> write them into the job's syncobj, and the other does not.
>=20
> A profiled job's call sequence takes up two ring buffer slots, and this is
> reflected when initialising the DRM scheduler for each queue, with a
> profiled job contributing twice as many credits.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h |   2 +
>  drivers/gpu/drm/panthor/panthor_sched.c  | 244 ++++++++++++++++++++---
>  2 files changed, 216 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index e388c0472ba7..3ede2f80df73 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -162,6 +162,8 @@ struct panthor_device {
>  		 */
>  		struct page *dummy_latest_flush;
>  	} pm;
> +
> +	bool profile_mode;

Should we make it a u32 bitmask, with a panthor_device_profiling_mode
enum defining all the flags, so we can easily add extra profiling flags
in the future?

>  };
> =20
>  /**
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 79ffcbc41d78..6438e5ea1f2b 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -93,6 +93,9 @@
>  #define MIN_CSGS				3
>  #define MAX_CSG_PRIO				0xf
> =20
> +#define NUM_INSTRS_PER_SLOT			16
> +#define SLOTSIZE				(NUM_INSTRS_PER_SLOT * sizeof(u64))
> +
>  struct panthor_group;
> =20
>  /**
> @@ -466,6 +469,9 @@ struct panthor_queue {
>  		 */
>  		struct list_head in_flight_jobs;
>  	} fence_ctx;
> +
> +	/** @time_offset: Offset of panthor_job_times structs in group's syncob=
j bo. */
> +	unsigned long time_offset;

As mentioned in my other reply, it's probably simpler if you have a
profiling BO per queue, or, at the very least, if you have something
like that so you don't have to re-add the per-queue offset every time:

	struct {
		struct panthor_job_times *cpu;
		uint64_t gpu;
	} job_profiling_slots;

>  };
> =20
>  /**
> @@ -592,7 +598,17 @@ struct panthor_group {
>  	 * One sync object per queue. The position of the sync object is
>  	 * determined by the queue index.
>  	 */
> -	struct panthor_kernel_bo *syncobjs;
> +
> +	struct {
> +		/** @bo: Kernel BO holding the sync objects. */
> +		struct panthor_kernel_bo *bo;
> +
> +		/**
> +		 * @job_times_offset: Beginning of panthor_job_times struct samples af=
ter
> +		 * the group's array of sync objects.
> +		 */
> +		size_t job_times_offset;
> +	} syncobjs;

You're about to add new stuff to the BO, so I don't think syncobjs is a
relevant name anymore.

> =20
>  	/** @state: Group state. */
>  	enum panthor_group_state state;
> @@ -651,6 +667,18 @@ struct panthor_group {
>  	struct list_head wait_node;
>  };
> =20
> +struct panthor_job_times {
> +	struct {
> +		u64 before;
> +		u64 after;
> +	} cycles;
> +
> +	struct {
> +		u64 before;
> +		u64 after;
> +	} time;
> +};
> +
>  /**
>   * group_queue_work() - Queue a group work
>   * @group: Group to queue the work for.
> @@ -730,6 +758,9 @@ struct panthor_job {
>  	/** @queue_idx: Index of the queue inside @group. */
>  	u32 queue_idx;
> =20
> +	/** @ringbuf_idx: Index of the ringbuffer inside @queue. */
> +	u32 ringbuf_idx;

The name is a bit confusing, how about job_slot_idx? BTW, if the job
slot size is fixed (as seems to be implied by the SLOTSIZE definition)
and the number of instructions per job is a power of two, the slot index
can be extracted from panthor_job::call_info::start with something like:

static u32 get_job_slot_id(struct panthor_job *job)
{
	struct panthor_queue *queue =3D
		job->group->queues[job->queue_idx];
	u32 ringbuf_size =3D panthor_kernel_bo_size(queue->ringbuf);
	u32 first_instr =3D
		panthor_job::call_info::start & (ringbuf_size - 1);

	return first_instr / NUM_INSTRS_PER_SLOT;
}

> +
>  	/** @call_info: Information about the userspace command stream call. */
>  	struct {
>  		/** @start: GPU address of the userspace command stream. */
> @@ -764,6 +795,9 @@ struct panthor_job {
> =20
>  	/** @done_fence: Fence signaled when the job is finished or cancelled. =
*/
>  	struct dma_fence *done_fence;
> +
> +	/** @is_profiled: Whether timestamp and cycle numbers were gathered for=
 this job */
> +	bool is_profiled;

As mentioned above, I'm tempted to make it a bitmask so we can enable
more profiling modes in the future. If we do that, maybe we should make
cycle count and timestamp two different flags, even if we're likely to
enable both.

>  };
> =20
>  static void
> @@ -844,7 +878,7 @@ static void group_release_work(struct work_struct *wo=
rk)
> =20
>  	panthor_kernel_bo_destroy(group->suspend_buf);
>  	panthor_kernel_bo_destroy(group->protm_suspend_buf);
> -	panthor_kernel_bo_destroy(group->syncobjs);
> +	panthor_kernel_bo_destroy(group->syncobjs.bo);
> =20
>  	panthor_vm_put(group->vm);
>  	kfree(group);
> @@ -1969,8 +2003,6 @@ tick_ctx_init(struct panthor_scheduler *sched,
>  	}
>  }
> =20
> -#define NUM_INSTRS_PER_SLOT		16
> -
>  static void
>  group_term_post_processing(struct panthor_group *group)
>  {
> @@ -2007,7 +2039,7 @@ group_term_post_processing(struct panthor_group *gr=
oup)
>  		spin_unlock(&queue->fence_ctx.lock);
> =20
>  		/* Manually update the syncobj seqno to unblock waiters. */
> -		syncobj =3D group->syncobjs->kmap + (i * sizeof(*syncobj));
> +		syncobj =3D group->syncobjs.bo->kmap + (i * sizeof(*syncobj));
>  		syncobj->status =3D ~0;
>  		syncobj->seqno =3D atomic64_read(&queue->fence_ctx.seqno);
>  		sched_queue_work(group->ptdev->scheduler, sync_upd);
> @@ -2780,7 +2812,7 @@ static void group_sync_upd_work(struct work_struct =
*work)
>  		if (!queue)
>  			continue;
> =20
> -		syncobj =3D group->syncobjs->kmap + (queue_idx * sizeof(*syncobj));
> +		syncobj =3D group->syncobjs.bo->kmap + (queue_idx * sizeof(*syncobj));
> =20
>  		spin_lock(&queue->fence_ctx.lock);
>  		list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_job=
s, node) {
> @@ -2815,22 +2847,81 @@ queue_run_job(struct drm_sched_job *sched_job)
>  	struct panthor_scheduler *sched =3D ptdev->scheduler;
>  	u32 ringbuf_size =3D panthor_kernel_bo_size(queue->ringbuf);
>  	u32 ringbuf_insert =3D queue->iface.input->insert & (ringbuf_size - 1);
> +	u32 ringbuf_index =3D ringbuf_insert / (SLOTSIZE);
> +	bool ringbuf_wraparound =3D
> +		job->is_profiled && ((ringbuf_size/SLOTSIZE) =3D=3D ringbuf_index + 1);
>  	u64 addr_reg =3D ptdev->csif_info.cs_reg_count -
>  		       ptdev->csif_info.unpreserved_cs_reg_count;
>  	u64 val_reg =3D addr_reg + 2;
> -	u64 sync_addr =3D panthor_kernel_bo_gpuva(group->syncobjs) +
> -			job->queue_idx * sizeof(struct panthor_syncobj_64b);
> +	u64 cycle_reg =3D addr_reg;
> +	u64 time_reg =3D val_reg;
> +	u64 sync_addr =3D panthor_kernel_bo_gpuva(group->syncobjs.bo) +
> +		job->queue_idx * sizeof(struct panthor_syncobj_64b);
> +	u64 times_addr =3D panthor_kernel_bo_gpuva(group->syncobjs.bo) + queue-=
>time_offset +
> +		(ringbuf_index * sizeof(struct panthor_job_times));
> +	size_t call_insrt_size;
> +	u64 *call_instrs;
> +
>  	u32 waitall_mask =3D GENMASK(sched->sb_slot_count - 1, 0);
>  	struct dma_fence *done_fence;
>  	int ret;
> =20
> -	u64 call_instrs[NUM_INSTRS_PER_SLOT] =3D {
> +	u64 call_instrs_simple[NUM_INSTRS_PER_SLOT] =3D {
> +		/* MOV32 rX+2, cs.latest_flush */
> +		(2ull << 56) | (val_reg << 48) | job->call_info.latest_flush,
> +
> +		/* FLUSH_CACHE2.clean_inv_all.no_wait.signal(0) rX+2 */
> +		(36ull << 56) | (0ull << 48) | (val_reg << 40) | (0 << 16) | 0x233,
> +
> +		/* MOV48 rX:rX+1, cs.start */
> +		(1ull << 56) | (addr_reg << 48) | job->call_info.start,
> +
> +		/* MOV32 rX+2, cs.size */
> +		(2ull << 56) | (val_reg << 48) | job->call_info.size,
> +
> +		/* WAIT(0) =3D> waits for FLUSH_CACHE2 instruction */
> +		(3ull << 56) | (1 << 16),
> +
> +		/* CALL rX:rX+1, rX+2 */
> +		(32ull << 56) | (addr_reg << 40) | (val_reg << 32),
> +
> +		/* MOV48 rX:rX+1, sync_addr */
> +		(1ull << 56) | (addr_reg << 48) | sync_addr,
> +
> +		/* MOV48 rX+2, #1 */
> +		(1ull << 56) | (val_reg << 48) | 1,
> +
> +		/* WAIT(all) */
> +		(3ull << 56) | (waitall_mask << 16),
> +
> +		/* SYNC_ADD64.system_scope.propage_err.nowait rX:rX+1, rX+2*/
> +		(51ull << 56) | (0ull << 48) | (addr_reg << 40) | (val_reg << 32) | (0=
 << 16) | 1,
> +
> +		/* ERROR_BARRIER, so we can recover from faults at job
> +		 * boundaries.
> +		 */
> +		(47ull << 56),
> +	};
> +
> +	u64 call_instrs_profile[NUM_INSTRS_PER_SLOT*2] =3D {

Looks like I was wrong, NUM_INSTRS_PER_SLOT is not necessarily the
number of instruction per job, it's just the granularity of your
ring buffer.

This being said, I'm not a huge fan of how the specialization is done
here, as we're basically duplicating call_instrs_simple, and making it
error prone for any future fixes we might do on call_instrs_simple (it's
very easy to omit porting the fix to call_instrs_profile).

How about we define:

#define MAX_INSTRS_PER_JOB 32

struct panthor_job_ringbuf_instrs {
	u64 buffer[MAX_INSTRS_PER_JOB];
	u32 count;
};

static void
push_instr(struct panthor_job_ringbuf_instrs *instrs, u64 instr)
{
	if (WARN_ON(instrs->count >=3D ARRAY_SIZE(instrs->buffer))) {
		instrs->count =3D UINT32_MAX;
		return;
	}

	instrs->buffer[instrs->count++] =3D instr;
}

Then you can emit the profiling prologue/epilogue and CS call sections
using dedicated emit_{profiling_prologue,profiling_epilogue,cs_call}()
helpers.

>  		/* MOV32 rX+2, cs.latest_flush */
>  		(2ull << 56) | (val_reg << 48) | job->call_info.latest_flush,
> =20
>  		/* FLUSH_CACHE2.clean_inv_all.no_wait.signal(0) rX+2 */
>  		(36ull << 56) | (0ull << 48) | (val_reg << 40) | (0 << 16) | 0x233,
> =20
> +		/* MOV48 rX:rX+1, cycles_offset */
> +		(1ull << 56) | (cycle_reg << 48) | (times_addr + offsetof(struct panth=
or_job_times, cycles.before)),
> +
> +		/* MOV48 rX:rX+1, time_offset */
> +		(1ull << 56) | (time_reg << 48) | (times_addr + offsetof(struct pantho=
r_job_times, time.before)),
> +
> +		/* STORE_STATE cycles */
> +		(40ull << 56) |  (cycle_reg << 40) | (1ll << 32),
> +
> +		/* STORE_STATE timer */
> +		(40ull << 56) |  (time_reg << 40) | (0ll << 32),
> +
>  		/* MOV48 rX:rX+1, cs.start */
>  		(1ull << 56) | (addr_reg << 48) | job->call_info.start,
> =20
> @@ -2843,6 +2934,18 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		/* CALL rX:rX+1, rX+2 */
>  		(32ull << 56) | (addr_reg << 40) | (val_reg << 32),
> =20
> +		/* MOV48 rX:rX+1, cycles_offset */
> +		(1ull << 56) | (cycle_reg << 48) | (times_addr + offsetof(struct panth=
or_job_times, cycles.after)),
> +
> +		/* MOV48 rX:rX+1, time_offset */
> +		(1ull << 56) | (time_reg << 48) | (times_addr + offsetof(struct pantho=
r_job_times, time.after)),
> +
> +		/* STORE_STATE cycles */
> +		(40ull << 56) |  (cycle_reg << 40) | (1ll << 32),
> +
> +		/* STORE_STATE timer */
> +		(40ull << 56) |  (time_reg << 40) | (0ll << 32),
> +
>  		/* MOV48 rX:rX+1, sync_addr */
>  		(1ull << 56) | (addr_reg << 48) | sync_addr,
> =20
> @@ -2862,9 +2965,18 @@ queue_run_job(struct drm_sched_job *sched_job)
>  	};
> =20
>  	/* Need to be cacheline aligned to please the prefetcher. */
> -	static_assert(sizeof(call_instrs) % 64 =3D=3D 0,
> +	static_assert(sizeof(call_instrs_simple) % 64 =3D=3D 0 && sizeof(call_i=
nstrs_profile) % 64 =3D=3D 0,
>  		      "call_instrs is not aligned on a cacheline");
> =20
> +	if (job->is_profiled) {
> +		call_instrs =3D call_instrs_profile;
> +		call_insrt_size =3D sizeof(call_instrs_profile);
> +
> +	} else {
> +		call_instrs =3D call_instrs_simple;
> +		call_insrt_size =3D sizeof(call_instrs_simple);
> +	}
> +
>  	/* Stream size is zero, nothing to do =3D> return a NULL fence and let
>  	 * drm_sched signal the parent.
>  	 */
> @@ -2887,8 +2999,23 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		       queue->fence_ctx.id,
>  		       atomic64_inc_return(&queue->fence_ctx.seqno));
> =20
> -	memcpy(queue->ringbuf->kmap + ringbuf_insert,
> -	       call_instrs, sizeof(call_instrs));
> +	/*
> +	 * Need to handle the wrap-around case when copying profiled instructio=
ns
> +	 * from an odd-indexed slot. The reason this can happen is user space is
> +	 * able to control the profiling status of the driver through a sysfs
> +	 * knob, so this might lead to a timestamp and cycles-profiling call
> +	 * instruction stream beginning at an odd-number slot. The GPU should
> +	 * be able to gracefully handle this.

NUM_INSTRS_PER_SLOT*2 is still a power of two, so that shouldn't be a
problem until we need more than 32 instructions. Note that this
wraparound handling might be interesting to have if we make the
granularity 8 instructions (a cache-line), and the aligned amount of
instructions is not a power of two.

> +	 */
> +	if (!ringbuf_wraparound) {
> +		memcpy(queue->ringbuf->kmap + ringbuf_insert,
> +		       call_instrs, call_insrt_size);
> +	} else {
> +		memcpy(queue->ringbuf->kmap + ringbuf_insert,
> +		       call_instrs, call_insrt_size/2);
> +		memcpy(queue->ringbuf->kmap, call_instrs +
> +		       NUM_INSTRS_PER_SLOT, call_insrt_size/2);

Uh, a lot of assumptions on SLOTSIZE are made here. I'd rather have
a copy_instrs_to_ringbuf() that does all of the wraparound handling in
a generic way based on the current position, the ringbuf size and the
size to copy.

static void
copy_instrs_to_ringbuf(struct panthor_queue *queue,
		       struct panthor_job_ringbuf_instrs *instrs)
{
	u32 ringbuf_size =3D panthor_kernel_bo_size(queue->ringbuf);
	u32 start =3D panthor_job::call_info::start & (ringbuf_size - 1);
	u32 size;

	/* Make sure things are aligned on a cache line */
	size =3D ALIGN_TO(instrs->count * sizeof(u64), 64);

	if (start + size > ringbuf_size) {
		memcpy(queue->ringbuf->kmap + start,
		       ringbuf_size - start);
		memcpy(queue->ringbuf->kmap,
		       start + size - ringbuf_size);
	} else {
		memcpy(queue->ringbuf->kmap + start, size);
	}
}

> +	}
> =20
>  	panthor_job_get(&job->base);
>  	spin_lock(&queue->fence_ctx.lock);
> @@ -2896,7 +3023,8 @@ queue_run_job(struct drm_sched_job *sched_job)
>  	spin_unlock(&queue->fence_ctx.lock);
> =20
>  	job->ringbuf.start =3D queue->iface.input->insert;
> -	job->ringbuf.end =3D job->ringbuf.start + sizeof(call_instrs);
> +	job->ringbuf.end =3D job->ringbuf.start + call_insrt_size;
> +	job->ringbuf_idx =3D ringbuf_index;
> =20
>  	/* Make sure the ring buffer is updated before the INSERT
>  	 * register.
> @@ -2987,7 +3115,8 @@ static const struct drm_sched_backend_ops panthor_q=
ueue_sched_ops =3D {
> =20
>  static struct panthor_queue *
>  group_create_queue(struct panthor_group *group,
> -		   const struct drm_panthor_queue_create *args)
> +		   const struct drm_panthor_queue_create *args,
> +		   unsigned int slots_so_far)
>  {
>  	struct drm_gpu_scheduler *drm_sched;
>  	struct panthor_queue *queue;
> @@ -3038,9 +3167,17 @@ group_create_queue(struct panthor_group *group,
>  		goto err_free_queue;
>  	}
> =20
> +	queue->time_offset =3D group->syncobjs.job_times_offset +
> +		(slots_so_far * sizeof(struct panthor_job_times));

Let's just pass an explicit GPU/CPU pointer to group_create_queue(), or
allocate a BO per-queue.

> +
> +	/*
> +	 * Credit limit argument tells us the total number of instructions
> +	 * across all CS slots in the ringbuffer, with some jobs requiring
> +	 * twice as many as others, depending on their profiling status.
> +	 */
>  	ret =3D drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
>  			     group->ptdev->scheduler->wq, 1,
> -			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
> +			     args->ringbuf_size / sizeof(u64),
>  			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>  			     group->ptdev->reset.wq,
>  			     NULL, "panthor-queue", group->ptdev->base.dev);
> @@ -3068,7 +3205,9 @@ int panthor_group_create(struct panthor_file *pfile,
>  	struct panthor_scheduler *sched =3D ptdev->scheduler;
>  	struct panthor_fw_csg_iface *csg_iface =3D panthor_fw_get_csg_iface(ptd=
ev, 0);
>  	struct panthor_group *group =3D NULL;
> +	unsigned int total_slots;
>  	u32 gid, i, suspend_size;
> +	size_t syncobj_bo_size;
>  	int ret;
> =20
>  	if (group_args->pad)
> @@ -3134,33 +3273,75 @@ int panthor_group_create(struct panthor_file *pfi=
le,
>  		goto err_put_group;
>  	}
> =20
> -	group->syncobjs =3D panthor_kernel_bo_create(ptdev, group->vm,
> -						   group_args->queues.count *
> -						   sizeof(struct panthor_syncobj_64b),
> -						   DRM_PANTHOR_BO_NO_MMAP,
> -						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
> -						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -						   PANTHOR_VM_KERNEL_AUTO_VA);
> -	if (IS_ERR(group->syncobjs)) {
> -		ret =3D PTR_ERR(group->syncobjs);
> +	/*
> +	 * Need to add size for the panthor_job_times structs, as many as the s=
um
> +	 * of the number of job slots for every single queue ringbuffer.
> +	 */
> +	for (i =3D 0, total_slots =3D 0; i < group_args->queues.count; i++)
> +		total_slots +=3D (queue_args[i].ringbuf_size / (SLOTSIZE));
> +
> +	syncobj_bo_size =3D (group_args->queues.count * sizeof(struct panthor_s=
yncobj_64b))
> +		+ (total_slots * sizeof(struct panthor_job_times));
> +
> +	/*
> +	 * Memory layout of group's syncobjs BO
> +	 * group->syncobjs.bo {
> +	 *	struct panthor_syncobj_64b sync1;
> +	 *	struct panthor_syncobj_64b sync2;
> +	 *		...
> +	 *		As many as group_args->queues.count
> +	 *		...
> +	 *	struct panthor_syncobj_64b syncn;
> +	 *	struct panthor_job_times queue1_slot1
> +	 *	struct panthor_job_times queue1_slot2
> +	 *		...
> +	 *		As many as queue[i].ringbuf_size / SLOTSIZE
> +	 *		...
> +	 *	struct panthor_job_times queue1_slotP
> +	 *		...
> +	 *		As many as group_args->queues.count
> +	 *		...
> +	 *	struct panthor_job_times queueN_slot1
> +	 *	struct panthor_job_times queueN_slot2
> +	 *		...
> +	 *		As many as queue[n].ringbuf_size / SLOTSIZE
> +	 *	struct panthor_job_times queueN_slotQ
> +	 *
> +	 *	Linearly, group->syncobjs.bo =3D {syncojb1,..,syncobjN,
> +	 *	{queue1 =3D {js1,..,jsP},..,queueN =3D {js1,..,jsQ}}}
> +	 * }
> +	 *
> +	 */
> +
> +	group->syncobjs.bo =3D panthor_kernel_bo_create(ptdev, group->vm,
> +						      syncobj_bo_size,
> +						      DRM_PANTHOR_BO_NO_MMAP,
> +						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
> +						      DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> +						      PANTHOR_VM_KERNEL_AUTO_VA);
> +	if (IS_ERR(group->syncobjs.bo)) {
> +		ret =3D PTR_ERR(group->syncobjs.bo);
>  		goto err_put_group;
>  	}
> =20
> -	ret =3D panthor_kernel_bo_vmap(group->syncobjs);
> +	ret =3D panthor_kernel_bo_vmap(group->syncobjs.bo);
>  	if (ret)
>  		goto err_put_group;
> =20
> -	memset(group->syncobjs->kmap, 0,
> -	       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
> +	memset(group->syncobjs.bo->kmap, 0, syncobj_bo_size);
> =20
> -	for (i =3D 0; i < group_args->queues.count; i++) {
> -		group->queues[i] =3D group_create_queue(group, &queue_args[i]);
> +	group->syncobjs.job_times_offset =3D
> +		group_args->queues.count * sizeof(struct panthor_syncobj_64b);
> +
> +	for (i =3D 0, total_slots =3D 0; i < group_args->queues.count; i++) {
> +		group->queues[i] =3D group_create_queue(group, &queue_args[i], total_s=
lots);
>  		if (IS_ERR(group->queues[i])) {
>  			ret =3D PTR_ERR(group->queues[i]);
>  			group->queues[i] =3D NULL;
>  			goto err_put_group;
>  		}
> =20
> +		total_slots +=3D (queue_args[i].ringbuf_size / (SLOTSIZE));
>  		group->queue_count++;
>  	}
> =20
> @@ -3384,9 +3565,12 @@ panthor_job_create(struct panthor_file *pfile,
>  		goto err_put_job;
>  	}
> =20
> +	job->is_profiled =3D pfile->ptdev->profile_mode;
> +
>  	ret =3D drm_sched_job_init(&job->base,
>  				 &job->group->queues[job->queue_idx]->entity,
> -				 1, job->group);
> +				 job->is_profiled ? NUM_INSTRS_PER_SLOT * 2 :
> +				 NUM_INSTRS_PER_SLOT, job->group);

Can we have an helper calculating the job credits instead of hardcoding
it here? This way, once we decide to make things more dynamic, we only
have one place to patch.

>  	if (ret)
>  		goto err_put_job;
> =20


Regards,

Boris
