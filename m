Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4485478B6FB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 20:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A4410E320;
	Mon, 28 Aug 2023 18:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE4410E320
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693245876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3x3VOUghRJkAPtuaRKNHrIQ3fBlDR97PJmybXIiAf1Y=;
 b=dx8TECMEubcrFllBnD1qqpiL+00iX9lzbjOM6TtlRFquybSvBRwMRPS83KcJa9vBq4nY1R
 sn5h20+K+Az6BDYF8TDPd0YgbKwMlU8YpiHB+9b7G0K0JjByuS487dkcAaByRxl106qn7D
 6adYmdf9TZ7PUyXpZlASlnHJSMBVnVg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-SpOSlFwNM4u51-ytFdPRGQ-1; Mon, 28 Aug 2023 14:04:35 -0400
X-MC-Unique: SpOSlFwNM4u51-ytFdPRGQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-51bef8bb689so6862465a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 11:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693245874; x=1693850674;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3x3VOUghRJkAPtuaRKNHrIQ3fBlDR97PJmybXIiAf1Y=;
 b=Wa1WVl4H1HlPbdnh4DGaQxyYBoATrqm9lxKVdEkCNGeb1F9sbYqxJhxRQU77XUrQC/
 S736L6ulZoKV5+N5CUKHyb0PVEqrzKxTVdh3BUXQhlFt5vF6c1bPT6t+pqKVrETpV+8A
 Fbe3pVHKQv+GIhpgQ3UJY1m3UpDzI5ADnWDcnzpwx9W02MXHs80s5H+GjFTaXrBLn1W9
 F3qAvA5smGfWNgDF2apBBEDQ6Cl22idtcmXNbeg5gaOCA1WOpmRszgZrOA6lQ5ZWF8NE
 DjwRTdHN1OxwkZCUWob0X4tU9X8nvpaX48H/IrOke0KaiZDISh3OQKZ5Pu9hzlIkAJDe
 t8AQ==
X-Gm-Message-State: AOJu0YwMMreNhJxyu5etSsO6YRO0K2AKCcqHGfRpFE00ReymVHTMvZ3W
 Hilm2TvJSIuYXdEc9pdPBFQYLkO1RLrj2Qit1gwWpFO2Pq6c6x81QdIx1HrsiobRQJCf24Ibkmu
 U31Z+DqjEV4E+QQ7hlIHYX8CwKcSF
X-Received: by 2002:a05:6402:4315:b0:527:1855:be59 with SMTP id
 m21-20020a056402431500b005271855be59mr455782edc.3.1693245874280; 
 Mon, 28 Aug 2023 11:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF98po1t7YAw0gNRwWdEXr48FdH607GtcMJNGduMVNkyqk0YCdY94iVX7/ryj00lJgrm5G5yA==
X-Received: by 2002:a05:6402:4315:b0:527:1855:be59 with SMTP id
 m21-20020a056402431500b005271855be59mr455761edc.3.1693245873946; 
 Mon, 28 Aug 2023 11:04:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r9-20020aa7da09000000b005236b47116asm4708632eds.70.2023.08.28.11.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:04:33 -0700 (PDT)
