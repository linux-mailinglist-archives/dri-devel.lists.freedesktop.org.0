Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1467F930DB5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 07:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1428A10E248;
	Mon, 15 Jul 2024 05:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nnBKseMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0449410E269
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 05:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FJ3renVifpW3lBYRZO10KFQHCJcPSJPn06f+VLdw8Ms=; b=nnBKseMqTTkoqvfL1PzQuyDJ3w
 093s8KaHtt80hj7/lXI0N2sJ7bNpEqMa9HcYWuCfmCCPpKEWFSowTBt39tyXcpU6DYtkn9rwBnRBC
 vkzGFDEWYGygNXq7QUWAzUv/IbnWdhDaVmWWy6YHLS1mx4RAvWEOIXqn/4X/jiGPJxTJFQQUMBN1+
 /fcEVDoiwc/fnCPFSMs0xkF2lA1e5YcHKIhZp8NQqhF5iNlGkhITUF1gWXsevBIeiVx4SHRFi2IX2
 ovVdwTjdRRWoKMxraSftRmPhDUIq7WXGXtE4ZREegrjK0eiJTT7R1gyrYY6CkEnkFTX7ItO1Ahe+F
 7iVSHobA==;
Received: from [159.147.169.95] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sTEb1-00FLdM-Dn; Mon, 15 Jul 2024 07:49:59 +0200
Message-ID: <e376973d61b8d15c52d233325b8d4ea164541c1c.camel@igalia.com>
Subject: Re: [PATCH 2/2] drm/v3d: Fix Indirect Dispatch configuration for
 V3D 7.1.6 and later
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Alejandro =?ISO-8859-1?Q?Pi=F1eiro?=
 <apinheiro@igalia.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Mon, 15 Jul 2024 07:49:58 +0200
In-Reply-To: <20240714145243.1223131-2-mcanal@igalia.com>
References: <20240714145243.1223131-1-mcanal@igalia.com>
 <20240714145243.1223131-2-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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

Thanks Ma=C3=ADra, both patches are:
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El dom, 14-07-2024 a las 11:49 -0300, Ma=C3=ADra Canal escribi=C3=B3:
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
>=20
> Fixes: 18b8413b25b7 ("drm/v3d: Create a CPU job extension for a
> indirect CSD job")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c | 16 +++++++++++++---
> =C2=A01 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index d193072703f3..cafa3a298c11 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -353,7 +353,8 @@
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
> @@ -366,8 +367,17 @@
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

