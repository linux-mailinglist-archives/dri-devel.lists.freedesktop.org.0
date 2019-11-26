Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44961099A2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 08:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706176E221;
	Tue, 26 Nov 2019 07:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438746E221
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 07:41:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0E81ACD7;
 Tue, 26 Nov 2019 07:41:25 +0000 (UTC)
Subject: Re: [PATCH 3/4] drm/hisilicon/hibmc: Implement hibmc_dumb_create()
 with generic helpers
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191122083044.6627-1-tzimmermann@suse.de>
 <20191122083044.6627-4-tzimmermann@suse.de>
 <20191123085658.GB17899@ravnborg.org>
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
Message-ID: <cbd65b15-923b-2b5a-1a25-74c2f760ca89@suse.de>
Date: Tue, 26 Nov 2019 08:41:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191123085658.GB17899@ravnborg.org>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, yuehaibing@huawei.com,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, hslester96@gmail.com, kraxel@redhat.com,
 zourongrong@gmail.com
Content-Type: multipart/mixed; boundary="===============0515527836=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0515527836==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wG9klSPmX2xu9LVExSOiM0vBE2JAJThBb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wG9klSPmX2xu9LVExSOiM0vBE2JAJThBb
Content-Type: multipart/mixed; boundary="iy0nU7Ssr8OitMcvtxXhvoNBx4Pv5d3Mj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: yuehaibing@huawei.com, airlied@linux.ie, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, hslester96@gmail.com, kraxel@redhat.com,
 zourongrong@gmail.com
Message-ID: <cbd65b15-923b-2b5a-1a25-74c2f760ca89@suse.de>
Subject: Re: [PATCH 3/4] drm/hisilicon/hibmc: Implement hibmc_dumb_create()
 with generic helpers
References: <20191122083044.6627-1-tzimmermann@suse.de>
 <20191122083044.6627-4-tzimmermann@suse.de>
 <20191123085658.GB17899@ravnborg.org>
In-Reply-To: <20191123085658.GB17899@ravnborg.org>

--iy0nU7Ssr8OitMcvtxXhvoNBx4Pv5d3Mj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

thanks for the review.

Am 23.11.19 um 09:56 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> Change looks good. If you spin this could you move the
> changes to generic drm code to a separate patch?
> As it is now it is hidden for most.
> But then there are also no users of drm_gem_vram_fill_create_dumb()

I just posted a patchset for mgag200 that uses this function. Maybe
it'll have to stay.

Best regards
Thomas

>=20
> One small nit below that you can safely ignore :-)
>=20
>=20
> 	Sam
>=20
>=20
> On Fri, Nov 22, 2019 at 09:30:43AM +0100, Thomas Zimmermann wrote:
>> The hibmc driver aligns scanlines to 16 bytes. Adding the pitch alignm=
ent
>> as an argument to drm_gem_vram_fill_create_dumb() allows to use the ge=
neric
>> implementation with hibmc. A value of 0 disables scanline pitches.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c         | 10 ++--
>>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  4 --
>>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   | 48 +-----------------=
-
>>  include/drm/drm_gem_vram_helper.h             |  1 +
>>  4 files changed, 10 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index 666cb4c22bb9..f098784e7dfd 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -485,6 +485,7 @@ EXPORT_SYMBOL(drm_gem_vram_vunmap);
>>   * @dev:		the DRM device
>>   * @bdev:		the TTM BO device managing the buffer object
>>   * @pg_align:		the buffer's alignment in multiples of the page size
>> + * @pitch_align:	the scanline's alignment in powers of 2
>>   * @interruptible:	sleep interruptible if waiting for memory
>>   * @args:		the arguments as provided to \
>>  				&struct drm_driver.dumb_create
>> @@ -502,6 +503,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file =
*file,
>>  				  struct drm_device *dev,
>>  				  struct ttm_bo_device *bdev,
>>  				  unsigned long pg_align,
>> +				  unsigned long pitch_align,
>>  				  bool interruptible,
>>  				  struct drm_mode_create_dumb *args)
>>  {
>> @@ -510,7 +512,9 @@ int drm_gem_vram_fill_create_dumb(struct drm_file =
*file,
>>  	int ret;
>>  	u32 handle;
>> =20
>> -	pitch =3D args->width * ((args->bpp + 7) / 8);
>> +	pitch =3D args->width * DIV_ROUND_UP(args->bpp, 8);
> Semi related change...
>=20
>> +	if (pitch_align)
>> +		pitch =3D ALIGN(pitch, pitch_align);
>>  	size =3D pitch * args->height;
>> =20
>>  	size =3D roundup(size, PAGE_SIZE);
>> @@ -612,8 +616,8 @@ int drm_gem_vram_driver_dumb_create(struct drm_fil=
e *file,
>>  	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
>>  		return -EINVAL;
>> =20
>> -	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,=
 0,
>> -					     false, args);
>> +	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,=

>> +					     0, 0, false, args);
>>  }
>>  EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
>> =20
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> index 8eb7258b236a..50a0c1f9d211 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> @@ -18,7 +18,6 @@
>>  #include <drm/drm_framebuffer.h>
>> =20
>>  struct drm_device;
>> -struct drm_gem_object;
>> =20
>>  struct hibmc_drm_private {
>>  	/* hw */
>> @@ -41,9 +40,6 @@ void hibmc_set_current_gate(struct hibmc_drm_private=
 *priv,
>>  int hibmc_de_init(struct hibmc_drm_private *priv);
>>  int hibmc_vdac_init(struct hibmc_drm_private *priv);
>> =20
>> -int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,=

>> -		     struct drm_gem_object **obj);
>> -
>>  int hibmc_mm_init(struct hibmc_drm_private *hibmc);
>>  void hibmc_mm_fini(struct hibmc_drm_private *hibmc);
>>  int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu=
/drm/hisilicon/hibmc/hibmc_ttm.c
>> index f6d25b85c209..0af5d966a480 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>> @@ -47,55 +47,11 @@ void hibmc_mm_fini(struct hibmc_drm_private *hibmc=
)
>>  	drm_vram_helper_release_mm(hibmc->dev);
>>  }
>> =20
>> -int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,=

