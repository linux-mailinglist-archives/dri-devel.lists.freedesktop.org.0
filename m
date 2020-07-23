Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5405A22AB8B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 11:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2D389C19;
	Thu, 23 Jul 2020 09:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA5D89B78
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 09:13:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1653AC7C;
 Thu, 23 Jul 2020 09:13:24 +0000 (UTC)
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <d17c7f37-e63e-b4a9-adde-c691f09a0075@suse.de>
 <CAKMK7uHzYkR4R=2gUZf28rbGM+NmoTCtL_kuGxMe0erZo6KeCA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <39754137-376f-da84-edd2-2134772f3a39@suse.de>
Date: Thu, 23 Jul 2020 11:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHzYkR4R=2gUZf28rbGM+NmoTCtL_kuGxMe0erZo6KeCA@mail.gmail.com>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1981038869=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1981038869==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sq1vCxhkOr63hflDw4Jj3iPp1dqHGEJLE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sq1vCxhkOr63hflDw4Jj3iPp1dqHGEJLE
Content-Type: multipart/mixed; boundary="yYoO9YZJPvxciRyglPbn2ORJc0us7v77s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>
Message-ID: <39754137-376f-da84-edd2-2134772f3a39@suse.de>
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <d17c7f37-e63e-b4a9-adde-c691f09a0075@suse.de>
 <CAKMK7uHzYkR4R=2gUZf28rbGM+NmoTCtL_kuGxMe0erZo6KeCA@mail.gmail.com>
In-Reply-To: <CAKMK7uHzYkR4R=2gUZf28rbGM+NmoTCtL_kuGxMe0erZo6KeCA@mail.gmail.com>

--yYoO9YZJPvxciRyglPbn2ORJc0us7v77s
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.07.20 um 11:05 schrieb Daniel Vetter:
> On Thu, Jul 23, 2020 at 9:36 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> I have meanwhile seen your imx patchset where this would be useful.
>>
>> I still think you should try to pre-allocated all encoders up to a
>> limit, so that an extra drmm_kzalloc() is not required. But see my
>> comments below.
>=20
> Uh preallocation is horribly, because you need to first preallocate
> all encoders, then call drmm_mode_config_init, and only then can you
> call  drm_encoder_init. That's terrible flow, and I'm aware of the

Out of curiosity, what's the problem with the code flow? If you embed
everything in the device's structure, you'd pre-allocate automatically.
Then acquire one of the encoders just before drm_encoder_init(). Sure,
it needs a little helper to acquire and release the preallocated encoder
memory, but that's not that bad.

Best regards
Thomas

> problem. That's why we need new set of drmm_ helpers to do all the
> steps for kms static object setup, if we actually want to improve
> things.
> -Daniel
>=20
>>
>> Am 22.07.20 um 15:25 schrieb Philipp Zabel:
>>> Add a drm_simple_encoder_init() variant that registers
>>> drm_encoder_cleanup() with drmm_add_action().
>>>
>>> Now drivers can store encoders in memory allocated with drmm_kmalloc(=
)
>>> after the call to drmm_mode_config_init(), without having to manually=

