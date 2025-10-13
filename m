Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02FEBD39C3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328E210E487;
	Mon, 13 Oct 2025 14:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="SrRq5RWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19ECD10E487
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:39:32 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4clg3N6kP1z9scN;
 Mon, 13 Oct 2025 16:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760366369; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eldRaBaRMDIvKL2RJMD+DdStCyCpgUpA7qlTkovrzrU=;
 b=SrRq5RWkoPFxAu7/iK9pmSSeoNyCXi/5A95tviX96W8R8CbbatUnrvBU9mn9ZDQoCwVTYt
 2wgNZZEjq+0rxsqKxDufcrsXTerXQpipRARwMnX5KPQ9NQFLNOUmQWwH814U1Pe+gNOBMl
 zPTU6goB54s7CvGvwrlhmqZRJwkiwTJjtxsYyX57tRyjELrrbiRyx/5NSkqrYDtqOZm7kG
 ExxyUjV6HSBRDXvhWLh3uH1lBNVVClyavmokRUWotfAG8oZwpBRAH/a6pjlH+E8cxSqBso
 l75yl/i6bJwNPb78nmJWY/53iatb2f6WdBwwBY/ZxMIzJDnsId1Zepwvrzanzg==
Message-ID: <6c150c95531b3d401b1dceec8d328a6d77b6849d.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Fix potential double free in
 drm_sched_job_add_resv_dependencies
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Dan Carpenter <dan.carpenter@linaro.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Rob Clark
 <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, stable@vger.kernel.org
Date: Mon, 13 Oct 2025 16:39:25 +0200
In-Reply-To: <20251003092642.37065-1-tvrtko.ursulin@igalia.com>
References: <20251003092642.37065-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: s3dqqfprn6hrz5mawo3fttu4w4e4qai8
X-MBO-RS-ID: 02b3f6a68c7015c7758
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

On Fri, 2025-10-03 at 10:26 +0100, Tvrtko Ursulin wrote:
> Drm_sched_job_add_dependency() consumes the fence reference both on

s/D/d

> success and failure, so in the latter case the dma_fence_put() on the
> error path (xarray failed to expand) is a double free.
>=20
> Interestingly this bug appears to have been present ever since
> ebd5f74255b9 ("drm/sched: Add dependency tracking"), since the code back
> then looked like this:
>=20
> drm_sched_job_add_implicit_dependencies():
> ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < fence_count; i++) =
{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret =3D drm_sched_job_add_dependency(job, fences[i]);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (; i < fence_count; i++)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dma_fence_put(fences[i]);
>=20
> Which means for the failing 'i' the dma_fence_put was already a double
> free. Possibly there were no users at that time, or the test cases were
> insufficient to hit it.
>=20
> The bug was then only noticed and fixed after
> 9c2ba265352a ("drm/scheduler: use new iterator in drm_sched_job_add_impli=
cit_dependencies v2")
> landed, with its fixup of
> 4eaf02d6076c ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies=
").
>=20
> At that point it was a slightly different flavour of a double free, which
> 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies=
 harder")
> noticed and attempted to fix.
>=20
> But it only moved the double free from happening inside the
> drm_sched_job_add_dependency(), when releasing the reference not yet
> obtained, to the caller, when releasing the reference already released by
> the former in the failure case.

That's certainly interesting, but is there a specific reason why you
include all of that?

The code is as is, and AFAICS it's just a bug stemming from original
bugs present and then refactorings happening.

I would at least remove the old 'implicit_dependencies' function from
the commit message. It's just confusing and makes one look for that in
the current code or patch.

>=20
> As such it is not easy to identify the right target for the fixes tag so
> lets keep it simple and just continue the chain.
>=20
> We also drop the misleading comment about additional reference, since it
> is not additional but the only one from the point of view of dependency
> tracking.


IMO that comment is nonsense. It's useless, too, because I can *see*
that a reference is being taken there, but not *why*.

Argh, these comments. See also my commit 72ebc18b34993


Anyways. Removing it is fine, but adding a better comment is better.
See below.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_depen=
dencies harder")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

Is there an error report that could be included here with a Closes:
tag?

> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.16+
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 14 +++++---------
> =C2=A01 file changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 46119aacb809..aff34240f230 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -960,20 +960,16 @@ int drm_sched_job_add_resv_dependencies(struct drm_=
sched_job *job,
> =C2=A0{
> =C2=A0	struct dma_resv_iter cursor;
> =C2=A0	struct dma_fence *fence;
> -	int ret;
> +	int ret =3D 0;
> =C2=A0
> =C2=A0	dma_resv_assert_held(resv);
> =C2=A0
> =C2=A0	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
> -		/* Make sure to grab an additional ref on the added fence */
> -		dma_fence_get(fence);
> -		ret =3D drm_sched_job_add_dependency(job, fence);
> -		if (ret) {
> -			dma_fence_put(fence);
> -			return ret;
> -		}
> +		ret =3D drm_sched_job_add_dependency(job, dma_fence_get(fence));

You still take a reference as before, but there is no comment anymore.
Can you add one explaining why a new reference is taken here?

I guess it will be something like "This needs a new reference for the
job", since you cannot rely on the one from resv.

> +		if (ret)
> +			break;
> =C2=A0	}
> -	return 0;
> +	return ret;


That's an unnecessarily enlargement of the git diff because of style,
isn't it? Better keep the diff minimal here for git blame.


P.


> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_job_add_resv_dependencies);
> =C2=A0

