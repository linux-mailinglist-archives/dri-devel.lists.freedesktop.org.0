Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25480FB413
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E8C6ED6A;
	Wed, 13 Nov 2019 15:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B4A6ED6A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:48:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3B90B496;
 Wed, 13 Nov 2019 15:48:23 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] drm/udl: Replace fbdev code with generic emulation
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com, 
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-2-tzimmermann@suse.de>
 <7c9289a6-1a4e-e0d3-ce9e-3f5d6305da69@tronnes.org>
 <c2d1d12d-d90e-f6f6-9608-9955e63a8bec@suse.de>
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
Message-ID: <5398d88a-bb4a-7f8f-f043-a101911940aa@suse.de>
Date: Wed, 13 Nov 2019 16:48:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <c2d1d12d-d90e-f6f6-9608-9955e63a8bec@suse.de>
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
Content-Type: multipart/mixed; boundary="===============0772602591=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0772602591==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZQ6pXZQRbgjVW9F6dCLaI2xDfw1j2uWHu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZQ6pXZQRbgjVW9F6dCLaI2xDfw1j2uWHu
Content-Type: multipart/mixed; boundary="HJTtoV33BLx1rsgTppA8uUGQFUTEeDIXM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <5398d88a-bb4a-7f8f-f043-a101911940aa@suse.de>
Subject: Re: [PATCH v4 1/3] drm/udl: Replace fbdev code with generic emulation
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-2-tzimmermann@suse.de>
 <7c9289a6-1a4e-e0d3-ce9e-3f5d6305da69@tronnes.org>
 <c2d1d12d-d90e-f6f6-9608-9955e63a8bec@suse.de>
In-Reply-To: <c2d1d12d-d90e-f6f6-9608-9955e63a8bec@suse.de>

--HJTtoV33BLx1rsgTppA8uUGQFUTEeDIXM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Am 13.11.19 um 16:41 schrieb Thomas Zimmermann:

>> Either way you choose:
>=20
> Glad you like it :)
>=20

more like this

>>
>> Btw, nice diffstat!

Glad you like it :)

>>
>>>  	if (ret)
>>>  		goto err;
>>> =20
>>> @@ -367,6 +368,4 @@ void udl_fini(struct drm_device *dev)
>>> =20
>>>  	if (udl->urbs.count)
>>>  		udl_free_urb_list(dev);
>>> -
>>> -	udl_fbdev_cleanup(dev);
>>>  }
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--HJTtoV33BLx1rsgTppA8uUGQFUTEeDIXM--

--ZQ6pXZQRbgjVW9F6dCLaI2xDfw1j2uWHu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3MJcQACgkQaA3BHVML
eiNG6Qf/epNWFMYvFoLWFEdBRojEqVCU3W7GD95cNBp25auTYxjmbdeB4dhasdMJ
vG7gIxe+uRaOSiN5sEDSpenMw3gGUhMVbFwmaQUapxU4THVpdSKB2X/d7iFFOtbP
ECFxsfAHRSrb7xzTZwoPNsnTR8ptgH++uok/Mh3V+PfgqGqjUaOVHYhZvVtPuMGf
TF296DjD0hPBuvVvXsSQ9S+vuJeCHsBw6vVHr/peP8hx6/pForieSf3G/MvxkBYV
M10qhmgQ5mI9MP+9qsP1OiUF2wPentGzQsxA0r1mt6TRH8Taqm7vSNCRdrHVG8Gz
nhGkHuxLErXgN3hG0y1hXKbjEdG+lw==
=Ol7h
-----END PGP SIGNATURE-----

--ZQ6pXZQRbgjVW9F6dCLaI2xDfw1j2uWHu--

--===============0772602591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0772602591==--
