Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DFE79CEAD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 12:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E252D10E3ED;
	Tue, 12 Sep 2023 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B66E10E3ED
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 10:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694515591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3o4Cvkitabu0mQEckjrmvMU7Z34/RBvD6r89aNxAjz0=;
 b=MokeFdfnkr64ZgvgkqJIOdwHkaLf+PRtLyCF1Y3F8duuSMbW8nz8K5T+1YqMVGze1nu/oM
 UPn9ZX4uBXZGwyE8mNbujTwejVoij0LrwMLuXlOl+Tjigeag8PbCHpfHWzdJ8VEpGmyiH0
 cKSLnpiWfzKBPQ9BtoaHtfOlkI+YE6I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-Wgs6RnCCMGOxay_jwMLmfw-1; Tue, 12 Sep 2023 06:46:30 -0400
X-MC-Unique: Wgs6RnCCMGOxay_jwMLmfw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9a59528f7d2so365337866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 03:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694515589; x=1695120389;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3o4Cvkitabu0mQEckjrmvMU7Z34/RBvD6r89aNxAjz0=;
 b=anhOAFOfnt4J3XNJvQotdvO+GrNaiFn4OIjfJywCb5ri8My9w3NC+WTQjES7p3UVuV
 M0OJqFRqa5OQZYti+3I2JO0kbLfV8Fqu2JoXdqbG7HOnJo8ms6DQjus+gKz80435SscC
 asN+QD/WNh300/mQcYLn0Vx0g2Cw/cD8/8EODzx9CuvmiGHM76WEhIEEH0Gijp0jK2Ir
 ByIxm0536U43vfJUzOKPHDvzBQqC3dAdE4mFh0k95KlN9b9jga3jC4YupGtckBdJ7ge1
 VyZldisVn3JW+RSvTjyrJQpY9B4FQdSApZW55xzG6Hd4NGVWva9eYH0dqlWs1pjo+HWw
 /Eag==
X-Gm-Message-State: AOJu0Yw7TexSRS6bDIKsV8f6uQskig8xDGD1d8/mhuxDUtC1nrHB2FEk
 zV/ZyeasdGuZrq/dIkQoF6f4XQSOxfwLdP+UCC5OGhK012bMeFWNgiIoBfxNK8vS0N1WC7/K/DM
 Alspp0H7ut0uFwUZJhfsH/cJ40yCe
X-Received: by 2002:a17:906:2921:b0:99d:dce8:41d6 with SMTP id
 v1-20020a170906292100b0099ddce841d6mr10738542ejd.71.1694515589156; 
 Tue, 12 Sep 2023 03:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK6BAhDU3WNRFb3vXyhFp/aMMol7udADzgJSmQIMaEUl/a3gf+4Kq2mtU25wLdTAtVmZXOag==
X-Received: by 2002:a17:906:2921:b0:99d:dce8:41d6 with SMTP id
 v1-20020a170906292100b0099ddce841d6mr10738531ejd.71.1694515588820; 
 Tue, 12 Sep 2023 03:46:28 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a170906595500b009920a690cd9sm6526744ejr.59.2023.09.12.03.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 03:46:28 -0700 (PDT)
Date: Tue, 12 Sep 2023 12:46:26 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZQBBgsrohAqIAppA@pollux>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
 <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
 <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
 <20230912121357.4cc10dec@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230912121357.4cc10dec@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, donald.robson@imgtec.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 12:13:57PM +0200, Boris Brezillon wrote:
