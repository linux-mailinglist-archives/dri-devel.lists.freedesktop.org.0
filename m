Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156201FAFE7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 14:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B3C6E8B1;
	Tue, 16 Jun 2020 12:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F056E8A0;
 Tue, 16 Jun 2020 12:10:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6296EAE56;
 Tue, 16 Jun 2020 12:10:15 +0000 (UTC)
Subject: Re: [PATCH] drm/shmem-helper: Fix obj->filp derefence
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>
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
Message-ID: <a1290884-8cca-f1a1-a05b-8d5c3e323506@suse.de>
Date: Tue, 16 Jun 2020 14:10:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============1981674737=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1981674737==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jRhSNXvGkueNoedOk6kH0xFCGfnFuiLgI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jRhSNXvGkueNoedOk6kH0xFCGfnFuiLgI
Content-Type: multipart/mixed; boundary="TMusJiqInvwO1busglyEk03Ic7eg6lKzK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <a1290884-8cca-f1a1-a05b-8d5c3e323506@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Fix obj->filp derefence
References: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>

--TMusJiqInvwO1busglyEk03Ic7eg6lKzK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

as discussed on IRC, we still need this patch.

Am 15.06.20 um 17:10 schrieb Daniel Vetter:
> I broke that in my refactoring:
>=20
> commit 7d2cd72a9aa3df3604cafd169a2d4a525afb68ca
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Fri May 29 16:05:42 2020 +0200
>=20
>     drm/shmem-helpers: Simplify dma-buf importing
>=20
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 7d2cd72a9aa3 ("drm/shmem-helpers: Simplify dma-buf importing")
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 0a7e3b664bc2..3e7ee407a17c 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -70,15 +70,17 @@ __drm_gem_shmem_create(struct drm_device *dev, size=
_t size, bool private)
>  	mutex_init(&shmem->vmap_lock);
>  	INIT_LIST_HEAD(&shmem->madv_list);
> =20
> -	/*
> -	 * Our buffers are kept pinned, so allocating them
> -	 * from the MOVABLE zone is a really bad idea, and
> -	 * conflicts with CMA. See comments above new_inode()
> -	 * why this is required _and_ expected if you're
> -	 * going to pin these pages.
> -	 */
> -	mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER |
> -			     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	if (!private) {

I would test for (obj->filp) here, because it's what the branch depends
on. Your choice. In any case

Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>


> +		/*
> +		 * Our buffers are kept pinned, so allocating them
> +		 * from the MOVABLE zone is a really bad idea, and
> +		 * conflicts with CMA. See comments above new_inode()
> +		 * why this is required _and_ expected if you're
> +		 * going to pin these pages.
> +		 */
> +		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER |
> +				     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	}
> =20
>  	return shmem;
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--TMusJiqInvwO1busglyEk03Ic7eg6lKzK--

--jRhSNXvGkueNoedOk6kH0xFCGfnFuiLgI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7otqIACgkQaA3BHVML
eiP0gwf+ImUZuaFnxYaY0OXRYB4eSJzg+TMBSvN0ofFfA/CxdUjTZAdVaVlAcypm
xC2UuAIkxofBv7P686EelOUzoDAc55unX3f9hYAMdL48k5UCNXpCQ9Ybm2/SSEze
x/3AKz4u0JYBZ4wnGN1UAj2rBDmWSRAdNJ8CKdeZEfhQfEXdZMZ1baN8PJT2K12S
jO+GIWx+wjbITVBQADa+7BVkvFL2bGtL/jgBi/jExt80d8QraepEr7l88rYQKoVP
P+ewJBhJgmUjYQ1nD+Di1WXn76zt4LNcu+wOXMWd/Q8hbeiyFJvokVPa5Va/CDJq
3+VQqrxspLQuA1fflgZ9vE/FQjacOw==
=8+hG
-----END PGP SIGNATURE-----

--jRhSNXvGkueNoedOk6kH0xFCGfnFuiLgI--

--===============1981674737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1981674737==--
