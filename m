Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A4BD7922
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 08:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9567D10E541;
	Tue, 14 Oct 2025 06:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="X+kHhcPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9710E541
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 06:31:30 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cm49q40p8z9tK7;
 Tue, 14 Oct 2025 08:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760423487; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcI6B8V4+oFXl583aQgaR9IruesjEnaQ6XXfa8fePYM=;
 b=X+kHhcPTKAZmvBL0QuHkTCbtw3R+WUioRAWqL3QpnCjCNuLUEYbHA7Q/Ybdn0GOMsSfLNh
 TV+5OD45iMEylrRR4d46YBrxE+wTknmiqmDaf+dY7T83L2kF0e5M3R/Uyh5yiAAYX6G9mS
 /ACpyvkOaCUThLFxft7WhTXbwMeLwCwV1sJPypp6rqVoLbI/kGBx/yXFPkkQQy8n9kmkmD
 z4DLI+wOx0Lp8a2HJoU2wef/BXzfB9wgABIG1N3QlAA7fS3fdNdqWhAEH+YgdFFzHdy6pN
 MRxbjvUZmNrlkUYByMUMS6LeCEQ99T1VCGvzoLVroa2wxol5q5nprqRb25Vj8Q==
Message-ID: <03cccc85bb18bfd806435a679c5327ec5d33a169.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Fix potential double free in
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
Date: Tue, 14 Oct 2025 08:31:20 +0200
In-Reply-To: <20251013190731.63235-1-tvrtko.ursulin@igalia.com>
References: <20251013190731.63235-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 5phqor3uybdcn855yqifst8dkd3aoqnf
X-MBO-RS-ID: 00289016c4f1fe25a3b
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

On Mon, 2025-10-13 at 20:07 +0100, Tvrtko Ursulin wrote:
> When adding dependencies with drm_sched_job_add_dependency(), that

I'm sorry if there was confusion about upper case style. I'm quite sure
I'd think I'd never ask for a function name to be written uppercase,
but maybe that was a -ENOCOFFEE version of me last year or sth :O

> function consumes the fence reference both on success and failure, so in
> the latter case the dma_fence_put() on the error path (xarray failed to
> expand) is a double free.
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
>=20
> As such it is not easy to identify the right target for the fixes tag so
> lets keep it simple and just continue the chain.
>=20
> While fixing we also improve the comment and explain the reason for takin=
g
> the reference and not dropping it.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_depen=
dencies harder")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reference: https://lore.kernel.org/dri-devel/aNFbXq8OeYl3QSdm@stanley.mou=
ntain/

Any objection with me changing that to Closes: when applying?

As I read it that's a real bug report by Dan and this patches closes
that report.

P.

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
> v2:
> =C2=A0* Re-arrange commit text so discussion around sentences starting wi=
th
> =C2=A0=C2=A0 capital letters in all cases can be avoided.
> =C2=A0* Keep double return for now.
> =C2=A0* Improved comment instead of dropping it.
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 13 +++++++------
> =C2=A01 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 46119aacb809..c39f0245e3a9 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -965,13 +965,14 @@ int drm_sched_job_add_resv_dependencies(struct drm_=
sched_job *job,
> =C2=A0	dma_resv_assert_held(resv);
> =C2=A0
> =C2=A0	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
> -		/* Make sure to grab an additional ref on the added fence */
> -		dma_fence_get(fence);
> -		ret =3D drm_sched_job_add_dependency(job, fence);
> -		if (ret) {
> -			dma_fence_put(fence);
> +		/*
> +		 * As drm_sched_job_add_dependency always consumes the fence
> +		 * reference (even when it fails), and dma_resv_for_each_fence
> +		 * is not obtaining one, we need to grab one before calling.
> +		 */
> +		ret =3D drm_sched_job_add_dependency(job, dma_fence_get(fence));
> +		if (ret)
> =C2=A0			return ret;
> -		}
> =C2=A0	}
> =C2=A0	return 0;
> =C2=A0}

