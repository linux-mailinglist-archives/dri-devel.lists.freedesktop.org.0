Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA5787BC9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 01:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C480510E5E9;
	Thu, 24 Aug 2023 23:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B0C10E5E9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 23:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692918257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DOkXO/DcdiMscMWhhNwLECMKEXTKX6g4191lPHoduqE=;
 b=ayMvuDYPk0s2A71o67DfMPEsmheRPA93Sxmst16CKAUVQ04bmMZEPM+UsXkO8PjKZdO0VG
 dhz2vN/1l6qhm5njKI4cyX2f6zletVlzxXjy3mcakmbCkbGfqZNdjpI4XYju92XnBNHVnB
 2g2KOZ5B2vWrfiTM1gWCVQlnHp3X47s=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-kq_hsOkBMOGwap7kkJ8-JA-1; Thu, 24 Aug 2023 19:04:15 -0400
X-MC-Unique: kq_hsOkBMOGwap7kkJ8-JA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fe369ab20fso289884e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 16:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692918254; x=1693523054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOkXO/DcdiMscMWhhNwLECMKEXTKX6g4191lPHoduqE=;
 b=J1R9XgSiHg8OxRJKk4YPFbnhoNALyUj4G5NE+nuPqXD7pIaKoL8kPEwfgIyGbpVJ/U
 uA2bO2Lum23M9Ojl8+bvVb8ooR4PScYHCeogaXSjxrKR/YvNLgUNiOKTQ/q4udC8Ll/N
 ejh8TslPZSebDq57yLXTnkipc6mg3aC0YfJCUzN7Fx3dRl/OUik/sB4L+Wbibhjug3NL
 btGDAoLTy0SVxYs93vvrffHJpJ1SGGCspSsSYnAIsrc0ioJgToTc4y55QCZ6OOkBWokF
 ErUogHf+rulM6nFzR4Ln8GVx4bLedJhn59cYC9cWhKBeiBH953Eet7EXjgz+TYJBwllO
 MvVg==
X-Gm-Message-State: AOJu0Yxf8PB4sgP59UOFVsvev2CHQVElmSXTz5jE5Hb2dDc4c7D1/Ysu
 ZqsmY/B+ct5Pk6vr2IcpeuK7I0kXbcGZ/mvGjp/bE9JRpmYwWTT6pOPcD5qm1mM5VM6N9b2ikgh
 53IYVzLhODjvm9po1j+FWJoZyumoo
X-Received: by 2002:a05:6512:b90:b0:500:7f91:fe2e with SMTP id
 b16-20020a0565120b9000b005007f91fe2emr13879779lfv.34.1692918253952; 
 Thu, 24 Aug 2023 16:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfMVlN8n5LRZZm8NipXQ8lqWqA8Q37jiN1WeYVjWZKZ9B+b7+aVUEigKx999jqlXn8F5KaJg==
X-Received: by 2002:a05:6512:b90:b0:500:7f91:fe2e with SMTP id
 b16-20020a0565120b9000b005007f91fe2emr13879765lfv.34.1692918253485; 
 Thu, 24 Aug 2023 16:04:13 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a1709064a5400b00992b50fbbe9sm180613ejv.90.2023.08.24.16.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 16:04:13 -0700 (PDT)
