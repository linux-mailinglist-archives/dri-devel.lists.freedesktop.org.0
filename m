Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AEDABBD1D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 13:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B2F10E11A;
	Mon, 19 May 2025 11:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fxXLwElv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A6410E043;
 Mon, 19 May 2025 11:59:18 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b1GSJ3VZKz9t6S;
 Mon, 19 May 2025 13:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747655952; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFoOdhNrcyGKkYovVoL3Apz+dccohEr7iLMjJaEzliQ=;
 b=fxXLwElv+4EfWlWJMGsZK8OW4svMgZ/Y+Nw9YQ8BI0Jlt4UUQMNO/BV9CvnRIWQwk7SqTD
 T8ni8FnHtQ4OKPj5ZUywuz/he/hlwMbmve8FfGjtTzYuwnlkSU/lSaerVK2tCMrBXNtZKw
 85ytJVa5L6QYNUAF6lR4eqMXlpTXiEKkWY3En4CRpFcfTax7PGzLVQERYSiCXliegcI/36
 6oFRRxUqcWLwKbMMMBB8pAxMy3R9L9YHus9ZBaBZmBa0D+5Pw81ttS7QYPguYzhH89OecO
 MiLvlEyM5TN9f2X5u35j61kHj8yYGYnmCdXFnU8UuvoyBX42quyQj3nhcLV8oA==
Message-ID: <2ca3f979b0257792cfcde07fefb3ccfe60db5657.camel@mailbox.org>
Subject: Re: [PATCH v9 02/10] drm/sched: store the drm client_id in
 drm_sched_fence
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, phasta@kernel.org, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Min Ma <min.ma@amd.com>, Lizhi Hou
 <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,  Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 19 May 2025 13:59:01 +0200
In-Reply-To: <882eeee1-cc36-4287-8437-b39c6c84562e@damsy.net>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-3-pierre-eric.pelloux-prayer@amd.com>
 <d747fef82a50466b2a2f9568f737bd80f5128b77.camel@mailbox.org>
 <2d206814-968d-47df-b670-cbd8db68c5c6@damsy.net>
 <882eeee1-cc36-4287-8437-b39c6c84562e@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 96cdc11c643f8c8b39b
X-MBO-RS-META: pfgoi5wswn5gaxwttw8kzqe4fws74axf
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

On Mon, 2025-05-19 at 13:02 +0200, Pierre-Eric Pelloux-Prayer wrote:
>=20
>=20
> Le 15/05/2025 =C3=A0 08:53, Pierre-Eric Pelloux-Prayer a =C3=A9crit=C2=A0=
:
> > Hi,
> >=20
> > Le 14/05/2025 =C3=A0 14:44, Philipp Stanner a =C3=A9crit=C2=A0:
> > > On Thu, 2025-04-24 at 10:38 +0200, Pierre-Eric Pelloux-Prayer
> > > wrote:
> > > > This will be used in a later commit to trace the drm client_id
> > > > in
> > > > some of the gpu_scheduler trace events.
> > > >=20
> > > > This requires changing all the users of drm_sched_job_init to
> > > > add an extra parameter.
> > > >=20
> > > > The newly added drm_client_id field in the drm_sched_fence is a
> > > > bit
> > > > of a duplicate of the owner one. One suggestion I received was
> > > > to
> > > > merge those 2 fields - this can't be done right now as amdgpu
> > > > uses
> > > > some special values (AMDGPU_FENCE_OWNER_*) that can't really be
> > > > translated into a client id. Christian is working on getting
> > > > rid of
> > > > those; when it's done we should be able to squash
> > > > owner/drm_client_id
> > > > together.
> > > >=20
> > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Signed-off-by: Pierre-Eric Pelloux-Prayer
> > > > <pierre-eric.pelloux-prayer@amd.com>
> > > > ---
> > > > =C2=A0=C2=A0drivers/accel/amdxdna/aie2_ctx.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 ++-
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++++--
> > > > -
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > > =C2=A0=C2=A0drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/imagination/pvr_job.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++--
> > > > =C2=A0=C2=A0drivers/gpu/drm/imagination/paac=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++++---
> > > > =C2=A0=C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > > =C2=A0=C2=A0drivers/gpu/drm/panfrost/panfrost_drv.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/panthor/panthor_drv.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > > =C2=A0=C2=A0drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++--
> > > > =C2=A0=C2=A0drivers/gpu/drm/panthor/panthor_sched.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_internal.h=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++--
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/tests/mock_scheduler.c |=C2=
=A0 2 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_submit.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 ++-
> > > > =C2=A0=C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 10
> > > > +++++++++-
> > > > =C2=A0=C2=A026 files changed, 62 insertions(+), 34 deletions(-)
> > >=20
> > > I think last time I asked about what your merge plan for this is,
> > > since
> > > it touches so many drivers. Should I take that?
> >=20
> > Based on:
> >=20
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-=
drm-misc.html
> >=20
> > "drm-misc is for drm core (non-driver) patches, subsystem-wide
> > refactorings,
> > and small trivial patches all over (including drivers)."
> >=20
> > I assume it should go through drm-misc.
>=20
> I've addressed your comments and pushed an updated branch to=20
> https://gitlab.freedesktop.org/pepp/linux/-/commits/improve_gpu_scheduler=
_trace_v10
>=20
> Any chance to get this merged soon?

