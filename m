Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D01925B08
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 13:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583FE89358;
	Wed,  3 Jul 2024 11:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B9D10E7B4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 11:05:16 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOxnN-0004XG-5j; Wed, 03 Jul 2024 13:05:05 +0200
Message-ID: <16fdbb7214ac409fd447575daf8d2c8ee2fbf02e.camel@pengutronix.de>
Subject: Re: [PATCH v5 3/4] drm/sched: trace dependencies for gpu jobs
From: Lucas Stach <l.stach@pengutronix.de>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com,  rostedt@goodmis.org
Date: Wed, 03 Jul 2024 13:05:02 +0200
In-Reply-To: <20240614081657.408397-4-pierre-eric.pelloux-prayer@amd.com>
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-4-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Freitag, dem 14.06.2024 um 10:16 +0200 schrieb Pierre-Eric Pelloux-
Prayer:
> Trace the fence dependencies similarly to how we print fences:
>=20
>  ... , dependencies:{(context:606, seqno:38006)}
>=20
> This allows tools to analyze the dependencies between the jobs (previousl=
y
> it was only possible for fences traced by drm_sched_job_wait_dep).
>=20
> Since drm_sched_job and drm_run_job use the same base event class,
> the caller of trace_drm_run_job have to pass a dep_count of 0 (which
> is ignored because dependencies are only considered at submit time).
>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> ---
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 59 ++++++++++++++++---
>  drivers/gpu/drm/scheduler/sched_entity.c      |  8 ++-
>  drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
>  3 files changed, 58 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gp=
u/drm/scheduler/gpu_scheduler_trace.h
> index f6da377cdb99..0abcad26839c 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -26,15 +26,41 @@
> =20
>  #include <linux/stringify.h>
>  #include <linux/types.h>
> +#include <linux/trace_seq.h>
>  #include <linux/tracepoint.h>
> =20
>  #undef TRACE_SYSTEM
>  #define TRACE_SYSTEM gpu_scheduler
>  #define TRACE_INCLUDE_FILE gpu_scheduler_trace
> =20
> +#ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> +#define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> +/* Similar to trace_print_array_seq but for fences. */
> +static inline const char *__print_dma_fence_array(struct trace_seq *p, c=
onst void *buf, int count)
> +{
> +	const char *ret =3D trace_seq_buffer_ptr(p);
> +	u64 *fences =3D (u64 *) buf;
> +	const char *prefix =3D "";
> +
> +	trace_seq_putc(p, '{');
> +	for (int i =3D 0; i < count; i++) {
> +		u64 context =3D fences[2 * i], seqno =3D fences[2 * i + 1];
> +
> +		trace_seq_printf(p, "%s(context:%llu, seqno:%lld)",
> +				 prefix, context, seqno);
> +		prefix =3D ",";
> +	}
> +	trace_seq_putc(p, '}');
> +	trace_seq_putc(p, 0);
> +
> +	return ret;
> +}
> +#endif
> +
>  DECLARE_EVENT_CLASS(drm_sched_job,
> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *=
entity),
> -	    TP_ARGS(sched_job, entity),
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *=
entity,
> +		     unsigned int dep_count),
> +	    TP_ARGS(sched_job, entity, dep_count),
>  	    TP_STRUCT__entry(
>  			     __string(name, sched_job->sched->name)
>  			     __field(uint64_t, id)
> @@ -43,9 +69,14 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  			     __string(dev, dev_name(sched_job->sched->dev))
>  			     __field(uint64_t, fence_context)
>  			     __field(uint64_t, fence_seqno)
> +			     __field(int, n_deps)
> +			     __dynamic_array(u64, deps, dep_count * 2)
>  			     ),
> =20
>  	    TP_fast_assign(
> +			   unsigned long idx;
> +			   struct dma_fence *fence;
> +			   u64 *dyn_arr;
>  			   __entry->id =3D sched_job->id;
>  			   __assign_str(name);
>  			   __entry->job_count =3D spsc_queue_count(&entity->job_queue);
> @@ -54,22 +85,32 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  			   __assign_str(dev);
>  			   __entry->fence_context =3D sched_job->s_fence->finished.context;
>  			   __entry->fence_seqno =3D sched_job->s_fence->finished.seqno;
> -
> +			   __entry->n_deps =3D dep_count;
> +			   if (dep_count) {
> +				dyn_arr =3D __get_dynamic_array(deps);
> +				xa_for_each(&sched_job->dependencies, idx, fence) {
> +					dyn_arr[2 * idx] =3D fence->context;
> +					dyn_arr[2 * idx + 1] =3D fence->seqno;
> +				}
> +			   }
>  			   ),
> -	    TP_printk("id=3D%llu, fence=3D(context:%llu, seqno:%lld), ring=3D%s=
, job count:%u, hw job count:%d",
> +	    TP_printk("id=3D%llu, fence=3D(context:%llu, seqno:%lld), ring=3D%s=
, job count:%u, hw job count:%d, dependencies:%s",
>  		      __entry->id,
>  		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
> -		      __entry->job_count, __entry->hw_job_count)
> +		      __entry->job_count, __entry->hw_job_count,
> +		      __print_dma_fence_array(p, __get_dynamic_array(deps), __entry->n=
_deps))
>  );
> =20
>  DEFINE_EVENT(drm_sched_job, drm_sched_job,
> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *=
entity),
> -	    TP_ARGS(sched_job, entity)
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *=
entity,
> +		     unsigned int dep_count),
> +	    TP_ARGS(sched_job, entity, dep_count)
>  );
> =20
>  DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *=
entity),
> -	    TP_ARGS(sched_job, entity),
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *=
entity,
> +		     unsigned int dep_count),
> +	    TP_ARGS(sched_job, entity, 0),
>  	    TP_printk("dev=3D%s, id=3D%llu, fence=3D(context:%llu, seqno:%lld),=
 ring=3D%s, job count:%u, hw job count:%d",
>  		      __get_str(dev), __entry->id,
>  		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 58c8161289fe..aa33a9d29b14 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -583,7 +583,13 @@ void drm_sched_entity_push_job(struct drm_sched_job =
*sched_job)
>  	bool first;
>  	ktime_t submit_ts;
> =20
> -	trace_drm_sched_job(sched_job, entity);
> +	if (trace_drm_sched_job_enabled()) {
> +		unsigned long index;
> +		void *f;
> +
> +		xa_for_each(&sched_job->dependencies, index, f) { }

I did need to do a double take on that one. While using index for the
total number of dependencies is correct for the dense and at this point
in time fully populated dependencies array, it is a bit non-obvious.
Maybe add a small comment here or have an actual counter in the loop
body?

Regards,
Lucas

> +		trace_drm_sched_job(sched_job, entity, index);
> +	}
>  	atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
> =20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 7e90c9f95611..0bc9b7b24b34 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1201,7 +1201,7 @@ static void drm_sched_run_job_work(struct work_stru=
ct *w)
>  	atomic_add(sched_job->credits, &sched->credit_count);
>  	drm_sched_job_begin(sched_job);
> =20
> -	trace_drm_run_job(sched_job, entity);
> +	trace_drm_run_job(sched_job, entity, 0);
>  	fence =3D sched->ops->run_job(sched_job);
>  	complete_all(&entity->entity_idle);
>  	drm_sched_fence_scheduled(s_fence, fence);

