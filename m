Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E9B31E25
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1148F10EB52;
	Fri, 22 Aug 2025 15:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bFHhYENV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0011910EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755875984;
 bh=b+U/Ol4MM9rLDVy0GoEfsBXq9jvTpY0zPypiMS15SIk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bFHhYENVOpkZBqnjHBnfFnVUQQQhKH44gVtiCsU20obdYAeZ/QUGtVJI+diWruTn/
 zNohb6bkM2mv9h3DF/h1taOmtDwnfatQ/R28G+EMBiGaeVFGa7zbvxu+7g5BogECGD
 yVc3l/qIqLgoATznyOkdvLg2uJyzBxe7BpsokoeIy8WR+VMX87hDxpn/uDlT1XmWWb
 9Vw5YufsXhjyZWy7FJLWvaWVFcTxht/0dHTwDbZa3oj/Zkfug6aiuI4DBTtoXRkyUo
 N8WDXj3UQ5GBPMOmDk/DhZsx50o3jiby4eKJqnx45z2jLuySiqAxc52jH7OQiOlvMh
 OEeFLZ0NtbHRw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 72BE417E12FF;
 Fri, 22 Aug 2025 17:19:44 +0200 (CEST)
Date: Fri, 22 Aug 2025 17:19:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?B?TG/Dr2M=?= Molinari
 <loic.molinari@collabora.com>, Faith Ekstrand
 <faith.ekstrand@collabora.com>
Subject: Re: [PATCH 2/7] drm/panthor: Add flag to map GEM object Write-Back
 Cacheable
Message-ID: <20250822171939.0fc2bbb2@fedora>
In-Reply-To: <20250822142954.902402-3-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
 <20250822142954.902402-3-faith.ekstrand@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Fri, 22 Aug 2025 10:29:11 -0400
Faith Ekstrand <faith@gfxstrand.net> wrote:

> From: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c |  7 ++++++-
>  drivers/gpu/drm/panthor/panthor_gem.c |  3 +++
>  include/uapi/drm/panthor_drm.h        | 10 ++++++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 1116f2d2826e..06ae6a2aeb16 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -899,7 +899,8 @@ static int panthor_ioctl_vm_destroy(struct drm_device=
 *ddev, void *data,
>  	return panthor_vm_pool_destroy_vm(pfile->vms, args->id);
>  }
> =20
> -#define PANTHOR_BO_FLAGS		DRM_PANTHOR_BO_NO_MMAP
> +#define PANTHOR_BO_FLAGS		(DRM_PANTHOR_BO_NO_MMAP | \
> +					 DRM_PANTHOR_BO_WB_MMAP)
> =20
>  static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
>  				   struct drm_file *file)
> @@ -918,6 +919,10 @@ static int panthor_ioctl_bo_create(struct drm_device=
 *ddev, void *data,
>  		goto out_dev_exit;
>  	}
> =20
> +	if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
> +	    (args->flags & DRM_PANTHOR_BO_WB_MMAP))
> +		return -EINVAL;

I know it's obvious, but I'd still add a comment explaining why WB_MMAP
can't be set if NO_MMAP is.

> +
>  	if (args->exclusive_vm_id) {
>  		vm =3D panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);
>  		if (!vm) {
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index a123bc740ba1..530bad12d545 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -283,6 +283,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  	bo =3D to_panthor_bo(&shmem->base);
>  	bo->flags =3D flags;
> =20
> +	if (flags & DRM_PANTHOR_BO_WB_MMAP)
> +		shmem->map_wc =3D false;
> +
>  	if (exclusive_vm) {
>  		bo->exclusive_vm_root_gem =3D panthor_vm_root_gem(exclusive_vm);
>  		drm_gem_object_get(bo->exclusive_vm_root_gem);
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_dr=
m.h
> index e1f43deb7eca..bf47369c0220 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -635,6 +635,16 @@ struct drm_panthor_vm_get_state {
>  enum drm_panthor_bo_flags {
>  	/** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-mapped=
 in userspace. */
>  	DRM_PANTHOR_BO_NO_MMAP =3D (1 << 0),
> +
> +	/**
> +	 *@DRM_PANTHOR_BO_WB_MMAP: Force "Write-Back Cacheable" CPU mapping.

          ^ missing space after '*'

> +	 *
> +	 * CPU map the buffer object in userspace by forcing the "Write-Back
> +	 * Cacheable" cacheability attribute. The mapping otherwise uses the
> +	 * "Non-Cacheable" attribute if the ACE-Lite coherency protocol isn't
> +	 * supported by the GPU.
> +	 */
> +	DRM_PANTHOR_BO_WB_MMAP =3D (1 << 1),

We probably want to expose the coherency caps before introducing this
flag (through some DEV_QUERY argument), so the UMD knows when it can
skip cache maintenance operations.

>  };
> =20
>  /**

