Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AE1728575
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 18:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CAE10E5EE;
	Thu,  8 Jun 2023 16:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C435B10E5E8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 16:40:48 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q7Igh-0000rs-9q; Thu, 08 Jun 2023 18:40:39 +0200
Message-ID: <241d8d6699582df9e80785b264c4feacb00d12d7.camel@pengutronix.de>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
From: Lucas Stach <l.stach@pengutronix.de>
To: "Liu, Monk" <Monk.Liu@amd.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, Luben Tuikov
 <luben.tuikov@amd.com>
Date: Thu, 08 Jun 2023 18:40:37 +0200
In-Reply-To: <BL1PR12MB526995BE01F10A5F7D8158F184C19@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <BL1PR12MB52690CB11358D0298AABC8C084C09@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB526995BE01F10A5F7D8158F184C19@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: "Chen, JingWen" <JingWen.Chen2@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

and almost 2 years later I stumbled across this exact issue still being
present in the scheduler: if the driver bails out of the timeout
handling before calling drm_sched_stop(), the timeout job will be
leaked and the TDR timer will potentially not be restarted as the job
isn't put back in the pending_list.

How do we solve this? Apply the below suggestion?

Regards,
Lucas

Am Freitag, dem 20.08.2021 um 07:12 +0000 schrieb Liu, Monk:
> [AMD Official Use Only]
>=20
> @Daniel Vetter @Grodzovsky, Andrey @Koenig, Christian
> =20
> Do you have any concern on the kthread_park() approach ?
>=20
> Theoretically speaking sched_main shall run there exclusively with job_ti=
meout since they both touches jobs, and stop scheduler during job_timeout w=
on't impact performance since in that scenario
> There was already something wrong/stuck on that ring/scheduler=20
>=20
> Thanks=20
>=20
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>=20
> -----Original Message-----
> From: Liu, Monk=20
> Sent: Thursday, August 19, 2021 6:26 PM
> To: Daniel Vetter <daniel@ffwll.ch>; Grodzovsky, Andrey <Andrey.Grodzovsk=
y@amd.com>
> Cc: Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@am=
d.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd=
-gfx list <amd-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koe=
nig@amd.com>
> Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad =
job."
>=20
> [AMD Official Use Only]
>=20
> Hi Daniel
>=20
> > > Why can't we stop the scheduler thread first, so that there's guarant=
eed no race? I've recently had a lot of discussions with panfrost folks abo=
ut their reset that spawns across engines, and without stopping the schedul=
er thread first before you touch anything it's just plain impossible.
>=20
> Yeah we had this though as well in our mind.
>=20
> Our second approach is to call ktrhead_stop() in job_timedout() routine s=
o that  the "bad" job is guaranteed to be used without scheduler's touching=
 or freeing, Check this sample patch one as well please:
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index a2a9536..50a49cb 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -319,17 +319,12 @@ static void drm_sched_job_timedout(struct work_stru=
ct *work)
>         sched =3D container_of(work, struct drm_gpu_scheduler, work_tdr.w=
ork);
> =20
>         /* Protects against concurrent deletion in drm_sched_get_cleanup_=
job */
> +       kthread_park(sched->thread);
>         spin_lock(&sched->job_list_lock);
>         job =3D list_first_entry_or_null(&sched->pending_list,
>                                        struct drm_sched_job, list);
> =20
>         if (job) {
> -               /*
> -                * Remove the bad job so it cannot be freed by concurrent
> -                * drm_sched_cleanup_jobs. It will be reinserted back aft=
er sched->thread
> -                * is parked at which point it's safe.
> -                */
> -               list_del_init(&job->list);
>                 spin_unlock(&sched->job_list_lock);
> =20
>                 status =3D job->sched->ops->timedout_job(job);
> @@ -345,6 +340,7 @@ static void drm_sched_job_timedout(struct work_struct=
 *work)
>         } else {
>                 spin_unlock(&sched->job_list_lock);
>         }
> +       kthread_unpark(sched->thread);
> =20
>         if (status !=3D DRM_GPU_SCHED_STAT_ENODEV) {
>                 spin_lock(&sched->job_list_lock); @@ -393,20 +389,6 @@ vo=
id drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *ba=
d)
>         kthread_park(sched->thread);
> =20
>         /*
> -        * Reinsert back the bad job here - now it's safe as
> -        * drm_sched_get_cleanup_job cannot race against us and release t=
he
> -        * bad job at this point - we parked (waited for) any in progress
> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be c=
alled
> -        * now until the scheduler thread is unparked.
> -        */
> -       if (bad && bad->sched =3D=3D sched)
> -               /*
> -                * Add at the head of the queue to reflect it was the ear=
liest
> -                * job extracted.
> -                */
> -               list_add(&bad->list, &sched->pending_list);
> -
> -       /*
>          * Iterate the job list from later to  earlier one and either dea=
ctive
>          * their HW callbacks or remove them from pending list if they al=
ready
>          * signaled.
>=20
>=20
> Thanks=20
>=20
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>=20
> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Thursday, August 19, 2021 5:31 PM
> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher <alexdeucher@gmail.com>=
; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-=
devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>;=
 Liu, Monk <Monk.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad =
job."
>=20
> On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
> >=20
> > On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
> > > On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
> > > > On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > > > > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote=
:
> > > > > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > > > > >=20
> > > > > > > + dri-devel
> > > > > > >=20
> > > > > > > Since scheduler is a shared component, please add dri-devel=
=20
> > > > > > > on all scheduler patches.
> > > > > > >=20
> > > > > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@a=
md.com> wrote:
> > > > > > > > [Why]
> > > > > > > > for bailing job, this commit will delete it from pending=
=20
> > > > > > > > list thus the bailing job will never have a chance to be=
=20
> > > > > > > > resubmitted even in advance tdr mode.
> > > > > > > >=20
> > > > > > > > [How]
> > > > > > > > after embeded hw_fence into amdgpu_job is done, the race=
=20
> > > > > > > > condition that this commit tries to work around is=20
> > > > > > > > completely solved.So revert this commit.
> > > > > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c9=
0.
> > > > > > > > v2:
> > > > > > > > add dma_fence_get/put() around timedout_job to avoid=20
> > > > > > > > concurrent delete during processing timedout_job
> > > > > > > >=20
> > > > > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > > > > ---
> > > > > > > >     drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------=
------------
> > > > > > > >     1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > > >=20
> > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(stru=
ct work_struct *work)
> > > > > > > >     {
> > > > > > > >            struct drm_gpu_scheduler *sched;
> > > > > > > >            struct drm_sched_job *job;
> > > > > > > > +       struct dma_fence *fence;
> > > > > > > >            enum drm_gpu_sched_stat status =3D=20
> > > > > > > > DRM_GPU_SCHED_STAT_NOMINAL;
> > > > > > > >=20
> > > > > > > >            sched =3D container_of(work, struct=20
> > > > > > > > drm_gpu_scheduler, work_tdr.work); @@ -325,11 +326,10 @@=
=20
> > > > > > > > static void drm_sched_job_timedout(struct work_struct
> > > > > > > > *work)
> > > > > > > >=20
> > > > > > > >            if (job) {
> > > > > > > >                    /*
> > > > > > > > -                * Remove the bad job so it cannot be freed=
 by concurrent
> > > > > > > > -                * drm_sched_cleanup_jobs. It will be reins=
erted back after sched->thread
> > > > > > > > -                * is parked at which point it's safe.
> > > > > > > > +                * Get job->s_fence->parent here to avoid c=
oncurrent delete during
> > > > > > > > +                * processing timedout_job
> > > > > > > >                     */
> > > > > > > > -               list_del_init(&job->list);
> > > > > > > > +               fence =3D
> > > > > > > > + dma_fence_get(job->s_fence->parent);
> > > > > > While this is true for amdgpu, it has no meaning for other=20
> > > > > > drivers for whom we haven't done the refactoring of embedding=
=20
> > > > > > HW fence (parent) into the job structure.
> > > > > > In fact thinking
> > > > > > about it, unless you do the HW fence embedding for all the=20
> > > > > > drivers using the scheduler you cannot revert this patch or=20
> > > > > > you will just break them.
> > > > > btw, why did you do that embedding? I do still have my patches=
=20
> > > > > with dma_fence annotations floating around, but my idea at least=
=20
> > > > > was to fix that issue with a mempool, not with embeddeding. What=
=20
> > > > > was the motivation for embedding the wh fence?
> > > > > -Daniel
> > > >=20
> > > > The motivation was 2 fold, avoid memory allocation during jobs=20
> > > > submissions (HW fence allocation) because as Christian explained=
=20
> > > > this leads to deadlock with mm code during evictions due to memory=
=20
> > > > pressure (Christian can clarify if I messed
> > > Yeah that's the exact same thing I've chased with my dma_fence=20
> > > annotations, but thus far zero to none interested in getting it=20
> > > sorted. I think it'd be good to have some cross-driver agreement on=
=20
> > > how this should be solved before someone just charges ahead ...
> > >=20
> > > > this explanation). Second is to exactly revert this patch because=
=20
> > > > while it solved the issue described in the patch it created=20
> > > > another with drivers who baildc out early during TDR handling for=
=20
> > > > various reason and the job would just leak because it was already=
=20
> > > > removed form pending list.
> > > Can't we reinsert it before we restart the scheduler thread? It=20
> > > might need a separate list for that due to the lockless queue=20
> > > tricks. Or am I thinking about the wrong kind of "we lost the job"?
> > > -Danile
> >=20
> >=20
> > If you look at the original patch it would reinsert it even earlier -=
=20
> > right after stopping the=C2=A0 SW scheduler thread, and even then it wa=
s to=20
> > late for some drivers as they would decide to return back from their=
=20
> > TDR handler even before that. It is solvable but in an ugly way as far=
=20
> > as I see, you need to require each driver in his code to put the job=
=20
> > back in the list if they do it before reaching the place where=20
> > scheduler framework does it. Kind of spaghetti code seems to me.
>=20
> Hm yeah I didn't realize this all happens before we stop the scheduler th=
read.
>=20
> Why can't we stop the scheduler thread first, so that there's guaranteed =
no race? I've recently had a lot of discussions with panfrost folks about t=
heir reset that spawns across engines, and without stopping the scheduler t=
hread first before you touch anything it's just plain impossible.
>=20
> I'm also still not understanding what exactly you guys have done, can som=
eone please dig out the the amdgpu patches that motivate all this maybe tha=
t's clearer? A full explanation would still be good since I've only started=
 in scheduler stuff.