>> -		     struct drm_gem_object **obj)
>> -{
>> -	struct drm_gem_vram_object *gbo;
>> -	int ret;
>> -
>> -	*obj =3D NULL;
>> -
>> -	size =3D roundup(size, PAGE_SIZE);
>> -	if (size =3D=3D 0)
>> -		return -EINVAL;
>> -
>> -	gbo =3D drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0, false=
);
>> -	if (IS_ERR(gbo)) {
>> -		ret =3D PTR_ERR(gbo);
>> -		if (ret !=3D -ERESTARTSYS)
>> -			DRM_ERROR("failed to allocate GEM object: %d\n", ret);
>> -		return ret;
>> -	}
>> -	*obj =3D &gbo->bo.base;
>> -	return 0;
>> -}
>> -
>>  int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
>>  		      struct drm_mode_create_dumb *args)
>>  {
>> -	struct drm_gem_object *gobj;
>> -	u32 handle;
>> -	int ret;
>> -
>> -	args->pitch =3D ALIGN(args->width * DIV_ROUND_UP(args->bpp, 8), 16);=

>> -	args->size =3D args->pitch * args->height;
>> -
>> -	ret =3D hibmc_gem_create(dev, args->size, false,
>> -			       &gobj);
>> -	if (ret) {
>> -		DRM_ERROR("failed to create GEM object: %d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	ret =3D drm_gem_handle_create(file, gobj, &handle);
>> -	drm_gem_object_put_unlocked(gobj);
>> -	if (ret) {
>> -		DRM_ERROR("failed to unreference GEM object: %d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	args->handle =3D handle;
>> -	return 0;
>> +	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,=

>> +					     0, 16, false, args);
>>  }
>> =20
>>  const struct drm_mode_config_funcs hibmc_mode_funcs =3D {
>> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_v=
ram_helper.h
>> index e040541a105f..c642b4cb6600 100644
>> --- a/include/drm/drm_gem_vram_helper.h
>> +++ b/include/drm/drm_gem_vram_helper.h
>> @@ -113,6 +113,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file =
*file,
>>  				  struct drm_device *dev,
>>  				  struct ttm_bo_device *bdev,
>>  				  unsigned long pg_align,
>> +				  unsigned long pitch_align,
>>  				  bool interruptible,
>>  				  struct drm_mode_create_dumb *args);
>> =20
>> --=20
>> 2.23.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--iy0nU7Ssr8OitMcvtxXhvoNBx4Pv5d3Mj--

--wG9klSPmX2xu9LVExSOiM0vBE2JAJThBb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3c1yQACgkQaA3BHVML
eiPomwf+NmT6DhAP644MLIfwGmX8qVrdzjJUwZ5KnOW+h1qKOzOAuxdLprno189R
M/R01aM3yezRo6Kum5d90P/CJjccApDs4SrkokafiXKtJeBlgN4I40ut7JQYHkX8
qM6HCGQryfBUyloOqyTd4Nm49LckdrkD+bnAeyYtIJvGqgXhBx4S+WxwR/cT0eFZ
n2Pam8hLDVLQl1mZHCMJglC6z+jfORuV6c3G/81eG7ACm4guutdV0iYvUBnY9n4O
SZdC0oUfMeBALjXyWdxlsjRsuUp/yUtyMtFVIg82FNRTpnX8KNKhFqEx3IQsTlcq
gC0EI/Su+qoMSJRU54876kSq73oB5A==
=+C9y
-----END PGP SIGNATURE-----

--wG9klSPmX2xu9LVExSOiM0vBE2JAJThBb--

--===============0515527836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0515527836==--
