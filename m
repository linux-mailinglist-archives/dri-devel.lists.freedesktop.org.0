Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE11146E0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 19:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1A6F8D9;
	Thu,  5 Dec 2019 18:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19D96F8D9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 18:28:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 62EF4AD72;
 Thu,  5 Dec 2019 18:28:19 +0000 (UTC)
Subject: Re: [PATCH v3 3/4] drm/mgag200: Add vblank support
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191205160142.3588-1-tzimmermann@suse.de>
 <20191205160142.3588-4-tzimmermann@suse.de>
 <20191205172515.GA24782@ravnborg.org>
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
Message-ID: <70c025d1-4797-a33a-3acb-43f5b55230c0@suse.de>
Date: Thu, 5 Dec 2019 19:28:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191205172515.GA24782@ravnborg.org>
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
Cc: rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, ying.huang@intel.com, airlied@redhat.com,
 emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0467057301=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0467057301==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OM134vhmDHr8q8xaOg4WWAa5uDhQlw75s"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OM134vhmDHr8q8xaOg4WWAa5uDhQlw75s
Content-Type: multipart/mixed; boundary="mtMiX38jPnHZItOWcz5l2X7pzV2mK4qXj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, rong.a.chen@intel.com,
 dri-devel@lists.freedesktop.org, ying.huang@intel.com, airlied@redhat.com,
 emil.velikov@collabora.com
Message-ID: <70c025d1-4797-a33a-3acb-43f5b55230c0@suse.de>
Subject: Re: [PATCH v3 3/4] drm/mgag200: Add vblank support
References: <20191205160142.3588-1-tzimmermann@suse.de>
 <20191205160142.3588-4-tzimmermann@suse.de>
 <20191205172515.GA24782@ravnborg.org>
In-Reply-To: <20191205172515.GA24782@ravnborg.org>

--mtMiX38jPnHZItOWcz5l2X7pzV2mK4qXj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.12.19 um 18:25 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> Some nits you can address when applying, if you think they shall be
> addressed.
>=20
> 	Sam
>=20
> On Thu, Dec 05, 2019 at 05:01:41PM +0100, Thomas Zimmermann wrote:
>> There's no VBLANK interrupt on Matrox chipsets. The workaround that is=

>> being used here and in other free Matrox drivers is to program <lineco=
mp>
>> to the value of <vdisplay> + 1 and enable the VLINE interrupt. This
>> triggers an interrupt at the time when VBLANK begins.
>>
>> VLINE uses separate registers for enabling and clearing pending interr=
upts.
>> No extra syncihronization between irq handler and the rest of the driv=
er is
> s/syncihronization/synchronization/

Oh.

>=20
>> required.
>>
>>  		 ((vsyncstart & 0x100) >> 6) |
>>  		 ((vdisplay & 0x100) >> 5) |
>> -		 ((vdisplay & 0x100) >> 4) | /* linecomp */
>> +		 ((linecomp & 0x100) >> 4) |
>>  		 ((vtotal & 0x200) >> 4)|
>>  		 ((vdisplay & 0x200) >> 3) |
>>  		 ((vsyncstart & 0x200) >> 2));
>>  	WREG_CRT(9, ((vdisplay & 0x200) >> 4) |
>> -		 ((vdisplay & 0x200) >> 3));
>> +		 ((linecomp & 0x200) >> 3));
>>  	WREG_CRT(10, 0);
>>  	WREG_CRT(11, 0);
>>  	WREG_CRT(12, 0);
>> @@ -1083,7 +1093,7 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>>  	WREG_CRT(21, vdisplay & 0xFF);
>>  	WREG_CRT(22, (vtotal + 1) & 0xFF);
>>  	WREG_CRT(23, 0xc3);
>> -	WREG_CRT(24, vdisplay & 0xFF);
>> +	WREG_CRT(24, linecomp & 0xff);
> Use 0xFF like other code nearby?

The code in this file is a mixture of numbers in upper and lower case. I
used lower case here as I found if more pleasant to read. Hopefully the
other constants can be switched when the code is converted to atomic
modesetting.

