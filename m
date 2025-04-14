Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87962A8891B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 18:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D05810E206;
	Mon, 14 Apr 2025 16:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MP87YMnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E8310E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744649788;
 bh=6OpGJCyJUOcBlVWLO7rOs9y2+iVUF98SmlUbFpGYdq8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MP87YMnVw+AmlpnZ/hARvTOJr1BB8Oxd0Da4BElyauKcEs9E4e/TcdWmNMqLGs9Ym
 7Lx5AfrttTtiY+mLb4MxQOjM+ss89ebmPcGYxmszzD49lhXIuxA7Lz0eOxY0oTwdRC
 kgoN1J2DTyNVvCAEzecwFZpup3jvxsV/IYJUHWQHKIcClb51+6SoydBizonntn/85W
 tFpj0yPZs46hJy9BjkbX8Vu5Fn4Fwvtz5i0GANnV00PgyZargYgNidu11YvIs07pal
 4FYUy+uNv9mlGTmcK14QNFnfx84L91xMQG6iaAIlbznKUJCi1XkEr/u9CvqyXLHVWx
 0J8F2/UbaeVWA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CC32A17E0809;
 Mon, 14 Apr 2025 18:56:27 +0200 (CEST)
Date: Mon, 14 Apr 2025 18:56:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: "Steven Price" <steven.price@arm.com>, "Liviu Dudau"
 <liviu.dudau@arm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Heiko Stuebner"
 <heiko@sntech.de>, "kernel" <kernel@collabora.com>, "Daniel Stone"
 <daniels@collabora.com>, "dri-devel" <dri-devel@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm/panthor: Make the timeout per-queue instead of
 per-job
Message-ID: <20250414185623.628543fb@collabora.com>
In-Reply-To: <19635301a95.f859dc6e883590.3071663948141072628@collabora.com>
References: <20250410125734.1005532-1-ashley.smith@collabora.com>
 <3a5306c8-df44-430a-a24e-72d71b2dc8c1@arm.com>
 <19635301a95.f859dc6e883590.3071663948141072628@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Mon, 14 Apr 2025 17:44:27 +0100
Ashley Smith <ashley.smith@collabora.com> wrote:

> On Fri, 11 Apr 2025 16:51:52 +0100 Steven Price  wrote:
>  > Hi Ashley,=20
>  > =20
>  > On 10/04/2025 13:57, Ashley Smith wrote:  =20
>  > > The timeout logic provided by drm_sched leads to races when we try=20
>  > > to suspend it while the drm_sched workqueue queues more jobs. Let's=
=20
>  > > overhaul the timeout handling in panthor to have our own delayed wor=
k=20
>  > > that's resumed/suspended when a group is resumed/suspended. When an=
=20
>  > > actual timeout occurs, we call drm_sched_fault() to report it=20
>  > > through drm_sched, still. But otherwise, the drm_sched timeout is=20
>  > > disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control o=
f=20
>  > > how we protect modifications on the timer.=20
>  > >=20
>  > > One issue seems to be when we call drm_sched_suspend_timeout() from=
=20
>  > > both queue_run_job() and tick_work() which could lead to races due t=
o=20
>  > > drm_sched_suspend_timeout() not having a lock. Another issue seems t=
o=20
>  > > be in queue_run_job() if the group is not scheduled, we suspend the=
=20
>  > > timeout again which undoes what drm_sched_job_begin() did when calli=
ng=20
>  > > drm_sched_start_timeout(). So the timeout does not reset when a job=
=20
>  > > is finished.=20
>  > >=20
>  > > Co-developed-by: Boris Brezillon boris.brezillon@collabora.com>=20
>  > > Signed-off-by: Boris Brezillon boris.brezillon@collabora.com>=20
>  > > Tested-by: Daniel Stone daniels@collabora.com>=20
>  > > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")=
=20
>  > > Signed-off-by: Ashley Smith ashley.smith@collabora.com>=20
>  > > ---=20
>  > >  drivers/gpu/drm/panthor/panthor_sched.c | 244 +++++++++++++++++----=
---=20
>  > >  1 file changed, 177 insertions(+), 67 deletions(-)=20
>  > >=20
>  > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/d=
rm/panthor/panthor_sched.c=20
>  > > index 446ec780eb4a..32f5a75bc4f6 100644=20
>  > > --- a/drivers/gpu/drm/panthor/panthor_sched.c=20
>  > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c  =20
>  > =20
>  > [...]=20
>  >   =20
>  > > @@ -2727,8 +2784,17 @@ void panthor_sched_suspend(struct panthor_dev=
ice *ptdev)=20
>  > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * automatically terminate all active groups, so let's=20
>  > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * force the state to halted here.=20
>  > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 */=20
>  > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0if (csg_slot->group->state !=3D PANTHOR_CS_GROUP_TERMINATED)=20
>  > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0if (csg_slot->group->state !=3D PANTHOR_CS_GROUP_TERMINATED) {=20
>  > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0csg_slot->group->state =3D PANTHOR_CS_GROUP_T=
ERMINATED;=20
>  > > +=20
>  > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Reset the queue slots manually if the term=
ination=20
>  > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* request failed.=20
>  > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/=20
>  > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i queue_count; i++) {=20
>  > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (group->queues[i])=
=20
>  > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0cs_slot_reset_locked(ptdev, csg_id, i);=20
>  > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
>  > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0}=20
>  > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0slot_mask &=3D ~BIT(csg_id);=20
>  > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
>  > >  =C2=A0=C2=A0=C2=A0=C2=A0}  =20
>  > =20
>  > So this seems to be the only change from v2 (a changelog can be=20
>  > helpful!). And I'm not convinced it belongs in this patch? It's not ju=
st=20
>  > "[making] the timeout per-queue instead of per-job".=20
>  > =20
>  > I haven't dug through the details, but I think this belongs in a=20
>  > separate patch.

Actually, it's related, but I agree it's not clear: we call
cs_slot_reset_locked(), but the thing we're really interested in is the
cancellation of the timeout work. Before the timeout changes, the
timeout work was part of drm_sched and was cancelled inside
drm_sched_stop(). Now, maybe we do need to reset the CS slot
regardless, in which case it might make sense to have that done in a
separate fix happening before the timeout changes.
