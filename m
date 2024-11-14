Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95119C8D65
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 15:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B91210E354;
	Thu, 14 Nov 2024 14:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E9E10E354
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 14:55:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3C0BAA402E3;
 Thu, 14 Nov 2024 14:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FF1C4CECD;
 Thu, 14 Nov 2024 14:55:50 +0000 (UTC)
Date: Thu, 14 Nov 2024 09:56:11 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <l.stach@pengutronix.de>, <matt.coster@imgtec.com>,
 <frank.binns@imgtec.com>, <yuq825@gmail.com>, <robdclark@gmail.com>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <boris.brezillon@collabora.com>,
 <steven.price@arm.com>, <mwen@igalia.com>, <mcanal@igalia.com>,
 <thomas.hellstrom@linux.intel.com>, <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v6 4/7] drm/sched: cleanup gpu_scheduler trace events
Message-ID: <20241114095611.03b3fb8b@gandalf.local.home>
In-Reply-To: <20241114100113.150647-5-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 14 Nov 2024 11:01:07 +0100
Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:

> A fence uniquely identify a job, so this commits updates the places
> where a kernel pointer was used as an identifier by:
> 
>    "fence=(context:%llu, seqno:%lld)"
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 39 +++++++++++--------
>  1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index c4ec28540656..24358c4d5bbe 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>  	    TP_ARGS(sched_job, entity),
>  	    TP_STRUCT__entry(
> -			     __field(struct drm_sched_entity *, entity)
> -			     __field(struct dma_fence *, fence)
>  			     __string(name, sched_job->sched->name)

The __string() is a 4 byte meta field in the trace event structure. This
means if you have a 64bit (8 byte) field following it, there will likely be
a 4 byte hole between the two fields.

I would suggest swapping the name field with the id field, then you will
have four 4 byte fields in a row (name, job_count, hw_job_count, dev),
which should fill all the holes.

-- Steve


>  			     __field(uint64_t, id)
>  			     __field(u32, job_count)
>  			     __field(int, hw_job_count)
>  			     __string(dev, dev_name(sched_job->sched->dev))
> +			     __field(uint64_t, fence_context)
> +			     __field(uint64_t, fence_seqno)
>  			     ),
>  
>  	    TP_fast_assign(
> -			   __entry->entity = entity;
>  			   __entry->id = sched_job->id;
> -			   __entry->fence = &sched_job->s_fence->finished;
>  			   __assign_str(name);
>  			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>  			   __entry->hw_job_count = atomic_read(
>  				   &sched_job->sched->credit_count);
>  			   __assign_str(dev);
> +			   __entry->fence_context = sched_job->s_fence->finished.context;
> +			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> +
>  			   ),
> -	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
> -		      __get_str(dev), __entry->entity, __entry->id,
> -		      __entry->fence, __get_str(name),
> +	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
> +		      __get_str(dev), __entry->id,
> +		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
>  		      __entry->job_count, __entry->hw_job_count)
>  );
>
