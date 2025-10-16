Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A1BE4D2E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE50A10EA5B;
	Thu, 16 Oct 2025 17:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="yQODnUrE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C743B10EA5B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:20:08 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cnZTK2N6Qz9tNw;
 Thu, 16 Oct 2025 19:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760635205; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBu1hBAi00cEhsKXQ5fo2D46tmlWtuWqZ02P9uzfvbA=;
 b=yQODnUrEkDjf2FPMSEBhELd7QgedK+85h/U7MBWHCQg1fc+XlPkg8RsOLvXpDzVMjiOVkH
 zYO6cwCDe09lYvyMh2+Z1KSPaShslctENNu4CJiJ9lnv0yWDeZL8QtRK1h65A110EdRUD0
 8ToOItpgKT+yXOPD1pQ8PIEzyhej9QcjaYbGcuk8pnon10NDhmdaLyxkyK5pOyuy5I62tZ
 7V2aQoz34+wvmJW2xJ2rGErtFr5r4qOx4Y2pdtPbeTs8SPbaIutH2vFEU8Y1e++1xFCna4
 FIqzS8ejbWtLw3FOlNR8Q5sNLTFCzO/Vv7E24cMX2TemGpptECvfXyhFEiriHQ==
Message-ID: <090dcd8ef59f5c4faa0370669bf69eca6a881634.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v3
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, dakr@kernel.org,
 matthew.brost@intel.com,  dri-devel@lists.freedesktop.org
Date: Thu, 16 Oct 2025 19:20:00 +0200
In-Reply-To: <08c5d03f-d099-43f9-a26b-d333e394d862@amd.com>
References: <20251015140128.1470-1-christian.koenig@amd.com>
 <1a83e056df0a0096f85897b569993b0eca3892df.camel@mailbox.org>
 <08c5d03f-d099-43f9-a26b-d333e394d862@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: cb2ea7786037d5720c8
X-MBO-RS-META: 16xqgjoo9qjiyni6dt71ahed4xf4hwtc
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

On Thu, 2025-10-16 at 15:11 +0200, Christian K=C3=B6nig wrote:
> On 16.10.25 14:31, Philipp Stanner wrote:
> > On Wed, 2025-10-15 at 16:01 +0200, Christian K=C3=B6nig wrote:
> > > From: David Rosca <david.rosca@amd.com>
> > >=20
> > > The DRM scheduler tracks who last uses an entity and when that proces=
s
> > > is killed blocks all further submissions to that entity.
> > >=20
> > > The problem is that we didn't track who initially created an entity, =
so
> > > when a process accidently leaked its file descriptor to a child and
> > > that child got killed, we killed the parent's entities.
> > >=20
> > > Avoid that and instead initialize the entities last user on entity
> > > creation. This also allows to drop the extra NULL check.
> > >=20
> > > v2: still use cmpxchg
> > > v3: improve the commit message
> >=20
> > For the future, commit messages in the patche's comment body are to be
> > preferred since it's common kernel style. Same applies to the patch
> > version in the title, which should be in [PATCH v3].
>=20
> Ah, just forgotten about it!
>=20
> >=20
> > But that's just a nit. More important:
> >=20
> > >=20
> > > Signed-off-by: David Rosca <david.rosca@amd.com>
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
> >=20
> > Should this have a Fixes: ?
>=20
> No, I've actually removed that because the patch which made it obvious th=
at something is wrong here is correct.
>=20
> It's just that this seems to be incorrect ever since we added the code.

Then we should just add the Fixes: tag for the big bang commit,
shouldn't we?

At least maintainer-tools/dim doesn't like the missing tag at all. When
trying to apply this patch it just added the following:

Signed-off-by: David Rosca <david.rosca@amd.com>
Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
CC: stable@vger.kernel.org
Fixes: 43bce41cf48e ("drm/scheduler: only kill entity if last user is  kill=
ed v2")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
Link: https://lore.kernel.org/r/20251015140128.1470-1-christian.koenig@amd.=
com

and then it complains about the tag it added itself:

Applying: drm/sched: avoid killing parent entity on child SIGKILL v3
[drm-misc-fixes 2a3e82c80bd0] drm/sched: avoid killing parent entity on chi=
ld SIGKILL v3
 Author: David Rosca <david.rosca@amd.com>
 Date: Wed Oct 15 16:01:28 2025 +0200
 1 file changed, 2 insertions(+), 1 deletion(-)
2a3e82c80bd0 (HEAD -> drm-misc-fixes) drm/sched: avoid killing parent entit=
y on child SIGKILL v3
-:27: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ c=
hars of sha1> ("<title line>")' - ie: 'Fixes: 43bce41cf48e ("drm/scheduler:=
 only kill entity if last user is killed v2")'
#27:=20
Fixes: 43bce41cf48e ("drm/scheduler: only kill entity if last user is  kill=
ed v2")

-:48: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'curren=
t->exit_code =3D=3D SIGKILL'
#48: FILE: drivers/gpu/drm/scheduler/sched_entity.c:306:
+	if (last_user =3D=3D current->group_leader &&
 	    (current->flags & PF_EXITING) && (current->exit_code =3D=3D SIGKILL))

total: 0 errors, 1 warnings, 1 checks, 15 lines checked


Which is weird..

in any case the big bang commit helps stable to apply this correctly,
too.

P.

>=20
> >=20
> > > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > > CC: stable@vger.kernel.org
> >=20
> > So we want it in drm-misc-fixes, don't we?
>=20
> Yes, the patch is based on drm-misc-fixes. I can push it when you give me=
 an rb.
>=20
> Alternatively you can push it yourself, whatever you prefer.
>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > P.
> >=20
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
> > > =C2=A0	=C2=A0=C2=A0=C2=A0 (current->flags & PF_EXITING) && (current->=
exit_code =3D=3D SIGKILL))
> > > =C2=A0		drm_sched_entity_kill(entity);
> > > =C2=A0
> >=20
>=20

