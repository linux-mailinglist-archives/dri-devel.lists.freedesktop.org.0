Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F16E772F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 12:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA6810E921;
	Wed, 19 Apr 2023 10:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17710E921
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 10:07:17 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pp4iT-0005ux-SB; Wed, 19 Apr 2023 12:07:09 +0200
Message-ID: <87ed5324a69b5f1cc1ab5be2483f224afacf5824.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
From: Lucas Stach <l.stach@pengutronix.de>
To: Steven Price <steven.price@arm.com>, Danilo Krummrich <dakr@redhat.com>,
 luben.tuikov@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
Date: Wed, 19 Apr 2023 12:07:08 +0200
In-Reply-To: <dcd957cf-8e26-11f1-2ac1-0fdd8541eed3@arm.com>
References: <20230418100453.4433-1-dakr@redhat.com>
 <ddaf4984-6f5a-404c-df9d-537245e99420@arm.com>
 <04f039ac71f3c0685a849b492478d18ec6ea4d11.camel@pengutronix.de>
 <dcd957cf-8e26-11f1-2ac1-0fdd8541eed3@arm.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 19.04.2023 um 10:53 +0100 schrieb Steven Price:
> On 19/04/2023 10:44, Lucas Stach wrote:
> > Hi Steven,
> >=20
> > Am Mittwoch, dem 19.04.2023 um 10:39 +0100 schrieb Steven Price:
> > > On 18/04/2023 11:04, Danilo Krummrich wrote:
> > > > It already happend a few times that patches slipped through which
> > > > implemented access to an entity through a job that was already remo=
ved
> > > > from the entities queue. Since jobs and entities might have differe=
nt
> > > > lifecycles, this can potentially cause UAF bugs.
> > > >=20
> > > > In order to make it obvious that a jobs entity pointer shouldn't be
> > > > accessed after drm_sched_entity_pop_job() was called successfully, =
set
> > > > the jobs entity pointer to NULL once the job is removed from the en=
tity
> > > > queue.
> > > >=20
> > > > Moreover, debugging a potential NULL pointer dereference is way eas=
ier
> > > > than potentially corrupted memory through a UAF.
> > > >=20
> > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > >=20
> > > This triggers a splat for me (with Panfrost driver), the cause of whi=
ch
> > > is the following code in drm_sched_get_cleanup_job():
> > >=20
> > > 	if (job) {
> > > 		job->entity->elapsed_ns +=3D ktime_to_ns(
> > > 			ktime_sub(job->s_fence->finished.timestamp,
> > > 				  job->s_fence->scheduled.timestamp));
> > > 	}
> > >=20
> > > which indeed is accessing entity after the job has been returned from
> > > drm_sched_entity_pop_job(). And obviously job->entity is a NULL point=
er
> > > with this patch.
> > >=20
> > > I'm afraid I don't fully understand the lifecycle so I'm not sure if
> > > this is simply exposing an existing bug in drm_sched_get_cleanup_job(=
)
> > > or if this commit needs to be reverted.
> > >=20
> > Not sure which tree you are on. The offending commit has been reverted
> > in 6.3-rc5.
>=20
> This is in drm-misc-next - I'm not sure which "offending commit" you are
> referring to. I'm referring to:
>=20
> 96c7c2f4d5bd ("drm/scheduler: set entity to NULL in
> drm_sched_entity_pop_job()")
>=20
> which was merged yesterday to drm-misc-next (and is currently the top
> commit).
>=20
> Is there another commit which has been reverted elsewhere which is
> conflicting?
>=20
The commit which introduces the use-after-free, which is now upgraded
to the above NULL ptr dereference is df622729ddbf ("drm/scheduler:
track GPU active time per entity") and has been reverted in
baad10973fdb ("Revert "drm/scheduler: track GPU active time per
entity"). The revert is upstream in 6.3-rc5.

Regards,
Lucas


> Steve
>=20
> > Regards,
> > Lucas
> >=20
> > > Thanks,
> > >=20
> > > Steve
> > >=20
> > > > ---
> > > >  drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
> > > >  drivers/gpu/drm/scheduler/sched_main.c   | 4 ++++
> > > >  2 files changed, 10 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu=
/drm/scheduler/sched_entity.c
> > > > index 15d04a0ec623..a9c6118e534b 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > @@ -448,6 +448,12 @@ struct drm_sched_job *drm_sched_entity_pop_job=
(struct drm_sched_entity *entity)
> > > >  			drm_sched_rq_update_fifo(entity, next->submit_ts);
> > > >  	}
> > > > =20
> > > > +	/* Jobs and entities might have different lifecycles. Since we're
> > > > +	 * removing the job from the entities queue, set the jobs entity =
pointer
> > > > +	 * to NULL to prevent any future access of the entity through thi=
s job.
> > > > +	 */
> > > > +	sched_job->entity =3D NULL;
> > > > +
> > > >  	return sched_job;
> > > >  }
> > > > =20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/d=
rm/scheduler/sched_main.c
> > > > index 9b16480686f6..e89a3e469cd5 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -42,6 +42,10 @@
> > > >   *    the hardware.
> > > >   *
> > > >   * The jobs in a entity are always scheduled in the order that the=
y were pushed.
> > > > + *
> > > > + * Note that once a job was taken from the entities queue and push=
ed to the
> > > > + * hardware, i.e. the pending queue, the entity must not be refere=
nced anymore
> > > > + * through the jobs entity pointer.
> > > >   */
> > > > =20
> > > >  #include <linux/kthread.h>
> > >=20
> >=20
>=20

