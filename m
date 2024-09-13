Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCFB977FE0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 14:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3D510E0F2;
	Fri, 13 Sep 2024 12:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XNQPQzOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4395C10E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 12:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726230625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAUWNdKU+oEKHU5N320kYs7CGOFYeT0EEXREboB9OMo=;
 b=XNQPQzOYGU+ksizT49N938CQaRAbPM6FL/+PsD2Z2ikQ0UPGdwQW6OFMLc6W7tyJgKbz1v
 GKaQ3XOLWsFh5/yG5MBlXSxvZ/XcosZHQaiHeTVk1dEg6pDhfoyfd/0aOcIzmk2buzdNei
 8C2r7QSdnhr0AkePo666HPq7MHnmaYU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-2DV832ITMCuuzpy4mc7NzA-1; Fri, 13 Sep 2024 08:30:23 -0400
X-MC-Unique: 2DV832ITMCuuzpy4mc7NzA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374ba33b2d2so967211f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 05:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726230623; x=1726835423;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d0VoKMuWqnaEWqybDQCpxkWHJw8Kz2YNIn1hGCLOjlE=;
 b=LEfahNJmShnHZ818iA0yFD4ov/siPPxMjCPPr+65RheHjz7SKQVF1tmqUN9BYwkHzL
 QRW2ev7qgnE0ANZsgB+ttig+Dlf5fY+1u7IeA64sq6S7zy3pgf/jGUUe3SRolNVflDPK
 3oopnynNXOFKZcGoQCFi/KUjAs1putRb7b4RBTZ03kjazEGKcQUxcKKrxZGr5Du/+OBJ
 btcvDQD4mwJOuPGNZbJ26lKdpieXmgIjhFdw5o4B5fGjPpT3T4Vqg4QxDPRO6lrRQrJJ
 NJBk1RAOyt12I44K0bQIHqXLly2CL4+o+kgpZgQKUcq3hrJ41kqhW1n14+dquwcuORfD
 THlQ==
X-Gm-Message-State: AOJu0YwUReLiQQIIjA8JqqWAiIXuFNQk2BvhIoceHdn7kJCeG01bMEEm
 mep/JMActMR0MGTSPgyiK8nPJq1XjEPp7xVEBA9JmASuaehMyXtXAMWFgbSKP29P5lwK2NW2Qve
 Ld1TpUhAYnuxqz+emS4r0VO05s6OJOn9s2nLgrFzch/S8XiuG39WYEWN+UvaBKHOKZA==
X-Received: by 2002:a05:6000:184c:b0:374:c022:fa76 with SMTP id
 ffacd0b85a97d-378c2d5ab83mr4216137f8f.37.1726230622642; 
 Fri, 13 Sep 2024 05:30:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUISq1VQj0veSF27+xlc8jHLNsZrB5BBsx5hH5wxw1335M+m80qsLu9zGMev40PhP0WosCXw==
X-Received: by 2002:a05:6000:184c:b0:374:c022:fa76 with SMTP id
 ffacd0b85a97d-378c2d5ab83mr4216112f8f.37.1726230622082; 
 Fri, 13 Sep 2024 05:30:22 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d2a:6400:5050:48a2:62f2:4d16])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b21sm16786689f8f.49.2024.09.13.05.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 05:30:21 -0700 (PDT)
Message-ID: <8a646b5c871fe454d6f194a54fa65d67f3ae5366.camel@redhat.com>
Subject: Re: [PATCH v2 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Luben Tuikov
 <ltuikov89@gmail.com>,  Matthew Brost <matthew.brost@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich
 <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Sep 2024 14:30:20 +0200
In-Reply-To: <92a123f1-73c9-45a1-8e0a-af72dd0a70e7@ursulin.net>
References: <20240828094133.17402-2-pstanner@redhat.com>
 <92a123f1-73c9-45a1-8e0a-af72dd0a70e7@ursulin.net>
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

On Fri, 2024-09-13 at 12:56 +0100, Tvrtko Ursulin wrote:
>=20
> Hi,
>=20
> On 28/08/2024 10:41, Philipp Stanner wrote:
> > drm_sched_job_init() has no control over how users allocate struct
> > drm_sched_job. Unfortunately, the function can also not set some
> > struct
> > members such as job->sched.
>=20
> job->sched usage from within looks like a bug. But not related to the
> memset you add.
>=20
> For this one something like this looks easiest for a start:
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c=20
> b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..877113b01af2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -788,7 +788,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * or worse--a blank screen--leave a trail in=
 the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * logs, so this can be debugged easier.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 drm_err(job->sched, "%s: entity has no rq!\n",
> __func__);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 pr_err("%s: entity has no rq!\n", __func__);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to
> variable=20
> number of run-queues")
> Cc: <stable@vger.kernel.org> # v6.7+

Danilo and I already solved that:

https://lore.kernel.org/all/20240827074521.12828-2-pstanner@redhat.com/


>=20
> > This could theoretically lead to UB by users dereferencing the
> > struct's
> > pointer members too early.
>=20
> Hmm if drm_sched_job_init returned an error callers should not=20
> dereference anything. What was actually the issue you were debugging?

I was learning about the scheduler, wrote a dummy driver and had
awkward behavior. Turned out it was this pointer not being initialized.
I would have seen it immediately if it were NULL.

The actual issue was and is IMO that a function called
drm_sched_job_init() initializes the job. But it doesn't, it only
partially initializes it. Only after drm_sched_job_arm() ran you're
actually ready to go.

>=20
> Adding a memset is I think not the best solution since it is very
> likely=20
> redundant to someone doing a kzalloc in the first place.

It is redundant in most cases, but it is effectively for free. I
measured the runtime with 1e6 jobs with and without memset and there
was no difference.


P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > It is easier to debug such issues if these pointers are initialized
> > to
> > NULL, so dereferencing them causes a NULL pointer exception.
> > Accordingly, drm_sched_entity_init() does precisely that and
> > initializes
> > its struct with memset().
> >=20
> > Initialize parameter "job" to 0 in drm_sched_job_init().
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > No changes in v2.
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
> > =C2=A0 1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 356c30fa24a8..b0c8ad10b419 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -806,6 +806,14 @@ int drm_sched_job_init(struct drm_sched_job
> > *job,
> > =C2=A0=C2=A0=09=09return -EINVAL;
> > =C2=A0=C2=A0=09}
> > =C2=A0=20
> > +=09/*
> > +=09 * We don't know for sure how the user has allocated.
> > Thus, zero the
> > +=09 * struct so that unallowed (i.e., too early) usage of
> > pointers that
> > +=09 * this function does not set is guaranteed to lead to a
> > NULL pointer
> > +=09 * exception instead of UB.
> > +=09 */
> > +=09memset(job, 0, sizeof(*job));
> > +
> > =C2=A0=C2=A0=09job->entity =3D entity;
> > =C2=A0=C2=A0=09job->credits =3D credits;
> > =C2=A0=C2=A0=09job->s_fence =3D drm_sched_fence_alloc(entity, owner);
>=20

