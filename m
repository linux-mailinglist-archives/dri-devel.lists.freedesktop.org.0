Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99691C3AFD
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 15:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B04E89C37;
	Mon,  4 May 2020 13:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C16089C37
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 13:11:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BDBABACC3;
 Mon,  4 May 2020 13:11:52 +0000 (UTC)
Subject: Re: [PATCH 12/17] drm/mgag200: Move TAGFIFO reset into separate
 function
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-13-tzimmermann@suse.de>
 <20200503162529.GD23105@ravnborg.org>
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
Message-ID: <0aa60bf9-2833-4eb7-89cf-90a796d6f0b6@suse.de>
Date: Mon, 4 May 2020 15:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200503162529.GD23105@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============0391652445=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0391652445==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KwAiacO0WF6zeEiaaUhanLhvKWLxCeAoq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KwAiacO0WF6zeEiaaUhanLhvKWLxCeAoq
Content-Type: multipart/mixed; boundary="j0L9zDMCUXgXGWgRVNnPDQ6C3jMWSJFAs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 noralf@tronnes.org, john.p.donnelly@oracle.com,
 dri-devel@lists.freedesktop.org
Message-ID: <0aa60bf9-2833-4eb7-89cf-90a796d6f0b6@suse.de>
Subject: Re: [PATCH 12/17] drm/mgag200: Move TAGFIFO reset into separate
 function
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-13-tzimmermann@suse.de>
 <20200503162529.GD23105@ravnborg.org>
In-Reply-To: <20200503162529.GD23105@ravnborg.org>

--j0L9zDMCUXgXGWgRVNnPDQ6C3jMWSJFAs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.05.20 um 18:25 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> One nit about a bit name below.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> On Wed, Apr 29, 2020 at 04:32:33PM +0200, Thomas Zimmermann wrote:
>> 5
>>
>> The TAGFIFO state is now reset in mgag200_g200er_reset_tagfifo().
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  6 ++++
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 45 +++++++++++++++++--------=
-
>>  2 files changed, 35 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/m=
gag200/mgag200_drv.h
>> index 9b957d9fc7e04..b10da90e0f35a 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -49,6 +49,12 @@
>>  		WREG8(ATTR_DATA, v);				\
>>  	} while (0)						\
>> =20
>> +#define RREG_SEQ(reg, v)					\
>> +	do {							\
>> +		WREG8(MGAREG_SEQ_INDEX, reg);			\
>> +		v =3D RREG8(MGAREG_SEQ_DATA);			\
>> +	} while (0)						\
>> +
>>  #define WREG_SEQ(reg, v)					\
>>  	do {							\
>>  		WREG8(MGAREG_SEQ_INDEX, reg);			\
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 73f7135cbb3d8..6b88c306ff4d7 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -1091,6 +1091,33 @@ static void mgag200_set_format_regs(struct mga_=
device *mdev,
>>  	WREG_ECRT(3, crtcext3);
>>  }
>> =20
>> +static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
>> +{
>> +	static uint32_t RESET_FLAG =3D 0x00200000; /* undocumented magic val=
ue */
>> +	u8 seq1;
>> +	u32 memctl;
>> +
>> +	/* screen off */
>> +	RREG_SEQ(0x01, seq1);
>> +	seq1 |=3D 0x20;
> This looks like this:
> #define        M_SEQ1_SCROFF            0x20
>=20
>=20
>> +	WREG_SEQ(0x01, seq1);
>> +
>> +	memctl =3D RREG32(MGAREG_MEMCTL);
>> +
>> +	memctl |=3D RESET_FLAG;
>> +	WREG32(MGAREG_MEMCTL, memctl);
>> +
>> +	udelay(1000);
>> +
>> +	memctl &=3D ~RESET_FLAG;
>> +	WREG32(MGAREG_MEMCTL, memctl);
>> +
>> +	/* screen on */
>> +	RREG_SEQ(0x01, seq1);
>> +	seq1 &=3D ~0x20;
>> +	WREG_SEQ(0x01, seq1);
> Here seq1 is read again, the old code used the old value.
> I think new code is better.

You mean 'the old code was better,' right?

Best regards
Thomas

>=20
>> +}
>> +
>>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
>>  				struct drm_display_mode *mode,
>>  				struct drm_display_mode *adjusted_mode,
>> @@ -1225,22 +1252,8 @@ static int mga_crtc_mode_set(struct drm_crtc *c=
rtc,
>> =20
>>  	mgag200_set_mode_regs(mdev, mode);
>> =20
>> -	/* reset tagfifo */
>> -	if (mdev->type =3D=3D G200_ER) {
>> -		u32 mem_ctl =3D RREG32(MGAREG_MEMCTL);
>> -		u8 seq1;
>> -
>> -		/* screen off */
>> -		WREG8(MGAREG_SEQ_INDEX, 0x01);
>> -		seq1 =3D RREG8(MGAREG_SEQ_DATA) | 0x20;
>> -		WREG8(MGAREG_SEQ_DATA, seq1);
>> -
>> -		WREG32(MGAREG_MEMCTL, mem_ctl | 0x00200000);
>> -		udelay(1000);
>> -		WREG32(MGAREG_MEMCTL, mem_ctl & ~0x00200000);
>> -
>> -		WREG8(MGAREG_SEQ_DATA, seq1 & ~0x20);
>> -	}
>> +	if (mdev->type =3D=3D G200_ER)
>> +		mgag200_g200er_reset_tagfifo(mdev);
>> =20
>> =20
>>  	if (IS_G200_SE(mdev)) {
>> --=20
>> 2.26.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-dev

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--j0L9zDMCUXgXGWgRVNnPDQ6C3jMWSJFAs--

--KwAiacO0WF6zeEiaaUhanLhvKWLxCeAoq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6wFJYACgkQaA3BHVML
eiM1hAf9Glsa7vOdrn/tIb9gXllrZXnsO5WTsAAWPLgFNxIvuPhRNOz6Dk4ARFmQ
z8PxL/vp02ljhr4WfBiox/oV1emWrFtjYLVe74oa1IjSu/QCT2B3BazCrKxaVA7O
nXMbkD3yIVOJDg1YJNQLG8w8bFbTHf8Ryj43PhQUK8/3YPd3b50aZAEro0INZjTJ
ZkEJmZvMgwCSTwH/DJcD7DocCFl8mbdhIyXsIEtNJpRJBPLM8IlWSNnXP8MS+qSd
BkSlVW19uFTjhMa/zLwkDdt6CWZJ22Gbd+EGW2/G+5uRMJSHvMgptx9VDk8IcPvW
8tlNQV1RDS3aX1CljiJO6y4l1GOCGQ==
=2rcn
-----END PGP SIGNATURE-----

--KwAiacO0WF6zeEiaaUhanLhvKWLxCeAoq--

--===============0391652445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0391652445==--
