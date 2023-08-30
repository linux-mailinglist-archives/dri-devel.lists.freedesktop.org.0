Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAD678D51D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 12:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CED10E065;
	Wed, 30 Aug 2023 10:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42BE10E065;
 Wed, 30 Aug 2023 10:31:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 008496607236;
 Wed, 30 Aug 2023 11:31:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693391496;
 bh=TrJml6JTyiAfnpRokZqFxLCk8+PH5QpvXEDiBbE4KFE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RPuNObdK89/bg/iE2BCYHdx5acPZCVw+0Pdu/h2oa3Ss0pGLXUEtC9kFF3LMt0xNz
 U1ty746my09ett0Vu5PMCNiz15Ca2aHvKOx/b6iRJUm0Cdu5AR8XHpkIEvBTf4in3+
 +of4Uwxb9gV6rOypfEBLuW65bKTUG8BHyqSwqdN37IeVblgY75KfJlybjfvJaMYKJH
 lo3COHmt6BbZnsIrGcdT9nMJUQtv3XRkpP2oxgwVLPDdWeCDGv6knUJ8m/otpM8DtU
 DXt3bunZc+T/5i6NUPnnUZjHUbeXZ6FiANV26p5kINdMrfsEYc8vmKwA+YOo9+5Cn9
 1cDTbAih03X+A==
Date: Wed, 30 Aug 2023 12:31:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v2 3/6] drm/panfrost: Add fdinfo support for memory stats
Message-ID: <20230830122641.78d21f94@collabora.com>
In-Reply-To: <20230824013604.466224-4-adrian.larumbe@collabora.com>
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-4-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023 02:34:46 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> A new DRM GEM object function is added so that drm_show_memory_stats can
> provider more accurate memory usage numbers.

  s/provider/provide/

>=20
> Ideally, in panfrost_gem_status, the BO's purgeable flag would be checked
> after locking the driver's shrinker mutex, but drm_show_memory_stats takes
> over the drm file's object handle database spinlock, so there's potential
> for a race condition here.

Yeah, I don't think it matters much if we report a BO non-purgeable,
and this BO becomes purgeable in the meantime. You'd have the same
problem

>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  9 +++++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 12 ++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  1 +
>  3 files changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 3fd372301019..93d5f5538c0b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -440,11 +440,14 @@ static int panfrost_ioctl_madvise(struct drm_device=
 *dev, void *data,
>  	args->retained =3D drm_gem_shmem_madvise(&bo->base, args->madv);
> =20
>  	if (args->retained) {
> -		if (args->madv =3D=3D PANFROST_MADV_DONTNEED)
> +		if (args->madv =3D=3D PANFROST_MADV_DONTNEED) {
>  			list_move_tail(&bo->base.madv_list,
>  				       &pfdev->shrinker_list);
> -		else if (args->madv =3D=3D PANFROST_MADV_WILLNEED)
> +			bo->is_purgable =3D true;
> +		} else if (args->madv =3D=3D PANFROST_MADV_WILLNEED) {
>  			list_del_init(&bo->base.madv_list);
> +			bo->is_purgable =3D false;

Should we really flag the BO as purgeable if it's already been evicted
(args->retained =3D=3D false)?

> +		}
>  	}
> =20
>  out_unlock_mappings:
> @@ -559,6 +562,8 @@ static void panfrost_show_fdinfo(struct drm_printer *=
p, struct drm_file *file)
>  	struct panfrost_device *pfdev =3D dev->dev_private;
> =20
>  	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
> +
> +	drm_show_memory_stats(p, file);
>  }
> =20
>  static const struct file_operations panfrost_drm_driver_fops =3D {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 3c812fbd126f..aea16b0e4dda 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -195,6 +195,17 @@ static int panfrost_gem_pin(struct drm_gem_object *o=
bj)
>  	return drm_gem_shmem_pin(&bo->base);
>  }
> =20
> +static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_obj=
ect *obj)
> +{
> +	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> +	enum drm_gem_object_status res =3D 0;
> +
> +	res |=3D (bo->is_purgable) ? DRM_GEM_OBJECT_PURGEABLE : 0;

Why not checking bo->base.madv here instead of adding an is_purgeable
field?

> +
> +	res |=3D (bo->base.pages) ? DRM_GEM_OBJECT_RESIDENT : 0;

Does it make sense to have DRM_GEM_OBJECT_PURGEABLE set when
DRM_GEM_OBJECT_RESIDENT is not?

> +
> +	return res;
> +}
>  static const struct drm_gem_object_funcs panfrost_gem_funcs =3D {
>  	.free =3D panfrost_gem_free_object,
>  	.open =3D panfrost_gem_open,
> @@ -206,6 +217,7 @@ static const struct drm_gem_object_funcs panfrost_gem=
_funcs =3D {
>  	.vmap =3D drm_gem_shmem_object_vmap,
>  	.vunmap =3D drm_gem_shmem_object_vunmap,
>  	.mmap =3D drm_gem_shmem_object_mmap,
> +	.status =3D panfrost_gem_status,
>  	.vm_ops =3D &drm_gem_shmem_vm_ops,
>  };
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index ad2877eeeccd..e06f7ceb8f73 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -38,6 +38,7 @@ struct panfrost_gem_object {
> =20
>  	bool noexec		:1;
>  	bool is_heap		:1;
> +	bool is_purgable	:1;
>  };
> =20
>  struct panfrost_gem_mapping {

