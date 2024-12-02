Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EF29DFD27
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 10:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342C910E20E;
	Mon,  2 Dec 2024 09:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cIUy6VJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE9D10E20E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733131771;
 bh=IQ++fwYeIZ4vgS2JJgiAPxW4u+mdSeuj+MWjDN1jntk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cIUy6VJbFhxzfn3TjzX1SF1it0todtiVIckd9nCtmmfsCVXttJ72EvXAqCipaFKUA
 4yU1I2a4xva+ILfNe/HNtARYqOPSTaCaPvrsL8dSPbglCGYettqrdGqzrb1R7tU4PT
 3uS55Y8e0OzwRH3Lxps/ho4e4t/DaG3yE5p7+A4Fhm2SY7Agqge08/e4szoUSGlU1b
 gAeYqHG+sRF4uSEEtnsfzedSTg1817qnaX2rUEd7XPU0rxkwblj2ooXsPjspVac8mb
 uvzg2Dw+eVqKUkshl9onqbdBrwXdxPAapDXUgiPxMiqQZRgq6GCAlxfmNxGK/HomIw
 vPJ3H7jQ8ZZBw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9842917E14FB;
 Mon,  2 Dec 2024 10:29:30 +0100 (CET)
Date: Mon, 2 Dec 2024 10:29:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] drm/panfrost: Handle error when allocating AS
 number
Message-ID: <20241202102925.286fae57@collabora.com>
In-Reply-To: <20241128211223.1805830-5-adrian.larumbe@collabora.com>
References: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
 <20241128211223.1805830-5-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 28 Nov 2024 21:06:19 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> If we reach the beginning of the LRU AS list, then return an error.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c     | 6 +++++-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c     | 5 +++--
>  drivers/gpu/drm/panfrost/panfrost_mmu.h     | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 9 ++++++++-
>  4 files changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 3f4f0682d69d..fba1a376f593 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -214,7 +214,11 @@ static int panfrost_job_hw_submit(struct panfrost_jo=
b *job, int js)
>  		goto err_hwsubmit;
>  	}
> =20
> -	cfg =3D panfrost_mmu_as_get(pfdev, job->mmu);
> +	ret =3D panfrost_mmu_as_get(pfdev, job->mmu);
> +	if (ret < 0)
> +		goto err_hwsubmit;
> +
> +	cfg =3D (u32)ret;
> =20
>  	job_write(pfdev, JS_HEAD_NEXT_LO(js), lower_32_bits(jc_head));
>  	job_write(pfdev, JS_HEAD_NEXT_HI(js), upper_32_bits(jc_head));
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index 2189e42d2bfa..03ac527b35e7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -155,7 +155,7 @@ static void panfrost_mmu_disable(struct panfrost_devi=
ce *pfdev, u32 as_nr)
>  	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
>  }
> =20
> -u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_m=
mu *mmu)
> +int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_m=
mu *mmu)
>  {
>  	int as;
> =20
> @@ -197,7 +197,8 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev=
, struct panfrost_mmu *mmu)
>  			if (!atomic_read(&lru_mmu->as_count))
>  				break;
>  		}
> -		WARN_ON(&lru_mmu->list =3D=3D &pfdev->as_lru_list);
> +		if (WARN_ON(&lru_mmu->list =3D=3D &pfdev->as_lru_list))
> +			return -EBUSY;
> =20
>  		list_del_init(&lru_mmu->list);
>  		as =3D lru_mmu->as;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.h
> index 022a9a74a114..e6e6966a0cca 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> @@ -16,7 +16,7 @@ void panfrost_mmu_fini(struct panfrost_device *pfdev);
>  void panfrost_mmu_reset(struct panfrost_device *pfdev);
>  void panfrost_mmu_suspend_irq(struct panfrost_device *pfdev);
> =20
> -u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_m=
mu *mmu);
> +int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_m=
mu *mmu);
>  void panfrost_mmu_as_put(struct panfrost_device *pfdev, struct panfrost_=
mmu *mmu);
> =20
>  struct panfrost_mmu *panfrost_mmu_ctx_get(struct panfrost_mmu *mmu);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/dr=
m/panfrost/panfrost_perfcnt.c
> index f30817bcf8ba..2145f9707dde 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -130,7 +130,12 @@ static int panfrost_perfcnt_enable_locked(struct pan=
frost_device *pfdev,
> =20
>  	perfcnt->user =3D user;
> =20
> -	as =3D panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
> +	ret =3D panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
> +	if (ret)
> +		goto err_unsetuser;
> +
> +	as =3D (u32)ret;

I don't think the explicit cast is needed, since you've already checked
that the result is positive.

Looks good otherwise.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +
>  	cfg =3D GPU_PERFCNT_CFG_AS(as) |
>  	      GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_MANUAL);
> =20
> @@ -164,6 +169,8 @@ static int panfrost_perfcnt_enable_locked(struct panf=
rost_device *pfdev,
> =20
>  	return 0;
> =20
> +err_unsetuser:
> +	perfcnt->user =3D NULL;
>  err_vunmap:
>  	drm_gem_vunmap_unlocked(&bo->base, &map);
>  err_put_mapping:

