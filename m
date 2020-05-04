Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F40DD1C3AF8
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 15:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429A36E3EE;
	Mon,  4 May 2020 13:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0C96E3EE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 13:10:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29335AC5F;
 Mon,  4 May 2020 13:10:44 +0000 (UTC)
Subject: Re: [PATCH 10/17] drm/mgag200: Set pitch in a separate helper function
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-11-tzimmermann@suse.de>
 <20200503154209.GC23105@ravnborg.org>
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
Message-ID: <5938c569-e67d-881f-cd76-d050e4ae6d9a@suse.de>
Date: Mon, 4 May 2020 15:10:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200503154209.GC23105@ravnborg.org>
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============1052931956=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1052931956==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TGbtMKm3rKlLF7UrMShld4rUFend3acBc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TGbtMKm3rKlLF7UrMShld4rUFend3acBc
Content-Type: multipart/mixed; boundary="TaxmWN2hD7T5rx77bneq7a9nFUjq9rNpl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 noralf@tronnes.org, john.p.donnelly@oracle.com,
 dri-devel@lists.freedesktop.org
Message-ID: <5938c569-e67d-881f-cd76-d050e4ae6d9a@suse.de>
Subject: Re: [PATCH 10/17] drm/mgag200: Set pitch in a separate helper
 function
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-11-tzimmermann@suse.de>
 <20200503154209.GC23105@ravnborg.org>
In-Reply-To: <20200503154209.GC23105@ravnborg.org>

--TaxmWN2hD7T5rx77bneq7a9nFUjq9rNpl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.05.20 um 17:42 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Wed, Apr 29, 2020 at 04:32:31PM +0200, Thomas Zimmermann wrote:
>> The framebuffer's pitch is now set in mgag200_set_offset().
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I failed to follow this code.

Is it because of the line-offset calculation? MGAs want offsets in
multiples of pixels, not bytes, and that factor depends on the value of
cpp. I guess putting the calculation into a separate function will help
with readability.

