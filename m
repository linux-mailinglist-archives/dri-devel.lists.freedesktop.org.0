Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1AD18151B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 10:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4936E95D;
	Wed, 11 Mar 2020 09:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252316E95D;
 Wed, 11 Mar 2020 09:39:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C7176AB3D;
 Wed, 11 Mar 2020 09:39:16 +0000 (UTC)
Subject: Re: [PATCH 21/51] drm: Use drmm_ for drm_dev_init cleanup
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-22-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <51a1d5a5-566f-89f0-2edf-5dd557c5f81a@suse.de>
Date: Wed, 11 Mar 2020 10:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-22-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2133529617=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2133529617==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="X6vy4O3PnOAPQj4mERJNVpmrpdAeVogdK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X6vy4O3PnOAPQj4mERJNVpmrpdAeVogdK
Content-Type: multipart/mixed; boundary="MDKp7WoPMnzUjYzVxBPTqJPA7ZPFMVduT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <51a1d5a5-566f-89f0-2edf-5dd557c5f81a@suse.de>
Subject: Re: [PATCH 21/51] drm: Use drmm_ for drm_dev_init cleanup
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-22-daniel.vetter@ffwll.ch>
In-Reply-To: <20200302222631.3861340-22-daniel.vetter@ffwll.ch>

--MDKp7WoPMnzUjYzVxBPTqJPA7ZPFMVduT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.03.20 um 23:26 schrieb Daniel Vetter:
> Well for the simple stuff at least, vblank, gem and minor cleanup I
> want to further split up as a demonstration.
>=20
> v2: We need to clear drm_device->dev otherwise the debug drm printing
> after our cleanup hook (e.g. in drm_manged_release) will chase
> released memory and result in a use-after-free. Not really pretty, but
> oh well.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 48 ++++++++++++++++++++-------------------=

>  1 file changed, 25 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index ef79c03e311c..23e5b0e7e041 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -580,6 +580,23 @@ static void drm_fs_inode_free(struct inode *inode)=

>   *    used.
>   */
> =20
> +static void drm_dev_init_release(struct drm_device *dev, void *res)
> +{
> +	drm_legacy_ctxbitmap_cleanup(dev);
> +	drm_legacy_remove_map_hash(dev);
> +	drm_fs_inode_free(dev->anon_inode);
> +
> +	put_device(dev->dev);
> +	/* Prevent use-after-free in drm_managed_release when debugging is
> +	 * enabled. Slightly awkward, but can't really be helped. */
> +	dev->dev =3D NULL;
> +	mutex_destroy(&dev->master_mutex);
> +	mutex_destroy(&dev->clientlist_mutex);
> +	mutex_destroy(&dev->filelist_mutex);
> +	mutex_destroy(&dev->struct_mutex);
> +	drm_legacy_destroy_members(dev);
> +}
> +
>  /**
>   * drm_dev_init - Initialise new DRM device
>   * @dev: DRM device
> @@ -647,11 +664,15 @@ int drm_dev_init(struct drm_device *dev,
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> =20
> +	ret =3D drmm_add_action(dev, drm_dev_init_release, NULL);
> +	if (ret)
> +		return ret;
> +

Is this code supposed to stay for the long term? As devices are
allocated dynamically, I can imagine that there will be a call that
allocates the memory and, at the same time, sets drm_dev_init_release()
as the release callback.

The question is also released to patch 3, where I proposed to rename
__drm_add_action() to __drmm_kzalloc().

>  	dev->anon_inode =3D drm_fs_inode_new();
>  	if (IS_ERR(dev->anon_inode)) {
>  		ret =3D PTR_ERR(dev->anon_inode);
>  		DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
> -		goto err_free;
> +		goto err;
>  	}
> =20
>  	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
> @@ -688,19 +709,12 @@ int drm_dev_init(struct drm_device *dev,
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_destroy(dev);
>  err_ctxbitmap:
> -	drm_legacy_ctxbitmap_cleanup(dev);
> -	drm_legacy_remove_map_hash(dev);
>  err_minors:
>  	drm_minor_free(dev, DRM_MINOR_PRIMARY);
>  	drm_minor_free(dev, DRM_MINOR_RENDER);
> -	drm_fs_inode_free(dev->anon_inode);
> -err_free:
> -	put_device(dev->dev);
> -	mutex_destroy(&dev->master_mutex);
> -	mutex_destroy(&dev->clientlist_mutex);
> -	mutex_destroy(&dev->filelist_mutex);
> -	mutex_destroy(&dev->struct_mutex);
> -	drm_legacy_destroy_members(dev);
> +err:
> +	drm_managed_release(dev);
> +

Here's more of a general observation than a comment on the actual patch:

One odd thing about the overall interface is that there's no way of
updating the release callback afterwards. In an OOP language, such as
C++, an error within the constructor would rollback the performed
actions and return without calling the destructor. Destructors only run
for fully constructed objects.

In our case, the equivalent is to run the init function and set
drm_dev_init_release() as the final step. The init's rollback-code would
have to stay, obviously.

Best regards
Thomas

>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_dev_init);
> @@ -763,20 +777,8 @@ void drm_dev_fini(struct drm_device *dev)
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_destroy(dev);
> =20
> -	drm_legacy_ctxbitmap_cleanup(dev);
> -	drm_legacy_remove_map_hash(dev);
> -	drm_fs_inode_free(dev->anon_inode);
> -
>  	drm_minor_free(dev, DRM_MINOR_PRIMARY);
>  	drm_minor_free(dev, DRM_MINOR_RENDER);
> -
> -	put_device(dev->dev);
> -
> -	mutex_destroy(&dev->master_mutex);
> -	mutex_destroy(&dev->clientlist_mutex);
> -	mutex_destroy(&dev->filelist_mutex);
> -	mutex_destroy(&dev->struct_mutex);
> -	drm_legacy_destroy_members(dev);
>  }
>  EXPORT_SYMBOL(drm_dev_fini);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--MDKp7WoPMnzUjYzVxBPTqJPA7ZPFMVduT--

--X6vy4O3PnOAPQj4mERJNVpmrpdAeVogdK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5oscEACgkQaA3BHVML
eiOOZwf+Iw0CnNoXLMKDu9JBYQO2Ay/No0n5gRMXl++PAqmeKCxLXLxtKFa4I4nW
juojR0HDGfE4GHXc6UvAMak1i8b3zTQqmxwOubGJONWlblYr+hlevk1uOBwHjevU
MaHv3cPdem/+5bXz0k3cULrB1aB4A4n5eca5LwOpEFvgMyGYm6x3a8kIjmpSXnrY
aIKCGqkPWIw0UEHycdYpjxDgAN8j/dAqovJes+i7HPhbWd+CNFWjsUiBhq1hMzpe
4R6+Oa0RNR4nse5I4q5ER2SxfguIEwAgSSQvu4WWE1nNN3avblhbjIuCuro+2L+n
Jb72FZb9zSCC1ADlZhjw03+OXUqqfA==
=LUgD
-----END PGP SIGNATURE-----

--X6vy4O3PnOAPQj4mERJNVpmrpdAeVogdK--

--===============2133529617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2133529617==--
