Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47B79CDA3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 12:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C30010E3F0;
	Tue, 12 Sep 2023 10:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA54D10E3D2;
 Tue, 12 Sep 2023 10:14:02 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D4DF1660731E;
 Tue, 12 Sep 2023 11:14:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694513641;
 bh=WuNFHn/io85Yv37Z2p6EDUALHH/EtdHaTdeD8u8A070=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m8lBBDfKkl+6XZe5KldNFTIxYdtMLe5gHlfEOxnuVIyrNZpWkpKcrVm7/wzBJ65T3
 mrNrzPZm7lads4ucEPU3z10h0dEaVP3u8yfbu0r5LiQGOihcFbuY0sH7j04h/pekwv
 qa1hl0Y+DZ9L80flxBcFrQ0Jwc6kLLCPtj77gQqoqidJoPG1SjqEMmPAXxkgSgtoHP
 5eTt9KgpmV2s7lpaQSp0VkGwY+UPKT021JBEAkasYr0rVxzQs69VbrD+1m6upSp02d
 VvQLWfoPApU1Aqb07TjELC6sjY6ZvPLZSz/zqZ8eKM31fHZla9IoZrUA4UJ406mYdM
 5pgTwm+y/d6IA==
Date: Tue, 12 Sep 2023 12:13:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 donald.robson@imgtec.com
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <20230912121357.4cc10dec@collabora.com>
In-Reply-To: <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
 <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
 <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Aug 2023 15:45:49 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 25.08.23 um 15:36 schrieb Matthew Brost:
> > On Fri, Aug 25, 2023 at 10:02:32AM +0200, Christian K=C3=B6nig wrote: =
=20
> >> Am 25.08.23 um 04:58 schrieb Matthew Brost: =20
> >>> On Fri, Aug 25, 2023 at 01:04:10AM +0200, Danilo Krummrich wrote: =20
> >>>> On Thu, Aug 10, 2023 at 07:31:32PM -0700, Matthew Brost wrote: =20
> >>>>> Rather than call free_job and run_job in same work item have a dedi=
cated
> >>>>> work item for each. This aligns with the design and intended use of=
 work