Message-ID: <bbb7fe74-bc75-8fc0-0a33-88ff86b81e00@redhat.com>
Date: Mon, 28 Aug 2023 20:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230811023137.659037-5-matthew.brost@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/11/23 04:31, Matthew Brost wrote:
> Rather than call free_job and run_job in same work item have a dedicated
> work item for each. This aligns with the design and intended use of work
> queues.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>   include/drm/gpu_scheduler.h            |   8 +-
>   2 files changed, 106 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index cede47afc800..b67469eac179 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>    * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>    *
>    * @rq: scheduler run queue to check.
> + * @dequeue: dequeue selected entity
>    *
>    * Try to find a ready entity, returns NULL if none found.
>    */
>   static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>   {
>   	struct drm_sched_entity *entity;
>   
> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   	if (entity) {
>   		list_for_each_entry_continue(entity, &rq->entities, list) {
>   			if (drm_sched_entity_is_ready(entity)) {
> -				rq->current_entity = entity;
> -				reinit_completion(&entity->entity_idle);
> +				if (dequeue) {
> +					rq->current_entity = entity;
> +					reinit_completion(&entity->entity_idle);
> +				}
>   				spin_unlock(&rq->lock);
>   				return entity;
>   			}
> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   	list_for_each_entry(entity, &rq->entities, list) {
>   
>   		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (dequeue) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>   			spin_unlock(&rq->lock);
>   			return entity;
>   		}
> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>    * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>    *
>    * @rq: scheduler run queue to check.
> + * @dequeue: dequeue selected entity
>    *
>    * Find oldest waiting ready entity, returns NULL if none found.
>    */
>   static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>   {
>   	struct rb_node *rb;
>   
> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   
>   		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>   		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (dequeue) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>   			break;
>   		}
>   	}
> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   }
>   
>   /**
> - * drm_sched_submit_queue - scheduler queue submission
> + * drm_sched_run_job_queue - queue job submission
>    * @sched: scheduler instance
>    */
> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>   {
>   	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_submit);
> +		queue_work(sched->submit_wq, &sched->work_run_job);
> +}
> +
> +static struct drm_sched_entity *
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
> +
> +/**
> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	if (drm_sched_select_entity(sched, false))
> +		drm_sched_run_job_queue(sched);
> +}
> +
> +/**
> + * drm_sched_free_job_queue - queue free job
> + *
> + * @sched: scheduler instance to queue free job
> + */
> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_free_job_queue_if_ready - queue free job if ready
> + *
> + * @sched: scheduler instance to queue free job
> + */
> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job;
> +
> +	spin_lock(&sched->job_list_lock);
> +	job = list_first_entry_or_null(&sched->pending_list,
> +				       struct drm_sched_job, list);
> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> +		drm_sched_free_job_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
>   }
>   
>   /**
> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>   	dma_fence_get(&s_fence->finished);
>   	drm_sched_fence_finished(s_fence, result);
>   	dma_fence_put(&s_fence->finished);
> -	drm_sched_submit_queue(sched);
> +	drm_sched_free_job_queue(sched);
>   }
>   
>   /**
> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>   void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>   {
>   	if (drm_sched_can_queue(sched))
> -		drm_sched_submit_queue(sched);
> +		drm_sched_run_job_queue(sched);
>   }
>   
>   /**
>    * drm_sched_select_entity - Select next entity to process
>    *
>    * @sched: scheduler instance
> + * @dequeue: dequeue selected entity
>    *
>    * Returns the entity to process or NULL if none are found.
>    */
>   static struct drm_sched_entity *
> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>   {
>   	struct drm_sched_entity *entity;
>   	int i;
> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   	/* Kernel run queue has higher priority than normal run queue*/
>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>   		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> +							dequeue) :
> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> +						      dequeue);
>   		if (entity)
>   			break;
>   	}
> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   EXPORT_SYMBOL(drm_sched_pick_best);
>   
>   /**
> - * drm_sched_main - main scheduler thread
> + * drm_sched_free_job_work - worker to call free_job
>    *
> - * @param: scheduler instance
> + * @w: free job work
>    */
> -static void drm_sched_main(struct work_struct *w)
> +static void drm_sched_free_job_work(struct work_struct *w)
>   {
>   	struct drm_gpu_scheduler *sched =
> -		container_of(w, struct drm_gpu_scheduler, work_submit);
> -	struct drm_sched_entity *entity;
> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>   	struct drm_sched_job *cleanup_job;
> -	int r;
>   
>   	if (READ_ONCE(sched->pause_submit))
>   		return;
>   
>   	cleanup_job = drm_sched_get_cleanup_job(sched);
> -	entity = drm_sched_select_entity(sched);
> +	if (cleanup_job) {
> +		sched->ops->free_job(cleanup_job);
> +
> +		drm_sched_free_job_queue_if_ready(sched);
> +		drm_sched_run_job_queue_if_ready(sched);
> +	}
> +}
>   
> -	if (!entity && !cleanup_job)
> -		return;	/* No more work */
> +/**
> + * drm_sched_run_job_work - worker to call run_job
> + *
> + * @w: run job work
> + */
> +static void drm_sched_run_job_work(struct work_struct *w)
> +{
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> +	struct drm_sched_entity *entity;
> +	int r;
>   
> -	if (cleanup_job)
> -		sched->ops->free_job(cleanup_job);
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
>   
> +	entity = drm_sched_select_entity(sched, true);
>   	if (entity) {
>   		struct dma_fence *fence;
>   		struct drm_sched_fence *s_fence;
> @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
>   		sched_job = drm_sched_entity_pop_job(entity);
>   		if (!sched_job) {
>   			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> -				return;	/* No more work */
> -			goto again;
> +			return;	/* No more work */
>   		}
>   
>   		s_fence = sched_job->s_fence;
> @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
>   		}
>   
>   		wake_up(&sched->job_scheduled);
> +		drm_sched_run_job_queue_if_ready(sched);
>   	}
> -
> -again:
> -	drm_sched_submit_queue(sched);
>   }
>   
>   /**
> @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	spin_lock_init(&sched->job_list_lock);
>   	atomic_set(&sched->hw_rq_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> -	INIT_WORK(&sched->work_submit, drm_sched_main);
> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>   	atomic_set(&sched->_score, 0);
>   	atomic64_set(&sched->job_id_count, 0);
>   	sched->pause_submit = false;
> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>   void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)

I was wondering what the scheduler teardown sequence looks like for
DRM_SCHED_POLICY_SINGLE_ENTITY and how XE does that.

In Nouveau, userspace can ask the kernel to create a channel (or multiple),
where each channel represents a ring feeding the firmware scheduler. Userspace
can forcefully close channels via either a dedicated IOCTL or by just closing
the FD which subsequently closes all channels opened through this FD.

When this happens the scheduler needs to be teared down. Without keeping track of
things in a driver specific way, the only thing I could really come up with is the
following.

/* Make sure no more jobs are fetched from the entity. */
drm_sched_submit_stop();

