Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BDBA443D5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBFE10E704;
	Tue, 25 Feb 2025 15:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MLWQZpXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4526210E704
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740495905;
 bh=xCTtrHDdXUTIma0E6i1UNMQGYB9gWHwdyQbD5ikxQig=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MLWQZpXzxGEwiizt3jBSXSieYKq5MHfftP6Zw4kzkzUVZ6eyd+EhyCwqgrrWqKnt7
 mFhuEpstRuKMWuY+ONICCuMs6jxVOefolMEMx5fOWERsqa33NhtVvhDv70yl289oP6
 QD/r/0Al8nXN/t34OV6fYGmiWrNsv0jvWyplMxHH6Rj7Mth47iRccC2Plk0YxNcWoC
 Sb43qL4SUXJBtWDfBwra2nSbj9AzwcDhlED0Vs4poJMHQNRryp3taSnw7qgZUGqv5k
 sRN3og3MfutSmqt5eUrelyAn8fTtH15NvKNbyskHebDYD083sC0+boRJRBaEdwVnSR
 P0h26cIWx6I2A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FB5217E0CFA;
 Tue, 25 Feb 2025 16:05:04 +0100 (CET)
Date: Tue, 25 Feb 2025 16:04:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven
 Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com
Subject: Re: [RFC PATCH 6/7] drm/panfrost: Use shmem sparse allocation for
 heap BOs
Message-ID: <20250225160459.664ce342@collabora.com>
In-Reply-To: <20250218232552.3450939-7-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
 <20250218232552.3450939-7-adrian.larumbe@collabora.com>
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

On Tue, 18 Feb 2025 23:25:36 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Panfrost heap BOs grow on demand when the GPU triggers a page fault after
> accessing an address within the BO's virtual range.
>=20
> We still store the sgts we get back from the shmem sparse allocation func=
tion,
> since it was decided management of sparse memory SGTs should be done by c=
lient
> drivers rather than the shmem subsystem.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 12 ++--
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 85 +++++--------------------
>  3 files changed, 25 insertions(+), 74 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 8e0ff3efede7..0cda2c4e524f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -40,10 +40,10 @@ static void panfrost_gem_free_object(struct drm_gem_o=
bject *obj)
>  		int n_sgt =3D bo->base.base.size / SZ_2M;
> =20
>  		for (i =3D 0; i < n_sgt; i++) {
> -			if (bo->sgts[i].sgl) {
> -				dma_unmap_sgtable(pfdev->dev, &bo->sgts[i],
> +			if (bo->sgts[i]) {
> +				dma_unmap_sgtable(pfdev->dev, bo->sgts[i],
>  						  DMA_BIDIRECTIONAL, 0);
> -				sg_free_table(&bo->sgts[i]);
> +				sg_free_table(bo->sgts[i]);
>  			}
>  		}
>  		kvfree(bo->sgts);
> @@ -274,7 +274,11 @@ panfrost_gem_create(struct drm_device *dev, size_t s=
ize, u32 flags)
>  	if (flags & PANFROST_BO_HEAP)
>  		size =3D roundup(size, SZ_2M);
> =20
> -	shmem =3D drm_gem_shmem_create(dev, size);
> +	if (flags & PANFROST_BO_HEAP)
> +		shmem =3D drm_gem_shmem_create_sparse(dev, size);
> +	else
> +		shmem =3D drm_gem_shmem_create(dev, size);
> +
>  	if (IS_ERR(shmem))
>  		return ERR_CAST(shmem);
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index 7516b7ecf7fe..2a8d0752011e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -11,7 +11,7 @@ struct panfrost_mmu;
> =20
>  struct panfrost_gem_object {
>  	struct drm_gem_shmem_object base;
> -	struct sg_table *sgts;
> +	struct sg_table **sgts;

I guess using an xarray here would make sense. Or maybe even an
sg_append_table, since we don't expect holes in the populated pages.
This makes me wonder if we really want the gem_shmem layer to automate
sgt creation for sparse GEM objects. Looks like something the driver
can easily optimize for its use-case.
