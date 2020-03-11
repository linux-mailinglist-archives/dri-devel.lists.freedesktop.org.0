Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC3181453
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 10:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA21A6E94B;
	Wed, 11 Mar 2020 09:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9038C6E948;
 Wed, 11 Mar 2020 09:15:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29002AC1E;
 Wed, 11 Mar 2020 09:15:50 +0000 (UTC)
Subject: Re: [PATCH 19/51] drm: Cleanups after drmm_add_final_kfree rollout
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-20-daniel.vetter@ffwll.ch>
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
Message-ID: <c32c7240-5963-1cf2-9141-59012df562af@suse.de>
Date: Wed, 11 Mar 2020 10:15:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-20-daniel.vetter@ffwll.ch>
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
Content-Type: multipart/mixed; boundary="===============1561659469=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1561659469==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MuuQeoWDn1LGcy2ATtla6RwKeRTtvGdnB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MuuQeoWDn1LGcy2ATtla6RwKeRTtvGdnB
Content-Type: multipart/mixed; boundary="kSbB1oygyyXotTCBOH9w9dPm5MOzYmHUv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <c32c7240-5963-1cf2-9141-59012df562af@suse.de>
Subject: Re: [PATCH 19/51] drm: Cleanups after drmm_add_final_kfree rollout
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-20-daniel.vetter@ffwll.ch>
In-Reply-To: <20200302222631.3861340-20-daniel.vetter@ffwll.ch>

--kSbB1oygyyXotTCBOH9w9dPm5MOzYmHUv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 02.03.20 um 23:25 schrieb Daniel Vetter:
> A few things:
> - Update the example driver in the documentation.
> - We can drop the old kfree in drm_dev_release.
> - Add a WARN_ON check in drm_dev_register to make sure everyone calls
>   drmm_add_final_kfree and there's no leaks.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_drv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7b84ee8a5eb5..1a048325f30e 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -297,8 +297,6 @@ void drm_minor_release(struct drm_minor *minor)
>   *
>   *		drm_mode_config_cleanup(drm);
>   *		drm_dev_fini(drm);
> - *		kfree(priv->userspace_facing);
> - *		kfree(priv);
>   *	}
>   *
>   *	static struct drm_driver driver_drm_driver =3D {
> @@ -326,10 +324,11 @@ void drm_minor_release(struct drm_minor *minor)
>   *			kfree(drm);
>   *			return ret;
>   *		}
> + *		drmm_add_final_kfree(drm, priv);
>   *
>   *		drm_mode_config_init(drm);
>   *
> - *		priv->userspace_facing =3D kzalloc(..., GFP_KERNEL);
> + *		priv->userspace_facing =3D drmm_kzalloc(..., GFP_KERNEL);
>   *		if (!priv->userspace_facing)
>   *			return -ENOMEM;
>   *
> @@ -961,6 +960,8 @@ int drm_dev_register(struct drm_device *dev, unsign=
ed long flags)
>  	struct drm_driver *driver =3D dev->driver;
>  	int ret;
> =20
> +	WARN_ON(!dev->managed.final_kfree);
> +
>  	if (drm_dev_needs_global_mutex(dev))
>  		mutex_lock(&drm_global_mutex);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--kSbB1oygyyXotTCBOH9w9dPm5MOzYmHUv--

--MuuQeoWDn1LGcy2ATtla6RwKeRTtvGdnB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5orEUACgkQaA3BHVML
eiPekAf/dFkylX+HYejopzANj0iwPvbq6hCbMprthlBGya+rfsQZ8OH4ybXXDxji
Sx1suWGAXQMD5aVVOKV/duMQ1rRczCA+r8e5I0CO063LSJW+vk0K1/dIarDTafc5
28KlhwrwXGv07cPpbHouFwT/oKCTDfFEIfaIQKvvdHied599EWUEfrHTJt8ln4Vy
o68An7GOvE9Xp0+0GSD6dCSnH6SGP9kUij2BTs4PkFxwVgIC8VNbSPAKfesaeiyD
YT8lJZhRiLz2V03btHv+Y73LeXachOWQTo2iCzkCtZAhglsM/js1YfS0STvFKhD8
QlLofMhsaKOvisT7SmERpWRqZN3c1A==
=tZmg
-----END PGP SIGNATURE-----

--MuuQeoWDn1LGcy2ATtla6RwKeRTtvGdnB--

--===============1561659469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1561659469==--
