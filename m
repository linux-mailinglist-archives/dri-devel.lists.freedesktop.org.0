Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C62514B4D
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D1789970;
	Mon,  6 May 2019 13:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DB689970
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:54:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0259ACD1;
 Mon,  6 May 2019 13:54:02 +0000 (UTC)
Subject: Re: [PATCH v4 01/19] drm: Add |struct drm_gem_vram_object| and helpers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506082649.942-2-tzimmermann@suse.de>
 <20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>
 <0fad955f-5a9e-15b1-0dca-c5e842b297c6@suse.de>
 <20190506131739.hmadwiqmjil2weth@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <20681195-13b8-5496-a23a-cf617f421dab@suse.de>
Date: Mon, 6 May 2019 15:53:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190506131739.hmadwiqmjil2weth@sirius.home.kraxel.org>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1602773235=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1602773235==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UGMzEXZdjFq8twEgpjNrvE7GTC4FpsjGO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UGMzEXZdjFq8twEgpjNrvE7GTC4FpsjGO
Content-Type: multipart/mixed; boundary="3lFZCR6nCiEs7kdDwSG9w8Zx7JdY0uGmB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, ray.huang@amd.com, zourongrong@gmail.com,
 sam@ravnborg.org, christian.koenig@amd.com
Message-ID: <20681195-13b8-5496-a23a-cf617f421dab@suse.de>
Subject: Re: [PATCH v4 01/19] drm: Add |struct drm_gem_vram_object| and
 helpers
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506082649.942-2-tzimmermann@suse.de>
 <20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>
 <0fad955f-5a9e-15b1-0dca-c5e842b297c6@suse.de>
 <20190506131739.hmadwiqmjil2weth@sirius.home.kraxel.org>
In-Reply-To: <20190506131739.hmadwiqmjil2weth@sirius.home.kraxel.org>

--3lFZCR6nCiEs7kdDwSG9w8Zx7JdY0uGmB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.05.19 um 15:17 schrieb Gerd Hoffmann:
>   Hi,
>=20
>> This misses the call to drm_gem_vram_placement(), where
>> drm_gem_vram_push_to_system() enforces placement in system memory.
>=20
> Ah, missed that detail.
>=20
>> We
>> could build a common implementation out of both interfaces, but that
>> would obfuscate the code IMHO. I'd just leave it as it is.
>=20
> Ok.
>=20
>>>> +struct drm_gem_vram_object {
>>>> +	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
>>>> +	struct ttm_placement placement;
>>>> +	struct ttm_place placements[3];
>>>
>>> placements[2] should be enough I guess?
>>
>> TTM_PL_VRAM has index 2 and TTM_PL_SYSTEM has index 0. There's TTM_PL_=
TT
>> at index 1. We don't use all three array entries here, but I'm not sur=
e
>> if something in TTM does. I took the line from the drivers and didn't
>> change it for that reason.
>=20
> TTM_PL_* isn't an index into that array.  See drm_gem_vram_placement()
> which fills that array.  It'll use one or two entries of that array.

The field 'placements' is assigned to 'placement.placements' and
'placement.busy_placement'. The placement field is later given to
ttm_bo_validate() for internal use by TTM. From reading ttm_bo.c, that's
apparently not a problem. I'm just being defensive here, but let's
remove the additional entry if it's just overhead.

Best regards
Thomas


> cheers,
>   Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--3lFZCR6nCiEs7kdDwSG9w8Zx7JdY0uGmB--

--UGMzEXZdjFq8twEgpjNrvE7GTC4FpsjGO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzQPHUACgkQaA3BHVML
eiODkQf/eN0JzOmQP3Irawq18oVQAThKfdWiQsukQlvK6ghpb992Rmbut4/a8I3A
gEpFV+fkF+m/94eKvpxvC7J+YQHT39aHeZNSld8+dCHtCMIqvBLpgPPUydjfHhm9
y5eezyUkR65B70NfbiSFV2OUxt+2yM2lx2VSKCznmt+LHG7WL8RUtqGSJWhQ8RP/
24FNaarHRrdm9Y5e9aqEP2bOQbv4XiyIGjzJuCreAjPetAgeVzlEsfKjUT4QMoxz
Dy6LumnXLl4CmevuF/FlkQBlTo1SPn1oGv30ckMAsCT4WpGAbfAAsWFLyZm7k44m
zwsiIBVtJD/7yFYZkdUN5ppY3PirTA==
=Ocpe
-----END PGP SIGNATURE-----

--UGMzEXZdjFq8twEgpjNrvE7GTC4FpsjGO--

--===============1602773235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1602773235==--
