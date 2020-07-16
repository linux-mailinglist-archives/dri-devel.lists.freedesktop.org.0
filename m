Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF5F22210A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 13:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCE16E115;
	Thu, 16 Jul 2020 11:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051CC6E115
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 11:00:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A8BDACDB;
 Thu, 16 Jul 2020 11:00:20 +0000 (UTC)
Subject: Re: [PATCH 1/6] drm/vram-helper: Managed vram helpers
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200708074912.25422-1-tzimmermann@suse.de>
 <20200708074912.25422-2-tzimmermann@suse.de>
 <20200708171921.GA121132@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <663458c8-5d46-44e3-eaa7-bb2f01f50451@suse.de>
Date: Thu, 16 Jul 2020 13:00:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708171921.GA121132@ravnborg.org>
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
Cc: airlied@redhat.com, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0275761197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0275761197==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6jbGNF64ncjX4VqJwCCmVCfYenrSsFDtn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6jbGNF64ncjX4VqJwCCmVCfYenrSsFDtn
Content-Type: multipart/mixed; boundary="1CTVD9gdkQCzAT2tHTJvVSklHfAObHPrx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Message-ID: <663458c8-5d46-44e3-eaa7-bb2f01f50451@suse.de>
Subject: Re: [PATCH 1/6] drm/vram-helper: Managed vram helpers
References: <20200708074912.25422-1-tzimmermann@suse.de>
 <20200708074912.25422-2-tzimmermann@suse.de>
 <20200708171921.GA121132@ravnborg.org>
In-Reply-To: <20200708171921.GA121132@ravnborg.org>

--1CTVD9gdkQCzAT2tHTJvVSklHfAObHPrx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 08.07.20 um 19:19 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Wed, Jul 08, 2020 at 09:49:07AM +0200, Thomas Zimmermann wrote:
>> Calling drmm_vram_helper_alloc_mm() sets up a managed instance of
>> VRAM MM. Releasing the DRM device also frees the memory manager.
>>
>> The patch also updates the DRM documentation for VRAM helpers. The
>> tutorial now only describes the new managed interface. The older
>> interfaces are deprecated and should not be used in new code.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> A couple of comments...

These are all good points. I'll fix them in the next revision.

Best regards
Thomas

>=20
>=20
>=20
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 68 ++++++++++++++++++++------=
-
>>  include/drm/drm_gem_vram_helper.h     |  4 ++
>>  2 files changed, 55 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index ad096600d89f..af116999b193 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -10,6 +10,7 @@
>>  #include <drm/drm_gem_framebuffer_helper.h>
>>  #include <drm/drm_gem_ttm_helper.h>
>>  #include <drm/drm_gem_vram_helper.h>
>> +#include <drm/drm_managed.h>
>>  #include <drm/drm_mode.h>
>>  #include <drm/drm_plane.h>
>>  #include <drm/drm_prime.h>
>> @@ -41,7 +42,7 @@ static const struct drm_gem_object_funcs drm_gem_vra=
m_object_funcs;
>>   * left in VRAM, inactive GEM objects can be moved to system memory.
>>   *
>>   * The easiest way to use the VRAM helper library is to call
>> - * drm_vram_helper_alloc_mm(). The function allocates and initializes=
 an
>> + * drmm_vram_helper_alloc_mm(). The function allocates and initialize=
s an
>>   * instance of &struct drm_vram_mm in &struct drm_device.vram_mm . Us=
e
>>   * &DRM_GEM_VRAM_DRIVER to initialize &struct drm_driver and
>>   * &DRM_VRAM_MM_FILE_OPERATIONS to initialize &struct file_operations=
;
>> @@ -69,7 +70,7 @@ static const struct drm_gem_object_funcs drm_gem_vra=
m_object_funcs;
>>   *		// setup device, vram base and size
>>   *		// ...
>>   *
>> - *		ret =3D drm_vram_helper_alloc_mm(dev, vram_base, vram_size);
>> + *		ret =3D drmm_vram_helper_alloc_mm(dev, vram_base, vram_size);
>>   *		if (ret)
>>   *			return ret;
> This example is how this should be done - but we are not there yet..
> See below.
>=20
>>   *		return 0;
>> @@ -81,20 +82,12 @@ static const struct drm_gem_object_funcs drm_gem_v=
ram_object_funcs;
>>   * manages an area of video RAM with VRAM MM and provides GEM VRAM ob=
jects
>>   * to userspace.
>>   *
>> - * To clean up the VRAM memory management, call drm_vram_helper_relea=
se_mm()
>> - * in the driver's clean-up code.
>> + * You don't have to clean up the instance of VRAM MM.
>> + * drmm_vram_helper_alloc_mm() is a managed interface that installs a=

>> + * clean-up handler to run during the DRM device's release.
>>   *
>> - * .. code-block:: c
>> - *
>> - *	void fini_drm_driver()
>> - *	{
>> - *		struct drm_device *dev =3D ...;
>> - *
>> - *		drm_vram_helper_release_mm(dev);
>> - *	}
>> - *
>> - * For drawing or scanout operations, buffer object have to be pinned=
 in video
>> - * RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
>> + * For drawing or scanout operations, rsp. buffer objects have to be =
pinned
>> + * in video RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_V=
RAM or
>>   * &DRM_GEM_VRAM_PL_FLAG_SYSTEM to pin a buffer object in video RAM o=
r system
>>   * memory. Call drm_gem_vram_unpin() to release the pinned object aft=
erwards.
>>   *
>> @@ -1177,12 +1170,16 @@ static void drm_vram_mm_cleanup(struct drm_vra=
m_mm *vmm)
>>   */
>> =20
>>  /**
>> - * drm_vram_helper_alloc_mm - Allocates a device's instance of \
>> -	&struct drm_vram_mm
>> + * drm_vram_helper_alloc_mm - Allocates a device's instance of
>> + *                            &struct drm_vram_mm
>>   * @dev:	the DRM device
>>   * @vram_base:	the base address of the video memory
>>   * @vram_size:	the size of the video memory in bytes
>>   *
>> + * The driver is responsible to clean-up the VRAM manager during
>> + * device cleanup by calling drm_vram_helper_release_mm(). Use
>> + * drmm_vram_helper_alloc_mm() if possible.
>> + *
>>   * Returns:
>>   * The new instance of &struct drm_vram_mm on success, or
>>   * an ERR_PTR()-encoded errno code otherwise.
> drm_vram_helper_alloc_mm is deprecated so just delete the kernel-doc.
> We do not want kernel-doc of deprecated functions.
>=20
>=20
>> @@ -1228,6 +1225,43 @@ void drm_vram_helper_release_mm(struct drm_devi=
ce *dev)
>>  }
>>  EXPORT_SYMBOL(drm_vram_helper_release_mm);
>> =20
>> +static void drm_vram_mm_release(struct drm_device *dev, void *ptr)
>> +{
>> +	drm_vram_helper_release_mm(dev);
>> +}
>> +
>> +/**
>> + * drmm_vram_helper_alloc_mm - Allocates a device's managed instance =
of
>> + *                             &struct drm_vram_mm
>> + * @dev:	the DRM device
>> + * @vram_base:	the base address of the video memory
>> + * @vram_size:	the size of the video memory in bytes
>> + *
>> + * The returned instance of &struct drm_vram_mm is auto-managed and
>> + * cleaned up as part of device cleanup.
> This should document that dev->vram_mm is assigned the value of the
> allocated drm_vram_mm is the allocation succeeds, otherwise set it to
> NULL.
>=20
>> + *
>> + * Returns:
> Some DRM doc uses "RETURNS" - I am not sure what it the most common way=
=2E
>=20
>> + * The new instance of &struct drm_vram_mm on success, or
>> + * an ERR_PTR()-encoded errno code otherwise.
>> + */
>> +struct drm_vram_mm *drmm_vram_helper_alloc_mm(struct drm_device *dev,=

>> +					      uint64_t vram_base,
>> +					      size_t vram_size)
>> +{
> None of the users of drm_vram_helper_alloc_mm() uses the pointer, they
> all uses PTR_ERR().
> So the right interface would be to return an int as already documented
> in the intro section.
> I had a patch to convert the function to return an int - but it is
> better to go direct to a managed interface.
>=20
>=20
>> +	struct drm_vram_mm *vram_mm;
>> +	int ret;
>> +
>> +	vram_mm =3D drm_vram_helper_alloc_mm(dev, vram_base, vram_size);
>> +	if (IS_ERR(vram_mm))
>> +		return vram_mm;
>> +	ret =3D drmm_add_action_or_reset(dev, drm_vram_mm_release, NULL);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return vram_mm;
>> +}
>> +EXPORT_SYMBOL(drmm_vram_helper_alloc_mm);
>> +
>>  /*
>>   * Mode-config helpers
>>   */
>> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_v=
ram_helper.h
>> index b63bcd1b996d..a456a272968b 100644
>> --- a/include/drm/drm_gem_vram_helper.h
>> +++ b/include/drm/drm_gem_vram_helper.h
>> @@ -206,6 +206,10 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
>>  	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
>>  void drm_vram_helper_release_mm(struct drm_device *dev);
>> =20
>> +struct drm_vram_mm *drmm_vram_helper_alloc_mm(struct drm_device *dev,=

>> +					      uint64_t vram_base,
>> +					      size_t vram_size);
>> +
>>  /*
>>   * Mode-config helpers
>>   */
>> --=20
>> 2.27.0
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


--1CTVD9gdkQCzAT2tHTJvVSklHfAObHPrx--

--6jbGNF64ncjX4VqJwCCmVCfYenrSsFDtn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8QMz8UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMxJQf/fxflQ9O2AzeJNSBA8vxvIj2X982D
jsXvFKZpGEVIn75MInglWJ+XIt/zorotOOlSYYu0fyeTDHGnoo7Ye1dE0JYLUll5
rsJ0jEjPcFx9lLJeL4lKJRxqdNT2FcJ6EwdCoqKYyhkSP2njk6VKW6ysuYTjH3H6
rruj4wYB5emi/ScTRgFrPE3eUtJlw4dfbsOqEEnjdFge8/7+LFrfIrXkdVVtBfW8
RDcuNb9sdvJIBH7GhPewAOp+A5Dsyva5f8/7Jg4kJ/IOqfNyFgYtsz6iq6npd7YJ
WXZ4KI0UWUWXdgUQ5tNnuw0FpdxrmMtK5pyYZ+VHOPAo1ZIREAs3y6AMKw==
=Ds1r
-----END PGP SIGNATURE-----

--6jbGNF64ncjX4VqJwCCmVCfYenrSsFDtn--

--===============0275761197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0275761197==--
