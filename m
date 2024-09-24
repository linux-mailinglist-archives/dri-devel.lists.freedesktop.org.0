Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61B983C5B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 07:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4D10E25E;
	Tue, 24 Sep 2024 05:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Eeg0Umq4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51B610E25E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 05:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YNS5Rbk1Y4WYnOQhxnJqnehTcjOaD+ieLEM5TbzBlWs=; b=Eeg0Umq4vitreexo9LeMuFiAIn
 952G3gl/QrKrz2Bp4uJllpag+1oTUN4EAgAp3yMM+qXdzcp8uXuXaF43t40rcj95q+V1LIFYh8LSo
 jGwClahM6Y+MWyBFMtZiSSjn2HD/hDTOWSHetUGJrEL6M0aWBm3bUfdZEDYbmHKItg29M7V8v8OMT
 hlnl8MMO211ZnDAHtqnQTewMwLvqHTiw4zwFAY3HjcvxquadXzS4UVk6+gIib6XbZiIrY43e2j5xx
 sQprjllbLC1f/6mqlFwGHSPMIfyFDoINejdap3Lfmlr9SfN/lDri+7t7H6bUMZN7cjL+eeyXcrhEx
 Bk9CMqcg==;
Received: from 62.83.47.18.dyn.user.ono.com ([62.83.47.18] helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ssy5K-000FKR-Ie; Tue, 24 Sep 2024 07:27:38 +0200
Message-ID: <98dfe801d45be91ea232012a0ce0304428a13353.camel@igalia.com>
Subject: Re: [PATCH v6 01/11] drm/v3d: Address race-condition in MMU flush
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Tue, 24 Sep 2024 07:27:27 +0200
In-Reply-To: <20240923141348.2422499-2-mcanal@igalia.com>
References: <20240923141348.2422499-1-mcanal@igalia.com>
 <20240923141348.2422499-2-mcanal@igalia.com>
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

El lun, 23-09-2024 a las 10:55 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> We must first flush the MMU cache and then, flush the TLB, not the
> other
> way around. Currently, we can see a race condition between the MMU
> cache
> and the TLB when running multiple rendering processes at the same
> time.
> This is evidenced by MMU errors triggered by the IRQ.
>=20
> Fix the MMU flush order by flushing the MMU cache and then the TLB.
> Also, in order to address the race condition, wait for the MMU cache
> flush
> to finish before starting the TLB flush.
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
> index 14f3af40d6f6..e36ec3343b06 100644
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
> +		dev_err(v3d->drm.dev, "MMU TLB clear wait idle
> failed\n");
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}

