Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F11BF2BE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 10:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820006EB6E;
	Thu, 30 Apr 2020 08:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2C16EB6E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 08:27:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15D9DAE5E;
 Thu, 30 Apr 2020 08:27:03 +0000 (UTC)
Subject: Re: [PATCH 07/17] drm/mgag200: Move mode-setting code into separate
 helper function
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-8-tzimmermann@suse.de>
 <20200429182433.GG31071@ravnborg.org>
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
Message-ID: <95218b8c-03c1-cff4-34be-507acb9ca91c@suse.de>
Date: Thu, 30 Apr 2020 10:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200429182433.GG31071@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1238167832=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1238167832==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ab85xA8ok01oQW57sZDQJPKz6LHm31Hdn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ab85xA8ok01oQW57sZDQJPKz6LHm31Hdn
Content-Type: multipart/mixed; boundary="A4faY4sbv0RksEEHk5EYnUudBu8XhBtZz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 noralf@tronnes.org, john.p.donnelly@oracle.com,
 dri-devel@lists.freedesktop.org
Message-ID: <95218b8c-03c1-cff4-34be-507acb9ca91c@suse.de>
Subject: Re: [PATCH 07/17] drm/mgag200: Move mode-setting code into separate
 helper function
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-8-tzimmermann@suse.de>
 <20200429182433.GG31071@ravnborg.org>
In-Reply-To: <20200429182433.GG31071@ravnborg.org>

--A4faY4sbv0RksEEHk5EYnUudBu8XhBtZz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.04.20 um 20:24 schrieb Sam Ravnborg:
> On Wed, Apr 29, 2020 at 04:32:28PM +0200, Thomas Zimmermann wrote:
>> The mode-setting code is now located in mgag200_set_mode_regs(), sans
>> a few flags that will be moved in a later patch for clarity.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Looked like trivial code movements, did not look carefully.

It's often not that trivial.

The complicated thing about these functions is to not override bits that
have been set by another functions already. For example, MISC has a
number of bits that control PLL, mode, and hsync/vsync. Each is set in a
different place. I've been careful to read-back MISC each time and
update each setting individually.

Best regards
Thomas

> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 140 ++++++++++++++----------=
-
>>  1 file changed, 78 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 12df809d64f7c..749ba6e420ac7 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -911,6 +911,79 @@ static int mga_crtc_mode_set_base(struct drm_crtc=
 *crtc, int x, int y,
>>  	return mga_crtc_do_set_base(mdev, fb, old_fb);
>>  }
>> =20
>> +static void mgag200_set_mode_regs(struct mga_device *mdev,
>> +				  const struct drm_display_mode *mode)
>> +{
>> +	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
>> +	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
>> +	uint8_t misc =3D 0;
>> +	uint8_t crtcext1, crtcext2, crtcext5;
>> +
>> +	hdisplay =3D mode->hdisplay / 8 - 1;
>> +	hsyncstart =3D mode->hsync_start / 8 - 1;
>> +	hsyncend =3D mode->hsync_end / 8 - 1;
>> +	htotal =3D mode->htotal / 8 - 1;
>> +
>> +	/* Work around hardware quirk */
>> +	if ((htotal & 0x07) =3D=3D 0x06 || (htotal & 0x07) =3D=3D 0x04)
>> +		htotal++;
>> +
>> +	vdisplay =3D mode->vdisplay - 1;
>> +	vsyncstart =3D mode->vsync_start - 1;
>> +	vsyncend =3D mode->vsync_end - 1;
>> +	vtotal =3D mode->vtotal - 2;
>> +
>> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> +		misc |=3D 0x40;
>> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> +		misc |=3D 0x80;
>> +
>> +	crtcext1 =3D (((htotal - 4) & 0x100) >> 8) |
>> +		   ((hdisplay & 0x100) >> 7) |
>> +		   ((hsyncstart & 0x100) >> 6) |
>> +		    (htotal & 0x40);
>> +	if (mdev->type =3D=3D G200_WB || mdev->type =3D=3D G200_EW3)
>> +		crtcext1 |=3D BIT(7) | /* vrsten */
>> +			    BIT(3); /* hrsten */
>> +
>> +	crtcext2 =3D ((vtotal & 0xc00) >> 10) |
>> +		   ((vdisplay & 0x400) >> 8) |
>> +		   ((vdisplay & 0xc00) >> 7) |
>> +		   ((vsyncstart & 0xc00) >> 5) |
>> +		   ((vdisplay & 0x400) >> 3);
>> +	crtcext5 =3D 0x00;
>> +
>> +	WREG_CRT(0, htotal - 4);
>> +	WREG_CRT(1, hdisplay);
>> +	WREG_CRT(2, hdisplay);
>> +	WREG_CRT(3, (htotal & 0x1F) | 0x80);
>> +	WREG_CRT(4, hsyncstart);
>> +	WREG_CRT(5, ((htotal & 0x20) << 2) | (hsyncend & 0x1F));
>> +	WREG_CRT(6, vtotal & 0xFF);
>> +	WREG_CRT(7, ((vtotal & 0x100) >> 8) |
>> +		 ((vdisplay & 0x100) >> 7) |
>> +		 ((vsyncstart & 0x100) >> 6) |
>> +		 ((vdisplay & 0x100) >> 5) |
>> +		 ((vdisplay & 0x100) >> 4) | /* linecomp */
>> +		 ((vtotal & 0x200) >> 4) |
>> +		 ((vdisplay & 0x200) >> 3) |
>> +		 ((vsyncstart & 0x200) >> 2));
>> +	WREG_CRT(9, ((vdisplay & 0x200) >> 4) |
>> +		 ((vdisplay & 0x200) >> 3));
>> +	WREG_CRT(16, vsyncstart & 0xFF);
>> +	WREG_CRT(17, (vsyncend & 0x0F) | 0x20);
>> +	WREG_CRT(18, vdisplay & 0xFF);
>> +	WREG_CRT(20, 0);
>> +	WREG_CRT(21, vdisplay & 0xFF);
>> +	WREG_CRT(22, (vtotal + 1) & 0xFF);
>> +	WREG_CRT(23, 0xc3);
>> +	WREG_CRT(24, vdisplay & 0xFF);
>> +
>> +	WREG_ECRT(0x01, crtcext1);
>> +	WREG_ECRT(0x02, crtcext2);
>> +	WREG_ECRT(0x05, crtcext5);
>> +}
>> +
>>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
>>  				struct drm_display_mode *mode,
>>  				struct drm_display_mode *adjusted_mode,
>> @@ -919,8 +992,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc=
,
>>  	struct drm_device *dev =3D crtc->dev;
>>  	struct mga_device *mdev =3D dev->dev_private;
>>  	const struct drm_framebuffer *fb =3D crtc->primary->fb;
>> -	int hdisplay, hsyncstart, hsyncend, htotal;
>> -	int vdisplay, vsyncstart, vsyncend, vtotal;
>>  	int pitch;
>>  	int option =3D 0, option2 =3D 0;
>>  	int i;
>> @@ -999,12 +1070,6 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>>  		break;
>>  	}
>> =20
>> -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> -		misc |=3D 0x40;
>> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> -		misc |=3D 0x80;
>> -
>> -
>>  	for (i =3D 0; i < sizeof(dacvalue); i++) {
>>  		if ((i <=3D 0x17) ||
>>  		    (i =3D=3D 0x1b) ||
>> @@ -1044,20 +1109,6 @@ static int mga_crtc_mode_set(struct drm_crtc *c=
rtc,
>>  	else
>>  		pitch =3D pitch >> (4 - bppshift);
>> =20
>> -	hdisplay =3D mode->hdisplay / 8 - 1;
>> -	hsyncstart =3D mode->hsync_start / 8 - 1;
>> -	hsyncend =3D mode->hsync_end / 8 - 1;
>> -	htotal =3D mode->htotal / 8 - 1;
>> -
>> -	/* Work around hardware quirk */
>> -	if ((htotal & 0x07) =3D=3D 0x06 || (htotal & 0x07) =3D=3D 0x04)
>> -		htotal++;
>> -
>> -	vdisplay =3D mode->vdisplay - 1;
>> -	vsyncstart =3D mode->vsync_start - 1;
>> -	vsyncend =3D mode->vsync_end - 1;
>> -	vtotal =3D mode->vtotal - 2;
>> -
>>  	WREG_GFX(0, 0);
>>  	WREG_GFX(1, 0);
>>  	WREG_GFX(2, 0);
>> @@ -1068,61 +1119,26 @@ static int mga_crtc_mode_set(struct drm_crtc *=
crtc,
>>  	WREG_GFX(7, 0xf);
>>  	WREG_GFX(8, 0xf);
>> =20
>> -	WREG_CRT(0, htotal - 4);
>> -	WREG_CRT(1, hdisplay);
>> -	WREG_CRT(2, hdisplay);
>> -	WREG_CRT(3, (htotal & 0x1F) | 0x80);
>> -	WREG_CRT(4, hsyncstart);
>> -	WREG_CRT(5, ((htotal & 0x20) << 2) | (hsyncend & 0x1F));
>> -	WREG_CRT(6, vtotal & 0xFF);
>> -	WREG_CRT(7, ((vtotal & 0x100) >> 8) |
>> -		 ((vdisplay & 0x100) >> 7) |
>> -		 ((vsyncstart & 0x100) >> 6) |
>> -		 ((vdisplay & 0x100) >> 5) |
>> -		 ((vdisplay & 0x100) >> 4) | /* linecomp */
>> -		 ((vtotal & 0x200) >> 4)|
>> -		 ((vdisplay & 0x200) >> 3) |
>> -		 ((vsyncstart & 0x200) >> 2));
>> -	WREG_CRT(9, ((vdisplay & 0x200) >> 4) |
>> -		 ((vdisplay & 0x200) >> 3));
>>  	WREG_CRT(10, 0);
>>  	WREG_CRT(11, 0);
>>  	WREG_CRT(12, 0);
>>  	WREG_CRT(13, 0);
>>  	WREG_CRT(14, 0);
>>  	WREG_CRT(15, 0);
>> -	WREG_CRT(16, vsyncstart & 0xFF);
>> -	WREG_CRT(17, (vsyncend & 0x0F) | 0x20);
>> -	WREG_CRT(18, vdisplay & 0xFF);
>>  	WREG_CRT(19, pitch & 0xFF);
>> -	WREG_CRT(20, 0);
>> -	WREG_CRT(21, vdisplay & 0xFF);
>> -	WREG_CRT(22, (vtotal + 1) & 0xFF);
>> -	WREG_CRT(23, 0xc3);
>> -	WREG_CRT(24, vdisplay & 0xFF);
>> +
>> +	mgag200_set_mode_regs(mdev, mode);
>> =20
>>  	ext_vga[0] =3D 0;
>> -	ext_vga[5] =3D 0;
>> =20
>>  	/* TODO interlace */
>> =20
>>  	ext_vga[0] |=3D (pitch & 0x300) >> 4;
>> -	ext_vga[1] =3D (((htotal - 4) & 0x100) >> 8) |
>> -		((hdisplay & 0x100) >> 7) |
>> -		((hsyncstart & 0x100) >> 6) |
>> -		(htotal & 0x40);
>> -	ext_vga[2] =3D ((vtotal & 0xc00) >> 10) |
>> -		((vdisplay & 0x400) >> 8) |
>> -		((vdisplay & 0xc00) >> 7) |
>> -		((vsyncstart & 0xc00) >> 5) |
>> -		((vdisplay & 0x400) >> 3);
>>  	if (fb->format->cpp[0] * 8 =3D=3D 24)
>>  		ext_vga[3] =3D (((1 << bppshift) * 3) - 1) | 0x80;
>>  	else
>>  		ext_vga[3] =3D ((1 << bppshift) - 1) | 0x80;
>>  	ext_vga[4] =3D 0;
>> -	if (mdev->type =3D=3D G200_WB || mdev->type =3D=3D G200_EW3)
>> -		ext_vga[1] |=3D 0x88;
>> =20
>>  	/* Set pixel clocks */
>>  	misc =3D 0x2d;
>> @@ -1130,9 +1146,9 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>> =20
>>  	mga_crtc_set_plls(mdev, mode->clock);
>> =20
>> -	for (i =3D 0; i < 6; i++) {
>> -		WREG_ECRT(i, ext_vga[i]);
>> -	}
>> +	WREG_ECRT(0, ext_vga[0]);
>> +	WREG_ECRT(3, ext_vga[3]);
>> +	WREG_ECRT(4, ext_vga[4]);
>> =20
>>  	if (mdev->type =3D=3D G200_ER)
>>  		WREG_ECRT(0x24, 0x5);
>> --=20
>> 2.26.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--A4faY4sbv0RksEEHk5EYnUudBu8XhBtZz--

--ab85xA8ok01oQW57sZDQJPKz6LHm31Hdn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6qi9YACgkQaA3BHVML
eiOJtQgAqrD7KqQ82R6CQ8ZyHwh24UzsckewdWGocOOgs9HCIf2qsn3R1zPmT4Jq
W6wnHrHJXBAdSpEr5A9TowUYqh/K+Tv9glLS8zNbxwRD9AVs+0lMSxQihvnc56yv
xJuQZqrF53H6kmj6JXn+Lf8g6Fzsz3JkzNU7r4+EDey8oX2AJcdWDnkDkPlxJA+E
i69zqro+OSW9oQussDUT9JSvsqCxLjY0Jyk3pzSo5KGLjiNG1UbtQiu/+L9ZIwE1
8M0C1+Qk/v7Jfq5i9sOdBYeq0HaWNt5I3qEHxVyLMaXa7kNSKnqvB/3sHz+L3kAN
oszghOYM2Aqh/g5Ucz9gv/8w2N6I6w==
=NuRU
-----END PGP SIGNATURE-----

--ab85xA8ok01oQW57sZDQJPKz6LHm31Hdn--

--===============1238167832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1238167832==--
