Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B147073142F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AE110E4AA;
	Thu, 15 Jun 2023 09:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6729610E4AA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:38:01 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q9jQT-00073g-PQ; Thu, 15 Jun 2023 11:37:57 +0200
Message-ID: <10d769fb8eb39b439b3cc793664a242e443261a7.camel@pengutronix.de>
Subject: Re: [PATCH 3/8] drm/etnaviv: move runtime PM handling to events
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 15 Jun 2023 11:37:56 +0200
In-Reply-To: <CAH9NwWfj0CKm3Q_bVjWi7PhhWfxQxeGfu1mo9bWdSe7xXrRW_w@mail.gmail.com>
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
 <20230607130223.3533464-3-l.stach@pengutronix.de>
 <CAH9NwWfj0CKm3Q_bVjWi7PhhWfxQxeGfu1mo9bWdSe7xXrRW_w@mail.gmail.com>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Am Mittwoch, dem 14.06.2023 um 20:41 +0200 schrieb Christian Gmeiner:
> Hi Lucas
>=20
> >=20
> > Conceptually events are the right abstraction to handle the GPU
> > runtime PM state: as long as any event is pending the GPU can not
> > be idle. Events are also properly freed and reallocated when the
> > GPU has been reset after a hang.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 -
> >  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 27 ++++++++++++--------
> >  3 files changed, 16 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/et=
naviv/etnaviv_gem.h
> > index baa81cbf701a..a42d260cac2c 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> > @@ -97,7 +97,6 @@ struct etnaviv_gem_submit {
> >         struct list_head node; /* GPU active submit list */
> >         struct etnaviv_cmdbuf cmdbuf;
> >         struct pid *pid;       /* submitting process */
> > -       bool runtime_resumed;
> >         u32 exec_state;
> >         u32 flags;
> >         unsigned int nr_pmrs;
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu=
/drm/etnaviv/etnaviv_gem_submit.c
> > index 45403ea38906..2416c526f9b0 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > @@ -362,9 +362,6 @@ static void submit_cleanup(struct kref *kref)
> >                         container_of(kref, struct etnaviv_gem_submit, r=
efcount);
> >         unsigned i;
> >=20
> > -       if (submit->runtime_resumed)
> > -               pm_runtime_put_autosuspend(submit->gpu->dev);
> > -
> >         if (submit->cmdbuf.suballoc)
> >                 etnaviv_cmdbuf_free(&submit->cmdbuf);
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.c
> > index 4e18aa8566c6..54a1249c5bca 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -1139,7 +1139,8 @@ static int event_alloc(struct etnaviv_gpu *gpu, u=
nsigned nr_events,
> >         unsigned int *events)
> >  {
> >         unsigned long timeout =3D msecs_to_jiffies(10 * 10000);
> > -       unsigned i, acquired =3D 0;
> > +       unsigned i, acquired =3D 0, rpm_count =3D 0;
>=20
> rpm is the short form of runtime power management?
>=20
Yes, it's used in this way in multiple places in the kernel. Do you
think it's clear enough from the code what's going on to keep it that
way or should I change it to a longer name?

Regards,
Lucas

> > +       int ret;
> >=20
> >         for (i =3D 0; i < nr_events; i++) {
> >                 unsigned long ret;
> > @@ -1148,6 +1149,7 @@ static int event_alloc(struct etnaviv_gpu *gpu, u=
nsigned nr_events,
> >=20
> >                 if (!ret) {
> >                         dev_err(gpu->dev, "wait_for_completion_timeout =
failed");
> > +                       ret =3D -EBUSY;
> >                         goto out;
> >                 }
> >=20
> > @@ -1167,13 +1169,23 @@ static int event_alloc(struct etnaviv_gpu *gpu,=
 unsigned nr_events,
> >=20
> >         spin_unlock(&gpu->event_spinlock);
> >=20
> > +       for (i =3D 0; i < nr_events; i++) {
> > +               ret =3D pm_runtime_resume_and_get(gpu->dev);
> > +               if (ret)
> > +                       goto out_rpm;
> > +               rpm_count++;
> > +       }
> > +
> >         return 0;
> >=20
> > +out_rpm:
> > +       for (i =3D 0; i < rpm_count; i++)
> > +               pm_runtime_put_autosuspend(gpu->dev);
> >  out:
> >         for (i =3D 0; i < acquired; i++)
> >                 complete(&gpu->event_free);
> >=20
> > -       return -EBUSY;
> > +       return ret;
> >  }
> >=20
> >  static void event_free(struct etnaviv_gpu *gpu, unsigned int event)
> > @@ -1185,6 +1197,8 @@ static void event_free(struct etnaviv_gpu *gpu, u=
nsigned int event)
> >                 clear_bit(event, gpu->event_bitmap);
> >                 complete(&gpu->event_free);
> >         }
> > +
> > +       pm_runtime_put_autosuspend(gpu->dev);
> >  }
> >=20
> >  /*
> > @@ -1327,15 +1341,6 @@ struct dma_fence *etnaviv_gpu_submit(struct etna=
viv_gem_submit *submit)
> >         unsigned int i, nr_events =3D 1, event[3];
> >         int ret;
> >=20
> > -       if (!submit->runtime_resumed) {
> > -               ret =3D pm_runtime_get_sync(gpu->dev);
> > -               if (ret < 0) {
> > -                       pm_runtime_put_noidle(gpu->dev);
> > -                       return NULL;
> > -               }
> > -               submit->runtime_resumed =3D true;
> > -       }
> > -
> >         /*
> >          * if there are performance monitor requests we need to have
> >          * - a sync point to re-configure gpu and process ETNA_PM_PROCE=
SS_PRE
> > --
> > 2.39.2
> >=20
>=20
>=20