> On Fri, 25 Aug 2023 15:45:49 +0200
> Christian König <christian.koenig@amd.com> wrote:
> 
> > Am 25.08.23 um 15:36 schrieb Matthew Brost:
> > > On Fri, Aug 25, 2023 at 10:02:32AM +0200, Christian König wrote:  
> > >> Am 25.08.23 um 04:58 schrieb Matthew Brost:  
> > >>> On Fri, Aug 25, 2023 at 01:04:10AM +0200, Danilo Krummrich wrote:  
> > >>>> On Thu, Aug 10, 2023 at 07:31:32PM -0700, Matthew Brost wrote:  
> > >>>>> Rather than call free_job and run_job in same work item have a dedicated
> > >>>>> work item for each. This aligns with the design and intended use of work
> > >>>>> queues.
> > >>>>>
> > >>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > >>>>> ---
> > >>>>>    drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
> > >>>>>    include/drm/gpu_scheduler.h            |   8 +-
> > >>>>>    2 files changed, 106 insertions(+), 39 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > >>>>> index cede47afc800..b67469eac179 100644
> > >>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> > >>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > >>>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > >>>>>     * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> > >>>>>     *
> > >>>>>     * @rq: scheduler run queue to check.
> > >>>>> + * @dequeue: dequeue selected entity
> > >>>>>     *
> > >>>>>     * Try to find a ready entity, returns NULL if none found.
> > >>>>>     */
> > >>>>>    static struct drm_sched_entity *
> > >>>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > >>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> > >>>>>    {
> > >>>>>    	struct drm_sched_entity *entity;
> > >>>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > >>>>>    	if (entity) {
> > >>>>>    		list_for_each_entry_continue(entity, &rq->entities, list) {
> > >>>>>    			if (drm_sched_entity_is_ready(entity)) {
> > >>>>> -				rq->current_entity = entity;
> > >>>>> -				reinit_completion(&entity->entity_idle);
> > >>>>> +				if (dequeue) {
> > >>>>> +					rq->current_entity = entity;
> > >>>>> +					reinit_completion(&entity->entity_idle);
> > >>>>> +				}
> > >>>>>    				spin_unlock(&rq->lock);
> > >>>>>    				return entity;
> > >>>>>    			}
> > >>>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > >>>>>    	list_for_each_entry(entity, &rq->entities, list) {
> > >>>>>    		if (drm_sched_entity_is_ready(entity)) {
> > >>>>> -			rq->current_entity = entity;
> > >>>>> -			reinit_completion(&entity->entity_idle);
> > >>>>> +			if (dequeue) {
> > >>>>> +				rq->current_entity = entity;
> > >>>>> +				reinit_completion(&entity->entity_idle);
> > >>>>> +			}
> > >>>>>    			spin_unlock(&rq->lock);
> > >>>>>    			return entity;
> > >>>>>    		}
> > >>>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > >>>>>     * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> > >>>>>     *
> > >>>>>     * @rq: scheduler run queue to check.
> > >>>>> + * @dequeue: dequeue selected entity
> > >>>>>     *
> > >>>>>     * Find oldest waiting ready entity, returns NULL if none found.
> > >>>>>     */
> > >>>>>    static struct drm_sched_entity *
> > >>>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > >>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> > >>>>>    {
> > >>>>>    	struct rb_node *rb;
> > >>>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > >>>>>    		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> > >>>>>    		if (drm_sched_entity_is_ready(entity)) {
> > >>>>> -			rq->current_entity = entity;
> > >>>>> -			reinit_completion(&entity->entity_idle);
> > >>>>> +			if (dequeue) {
> > >>>>> +				rq->current_entity = entity;
> > >>>>> +				reinit_completion(&entity->entity_idle);
> > >>>>> +			}
> > >>>>>    			break;
> > >>>>>    		}
> > >>>>>    	}
> > >>>>> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > >>>>>    }
> > >>>>>    /**
> > >>>>> - * drm_sched_submit_queue - scheduler queue submission
> > >>>>> + * drm_sched_run_job_queue - queue job submission
> > >>>>>     * @sched: scheduler instance
> > >>>>>     */
> > >>>>> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > >>>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> > >>>>>    {
> > >>>>>    	if (!READ_ONCE(sched->pause_submit))
> > >>>>> -		queue_work(sched->submit_wq, &sched->work_submit);
> > >>>>> +		queue_work(sched->submit_wq, &sched->work_run_job);
> > >>>>> +}
> > >>>>> +
> > >>>>> +static struct drm_sched_entity *
> > >>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
> > >>>>> +
> > >>>>> +/**
> > >>>>> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> > >>>>> + * @sched: scheduler instance
> > >>>>> + */
> > >>>>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > >>>>> +{
> > >>>>> +	if (drm_sched_select_entity(sched, false))
> > >>>>> +		drm_sched_run_job_queue(sched);
> > >>>>> +}
> > >>>>> +
> > >>>>> +/**
> > >>>>> + * drm_sched_free_job_queue - queue free job
> > >>>>> + *
> > >>>>> + * @sched: scheduler instance to queue free job
> > >>>>> + */
> > >>>>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> > >>>>> +{
> > >>>>> +	if (!READ_ONCE(sched->pause_submit))
> > >>>>> +		queue_work(sched->submit_wq, &sched->work_free_job);
> > >>>>> +}
> > >>>>> +
> > >>>>> +/**
> > >>>>> + * drm_sched_free_job_queue_if_ready - queue free job if ready
> > >>>>> + *
> > >>>>> + * @sched: scheduler instance to queue free job
> > >>>>> + */
> > >>>>> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > >>>>> +{
> > >>>>> +	struct drm_sched_job *job;
> > >>>>> +
> > >>>>> +	spin_lock(&sched->job_list_lock);
> > >>>>> +	job = list_first_entry_or_null(&sched->pending_list,
> > >>>>> +				       struct drm_sched_job, list);
> > >>>>> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > >>>>> +		drm_sched_free_job_queue(sched);
> > >>>>> +	spin_unlock(&sched->job_list_lock);
> > >>>>>    }
> > >>>>>    /**
> > >>>>> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> > >>>>>    	dma_fence_get(&s_fence->finished);
> > >>>>>    	drm_sched_fence_finished(s_fence, result);
> > >>>>>    	dma_fence_put(&s_fence->finished);
> > >>>>> -	drm_sched_submit_queue(sched);
> > >>>>> +	drm_sched_free_job_queue(sched);
> > >>>>>    }
> > >>>>>    /**
> > >>>>> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> > >>>>>    void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> > >>>>>    {
> > >>>>>    	if (drm_sched_can_queue(sched))
> > >>>>> -		drm_sched_submit_queue(sched);
> > >>>>> +		drm_sched_run_job_queue(sched);
> > >>>>>    }
> > >>>>>    /**
> > >>>>>     * drm_sched_select_entity - Select next entity to process
> > >>>>>     *
> > >>>>>     * @sched: scheduler instance
> > >>>>> + * @dequeue: dequeue selected entity
> > >>>>>     *
> > >>>>>     * Returns the entity to process or NULL if none are found.
> > >>>>>     */
> > >>>>>    static struct drm_sched_entity *
> > >>>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > >>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
> > >>>>>    {
> > >>>>>    	struct drm_sched_entity *entity;
> > >>>>>    	int i;
> > >>>>> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > >>>>>    	/* Kernel run queue has higher priority than normal run queue*/
> > >>>>>    	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > >>>>>    		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > >>>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> > >>>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> > >>>>> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> > >>>>> +							dequeue) :
> > >>>>> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> > >>>>> +						      dequeue);
> > >>>>>    		if (entity)
> > >>>>>    			break;
> > >>>>>    	}
> > >>>>> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > >>>>>    EXPORT_SYMBOL(drm_sched_pick_best);
> > >>>>>    /**
> > >>>>> - * drm_sched_main - main scheduler thread
> > >>>>> + * drm_sched_free_job_work - worker to call free_job
> > >>>>>     *
> > >>>>> - * @param: scheduler instance
> > >>>>> + * @w: free job work
> > >>>>>     */
> > >>>>> -static void drm_sched_main(struct work_struct *w)
> > >>>>> +static void drm_sched_free_job_work(struct work_struct *w)
> > >>>>>    {
> > >>>>>    	struct drm_gpu_scheduler *sched =
> > >>>>> -		container_of(w, struct drm_gpu_scheduler, work_submit);
> > >>>>> -	struct drm_sched_entity *entity;
> > >>>>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
> > >>>>>    	struct drm_sched_job *cleanup_job;
> > >>>>> -	int r;
> > >>>>>    	if (READ_ONCE(sched->pause_submit))
> > >>>>>    		return;
> > >>>>>    	cleanup_job = drm_sched_get_cleanup_job(sched);  
> > >>>> I tried this patch with Nouveau and found a race condition:
> > >>>>
> > >>>> In drm_sched_run_job_work() the job is added to the pending_list via
> > >>>> drm_sched_job_begin(), then the run_job() callback is called and the scheduled
> > >>>> fence is signaled.
> > >>>>
> > >>>> However, in parallel drm_sched_get_cleanup_job() might be called from
> > >>>> drm_sched_free_job_work(), which picks the first job from the pending_list and
> > >>>> for the next job on the pending_list sets the scheduled fence' timestamp field.  
> > >> Well why can this happen in parallel? Either the work items are scheduled to
> > >> a single threaded work queue or you have protected the pending list with
> > >> some locks.
> > >>  
> > > Xe uses a single-threaded work queue, Nouveau does not (desired
> > > behavior).
> 
> I'm a bit worried that leaving this single vs multi-threaded wq
> decision to drivers is going to cause unnecessary pain, because what
> was previously a granted in term of run/cleanup execution order (thanks
> to the kthread+static-drm_sched_main-workflow approach) is now subject
> to the wq ordering guarantees, which depend on the wq type picked by
> the driver.

Not sure if this ends up to be much different. The only thing I could think of
is that IIRC with the kthread implementation cleanup was always preferred over
run. With a single threaded wq this should be a bit more balanced.

With a multi-threaded wq it's still the same, but run and cleanup can run
concurrently, which has the nice side effect that free_job() gets out of the
fence signaling path. At least as long as the workqueue has max_active > 1.
Which is one reason why I'm using a multi-threaded wq in Nouveau.

That latter seems a bit subtile, we probably need to document this aspect of
under which conditions free_job() is or is not within the fence signaling path.

- Danilo

> 
> > >
> > > The list of pending jobs is protected by a lock (safe), the race is:
> > >
> > > add job to pending list
> > > run_job
> > > signal scheduled fence
> > >
> > > dequeue from pending list
> > > free_job
> > > update timestamp
> > >
> > > Once a job is on the pending list its timestamp can be accessed which
> > > can blow up if scheduled fence isn't signaled or more specifically unless
> > > DMA_FENCE_FLAG_TIMESTAMP_BIT is set. 
> 
> Ah, so that's the reason for the TIMESTAMP test added in v3. Sorry for
> the noise in my v3 review, but I still think it'd be beneficial to have
> that change moved to its own commit.
> 

