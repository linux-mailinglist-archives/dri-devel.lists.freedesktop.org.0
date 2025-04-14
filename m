Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E217A888D2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 18:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E7010E0A9;
	Mon, 14 Apr 2025 16:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="GKV1GX2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD8810E0A9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 16:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744649069; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fOLJD2HiiAHAGXahjHXke91G4mYUIyi/iKwnhcrRNQbUeDZxRLE2U641yfwGN7Z/xfwWjOdDs5vr3HdGId9JWMN+ryKwdzlTRmUrND3wu1S2LxNdZMHy0MG62esDVWwacuCCW3fFWam9eMEPgep/8ZIhFNKE3GaEwLj1E1Dl5sw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744649069;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5eyJYKZSjVgUVi1w+/gIBAqDOTVF1Wz6HfjZqS5wbsY=; 
 b=GyePq+Z2yZYKlA2h55S+pfjq0esNbjYn3ZEDnREzAz9NFEAGhX6Nmvy6H4KiObZ5XC325OcxUqvfTzrta6mvJQBegyw3IjwS4Du2fJyPsEJEJ+lWXtumke/EhEnuwsYD/y+bwm3HSf3ec1DOxYmk0vY+kn3WmuJRTPQusKSdfF0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
 dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744649069; 
 s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=5eyJYKZSjVgUVi1w+/gIBAqDOTVF1Wz6HfjZqS5wbsY=;
 b=GKV1GX2xHG1bNjaT5nMa1IM0Ue8IzrIFPxGnTORkfdLAWX91Q1CWINGgC9TgSpxj
 y8CYG6kh5337KoVq17m2wus7PYRQAxLZhkqyN/C4HC5eXXrj0OmwL73uH6NKE5VYsfL
 pe79QlxSfMKnfHLMabFKuBhVelBKFSt51d7LTS8U=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1744649067190904.0723844219125;
 Mon, 14 Apr 2025 09:44:27 -0700 (PDT)
Date: Mon, 14 Apr 2025 17:44:27 +0100
From: Ashley Smith <ashley.smith@collabora.com>
To: "Steven Price" <steven.price@arm.com>
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Heiko Stuebner" <heiko@sntech.de>, "kernel" <kernel@collabora.com>,
 "Daniel Stone" <daniels@collabora.com>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19635301a95.f859dc6e883590.3071663948141072628@collabora.com>
In-Reply-To: <3a5306c8-df44-430a-a24e-72d71b2dc8c1@arm.com>
References: <20250410125734.1005532-1-ashley.smith@collabora.com>
 <3a5306c8-df44-430a-a24e-72d71b2dc8c1@arm.com>
Subject: Re: [PATCH v3] drm/panthor: Make the timeout per-queue instead of
 per-job
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

On Fri, 11 Apr 2025 16:51:52 +0100 Steven Price  wrote:
 > Hi Ashley,=20
 > =20
 > On 10/04/2025 13:57, Ashley Smith wrote:=20
 > > The timeout logic provided by drm_sched leads to races when we try=20
 > > to suspend it while the drm_sched workqueue queues more jobs. Let's=20
 > > overhaul the timeout handling in panthor to have our own delayed work=
=20
 > > that's resumed/suspended when a group is resumed/suspended. When an=20
 > > actual timeout occurs, we call drm_sched_fault() to report it=20
 > > through drm_sched, still. But otherwise, the drm_sched timeout is=20
 > > disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of=
=20
 > > how we protect modifications on the timer.=20
 > >=20
 > > One issue seems to be when we call drm_sched_suspend_timeout() from=20
 > > both queue_run_job() and tick_work() which could lead to races due to=
=20
 > > drm_sched_suspend_timeout() not having a lock. Another issue seems to=
=20
 > > be in queue_run_job() if the group is not scheduled, we suspend the=20
 > > timeout again which undoes what drm_sched_job_begin() did when calling=
=20
 > > drm_sched_start_timeout(). So the timeout does not reset when a job=20
 > > is finished.=20
 > >=20
 > > Co-developed-by: Boris Brezillon boris.brezillon@collabora.com>=20
 > > Signed-off-by: Boris Brezillon boris.brezillon@collabora.com>=20
 > > Tested-by: Daniel Stone daniels@collabora.com>=20
 > > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")=
=20
 > > Signed-off-by: Ashley Smith ashley.smith@collabora.com>=20
 > > ---=20
 > >  drivers/gpu/drm/panthor/panthor_sched.c | 244 +++++++++++++++++------=
-=20
 > >  1 file changed, 177 insertions(+), 67 deletions(-)=20
 > >=20
 > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm=
/panthor/panthor_sched.c=20
 > > index 446ec780eb4a..32f5a75bc4f6 100644=20
 > > --- a/drivers/gpu/drm/panthor/panthor_sched.c=20
 > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c=20
 > =20
 > [...]=20
 > =20
 > > @@ -2727,8 +2784,17 @@ void panthor_sched_suspend(struct panthor_devic=
e *ptdev)=20
 > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * automatically terminate all active groups, so let's=20
 > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * force the state to halted here.=20
 > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */=20
 > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0if (csg_slot->group->state !=3D PANTHOR_CS_GROUP_TERMINATED)=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0if (csg_slot->group->state !=3D PANTHOR_CS_GROUP_TERMINATED) {=20
 > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0csg_slot->group->state =3D PANTHOR_CS_GROUP_TERM=
INATED;=20
 > > +=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Reset the queue slots manually if the termina=
tion=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* request failed.=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0*/=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i queue_count; i++) {=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (group->queues[i])=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
cs_slot_reset_locked(ptdev, csg_id, i);=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0}=20
 > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0slot_mask &=3D ~BIT(csg_id);=20
 > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > >  =C2=A0=C2=A0=C2=A0=C2=A0}=20
 > =20
 > So this seems to be the only change from v2 (a changelog can be=20
 > helpful!). And I'm not convinced it belongs in this patch? It's not just=
=20
 > "[making] the timeout per-queue instead of per-job".=20
 > =20
 > I haven't dug through the details, but I think this belongs in a=20
 > separate patch.=20
 > =20
 > Thanks,=20
 > Steve=20
 > =20

Hi Steve,

Apologies my change log did not make it in:

    v2: Suspend timeout before setting _TERMINATED so that if a terminate
    times out (Due to firmware hang) we don't get a spurious timeout

This was a bug fix related to the scheduling patch that we found, I was thi=
nking to include it here. However I'm happy to move it to a different patch=
.

Thanks,
Ash
