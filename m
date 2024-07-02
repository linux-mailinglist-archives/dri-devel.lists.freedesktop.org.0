Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80010923969
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 11:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B079F10E585;
	Tue,  2 Jul 2024 09:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0CD10E585
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 09:15:18 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOZbQ-0004N7-LM; Tue, 02 Jul 2024 11:15:08 +0200
Message-ID: <35f24b9172893cad50d6e36ff667576f8d3a2fc0.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] drm/scheduler: implement hardware time accounting
From: Lucas Stach <l.stach@pengutronix.de>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date: Tue, 02 Jul 2024 11:15:07 +0200
In-Reply-To: <cf3beee0-14a2-4ad8-8c3d-7ba8a09c6608@ursulin.net>
References: <20240701171447.3823888-1-l.stach@pengutronix.de>
 <cf3beee0-14a2-4ad8-8c3d-7ba8a09c6608@ursulin.net>
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

Hi Tvrtko,

Am Dienstag, dem 02.07.2024 um 09:42 +0100 schrieb Tvrtko Ursulin:
> Hi,
>=20
> I few questions below.
>=20
> On 01/07/2024 18:14, Lucas Stach wrote:
> > From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> >=20
> > Multiple drivers came up with the requirement to measure how
> > much runtime each entity accumulated on the HW.
> >=20
> > A previous attempt of accounting this had to be reverted because
> > HW submissions can have a lifetime exceeding that of the entity
> > originally issuing them.
> >=20
> > Amdgpu on the other hand solves this task by keeping track of
> > all the submissions and calculating how much time they have used
> > on demand.
> >=20
> > Move this approach over into the scheduler to provide an easy to
> > use interface for all drivers.
> >=20
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> > v2:
> > - rebase to v6.10-rc1
> > - fix for non-power-of-two number of HW submission
> > - add comment explaining the logic behind the fence tracking array
> > - rename some function and fix documentation
> > ---
> >   drivers/gpu/drm/scheduler/sched_entity.c | 82 +++++++++++++++++++++++=
-
> >   drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++++
> >   include/drm/gpu_scheduler.h              | 31 +++++++++
> >   3 files changed, 131 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 58c8161289fe..d678d0b9b29e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -62,7 +62,9 @@ int drm_sched_entity_init(struct drm_sched_entity *en=
tity,
> >   			  unsigned int num_sched_list,
> >   			  atomic_t *guilty)
> >   {
> > -	if (!(entity && sched_list && (num_sched_list =3D=3D 0 || sched_list[=
0])))
> > +	unsigned int i, num_submissions =3D 0;
> > +
> > +	if (!entity || !sched_list)
> >   		return -EINVAL;
> >  =20
> >   	memset(entity, 0, sizeof(struct drm_sched_entity));
> > @@ -98,6 +100,11 @@ int drm_sched_entity_init(struct drm_sched_entity *=
entity,
> >   						 (s32) DRM_SCHED_PRIORITY_KERNEL);
> >   		}
> >   		entity->rq =3D sched_list[0]->sched_rq[entity->priority];
> > +
> > +		for (i =3D 0; i < num_sched_list; ++i) {
> > +			num_submissions =3D max(num_submissions,
> > +					      sched_list[i]->credit_limit);
> > +		}
>=20
> Does this work (in concept and naming) for all drivers if introduction=
=20
> of credits broke the 1:1 between jobs and hw "ring" capacity?
>=20
Functionally it's still correct, as we simply cycle through the array a
bit slower when a job takes multiple credits. It doesn't violate any
fundamental assumption. However, ...

> How big is the array for different drivers?
>=20
... the tracking array is getting really big for drivers which allow
for a large number of credits. Worst cases in order are PVR with 64k
and nouveau with 1024 credits. The memory required to hold the pointers
to the fences, as well as referenced fences is huge.

I guess we need something more clever like a xarray to track the fences
and clean up signalled fences on each submit or something like that.

Regards,
Lucas

