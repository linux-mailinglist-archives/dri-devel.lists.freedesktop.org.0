Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF20ECA79A5
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD6D10EB0F;
	Fri,  5 Dec 2025 12:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e3oyZzUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A78910EB0F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764938792;
 bh=t/V+YjPSO5AnpvzCRWDy+L2H2rs6qPSzjMbMlGl2lCY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e3oyZzUfq7aJC0qHJctcCoIEnz3YySE2q5C0rydAjC8rkJ3HtvMxk95jgPMuJAeKF
 djflUEOc5T5+KgCA8WelEOMr2mehDHEwYJ+tycRt8qZqw4oP19SWSKPo8nlGvxzjDB
 MAqZgrWrpceL6PGafrE+pYJbPTQfuKRnwrPiK0JFLkLYj5pNH4iy22epLlsgXK0Zga
 z/9NtV9FXwdEJIB6fb9vqgQUSaAoCBC0Se+BxE2uM+qoeSsu+7B6PmlV7OXP9yHYib
 eAUXRpn/wn/cbqcsB1uy8FdhOsuFujyr1JHt62m0A93zxyMPiRVihizTV9nPJ89PUY
 gX7JU42O0VIQg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AE4417E0360;
 Fri,  5 Dec 2025 13:46:31 +0100 (CET)
Date: Fri, 5 Dec 2025 13:46:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Grant Likely
 <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: fix for dma-fence safe access rules
Message-ID: <20251205134629.608df99b@fedora>
In-Reply-To: <CAPaKu7QuUS_Nkh9cya4Nf9_=gTEMSZR-iUrFXMYyV3C=2jFjhg@mail.gmail.com>
References: <20251204015034.841235-1-olvaffe@gmail.com>
 <4e59c6f8-bc9b-4fd5-9b0f-511cce760ac2@igalia.com>
 <CAPaKu7QuUS_Nkh9cya4Nf9_=gTEMSZR-iUrFXMYyV3C=2jFjhg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Thu, 4 Dec 2025 09:42:37 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Thu, Dec 4, 2025 at 1:27=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin@iga=
lia.com> wrote:
> >
> >
> > On 04/12/2025 01:50, Chia-I Wu wrote: =20
> > > Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
> > > the rules") details the dma-fence safe access rules. The most common
> > > culprit is that drm_sched_fence_get_timeline_name may race with
> > > group_free_queue.
> > >
> > > Fixes: d2624d90a0b77 ("drm/panthor: assign unique names to queues")
> > > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > > ---
> > >   drivers/gpu/drm/panthor/panthor_sched.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/dr=
m/panthor/panthor_sched.c
> > > index 33b9ef537e359..a8b1347e4da71 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > @@ -23,6 +23,7 @@
> > >   #include <linux/module.h>
> > >   #include <linux/platform_device.h>
> > >   #include <linux/pm_runtime.h>
> > > +#include <linux/rcupdate.h>
> > >
> > >   #include "panthor_devfreq.h"
> > >   #include "panthor_device.h"
> > > @@ -923,6 +924,9 @@ static void group_release_work(struct work_struct=
 *work)
> > >                                                  release_work);
> > >       u32 i;
> > >
> > > +     /* dma-fences may still be accessing group->queues under rcu lo=
ck. */
> > > +     synchronize_rcu();
> > > +
> > >       for (i =3D 0; i < group->queue_count; i++)
> > >               group_free_queue(group, group->queues[i]);
> > > =20
> >
> > This handles the shared queue->fence_ctx.lock as well (which is also
> > unsafe until Christian lands the inline lock, etc patch series) so it
> > looks good to me as well. =20
> Yeah, I will send v2 to drop the misleading "Fixes:" tag.
>=20
> FWIW, the UAF I saw was from accessing the string returned by
>=20
> static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
> {
>         struct drm_sched_fence *fence =3D to_drm_sched_fence(f);
>         return (const char *)fence->sched->name;
> }

IIRC, the only place calling this callback is some debugsfs knob
dumping fences attached to dma_buf resvs, and we're not supposed to
expose our driver fences to the outside world (we use the
drm_sched_fence proxy for that), so I'm curious where the access was
coming from.

>=20
> I thought it was "name" and added the "Fixes:" tag. But actually
> "sched" was also freed by group_release_work.
>=20
> >
> > Just to mention an alternative could be to simply switch release_work to
> > INIT_RCU_WORK/queue_rcu_work, but I am not sure if that has an advantag=
e.
> >
> > Regards,
> >
> > Tvrtko
> > =20

