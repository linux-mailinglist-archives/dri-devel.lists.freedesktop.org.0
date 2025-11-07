Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13CC3EF97
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 09:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6453010EA3D;
	Fri,  7 Nov 2025 08:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="puG4CNvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4300710EA3E;
 Fri,  7 Nov 2025 08:33:45 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d2slp1Qtrz9tX6;
 Fri,  7 Nov 2025 09:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762504422; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TwOucyxdKzHHsR2SHO5/ChzLIhCyXMTTWSRL4ngYFyQ=;
 b=puG4CNvxO5QVUNAXS6dw7R3alVmnBNtWJsD7pZwc7ILXlT5pYV7Oey+kstxe/xgf+BMlar
 4HisVWt1hCDiXXynxR0UqEWdaJgrwnuj+Y5OdYXJkqOTgixoXquS6F9e8CnO9b4diDBZH2
 ltPm8wzSEEC+viUe18Mtkg9RhJZNgAr52FHbybg3CogWACnrCZ+f8tZJ0X7BiMfwoEJ70M
 xt3r4pUejcGgnqojBt9M0bpPURFsR792ml9S9ueNKStO5mIea1Pc1t7chyd8o5DHlofPA9
 yULQnvfiPIcUttQkl8uzsRvWsdP14KNaFNQNVyfv6UsxTKJhD+Rgo8D5IAm2nw==
Message-ID: <6f7b62fa37650c0a1bfdfe77e2b7b9e9a19eb234.camel@mailbox.org>
Subject: Re: [PATCH 09/20] drm/sched: use inline locks for the drm-sched-fence
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexdeucher@gmail.com,  simona.vetter@ffwll.ch, airlied@gmail.com,
 felix.kuehling@amd.com,  matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Fri, 07 Nov 2025 09:33:38 +0100
In-Reply-To: <21cbf337-45be-4418-b9dc-d3e2034b4962@ursulin.net>
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-10-christian.koenig@amd.com>
 <21cbf337-45be-4418-b9dc-d3e2034b4962@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: ffe30a0436634e732ff
X-MBO-RS-META: 4sbbiej76wc3q3nnbi7abr8ck3yn44f7
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-11-04 at 15:12 +0000, Tvrtko Ursulin wrote:
>=20
> On 31/10/2025 13:16, Christian K=C3=B6nig wrote:
> > Just as proof of concept and minor cleanup.

That's by the way why I'm asking whether this series is intended as an
RFC.

> >=20
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_fence.c | 11 +++++------
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ----
> > =C2=A0 2 files changed, 5 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index 9391d6f0dc01..7a94e03341cb 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -156,19 +156,19 @@ static void drm_sched_fence_set_deadline_finished=
(struct dma_fence *f,
> > =C2=A0=C2=A0	struct dma_fence *parent;
> > =C2=A0=C2=A0	unsigned long flags;
> > =C2=A0=20
> > -	spin_lock_irqsave(&fence->lock, flags);
> > +	dma_fence_lock(f, flags);
>=20
> Moving to dma_fence_lock should either be a separate patch or squashed=
=20
> into the one which converts many other drivers. Even a separate patch
> before that previous patch would be better.

Yes. +1

>=20
> Naming wise, I however still think dma_fence_lock_irqsave would probably=
=20
> be better to stick with the same pattern everyone is so used too.

I also think this would be better. Who knows, one day maybe someone
really wants a lock that definitely must not be irqsave for some
reason, and then the naming pattern would completely break.

> >=20
> >=20

[=E2=80=A6]

> > @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *f=
ence,
> > =C2=A0=C2=A0	fence->sched =3D entity->rq->sched;
> > =C2=A0=C2=A0	seq =3D atomic_inc_return(&entity->fence_seq);
> > =C2=A0=C2=A0	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_sch=
eduled,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->lock, entity->fence_con=
text, seq);
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, entity->fence_context, se=
q);
> > =C2=A0=C2=A0	dma_fence_init(&fence->finished, &drm_sched_fence_ops_fini=
shed,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->lock, entity->fence_con=
text + 1, seq);
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, entity->fence_context + 1=
, seq);
> > =C2=A0 }

Do we agree that there is no benefit in porting the scheduler to the
non-shared spinlock?

If so, I really prefer to not do it.


P.
