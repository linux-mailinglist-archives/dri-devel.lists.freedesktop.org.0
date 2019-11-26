Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7210999E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 08:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCCD6E222;
	Tue, 26 Nov 2019 07:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FF16E222
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 07:40:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 64885ACD7;
 Tue, 26 Nov 2019 07:40:31 +0000 (UTC)
Subject: Re: [PATCH 3/4] drm/hisilicon/hibmc: Implement hibmc_dumb_create()
 with generic helpers
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191122083044.6627-1-tzimmermann@suse.de>
 <20191122083044.6627-4-tzimmermann@suse.de>
 <20191125091426.GG29965@phenom.ffwll.local>
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
Message-ID: <732b54b3-85cc-1787-2520-95ee95deae9f@suse.de>
Date: Tue, 26 Nov 2019 08:40:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191125091426.GG29965@phenom.ffwll.local>
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
 zourongrong@gmail.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0058790784=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0058790784==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JjUMHMqEBmgGKJGHfMZHScZpwnWuYOcEZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JjUMHMqEBmgGKJGHfMZHScZpwnWuYOcEZ
Content-Type: multipart/mixed; boundary="ebMHt9uMUEgTR51dltRd2KJxX2rDkMBye";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: yuehaibing@huawei.com, airlied@linux.ie, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, hslester96@gmail.com, kraxel@redhat.com,
 zourongrong@gmail.com, sam@ravnborg.org
Message-ID: <732b54b3-85cc-1787-2520-95ee95deae9f@suse.de>
Subject: Re: [PATCH 3/4] drm/hisilicon/hibmc: Implement hibmc_dumb_create()
 with generic helpers
References: <20191122083044.6627-1-tzimmermann@suse.de>
 <20191122083044.6627-4-tzimmermann@suse.de>
 <20191125091426.GG29965@phenom.ffwll.local>
In-Reply-To: <20191125091426.GG29965@phenom.ffwll.local>

--ebMHt9uMUEgTR51dltRd2KJxX2rDkMBye
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.11.19 um 10:14 schrieb Daniel Vetter:
> On Fri, Nov 22, 2019 at 09:30:43AM +0100, Thomas Zimmermann wrote:
>> The hibmc driver aligns scanlines to 16 bytes. Adding the pitch alignm=
ent
>> as an argument to drm_gem_vram_fill_create_dumb() allows to use the ge=
neric
>> implementation with hibmc. A value of 0 disables scanline pitches.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I concur with Sam, the vram change should be split out.
>=20
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
>=20
> I also noticed that no one sets this to true, neither here nor in
> drm_gem_vram_create(). Maybe remove that too? Otherwise the argument li=
st
> becomes very unwielding. And you're already touching the (few) callers.=


OK, I'll add this as a separate patch.

BTW What's the DRM interface's behavior wrt interruption? For example,
can a ioctl call like CREATE_DUMB return EINTR to userspace?

Best regards
Thomas

>=20
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
>> +	if (pitch_align)
>> +		pitch =3D ALIGN(pitch, pitch_align);
>=20
> Maybe throw a WARN_IS(is_pot(align)) in here?
>=20
> Cheers, Daniel
>=20
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
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ebMHt9uMUEgTR51dltRd2KJxX2rDkMBye--

--JjUMHMqEBmgGKJGHfMZHScZpwnWuYOcEZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3c1u4ACgkQaA3BHVML
eiN60wgAo2nMGDzup+C+hSosG1enJPefEMQFZjP1Mp4wOEZL/v2Iq9S+rhOcCEMw
zRK/NUUx1lkBGaRcXIOzAD9HPVhajvXFSdCo/nWz15ZcNSqkBUevb5vJjnl/IT87
u2LN1dYVuFxulbt/IzvipakVQvjckz4xyx/eV9TtrdZ5UCfUofJHouhDUGeOsANM
GsyJYuYJZ/4uG09z9Z4Ur+vIIqtgCnilwTU2qq4leCRChIFLp15L86Ss0RdOXbF9
XwqThPJJHSPMJkcgGNDvSF6FeHefK3UqD9qgnZ9ygSE1NAYOa4K7osV84xj9VTac
LYwnIzhrJkC9M/8Z4vEiE9Brj72SLw==
=KTMj
-----END PGP SIGNATURE-----

--JjUMHMqEBmgGKJGHfMZHScZpwnWuYOcEZ--

--===============0058790784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0058790784==--