>=20
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 41 +++++++++++++++++--------=
-
>>  1 file changed, 27 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 92dee31f16c42..eb83e471d72fc 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -1003,6 +1003,32 @@ static void mgag200_set_mode_regs(struct mga_de=
vice *mdev,
>>  	mga_crtc_set_plls(mdev, mode->clock);
>>  }
>> =20
>> +static void mgag200_set_offset(struct mga_device *mdev,
>> +			       const struct drm_framebuffer *fb)
>> +{
>> +	unsigned int offset;
>> +	uint8_t crtc13, crtcext0;
>> +	u8 bppshift;
>> +
>> +	bppshift =3D mdev->bpp_shifts[fb->format->cpp[0] - 1];
> Hmm, use of cpp is deprecated. But is continue to be used all over.

I try to move code without modifying it too much. Replacing cpp with
some newer interface would obfuscate the moving to some extend. It's
always a balancing act.

>=20
>> +
>> +	offset =3D fb->pitches[0] / fb->format->cpp[0];
>> +	if (fb->format->cpp[0] * 8 =3D=3D 24)
>> +		offset =3D (offset * 3) >> (4 - bppshift);
>> +	else
>> +		offset =3D offset >> (4 - bppshift);
>> +
>> +	RREG_ECRT(0, crtcext0);
>> +
>> +	crtc13 =3D offset & 0xff;
>> +
>> +	crtcext0 &=3D ~GENMASK(5, 4);
>> +	crtcext0 |=3D (offset & GENMASK(9, 8)) >> 4;
> Lot's of hardcoded numbers.
> Could the reg file include these so you had more readable defined names=
?

Sure.

Best regards
Thomas

>=20
>> +
>> +	WREG_CRT(0x13, crtc13);
>> +	WREG_ECRT(0x00, crtcext0);
>> +}
>> +
>>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
>>  				struct drm_display_mode *mode,
>>  				struct drm_display_mode *adjusted_mode,
>> @@ -1011,7 +1037,6 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>>  	struct drm_device *dev =3D crtc->dev;
>>  	struct mga_device *mdev =3D dev->dev_private;
>>  	const struct drm_framebuffer *fb =3D crtc->primary->fb;
>> -	int pitch;
>>  	int option =3D 0, option2 =3D 0;
>>  	int i;
>>  	unsigned char misc =3D 0;
>> @@ -1122,12 +1147,6 @@ static int mga_crtc_mode_set(struct drm_crtc *c=
rtc,
>>  	WREG_SEQ(3, 0);
>>  	WREG_SEQ(4, 0xe);
>> =20
>> -	pitch =3D fb->pitches[0] / fb->format->cpp[0];
>> -	if (fb->format->cpp[0] * 8 =3D=3D 24)
>> -		pitch =3D (pitch * 3) >> (4 - bppshift);
>> -	else
>> -		pitch =3D pitch >> (4 - bppshift);
>> -
>>  	WREG_GFX(0, 0);
>>  	WREG_GFX(1, 0);
>>  	WREG_GFX(2, 0);
>> @@ -1144,20 +1163,15 @@ static int mga_crtc_mode_set(struct drm_crtc *=
crtc,
>>  	WREG_CRT(13, 0);
>>  	WREG_CRT(14, 0);
>>  	WREG_CRT(15, 0);
>> -	WREG_CRT(19, pitch & 0xFF);
>> -
>> -	ext_vga[0] =3D 0;
>> =20
>>  	/* TODO interlace */
>> =20
>> -	ext_vga[0] |=3D (pitch & 0x300) >> 4;
>>  	if (fb->format->cpp[0] * 8 =3D=3D 24)
>>  		ext_vga[3] =3D (((1 << bppshift) * 3) - 1) | 0x80;
>>  	else
>>  		ext_vga[3] =3D ((1 << bppshift) - 1) | 0x80;
>>  	ext_vga[4] =3D 0;
>> =20
>> -	WREG_ECRT(0, ext_vga[0]);
>>  	WREG_ECRT(3, ext_vga[3]);
>>  	WREG_ECRT(4, ext_vga[4]);
>> =20
>> @@ -1171,8 +1185,6 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>>  		WREG_ECRT(6, 0);
>>  	}
>> =20
>> -	WREG_ECRT(0, ext_vga[0]);
>> -
>>  	misc =3D RREG8(MGA_MISC_IN);
>>  	misc |=3D MGAREG_MISC_IOADSEL |
>>  		MGAREG_MISC_RAMMAPEN |
>> @@ -1180,6 +1192,7 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>>  	WREG8(MGA_MISC_OUT, misc);
>> =20
>>  	mga_crtc_do_set_base(mdev, fb, old_fb);
>> +	mgag200_set_offset(mdev, fb);
>> =20
>>  	mgag200_set_mode_regs(mdev, mode);
>=20
> 	Sam
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--TaxmWN2hD7T5rx77bneq7a9nFUjq9rNpl--

--TGbtMKm3rKlLF7UrMShld4rUFend3acBc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6wFE4ACgkQaA3BHVML
eiNtEwgAv/gFjXJUVK7rsjLKCE2Cr6vzYHVqOSTbjPEjp73y8WeyQalDggGXO8MM
5XDoaPCHZDlqe4YIDfG1zwoO/Z3T7Ba3apvjeOFO2Xcu7fXa65aizS0yTz4XqQPZ
nM6cNso8X6e5tCxFkMz1fHmic6D1S6MCu3pI3/RVBRk5K/FQ4pZeua5UFlTK61Tc
1H0QxDAEasyAKO9yWpYKf9D7P5Msj7cgNCTyXAWodYy2K4XidWWbKQLvFVnFqMVt
MD0NyzH0FutKNOT/mwm+nWsj4yO67WtOlZQ+jzGuCaeoHF79PbD/w/dUrX/OA6+x
aaiXmSQtmecBWZ4sgqm0aRI8qdbcFQ==
=SxCJ
-----END PGP SIGNATURE-----

--TGbtMKm3rKlLF7UrMShld4rUFend3acBc--

--===============1052931956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1052931956==--
