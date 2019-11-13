Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA29FB3E7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F90A6ED67;
	Wed, 13 Nov 2019 15:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350A56ED67
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:41:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C345B1FD;
 Wed, 13 Nov 2019 15:41:08 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] drm/udl: Replace fbdev code with generic emulation
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com, 
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-2-tzimmermann@suse.de>
 <7c9289a6-1a4e-e0d3-ce9e-3f5d6305da69@tronnes.org>
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
Message-ID: <c2d1d12d-d90e-f6f6-9608-9955e63a8bec@suse.de>
Date: Wed, 13 Nov 2019 16:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <7c9289a6-1a4e-e0d3-ce9e-3f5d6305da69@tronnes.org>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1349232061=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1349232061==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MUZ0CICzXdQU7zjQFtQ8TsMo9EZyBJIyT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MUZ0CICzXdQU7zjQFtQ8TsMo9EZyBJIyT
Content-Type: multipart/mixed; boundary="1IOtx37RiYQz9L8B57LSRFxdKmUon48jm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <c2d1d12d-d90e-f6f6-9608-9955e63a8bec@suse.de>
Subject: Re: [PATCH v4 1/3] drm/udl: Replace fbdev code with generic emulation
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-2-tzimmermann@suse.de>
 <7c9289a6-1a4e-e0d3-ce9e-3f5d6305da69@tronnes.org>
In-Reply-To: <7c9289a6-1a4e-e0d3-ce9e-3f5d6305da69@tronnes.org>

--1IOtx37RiYQz9L8B57LSRFxdKmUon48jm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.11.19 um 16:26 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 13.11.2019 12.52, skrev Thomas Zimmermann:
>> The udl driver can use the generic fbdev implementation. Convert it.
>>
>> v4:
>> 	* hardcode console bpp to 16
>> v3:
>> 	* remove module parameter fb_bpp in favor of fbdev's video
>> 	* call drm_fbdev_generic_setup() directly; remove udl_fbdev_init()
>> 	* use default for struct drm_mode_config_funcs.output_poll_changed
>> 	* use default for struct drm_driver.lastclose
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>=20
>> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_=
main.c
>> index 4e854e017390..3be0c0cec49e 100644
>> --- a/drivers/gpu/drm/udl/udl_main.c
>> +++ b/drivers/gpu/drm/udl/udl_main.c
>> @@ -9,6 +9,7 @@
>>   */
>> =20
>>  #include <drm/drm.h>
>> +#include <drm/drm_fb_helper.h>
>>  #include <drm/drm_print.h>
>>  #include <drm/drm_probe_helper.h>
>> =20
>> @@ -338,7 +339,7 @@ int udl_init(struct udl_device *udl)
>>  	if (ret)
>>  		goto err;
>> =20
>> -	ret =3D udl_fbdev_init(dev);
>> +	ret =3D drm_fbdev_generic_setup(dev, 16);
>=20
> I suggest you put this after drm_dev_register() in _probe() since fbdev=

> is a client, a user of the driver, not part of it as such.

Good point. I'll change it.

>=20
> Either way you choose:

Glad you like it :)

>=20
> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

Thanks for the review.

Best regards
Thomas

>=20
> Btw, nice diffstat!
>=20
>>  	if (ret)
>>  		goto err;
>> =20
>> @@ -367,6 +368,4 @@ void udl_fini(struct drm_device *dev)
>> =20
>>  	if (udl->urbs.count)
>>  		udl_free_urb_list(dev);
>> -
>> -	udl_fbdev_cleanup(dev);
>>  }
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


--1IOtx37RiYQz9L8B57LSRFxdKmUon48jm--

--MUZ0CICzXdQU7zjQFtQ8TsMo9EZyBJIyT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3MJBAACgkQaA3BHVML
eiNOoggAtgNWfEKPliAot2UIOzJyX99OHZ9PFCQVDh39lyn6KiXDYWH4t/3hP2+2
GpC3gfqr3t6zL8oI/RUfRhiv1RiqIMRcndRCyWJitho4fI9jZqknyExN9tJnGJMp
JSlPSLRoRJcwCn7WNDA9GJ369N8KDk4tzBs3FJh67389B0G5gj9/DFxsMwfsoxHG
1aiAerjev/BVjGZEwguosmrzVySsgs6qvmYPtX5aGuNz/gkllnTxK2wipfLKKeE3
Rv8Kc2E2GGJgmvFh5CyJhEYoJBQk12BNx8mDA9PFKs69FJ3UwEPV5HmhvF/2fVCg
ir3SwkmpWDTzSCNJIIsfim32lCLR3g==
=Ve5e
-----END PGP SIGNATURE-----

--MUZ0CICzXdQU7zjQFtQ8TsMo9EZyBJIyT--

--===============1349232061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1349232061==--