> >   	}
> >  =20
> >   	init_completion(&entity->entity_idle);
> > @@ -110,11 +117,52 @@ int drm_sched_entity_init(struct drm_sched_entity=
 *entity,
> >  =20
> >   	atomic_set(&entity->fence_seq, 0);
> >   	entity->fence_context =3D dma_fence_context_alloc(2);
> > +	spin_lock_init(&entity->accounting_lock);
> > +
> > +	if (!num_submissions)
> > +		return 0;
> > +
> > +	entity->max_hw_submissions =3D num_submissions;
> > +	entity->hw_submissions =3D kcalloc(num_submissions, sizeof(void *),
> > +					 GFP_KERNEL);
> > +	if (!entity->hw_submissions)
> > +		return -ENOMEM;
> >  =20
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL(drm_sched_entity_init);
> >  =20
> > +/**
> > + * drm_sched_entity_time_spent - Accumulated HW runtime used by this e=
ntity
> > + * @entity: scheduler entity to check
> > + *
> > + * Get the current accumulated HW runtime used by all submissions made=
 through
> > + * this entity.
> > + */
> > +ktime_t drm_sched_entity_time_spent(struct drm_sched_entity *entity)
> > +{
> > +	ktime_t result;
> > +	unsigned int i;
> > +
> > +	if (!entity->max_hw_submissions)
> > +		return ns_to_ktime(0);
> > +
> > +	spin_lock(&entity->accounting_lock);
> > +	result =3D entity->hw_time_used;
> > +	for (i =3D 0; i < entity->max_hw_submissions; ++i) {
> > +		struct drm_sched_fence *fence =3D entity->hw_submissions[i];
> > +
> > +		if (!fence)
> > +			continue;
> > +
> > +		result =3D ktime_add(result, drm_sched_fence_get_runtime(fence));
>=20
> Does this end up counting from when jobs have been submitted to the hw=
=20
> backend and may not be actually executing?
>=20
> Say if a driver configures a backend N deep and is filled with N jobs,=
=20
> while in actuality they are executed sequentially one at a time, the=20
> time as reported here would over-account by some series such as=20
> (job[0].finish - job[0].submit) + ... + (job[N].finish - job[N].submit)?
>=20
> Or in other words if one submits N jobs to a ring serving an 1-wide hw=
=20
> backend, will we see "N*100%" utilisation instead of "100%" if sampling=
=20
> while first job is still executing, the rest queued behind it?
>=20
> Regards,
>=20
> Tvrtko
>=20
> > +	}
> > +	spin_unlock(&entity->accounting_lock);
> > +
> > +	return result;
> > +}
> > +EXPORT_SYMBOL(drm_sched_entity_time_spent);
> > +
> >   /**
> >    * drm_sched_entity_modify_sched - Modify sched of an entity
> >    * @entity: scheduler entity to init
> > @@ -326,6 +374,8 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
> >    */
> >   void drm_sched_entity_fini(struct drm_sched_entity *entity)
> >   {
> > +	unsigned int i;
> > +
> >   	/*
> >   	 * If consumption of existing IBs wasn't completed. Forcefully remov=
e
> >   	 * them here. Also makes sure that the scheduler won't touch this en=
tity
> > @@ -341,6 +391,9 @@ void drm_sched_entity_fini(struct drm_sched_entity =
*entity)
> >  =20
> >   	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> >   	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> > +	for (i =3D 0; i < entity->max_hw_submissions; ++i)
> > +		dma_fence_put(&entity->hw_submissions[i]->scheduled);
> > +	kfree(entity->hw_submissions);
> >   }
> >   EXPORT_SYMBOL(drm_sched_entity_fini);
> >  =20
> > @@ -522,6 +575,33 @@ struct drm_sched_job *drm_sched_entity_pop_job(str=
uct drm_sched_entity *entity)
> >   	 */
> >   	sched_job->entity =3D NULL;
> >  =20
> > +	if (entity->max_hw_submissions) {
> > +		struct drm_sched_fence *fence =3D sched_job->s_fence;
> > +		unsigned int idx =3D fence->scheduled.seqno;
> > +
> > +		dma_fence_get(&fence->scheduled);
> > +		idx %=3D entity->max_hw_submissions;
> > +
> > +		spin_lock(&entity->accounting_lock);
> > +		/*
> > +		 * The fence seqno is dense and monotonically increasing. By
> > +		 * cycling through a array sized to match the maximum number of
> > +		 * submissions queued in the HW we can be sure that once we need
> > +		 * to reuse a slot the fence stored in this slot refers to a
> > +		 * retired submission and we can safely sum up the accumulated
> > +		 * runtime and dispose the fence.
> > +		 */
> > +		swap(fence, entity->hw_submissions[idx]);
> > +		if (fence) {
> > +			ktime_t runtime =3D drm_sched_fence_get_runtime(fence);
> > +
> > +			entity->hw_time_used =3D ktime_add(entity->hw_time_used,
> > +							 runtime);
> > +			dma_fence_put(&fence->scheduled);
> > +		}
> > +		spin_unlock(&entity->accounting_lock);
> > +	}
> > +
> >   	return sched_job;
> >   }
> >  =20
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index 0f35f009b9d3..55981ada1829 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -82,6 +82,25 @@ void drm_sched_fence_finished(struct drm_sched_fence=
 *fence, int result)
> >   	dma_fence_signal(&fence->finished);
> >   }
> >  =20
> > +/**
> > + * drm_sched_fence_get_runtime - accumulated runtime on HW
> > + * @fence: fence
> > + *
> > + * Calculate how much runtime this fence has accumulated on the HW.
> > + */
> > +ktime_t drm_sched_fence_get_runtime(struct drm_sched_fence *fence)
> > +{
> > +	/* When the fence is not scheduled, it can't have accumulated runtime=
 */
> > +	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->scheduled.flags))
> > +		return ns_to_ktime(0);
> > +
> > +	/* When it is still running, calculate runtime until now */
> > +	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->finished.flags))
> > +		return ktime_sub(ktime_get(), fence->scheduled.timestamp);
> > +
> > +	return ktime_sub(fence->finished.timestamp, fence->scheduled.timestam=
p);
> > +}
> > +
> >   static const char *drm_sched_fence_get_driver_name(struct dma_fence *=
fence)
> >   {
> >   	return "drm_sched";
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 5acc64954a88..52bcff324a92 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -238,6 +238,35 @@ struct drm_sched_entity {
> >   	 */
> >   	struct rb_node			rb_tree_node;
> >  =20
> > +	/**
> > +	 * @accounting_lock:
> > +	 *
> > +	 * Protects the array of fences tracking the in-flight HW submissions
> > +	 * and the accumulator counter.
> > +	 */
> > +	spinlock_t			accounting_lock;
> > +
> > +	/**
> > +	 * @hw_time_used:
> > +	 *
> > +	 * How much HW runtime has been accumulated by retired submissions
> > +	 * from this entity.
> > +	 */
> > +	ktime_t				hw_time_used;
> > +
> > +	/**
> > +	 * @max_hw_submissions:
> > +	 *
> > +	 * Maximum number of submissions queued in the HW.
> > +	 */
> > +	unsigned int			max_hw_submissions;
> > +
> > +	/**
> > +	 * @hw_submissions:
> > +	 *
> > +	 * Scheduler fences of the HW submissions in flight.
> > +	 */
> > +	struct drm_sched_fence		**hw_submissions;
> >   };
> >  =20
> >   /**
> > @@ -600,6 +629,7 @@ int drm_sched_entity_init(struct drm_sched_entity *=
entity,
> >   			  struct drm_gpu_scheduler **sched_list,
> >   			  unsigned int num_sched_list,
> >   			  atomic_t *guilty);
> > +ktime_t drm_sched_entity_time_spent(struct drm_sched_entity *entity);
> >   long drm_sched_entity_flush(struct drm_sched_entity *entity, long tim=
eout);
> >   void drm_sched_entity_fini(struct drm_sched_entity *entity);
> >   void drm_sched_entity_destroy(struct drm_sched_entity *entity);
> > @@ -620,6 +650,7 @@ void drm_sched_fence_free(struct drm_sched_fence *f=
ence);
> >   void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
> >   			       struct dma_fence *parent);
> >   void drm_sched_fence_finished(struct drm_sched_fence *fence, int resu=
lt);
> > +ktime_t drm_sched_fence_get_runtime(struct drm_sched_fence *fence);
> >  =20
> >   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sch=
ed);
> >   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
> >=20
> > base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0

