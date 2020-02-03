Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B947C15042C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 11:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63286E220;
	Mon,  3 Feb 2020 10:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7506E220
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 10:25:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 631FCAF8A;
 Mon,  3 Feb 2020 10:25:22 +0000 (UTC)
Subject: Re: [PATCH 1/4] drm/vram: Add helpers to validate a display mode's
 memory requirements
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200201122744.27165-1-tzimmermann@suse.de>
 <20200201122744.27165-2-tzimmermann@suse.de>
 <20200203094930.GS43062@phenom.ffwll.local>
 <20200203095306.GU43062@phenom.ffwll.local>
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
Message-ID: <c85d2459-14ff-57be-3cf9-d4a887912d6e@suse.de>
Date: Mon, 3 Feb 2020 11:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203095306.GU43062@phenom.ffwll.local>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0270274197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0270274197==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pm5a8UawWXJEwZT4U5z0omeizqHyuYgVo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pm5a8UawWXJEwZT4U5z0omeizqHyuYgVo
Content-Type: multipart/mixed; boundary="eKCJLxFnfH8lqO0TP2H4zEXxPj3e7G7ro";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, kraxel@redhat.com,
 zourongrong@gmail.com, sam@ravnborg.org
Message-ID: <c85d2459-14ff-57be-3cf9-d4a887912d6e@suse.de>
Subject: Re: [PATCH 1/4] drm/vram: Add helpers to validate a display mode's
 memory requirements
References: <20200201122744.27165-1-tzimmermann@suse.de>
 <20200201122744.27165-2-tzimmermann@suse.de>
 <20200203094930.GS43062@phenom.ffwll.local>
 <20200203095306.GU43062@phenom.ffwll.local>
In-Reply-To: <20200203095306.GU43062@phenom.ffwll.local>

--eKCJLxFnfH8lqO0TP2H4zEXxPj3e7G7ro
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.02.20 um 10:53 schrieb Daniel Vetter:
> On Mon, Feb 03, 2020 at 10:49:30AM +0100, Daniel Vetter wrote:
>> On Sat, Feb 01, 2020 at 01:27:41PM +0100, Thomas Zimmermann wrote:
>>> Devices with low amount of dedicated video memory may not be able
>>> to use all possible display modes, as the framebuffers may not fit
>>> into VRAM. The new helper function drm_vram_helper_mode_valid()
>>> implements a simple test to sort out all display modes that can
>>> not be used in any case. Drivers should call this function from
>>> struct drm_mode_config_funcs.mode_valid.
>>>
>>> Calling drm_vram_helper_mode_valid() works best for 32-bit framebuffe=
rs;
>>> drivers with framebuffers of different color depth can use
>>> drm_vram_helper_mode_valid_internal() instead.
>>>
>>> The functionality was originally implemented by the ast driver, which=

