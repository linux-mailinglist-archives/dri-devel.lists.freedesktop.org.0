Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F152B76FC8A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 10:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5F810E6CF;
	Fri,  4 Aug 2023 08:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B30A89496
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 08:50:41 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94ea38c90ccso49318566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691139040; x=1691743840;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HA8dbKkV7nV4nxCBGGCJH4RgKZVHt3H6M9C/kpJrdcg=;
 b=fXpQvO2AkzkSySccabIQDFNO5YBZwEroMK29XNhDFjayW3ZVYzYq00PMqz4Yld9RTH
 W4Qdj/Y2M7TNm7rGNrbT2byCSSHob9O9acm7FlUdU7eWAhylL1C+Hz/KCXd+xkJ7drfe
 FrAstohgooW3ESY84uODVH40yIoxllbCOb1MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691139040; x=1691743840;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HA8dbKkV7nV4nxCBGGCJH4RgKZVHt3H6M9C/kpJrdcg=;
 b=G29fUz6xp2QltY7Hyhx2iH4ABvUpZp+C0i0K3fUhtWC49il8Hzt0qJ2ur1YQ2ujugv
 gIyqophlYO6tk4hK4DEurc1iz5pm653zT3lYRqZJNz1gud8EI9ced+PivhJjeULyeAk9
 BvVS+6ecvhkGtE9ji7ibFy0H2ceBFA9c0PXCtb1AO0aEfAHqNYiqwPja3IKk2ATn0twc
 m9kqBeZW5iOa867McMFpJFeLz0R8pdkZmyNetgndmjGTxEdCzgNriabdXoZ5vnKOlZld
 ih67I36iyVDCJZPBYYSp5bMSWLCwM+uO56D8W2FnAjI2JjXg3OZ9RRhQoPcwqW4Uuise
 oRdw==
X-Gm-Message-State: AOJu0Yy+Spo75t+UUmm4Qm6vi2Gdefg1cNkgsxEnuVxlF/G1B+Qq56W4
 /6PzKu5i5hzL2kp6i1H/MhqpHw==
X-Google-Smtp-Source: AGHT+IFS6fOk9WopnXlbIKLDAm0stoGlfbO8InvtypDnWiKgXkVyalJBk0y2RmFSFd6Hx0xiORvgUA==
X-Received: by 2002:a17:906:2d3:b0:99c:adfb:713 with SMTP id
 19-20020a17090602d300b0099cadfb0713mr119454ejk.5.1691139039641; 
 Fri, 04 Aug 2023 01:50:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 lt1-20020a170906fa8100b009934707378fsm987667ejb.87.2023.08.04.01.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 01:50:38 -0700 (PDT)
Date: Fri, 4 Aug 2023 10:50:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 4/8] drm/sched: Add generic scheduler message interface
Message-ID: <ZMy73BrH55NGq6Ba@phenom.ffwll.local>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-5-matthew.brost@intel.com>
 <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
 <CAKMK7uEdyV+Swtk50KqYUeCr5sOAceT_asB69_Ynz=Nx_z+HkQ@mail.gmail.com>
 <88b40106-e24f-e286-c3a3-363a6b2462ee@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88b40106-e24f-e286-c3a3-363a6b2462ee@amd.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: Matthew Brost <matthew.brost@intel.com>, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 robdclark@chromium.org, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 11:35:30AM +0200, Christian König wrote:
