Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0095196B46F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6755A10E6C4;
	Wed,  4 Sep 2024 08:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mupeM5+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB53910E6C5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xRNcaImUP13tKMlDJtrAEtuFPlmldnl1j438a7sn34Q=; b=mupeM5+1I6cZNIoKGgNoes1mVF
 V0s7TcXlyJl/LZOb0aHYjeH2DIaIAaQ7Wg7Zv9zPCYSFvejhvDSLCrpQ+ipaQYQNP47MWdxIVxi9u
 nsDrwks6R/KBY+DYAUFELq4uPIDPKE5NeWbFNbEDimwFVF/zRT3X/DdrjoeypaR1EsXSOV/btHiZ8
 y90/Mm7s0Z81Sibp/6wEYre3wA5726CHWycRu0jD1t7W6UWk2WrHue9nelfK+qKzGt3+mGwPxQl5N
 Usa/nVonhWkUZQkHPUB3hWTrvGvOBeDlHQc4QmUJtg6WOo+I2LYw7ozCTGPWy6kZ18mJb0e/BTQWw
 jWH/CUIQ==;
Received: from cust-west-lon-46-193-226-34.cust.wifirst.net ([46.193.226.34]
 helo=[10.10.9.21]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sllJO-009Q9Z-2n; Wed, 04 Sep 2024 10:24:21 +0200
Message-ID: <f686b0113ed782e9defc112b2d9a3bb877730bd9.camel@igalia.com>
Subject: Re: [PATCH v5 01/10] drm/v3d: Fix the MMU flush order
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Wed, 04 Sep 2024 10:24:18 +0200
In-Reply-To: <20240829130954.2439316-2-mcanal@igalia.com>
References: <20240829130954.2439316-1-mcanal@igalia.com>
 <20240829130954.2439316-2-mcanal@igalia.com>
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

Hi Maira,

El jue, 29-08-2024 a las 10:05 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> We must first flush the MMU cache and then, flush the TLB, not the
> other
> way around. Currently, we can see a race condition between the MMU
> cache
> and the TLB when running multiple rendering processes at the same
> time.
> This is evidenced by MMU errors triggered by the IRQ.
>=20
> Fix the MMU flush order by flushing the MMU cache and then the TLB.

the patch is making 2 changes, it is changing the ordering of the
flushes but also the fact that now we wait for the first flush to
commplete before starting the second while the previous version would
start both flushes and then wait for both to complete. The commit log
seems to suggest that the first change is the one that fixes the issue
but I wonder if that is really what is happening.

Also, have you tested keeping the original order of operations but with
interleaved waits like we do here? Either way, I think we probably
should emphasized more in the committ log the fact that we are now
waiting for each flush to complete before starting the other flush.


>=20
> Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for
> Broadcom V3D V3.x+")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_mmu.c | 29 ++++++++++-------------------
> =C2=A01 file changed, 10 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c
> b/drivers/gpu/drm/v3d/v3d_mmu.c
> index 14f3af40d6f6..06bb44c7f35d 100644
> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
> @@ -32,32 +32,23 @@ static int v3d_mmu_flush_all(struct v3d_dev *v3d)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> -	/* Make sure that another flush isn't already running when
> we
> -	 * start this one.
> -	 */
> -	ret =3D wait_for(!(V3D_READ(V3D_MMU_CTL) &
> -			 V3D_MMU_CTL_TLB_CLEARING), 100);
> -	if (ret)
> -		dev_err(v3d->drm.dev, "TLB clear wait idle pre-wait
> failed\n");
> -

are we certain we can't have a flush in flux when a new one comes in?

> -	V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
> -		=C2=A0 V3D_MMU_CTL_TLB_CLEAR);
> -
> -	V3D_WRITE(V3D_MMUC_CONTROL,
> -		=C2=A0 V3D_MMUC_CONTROL_FLUSH |
> +	V3D_WRITE(V3D_MMUC_CONTROL, V3D_MMUC_CONTROL_FLUSH |
> =C2=A0		=C2=A0 V3D_MMUC_CONTROL_ENABLE);
> =C2=A0
> -	ret =3D wait_for(!(V3D_READ(V3D_MMU_CTL) &
> -			 V3D_MMU_CTL_TLB_CLEARING), 100);
> +	ret =3D wait_for(!(V3D_READ(V3D_MMUC_CONTROL) &
> +			 V3D_MMUC_CONTROL_FLUSHING), 100);
> =C2=A0	if (ret) {
> -		dev_err(v3d->drm.dev, "TLB clear wait idle
> failed\n");
> +		dev_err(v3d->drm.dev, "MMUC flush wait idle
> failed\n");
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	ret =3D wait_for(!(V3D_READ(V3D_MMUC_CONTROL) &
> -			 V3D_MMUC_CONTROL_FLUSHING), 100);
> +	V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
> +		=C2=A0 V3D_MMU_CTL_TLB_CLEAR);
> +
> +	ret =3D wait_for(!(V3D_READ(V3D_MMU_CTL) &
> +			 V3D_MMU_CTL_TLB_CLEARING), 100);
> =C2=A0	if (ret)
> -		dev_err(v3d->drm.dev, "MMUC flush wait idle
> failed\n");
> +		dev_err(v3d->drm.dev, "TLB clear wait idle
> failed\n");

I'd maybe use "MMU TLB clear wait idle failed", so we can more easily
identify this message comes from the MMU implementation.

Iago

> =C2=A0
> =C2=A0	return ret;
> =C2=A0}

