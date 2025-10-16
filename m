Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA473BE1D40
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB6010E2D6;
	Thu, 16 Oct 2025 06:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uu3cet/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF3F10E2D6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:56:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cnJdT0zZPz9tMv;
 Thu, 16 Oct 2025 08:56:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760597773; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUMa+FD/J6GvsUG0DfxO0havu6s4730t96vIXiAR2Js=;
 b=uu3cet/0rjdLOKPVbVroWeNXi2CfCFJt5cM9424PyPboanB+wKS0PRnTee2vSUhUvT8adN
 MreUSbXb8ht5W8gQMEcd2r2O5YGqOrUFfMxD1AxfjIMLlNWcKTjOY2EiXoFp9woCyb6bYQ
 8d7L+6Ttoo2OKajbR+QkEfoRfgd5GzdAReqegXREBC7m3dR9/aJWVWl9nZtYJMaAHxmAxD
 445K71Iu4WD18tNqWCEVBZVc1CLAV9/QEWmLUFxorgCLGCqaOSgITZIU5QAERvzCvZNDmU
 ozFbWwW08pwJ5264iyYl4N60wG1xj3ifgarZvcm3Xlez0ky5c8C+diVfBD+7+w==
Message-ID: <5313024c7e43058b1e4b02f29522035f24ef9b0a.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, matthew.brost@intel.com, dakr@kernel.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 16 Oct 2025 08:56:11 +0200
In-Reply-To: <d137c7a5-5bed-4497-9332-3c0677488c4c@amd.com>
References: <20251014142430.2470-1-christian.koenig@amd.com>
 <c53ba5989296ba1360e7c6a2b7901ac1e671bff1.camel@mailbox.org>
 <d137c7a5-5bed-4497-9332-3c0677488c4c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: grzewmdjqtubkta1burir5wm97fnmk5f
X-MBO-RS-ID: 23ec3c5213b2515d76c
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

On Wed, 2025-10-15 at 17:52 +0200, Christian K=C3=B6nig wrote:
>=20
>=20
> On 15.10.25 10:23, Philipp Stanner wrote:
> > On Tue, 2025-10-14 at 16:24 +0200, Christian K=C3=B6nig wrote:
> > > From: David Rosca <david.rosca@amd.com>
> > >=20
> > > The DRM scheduler tracks who last uses an entity and when that proces=
s
> > > is killed blocks all further submissions to that entity.
> > >=20
> > > The problem is that we didn't tracked who initialy created an entity,=
 so
> >=20
> > s/tracked/track
> >=20
> > > when an process accidentially leaked its file descriptor to a child a=
nd
> >=20
> > s/an/a
> >=20
> > > that child got killed we killed the parents entities.
> >=20
> > s/parents/parent's
> >=20
> > >=20
> > > Avoid that and instead initialize the entities last user on entity
> > > creation.
> > >=20
> > > Signed-off-by: David Rosca <david.rosca@amd.com>
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > CC: stable@vger.kernel.org
> > > ---
> > > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
> > > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> > > index 5a4697f636f2..3e2f83dc3f24 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *=
entity,
> > > =C2=A0	entity->guilty =3D guilty;
> > > =C2=A0	entity->num_sched_list =3D num_sched_list;
> > > =C2=A0	entity->priority =3D priority;
> > > +	entity->last_user =3D current->group_leader;
> > > =C2=A0	/*
> > > =C2=A0	 * It's perfectly valid to initialize an entity without having=
 a valid
> > > =C2=A0	 * scheduler attached. It's just not valid to use the schedule=
r before it
> > > @@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_enti=
ty *entity, long timeout)
> > > =C2=A0
> > > =C2=A0	/* For a killed process disallow further enqueueing of jobs. *=
/
> > > =C2=A0	last_user =3D cmpxchg(&entity->last_user, current->group_leade=
r, NULL);
> > > -	if ((!last_user || last_user =3D=3D current->group_leader) &&
> > > +	if (last_user =3D=3D current->group_leader &&
> >=20
> > It's not super clear from the commit message why the NULL check is
> > being removed. Previously entities could have been killed if there was
> > no last user. That's not desired anymore. Why?
>=20
> The reason that we don't need the NULL check any more is because we now d=
on't encounter the NULL pointer any more.
>=20
> In other words the pointer is now always initialized, even when the entit=
y was never used.
>=20
> I've added another sentence to the commit message, but I'm not sure how t=
o better describe that. Is that sufficient? If not suggestions welcome.

Sounds good enough, thank you.

P.

>=20
> Thanks,
> Christian.
>=20
>=20
> >=20
> >=20
> > P.
> >=20
> > > =C2=A0	=C2=A0=C2=A0=C2=A0 (current->flags & PF_EXITING) && (current->=
exit_code =3D=3D SIGKILL))
> > > =C2=A0		drm_sched_entity_kill(entity);
> > > =C2=A0
> >=20
>=20

