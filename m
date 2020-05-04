Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F061C3AC5
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 15:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA1D6E3E1;
	Mon,  4 May 2020 13:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C372D6E3E1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 13:03:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 19662AF0F;
 Mon,  4 May 2020 13:03:10 +0000 (UTC)
Subject: Re: [PATCH 08/17] drm/mgag200: Split MISC register update into PLL
 selection, SYNC and I/O
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-9-tzimmermann@suse.de>
 <20200503153432.GA23105@ravnborg.org>
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
Message-ID: <3e1b1164-7dae-91a5-6973-1eec17d02f6d@suse.de>
Date: Mon, 4 May 2020 15:03:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200503153432.GA23105@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1182253729=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1182253729==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vJ8ZwtPxdgkWuvGeo2sEr9VATf6io78Cy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vJ8ZwtPxdgkWuvGeo2sEr9VATf6io78Cy
Content-Type: multipart/mixed; boundary="IJ1oEUMoZYq2CeK0bej38LeCISUxmsdto";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 noralf@tronnes.org, john.p.donnelly@oracle.com,
 dri-devel@lists.freedesktop.org
Message-ID: <3e1b1164-7dae-91a5-6973-1eec17d02f6d@suse.de>
Subject: Re: [PATCH 08/17] drm/mgag200: Split MISC register update into PLL
 selection, SYNC and I/O
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-9-tzimmermann@suse.de>
 <20200503153432.GA23105@ravnborg.org>
In-Reply-To: <20200503153432.GA23105@ravnborg.org>

