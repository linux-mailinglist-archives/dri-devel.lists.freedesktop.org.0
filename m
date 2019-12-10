Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B0118248
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0D389BF3;
	Tue, 10 Dec 2019 08:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1044 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 08:33:52 UTC
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1E289BF3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:33:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 396C6AB71;
 Tue, 10 Dec 2019 08:16:27 +0000 (UTC)
Subject: Re: [PATCH v2 4/9] drm/udl: Inline DPMS code into CRTC enable and
 disable functions
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20191206124713.5748-1-tzimmermann@suse.de>
 <20191206124713.5748-5-tzimmermann@suse.de>
 <CACvgo53UE9WpQUHu1ftxAVBW98hDsEyqvE6a6r=UUrX1Rm7x3Q@mail.gmail.com>
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
Message-ID: <363f515a-40f0-c26b-ac52-0168fa2ac150@suse.de>
Date: Tue, 10 Dec 2019 09:16:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACvgo53UE9WpQUHu1ftxAVBW98hDsEyqvE6a6r=UUrX1Rm7x3Q@mail.gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0824184403=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0824184403==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cIwSp31UCoQt7S9tZ5Z3kV9w73TYKQpVB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cIwSp31UCoQt7S9tZ5Z3kV9w73TYKQpVB
Content-Type: multipart/mixed; boundary="sV8ZkeFwr6jHFtYPjHHpzOD8gKYbJG6JA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@pr.hu>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <363f515a-40f0-c26b-ac52-0168fa2ac150@suse.de>
Subject: Re: [PATCH v2 4/9] drm/udl: Inline DPMS code into CRTC enable and
 disable functions
References: <20191206124713.5748-1-tzimmermann@suse.de>
 <20191206124713.5748-5-tzimmermann@suse.de>
 <CACvgo53UE9WpQUHu1ftxAVBW98hDsEyqvE6a6r=UUrX1Rm7x3Q@mail.gmail.com>
In-Reply-To: <CACvgo53UE9WpQUHu1ftxAVBW98hDsEyqvE6a6r=UUrX1Rm7x3Q@mail.gmail.com>

--sV8ZkeFwr6jHFtYPjHHpzOD8gKYbJG6JA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.12.19 um 15:35 schrieb Emil Velikov:
> On Fri, 6 Dec 2019 at 12:47, Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>>
>> DPMS functionality is only used by the CRTC's enable and disable
>> functions. Inline the code.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/udl/udl_modeset.c | 84 +++++++++++-------------------=
-
>>  1 file changed, 30 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/u=
dl_modeset.c
>> index 72884cbda131..4681446c2323 100644
>> --- a/drivers/gpu/drm/udl/udl_modeset.c
>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
>> @@ -48,25 +48,9 @@ static char *udl_vidreg_unlock(char *buf)
>>   *  0x01 H and V sync off (screen blank but powered)
>>   *  0x07 DPMS powerdown (requires modeset to come back)
>>   */
>> -static char *udl_set_blank(char *buf, int dpms_mode)
>> +static char *udl_set_blank_mode(char *buf, u8 mode)
>>  {
>> -       u8 reg;
>> -       switch (dpms_mode) {
>> -       case DRM_MODE_DPMS_OFF:
>> -               reg =3D 0x07;
>> -               break;
>> -       case DRM_MODE_DPMS_STANDBY:
>> -               reg =3D 0x05;
>> -               break;
>> -       case DRM_MODE_DPMS_SUSPEND:
>> -               reg =3D 0x01;
>> -               break;
>> -       case DRM_MODE_DPMS_ON:
>> -               reg =3D 0x00;
>> -               break;
>> -       }
>> -
> As a follow-up, please add/use symbolic names for the the four states.
> Apart from the cosmetic aspect, this allows us to trivially change
> from DPMS_OFF to DPMS_SUSPEND or DPMS_STANDBY at any random point.
>=20
> As-is the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Thanks. The symbolic names are trivial to add here. I'll put them into
v3 of this patchset.

Best regards
Thomas

>=20
> Thanks
> Emil
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--sV8ZkeFwr6jHFtYPjHHpzOD8gKYbJG6JA--

--cIwSp31UCoQt7S9tZ5Z3kV9w73TYKQpVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3vVFoACgkQaA3BHVML
eiOjsggAqtj5SIRMxwpR58x/rd5BC6RNUfAJViCm8pvq3I+C3u4mAkUOE1TDTPA3
ztjhzdHRzQijcpmtI3Y1x5ryLbPaDbVmo8PFDWB/8//Tc4yLLhQZJl3zDMPWyxBy
T/h2iet2ouwGG2eCUSfuZSDpQnmurzP9uU1Uk2UT9AiCaIEHsHmhXSrTPOKXyGHx
TjZ+6yzqUP71+A6Ngw7cnTd9iw12aNRKtZ4STGzENPKfOaIfLS1AfxbBYqPTxyDC
pCWVCVlnBoJxACSdDH6J+TjoWJqN7eech3xIUetcoidyiuvr3lel1CdxSakUvzWI
tJBKWyK3hgrMIbvGisELkrH7KI+urg==
=tw7/
-----END PGP SIGNATURE-----

--cIwSp31UCoQt7S9tZ5Z3kV9w73TYKQpVB--

--===============0824184403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0824184403==--