>>> is being converted as well.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>  drivers/gpu/drm/ast/ast_main.c        | 24 +--------
>>>  drivers/gpu/drm/drm_gem_vram_helper.c | 76 +++++++++++++++++++++++++=
++
>>>  include/drm/drm_gem_vram_helper.h     | 14 +++++
>>>  3 files changed, 91 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast=
_main.c
>>> index b79f484e9bd2..18a0a4ce00f6 100644
>>> --- a/drivers/gpu/drm/ast/ast_main.c
>>> +++ b/drivers/gpu/drm/ast/ast_main.c
>>> @@ -388,31 +388,9 @@ static int ast_get_dram_info(struct drm_device *=
dev)
>>>  	return 0;
>>>  }
>>> =20
>>> -enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *d=
ev,
>>> -						const struct drm_display_mode *mode)
>>> -{
>>> -	static const unsigned long max_bpp =3D 4; /* DRM_FORMAT_XRGBA8888 *=
/
>>> -
>>> -	struct ast_private *ast =3D dev->dev_private;
>>> -	unsigned long fbsize, fbpages, max_fbpages;
>>> -
>>> -	/* To support double buffering, a framebuffer may not
>>> -	 * consume more than half of the available VRAM.
>>> -	 */
>>> -	max_fbpages =3D (ast->vram_size / 2) >> PAGE_SHIFT;
>>> -
>>> -	fbsize =3D mode->hdisplay * mode->vdisplay * max_bpp;
>>> -	fbpages =3D DIV_ROUND_UP(fbsize, PAGE_SIZE);
>>> -
>>> -	if (fbpages > max_fbpages)
>>> -		return MODE_MEM;
>>> -
>>> -	return MODE_OK;
>>> -}
>>> -
>>>  static const struct drm_mode_config_funcs ast_mode_funcs =3D {
>>>  	.fb_create =3D drm_gem_fb_create,
>>> -	.mode_valid =3D ast_mode_config_mode_valid,
>>> +	.mode_valid =3D drm_vram_helper_mode_valid,
>>>  	.atomic_check =3D drm_atomic_helper_check,
>>>  	.atomic_commit =3D drm_atomic_helper_commit,
>>>  };
>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/=
drm_gem_vram_helper.c
>>> index a4863326061a..89aebd500655 100644
>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> @@ -1141,3 +1141,79 @@ void drm_vram_helper_release_mm(struct drm_dev=
ice *dev)
>>>  	dev->vram_mm =3D NULL;
>>>  }
>>>  EXPORT_SYMBOL(drm_vram_helper_release_mm);
>>> +
>>> +/*
>>> + * Mode-config helpers
>>> + */
>>> +
>>> +/**
>>> + * drm_vram_helper_mode_valid_internal - Tests if a display mode's
>>> + *	framebuffer fits into the available video memory.
>>> + * @dev:	the DRM device
>>> + * @mode:	the mode to test
>>> + * @max_bpp:	the maximum number of bytes per pixel
>>
>> Does this render correctly? I thought an empty comment line is require=
d
>> between comments and the free-form paragraphs ... Also usual style (in=
 drm
>> at least) is that the Returns: block is more towards the end of the te=
xt,
>> and not indented.

Will be checked and possibly fixed for v2.

>>
>>
>>> + * Returns:
>>> + *	MODE_OK the display mode is supported, or an error code of type
>>> + *	enum drm_mode_status otherwise.
>>> + *
>>> + * This function tests if enough video memory is available using the=

>>> + * specified display mode. Atomic modesetting requires importing the=

>>> + * designated framebuffer into video memory before evicting the acti=
ve
>>> + * one. Hence, any framebuffer may consume at most half of the avail=
able
>>> + * VRAM. Display modes that require a larger framebuffer can not be =
used,
>>> + * even of the CRTC does support them.
>>> + *
>>> + * Drivers should call this function from
>>> + * struct drm_mode_config_funcs.mode_valid. See drm_vram_helper_mode=
_valid()
>>> + * for framebuffers that use at most 32-bit color depth.
>>> + *
>>> + * Note:
>>> + *	The function can only test if the display mode is supported in
>>> + *	general. If you have too many framebuffers pinned to video memory=
,
>>> + *	a display mode may still not be usable in practice.
>>> + */
>>> +enum drm_mode_status
>>> +drm_vram_helper_mode_valid_internal(struct drm_device *dev,
>>> +				    const struct drm_display_mode *mode,
>>> +				    unsigned long max_bpp)
>>> +{
>>> +	struct drm_vram_mm *vmm =3D dev->vram_mm;
>>> +	unsigned long fbsize, fbpages, max_fbpages;
>>> +
>>> +	if (!dev->vram_mm)
>>
>> This is a driver bug imo (most likely of enabling hotplug/output detec=
tion
>> before the vram handling is set up), needs to be wrapped in a WARN_ON =
to
>> catch this.
>>
>>> +		return MODE_BAD;
>>> +
>>> +	max_fbpages =3D (vmm->vram_size / 2) >> PAGE_SHIFT;
>>> +
>>> +	fbsize =3D mode->hdisplay * mode->vdisplay * max_bpp;
>>> +	fbpages =3D DIV_ROUND_UP(fbsize, PAGE_SIZE);
>>> +
>>> +	if (fbpages > max_fbpages)
>>> +		return MODE_MEM;
>>> +
>>> +	return MODE_OK;
>>> +}
>>> +EXPORT_SYMBOL(drm_vram_helper_mode_valid_internal);
>>
>> Anyway, patch looks good (with the nits addressed one way or the other=
):
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> +
>>> +/**
>>> + * drm_vram_helper_mode_valid - Tests if a display mode's
>>> + *	framebuffer fits into the available video memory.
>>> + * @dev:	the DRM device
>>> + * @mode:	the mode to test
>>> + * Returns:
>>> + *	MODE_OK the display mode is supported, or an error code of type
>>> + *	enum drm_mode_status otherwise.
>>> + *
>>> + * This function is a variant of drm_vram_helper_mode_valid_internal=
()
>>> + * for framebuffers that use at most 32-bit color depth. It can be p=
lugged
>>> + * directly into struct drm_mode_config_funcs.mode_valid.
>>> + */
>>> +enum drm_mode_status
>>> +drm_vram_helper_mode_valid(struct drm_device *dev,
>>> +			   const struct drm_display_mode *mode)
>>> +{
>>> +	static const unsigned long max_bpp =3D 4; /* DRM_FORMAT_XRGBA8888 *=
/
>>> +
>>> +	return drm_vram_helper_mode_valid_internal(dev, mode, max_bpp);
>=20
> Since you don't use the _internal() version anywhere yet ... What about=

> unexporting that and instead using the preferred_bpp setting to compute=

> valid modes? I suspect that should dtrt almost anywhere ...

Even though that might work, it's asks for problems. ast sets a
preferred depth of 24, when it actually wants 32 for most buffers. I'd
rather just unexport the _internal function until we need it and go with
the max_bpp of 4.

To me, preferred_bpp looks like a fossil from the early days of DRM. (?)
If we want to do something meaningful to auto-detect max_bpp, we should
walk over primary planes and compute the value from the planes' formats
arrays. But for now, the result will always be 4, so there's really no ne=
ed.

Best regard
Thomas

> -Daniel
>=20
>>> +}
>>> +EXPORT_SYMBOL(drm_vram_helper_mode_valid);
>>> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_=
vram_helper.h
>>> index 573e9fd109bf..e7d9144c79ad 100644
>>> --- a/include/drm/drm_gem_vram_helper.h
>>> +++ b/include/drm/drm_gem_vram_helper.h
>>> @@ -6,6 +6,7 @@
>>>  #include <drm/drm_file.h>
>>>  #include <drm/drm_gem.h>
>>>  #include <drm/drm_ioctl.h>
>>> +#include <drm/drm_modes.h>
>>>  #include <drm/ttm/ttm_bo_api.h>
>>>  #include <drm/ttm/ttm_bo_driver.h>
>>>  #include <drm/ttm/ttm_placement.h>
>>> @@ -205,4 +206,17 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
>>>  	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
>>>  void drm_vram_helper_release_mm(struct drm_device *dev);
>>> =20
>>> +/*
>>> + * Mode-config helpers
>>> + */
>>> +
>>> +enum drm_mode_status
>>> +drm_vram_helper_mode_valid_internal(struct drm_device *dev,
>>> +				    const struct drm_display_mode *mode,
>>> +				    unsigned long max_bpp);
>>> +
>>> +enum drm_mode_status
>>> +drm_vram_helper_mode_valid(struct drm_device *dev,
>>> +			   const struct drm_display_mode *mode);
>>> +
>>>  #endif
>>> --=20
>>> 2.25.0
>>>
>>
>> --=20
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eKCJLxFnfH8lqO0TP2H4zEXxPj3e7G7ro--

--pm5a8UawWXJEwZT4U5z0omeizqHyuYgVo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl439QgACgkQaA3BHVML
eiPXKggAqLtHE8RpLwkTIqGcGWuNOgh/ScpkmyL2QL3VqxW6dRW1J+dguZS/KdrZ
tpf1a4Pd80DTtmSgbDK6L9O4dTyGlwsAz5D24yIx+SOnpx9y1TQ1yMM0RgXWPQI4
3NJxlBndgAK7NlI5qOX40qS13LEsjTxKUHDHOR3Y4f0Q6QtfmNCY4WYkCslSvgmt
YfrSvKix3XLyBJ3gOuVna8/JjrOttUtZDXsqFqxO1x1BJGktHD8+e+WdR57Pz3YT
0O/NzSA/S8t6dRVX2e0tsnnxaeW86MH6A6kbARaEFDsBvCVquTEaDVBa01kEhqoB
wX35BEO1JzGUfIH82YjPEbPQR1WhnQ==
=KHNv
-----END PGP SIGNATURE-----

--pm5a8UawWXJEwZT4U5z0omeizqHyuYgVo--

--===============0270274197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0270274197==--
