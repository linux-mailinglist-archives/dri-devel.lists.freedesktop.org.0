Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF1C8FE77F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571D310E1B1;
	Thu,  6 Jun 2024 13:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89C410E1B1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:19:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E460361DCE;
 Thu,  6 Jun 2024 13:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4A4C2BD10;
 Thu,  6 Jun 2024 13:19:26 +0000 (UTC)
Date: Thu, 6 Jun 2024 09:19:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 3/4] drm/sched: cleanup gpu_scheduler trace events
Message-ID: <20240606091929.6be2f8c2@gandalf.local.home>
In-Reply-To: <20240606130629.214827-4-pierre-eric.pelloux-prayer@amd.com>
References: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
 <20240606130629.214827-4-pierre-eric.pelloux-prayer@amd.com>
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

On Thu, 6 Jun 2024 15:06:24 +0200
Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:

> Print identifiers instead of pointers:
> * "fence=%p" is replaced by "fence=(context:%llu, seqno:%lld)" to have a
> coherent way to print the fence. A possible follow up change would be
> to use the same format in traces/../dma-fence.h.
> * "entity=%p" is removed because the fence's context is already an
> identifier of the job owner.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 27 ++++++++++---------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 0a19c121bda5..2d7f2252eb5d 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -58,9 +58,9 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  				   &sched_job->sched->credit_count);
>  			   __entry->dev_index = sched_job->sched->dev->primary->index;
>  			   ),
> -	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
> -		      __entry->entity, __entry->id,
> -		      __entry->fence, __get_str(name),
> +	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
> +		      __entry->id,
> +		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
>  		      __entry->job_count, __entry->hw_job_count)
>  );
>  
> @@ -72,9 +72,9 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
>  DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
>  	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>  	    TP_ARGS(sched_job, entity),
> -	    TP_printk("dev_index=%d entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
> -		      __entry->dev_index, __entry->entity, __entry->id,
> -		      __entry->fence, __get_str(name),
> +	    TP_printk("dev_index=%d id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
> +		      __entry->dev_index, __entry->id,
> +		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
>  		      __entry->job_count, __entry->hw_job_count)

NACK!

You can't dereference pointers from TP_printk(). This is called seconds,
minutes, hours, even days or months after that pointer was assigned. How do
you know that pointer still points to anything?

-- Steve


>  );
>  
> @@ -88,7 +88,8 @@ TRACE_EVENT(drm_sched_process_job,
>  	    TP_fast_assign(
>  		    __entry->fence = &fence->finished;
>  		    ),
> -	    TP_printk("fence=%p signaled", __entry->fence)
> +	    TP_printk("fence=(context:%llu, seqno:%lld) signaled",
> +		      __entry->fence->context, __entry->fence->seqno)
>  );
>  
>  TRACE_EVENT(drm_sched_job_wait_dep,
> @@ -96,23 +97,25 @@ TRACE_EVENT(drm_sched_job_wait_dep,
>  	    TP_ARGS(sched_job, fence),
>  	    TP_STRUCT__entry(
>  			     __string(name, sched_job->sched->name)
> +			     __field(uint64_t, fence_context)
>  			     __field(uint64_t, id)
>  			     __field(struct dma_fence *, fence)
>  			     __field(uint64_t, ctx)
> -			     __field(unsigned, seqno)
> +			     __field(uint64_t, seqno)
>  			     ),
>  
>  	    TP_fast_assign(
>  			   __assign_str(name);
> +			   /* Store the hw exec fence context. */
> +			   __entry->fence_context = sched_job->entity->fence_context + 1;
>  			   __entry->id = sched_job->id;
>  			   __entry->fence = fence;
>  			   __entry->ctx = fence->context;
>  			   __entry->seqno = fence->seqno;
>  			   ),
> -	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
> -		      __get_str(name), __entry->id,
> -		      __entry->fence, __entry->ctx,
> -		      __entry->seqno)
> +	    TP_printk("job ring=%s, fence_context=%llu, id=%llu, depends fence=(context:%llu, seqno:%lld)",
> +		      __get_str(name), __entry->fence_context, __entry->id,
> +		      __entry->ctx, __entry->seqno)
>  );
>  
>  #endif