>=20
>> =20
>>  	ext_vga[0] =3D 0;
>>  	ext_vga[5] =3D 0;
>> @@ -1099,7 +1109,7 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>>  		((vdisplay & 0x400) >> 8) |
>>  		((vdisplay & 0xc00) >> 7) |
>>  		((vsyncstart & 0xc00) >> 5) |
>> -		((vdisplay & 0x400) >> 3);
>> +		((linecomp & 0x400) >> 3);
>>  	if (fb->format->cpp[0] * 8 =3D=3D 24)
>>  		ext_vga[3] =3D (((1 << bppshift) * 3) - 1) | 0x80;
>>  	else
>> @@ -1411,6 +1421,34 @@ static void mga_crtc_disable(struct drm_crtc *c=
rtc)
>>  	crtc->primary->fb =3D NULL;
>>  }
>> =20
>> +static int mga_crtc_enable_vblank(struct drm_crtc *crtc)
>> +{
>> +	struct drm_device *dev =3D crtc->dev;
>> +	struct mga_device *mdev =3D dev->dev_private;
>> +	u32 iclear, ien;
>> +
>> +	iclear =3D RREG32(MGAREG_ICLEAR);
>> +	iclear |=3D MGA_VLINECLR;
>> +	WREG32(MGAREG_ICLEAR, iclear);
>> +
>> +	ien =3D RREG32(MGAREG_IEN);
>> +	ien |=3D MGA_VLINEIEN;
>> +	WREG32(MGAREG_IEN, ien);
>> +
>> +	return 0;
>> +}
>> +
>> +static void mga_crtc_disable_vblank(struct drm_crtc *crtc)
>> +{
>> +	struct drm_device *dev =3D crtc->dev;
>> +	struct mga_device *mdev =3D dev->dev_private;
>> +	u32 ien;
>> +
>> +	ien =3D RREG32(MGAREG_IEN);
>> +	ien &=3D ~(MGA_VLINEIEN);
>> +	WREG32(MGAREG_IEN, ien);
>> +}
>> +
>>  /* These provide the minimum set of functions required to handle a CR=
TC */
>>  static const struct drm_crtc_funcs mga_crtc_funcs =3D {
>>  	.cursor_set =3D mgag200_crtc_cursor_set,
>> @@ -1418,6 +1456,8 @@ static const struct drm_crtc_funcs mga_crtc_func=
s =3D {
>>  	.gamma_set =3D mga_crtc_gamma_set,
>>  	.set_config =3D drm_crtc_helper_set_config,
>>  	.destroy =3D mga_crtc_destroy,
>> +	.enable_vblank =3D mga_crtc_enable_vblank,
>> +	.disable_vblank =3D mga_crtc_disable_vblank,
>>  };
>> =20
>>  static const struct drm_crtc_helper_funcs mga_helper_funcs =3D {
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/m=
gag200/mgag200_reg.h
>> index 6c460d9a2143..44db1d8279fa 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_reg.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
>> @@ -122,6 +122,11 @@
>> =20
>>  #define MGAREG_MEMCTL           0x2e08
>> =20
>> +/* Interrupt fields */
>> +#define MGA_VLINEPEN		(0x01 << 5)
>> +#define MGA_VLINECLR		(0x01 << 5)
>> +#define MGA_VLINEIEN		(0x01 << 5)
> Use BIT(5)?
> The bitfield name could be more readable if they included the register
> name.
> Example:
> #define MGA_STATUS_VLINEPEN	BIT(5)
> #define MGA_ICLEAR_VLINECLR	BIT(5)
> #define MGA_IEN_VLINEIEN	BIT(5)

Oh, good point. I wasn't aware of this macro.

Best regards
Thomas

>=20
> 	Sam
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


--mtMiX38jPnHZItOWcz5l2X7pzV2mK4qXj--

--OM134vhmDHr8q8xaOg4WWAa5uDhQlw75s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3pTDoACgkQaA3BHVML
eiOKTAgAmf5C2x7wH3BmNFYDQ0jrtb/jbZQjRQ8EYmhCHTg45EsLa9D9Crx/IPTP
vMINUJ71j5kxWMK3zaFKPFNqr+Mtx8aOCh/nB2RUJEaOKGzkdtTrp350Fmec1bzq
8h9XiPBLNCGy9TFXLB9FlIbMUcVFCfF6pmWBKd/yHQn6b21bwdRwFq2fJhm7gbGM
rslGuvUa/mgbE6BCvj3up8Gr+cF1Zb8u4EYSQYYJJg1Eh++7/qgGck8oNSHqMoHt
v58LlBAEGtfNefjXTSra1qoNlwQD+Cau0UgdQzFsy/klRRpVBcFTcaW1UKHjoPI1
QHLzx8JmIg1lYR+EVrvz+JTt8FPT2g==
=5t4u
-----END PGP SIGNATURE-----

--OM134vhmDHr8q8xaOg4WWAa5uDhQlw75s--

--===============0467057301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0467057301==--
