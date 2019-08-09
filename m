Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ADD88BB0
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81106E42D;
	Sat, 10 Aug 2019 13:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0F16EEAB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id F2B1428A1D9
Date: Fri, 9 Aug 2019 14:38:19 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/9] drm/panfrost: Restructure the GEM object creation
Message-ID: <20190809213819.GA15496@kevin>
References: <20190808222200.13176-1-robh@kernel.org>
 <20190808222200.13176-4-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190808222200.13176-4-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:12 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0513382500=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0513382500==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Still A-b :)
On Thu, Aug 08, 2019 at 04:21:54PM -0600, Rob Herring wrote:
> Setting the GPU VA when creating the GEM object doesn't allow for any
> conditional adjustments to the mapping. In preparation to support
> adjusting the mapping and per FD address spaces, restructure the GEM
> object creation to map and unmap the GEM object in the GEM object .open()
> and .close() hooks.
>=20
> While panfrost_gem_free_object() and panfrost_gem_prime_import_sg_table()
> are not really needed after this commit, keep them as we'll need them in
> subsequent commits.
>=20
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Steven, Alyssa, I kept your tags, but please take another look as things
> moved around a bit here.
>=20
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  9 ----
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 67 ++++++++++++++-----------
>  2 files changed, 37 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 926d021ee202..2894cfbbce2b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -78,7 +78,6 @@ static int panfrost_ioctl_get_param(struct drm_device *=
ddev, void *data, struct
>  static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>  		struct drm_file *file)
>  {
> -	int ret;
>  	struct drm_gem_shmem_object *shmem;
>  	struct drm_panfrost_create_bo *args =3D data;
>=20
> @@ -90,17 +89,9 @@ static int panfrost_ioctl_create_bo(struct drm_device =
*dev, void *data,
>  	if (IS_ERR(shmem))
>  		return PTR_ERR(shmem);
>=20
> -	ret =3D panfrost_mmu_map(to_panfrost_bo(&shmem->base));
> -	if (ret)
> -		goto err_free;
> -
>  	args->offset =3D to_panfrost_bo(&shmem->base)->node.start << PAGE_SHIFT;
>=20
>  	return 0;
> -
> -err_free:
> -	drm_gem_handle_delete(file, args->handle);
> -	return ret;
>  }
>=20
>  /**
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 67d374184340..3933f83ba6b0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -15,6 +15,39 @@
>   * BO.
>   */
>  static void panfrost_gem_free_object(struct drm_gem_object *obj)
> +{
> +	mutex_lock(&pfdev->shrinker_lock);
> +	if (!list_empty(&bo->base.madv_list))
> +		list_del(&bo->base.madv_list);
> +	mutex_unlock(&pfdev->shrinker_lock);
> +
> +	drm_gem_shmem_free_object(obj);
> +}
> +
> +static int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file=
 *file_priv)