I took a look. Looks good!

Be so kind and provide that branch as a v10 so we can conform to the
process. Then I can take them, do some basic smoke tests tomorrow and
then we're good to go. That should now all be good, you've got the
reviews and it has settled.

Thx
P.

>=20
> Thanks,
> Pierre-Eric
>=20
>=20
>=20
> >=20
> >=20
> > >=20
> > > Besides one comment below, scheduler bits look fine.
> > >=20
> > > >=20
> > > > diff --git a/drivers/accel/amdxdna/aie2_ctx.c
> > > > b/drivers/accel/amdxdna/aie2_ctx.c
> > > > index e04549f64d69..3e38a5f637ea 100644
> > > > --- a/drivers/accel/amdxdna/aie2_ctx.c
> > > > +++ b/drivers/accel/amdxdna/aie2_ctx.c
> > > > @@ -848,7 +848,8 @@ int aie2_cmd_submit(struct amdxdna_hwctx
> > > > *hwctx,
> > > > struct amdxdna_sched_job *job,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto up_sem;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > -=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&job->base, &hwctx->=
priv->entity,
> > > > 1, hwctx);
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&job->base, &hwctx->=
priv->entity,
> > > > 1, hwctx,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwctx->client->filp->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XDNA_ERR(xdn=
a, "DRM job init failed, ret %d", ret);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto free_ch=
ain;
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > > index 4cec3a873995..1a77ba7036c9 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > > @@ -639,7 +639,7 @@ int amdgpu_amdkfd_submit_ib(struct
> > > > amdgpu_device
> > > > *adev,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > -=C2=A0=C2=A0=C2=A0 ret =3D amdgpu_job_alloc(adev, NULL, NULL, NULL=
, 1, &job);
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D amdgpu_job_alloc(adev, NULL, NULL, NULL=
, 1, &job,
> > > > 0);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > index 82df06a72ee0..5a231b997d65 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > @@ -293,7 +293,8 @@ static int amdgpu_cs_pass1(struct
> > > > amdgpu_cs_parser *p,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < p->gang_size; ++i)=
 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D amdg=
pu_job_alloc(p->adev, vm, p->entities[i],
> > > > vm,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_ibs[i], &=
p->jobs[i]);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_ibs[i], &=
p->jobs[i],
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->filp->clie=
nt_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto free_all_kdata;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->jobs[i]->=
enforce_isolation =3D p->adev-
> > > > > enforce_isolation[fpriv->xcp_id];
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > > index acb21fc8b3ce..75262ce8db27 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > > @@ -204,7 +204,8 @@ static enum drm_gpu_sched_stat
> > > > amdgpu_job_timedout(struct drm_sched_job *s_job)
> > > > =C2=A0=C2=A0int amdgpu_job_alloc(struct amdgpu_device *adev, struct
> > > > amdgpu_vm
> > > > *vm,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0 struct drm_sched_entity *entity, void *owner,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned int num_ibs, struct amdgpu_job **job)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned int num_ibs, struct amdgpu_job **job,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0 u64 drm_client_id)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (num_ibs =3D=3D 0)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINV=
AL;
> > > > @@ -222,7 +223,8 @@ int amdgpu_job_alloc(struct amdgpu_device
> > > > *adev,
> > > > struct amdgpu_vm *vm,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!entity)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > -=C2=A0=C2=A0=C2=A0 return drm_sched_job_init(&(*job)->base, entity=
, 1,
> > > > owner);
> > > > +=C2=A0=C2=A0=C2=A0 return drm_sched_job_init(&(*job)->base, entity=
, 1, owner,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 drm_client_id);
> > > > =C2=A0=C2=A0}
> > > > =C2=A0=C2=A0int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev=
,
> > > > @@ -232,7 +234,7 @@ int amdgpu_job_alloc_with_ib(struct
> > > > amdgpu_device
> > > > *adev,
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r;
> > > > -=C2=A0=C2=A0=C2=A0 r =3D amdgpu_job_alloc(adev, NULL, entity, owne=
r, 1, job);
> > > > +=C2=A0=C2=A0=C2=A0 r =3D amdgpu_job_alloc(adev, NULL, entity, owne=
r, 1, job,
> > > > 0);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > > > index ce6b9ba967ff..5a8bc6342222 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > > > @@ -90,7 +90,8 @@ static inline struct amdgpu_ring
> > > > *amdgpu_job_ring(struct amdgpu_job *job)
> > > > =C2=A0=C2=A0int amdgpu_job_alloc(struct amdgpu_device *adev, struct
> > > > amdgpu_vm
> > > > *vm,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0 struct drm_sched_entity *entity, void *owner,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned int num_ibs, struct amdgpu_job **job);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned int num_ibs, struct amdgpu_job **job,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0 u64 drm_client_id);
> > > > =C2=A0=C2=A0int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev=
,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity, void
> > > > *owner,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 size_t size, enum amdgpu_ib_pool_type
> > > > pool_type,
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > index 3c0a5c3e0e3d..76c742328edb 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > @@ -534,7 +534,7 @@ int etnaviv_ioctl_gem_submit(struct
> > > > drm_device
> > > > *dev, void *data,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&submit->=
sched_job,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ctx->sched_entity[args->pipe],
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, submit->ctx);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, submit->ctx, file->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_sub=
mit_put;
> > > > diff --git a/drivers/gpu/drm/imagination/pvr_job.c
> > > > b/drivers/gpu/drm/imagination/pvr_job.c
> > > > index 59b334d094fa..7564b0f21b42 100644
> > > > --- a/drivers/gpu/drm/imagination/pvr_job.c
> > > > +++ b/drivers/gpu/drm/imagination/pvr_job.c
> > > > @@ -446,7 +446,7 @@ create_job(struct pvr_device *pvr_dev,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put=
_job;
> > > > -=C2=A0=C2=A0=C2=A0 err =3D pvr_queue_job_init(job);
> > > > +=C2=A0=C2=A0=C2=A0 err =3D pvr_queue_job_init(job, pvr_file->file-=
>client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put=
_job;
> > > > diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> > > > b/drivers/gpu/drm/imagination/pvr_queue.c
> > > > index 5e9bc0992824..5a41ee79fed6 100644
> > > > --- a/drivers/gpu/drm/imagination/pvr_queue.c
> > > > +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> > > > @@ -1073,6 +1073,7 @@ static int
> > > > pvr_queue_cleanup_fw_context(struct
> > > > pvr_queue *queue)
> > > > =C2=A0=C2=A0/**
> > > > =C2=A0=C2=A0 * pvr_queue_job_init() - Initialize queue related fiel=
ds in
> > > > a
> > > > pvr_job object.
> > > > =C2=A0=C2=A0 * @job: The job to initialize.
> > > > + * @drm_client_id: drm_file.client_id submitting the job
> > > > =C2=A0=C2=A0 *
> > > > =C2=A0=C2=A0 * Bind the job to a queue and allocate memory to guara=
ntee
> > > > pvr_queue_job_arm()
> > > > =C2=A0=C2=A0 * and pvr_queue_job_push() can't fail. We also make su=
re the
> > > > context type is
> > > > @@ -1082,7 +1083,7 @@ static int
> > > > pvr_queue_cleanup_fw_context(struct
> > > > pvr_queue *queue)
> > > > =C2=A0=C2=A0 *=C2=A0 * 0 on success, or
> > > > =C2=A0=C2=A0 *=C2=A0 * An error code if something failed.
> > > > =C2=A0=C2=A0 */
> > > > -int pvr_queue_job_init(struct pvr_job *job)
> > > > +int pvr_queue_job_init(struct pvr_job *job, u64 drm_client_id)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Fragment jobs need at least one n=
ative fence wait on
> > > > the
> > > > geometry job fence. */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 min_native_dep_count =3D job->ty=
pe =3D=3D
> > > > DRM_PVR_JOB_TYPE_FRAGMENT ? 1 : 0;
> > > > @@ -1099,7 +1100,7 @@ int pvr_queue_job_init(struct pvr_job
> > > > *job)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pvr_cccb_cmdseq_can_fit(&queue-=
>cccb,
> > > > job_cmds_size(job, min_native_dep_count)))
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -E2BI=
G;
> > > > -=C2=A0=C2=A0=C2=A0 err =3D drm_sched_job_init(&job->base, &queue->=
entity, 1,
> > > > THIS_MODULE);
> > > > +=C2=A0=C2=A0=C2=A0 err =3D drm_sched_job_init(&job->base, &queue->=
entity, 1,
> > > > THIS_MODULE, drm_client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
> > > > diff --git a/drivers/gpu/drm/imagination/pvr_queue.h
> > > > b/drivers/gpu/drm/imagination/pvr_queue.h
> > > > index 93fe9ac9f58c..fc1986d73fc8 100644
> > > > --- a/drivers/gpu/drm/imagination/pvr_queue.h
> > > > +++ b/drivers/gpu/drm/imagination/pvr_queue.h
> > > > @@ -143,7 +143,7 @@ struct pvr_queue {
> > > > =C2=A0=C2=A0bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f)=
;
> > > > -int pvr_queue_job_init(struct pvr_job *job);
> > > > +int pvr_queue_job_init(struct pvr_job *job, u64
> > > > drm_client_id);
> > > > =C2=A0=C2=A0void pvr_queue_job_cleanup(struct pvr_job *job);
> > > > diff --git a/drivers/gpu/drm/lima/lima_gem.c
> > > > b/drivers/gpu/drm/lima/lima_gem.c
> > > > index 5deec673c11e..9722b847a539 100644
> > > > --- a/drivers/gpu/drm/lima/lima_gem.c
> > > > +++ b/drivers/gpu/drm/lima/lima_gem.c
> > > > @@ -341,7 +341,7 @@ int lima_gem_submit(struct drm_file *file,
> > > > struct
> > > > lima_submit *submit)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D lima_sched_task_init(
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 submit->task=
, submit->ctx->context + submit->pipe,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bos, submit->nr_bos, vm=
);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bos, submit->nr_bos, vm=
, file->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_out=
1;
> > > > diff --git a/drivers/gpu/drm/lima/lima_sched.c
> > > > b/drivers/gpu/drm/lima/lima_sched.c
> > > > index 7934098e651b..954f4325b859 100644
> > > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > > @@ -113,7 +113,8 @@ static inline struct lima_sched_pipe
> > > > *to_lima_pipe(struct drm_gpu_scheduler *sch
> > > > =C2=A0=C2=A0int lima_sched_task_init(struct lima_sched_task *task,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct lima_sched_context *context,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct lima_bo **bos, int num_bos,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct lima_vm *vm)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct lima_vm *vm,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 u64 drm_client_id)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err, i;
> > > > @@ -124,7 +125,8 @@ int lima_sched_task_init(struct
> > > > lima_sched_task
> > > > *task,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < num_bos; i++)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_obje=
ct_get(&bos[i]->base.base);
> > > > -=C2=A0=C2=A0=C2=A0 err =3D drm_sched_job_init(&task->base, &contex=
t->base, 1,
> > > > vm);
> > > > +=C2=A0=C2=A0=C2=A0 err =3D drm_sched_job_init(&task->base, &contex=
t->base, 1,
> > > > vm,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(task->=
bos);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
> > > > diff --git a/drivers/gpu/drm/lima/lima_sched.h
> > > > b/drivers/gpu/drm/lima/lima_sched.h
> > > > index 85b23ba901d5..1a08faf8a529 100644
> > > > --- a/drivers/gpu/drm/lima/lima_sched.h
> > > > +++ b/drivers/gpu/drm/lima/lima_sched.h
> > > > @@ -88,7 +88,8 @@ struct lima_sched_pipe {
> > > > =C2=A0=C2=A0int lima_sched_task_init(struct lima_sched_task *task,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct lima_sched_context *context,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct lima_bo **bos, int num_bos,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct lima_vm *vm);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct lima_vm *vm,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 u64 drm_client_id);
> > > > =C2=A0=C2=A0void lima_sched_task_fini(struct lima_sched_task *task)=
;
> > > > =C2=A0=C2=A0int lima_sched_context_init(struct lima_sched_pipe *pip=
e,
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > index 3e9aa2cc38ef..d9be0fe3d674 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -30,7 +30,7 @@
> > > > =C2=A0=C2=A0static struct msm_gem_submit *submit_create(struct drm_=
device
> > > > *dev,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct msm_g=
pu *gpu,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct msm_g=
pu_submitqueue *queue, uint32_t nr_bos,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t nr_cmds)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t nr_cmds, u64 d=
rm_client_id)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static atomic_t ident =3D ATOMIC_INI=
T(0);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct msm_gem_submit *submit;
> > > > @@ -54,7 +54,8 @@ static struct msm_gem_submit
> > > > *submit_create(struct
> > > > drm_device *dev,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_P=
TR(ret);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > -=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&submit->base, queue=
->entity, 1,
> > > > queue);
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&submit->base, queue=
->entity, 1,
> > > > queue,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(submit=
->hw_fence);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(submit=
);
> > > > @@ -693,7 +694,8 @@ int msm_ioctl_gem_submit(struct drm_device
> > > > *dev,
> > > > void *data,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > -=C2=A0=C2=A0=C2=A0 submit =3D submit_create(dev, gpu, queue, args-=
>nr_bos,
> > > > args-
> > > > > nr_cmds);
> > > > +=C2=A0=C2=A0=C2=A0 submit =3D submit_create(dev, gpu, queue, args-=
>nr_bos,
> > > > args-
> > > > > nr_cmds,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(submit)) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D PTR_=
ERR(submit);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_pos=
t_unlock;
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > index d326e55d2d24..460a5fb02412 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > @@ -87,7 +87,8 @@ nouveau_job_init(struct nouveau_job *job,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&job->bas=
e, &sched->entity,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args->credits, NULL);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args->credits, NULL,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->file_priv->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_fre=
e_chains;
> > > > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > > b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > > index b87f83e94eda..d5c2c6530ed8 100644
> > > > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > > @@ -312,7 +312,7 @@ static int panfrost_ioctl_submit(struct
> > > > drm_device *dev, void *data,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&job->bas=
e,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &file_priv->sched_entity[slot],
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, NULL);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, NULL, file->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_put=
_job;
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c
> > > > b/drivers/gpu/drm/panthor/panthor_drv.c
> > > > index 06fe46e32073..bd8e1900c919 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > > > @@ -989,7 +989,8 @@ static int
> > > > panthor_ioctl_group_submit(struct
> > > > drm_device *ddev, void *data,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct=
 drm_panthor_queue_submit *qsubmit =3D
> > > > &jobs_args[i];
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_s=
ched_job *job;
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job =3D panthor_job_cre=
ate(pfile, args->group_handle,
> > > > qsubmit);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job =3D panthor_job_cre=
ate(pfile, args->group_handle,
> > > > qsubmit,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(j=
ob)) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret =3D PTR_ERR(job);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto out_cleanup_submit_ctx;
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > index 12a02e28f50f..e0c79bd2d173 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > @@ -2516,7 +2516,7 @@ panthor_vm_bind_job_create(struct
> > > > drm_file
> > > > *file,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kref_init(&job->refcount);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->vm =3D panthor_vm_get(vm);
> > > > -=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&job->base, &vm->ent=
ity, 1, vm);
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&job->base, &vm->ent=
ity, 1, vm,
> > > > file->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put=
_job;
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
> > > > b/drivers/gpu/drm/panthor/panthor_sched.c
> > > > index 446ec780eb4a..2af860c9068a 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > > @@ -3729,7 +3729,8 @@ struct panthor_vm *panthor_job_vm(struct
> > > > drm_sched_job *sched_job)
> > > > =C2=A0=C2=A0struct drm_sched_job *
> > > > =C2=A0=C2=A0panthor_job_create(struct panthor_file *pfile,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
 u16 group_handle,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 const stru=
ct drm_panthor_queue_submit *qsubmit)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 const stru=
ct drm_panthor_queue_submit *qsubmit,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 u64 drm_cl=
ient_id)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct panthor_group_pool *gpool =3D=
 pfile->groups;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct panthor_job *job;
> > > > @@ -3801,7 +3802,7 @@ panthor_job_create(struct panthor_file
> > > > *pfile,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&job->bas=
e,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &job->group->queues[job-
> > > > > queue_idx]->entity,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 credits, job->group);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 credits, job->group,
> > > > drm_client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put=
_job;
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.h
> > > > b/drivers/gpu/drm/panthor/panthor_sched.h
> > > > index e650a445cf50..742b0b4ff3a3 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_sched.h
> > > > +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> > > > @@ -29,7 +29,8 @@ int panthor_group_get_state(struct
> > > > panthor_file
> > > > *pfile,
> > > > =C2=A0=C2=A0struct drm_sched_job *
> > > > =C2=A0=C2=A0panthor_job_create(struct panthor_file *pfile,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
 u16 group_handle,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 const stru=
ct drm_panthor_queue_submit *qsubmit);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 const stru=
ct drm_panthor_queue_submit *qsubmit,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 u64 drm_cl=
ient_id);
> > > > =C2=A0=C2=A0struct drm_sched_job *panthor_job_get(struct drm_sched_=
job
> > > > *job);
> > > > =C2=A0=C2=A0struct panthor_vm *panthor_job_vm(struct drm_sched_job
> > > > *sched_job);
> > > > =C2=A0=C2=A0void panthor_job_put(struct drm_sched_job *job);
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
> > > > b/drivers/gpu/drm/scheduler/sched_fence.c
> > > > index e971528504a5..d208d384d38d 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > > > @@ -206,7 +206,8 @@ struct drm_sched_fence
> > > > *to_drm_sched_fence(struct
> > > > dma_fence *f)
> > > > =C2=A0=C2=A0EXPORT_SYMBOL(to_drm_sched_fence);
> > > > =C2=A0=C2=A0struct drm_sched_fence *drm_sched_fence_alloc(struct
> > > > drm_sched_entity *entity,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 void *owner)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 void *owner,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 u64 drm_client_id)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_fence *fence =3D NU=
LL;
> > > > @@ -215,6 +216,7 @@ struct drm_sched_fence
> > > > *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence->owner =3D owner;
> > > > +=C2=A0=C2=A0=C2=A0 fence->drm_client_id =3D drm_client_id;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_init(&fence->lock);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return fence;
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
> > > > b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > index 599cf6e1bb74..7ea5a6736f98 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_internal.h
> > > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > @@ -24,7 +24,7 @@ void drm_sched_entity_select_rq(struct
> > > > drm_sched_entity *entity);
> > > > =C2=A0=C2=A0struct drm_sched_job *drm_sched_entity_pop_job(struct
> > > > drm_sched_entity *entity);
> > > > =C2=A0=C2=A0struct drm_sched_fence *drm_sched_fence_alloc(struct
> > > > drm_sched_entity *s_entity,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 void *owner);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 void *owner, u64
> > > > drm_client_id);
> > > > =C2=A0=C2=A0void drm_sched_fence_init(struct drm_sched_fence *fence=
,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0 struct drm_sched_entity *entity);
> > > > =C2=A0=C2=A0void drm_sched_fence_free(struct drm_sched_fence *fence=
);
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index 829579c41c6b..60611618f3ab 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -764,6 +764,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
> > > > =C2=A0=C2=A0 * @credits: the number of credits this job contributes=
 to
> > > > the
> > > > schedulers
> > > > =C2=A0=C2=A0 * credit limit
> > > > =C2=A0=C2=A0 * @owner: job owner for debugging
> > > > + * @drm_client_id: drm_file.client_id of the owner
> > >=20
> > > For the docu generation to link that properly it must be written
> > > as
> > >=20
> > > &struct drm_file.client_id
> >=20
> > Noted.
> >=20
> > >=20
> > > Besides, if this were an optional parameter, one should document
> > > it.
> > > I'm not sure if it is, I haven't used these client_id's before.
> >=20
> > Passing an invalid client_id would only cause the trace events to
> > print the invalid client_id.
> >=20
> > Thanks,
> > Pierre-Eric
> >=20
> >=20
> > >=20
> > > P.
> > >=20
> > > > =C2=A0=C2=A0 *
> > > > =C2=A0=C2=A0 * Refer to drm_sched_entity_push_job() documentation
> > > > =C2=A0=C2=A0 * for locking considerations.
> > > > @@ -784,7 +785,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
> > > > =C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0int drm_sched_job_init(struct drm_sched_job *job,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u32 credits, void *owner)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u32 credits, void *owner,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 uint64_t drm_client_id)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!entity->rq) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* This will=
 most likely be followed by missing
