Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EFF22A8D0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 08:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F147A6E15D;
	Thu, 23 Jul 2020 06:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543B6E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 06:20:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9DA0ABD2;
 Thu, 23 Jul 2020 06:20:23 +0000 (UTC)
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <34224c32-7c17-4c7e-1ec9-03215ec7ed8a@suse.de>
 <e11f2cc1a3348260d08d13f1d43df4ef534f09f6.camel@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6750688b-8444-e3c1-e3d7-41dfa6951c81@suse.de>
Date: Thu, 23 Jul 2020 08:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e11f2cc1a3348260d08d13f1d43df4ef534f09f6.camel@pengutronix.de>
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
Content-Type: multipart/mixed; boundary="===============0009683097=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0009683097==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6XpjKrSJdlRoyKFlrg4joEByy33peeHAb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6XpjKrSJdlRoyKFlrg4joEByy33peeHAb
Content-Type: multipart/mixed; boundary="O8U9YG4DAitNnirHErDis3mViOGC4dxUG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: kernel@pengutronix.de
Message-ID: <6750688b-8444-e3c1-e3d7-41dfa6951c81@suse.de>
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <34224c32-7c17-4c7e-1ec9-03215ec7ed8a@suse.de>
 <e11f2cc1a3348260d08d13f1d43df4ef534f09f6.camel@pengutronix.de>
In-Reply-To: <e11f2cc1a3348260d08d13f1d43df4ef534f09f6.camel@pengutronix.de>

--O8U9YG4DAitNnirHErDis3mViOGC4dxUG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.07.20 um 17:08 schrieb Philipp Zabel:
> Hi Thomas,
>=20
> thank you for your comment.
>=20
> On Wed, 2020-07-22 at 16:43 +0200, Thomas Zimmermann wrote:
>> Hi
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
>>> =20
>>> +static void drmm_encoder_cleanup(struct drm_device *dev, void *ptr)
>>> +{
>>> +	struct drm_encoder *encoder =3D ptr;
>>> +
>>> +	drm_encoder_cleanup(encoder);
>>> +}
>>
>> This doesn't work. DRM cleans up the encoder by invoking the destroy
>> callback from the encoder functions. This additional helper would
>> cleanup the encoder a second time.
>=20
> Indeed this would require the encoder destroy callback to be NULL.
>=20
>> You can already embed the encoder in another structure and things shou=
ld
>> work as expected.
>=20
> If the embedding structure is a component allocated with drmm_kmalloc()=

> after the call to drmm_mode_config_init(), the structure will already b=
e
> freed before the destroy callback is run from
> drmm_mode_config_init_release().

Why not put the kamlloc before the mode_config_init? Is there some
complicated dependency?

As the number of encoders is limited, one could also embed the maximum
number of instances.

The purpose of simple encoder is to move the function structure to a
single place. IMHO if you need something special, such as in the given
drmm_kmalloc() example, you should roll your own in the driver.

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


--O8U9YG4DAitNnirHErDis3mViOGC4dxUG--

--6XpjKrSJdlRoyKFlrg4joEByy33peeHAb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ZLB8UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMe9AgAiyBLvVgD+Pmu8BSXMXp5MeeOee0X
5SQw3i3JEbtas2rw1sZFcRe0l6EP489K2IymL2AUxYPRzUpUDuGM1noGBzrySKFk
VTBc8klxN5lM4l5a9Kdzgp3EVIBTyV6COXZfqFwO8Zluo34kolz+KzHFAkC6zzuf
lwWG/4FJDmyYxuC3+ZMOnGXq7LaApVzfPPgBNie+OufLDe2LI+zRNzN7H/b7qM9a
Y6TghM03+ndSVGp7srNvIoLFop6IzKD7fYKDOuvjwvpNaAP5d+7bfyfFDjKzsGbs
d8s+b1CrRtVnfsuLG5GB6Y+C+8L0AgiX+UU5iUkXHANyn6rbuQ0DS+kIyw==
=FFrT
-----END PGP SIGNATURE-----

--6XpjKrSJdlRoyKFlrg4joEByy33peeHAb--

--===============0009683097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0009683097==--
