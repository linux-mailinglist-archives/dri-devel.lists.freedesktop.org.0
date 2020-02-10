Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BFB1570B9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74736E91F;
	Mon, 10 Feb 2020 08:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F15F6E91F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 08:18:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEA94AC6E;
 Mon, 10 Feb 2020 08:18:52 +0000 (UTC)
Subject: Re: [PATCH v4 18/22] drm/vc4: Convert to CRTC VBLANK callbacks
To: Eric Anholt <eric@anholt.net>, dri-devel <dri-devel@lists.freedesktop.org>
References: <20200123135943.24140-1-tzimmermann@suse.de>
 <20200123135943.24140-19-tzimmermann@suse.de>
 <CADaigPXhkzHpXhrbb_A-uLmAjkXReXhbqmZ3yta9CUnBhSp_ig@mail.gmail.com>
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
Message-ID: <a874c4c9-c308-372d-4127-f2f1e2666317@suse.de>
Date: Mon, 10 Feb 2020 09:18:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADaigPXhkzHpXhrbb_A-uLmAjkXReXhbqmZ3yta9CUnBhSp_ig@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1078390252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1078390252==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BJpm3AkIi8CSM1ZWuNqvEObSen3sbVxg0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BJpm3AkIi8CSM1ZWuNqvEObSen3sbVxg0
Content-Type: multipart/mixed; boundary="V4A9FAeKcoQ6aG1uiZsEyWIdtKpBH51wx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Eric Anholt <eric@anholt.net>, dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <a874c4c9-c308-372d-4127-f2f1e2666317@suse.de>
Subject: Re: [PATCH v4 18/22] drm/vc4: Convert to CRTC VBLANK callbacks
References: <20200123135943.24140-1-tzimmermann@suse.de>
 <20200123135943.24140-19-tzimmermann@suse.de>
 <CADaigPXhkzHpXhrbb_A-uLmAjkXReXhbqmZ3yta9CUnBhSp_ig@mail.gmail.com>
In-Reply-To: <CADaigPXhkzHpXhrbb_A-uLmAjkXReXhbqmZ3yta9CUnBhSp_ig@mail.gmail.com>

--V4A9FAeKcoQ6aG1uiZsEyWIdtKpBH51wx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

adding dri-devel

Am 04.02.20 um 20:17 schrieb Eric Anholt:
> vc4 changes are:
>=20
> Acked-by: Eric Anholt <eric@anholt.net>
>=20
> On Thu, Jan 23, 2020 at 6:00 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> VBLANK callbacks in struct drm_driver are deprecated in favor of
>> their equivalents in struct drm_crtc_funcs. Convert vc4 over.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/vc4/vc4_crtc.c | 1 +
>>  drivers/gpu/drm/vc4/vc4_drv.c  | 2 --
>>  2 files changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_=
crtc.c
>> index f1e7597ea17e..1208258ad3b2 100644
>> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
>> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
>> @@ -1031,6 +1031,7 @@ static const struct drm_crtc_funcs vc4_crtc_func=
s =3D {
>>         .gamma_set =3D drm_atomic_helper_legacy_gamma_set,
>>         .enable_vblank =3D vc4_enable_vblank,
>>         .disable_vblank =3D vc4_disable_vblank,
>> +       .get_vblank_timestamp =3D drm_crtc_vblank_helper_get_vblank_ti=
mestamp,
>>  };
>>
>>  static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs =3D {=

>> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_d=
rv.c
>> index e6982a7b0c5e..76f93b662766 100644
>> --- a/drivers/gpu/drm/vc4/vc4_drv.c
>> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
>> @@ -190,8 +190,6 @@ static struct drm_driver vc4_drm_driver =3D {
>>         .irq_postinstall =3D vc4_irq_postinstall,
>>         .irq_uninstall =3D vc4_irq_uninstall,
>>
>> -       .get_vblank_timestamp =3D drm_calc_vbltimestamp_from_scanoutpo=
s,
>> -
>>  #if defined(CONFIG_DEBUG_FS)
>>         .debugfs_init =3D vc4_debugfs_init,
>>  #endif
>> --
>> 2.24.1
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--V4A9FAeKcoQ6aG1uiZsEyWIdtKpBH51wx--

--BJpm3AkIi8CSM1ZWuNqvEObSen3sbVxg0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5BEdYACgkQaA3BHVML
eiN/AQf/b2108satIBRxFEvWBUwCO1KB2dpbRMCBQa3rSrmeMm0tEPFJd9wsxTgD
hsx/SiFe/K+i5BTU35SrUodVCTTvE9q21ChUUi1/3+Unk1cKy4zTw8lYx8HGaab6
fDYvNexMm1Z33Im0fbrkoEYJNJzvzxAyMyNxH2JhNPfn+Q71o83W7mC6+tu2Dn0o
RSAWSSq1s8YopAuvMxUSFxqfvjGnd9JBeRrB29EMalIg9oXTy8AA0Zur33S6EqEH
116M8FtEF4Fvk00L5CT12hO6Wknpzk33LWXQcwDYGKUAOx1VN3R0Cq5f0kxTBts4
kjRu8kavBfwgGAzhasypvq6Cpf/3QQ==
=WWyS
-----END PGP SIGNATURE-----

--BJpm3AkIi8CSM1ZWuNqvEObSen3sbVxg0--

--===============1078390252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1078390252==--
