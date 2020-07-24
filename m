Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712B22BEDD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 09:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385926E4BB;
	Fri, 24 Jul 2020 07:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C966E4BB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 07:17:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33AFAACB5;
 Fri, 24 Jul 2020 07:17:57 +0000 (UTC)
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <d17c7f37-e63e-b4a9-adde-c691f09a0075@suse.de>
 <40ff9fdfb62d93f30a803f8397ae0c0f61e8e51a.camel@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c34458e7-5d97-99f4-c00d-b0bd873a0ece@suse.de>
Date: Fri, 24 Jul 2020 09:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <40ff9fdfb62d93f30a803f8397ae0c0f61e8e51a.camel@pengutronix.de>
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
Cc: kernel@pengutronix.de
Content-Type: multipart/mixed; boundary="===============0996983301=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0996983301==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RNh0i6aUy8C2CnZoRqYLOo5eU8SNW3ium"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RNh0i6aUy8C2CnZoRqYLOo5eU8SNW3ium
Content-Type: multipart/mixed; boundary="1Hv2TYA44YnKdToMtALCVHw7QZpbrbxN1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: kernel@pengutronix.de
Message-ID: <c34458e7-5d97-99f4-c00d-b0bd873a0ece@suse.de>
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <d17c7f37-e63e-b4a9-adde-c691f09a0075@suse.de>
 <40ff9fdfb62d93f30a803f8397ae0c0f61e8e51a.camel@pengutronix.de>
In-Reply-To: <40ff9fdfb62d93f30a803f8397ae0c0f61e8e51a.camel@pengutronix.de>

--1Hv2TYA44YnKdToMtALCVHw7QZpbrbxN1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.07.20 um 16:46 schrieb Philipp Zabel:
> Hi Thomas,
>=20
> On Thu, 2020-07-23 at 09:35 +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> I have meanwhile seen your imx patchset where this would be useful.
>>
>> I still think you should try to pre-allocated all encoders up to a
>> limit, so that an extra drmm_kzalloc() is not required. But see my
>> comments below.
>=20
> Thank you for the review coments. The complication with imx-drm is that=

> the encoders are all in separate platform devices, using the component
> framework. Preallocating encoders in the main driver would be
> impractical.
>=20
> The encoders are added in the component .bind() callback, so the main
> driver must call drmm_mode_config_init() before binding all components.=

> The bind callback also is the first place where the component drivers
> get to know the drm device, so it is not possible to use drmm_kzalloc()=

> any earlier.
>=20
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
>>> =20
>>> +static void drmm_encoder_cleanup(struct drm_device *dev, void *ptr)
>>
>> It's the reset helper, so drmm_simple_encoder_reset() would be appropr=
iate.
>>
>>> +{
>>> +	struct drm_encoder *encoder =3D ptr;
>>> +
>>> +	drm_encoder_cleanup(encoder);
>>
>> This should first check for (encoder->dev) being true. If drivers
>> somehow manage to clean-up the mode config first, we should detect it.=
 I
>> know it's a bug, but I wouldn't trust drivers with that.
>=20
> I don't think this can happen, a previously called drm_encoder_cleanup(=
)
> would have removed the encoder from the drm_mode_config::encoder list.

It cannot legally happen, but AFAICS a careless driver could run
drm_mode_config_cleanup() and release the encoder. This release callback
would still run afterwards and it should warn about the error.

>=20
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
>=20
> Copy & paste from the drm_simple_encoder_init, I'll fix this in the nex=
t
> version.

Yeah. That was originally my typo. :p

>=20
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
>=20
> I was hoping that we would eventually switch to drmres cleanup as the
> preferred method, thus getting rid of the need for per-driver cleanup i=
n
> the error paths and destroy callbacks in most cases.

True. I do support that. But we should also consider how to do this
efficiently. Using drmm_mode_config_init() sets up a release function
that handles all initialized encoders. For the majority of drivers, this
is sufficient. Using drmm_encoder_init() in those drivers just adds
overhead without additional benefits. That's also why I consider imx'
requirements a corner case.

Best regards
Thomas

>=20
> regards
> Philipp
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


--1Hv2TYA44YnKdToMtALCVHw7QZpbrbxN1--

--RNh0i6aUy8C2CnZoRqYLOo5eU8SNW3ium
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8aixkUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOW+Af/ZBBvZO5bM1EvFGKV6v2IS9h/9OzG
CwR2OeilYte8ryq/zWNlGgYqFWhiB0aIuDYsOSlE4k1HzqqklVhI3yNJvuc3iuTT
ZBwOhMvIcTrLQr1jylju0oEYFWAJ/yZ7y6C0BVu6UGl+b24xDESyLmFpYQRX+5U9
5r70FbSzM+kpJmO2lvvC6cLObj3Pr82LgY0EYpEqK/n+lqxQgu1DVZzO9vMyReWP
WpiOY5otjJgLfgX6S+vivuR9Iq+8PdLG6E/U7Z/amS1qBWfmrfRFC8JcPhrcGMCL
WL3poZ+j+Legx4owRTF7FgsOBXpB+mG1v9ym8VV6Zs8Lrsi9EcLd2/ZFIw==
=LAKF
-----END PGP SIGNATURE-----

--RNh0i6aUy8C2CnZoRqYLOo5eU8SNW3ium--

--===============0996983301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0996983301==--
