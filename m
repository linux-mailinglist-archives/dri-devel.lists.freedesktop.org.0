Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EA441F0C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 10:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F62E89444;
	Wed, 12 Jun 2019 08:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC58689444
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:29:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5A659AF1A;
 Wed, 12 Jun 2019 08:29:34 +0000 (UTC)
Subject: Re: [PATCH v2 1/9] drm/gem-vram: Support pinning buffers to current
 location
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190611130344.18988-1-tzimmermann@suse.de>
 <20190611130344.18988-2-tzimmermann@suse.de>
 <20190612081332.2p7zvoiz6dzs3sho@sirius.home.kraxel.org>
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
Message-ID: <434228c1-4480-1c40-0ff4-668c26cbf554@suse.de>
Date: Wed, 12 Jun 2019 10:29:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612081332.2p7zvoiz6dzs3sho@sirius.home.kraxel.org>
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0408117560=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0408117560==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1j33j8JIHHKJz5cDugChTJBuHCoWXwiOv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1j33j8JIHHKJz5cDugChTJBuHCoWXwiOv
Content-Type: multipart/mixed; boundary="NEchDcCxEkhji34HPtXgnntTtHxCGceWJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Message-ID: <434228c1-4480-1c40-0ff4-668c26cbf554@suse.de>
Subject: Re: [PATCH v2 1/9] drm/gem-vram: Support pinning buffers to current
 location
References: <20190611130344.18988-1-tzimmermann@suse.de>
 <20190611130344.18988-2-tzimmermann@suse.de>
 <20190612081332.2p7zvoiz6dzs3sho@sirius.home.kraxel.org>
In-Reply-To: <20190612081332.2p7zvoiz6dzs3sho@sirius.home.kraxel.org>

--NEchDcCxEkhji34HPtXgnntTtHxCGceWJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.06.19 um 10:13 schrieb Gerd Hoffmann:
> On Tue, Jun 11, 2019 at 03:03:36PM +0200, Thomas Zimmermann wrote:
>> Pinning a buffer prevents it from being moved to a different memory
>> location. For some operations, such as buffer updates, it is not
>> important where the buffer is located. Setting the pin function's
>> pl_flag argument to 0 will pin the buffer to whereever it is stored.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index 42ad80888df7..214f54b8920b 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -224,7 +224,9 @@ EXPORT_SYMBOL(drm_gem_vram_offset);
>>   *
>>   * Pinning a buffer object ensures that it is not evicted from
>>   * a memory region. A pinned buffer object has to be unpinned before
>> - * it can be pinned to another region.
>> + * it can be pinned to another region. If the pl_flag argument is 0,
>> + * the buffer is pinned at its current location (video RAM or system
>> + * memory).
>>   *
>>   * Returns:
>>   * 0 on success, or
>> @@ -242,7 +244,9 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *g=
bo, unsigned long pl_flag)
>>  	if (gbo->pin_count)
>>  		goto out;
>> =20
>> -	drm_gem_vram_placement(gbo, pl_flag);
>> +	if (pl_flag)
>> +		drm_gem_vram_placement(gbo, pl_flag);
>> +
>>  	for (i =3D 0; i < gbo->placement.num_placement; ++i)
>>  		gbo->placements[i].flags |=3D TTM_PL_FLAG_NO_EVICT;
>> =20
>> @@ -691,7 +695,7 @@ int drm_gem_vram_driver_gem_prime_pin(struct drm_g=
em_object *gem)
>>  {
>>  	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(gem);
>> =20
>> -	return drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
>> +	return drm_gem_vram_pin(gbo, 0);

The only use case for these Prime helpers is fbdev console emulation. I
have another patch set that replaces the ast and mgag200 consoles with
generic code. During the console updates it temporarily pins the BO via
this Prime funcation, which might move the BO into scarce VRAM
unnecessarily. Can we leave it like this and add a comment explaining
the decision?

Best regards
Thomas

> Not sure this is a good idea here.  If the bo happens to be in sysram
> it can't be displayed any more.
>=20
>> -	ret =3D drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
>> +	ret =3D drm_gem_vram_pin(gbo, 0);
>=20
> Likewise.
>=20
> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--NEchDcCxEkhji34HPtXgnntTtHxCGceWJ--

--1j33j8JIHHKJz5cDugChTJBuHCoWXwiOv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0At+0ACgkQaA3BHVML
eiNXzQgAqB76+eSotFG0s7l6w2MmQg9nG+T9+oQXwg0dkDi0CNncTD64fweLeSS6
NvRmtyXmutt72vKe0n2zw3ne1+3SyjbgChLl4GManaWICwpwTumTtU/COUSpi182
qu9dPL2y0kS3tYA3P0P8wd4jyqOAngqUEvNw8Addr4aEIlvTB6zYwrO/Rm2jf8dY
9cjyrxUZ64SJDvjC6kqSKQX653RQMZ7Nps9jyF1GUa3yYc1rJ6UDjjz+OuVRpbvr
u9i/77OGBoayHMQDSzOgwz+G13TgarGzY8GsHzSPzc67twUBe6A4VrY3Eu1SUZ20
izvRMG/q6Bd47J3TeC+xugHOgjPwMw==
=eVQt
-----END PGP SIGNATURE-----

--1j33j8JIHHKJz5cDugChTJBuHCoWXwiOv--

--===============0408117560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0408117560==--
