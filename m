Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C88CD31DF89
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 20:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E42E6E9B2;
	Wed, 17 Feb 2021 19:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184C26E4A2;
 Wed, 17 Feb 2021 19:22:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2703ABA2;
 Wed, 17 Feb 2021 19:22:26 +0000 (UTC)
Subject: Re: [PATCH v2 03/11] drm/qxl: use ttm bo priorities
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210217123213.2199186-1-kraxel@redhat.com>
 <20210217123213.2199186-4-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c29e0af0-8d6d-a024-3aef-93ac613f8829@suse.de>
Date: Wed, 17 Feb 2021 20:22:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217123213.2199186-4-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1002989930=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1002989930==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hwNu0hQmhLYE8QhoLCuGB5OcFL4qS0xDh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hwNu0hQmhLYE8QhoLCuGB5OcFL4qS0xDh
Content-Type: multipart/mixed; boundary="fhhaqP4i0zl0iMXywuIAZ51mQsbOFWJUz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <c29e0af0-8d6d-a024-3aef-93ac613f8829@suse.de>
Subject: Re: [PATCH v2 03/11] drm/qxl: use ttm bo priorities
References: <20210217123213.2199186-1-kraxel@redhat.com>
 <20210217123213.2199186-4-kraxel@redhat.com>
In-Reply-To: <20210217123213.2199186-4-kraxel@redhat.com>

--fhhaqP4i0zl0iMXywuIAZ51mQsbOFWJUz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.02.21 um 13:32 schrieb Gerd Hoffmann:
> Allow to set priorities for buffer objects.  Use priority 1 for surface=

> and cursor command releases.  Use priority 0 for drawing command
> releases.  That way the short-living drawing commands are first in line=

