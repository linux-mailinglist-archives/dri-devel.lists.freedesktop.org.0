Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042CF181564
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 10:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66CD6E964;
	Wed, 11 Mar 2020 09:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36D86E964;
 Wed, 11 Mar 2020 09:59:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4AD2EAC26;
 Wed, 11 Mar 2020 09:59:19 +0000 (UTC)
Subject: Re: [PATCH 22/51] drm: manage drm_minor cleanup with drmm_
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-23-daniel.vetter@ffwll.ch>
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
Message-ID: <aa1dad07-9697-dea2-2b07-46f5ca7c0b9d@suse.de>
Date: Wed, 11 Mar 2020 10:59:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-23-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1169250612=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1169250612==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="u0MpIP7j30vNtrnyIseq8acPcxDf8y30z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--u0MpIP7j30vNtrnyIseq8acPcxDf8y30z
Content-Type: multipart/mixed; boundary="Ng3YEG9np2rnqWPTOW7ndc98aEazXZk7L";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <aa1dad07-9697-dea2-2b07-46f5ca7c0b9d@suse.de>
Subject: Re: [PATCH 22/51] drm: manage drm_minor cleanup with drmm_
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-23-daniel.vetter@ffwll.ch>
In-Reply-To: <20200302222631.3861340-23-daniel.vetter@ffwll.ch>

--Ng3YEG9np2rnqWPTOW7ndc98aEazXZk7L
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.03.20 um 23:26 schrieb Daniel Vetter:
> The cleanup here is somewhat tricky, since we can't tell apart the
> allocated minor index from 0. So register a cleanup action first, and
> if the index allocation fails, unregister that cleanup action again to
> avoid bad mistakes.
>=20
> The kdev for the minor already handles NULL, so no problem there.
>=20
> Hence add drmm_remove_action() to the drm_managed library.
>=20
> v2: Make pointer math around void ** consistent with what Laurent
> suggested.
>=20
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c     | 74 +++++++++++++----------------------=

