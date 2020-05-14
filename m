Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D961D28B2
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 09:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DDE6EAC9;
	Thu, 14 May 2020 07:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F336EAC8;
 Thu, 14 May 2020 07:25:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 02765AC64;
 Thu, 14 May 2020 07:25:21 +0000 (UTC)
Subject: Re: [PATCH 5/9] drm/udl: Don't call get/put_pages on imported dma-buf
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-6-daniel.vetter@ffwll.ch>
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
Message-ID: <1f21209e-c041-7203-af94-5e71d9ee9234@suse.de>
Date: Thu, 14 May 2020 09:25:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511093554.211493-6-daniel.vetter@ffwll.ch>
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1033923156=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1033923156==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="t3vi6jWEAdO34EEhqHN0J919213Uj96rk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t3vi6jWEAdO34EEhqHN0J919213Uj96rk
Content-Type: multipart/mixed; boundary="oVCvh1t2vDy6QHv0L8EaZq9zrD9TJJac9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Message-ID: <1f21209e-c041-7203-af94-5e71d9ee9234@suse.de>
Subject: Re: [PATCH 5/9] drm/udl: Don't call get/put_pages on imported dma-buf
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511093554.211493-6-daniel.vetter@ffwll.ch>

--oVCvh1t2vDy6QHv0L8EaZq9zrD9TJJac9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

given the upcoming removal of this file, I don't know if you really want
to merge this patch. If so, please see my comment on patch 6 and

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> There's no direct harm, because for the shmem helpers these are noops
> on imported buffers. The trouble is in the locks these take - I want
> to change dma_buf_vmap locking, and so need to make sure that we only
> ever take certain locks on one side of the dma-buf interface: Either
> for exporters, or for importers.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/udl/udl_gem.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_ge=
m.c
> index b6e26f98aa0a..c68d3e265329 100644
> --- a/drivers/gpu/drm/udl/udl_gem.c
> +++ b/drivers/gpu/drm/udl/udl_gem.c
> @@ -46,29 +46,31 @@ static void *udl_gem_object_vmap(struct drm_gem_obj=
ect *obj)
>  	if (shmem->vmap_use_count++ > 0)
>  		goto out;
> =20
> -	ret =3D drm_gem_shmem_get_pages(shmem);
> -	if (ret)
> -		goto err_zero_use;
> -
> -	if (obj->import_attach)
> +	if (obj->import_attach) {
>  		shmem->vaddr =3D dma_buf_vmap(obj->import_attach->dmabuf);
> -	else
> +	} else {
> +		ret =3D drm_gem_shmem_get_pages(shmem);
> +		if (ret)
> +			goto err;
> +
>  		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>  				    VM_MAP, PAGE_KERNEL);
> =20
> +		if (!shmem->vaddr)
> +			drm_gem_shmem_put_pages(shmem);
> +	}
> +
>  	if (!shmem->vaddr) {
>  		DRM_DEBUG_KMS("Failed to vmap pages\n");
>  		ret =3D -ENOMEM;
> -		goto err_put_pages;
> +		goto err;
>  	}
> =20
>  out:
>  	mutex_unlock(&shmem->vmap_lock);
>  	return shmem->vaddr;
> =20
> -err_put_pages:
> -	drm_gem_shmem_put_pages(shmem);
> -err_zero_use:
> +err:
>  	shmem->vmap_use_count =3D 0;
>  	mutex_unlock(&shmem->vmap_lock);
>  	return ERR_PTR(ret);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oVCvh1t2vDy6QHv0L8EaZq9zrD9TJJac9--

--t3vi6jWEAdO34EEhqHN0J919213Uj96rk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl688l4ACgkQaA3BHVML
eiMFWgf/XnhZPPzqspTSAwFQyAHU/3EYxb3R4qji6SCO9RKAv4jdLedl3dklNsXq
XIEOL0iuaKOMatEAz/FFPJbghXaAt0meVt7RYt3NCPbMSUEZ+gnsg/FzLB7ppta/
jtsIks3WPc1jLW0hq2zE3Wpfto1pzZJkJWqFKFxQOa3lBmDYnxo3onMielSd3LFg
Pt9osgUOxrYMOOPd+FNjzVsKrFAsrFZmmssqSlKx8g7+zXKncDot8Xfi8/CjTmp3
1GNthCMnuL08jddYyeJvCwduCg6P1JYxAnSQxHzOQxvFIUu62dMrMsNQOXX8qRp/
gkuc6xYvAcmL6IL1VxZz9Qgff6Sb6Q==
=Y+ie
-----END PGP SIGNATURE-----

--t3vi6jWEAdO34EEhqHN0J919213Uj96rk--

--===============1033923156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1033923156==--
