Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949BB1C398C
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D986E3BC;
	Mon,  4 May 2020 12:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB146E3BC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:40:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B07CEACFA;
 Mon,  4 May 2020 12:40:39 +0000 (UTC)
Subject: Re: [PATCH 15/17] drm/mgag200: Remove waiting from DPMS code
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-16-tzimmermann@suse.de>
 <20200504121053.GL10381@phenom.ffwll.local>
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
Message-ID: <4837e6cc-1051-77ca-fbdf-0d34f22d2ac6@suse.de>
Date: Mon, 4 May 2020 14:40:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200504121053.GL10381@phenom.ffwll.local>
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
Cc: john.p.donnelly@oracle.com, sam@ravnborg.org, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============0549023659=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0549023659==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="40sB6hZNrRE8XRgXRycNpIyiBnwAQdLJl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--40sB6hZNrRE8XRgXRycNpIyiBnwAQdLJl
Content-Type: multipart/mixed; boundary="7hVCx27rN6jo9PPi23HHxZym6Z5qJeIpW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Message-ID: <4837e6cc-1051-77ca-fbdf-0d34f22d2ac6@suse.de>
Subject: Re: [PATCH 15/17] drm/mgag200: Remove waiting from DPMS code
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-16-tzimmermann@suse.de>
 <20200504121053.GL10381@phenom.ffwll.local>
In-Reply-To: <20200504121053.GL10381@phenom.ffwll.local>

--7hVCx27rN6jo9PPi23HHxZym6Z5qJeIpW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.05.20 um 14:10 schrieb Daniel Vetter:
> On Wed, Apr 29, 2020 at 04:32:36PM +0200, Thomas Zimmermann wrote:
>> The mgag200 drivers waits for the VSYNC flag to get signalled (i.e.,
>> the page flip happens) before changing DPMS settings. This doesn't wor=
k
>> reliably if no mode has been programmed. Therefore remove the waiting
>> code. Synchronization with page flips should be done by DRM's vblank
>> handlers anyway.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> This looks a bit dangerous, hw might get angry if we drop these waits.
>=20
> Generally with atomic you should never have a situation in driver code
> where you expect the display to be on, but it isn't. So this should be
> fixable by making sure we're calling this dpms function at the right sp=
ot,
> e.g. for the enable path obviously the display is always going to be of=
f,
> and for the disable path the display is guaranteed to be on. So maybe j=
ust
> a bool enable, or split the dpms function into two.

I think this code was taken from the X11 userspace driver, which does
that same waiting.

But it's waiting even for the DPMS_ON case. If the signal generation is
disabled, why does it wait for the vsync flag? After a while the code
times out from a timeout given in HZ/jiffies. I would have expected a
value in usec. All this makes it somewhat dubious and I doubt that it's
actually correct.

If we want to keep the waiting, I agree on splitting the code into an
enable and a disable function.

The driver also busy waited during pageflips (see patch 5). That should
really be done with interrupts.

Best regards
Thomas


>=20
> The old legacy helpers where a lot more fast&loose in this regard.
> -Daniel
>=20
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 26 -------------------------=
-
>>  1 file changed, 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index ee1cbe5decd71..884fc668a6dae 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -75,30 +75,6 @@ static void mga_crtc_load_lut(struct drm_crtc *crtc=
)
>>  	}
>>  }
>> =20
>> -static inline void mga_wait_vsync(struct mga_device *mdev)
>> -{
>> -	unsigned long timeout =3D jiffies + HZ/10;
>> -	unsigned int status =3D 0;
>> -
>> -	do {
>> -		status =3D RREG32(MGAREG_Status);
>> -	} while ((status & 0x08) && time_before(jiffies, timeout));
>> -	timeout =3D jiffies + HZ/10;
>> -	status =3D 0;
>> -	do {
>> -		status =3D RREG32(MGAREG_Status);
>> -	} while (!(status & 0x08) && time_before(jiffies, timeout));
>> -}
>> -
>> -static inline void mga_wait_busy(struct mga_device *mdev)
>> -{
>> -	unsigned long timeout =3D jiffies + HZ;
>> -	unsigned int status =3D 0;
>> -	do {
>> -		status =3D RREG8(MGAREG_Status + 2);
>> -	} while ((status & 0x01) && time_before(jiffies, timeout));
>> -}
>> -
>>  #define P_ARRAY_SIZE 9
>> =20
>>  static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
>> @@ -1435,8 +1411,6 @@ static void mga_crtc_dpms(struct drm_crtc *crtc,=
 int mode)
>>  #endif
>>  	WREG8(MGAREG_SEQ_INDEX, 0x01);
>>  	seq1 |=3D RREG8(MGAREG_SEQ_DATA) & ~0x20;
>> -	mga_wait_vsync(mdev);
>> -	mga_wait_busy(mdev);
>>  	WREG8(MGAREG_SEQ_DATA, seq1);
>>  	msleep(20);
>>  	WREG8(MGAREG_CRTCEXT_INDEX, 0x01);
>> --=20
>> 2.26.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--7hVCx27rN6jo9PPi23HHxZym6Z5qJeIpW--

--40sB6hZNrRE8XRgXRycNpIyiBnwAQdLJl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6wDUEACgkQaA3BHVML
eiNlWAgArs0QMnM3PBpeM0E6oBT5whkqj0YcOOT5kcuPp3IO38OBFpZltiXmKcDo
1yRz43zzPRS2PjmsAAfJTiz8QKB3ZUqmkiTPSSXI3Y+X/oQq/A3KoYP4S58ofQnJ
jvbfRgcfoccINaSrBwxlvwc0V9i0bztydFa3kZM7DEo/E4YqOUdSOw6gMlhSfUD3
AkPhgKtGmvL58IakeugpJeSnh6yj6VvxNafLhEQ/Wap/XZGnROYPTiJ4EUhcufmJ
Ri1oxvqe3jiNzwggZ05LXoJwQkQe+hswKmammIg9zRI7lBWTt+aZo1RA2QQjO2XA
HXz+3Sw2qztZfV7A2ek7DKmqexfIyQ==
=2tdc
-----END PGP SIGNATURE-----

--40sB6hZNrRE8XRgXRycNpIyiBnwAQdLJl--

--===============0549023659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0549023659==--