/* Wait for the channel to be idle, namely jobs in flight to complete. */
nouveau_channel_idle();

/* Stop the scheduler to free jobs from the pending_list. Ring must be idle at this
  * point, otherwise me might leak jobs. Feels more like a workaround to free
  * finished jobs.
  */
drm_sched_stop();

/* Free jobs from the entity queue. */
drm_sched_entity_fini();

/* Probably not even needed in this case. */
drm_sched_fini();

This doesn't look very straightforward though. I wonder if other drivers feeding
firmware schedulers have similar cases. Maybe something like drm_sched_teardown(),
which would stop job submission, wait for pending jobs to finish and subsequently
free them up would makes sense?

- Danilo

>   {
>   	WRITE_ONCE(sched->pause_submit, true);
> -	cancel_work_sync(&sched->work_submit);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>   }
>   EXPORT_SYMBOL(drm_sched_submit_stop);
>   
> @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>   void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, false);
> -	queue_work(sched->submit_wq, &sched->work_submit);
> +	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>   }
>   EXPORT_SYMBOL(drm_sched_submit_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 04eec2d7635f..fbc083a92757 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>    *                 finished.
>    * @hw_rq_count: the number of jobs currently in the hardware queue.
>    * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_submit
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>    * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_submit: schedules jobs and cleans up entities
> + * @work_run_job: schedules jobs
> + * @work_free_job: cleans up jobs
>    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>    *            timeout interval is over.
>    * @pending_list: the list of jobs which are currently in the job queue.
> @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
>   	atomic64_t			job_id_count;
>   	struct workqueue_struct		*submit_wq;
>   	struct workqueue_struct		*timeout_wq;
> -	struct work_struct		work_submit;
> +	struct work_struct		work_run_job;
> +	struct work_struct		work_free_job;
>   	struct delayed_work		work_tdr;
>   	struct list_head		pending_list;
>   	spinlock_t			job_list_lock;