>  drivers/gpu/drm/drm_managed.c | 28 +++++++++++++
>  include/drm/drm_managed.h     |  4 ++
>  3 files changed, 59 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 23e5b0e7e041..29d106195ab3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -93,19 +93,35 @@ static struct drm_minor **drm_minor_get_slot(struct=
 drm_device *dev,
>  	}
>  }
> =20
> +static void drm_minor_alloc_release(struct drm_device *dev, void *data=
)
> +{
> +	struct drm_minor *minor =3D data;
> +	unsigned long flags;
> +
> +	put_device(minor->kdev);
> +
> +	spin_lock_irqsave(&drm_minor_lock, flags);
> +	idr_remove(&drm_minors_idr, minor->index);
> +	spin_unlock_irqrestore(&drm_minor_lock, flags);
> +}
> +
>  static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
>  {
>  	struct drm_minor *minor;
>  	unsigned long flags;
>  	int r;
> =20
> -	minor =3D kzalloc(sizeof(*minor), GFP_KERNEL);
> +	minor =3D drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
>  	if (!minor)
>  		return -ENOMEM;
> =20
>  	minor->type =3D type;
>  	minor->dev =3D dev;
> =20
> +	r =3D drmm_add_action(dev, drm_minor_alloc_release, minor);
> +	if (r)
> +		return r;
> +
>  	idr_preload(GFP_KERNEL);
>  	spin_lock_irqsave(&drm_minor_lock, flags);
>  	r =3D idr_alloc(&drm_minors_idr,
> @@ -116,47 +132,18 @@ static int drm_minor_alloc(struct drm_device *dev=
, unsigned int type)
>  	spin_unlock_irqrestore(&drm_minor_lock, flags);
>  	idr_preload_end();
> =20
> -	if (r < 0)
> -		goto err_free;
> +	if (r < 0) {
> +		drmm_remove_action(dev, drm_minor_alloc_release, minor);
> +		return r;
> +	}
> =20
>  	minor->index =3D r;
> -
>  	minor->kdev =3D drm_sysfs_minor_alloc(minor);
> -	if (IS_ERR(minor->kdev)) {
> -		r =3D PTR_ERR(minor->kdev);
> -		goto err_index;
> -	}
> +	if (IS_ERR(minor->kdev))
> +		return PTR_ERR(minor->kdev);
> =20
>  	*drm_minor_get_slot(dev, type) =3D minor;
>  	return 0;
> -
> -err_index:
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	idr_remove(&drm_minors_idr, minor->index);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> -err_free:
> -	kfree(minor);
> -	return r;
> -}

TBH, I think you're reducing code quality by removing the rollback code
from init functions, just for the sake of it.

Specifically in this case here, you saved a few lines of code, but the
overall flow is way more complicated to follow. That's typically a
reliably source of bugs. This call to drmm_remove_action() just makes it
worse.

Rather, see my remark on OOP destruction in patch 21. For now, I'd focus
on the device cleanup and leave init functions as they are.

Best regards
Thomas

> -
> -static void drm_minor_free(struct drm_device *dev, unsigned int type)
> -{
> -	struct drm_minor **slot, *minor;
> -	unsigned long flags;
> -
> -	slot =3D drm_minor_get_slot(dev, type);
> -	minor =3D *slot;
> -	if (!minor)
> -		return;
> -
> -	put_device(minor->kdev);
> -
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	idr_remove(&drm_minors_idr, minor->index);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> -
> -	kfree(minor);
> -	*slot =3D NULL;
>  }
> =20
>  static int drm_minor_register(struct drm_device *dev, unsigned int typ=
e)
> @@ -678,16 +665,16 @@ int drm_dev_init(struct drm_device *dev,
>  	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
>  		ret =3D drm_minor_alloc(dev, DRM_MINOR_RENDER);
>  		if (ret)
> -			goto err_minors;
> +			goto err;
>  	}
> =20
>  	ret =3D drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
>  	if (ret)
> -		goto err_minors;
> +		goto err;
> =20
>  	ret =3D drm_legacy_create_map_hash(dev);
>  	if (ret)
> -		goto err_minors;
> +		goto err;
> =20
>  	drm_legacy_ctxbitmap_init(dev);
> =20
> @@ -695,7 +682,7 @@ int drm_dev_init(struct drm_device *dev,
>  		ret =3D drm_gem_init(dev);
>  		if (ret) {
>  			DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
> -			goto err_ctxbitmap;
> +			goto err;
>  		}
>  	}
> =20
> @@ -708,10 +695,6 @@ int drm_dev_init(struct drm_device *dev,
>  err_setunique:
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_destroy(dev);
> -err_ctxbitmap:
> -err_minors:
> -	drm_minor_free(dev, DRM_MINOR_PRIMARY);
> -	drm_minor_free(dev, DRM_MINOR_RENDER);
>  err:
>  	drm_managed_release(dev);
> =20
> @@ -776,9 +759,6 @@ void drm_dev_fini(struct drm_device *dev)
> =20
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_destroy(dev);
> -
> -	drm_minor_free(dev, DRM_MINOR_PRIMARY);
> -	drm_minor_free(dev, DRM_MINOR_RENDER);
>  }
>  EXPORT_SYMBOL(drm_dev_fini);
> =20
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_manage=
d.c
> index 514d5bd42446..0883615c2088 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -142,6 +142,34 @@ int __drmm_add_action(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(__drmm_add_action);
> =20
> +void drmm_remove_action(struct drm_device *dev,
> +			drmres_release_t action,
> +			void *data)
> +{
> +	struct drmres *dr =3D NULL, *tmp;
> +	unsigned long flags;
> +
> +	if (!data)
> +		return;
> +
> +	spin_lock_irqsave(&dev->managed.lock, flags);
> +	list_for_each_entry(tmp, &dev->managed.resources, node.entry) {
> +		if (tmp->node.release =3D=3D action &&
> +		    *(void **)&tmp->data =3D=3D data) {
> +			dr =3D tmp;
> +			del_dr(dev, dr);
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> +
> +	if (WARN_ON(!dr))
> +		return;
> +
> +	kfree(dr);
> +}
> +EXPORT_SYMBOL(drmm_remove_action);
> +
>  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  {
>  	struct drmres *dr;
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 89e6fce9f689..5280209dff92 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -17,6 +17,10 @@ int __must_check __drmm_add_action(struct drm_device=
 *dev,
>  				   drmres_release_t action,
>  				   void *data, const char *name);
> =20
> +void drmm_remove_action(struct drm_device *dev,
> +			drmres_release_t action,
> +			void *data);
> +
>  void drmm_add_final_kfree(struct drm_device *dev, void *parent);
> =20
>  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __m=
alloc;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Ng3YEG9np2rnqWPTOW7ndc98aEazXZk7L--

--u0MpIP7j30vNtrnyIseq8acPcxDf8y30z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5otm4ACgkQaA3BHVML
eiNL8wf/QPR7d5xi9K0+7Kv7yQaVDTxZm1ymX5aQuPSxWnY9GHoSEAX5i4s84FQ+
Bbr2p2DiDyTdhJx3PCqrwRl65qJFeCUPvkQc13ksLMbzOwZqX+bZSjBEXTAU+2An
ddNQaH8xz1CTZpy8vF7o55IDdYvhy6HFI5SnsjJ5IGpBiWqSjz5iWYbdVy2+ApFK
J/1FYxF9jc4yagRfYHFTjQ8KLgmi3o3cxLc5Jn4f2ClG7O9bglSsVpkoMBAJgC0w
s7VDgkCgkPR/XqB+tYlAQG8dmyhm4GVGvJby4QdAywHGMjVfqGeAb2H9Fs8M2xPY
9NlL2YFXvsQoLBO+wZhBEgTemH3Ejw==
=Q4Cq
-----END PGP SIGNATURE-----

--u0MpIP7j30vNtrnyIseq8acPcxDf8y30z--

--===============1169250612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1169250612==--