> +{
> +	int ret;
> +	size_t size =3D obj->size;
> +	u64 align =3D size >=3D SZ_2M ? SZ_2M >> PAGE_SHIFT : 0;
> +	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> +	struct panfrost_device *pfdev =3D obj->dev->dev_private;
> +
> +	spin_lock(&pfdev->mm_lock);
> +	ret =3D drm_mm_insert_node_generic(&pfdev->mm, &bo->node,
> +					 size >> PAGE_SHIFT, align, 0, 0);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D panfrost_mmu_map(bo);
> +	if (ret)
> +		drm_mm_remove_node(&bo->node);
> +
> +out:
> +	spin_unlock(&pfdev->mm_lock);
> +	return ret;
> +}
> +
> +static void panfrost_gem_close(struct drm_gem_object *obj, struct drm_fi=
le *file_priv)
>  {
>  	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
>  	struct panfrost_device *pfdev =3D obj->dev->dev_private;
> @@ -23,19 +56,15 @@ static void panfrost_gem_free_object(struct drm_gem_o=
bject *obj)
>  		panfrost_mmu_unmap(bo);
>=20
>  	spin_lock(&pfdev->mm_lock);
> -	drm_mm_remove_node(&bo->node);
> +	if (drm_mm_node_allocated(&bo->node))
> +		drm_mm_remove_node(&bo->node);
>  	spin_unlock(&pfdev->mm_lock);
> -
> -	mutex_lock(&pfdev->shrinker_lock);
> -	if (!list_empty(&bo->base.madv_list))
> -		list_del(&bo->base.madv_list);
> -	mutex_unlock(&pfdev->shrinker_lock);
> -
> -	drm_gem_shmem_free_object(obj);
>  }
>=20
>  static const struct drm_gem_object_funcs panfrost_gem_funcs =3D {
>  	.free =3D panfrost_gem_free_object,
> +	.open =3D panfrost_gem_open,
> +	.close =3D panfrost_gem_close,
>  	.print_info =3D drm_gem_shmem_print_info,
>  	.pin =3D drm_gem_shmem_pin,
>  	.unpin =3D drm_gem_shmem_unpin,
> @@ -55,10 +84,7 @@ static const struct drm_gem_object_funcs panfrost_gem_=
funcs =3D {
>   */
>  struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev=
, size_t size)
>  {
> -	int ret;
> -	struct panfrost_device *pfdev =3D dev->dev_private;
>  	struct panfrost_gem_object *obj;
> -	u64 align;
>=20
>  	obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
>  	if (!obj)
> @@ -66,21 +92,7 @@ struct drm_gem_object *panfrost_gem_create_object(stru=
ct drm_device *dev, size_t
>=20
>  	obj->base.base.funcs =3D &panfrost_gem_funcs;
>=20
> -	size =3D roundup(size, PAGE_SIZE);
> -	align =3D size >=3D SZ_2M ? SZ_2M >> PAGE_SHIFT : 0;
> -
> -	spin_lock(&pfdev->mm_lock);
> -	ret =3D drm_mm_insert_node_generic(&pfdev->mm, &obj->node,
> -					 size >> PAGE_SHIFT, align, 0, 0);
> -	spin_unlock(&pfdev->mm_lock);
> -	if (ret)
> -		goto free_obj;
> -
>  	return &obj->base.base;
> -
> -free_obj:
> -	kfree(obj);
> -	return ERR_PTR(ret);
>  }
>=20
>  struct drm_gem_object *
> @@ -89,15 +101,10 @@ panfrost_gem_prime_import_sg_table(struct drm_device=
 *dev,
>  				   struct sg_table *sgt)
>  {
>  	struct drm_gem_object *obj;
> -	struct panfrost_gem_object *pobj;
>=20
>  	obj =3D drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
>  	if (IS_ERR(obj))
>  		return ERR_CAST(obj);
>=20
> -	pobj =3D to_panfrost_bo(obj);
> -
> -	panfrost_mmu_map(pobj);
> -
>  	return obj;
>  }
> --
> 2.20.1

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1N58YACgkQ/v5QWgr1
WA3K4g//YMX750/5j3+0WkxTsTDE5cm9OhFvcS61wVntcv3PM9QLBNo2O0+yeqI0
Z4avYi0mTDkT5GtLiwu5faFR7i+75/NOLJA3cnm3Ei+Zg5Ui6w9TmQzD0aY6dLz2
ykiniEuPXBu6ZYADtvH91TYLzOoJQhaERRM6uR0iuYivwDYWtvqoOMFgoeQ5p9ZU
RzGz27kBdu9rfR8n5s0JqOvHbfo7kr+Oy89R1+vEiJK/Z23WTmrC+cAAQhyl0lNk
Se/VzOo9fv4d9OBclFzltcE13p6J717HrXVTPbHOIZEqdSA+IuKXR52Fwl+GS5Eu
2Oh2iQGRySN77Nj9Hrq+V7v35TlKgqTKxZPLqslR5LzgqfUTum3QRk+TGQa8eaQD
RMCIyLYZgrJyb6mArbg/EeoroNqLsT9021G3GaKjyv7cUCXcAgplQXpeic0k8RyK
url/WivwMZilb+JRgq0NMjVLC6d3WEWG6tl0gLShqnXyzcaiD3qj7AAknfycZ7jU
fECtZi3pqQlxZ8hmYk9jLx4/72eU7w2W7f0TDKFAMYht0z8NPjkIiJo7GDgdhenW
ag/QjNV/82xQbE2YgHAkPAAg1IaAF9iqO82A9C1hSf3r3lRbFK0mZfkShmRV3Pz6
ikDWsGPQ5QD3Lc5cweDBiCr2ck4X6AxA+droAnAYAfaQlynizsI=
=52x9
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

--===============0513382500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0513382500==--