> > > > frames
> > > > @@ -810,7 +812,7 @@ int drm_sched_job_init(struct drm_sched_job
> > > > *job,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->entity =3D entity;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->credits =3D credits;
> > > > -=C2=A0=C2=A0=C2=A0 job->s_fence =3D drm_sched_fence_alloc(entity, =
owner);
> > > > +=C2=A0=C2=A0=C2=A0 job->s_fence =3D drm_sched_fence_alloc(entity, =
owner,
> > > > drm_client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!job->s_fence)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOM=
EM;
> > > > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > index f999c8859cf7..09ffbdb32d76 100644
> > > > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > @@ -35,7 +35,7 @@ drm_mock_sched_entity_new(struct kunit *test,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_entity_init(&entit=
y->base,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 priority,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 &drm_sched, 1,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 NULL);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 NULL, 1);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KUNIT_ASSERT_EQ(test, ret, 0);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity->test =3D test;
> > > > diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
> > > > b/drivers/gpu/drm/v3d/v3d_submit.c
> > > > index 4ff5de46fb22..5171ffe9012d 100644
> > > > --- a/drivers/gpu/drm/v3d/v3d_submit.c
> > > > +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> > > > @@ -169,7 +169,7 @@ v3d_job_init(struct v3d_dev *v3d, struct
> > > > drm_file
> > > > *file_priv,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->file =3D file_priv;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_sched_job_init(&job->bas=
e, &v3d_priv-
> > > > > sched_entity[queue],
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, v3d_priv);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, v3d_priv, file_priv->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > > > b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > index 1905ca590965..f4679cb9a56b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > @@ -113,7 +113,8 @@ struct xe_sched_job
> > > > *xe_sched_job_create(struct
> > > > xe_exec_queue *q,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kref_init(&job->refcount);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_exec_queue_get(job->q);
> > > > -=C2=A0=C2=A0=C2=A0 err =3D drm_sched_job_init(&job->drm, q->entity=
, 1, NULL);
> > > > +=C2=A0=C2=A0=C2=A0 err =3D drm_sched_job_init(&job->drm, q->entity=
, 1, NULL,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q->xef->drm->client_id);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_fre=
e;
> > > > diff --git a/include/drm/gpu_scheduler.h
> > > > b/include/drm/gpu_scheduler.h
> > > > index 1a7e377d4cbb..6fe3b4c0cffb 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -305,6 +305,13 @@ struct drm_sched_fence {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @own=
er: job owner for debugging
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *owner;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @drm_client_id:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * The client_id of the drm_file which own=
s the job.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_client_id;
> > > > =C2=A0=C2=A0};
> > > > =C2=A0=C2=A0struct drm_sched_fence *to_drm_sched_fence(struct dma_f=
ence
> > > > *f);
> > > > @@ -629,7 +636,8 @@ drm_sched_pick_best(struct
> > > > drm_gpu_scheduler
> > > > **sched_list,
> > > > =C2=A0=C2=A0int drm_sched_job_init(struct drm_sched_job *job,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u32 credits, void *owner);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u32 credits, void *owner,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u64 drm_client_id);
> > > > =C2=A0=C2=A0void drm_sched_job_arm(struct drm_sched_job *job);
> > > > =C2=A0=C2=A0void drm_sched_entity_push_job(struct drm_sched_job
> > > > *sched_job);
> > > > =C2=A0=C2=A0int drm_sched_job_add_dependency(struct drm_sched_job *=
job,

