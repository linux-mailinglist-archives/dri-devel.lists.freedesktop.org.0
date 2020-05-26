Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712F1D28C1
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 09:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDA76E2E0;
	Thu, 14 May 2020 07:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F9D6E2E0;
 Thu, 14 May 2020 07:30:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BDBEAC64;
 Thu, 14 May 2020 07:30:08 +0000 (UTC)
Subject: Re: [PATCH 8/9] drm/shmem-helpers: Ensure get_pages is not called on
 imported dma-buf
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-9-daniel.vetter@ffwll.ch>
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
Message-ID: <41b3f24c-de0c-9390-6b8c-e71ceadb6d07@suse.de>
Date: Thu, 14 May 2020 09:30:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511093554.211493-9-daniel.vetter@ffwll.ch>
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
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============0124035741=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0124035741==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="l9SES7f3qK7mNWEwhoKc5GkvQa4SgfSaT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l9SES7f3qK7mNWEwhoKc5GkvQa4SgfSaT
Content-Type: multipart/mixed; boundary="d3lSuaEJsGZFFju4C9VclXtN4LSgitngn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <41b3f24c-de0c-9390-6b8c-e71ceadb6d07@suse.de>
Subject: Re: [PATCH 8/9] drm/shmem-helpers: Ensure get_pages is not called on
 imported dma-buf
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-9-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511093554.211493-9-daniel.vetter@ffwll.ch>

--d3lSuaEJsGZFFju4C9VclXtN4LSgitngn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> Just a bit of light paranoia. Also sprinkle this check over
> drm_gem_shmem_get_sg_table, which should only be called when
> exporting, same for the pin/unpin functions, on which it relies to
> work correctly.
>=20
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 117a7841e284..f7011338813e 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -170,6 +170,8 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_ob=
ject *shmem)
>  {
>  	int ret;
> =20
> +	WARN_ON(shmem->base.import_attach);
> +
>  	ret =3D mutex_lock_interruptible(&shmem->pages_lock);
>  	if (ret)
>  		return ret;
> @@ -225,6 +227,8 @@ int drm_gem_shmem_pin(struct drm_gem_object *obj)
>  {
>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> =20
> +	WARN_ON(shmem->base.import_attach);
> +

I don't understand this change. If a driver pins pages it now has to
check that the pages are not imported?


>  	return drm_gem_shmem_get_pages(shmem);
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_pin);
> @@ -240,6 +244,8 @@ void drm_gem_shmem_unpin(struct drm_gem_object *obj=
)
>  {
>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> =20
> +	WARN_ON(shmem->base.import_attach);
> +
>  	drm_gem_shmem_put_pages(shmem);
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_unpin);
> @@ -510,6 +516,8 @@ static void drm_gem_shmem_vm_open(struct vm_area_st=
ruct *vma)
>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
>  	int ret;
> =20
> +	WARN_ON(shmem->base.import_attach);
> +
>  	ret =3D drm_gem_shmem_get_pages(shmem);
>  	WARN_ON_ONCE(ret !=3D 0);
> =20
> @@ -611,6 +619,8 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct =
drm_gem_object *obj)
>  {
>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> =20
> +	WARN_ON(shmem->base.import_attach);
> +
>  	return drm_prime_pages_to_sg(shmem->pages, obj->size >> PAGE_SHIFT);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--d3lSuaEJsGZFFju4C9VclXtN4LSgitngn--

--l9SES7f3qK7mNWEwhoKc5GkvQa4SgfSaT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6883wACgkQaA3BHVML
eiOnTwgAstDqkAwNMmaLqaQ/R3rjGTWwPUTIdb2BA+bKkjyz/PnRfh2PY8fVJX9i
WIW8Fpa1rfrjX0S6AhWlPO1at7IC1ZLueRy1hiiG3cFdkbgjGW8sOU24n2CM9TN+
h9/WTgZQgPjlmRWWd7zwErBq9Q9BH1IbmZA2w+ZjDgbpQtHUBvMYqa1qYjFLSFED
frKjW8daMGf/0DykqPIJHJ5wegZXiSuPYuSgSlen5SK6/2DGFYKHlp1S1b74PHKA
nMiNItbsoaacoCAlGL32KOrAk6Ojn4l/Uj44HqI8TbUMVkMAJzgR6zDVkYTA6rew
sTgnYihwiRm6AWP8Ong3kET7UbPYqQ==
=XUw8
-----END PGP SIGNATURE-----

--l9SES7f3qK7mNWEwhoKc5GkvQa4SgfSaT--

--===============0124035741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0124035741==--
