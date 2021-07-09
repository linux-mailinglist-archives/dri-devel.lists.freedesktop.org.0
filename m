Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1F3C1FE5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 09:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235126E943;
	Fri,  9 Jul 2021 07:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00CD6E943
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 07:14:37 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id u11so11146151oiv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 00:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ya8GlcHq82Sssvq9vPLaah0EzxkfAPc2tlFitRK0CdU=;
 b=VCe65SJpcjspdUebPHi/+qMmZawvGSigUEUVCUlx9MZVLM2Hsp+wv7jan7uW+OPNIK
 lGP/FoW/vQRQMAoTZ1SSsg/beZwy3JnMlnLVgpw31WNoD7TcT6RAlABYjeoouanvVng+
 fIcUPyVoav380hegRQo4m8hMI596Ehw6192jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ya8GlcHq82Sssvq9vPLaah0EzxkfAPc2tlFitRK0CdU=;
 b=NQ/KnEPi9QoIdOfPt4CWQVcqKhr1yV05rwZ2AauMYpLpNBdxvAN6DauwsR3iAPn6gH
 nUbdLTMFI6VV0eeNwCZtpgRoAd2+2NW3EU05LDylgC4fdu1EVHI1piQsePow28I6XVeT
 rTwFAkWZUG8duzq98/IYxdbMUhypFSwDT4Ouowd+6xOSjHYS/s3l6ex4T2kqg0hxB1q0
 T9dWlmnG54m3GHYg/mh1l8oUyPQHwAFREuaf5NpIUgQDM/qp6Oefdcshe4Gu5HeYy/nR
 voQoYDaT6Kz/661UTLKTp+EDtoRtMpk8gTIYEO6bo9Xfg3Qs7vdY89WogiB1s9oBb4yo
 Gp4g==
X-Gm-Message-State: AOAM532x2iUCSwpQf9L8YoH15/237FDOcNhrZzi6BZUY/APWZmHNfP7c
 l2C6lORdEwBkVifON4pZfnNwJLqSECqfkX6iL6sHFw==
X-Google-Smtp-Source: ABdhPJz76zXNo14DrkjBixLf9bl4gs4ommvlhJ1tZH33nN7ajPByODdzrFWDoql7dvT+mECZ8eaHtcPERcFT540eHL0=
X-Received: by 2002:aca:4b55:: with SMTP id y82mr2267340oia.14.1625814877133; 
 Fri, 09 Jul 2021 00:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-2-daniel.vetter@ffwll.ch>
 <5588d1c3-833b-bd95-69e6-a103f2e8affa@amd.com>
In-Reply-To: <5588d1c3-833b-bd95-69e6-a103f2e8affa@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 9 Jul 2021 09:14:25 +0200
Message-ID: <CAKMK7uFuqXdbvqDCerXHW5kiT=LUZEoyrjFMgHjkUQdS1eidDw@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] drm/sched: entity->rq selection cannot fail
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 9, 2021 at 8:53 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
> Am 08.07.21 um 19:37 schrieb Daniel Vetter:
> > If it does, someone managed to set up a sched_entity without
> > schedulers, which is just a driver bug.
>
> NAK, it is perfectly valid for rq selection to fail.

There isn't a better way to explain stuff to someone who's new to the
code and tries to improve it with docs than to NAK stuff with
incomplete explanations?

> See drm_sched_pick_best():
>
>                  if (!sched->ready) {
>                          DRM_WARN("scheduler %s is not ready, skipping",
>                                   sched->name);
>                          continue;
>                  }
>
> This can happen when a device reset fails for some engine.

Well yeah I didn't expect amdgpu to just change this directly, so I
didn't find it. Getting an ENOENT on a hw failure instead of an EIO is
a bit interesting semantics I guess, also what happens with the jobs
which raced against the scheduler not being ready? I'm not seeing any
checks for ready in the main scheduler logic so this at least looks
somewhat accidental as a side effect, also no other driver than amdgpu
communitcates that reset failed back to drm/sched like this. They seem
to just not, and I guess timeout on the next request will get us into
an endless reset loop?
-Daniel


>
> Regards,
> Christian.
>
> >
> > We BUG_ON() here because in the next patch drm_sched_job_init() will
> > be split up, with drm_sched_job_arm() never failing. And that's the
> > part where the rq selection will end up in.
> >
> > Note that if having an empty sched_list set on an entity is indeed a
> > valid use-case, we can keep that check in job_init even after the split
> > into job_init/arm.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Jack Zhang <Jack.Zhang1@amd.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
> >   drivers/gpu/drm/scheduler/sched_main.c   | 3 +--
> >   2 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 79554aa4dbb1..6fc116ee7302 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -45,7 +45,7 @@
> >    * @guilty: atomic_t set to 1 when a job on this queue
> >    *          is found to be guilty causing a timeout
> >    *
> > - * Note: the sched_list should have at least one element to schedule
> > + * Note: the sched_list must have at least one element to schedule
> >    *       the entity
> >    *
> >    * Returns 0 on success or a negative error code on failure.
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 33c414d55fab..01dd47154181 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -586,8 +586,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >       struct drm_gpu_scheduler *sched;
> >
> >       drm_sched_entity_select_rq(entity);
> > -     if (!entity->rq)
> > -             return -ENOENT;
> > +     BUG_ON(!entity->rq);
> >
> >       sched =3D entity->rq->sched;
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