> Am 03.08.23 um 10:58 schrieb Daniel Vetter:
> > On Thu, 3 Aug 2023 at 10:53, Christian König <christian.koenig@amd.com> wrote:
> > > Am 01.08.23 um 22:50 schrieb Matthew Brost:
> > > > Add generic schedule message interface which sends messages to backend
> > > > from the drm_gpu_scheduler main submission thread. The idea is some of
> > > > these messages modify some state in drm_sched_entity which is also
> > > > modified during submission. By scheduling these messages and submission
> > > > in the same thread their is not race changing states in
> > > > drm_sched_entity.
> > > > 
> > > > This interface will be used in XE, new Intel GPU driver, to cleanup,
> > > > suspend, resume, and change scheduling properties of a drm_sched_entity.
> > > > 
> > > > The interface is designed to be generic and extendable with only the
> > > > backend understanding the messages.
> > > I'm still extremely frowned on this.
> > > 
> > > If you need this functionality then let the drivers decide which
> > > runqueue the scheduler should use.
> > > 
> > > When you then create a single threaded runqueue you can just submit work
> > > to it and serialize this with the scheduler work.
> > > 
> > > This way we wouldn't duplicate this core kernel function inside the
> > > scheduler.
> > Yeah that's essentially the design we picked for the tdr workers,
> > where some drivers have requirements that all tdr work must be done on
> > the same thread (because of cross-engine coordination issues). But
> > that would require that we rework the scheduler as a pile of
> > self-submitting work items, and I'm not sure that actually fits all
> > that well into the core workqueue interfaces either.
> 
> There were already patches floating around which did exactly that.
> 
> Last time I checked those were actually looking pretty good.
> 
> Additional to message passing advantage the real big issue with the
> scheduler and 1 to 1 mapping is that we create a kernel thread for each
> instance, which results in tons on overhead.
> 
> Just using a work item which is submitted to a work queue completely avoids
> that.

Hm I should have read the entire series first, since that does the
conversion still. Apologies for the confusion, and yeah we should be able
to just submit other work to the same wq with the first patch? And so
hand-rolling this infra here isn't needed at all?

Or what am I missing?