> >>>>> queues.
> >>>>>
> >>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-=
------
> >>>>>    include/drm/gpu_scheduler.h            |   8 +-
> >>>>>    2 files changed, 106 insertions(+), 39 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/d=
rm/scheduler/sched_main.c
> >>>>> index cede47afc800..b67469eac179 100644
> >>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sc=
hed_rq *rq,
> >>>>>     * drm_sched_rq_select_entity_rr - Select an entity which could =
provide a job to run
> >>>>>     *
> >>>>>     * @rq: scheduler run queue to check.
> >>>>> + * @dequeue: dequeue selected entity
> >>>>>     *
> >>>>>     * Try to find a ready entity, returns NULL if none found.
> >>>>>     */
> >>>>>    static struct drm_sched_entity *
> >>>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> >>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeu=
e)
> >>>>>    {
> >>>>>    	struct drm_sched_entity *entity;
> >>>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched=
_rq *rq)
> >>>>>    	if (entity) {
> >>>>>    		list_for_each_entry_continue(entity, &rq->entities, list) {
> >>>>>    			if (drm_sched_entity_is_ready(entity)) {
> >>>>> -				rq->current_entity =3D entity;
> >>>>> -				reinit_completion(&entity->entity_idle);
> >>>>> +				if (dequeue) {
> >>>>> +					rq->current_entity =3D entity;
> >>>>> +					reinit_completion(&entity->entity_idle);
> >>>>> +				}
> >>>>>    				spin_unlock(&rq->lock);
> >>>>>    				return entity;
> >>>>>    			}
> >>>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched=
_rq *rq)
> >>>>>    	list_for_each_entry(entity, &rq->entities, list) {
> >>>>>    		if (drm_sched_entity_is_ready(entity)) {
> >>>>> -			rq->current_entity =3D entity;
> >>>>> -			reinit_completion(&entity->entity_idle);
> >>>>> +			if (dequeue) {
> >>>>> +				rq->current_entity =3D entity;
> >>>>> +				reinit_completion(&entity->entity_idle);
> >>>>> +			}
> >>>>>    			spin_unlock(&rq->lock);
> >>>>>    			return entity;
> >>>>>    		}
> >>>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sche=
d_rq *rq)
> >>>>>     * drm_sched_rq_select_entity_fifo - Select an entity which prov=
ides a job to run
> >>>>>     *
> >>>>>     * @rq: scheduler run queue to check.
> >>>>> + * @dequeue: dequeue selected entity
> >>>>>     *
> >>>>>     * Find oldest waiting ready entity, returns NULL if none found.
> >>>>>     */
> >>>>>    static struct drm_sched_entity *
> >>>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequ=
eue)
> >>>>>    {
> >>>>>    	struct rb_node *rb;
> >>>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sch=
ed_rq *rq)
> >>>>>    		entity =3D rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> >>>>>    		if (drm_sched_entity_is_ready(entity)) {
> >>>>> -			rq->current_entity =3D entity;
> >>>>> -			reinit_completion(&entity->entity_idle);
> >>>>> +			if (dequeue) {
> >>>>> +				rq->current_entity =3D entity;
> >>>>> +				reinit_completion(&entity->entity_idle);
> >>>>> +			}
> >>>>>    			break;
> >>>>>    		}
> >>>>>    	}
> >>>>> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sc=
hed_rq *rq)
> >>>>>    }
> >>>>>    /**
> >>>>> - * drm_sched_submit_queue - scheduler queue submission
> >>>>> + * drm_sched_run_job_queue - queue job submission
> >>>>>     * @sched: scheduler instance
> >>>>>     */
> >>>>> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> >>>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sche=
d)
> >>>>>    {
> >>>>>    	if (!READ_ONCE(sched->pause_submit))
> >>>>> -		queue_work(sched->submit_wq, &sched->work_submit);
> >>>>> +		queue_work(sched->submit_wq, &sched->work_run_job);
> >>>>> +}
> >>>>> +
> >>>>> +static struct drm_sched_entity *
> >>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequ=
eue);
> >>>>> +
> >>>>> +/**
> >>>>> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> >>>>> + * @sched: scheduler instance
> >>>>> + */
> >>>>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_schedu=
ler *sched)
> >>>>> +{
> >>>>> +	if (drm_sched_select_entity(sched, false))
> >>>>> +		drm_sched_run_job_queue(sched);
> >>>>> +}
> >>>>> +
> >>>>> +/**
> >>>>> + * drm_sched_free_job_queue - queue free job
> >>>>> + *
> >>>>> + * @sched: scheduler instance to queue free job
> >>>>> + */
> >>>>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sch=
ed)
> >>>>> +{
> >>>>> +	if (!READ_ONCE(sched->pause_submit))
> >>>>> +		queue_work(sched->submit_wq, &sched->work_free_job);
> >>>>> +}
> >>>>> +
> >>>>> +/**
> >>>>> + * drm_sched_free_job_queue_if_ready - queue free job if ready
> >>>>> + *
> >>>>> + * @sched: scheduler instance to queue free job
> >>>>> + */
> >>>>> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_sched=
uler *sched)
> >>>>> +{
> >>>>> +	struct drm_sched_job *job;
> >>>>> +
> >>>>> +	spin_lock(&sched->job_list_lock);
> >>>>> +	job =3D list_first_entry_or_null(&sched->pending_list,
> >>>>> +				       struct drm_sched_job, list);
> >>>>> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> >>>>> +		drm_sched_free_job_queue(sched);
> >>>>> +	spin_unlock(&sched->job_list_lock);
> >>>>>    }
> >>>>>    /**
> >>>>> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched=
_job *s_job, int result)
> >>>>>    	dma_fence_get(&s_fence->finished);
> >>>>>    	drm_sched_fence_finished(s_fence, result);
> >>>>>    	dma_fence_put(&s_fence->finished);
> >>>>> -	drm_sched_submit_queue(sched);
> >>>>> +	drm_sched_free_job_queue(sched);
> >>>>>    }
> >>>>>    /**
> >>>>> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gp=
u_scheduler *sched)
> >>>>>    void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sch=
ed)
> >>>>>    {
> >>>>>    	if (drm_sched_can_queue(sched))
> >>>>> -		drm_sched_submit_queue(sched);
> >>>>> +		drm_sched_run_job_queue(sched);
> >>>>>    }
> >>>>>    /**
> >>>>>     * drm_sched_select_entity - Select next entity to process
> >>>>>     *
> >>>>>     * @sched: scheduler instance
> >>>>> + * @dequeue: dequeue selected entity
> >>>>>     *
> >>>>>     * Returns the entity to process or NULL if none are found.
> >>>>>     */
> >>>>>    static struct drm_sched_entity *
> >>>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequ=
eue)
> >>>>>    {
> >>>>>    	struct drm_sched_entity *entity;
> >>>>>    	int i;
> >>>>> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_schedul=
er *sched)
> >>>>>    	/* Kernel run queue has higher priority than normal run queue*/
> >>>>>    	for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D DRM_SCHED_PRIOR=
ITY_MIN; i--) {
> >>>>>    		entity =3D sched->sched_policy =3D=3D DRM_SCHED_POLICY_FIFO ?
> >>>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> >>>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> >>>>> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> >>>>> +							dequeue) :
> >>>>> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> >>>>> +						      dequeue);
> >>>>>    		if (entity)
> >>>>>    			break;
> >>>>>    	}
> >>>>> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_schedule=
r **sched_list,
> >>>>>    EXPORT_SYMBOL(drm_sched_pick_best);
> >>>>>    /**
> >>>>> - * drm_sched_main - main scheduler thread
> >>>>> + * drm_sched_free_job_work - worker to call free_job
> >>>>>     *
> >>>>> - * @param: scheduler instance
> >>>>> + * @w: free job work
> >>>>>     */
> >>>>> -static void drm_sched_main(struct work_struct *w)
> >>>>> +static void drm_sched_free_job_work(struct work_struct *w)
> >>>>>    {
> >>>>>    	struct drm_gpu_scheduler *sched =3D
> >>>>> -		container_of(w, struct drm_gpu_scheduler, work_submit);
> >>>>> -	struct drm_sched_entity *entity;
> >>>>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
> >>>>>    	struct drm_sched_job *cleanup_job;
> >>>>> -	int r;
> >>>>>    	if (READ_ONCE(sched->pause_submit))
> >>>>>    		return;
> >>>>>    	cleanup_job =3D drm_sched_get_cleanup_job(sched); =20
> >>>> I tried this patch with Nouveau and found a race condition:
> >>>>
> >>>> In drm_sched_run_job_work() the job is added to the pending_list via
> >>>> drm_sched_job_begin(), then the run_job() callback is called and the=
 scheduled
> >>>> fence is signaled.
> >>>>
> >>>> However, in parallel drm_sched_get_cleanup_job() might be called from
> >>>> drm_sched_free_job_work(), which picks the first job from the pendin=
g_list and
> >>>> for the next job on the pending_list sets the scheduled fence' times=
tamp field. =20
> >> Well why can this happen in parallel? Either the work items are schedu=
led to
> >> a single threaded work queue or you have protected the pending list wi=
th
> >> some locks.
> >> =20
> > Xe uses a single-threaded work queue, Nouveau does not (desired
> > behavior).

I'm a bit worried that leaving this single vs multi-threaded wq
decision to drivers is going to cause unnecessary pain, because what
was previously a granted in term of run/cleanup execution order (thanks
to the kthread+static-drm_sched_main-workflow approach) is now subject
to the wq ordering guarantees, which depend on the wq type picked by
the driver.

> >
> > The list of pending jobs is protected by a lock (safe), the race is:
> >
> > add job to pending list
> > run_job
> > signal scheduled fence
> >
> > dequeue from pending list
> > free_job
> > update timestamp
> >
> > Once a job is on the pending list its timestamp can be accessed which
> > can blow up if scheduled fence isn't signaled or more specifically unle=
ss
> > DMA_FENCE_FLAG_TIMESTAMP_BIT is set.=20

Ah, so that's the reason for the TIMESTAMP test added in v3. Sorry for
the noise in my v3 review, but I still think it'd be beneficial to have
that change moved to its own commit.