Date: Fri, 25 Aug 2023 01:04:10 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZOfh6o2EaGuIqZVe@pollux>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230811023137.659037-5-matthew.brost@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 07:31:32PM -0700, Matthew Brost wrote:
> Rather than call free_job and run_job in same work item have a dedicated
> work item for each. This aligns with the design and intended use of work
> queues.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>  include/drm/gpu_scheduler.h            |   8 +-
>  2 files changed, 106 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index cede47afc800..b67469eac179 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>   *
>   * @rq: scheduler run queue to check.
> + * @dequeue: dequeue selected entity
>   *
>   * Try to find a ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>  {
>  	struct drm_sched_entity *entity;
>  
> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  	if (entity) {
>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>  			if (drm_sched_entity_is_ready(entity)) {
> -				rq->current_entity = entity;
> -				reinit_completion(&entity->entity_idle);
> +				if (dequeue) {
> +					rq->current_entity = entity;
> +					reinit_completion(&entity->entity_idle);
> +				}
>  				spin_unlock(&rq->lock);
>  				return entity;
>  			}
> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  	list_for_each_entry(entity, &rq->entities, list) {
>  
>  		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (dequeue) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>  			spin_unlock(&rq->lock);
>  			return entity;
>  		}
> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>   *
>   * @rq: scheduler run queue to check.
> + * @dequeue: dequeue selected entity
>   *
>   * Find oldest waiting ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>  {
>  	struct rb_node *rb;
>  
> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  
>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>  		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (dequeue) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>  			break;
>  		}
>  	}
> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  }
>  
>  /**
> - * drm_sched_submit_queue - scheduler queue submission
> + * drm_sched_run_job_queue - queue job submission
>   * @sched: scheduler instance
>   */
> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (!READ_ONCE(sched->pause_submit))
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
>  }
>  
>  /**
> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	dma_fence_get(&s_fence->finished);
>  	drm_sched_fence_finished(s_fence, result);
>  	dma_fence_put(&s_fence->finished);
> -	drm_sched_submit_queue(sched);
> +	drm_sched_free_job_queue(sched);
>  }
>  
>  /**
> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
> -		drm_sched_submit_queue(sched);
> +		drm_sched_run_job_queue(sched);
>  }
>  
>  /**
>   * drm_sched_select_entity - Select next entity to process
>   *
>   * @sched: scheduler instance
> + * @dequeue: dequeue selected entity
>   *
>   * Returns the entity to process or NULL if none are found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>  {
>  	struct drm_sched_entity *entity;
>  	int i;
> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> +							dequeue) :
> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> +						      dequeue);
>  		if (entity)
>  			break;
>  	}
> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
>  /**
> - * drm_sched_main - main scheduler thread
> + * drm_sched_free_job_work - worker to call free_job
>   *
> - * @param: scheduler instance
> + * @w: free job work
>   */
> -static void drm_sched_main(struct work_struct *w)
> +static void drm_sched_free_job_work(struct work_struct *w)
>  {
>  	struct drm_gpu_scheduler *sched =
> -		container_of(w, struct drm_gpu_scheduler, work_submit);
> -	struct drm_sched_entity *entity;
> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>  	struct drm_sched_job *cleanup_job;
> -	int r;
>  
>  	if (READ_ONCE(sched->pause_submit))
>  		return;
>  
>  	cleanup_job = drm_sched_get_cleanup_job(sched);

I tried this patch with Nouveau and found a race condition:

In drm_sched_run_job_work() the job is added to the pending_list via
drm_sched_job_begin(), then the run_job() callback is called and the scheduled
fence is signaled.

However, in parallel drm_sched_get_cleanup_job() might be called from
drm_sched_free_job_work(), which picks the first job from the pending_list and
for the next job on the pending_list sets the scheduled fence' timestamp field.

The job can be on the pending_list, but the scheduled fence might not yet be
signaled. The call to actually signal the fence will subsequently fault because
it will try to dereference the timestamp.

I'm not sure what's the best way to fix this, maybe it's enough to re-order
signalling the scheduled fence and adding the job to the pending_list. Not sure
if this has other implications though.

- Danilo

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
>  	if (entity) {
>  		struct dma_fence *fence;
>  		struct drm_sched_fence *s_fence;
> @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
>  		sched_job = drm_sched_entity_pop_job(entity);
>  		if (!sched_job) {
>  			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> -				return;	/* No more work */
> -			goto again;
> +			return;	/* No more work */
>  		}
>  
>  		s_fence = sched_job->s_fence;
> @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
>  		}
>  
>  		wake_up(&sched->job_scheduled);
> +		drm_sched_run_job_queue_if_ready(sched);
>  	}
> -
> -again:
> -	drm_sched_submit_queue(sched);
>  }
>  
>  /**
> @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> -	INIT_WORK(&sched->work_submit, drm_sched_main);
> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
>  	sched->pause_submit = false;
> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, true);
> -	cancel_work_sync(&sched->work_submit);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_submit_stop);
>  
> @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>  void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, false);
> -	queue_work(sched->submit_wq, &sched->work_submit);
> +	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_submit_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 04eec2d7635f..fbc083a92757 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_submit
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>   * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_submit: schedules jobs and cleans up entities
> + * @work_run_job: schedules jobs
> + * @work_free_job: cleans up jobs
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
>   * @pending_list: the list of jobs which are currently in the job queue.
> @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
>  	atomic64_t			job_id_count;
>  	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> -	struct work_struct		work_submit;
> +	struct work_struct		work_run_job;
> +	struct work_struct		work_free_job;
>  	struct delayed_work		work_tdr;
>  	struct list_head		pending_list;
>  	spinlock_t			job_list_lock;
> -- 
> 2.34.1
> 

