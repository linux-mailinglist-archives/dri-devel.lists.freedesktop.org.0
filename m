Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4220CF8F01
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 12:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D67C6E444;
	Tue, 12 Nov 2019 11:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975986E444
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:55:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B2D89AC11;
 Tue, 12 Nov 2019 11:55:09 +0000 (UTC)
Subject: Re: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com, 
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
References: <20191108123333.25274-1-tzimmermann@suse.de>
 <20191108123333.25274-2-tzimmermann@suse.de>
 <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>
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
Message-ID: <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
Date: Tue, 12 Nov 2019 12:55:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>
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
Content-Type: multipart/mixed; boundary="===============0637462082=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0637462082==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oM1n5Xv0XzkMklFoPRR1QrONGnGqxtMB1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oM1n5Xv0XzkMklFoPRR1QrONGnGqxtMB1
Content-Type: multipart/mixed; boundary="3VnkYXJgAyTmnQKSOwmUmjZ4uSwgQxCHc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
Subject: Re: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
References: <20191108123333.25274-1-tzimmermann@suse.de>
 <20191108123333.25274-2-tzimmermann@suse.de>
 <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>
In-Reply-To: <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>

--3VnkYXJgAyTmnQKSOwmUmjZ4uSwgQxCHc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.11.19 um 16:37 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 08.11.2019 13.33, skrev Thomas Zimmermann:
>> The udl driver can use the generic fbdev implementation. Convert it.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>=20
>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_d=
rv.c
>> index 563cc5809e56..55c0f9dfee29 100644
>> --- a/drivers/gpu/drm/udl/udl_drv.c
>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>=20
>> @@ -47,6 +48,8 @@ static struct drm_driver driver =3D {
>>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM,
>>  	.release =3D udl_driver_release,
>> =20
>> +	.lastclose =3D drm_fb_helper_lastclose,
>> +
>=20
> No need to set this, it's already wired up:
>=20
> drm_lastclose -> drm_client_dev_restore -> drm_fbdev_client_restore ->
> drm_fb_helper_lastclose
>=20
>>  	/* gem hooks */
>>  	.gem_create_object =3D udl_driver_gem_create_object,
>> =20
>=20
>> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb=
=2Ec
>> index f8153b726343..afe74f892a2b 100644
>> --- a/drivers/gpu/drm/udl/udl_fb.c
>> +++ b/drivers/gpu/drm/udl/udl_fb.c
>> @@ -20,19 +20,9 @@
>> =20
>>  #include "udl_drv.h"
>> =20
>> -#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay in ji=
ffies */
>> -
>> -static int fb_defio =3D 0;  /* Optionally enable experimental fb_defi=
o mmap support */
>>  static int fb_bpp =3D 16;
>> =20
>>  module_param(fb_bpp, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
>=20
> Maybe fb_bpp can be dropped too?

Sure, makes sense.

The driver exposes a preferred color depth of 24 bpp, which we may want
to change to 16 then. The internal framebuffer is only 16 bpp anyway.

Best regards
Thomas

>=20
> It's possible to set it on the command line:
>=20
> video=3D<xres>x<yres>-<bpp>
>=20
> I haven't tried it so I can't say for certain that it actually works>
> Ref: Documentation/fb/modedb.rst and drm_fb_helper_single_fb_probe()
>=20
>> -module_param(fb_defio, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
>> -
>=20
>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/u=
dl_modeset.c
>> index bc1ab6060dc6..1517d5e881b8 100644
>> --- a/drivers/gpu/drm/udl/udl_modeset.c
>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
>=20
>> @@ -422,7 +423,7 @@ static int udl_crtc_init(struct drm_device *dev)
>> =20
>>  static const struct drm_mode_config_funcs udl_mode_funcs =3D {
>>  	.fb_create =3D udl_fb_user_fb_create,
>> -	.output_poll_changed =3D NULL,
>> +	.output_poll_changed =3D drm_fb_helper_output_poll_changed,
>=20
> No need to set this, it's already wired up:
>=20
> drm_kms_helper_hotplug_event -> drm_client_dev_hotplug ->
> drm_fbdev_client_hotplug -> drm_fb_helper_hotplug_event
>=20
> Noralf.
>=20
>>  };
>> =20
>>  int udl_modeset_init(struct drm_device *dev)
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3VnkYXJgAyTmnQKSOwmUmjZ4uSwgQxCHc--

--oM1n5Xv0XzkMklFoPRR1QrONGnGqxtMB1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3KnZgACgkQaA3BHVML
eiPphQgAiZy6+o2UcgMic4Ayg8kwZQALfpyCkTCeDsrMeFkZijHq7YYjJPdvvmDm
wvclOa6m7z1hF3zphiDXeh/dpv9fHhRMm2ao0jL7hLgorOM6LglEwRrHLYq8M9zt
M4doCvUGHaQCoLruIv758tbvImSd8J/SeLNO77CU//44RZMUGkGE1+Ok1MG0VQfO
kTK+62ijSMINHIKGx8kyyaDslrkkD4773lSvngm+iUhYnPsCqGDaFLiscmkpkXv7
CFCwxOQhLgVE2vezIHAv42TIiw7GAZfC1AhYJod+deGGX/Pv4ytODiqJwsldraAK
o15e4tXFowdMUlT+nP6/GTK18XVkcQ==
=jiRu
-----END PGP SIGNATURE-----

--oM1n5Xv0XzkMklFoPRR1QrONGnGqxtMB1--

--===============0637462082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0637462082==--
