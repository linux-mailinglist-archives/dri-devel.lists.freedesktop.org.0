Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F8497D61B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 15:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A5A10E0D9;
	Fri, 20 Sep 2024 13:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CTg296nC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFC510E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726838775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXcYYQkrxSCu2i7m1Dm0JoYuuYWsAWwy84bS735pEj0=;
 b=CTg296nCNA6AIJz05utf9QoJOD+f8cfKnix36WUPO1XjTYW76NpymLATc/YYEYow8+sQre
 jaNT6yJ4tNXzvh3EhQDKQwndEH2BIPYnXX2B3ldaZM9dK+lDMbd1ii1k1Rk4ALMpo9fBpI
 mgs42oXUL2jTqNTiEUv3Ot0i08QdaBI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-_SI69oy8PSyuKKlXPQ4wnQ-1; Fri, 20 Sep 2024 09:26:13 -0400
X-MC-Unique: _SI69oy8PSyuKKlXPQ4wnQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a8d1a00e0beso252160866b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 06:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726838772; x=1727443572;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T1tT22WWu9+0oNZnMl1lu9/mpFnv8cMtFXyEYYpnsDo=;
 b=sVpC408LTtFFsxPgAHdUWTSJ0VgLS4WVsc27YneMqZxXvGNzxCi+izDirQSOvGrJYw
 7kIuHp88PMINY8nBAtSjAQZlGHvlHBf8cnzUsk7+Qiw8Amt97JIuGJwN4oLo6OjWBD/r
 SqBvrzROqezvrhimrvBCs8tnvkp5mUQiF55CmBylJC/cFVzqfRMVqH1kbjotMpdiw7zV
 2QNRY9ZzIGaJAdkGFEJhPmLvYzW7ZH4DDXbv8gtrbO6kgHCzmbjOgm1T8tAK5Pv7l6vy
 LGKWrDz3l0PY/mKsC4jz7iBxfvut6AGJ3VdU1zTQF0CZ74NtONZb1u93NAykHr/zcTBS
 5P+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGgn2+JOqmfogpheIkR6OTivISYx8oSZEWmgc75UYnH/pH4rfUIZBePLK5IBjjQoDd/WWF9EFlu5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxbCWSIWJf9U2v/w8gRxSJG6Eb3YdW2z9dGwWy7IuMmQ28OiBs
 2dpTzhc1/BzP/6g9l2Q6pFdK78fpsmLvzEhfzfD5RRP3AWYLmH6j0W0xszh7FMEy61nLswG6iNQ
 xf35B8j4cjPoaYeSS6lmq5SpwKK5Lbe1iNUW81pVgHTrpO2Jb+x7N6U1bDaAs/XXxJA==
X-Received: by 2002:a17:907:86a6:b0:a8d:2fdb:b449 with SMTP id
 a640c23a62f3a-a90c1cb4e9dmr675544066b.16.1726838772446; 
 Fri, 20 Sep 2024 06:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDfOhuIrbrJJjLhEaAmguEgE2n0y2UL+Gixhz8c8CwECO4XtPLYEWNZ6VHN5/Cfv609eleRA==
X-Received: by 2002:a17:907:86a6:b0:a8d:2fdb:b449 with SMTP id
 a640c23a62f3a-a90c1cb4e9dmr675539766b.16.1726838772028; 
 Fri, 20 Sep 2024 06:26:12 -0700 (PDT)
Received: from [10.137.4.45] ([83.68.141.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612df75csm859422166b.149.2024.09.20.06.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 06:26:11 -0700 (PDT)
Message-ID: <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dakr@kernel.org, dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Date: Fri, 20 Sep 2024 15:26:07 +0200
In-Reply-To: <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2024-09-20 at 12:33 +0200, Christian K=C3=B6nig wrote:
> Am 20.09.24 um 10:57 schrieb Philipp Stanner:
> > On Wed, 2024-09-18 at 15:39 +0200, Christian K=C3=B6nig wrote:
> > > Tearing down the scheduler with jobs still on the pending list
> > > can
> > > lead to use after free issues. Add a warning if drivers try to
> > > destroy a scheduler which still has work pushed to the HW.
> > Did you have time yet to look into my proposed waitque-solution?
>=20
> I don't remember seeing anything. What have I missed?

https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/

>=20
> >=20
> > > When there are still entities with jobs the situation is even
> > > worse
> > > since the dma_fences for those jobs can never signal we can just
> > > choose between potentially locking up core memory management and
> > > random memory corruption. When drivers really mess it up that
> > > well
> > > let them run into a BUG_ON().
> > >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c | 19 +++++++++++++=
+++++-
> > > =C2=A0=C2=A01 file changed, 18 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index f093616fe53c..8a46fab5cdc8 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct
> > > drm_gpu_scheduler
> > > *sched)
> > I agree with Sima that it should first be documented in the
> > function's
> > docstring what the user is expected to have done before calling the
> > function.
>=20
> Good point, going to update the documentation as well.

Cool thing, thx.
Would be great if everything (not totally trivial) necessary to be done
before _fini() is mentioned.

One could also think about providing a hint at how the driver can do
that. AFAICS the only way for the driver to ensure that is to maintain
its own, separate list of submitted jobs.

P.

>=20
> Thanks,
> Christian.
>=20
> >=20
> > P.
> >=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09drm_sched_wqueue_stop(sched);
> > > =C2=A0=20
> > > +=09/*
> > > +=09 * Tearing down the scheduler wile there are still
> > > unprocessed jobs can
> > > +=09 * lead to use after free issues in the scheduler fence.
> > > +=09 */
> > > +=09WARN_ON(!list_empty(&sched->pending_list));
> > > +
> > > =C2=A0=C2=A0=09for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_r=
qs;
> > > i++)
> > > {
> > > =C2=A0=C2=A0=09=09struct drm_sched_rq *rq =3D sched->sched_rq[i];
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09=09spin_lock(&rq->lock);
> > > -=09=09list_for_each_entry(s_entity, &rq->entities,
> > > list)
> > > +=09=09list_for_each_entry(s_entity, &rq->entities,
> > > list) {
> > > +=09=09=09/*
> > > +=09=09=09 * The justification for this BUG_ON()
> > > is
> > > that tearing
> > > +=09=09=09 * down the scheduler while jobs are
> > > pending
> > > leaves
> > > +=09=09=09 * dma_fences unsignaled. Since we have
> > > dependencies
> > > +=09=09=09 * from the core memory management to
> > > eventually signal
> > > +=09=09=09 * dma_fences this can trivially lead to
> > > a
> > > system wide
> > > +=09=09=09 * stop because of a locked up memory
> > > management.
> > > +=09=09=09 */
> > > +=09=09=09BUG_ON(spsc_queue_count(&s_entity-
> > > > job_queue));
> > > +
> > > =C2=A0=C2=A0=09=09=09/*
> > > =C2=A0=C2=A0=09=09=09 * Prevents reinsertion and marks
> > > job_queue
> > > as idle,
> > > =C2=A0=C2=A0=09=09=09 * it will removed from rq in
> > > drm_sched_entity_fini
> > > =C2=A0=C2=A0=09=09=09 * eventually
> > > =C2=A0=C2=A0=09=09=09 */
> > > =C2=A0=C2=A0=09=09=09s_entity->stopped =3D true;
> > > +=09=09}
> > > =C2=A0=C2=A0=09=09spin_unlock(&rq->lock);
> > > =C2=A0=C2=A0=09=09kfree(sched->sched_rq[i]);
> > > =C2=A0=C2=A0=09}
>=20

