Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF10AB9699
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 09:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58ED10E9B9;
	Fri, 16 May 2025 07:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rVBl9KrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A05F10E9B9;
 Fri, 16 May 2025 07:33:29 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZzJj250xVz9t0n;
 Fri, 16 May 2025 09:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747380806; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+9FeEd9VuPnD/WgTSFSjvYFxl1tT46a9czrcknqgxQ=;
 b=rVBl9KrKugWzhBY7b8fGSmpMNEk343nJXoOoHbcOH6Sy1oO9Y/kVYPtEljdOaJ/G41ThU8
 HTOGhtHsXkoisMYdCjtHp/8CXzYyl+8zbr2Z1h0+Zf2v+XjTi8FikHEaFEJXWScrWWML/K
 nzGoreK59khXaaiJ0nkTOeGoTtpdDTxoCcPflHXd5EWSZ2zapQE1Qr91upo2VVix2UWxxe
 QACqeze3vl8hvlXALukxvBmekVCnFuu8uCK/OioScUfQ/cvxAD1YSa72BGu1BwdZeGffNk
 sFvNfFYUTzjBoVImYOlt2a3Ev0i8vqKaAeBJ3DfTj72HHVjb7NSoG1dNU+LEag==
Message-ID: <ec8502c272f953feef0445c23895b31ea0ec1ea0.camel@mailbox.org>
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job
From: Philipp Stanner <phasta@mailbox.org>
To: "cao, lin" <lin.cao@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>,  "phasta@kernel.org" <phasta@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Chang, HaiJun" <HaiJun.Chang@amd.com>, "Yin, ZhenGuo (Chris)"
 <ZhenGuo.Yin@amd.com>, Danilo Krummrich <dakr@kernel.org>
Date: Fri, 16 May 2025 09:33:24 +0200
In-Reply-To: <PH0PR12MB5497CABD981161A39BF2EDB2F593A@PH0PR12MB5497.namprd12.prod.outlook.com>
References: <20250515020713.1110476-1-lincao12@amd.com>
 <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
 <5c1f021f4aa808f2cd5d8da76e40662ba10b97d6.camel@mailbox.org>
 <7fa0a034-80ae-45c9-84bf-9841f9b28a93@amd.com>
 <PH0PR12MB5497CABD981161A39BF2EDB2F593A@PH0PR12MB5497.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: pmb7h4bywrhxot4xsdtkp67z6eft557t
X-MBO-RS-ID: cf0d4b9e194756da0b6
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

On Fri, 2025-05-16 at 02:21 +0000, cao, lin wrote:
>=20
> [AMD Official Use Only - AMD Internal Distribution Only]
>=20
>=20
>=20
> Hi Philipp,
>=20
>=20
> I updated the commit message to better clarify the issue. Would you
> mind reviewing if this revised description adequately explains the
> bug and the rationale behind the fix?
>=20
>=20
> When an entity from application B is killed, drm_sched_entity_kill()
> =C2=A0
> removes all jobs belonging to that entity through =C2=A0
> drm_sched_entity_kill_jobs_work(). If application A's job depends on
> a =C2=A0
> scheduled fence from application B's job, and that fence is not
> properly =C2=A0
> signaled during the killing process, application A's dependency
> cannot be =C2=A0
> cleared. =C2=A0
> =C2=A0
> This leads to application A hanging indefinitely while waiting for a
> =C2=A0
> dependency that will never be resolved. Fix this issue by ensuring
> that =C2=A0
> scheduled fences are properly signaled when an entity is killed,
> allowing =C2=A0
> dependent applications to continue execution.

That sounds perfect, yes, Thx.

Reviewed-by: Philipp Stanner <phasta@kernel.org>


P.

>=20
> Thanks,
> Lin
>=20
>=20
>=20
>=20
>=20
> From:=C2=A0Koenig, Christian <Christian.Koenig@amd.com>
> Sent:=C2=A0Thursday, May 15, 2025 20:39
> To:=C2=A0phasta@kernel.org <phasta@kernel.org>; cao, lin
> <lin.cao@amd.com>; dri-devel@lists.freedesktop.org
> <dri-devel@lists.freedesktop.org>; aamd-gfx@lists.freedesktop.org
> <aamd-gfx@lists.freedesktop.org>
> Cc:=C2=A0Chang, HaiJun <HaiJun.Chang@amd.com>; Yin, ZhenGuo (Chris)
> <ZhenGuo.Yin@amd.com>; Danilo Krummrich <dakr@kernel.org>
> Subject:=C2=A0Re: [PATCH] drm/scheduler: signal scheduled fence when kill
> job=20
>=20
>=20
> On 5/15/25 11:05, Philipp Stanner wrote:
> > On Thu, 2025-05-15 at 10:48 +0200, Christian K=C3=B6nig wrote:
> > > Explicitly adding the scheduler maintainers.
> > >=20
> > > On 5/15/25 04:07, Lin.Cao wrote:
> > > > Previously we only signaled finished fence which may cause some
> > > > submission's dependency cannot be cleared the cause benchmark
> > > > hang.
> > > > Signal both scheduled fence and finished fence could fix this
> > > > issue.
> >=20
> > Code seems legit to me; but be so kind and also pimp up the commit
> > message a bit, Christian. It's not very clear what the bug is and
> > why
> > setting the parent to NULL solves it. Or is the issue simply that
> > the
> > fence might be dropped unsignaled, being a bug by definition? Needs
> > to
> > be written down.
>=20
> The later, we simply forgot to signal the scheduled fence when an
> application was killed.
>=20
> > Grammar is also a bit too broken.
> >=20
> > And running the unit tests before pushing is probably also a good
> > idea.
>=20
> And maybe even writing a new unit test for that.
>=20
> Regards,
> Christian.
>=20
> >=20
> > > >=20
> > > > Signed-off-by: Lin.Cao <lincao12@amd.com>
> >=20
> > Acked-by: Philipp Stanner <phasta@kernel.org>
> >=20
> > >=20
> > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > >=20
> > > Danilo & Philipp can we quickly get an rb for that? I'm
> > > volunteering
> > > to push it to drm-misc-fixes and add the necessary stable tags
> > > since
> > > this is a fix for a rather ugly bug.
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > >=20
> > > > ---
> > > > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > > > =C2=A01 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > index bd39db7bb240..e671aa241720 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > @@ -176,6 +176,7 @@ static void
> > > > drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
> > > > =C2=A0{
> > > > =C2=A0=C2=A0=C2=A0 struct drm_sched_job *job =3D container_of(wrk,
> > > > typeof(*job), work);
> > > > =C2=A0
> > > > +=C2=A0=C2=A0 drm_sched_fence_scheduled(job->s_fence, NULL);
> > > > =C2=A0=C2=A0=C2=A0 drm_sched_fence_finished(job->s_fence, -ESRCH);
> > > > =C2=A0=C2=A0=C2=A0 WARN_ON(job->s_fence->parent);
> > > > =C2=A0=C2=A0=C2=A0 job->sched->ops->free_job(job);
> > >=20
> >=20
>=20