> Regards,
> Christian.
> 
> > 
> > Worst case I think this isn't a dead-end and can be refactored to
> > internally use the workqueue services, with the new functions here
> > just being dumb wrappers until everyone is converted over. So it
> > doesn't look like an expensive mistake, if it turns out to be a
> > mistake.
> > -Daniel
> > 
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/scheduler/sched_main.c | 52 +++++++++++++++++++++++++-
> > > >    include/drm/gpu_scheduler.h            | 29 +++++++++++++-
> > > >    2 files changed, 78 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index 2597fb298733..84821a124ca2 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -1049,6 +1049,49 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > > >    }
> > > >    EXPORT_SYMBOL(drm_sched_pick_best);
> > > > 
> > > > +/**
> > > > + * drm_sched_add_msg - add scheduler message
> > > > + *
> > > > + * @sched: scheduler instance
> > > > + * @msg: message to be added
> > > > + *
> > > > + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
> > > > + * Messages processing will stop if schedule run wq is stopped and resume when
> > > > + * run wq is started.
> > > > + */
> > > > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > > > +                    struct drm_sched_msg *msg)
> > > > +{
> > > > +     spin_lock(&sched->job_list_lock);
> > > > +     list_add_tail(&msg->link, &sched->msgs);
> > > > +     spin_unlock(&sched->job_list_lock);
> > > > +
> > > > +     drm_sched_run_wq_queue(sched);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_sched_add_msg);
> > > > +
> > > > +/**
> > > > + * drm_sched_get_msg - get scheduler message
> > > > + *
> > > > + * @sched: scheduler instance
> > > > + *
> > > > + * Returns NULL or message
> > > > + */
> > > > +static struct drm_sched_msg *
> > > > +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
> > > > +{
> > > > +     struct drm_sched_msg *msg;
> > > > +
> > > > +     spin_lock(&sched->job_list_lock);
> > > > +     msg = list_first_entry_or_null(&sched->msgs,
> > > > +                                    struct drm_sched_msg, link);
> > > > +     if (msg)
> > > > +             list_del(&msg->link);
> > > > +     spin_unlock(&sched->job_list_lock);
> > > > +
> > > > +     return msg;
> > > > +}
> > > > +
> > > >    /**
> > > >     * drm_sched_main - main scheduler thread
> > > >     *
> > > > @@ -1060,6 +1103,7 @@ static void drm_sched_main(struct work_struct *w)
> > > >                container_of(w, struct drm_gpu_scheduler, work_run);
> > > >        struct drm_sched_entity *entity;
> > > >        struct drm_sched_job *cleanup_job;
> > > > +     struct drm_sched_msg *msg;
> > > >        int r;
> > > > 
> > > >        if (READ_ONCE(sched->pause_run_wq))
> > > > @@ -1067,12 +1111,15 @@ static void drm_sched_main(struct work_struct *w)
> > > > 
> > > >        cleanup_job = drm_sched_get_cleanup_job(sched);
> > > >        entity = drm_sched_select_entity(sched);
> > > > +     msg = drm_sched_get_msg(sched);
> > > > 
> > > > -     if (!entity && !cleanup_job)
> > > > +     if (!entity && !cleanup_job && !msg)
> > > >                return; /* No more work */
> > > > 
> > > >        if (cleanup_job)
> > > >                sched->ops->free_job(cleanup_job);
> > > > +     if (msg)
> > > > +             sched->ops->process_msg(msg);
> > > > 
> > > >        if (entity) {
> > > >                struct dma_fence *fence;
> > > > @@ -1082,7 +1129,7 @@ static void drm_sched_main(struct work_struct *w)
> > > >                sched_job = drm_sched_entity_pop_job(entity);
> > > >                if (!sched_job) {
> > > >                        complete_all(&entity->entity_idle);
> > > > -                     if (!cleanup_job)
> > > > +                     if (!cleanup_job && !msg)
> > > >                                return; /* No more work */
> > > >                        goto again;
> > > >                }
> > > > @@ -1177,6 +1224,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > > 
> > > >        init_waitqueue_head(&sched->job_scheduled);
> > > >        INIT_LIST_HEAD(&sched->pending_list);
> > > > +     INIT_LIST_HEAD(&sched->msgs);
> > > >        spin_lock_init(&sched->job_list_lock);
> > > >        atomic_set(&sched->hw_rq_count, 0);
> > > >        INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > index df1993dd44ae..267bd060d178 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
> > > >        DRM_GPU_SCHED_STAT_ENODEV,
> > > >    };
> > > > 
> > > > +/**
> > > > + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
> > > > + * message
> > > > + *
> > > > + * Generic enough for backend defined messages, backend can expand if needed.
> > > > + */
> > > > +struct drm_sched_msg {
> > > > +     /** @link: list link into the gpu scheduler list of messages */
> > > > +     struct list_head                link;
> > > > +     /**
> > > > +      * @private_data: opaque pointer to message private data (backend defined)
> > > > +      */
> > > > +     void                            *private_data;
> > > > +     /** @opcode: opcode of message (backend defined) */
> > > > +     unsigned int                    opcode;
> > > > +};
> > > > +
> > > >    /**
> > > >     * struct drm_sched_backend_ops - Define the backend operations
> > > >     *  called by the scheduler
> > > > @@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
> > > >             * and it's time to clean it up.
> > > >         */
> > > >        void (*free_job)(struct drm_sched_job *sched_job);
> > > > +
> > > > +     /**
> > > > +      * @process_msg: Process a message. Allowed to block, it is this
> > > > +      * function's responsibility to free message if dynamically allocated.
> > > > +      */
> > > > +     void (*process_msg)(struct drm_sched_msg *msg);
> > > >    };
> > > > 
> > > >    /**
> > > > @@ -482,6 +505,7 @@ struct drm_sched_backend_ops {
> > > >     * @timeout: the time after which a job is removed from the scheduler.
> > > >     * @name: name of the ring for which this scheduler is being used.
> > > >     * @sched_rq: priority wise array of run queues.
> > > > + * @msgs: list of messages to be processed in @work_run
> > > >     * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
> > > >     *                 waits on this wait queue until all the scheduled jobs are
> > > >     *                 finished.
> > > > @@ -489,7 +513,7 @@ struct drm_sched_backend_ops {
> > > >     * @job_id_count: used to assign unique id to the each job.
> > > >     * @run_wq: workqueue used to queue @work_run
> > > >     * @timeout_wq: workqueue used to queue @work_tdr
> > > > - * @work_run: schedules jobs and cleans up entities
> > > > + * @work_run: schedules jobs, cleans up jobs, and processes messages
> > > >     * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > >     *            timeout interval is over.
> > > >     * @pending_list: the list of jobs which are currently in the job queue.
> > > > @@ -513,6 +537,7 @@ struct drm_gpu_scheduler {
> > > >        long                            timeout;
> > > >        const char                      *name;
> > > >        struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
> > > > +     struct list_head                msgs;
> > > >        wait_queue_head_t               job_scheduled;
> > > >        atomic_t                        hw_rq_count;
> > > >        atomic64_t                      job_id_count;
> > > > @@ -566,6 +591,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > > > 
> > > >    void drm_sched_job_cleanup(struct drm_sched_job *job);
> > > >    void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > > > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > > > +                    struct drm_sched_msg *msg);
> > > >    void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
> > > >    void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
> > > >    void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
