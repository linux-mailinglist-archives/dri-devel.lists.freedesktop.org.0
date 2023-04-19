Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1089E6E7696
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 11:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2480710E912;
	Wed, 19 Apr 2023 09:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F85510E90D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 09:44:19 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pp4MG-00024s-3b; Wed, 19 Apr 2023 11:44:12 +0200
Message-ID: <04f039ac71f3c0685a849b492478d18ec6ea4d11.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
From: Lucas Stach <l.stach@pengutronix.de>
To: Steven Price <steven.price@arm.com>, Danilo Krummrich <dakr@redhat.com>,
 luben.tuikov@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
Date: Wed, 19 Apr 2023 11:44:10 +0200
In-Reply-To: <ddaf4984-6f5a-404c-df9d-537245e99420@arm.com>
References: <20230418100453.4433-1-dakr@redhat.com>
 <ddaf4984-6f5a-404c-df9d-537245e99420@arm.com>
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

Hi Steven,

Am Mittwoch, dem 19.04.2023 um 10:39 +0100 schrieb Steven Price:
> On 18/04/2023 11:04, Danilo Krummrich wrote:
> > It already happend a few times that patches slipped through which
> > implemented access to an entity through a job that was already removed
> > from the entities queue. Since jobs and entities might have different
> > lifecycles, this can potentially cause UAF bugs.
> >=20
> > In order to make it obvious that a jobs entity pointer shouldn't be
> > accessed after drm_sched_entity_pop_job() was called successfully, set
> > the jobs entity pointer to NULL once the job is removed from the entity
> > queue.
> >=20
> > Moreover, debugging a potential NULL pointer dereference is way easier
> > than potentially corrupted memory through a UAF.
> >=20
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>=20
> This triggers a splat for me (with Panfrost driver), the cause of which
> is the following code in drm_sched_get_cleanup_job():
>=20
> 	if (job) {
> 		job->entity->elapsed_ns +=3D ktime_to_ns(
> 			ktime_sub(job->s_fence->finished.timestamp,
> 				  job->s_fence->scheduled.timestamp));
> 	}
>=20
> which indeed is accessing entity after the job has been returned from
> drm_sched_entity_pop_job(). And obviously job->entity is a NULL pointer
> with this patch.
>=20
> I'm afraid I don't fully understand the lifecycle so I'm not sure if
> this is simply exposing an existing bug in drm_sched_get_cleanup_job()
> or if this commit needs to be reverted.
>=20
Not sure which tree you are on. The offending commit has been reverted
in 6.3-rc5.

Regards,
Lucas

> Thanks,
>=20
> Steve
>=20
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
> >  drivers/gpu/drm/scheduler/sched_main.c   | 4 ++++
> >  2 files changed, 10 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 15d04a0ec623..a9c6118e534b 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -448,6 +448,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(str=
uct drm_sched_entity *entity)
> >  			drm_sched_rq_update_fifo(entity, next->submit_ts);
> >  	}
> > =20
> > +	/* Jobs and entities might have different lifecycles. Since we're
> > +	 * removing the job from the entities queue, set the jobs entity poin=
ter
> > +	 * to NULL to prevent any future access of the entity through this jo=
b.
> > +	 */
> > +	sched_job->entity =3D NULL;
> > +
> >  	return sched_job;
> >  }
> > =20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 9b16480686f6..e89a3e469cd5 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -42,6 +42,10 @@
> >   *    the hardware.
> >   *
> >   * The jobs in a entity are always scheduled in the order that they we=
re pushed.
> > + *
> > + * Note that once a job was taken from the entities queue and pushed t=
o the
> > + * hardware, i.e. the pending queue, the entity must not be referenced=
 anymore
> > + * through the jobs entity pointer.
> >   */
> > =20
> >  #include <linux/kthread.h>
>=20