> when it comes to eviction, making it *much* less likely that
> ttm_bo_mem_force_space() picks something which can't be evicted and
> throws an error after waiting a while without success.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/qxl/qxl_object.h  |  1 +
>   drivers/gpu/drm/qxl/qxl_cmd.c     |  2 +-
>   drivers/gpu/drm/qxl/qxl_display.c |  4 ++--
>   drivers/gpu/drm/qxl/qxl_gem.c     |  2 +-
>   drivers/gpu/drm/qxl/qxl_object.c  |  5 +++--
>   drivers/gpu/drm/qxl/qxl_release.c | 18 ++++++++++++------
>   6 files changed, 20 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl=
_object.h
> index e60a8f88e226..dc1659e717f1 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.h
> +++ b/drivers/gpu/drm/qxl/qxl_object.h
> @@ -61,6 +61,7 @@ static inline u64 qxl_bo_mmap_offset(struct qxl_bo *b=
o)
>   extern int qxl_bo_create(struct qxl_device *qdev,
>   			 unsigned long size,
>   			 bool kernel, bool pinned, u32 domain,
> +			 u32 priority,
>   			 struct qxl_surface *surf,
>   			 struct qxl_bo **bo_ptr);
>   extern int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map);
> diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cm=
d.c
> index 7e22a81bfb36..7b00c955cd82 100644
> --- a/drivers/gpu/drm/qxl/qxl_cmd.c
> +++ b/drivers/gpu/drm/qxl/qxl_cmd.c
> @@ -269,7 +269,7 @@ int qxl_alloc_bo_reserved(struct qxl_device *qdev,
>   	int ret;
>  =20
>   	ret =3D qxl_bo_create(qdev, size, false /* not kernel - device */,
> -			    false, QXL_GEM_DOMAIN_VRAM, NULL, &bo);
> +			    false, QXL_GEM_DOMAIN_VRAM, 0, NULL, &bo);
>   	if (ret) {
>   		DRM_ERROR("failed to allocate VRAM BO\n");
>   		return ret;
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index ec50d2cfd4e1..a1b5cc5918bc 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -799,8 +799,8 @@ static int qxl_plane_prepare_fb(struct drm_plane *p=
lane,
>   				qdev->dumb_shadow_bo =3D NULL;
>   			}
>   			qxl_bo_create(qdev, surf.height * surf.stride,
> -				      true, true, QXL_GEM_DOMAIN_SURFACE, &surf,
> -				      &qdev->dumb_shadow_bo);
> +				      true, true, QXL_GEM_DOMAIN_SURFACE, 0,
> +				      &surf, &qdev->dumb_shadow_bo);
>   		}
>   		if (user_bo->shadow !=3D qdev->dumb_shadow_bo) {
>   			if (user_bo->shadow) {
> diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_ge=
m.c
> index 48e096285b4c..a08da0bd9098 100644
> --- a/drivers/gpu/drm/qxl/qxl_gem.c
> +++ b/drivers/gpu/drm/qxl/qxl_gem.c
> @@ -55,7 +55,7 @@ int qxl_gem_object_create(struct qxl_device *qdev, in=
t size,
>   	/* At least align on page size */
>   	if (alignment < PAGE_SIZE)
>   		alignment =3D PAGE_SIZE;
> -	r =3D qxl_bo_create(qdev, size, kernel, false, initial_domain, surf, =
&qbo);
> +	r =3D qxl_bo_create(qdev, size, kernel, false, initial_domain, 0, sur=
f, &qbo);
>   	if (r) {
>   		if (r !=3D -ERESTARTSYS)
>   			DRM_ERROR(
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl=
_object.c
> index 705b51535492..7eada4ad217b 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -103,8 +103,8 @@ static const struct drm_gem_object_funcs qxl_object=
_funcs =3D {
>   	.print_info =3D drm_gem_ttm_print_info,
>   };
>  =20
> -int qxl_bo_create(struct qxl_device *qdev,
> -		  unsigned long size, bool kernel, bool pinned, u32 domain,
> +int qxl_bo_create(struct qxl_device *qdev, unsigned long size,
> +		  bool kernel, bool pinned, u32 domain, u32 priority,
>   		  struct qxl_surface *surf,
>   		  struct qxl_bo **bo_ptr)
>   {
> @@ -137,6 +137,7 @@ int qxl_bo_create(struct qxl_device *qdev,
>  =20
>   	qxl_ttm_placement_from_domain(bo, domain);
>  =20
> +	bo->tbo.priority =3D priority;
>   	r =3D ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, size, type,
>   				 &bo->placement, 0, &ctx, NULL, NULL,
>   				 &qxl_ttm_bo_destroy);
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qx=
l_release.c
> index 579c6de10c8e..716d706ca7f0 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -160,11 +160,12 @@ qxl_release_free(struct qxl_device *qdev,
>   }
>  =20
>   static int qxl_release_bo_alloc(struct qxl_device *qdev,
> -				struct qxl_bo **bo)
> +				struct qxl_bo **bo,
> +				u32 priority)
>   {
>   	/* pin releases bo's they are too messy to evict */
>   	return qxl_bo_create(qdev, PAGE_SIZE, false, true,
> -			     QXL_GEM_DOMAIN_VRAM, NULL, bo);
> +			     QXL_GEM_DOMAIN_VRAM, priority, NULL, bo);
>   }
>  =20
>   int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *=
bo)
> @@ -287,13 +288,18 @@ int qxl_alloc_release_reserved(struct qxl_device =
*qdev, unsigned long size,
>   	int ret =3D 0;
>   	union qxl_release_info *info;
>   	int cur_idx;
> +	u32 priority;
>  =20
> -	if (type =3D=3D QXL_RELEASE_DRAWABLE)
> +	if (type =3D=3D QXL_RELEASE_DRAWABLE) {
>   		cur_idx =3D 0;
> -	else if (type =3D=3D QXL_RELEASE_SURFACE_CMD)
> +		priority =3D 0;
> +	} else if (type =3D=3D QXL_RELEASE_SURFACE_CMD) {
>   		cur_idx =3D 1;
> -	else if (type =3D=3D QXL_RELEASE_CURSOR_CMD)
> +		priority =3D 1;
> +	} else if (type =3D=3D QXL_RELEASE_CURSOR_CMD) {
>   		cur_idx =3D 2;
> +		priority =3D 1;
> +	}
>   	else {
>   		DRM_ERROR("got illegal type: %d\n", type);
>   		return -EINVAL;
> @@ -315,7 +321,7 @@ int qxl_alloc_release_reserved(struct qxl_device *q=
dev, unsigned long size,
>   		qdev->current_release_bo[cur_idx] =3D NULL;
>   	}
>   	if (!qdev->current_release_bo[cur_idx]) {
> -		ret =3D qxl_release_bo_alloc(qdev, &qdev->current_release_bo[cur_idx=
]);
> +		ret =3D qxl_release_bo_alloc(qdev, &qdev->current_release_bo[cur_idx=
], priority);
>   		if (ret) {
>   			mutex_unlock(&qdev->release_mutex);
>   			qxl_release_free(qdev, *release);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--fhhaqP4i0zl0iMXywuIAZ51mQsbOFWJUz--

--hwNu0hQmhLYE8QhoLCuGB5OcFL4qS0xDh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAtbPEFAwAAAAAACgkQlh/E3EQov+Ag
pw/+OAAQt84RWV+r5A486SoYxbeorXl5BDFuV1OPLQWTf5i9LoxtO3y+yrfOCQA967xM2gjCosKF
nc+W4gjQDBx8x4n2dz3WqKjtgosaCC2EfOKuihwme8UK1JoWIKPnHxXR/MfwquxDv+ZYDuziOexK
rTZmztb3IGBNgS5r2nDa3Lt9E/8XZ25AwETBM9vKVcZK2r3BOv/dOVr0V3RDzDEp6mIFXWfkzx7x
sEh7R8IxSgwad2Y9kXojIFzf/HDi6JeWzycX67DlzHdsyFomJ6DJjmoxah9tnGvlcGj51mi53nyB
DYQEMyVnseC9zpZlbpwomOefDWfGprFCEnhS/KriFRgvk90TzFE/lnSj6XfKq93N+ybMo8j20AIA
fpahUgoYDmIbsxWfxj3iesDXAt7/2K4CuUJDjApk5lS3YZ/dF7JnvhYPNNg3CJibEH5VsYC1dmsr
9aQPdtosZpZD7xabTaPKHKzq9tLTfXu3wjfj+lrOuS/6RnE8dYiY+oQNji39rOnWxwHnF4aME4+9
GLx1CQXIDBLznjAytBmoqWrblwc1Cjv/pUpUV3XtSTZU6xc2Y/JgckX4mmgdgxi9j9gFeO/eVwZM
PjrpWX7y1Pvhr3+Y3p54nTu6/MsZpxGzwAx+i5lFGCsOdKvs9CtRXW9SjDxfK3JWeJ1Sdrv6JFIn
rzU=
=pmRh
-----END PGP SIGNATURE-----

--hwNu0hQmhLYE8QhoLCuGB5OcFL4qS0xDh--

--===============1002989930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1002989930==--
