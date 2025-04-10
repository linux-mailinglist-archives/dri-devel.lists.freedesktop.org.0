Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31036A838D3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 08:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E738510E2A8;
	Thu, 10 Apr 2025 06:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="piKRwgOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9080510E2A8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 06:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6E3oTew63hwzgmkLyrAL5qPFfEvHhWKzzSplGoySY68=; b=piKRwgOhZGdDh8dRX/rtAY90Fk
 mRur52eMGa6eNIeE6gbTtK6vvpAIT7r2FnhVcEqRBn9qAu9itA0gWi3LC+oEsZUO7FW1oLTN4APEG
 +eI/bNxp/53GP/pi0CUQSo5bfm7nfbVK1el0NR+AsPAbT0EqBHJ0mk+3of167SCo4hhIfJIoeS1Q4
 cDr6+iKbJUhzC6XBqakuWOIECjvGIishWsJr+Dx1fEisert03wZ0YSi0eEIPeVJzxxWTzi32nnLY3
 jS2wZyZ8nb3fZ8gYUu2XyYw0ARKMqUTpSBXuEIHz/Dj9mXy5xfHUxaob6cK1rZcEal7FqlVqKrPBS
 XnRFYDNQ==;
Received: from [192.168.12.229] by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2kzA-00EW5b-Nb; Thu, 10 Apr 2025 08:02:00 +0200
Message-ID: <8e277f667296ca5d95bed270ee981aee0e5c3086.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Fix Indirect Dispatch configuration for V3D
 7.1.6 and later
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Simona Vetter <simona.vetter@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Thu, 10 Apr 2025 08:02:00 +0200
In-Reply-To: <20250409205051.9639-1-mcanal@igalia.com>
References: <20250409205051.9639-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El mi=C3=A9, 09-04-2025 a las 17:50 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> This commit is a resubmission of commit 1fe1c66274fb ("drm/v3d: Fix
> Indirect Dispatch configuration for V3D 7.1.6 and later"), which was
> accidentally reverted by commit 91dae758bdb8 ("Merge tag
> 'drm-misc-next-2024-08-01' of
> https://gitlab.freedesktop.org/drm/misc/kernel
> into drm-next"), likely due to an unfortunate conflict resolution.
>=20
> From the original commit message:
>=20
> ```
> `args->cfg[4]` is configured in Indirect Dispatch using the number of
> batches. Currently, for all V3D tech versions, `args->cfg[4]` equals
> the
> number of batches subtracted by 1. But, for V3D 7.1.6 and later, we
> must not
> subtract 1 from the number of batches.
>=20
> Implement the fix by checking the V3D tech version and revision.
>=20
> Fixes several `dEQP-VK.synchronization*` CTS tests related to
> Indirect Dispatch.
> ```
>=20
> Fixes: 91dae758bdb8 ("Merge tag 'drm-misc-next-2024-08-01' of
> https://gitlab.freedesktop.org/drm/misc/kernel=C2=A0into drm-next")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c | 16 +++++++++++++---
> =C2=A01 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index b3be08b0ca91..466d28ceee28 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -428,7 +428,8 @@
> v3d_rewrite_csd_job_wg_counts_from_indirect(struct v3d_cpu_job *job)
> =C2=A0	struct v3d_bo *bo =3D to_v3d_bo(job->base.bo[0]);
> =C2=A0	struct v3d_bo *indirect =3D to_v3d_bo(indirect_csd->indirect);
> =C2=A0	struct drm_v3d_submit_csd *args =3D &indirect_csd->job->args;
> -	u32 *wg_counts;
> +	struct v3d_dev *v3d =3D job->base.v3d;
> +	u32 num_batches, *wg_counts;
> =C2=A0
> =C2=A0	v3d_get_bo_vaddr(bo);
> =C2=A0	v3d_get_bo_vaddr(indirect);
> @@ -441,8 +442,17 @@
> v3d_rewrite_csd_job_wg_counts_from_indirect(struct v3d_cpu_job *job)
> =C2=A0	args->cfg[0] =3D wg_counts[0] <<
> V3D_CSD_CFG012_WG_COUNT_SHIFT;
> =C2=A0	args->cfg[1] =3D wg_counts[1] <<
> V3D_CSD_CFG012_WG_COUNT_SHIFT;
> =C2=A0	args->cfg[2] =3D wg_counts[2] <<
> V3D_CSD_CFG012_WG_COUNT_SHIFT;
> -	args->cfg[4] =3D DIV_ROUND_UP(indirect_csd->wg_size, 16) *
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (wg_counts[0] * wg_counts[1] * wg=
_counts[2])
> - 1;
> +
> +	num_batches =3D DIV_ROUND_UP(indirect_csd->wg_size, 16) *
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (wg_counts[0] * wg_counts[1] * wg_count=
s[2]);
> +
> +	/* V3D 7.1.6 and later don't subtract 1 from the number of
> batches */
> +	if (v3d->ver < 71 || (v3d->ver =3D=3D 71 && v3d->rev < 6))
> +		args->cfg[4] =3D num_batches - 1;
> +	else
> +		args->cfg[4] =3D num_batches;
> +
> +	WARN_ON(args->cfg[4] =3D=3D ~0);
> =C2=A0
> =C2=A0	for (int i =3D 0; i < 3; i++) {
> =C2=A0		/* 0xffffffff indicates that the uniform rewrite is
> not needed */