--IJ1oEUMoZYq2CeK0bej38LeCISUxmsdto
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.05.20 um 17:34 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Wed, Apr 29, 2020 at 04:32:29PM +0200, Thomas Zimmermann wrote:
>> Set different fields in MISC in their rsp location in the code. This
>> patch also fixes a bug in the original code where the mode's SYNC flag=
s
>> were never written into the MISC register.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 37 ++++++++++++++++++-------=
-
>>  drivers/gpu/drm/mgag200/mgag200_reg.h  |  5 +++-
>>  2 files changed, 30 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 749ba6e420ac7..b5bb02e9f05d6 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -704,6 +704,8 @@ static int mga_g200er_set_plls(struct mga_device *=
mdev, long clock)
>> =20
>>  static int mga_crtc_set_plls(struct mga_device *mdev, long clock)
>>  {
>> +	uint8_t misc;
>=20
> General comment.
> uint8_t and friends are for uapi stuff.
> kernel internal prefer u8 and friends.

Ok.

>=20
> Would be good to clean this up in the drivire, maybe as a follow-up
> patch after is becomes atomic.
>=20
>=20
>> +
>>  	switch(mdev->type) {
>>  	case G200_SE_A:
>>  	case G200_SE_B:
>> @@ -724,6 +726,12 @@ static int mga_crtc_set_plls(struct mga_device *m=
dev, long clock)
>>  		return mga_g200er_set_plls(mdev, clock);
>>  		break;
>>  	}
>> +
>> +	misc =3D RREG8(MGA_MISC_IN);
>> +	misc &=3D ~GENMASK(3, 2);
> The code would be easier to read if we had a=20
> #define MGAREG_MISC_CLK_SEL_MASK	GENMASK(3, 2)
>=20
> So the above became:
> 	misc &=3D ~MGAREG_MISC_CLK_SEL_MASK;
>=20
> Then it is more clear that the CLK_SEL bits are clared and then
> MGA_MSK is set.

Sure.

>=20
>> +	misc |=3D MGAREG_MISC_CLK_SEL_MGA_MSK;
>> +	WREG8(MGA_MISC_OUT, misc);
>> +
>>  	return 0;
>>  }
>> =20
>> @@ -916,7 +924,7 @@ static void mgag200_set_mode_regs(struct mga_devic=
e *mdev,
>>  {
>>  	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
>>  	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
>> -	uint8_t misc =3D 0;
>> +	uint8_t misc;
>>  	uint8_t crtcext1, crtcext2, crtcext5;
>> =20
>>  	hdisplay =3D mode->hdisplay / 8 - 1;
>> @@ -933,10 +941,17 @@ static void mgag200_set_mode_regs(struct mga_dev=
ice *mdev,
>>  	vsyncend =3D mode->vsync_end - 1;
>>  	vtotal =3D mode->vtotal - 2;
>> =20
>> +	misc =3D RREG8(MGA_MISC_IN);
>> +
>>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> -		misc |=3D 0x40;
>> +		misc |=3D MGAREG_MISC_HSYNCPOL;
>> +	else
>> +		misc &=3D ~MGAREG_MISC_HSYNCPOL;
>> +
> So the code just assumes DRM_MODE_FLAG_PHSYNC if
> DRM_MODE_FLAG_NHSYNC is not set.
> I think that is fine, but it also indicate how hoorible the
> flags definitions are in mode->flags

If polarity is not negative (i.e., bit set), it is positive (i.e., bit
cleared). What else could you set in MISC?

Having multiple flags in mode->flags that signal the same state is
somewhat problematic. I expect that the consistency of a mode's flags is
validated somewhere within the core.

>=20
>=20
>>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> -		misc |=3D 0x80;
>> +		misc |=3D MGAREG_MISC_VSYNCPOL;
>> +	else
>> +		misc &=3D ~MGAREG_MISC_VSYNCPOL;
> And this code was touched in previous patch, but I gess it is better
> to update it here.
>=20
>> =20
>>  	crtcext1 =3D (((htotal - 4) & 0x100) >> 8) |
>>  		   ((hdisplay & 0x100) >> 7) |
>> @@ -982,6 +997,10 @@ static void mgag200_set_mode_regs(struct mga_devi=
ce *mdev,
>>  	WREG_ECRT(0x01, crtcext1);
>>  	WREG_ECRT(0x02, crtcext2);
>>  	WREG_ECRT(0x05, crtcext5);
>> +
>> +	WREG8(MGA_MISC_OUT, misc);
>> +
>> +	mga_crtc_set_plls(mdev, mode->clock);
>>  }
>> =20
>>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
>> @@ -1140,12 +1159,6 @@ static int mga_crtc_mode_set(struct drm_crtc *c=
rtc,
>>  		ext_vga[3] =3D ((1 << bppshift) - 1) | 0x80;
>>  	ext_vga[4] =3D 0;
>> =20
>> -	/* Set pixel clocks */
>> -	misc =3D 0x2d;
>> -	WREG8(MGA_MISC_OUT, misc);
>> -
>> -	mga_crtc_set_plls(mdev, mode->clock);
>> -
>>  	WREG_ECRT(0, ext_vga[0]);
>>  	WREG_ECRT(3, ext_vga[3]);
>>  	WREG_ECRT(4, ext_vga[4]);
>> @@ -1161,9 +1174,11 @@ static int mga_crtc_mode_set(struct drm_crtc *c=
rtc,
>>  	}
>> =20
>>  	WREG_ECRT(0, ext_vga[0]);
>> -	/* Enable mga pixel clock */
>> -	misc =3D 0x2d;
>> =20
>> +	misc =3D RREG8(MGA_MISC_IN);
>> +	misc |=3D MGAREG_MISC_IOADSEL |
>> +		MGAREG_MISC_RAMMAPEN |
>> +		MGAREG_MISC_HIGH_PG_SEL;
>>  	WREG8(MGA_MISC_OUT, misc);
>=20
> I am left puzzeled why there is several writes to MGA_MISC_OUT.
> The driver needs to read back and then write again.
>=20
> Would it be simpler to have one function that only took care of
> misc register update?

I'm not quite sure what you mean. MISC contains all kinds of unrelated
state. In the final atomic code, different state is set in different
places. It's simple to have a function read-modify-write the content of
MISC for the bits that it cares about. With multiple functions, that
leads to some duplicated reads and write, but the code as a whole is simp=
le.

Best regards
Thomas

>=20
>> =20
>>  	mga_crtc_do_set_base(mdev, fb, old_fb);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/m=
gag200/mgag200_reg.h
>> index c096a9d6bcbc1..89e12c55153cf 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_reg.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
>> @@ -16,10 +16,11 @@
>>   *		MGA1064SG Mystique register file
>>   */
>> =20
>> -
>>  #ifndef _MGA_REG_H_
>>  #define _MGA_REG_H_
>> =20
>> +#include <linux/bits.h>
>> +
>>  #define	MGAREG_DWGCTL		0x1c00
>>  #define	MGAREG_MACCESS		0x1c04
>>  /* the following is a mystique only register */
>> @@ -227,6 +228,8 @@
>>  #define MGAREG_MISC_CLK_SEL_MGA_MSK	(0x3 << 2)
>>  #define MGAREG_MISC_VIDEO_DIS	(0x1 << 4)
>>  #define MGAREG_MISC_HIGH_PG_SEL	(0x1 << 5)
>> +#define MGAREG_MISC_HSYNCPOL		BIT(6)
>> +#define MGAREG_MISC_VSYNCPOL		BIT(7)
> I like BIT(), but mixing (1 << N) and BIT() does not look nice.
> Oh, and do not get me started on GENMASK() :-)
>=20
> 	Sam
>> =20
>>  /* MMIO VGA registers */
>>  #define MGAREG_SEQ_INDEX	0x1fc4
>> --=20
>> 2.26.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IJ1oEUMoZYq2CeK0bej38LeCISUxmsdto--

--vJ8ZwtPxdgkWuvGeo2sEr9VATf6io78Cy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6wEogACgkQaA3BHVML
eiOJZQgAul15rJR/v0H/Nrfp3RTm5KWV7JcdQHgYgzWjmCyrRBiZHDxnkRFPkq2b
lAPkAwRrku44MVQ6Od5qeahxWR2o9DiUFQYiO07RXq7jdwdSwFU9b69TRcd+3FLl
ULGhHbYvVbwnz8ADusUpYh5zrLLeRrFok5A2YQvzAXeJL2ucSoLfPuQmCw4PbIBC
GY7d1md5INWuh2f7wN2PTGgSTBwIxoX/WGjiJb48s27U07cK5fTC5SB1Qjxq5L86
sJ2n42pYDeBpYRHsRbV188O8ty/yHp2MQ8o3jVfi6t3zj0xeVc0zDjcUqBEVG3DR
bPg3PXxc5pBZB6ahURBsUC8AbNnhAg==
=lt9i
-----END PGP SIGNATURE-----

--vJ8ZwtPxdgkWuvGeo2sEr9VATf6io78Cy--

--===============1182253729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1182253729==--
