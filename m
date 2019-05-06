Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E2B14A77
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 14:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117A889415;
	Mon,  6 May 2019 12:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D1189862
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 12:58:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 737ECAB5F;
 Mon,  6 May 2019 12:58:57 +0000 (UTC)
Subject: Re: [PATCH v4 01/19] drm: Add |struct drm_gem_vram_object| and helpers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506082649.942-2-tzimmermann@suse.de>
 <20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>
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
Message-ID: <0fad955f-5a9e-15b1-0dca-c5e842b297c6@suse.de>
Date: Mon, 6 May 2019 14:58:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>
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
Content-Type: multipart/mixed; boundary="===============1892447923=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1892447923==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4sS3OfANxHAoq5OyGniA2xYvU7Lb8dibk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4sS3OfANxHAoq5OyGniA2xYvU7Lb8dibk
Content-Type: multipart/mixed; boundary="ZipD9EcZseCXiskT5bON6feXW3MQIdQ0B";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, airlied@linux.ie, christian.koenig@amd.com,
 ray.huang@amd.com, hdegoede@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <0fad955f-5a9e-15b1-0dca-c5e842b297c6@suse.de>
Subject: Re: [PATCH v4 01/19] drm: Add |struct drm_gem_vram_object| and
 helpers
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506082649.942-2-tzimmermann@suse.de>
 <20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>
In-Reply-To: <20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>

--ZipD9EcZseCXiskT5bON6feXW3MQIdQ0B
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

thanks for reviewing the patches.

Am 06.05.19 um 14:31 schrieb Gerd Hoffmann:
>> +	--gbo->pin_count;
>> +	if (gbo->pin_count)
>> +		return 0;
>> +
>> +	if (gbo->kmap.virtual)
>> +		ttm_bo_kunmap(&gbo->kmap);
>> +
>> +	drm_gem_vram_placement(gbo, TTM_PL_FLAG_SYSTEM);
>> +	for (i =3D 0; i < gbo->placement.num_placement ; ++i)
>> +		gbo->placements[i].flags |=3D TTM_PL_FLAG_NO_EVICT;
>> +
>> +	ret =3D ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_gem_vram_push_to_system);
>=20
> Very simliar to drm_gem_vram_unpin, can't we just call that function?
>=20
> Something like this:
>=20
> 	drm_gem_vram_push_to_system()
> 	{
> 		if (gbo->pin_count =3D=3D 1 && gbo->kmap.virtual)
> 			ttm_bo_kunmap(&gbo->kmap);
> 		return drm_gem_vram_unpin();
> 	}

This misses the call to drm_gem_vram_placement(), where
drm_gem_vram_push_to_system() enforces placement in system memory. We
could build a common implementation out of both interfaces, but that
would obfuscate the code IMHO. I'd just leave it as it is.

The function is only used by ast and mgag200 framebuffer handling. It's
actually something that should be done by VRAM MM, but both drivers are
non-atomic and could require an overhaul anyway.

>> +struct drm_gem_vram_object {
>> +	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
>> +	struct ttm_placement placement;
>> +	struct ttm_place placements[3];
>=20
> placements[2] should be enough I guess?

TTM_PL_VRAM has index 2 and TTM_PL_SYSTEM has index 0. There's TTM_PL_TT
at index 1. We don't use all three array entries here, but I'm not sure
if something in TTM does. I took the line from the drivers and didn't
change it for that reason.

Best regards
Thomas

> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--ZipD9EcZseCXiskT5bON6feXW3MQIdQ0B--

--4sS3OfANxHAoq5OyGniA2xYvU7Lb8dibk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzQL48ACgkQaA3BHVML
eiPgHwf/QXvFOaFUtsEy7dOyFKSbWfcHoCbYowuNyo6DleV9v/rwBG/63YSp1WuS
ZdaU9S4OS1iz3o7uf8do5/Rs6kavGEQ6KjLQff6Ssry2+MFIDFB/DN98Z40n+PUe
nmZ9lOIDs8trzDnMfkFRxmmRvklJpLxXlAayeJDnrTkQ/3x5tTaX3F8YFgK8alwt
XWuMUVXs8+Zw51l1lVjh7B64/D/oC5+rPEwqO/leOzFZWwAQVOQqrEf6DoTGJi+q
u5Kcek/lQ5RKr62Yone6AF7hREiAHx7jWLgvPIkM9YNULo5y01hCSHRoSHSmD09b
aWTvinlZkgKHy2AkTzi+t63kRzZD3A==
=iP4G
-----END PGP SIGNATURE-----

--4sS3OfANxHAoq5OyGniA2xYvU7Lb8dibk--

--===============1892447923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1892447923==--
