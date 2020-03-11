Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF0118148B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 10:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464D26E94F;
	Wed, 11 Mar 2020 09:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF7D6E428;
 Wed, 11 Mar 2020 09:19:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C517AAC1E;
 Wed, 11 Mar 2020 09:19:03 +0000 (UTC)
Subject: Re: [PATCH 20/51] drm: Handle dev->unique with drmm_
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-21-daniel.vetter@ffwll.ch>
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
Message-ID: <537a798f-5e08-f7e9-7cec-f76fe72c5a79@suse.de>
Date: Wed, 11 Mar 2020 10:19:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-21-daniel.vetter@ffwll.ch>
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
Content-Type: multipart/mixed; boundary="===============1778017529=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1778017529==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pMYJjsrdKW78TbLyIl7ZalCecsSyyn1ky"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pMYJjsrdKW78TbLyIl7ZalCecsSyyn1ky
Content-Type: multipart/mixed; boundary="8Yihy74wrFbvSEK9MbqOB8Doe3nTBQcYd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <537a798f-5e08-f7e9-7cec-f76fe72c5a79@suse.de>
Subject: Re: [PATCH 20/51] drm: Handle dev->unique with drmm_
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-21-daniel.vetter@ffwll.ch>
In-Reply-To: <20200302222631.3861340-21-daniel.vetter@ffwll.ch>

--8Yihy74wrFbvSEK9MbqOB8Doe3nTBQcYd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 02.03.20 um 23:26 schrieb Daniel Vetter:
> We need to add a drmm_kstrdup for this, but let's start somewhere.
>=20
> This is not exactly perfect onion unwinding, but it's jsut a kfree so
> doesn't really matter at all.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_drv.c     |  5 ++---
>  drivers/gpu/drm/drm_managed.c | 16 ++++++++++++++++
>  include/drm/drm_managed.h     |  1 +
>  3 files changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 1a048325f30e..ef79c03e311c 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -777,7 +777,6 @@ void drm_dev_fini(struct drm_device *dev)
>  	mutex_destroy(&dev->filelist_mutex);
>  	mutex_destroy(&dev->struct_mutex);
>  	drm_legacy_destroy_members(dev);
> -	kfree(dev->unique);
>  }
>  EXPORT_SYMBOL(drm_dev_fini);
> =20
> @@ -1068,8 +1067,8 @@ EXPORT_SYMBOL(drm_dev_unregister);
>   */
>  int drm_dev_set_unique(struct drm_device *dev, const char *name)
>  {
> -	kfree(dev->unique);
> -	dev->unique =3D kstrdup(name, GFP_KERNEL);
> +	drmm_kfree(dev, dev->unique);
> +	dev->unique =3D drmm_kstrdup(dev, name, GFP_KERNEL);
> =20
>  	return dev->unique ? 0 : -ENOMEM;
>  }
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_manage=
d.c
> index 57dc79fa90af..514d5bd42446 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -160,6 +160,22 @@ void *drmm_kmalloc(struct drm_device *dev, size_t =
size, gfp_t gfp)
>  }
>  EXPORT_SYMBOL(drmm_kmalloc);
> =20
> +char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)
> +{
> +	size_t size;
> +	char *buf;
> +
> +	if (!s)
> +		return NULL;
> +
> +	size =3D strlen(s) + 1;
> +	buf =3D drmm_kmalloc(dev, size, gfp);
> +	if (buf)
> +		memcpy(buf, s, size);
> +	return buf;
> +}
> +EXPORT_SYMBOL_GPL(drmm_kstrdup);
> +
>  void drmm_kfree(struct drm_device *dev, void *data)
>  {
>  	struct drmres *dr_match =3D NULL, *dr;
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 7b5df7d09b19..89e6fce9f689 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -24,6 +24,7 @@ static inline void *drmm_kzalloc(struct drm_device *d=
ev, size_t size, gfp_t gfp)
>  {
>  	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
>  }
> +char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
> =20
>  void drmm_kfree(struct drm_device *dev, void *data);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--8Yihy74wrFbvSEK9MbqOB8Doe3nTBQcYd--

--pMYJjsrdKW78TbLyIl7ZalCecsSyyn1ky
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5orQcACgkQaA3BHVML
eiOVlgf+LxxN5XPbMgwsTTa63RP+hkPwYCDxEPt2v0eOv1q01g1cmcxefXs4itXU
iQrV0plhV6Z7cBL/FRmEuNqCPf6LeVkfiekyFBkpTSZmGvSGsOw0GaY0HpOvWEnZ
zkhpAzoC61nvnvtdP79au7qCu0p0ifoTuQUUN0RyZLYkTtA591TQHHteibI70nw5
1cgCBk/8+OoNO1JYxXJg3cgB3veDniKCo4iEZsz1nTJ3B5+1DjgYj0q8kb6VCAhq
2p5IZifcsAbEaPtRrCjPdrtzl6jXK0sDQMve+ezIP6T0fACh2tE7WC8bO8YILT+V
Df1lAuogVYJOb1OQxa9LhflaEAxplA==
=EFh9
-----END PGP SIGNATURE-----

--pMYJjsrdKW78TbLyIl7ZalCecsSyyn1ky--

--===============1778017529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1778017529==--