>=20
> Another thing I recently pondered for tdr races looking at i915 code is w=
hether the tdr should first block the completion fence for that job. My mot=
ivation is to have a race-free error capture (if the completion races then =
we might start evicting memory and everything goes boom), but maybe that he=
lps here too. Some kind of atomic "block this fence from completing thing.
>=20
> Or I'm I completely guessing in the wrong direction?
> -Daniel
>=20
> >=20
> > Andrey
> >=20
> >=20
> > >=20
> > > > Andrey
> > > >=20
> > > >=20
> > > > >=20
> > > > > > Andrey
> > > > > >=20
> > > > > >=20
> > > > > > > >                    spin_unlock(&sched->job_list_lock);
> > > > > > > >=20
> > > > > > > >                    status =3D
> > > > > > > > job->sched->ops->timedout_job(job);
> > > > > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(stru=
ct work_struct *work)
> > > > > > > >                            job->sched->ops->free_job(job);
> > > > > > > >                            sched->free_guilty =3D false;
> > > > > > > >                    }
> > > > > > > > +               dma_fence_put(fence);
> > > > > > > >            } else {
> > > > > > > >                    spin_unlock(&sched->job_list_lock);
> > > > > > > >            }
> > > > > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct=20
> > > > > > > > drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > > >=20
> > > > > > > >            kthread_park(sched->thread);
> > > > > > > >=20
> > > > > > > > -       /*
> > > > > > > > -        * Reinsert back the bad job here - now it's safe a=
s
> > > > > > > > -        * drm_sched_get_cleanup_job cannot race against us=
 and release the
> > > > > > > > -        * bad job at this point - we parked (waited for) a=
ny in progress
> > > > > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job=
 will not be called
> > > > > > > > -        * now until the scheduler thread is unparked.
> > > > > > > > -        */
> > > > > > > > -       if (bad && bad->sched =3D=3D sched)
> > > > > > > > -               /*
> > > > > > > > -                * Add at the head of the queue to reflect =
it was the earliest
> > > > > > > > -                * job extracted.
> > > > > > > > -                */
> > > > > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > > > > -
> > > > > > > >            /*
> > > > > > > >             * Iterate the job list from later to  earlier o=
ne and either deactive
> > > > > > > >             * their HW callbacks or remove them from=20
> > > > > > > > pending list if they already
> > > > > > > > --
> > > > > > > > 2.25.1
> > > > > > > >=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.f=
fwll.ch%2F&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7C27fcce7ca8dd4f39608508=
d962f40f33%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649622657672189%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJVZtg3AhbiA%2FDmVbNGo3MxVliO83nh8%2Fi50P=
CMsvwyY%3D&amp;reserved=3D0