>>> make sure that drm_encoder_cleanup() is called before the memory is
>>> freed.
>>>
>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> ---
>>>  drivers/gpu/drm/drm_simple_kms_helper.c | 42 +++++++++++++++++++++++=
++
>>>  include/drm/drm_simple_kms_helper.h     |  4 +++
>>>  2 files changed, 46 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/dr=
m/drm_simple_kms_helper.c
>>> index 74946690aba4..a243f00cf63d 100644
>>> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
>>> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
>>> @@ -9,6 +9,7 @@
>>>  #include <drm/drm_atomic.h>
>>>  #include <drm/drm_atomic_helper.h>
>>>  #include <drm/drm_bridge.h>
>>> +#include <drm/drm_managed.h>
>>>  #include <drm/drm_plane_helper.h>
>>>  #include <drm/drm_probe_helper.h>
>>>  #include <drm/drm_simple_kms_helper.h>
>>> @@ -71,6 +72,47 @@ int drm_simple_encoder_init(struct drm_device *dev=
,
>>>  }
>>>  EXPORT_SYMBOL(drm_simple_encoder_init);
>>>
>>> +static void drmm_encoder_cleanup(struct drm_device *dev, void *ptr)
>>
>> It's the reset helper, so drmm_simple_encoder_reset() would be appropr=
iate.
>>
>>> +{
>>> +     struct drm_encoder *encoder =3D ptr;
>>> +
>>> +     drm_encoder_cleanup(encoder);
>>
>> This should first check for (encoder->dev) being true. If drivers
>> somehow manage to clean-up the mode config first, we should detect it.=
 I
>> know it's a bug, but I wouldn't trust drivers with that.
>>
>>> +}
>>> +
>>> +/**
>>> + * drmm_simple_encoder_init - Initialize a preallocated encoder with=

>>> + *                            basic functionality.
>>> + * @dev: drm device
>>> + * @encoder: the encoder to initialize
>>> + * @encoder_type: user visible type of the encoder
>>> + *
>>> + * Initialises a preallocated encoder that has no further functional=
ity.
>>
>> 'Initializes'
>>
>>> + * Settings for possible CRTC and clones are left to their initial v=
alues.
>>> + * Cleanup is automatically handled through registering drm_encoder_=
cleanup()
>>> + * with drmm_add_action().
>>> + *
>>> + * The caller of drmm_simple_encoder_init() is responsible for alloc=
ating
>>> + * the encoder's memory with drmm_kzalloc() to ensure it is automati=
cally
>>> + * freed after the encoder has been cleaned up.
>>> + *
>>
>> The idiomatic way of cleaning up an encoder is via mode-config cleanup=
=2E
>> This interface is an exception for a corner case. So there needs to be=
 a
>> paragraph that clearly explains the corner case. Please also discourag=
e
>> from using drmm_simple_encoder_init() if drm_simple_encoder_init() wou=
ld
>> work.
>>
>> Best regards
>> Thomas
>>
>>> + * Returns:
>>> + * Zero on success, error code on failure.
>>> + */
>>> +int drmm_simple_encoder_init(struct drm_device *dev,
>>> +                          struct drm_encoder *encoder,
>>> +                          int encoder_type)
>>> +{
>>> +     int ret;
>>> +
>>> +     ret =3D drm_encoder_init(dev, encoder, &drm_simple_encoder_func=
s_cleanup,
>>> +                            encoder_type, NULL);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     return drmm_add_action_or_reset(dev, drmm_encoder_cleanup, enco=
der);
>>> +}
>>> +EXPORT_SYMBOL(drmm_simple_encoder_init);
>>> +
>>>  static enum drm_mode_status
>>>  drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
>>>                              const struct drm_display_mode *mode)
>>> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_si=
mple_kms_helper.h
>>> index a026375464ff..27f0915599c8 100644
>>> --- a/include/drm/drm_simple_kms_helper.h
>>> +++ b/include/drm/drm_simple_kms_helper.h
>>> @@ -185,4 +185,8 @@ int drm_simple_encoder_init(struct drm_device *de=
v,
>>>                           struct drm_encoder *encoder,
>>>                           int encoder_type);
>>>
>>> +int drmm_simple_encoder_init(struct drm_device *dev,
>>> +                          struct drm_encoder *encoder,
>>> +                          int encoder_type);
>>> +
>>>  #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--yYoO9YZJPvxciRyglPbn2ORJc0us7v77s--

--sq1vCxhkOr63hflDw4Jj3iPp1dqHGEJLE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ZVKkUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP+HQgAtwG79uro4d1oR89Ow8T85h4eDHmf
auePi+OX31ggUBevsX7XtDx40tjmHdjKgSWBEP6v9JmAZf5giEhrhxeCrBOplB6L
Xn4hmN7gqohlTChKL63J/6le6LI75XGsW1fhBSczDcRFaQPRRrmIKUbZldo4o0jv
PYT/MyFBaIcsS8rWk9dWE+mLgYEoxcvnd3JO23IlTbWQ45rZTQZROpubGehuP4XA
MH+H/+eqCg6hdOcokrwndj+aJQqPasKsriW7KJX+QwgWKGLnG0iLfIfZqcctUK/L
O0vLYLmJd4n4Oeq2gLwIWv1dMeCq1YgPiuQgoML1iHpnUui8r+sJA1UC/Q==
=9Vnq
-----END PGP SIGNATURE-----

--sq1vCxhkOr63hflDw4Jj3iPp1dqHGEJLE--

--===============1981038869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1981038869==--
