Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BFA3581C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729D488007;
	Wed,  5 Jun 2019 07:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28A288007
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:56:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 130AFAF2D;
 Wed,  5 Jun 2019 07:56:19 +0000 (UTC)
Subject: Re: [PATCH 1/8] drm/ast: Unpin cursor BO during cleanup
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, kraxel@redhat.com, 
 airlied@redhat.com, daniel@ffwll.ch, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, christian.koenig@amd.com
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-2-tzimmermann@suse.de>
 <b2c1776f-c1b3-c6ce-db6a-8db247bc25f6@linux.intel.com>
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
Message-ID: <f1344207-5650-cfaa-c841-2178f99a342a@suse.de>
Date: Wed, 5 Jun 2019 09:56:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b2c1776f-c1b3-c6ce-db6a-8db247bc25f6@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0818741858=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0818741858==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ii5kohPc2k1R9VndKhFsgIO3QRBFn7AmC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ii5kohPc2k1R9VndKhFsgIO3QRBFn7AmC
Content-Type: multipart/mixed; boundary="d6XQltpGtzV2ocgVzymJ0BFwRBiNKBWdX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, kraxel@redhat.com,
 airlied@redhat.com, daniel@ffwll.ch, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <f1344207-5650-cfaa-c841-2178f99a342a@suse.de>
Subject: Re: [PATCH 1/8] drm/ast: Unpin cursor BO during cleanup
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-2-tzimmermann@suse.de>
 <b2c1776f-c1b3-c6ce-db6a-8db247bc25f6@linux.intel.com>
In-Reply-To: <b2c1776f-c1b3-c6ce-db6a-8db247bc25f6@linux.intel.com>

--d6XQltpGtzV2ocgVzymJ0BFwRBiNKBWdX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.06.19 um 09:45 schrieb Maarten Lankhorst:
> Op 04-06-2019 om 17:41 schreef Thomas Zimmermann:
>> The unpin operation was missing from ast_cursor_fini(). Fixed now.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/ast/ast_mode.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index fb700d620b64..41741cd6cd15 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -959,6 +959,7 @@ static void ast_cursor_fini(struct drm_device *dev=
)
>>  	struct drm_gem_vram_object *gbo =3D
>>  		drm_gem_vram_of_gem(ast->cursor_cache);
>>  	drm_gem_vram_kunmap_at(gbo, &ast->cache_kmap);
>> +	drm_gem_vram_unpin(gbo);
>>  	drm_gem_object_put_unlocked(ast->cursor_cache);
>>  }
>> =20
>=20
> Fixes tag?

I didn't add one as it would be the original commit 312fec1405dd5. Since
the code is only called during driver shutdown, I don't think it ever
was a problem. Unpinning the cursor is still the correct thing to do.

Best regards
Thomas

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


--d6XQltpGtzV2ocgVzymJ0BFwRBiNKBWdX--

--Ii5kohPc2k1R9VndKhFsgIO3QRBFn7AmC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlz3dZ0ACgkQaA3BHVML
eiOyFQf/VojPlvULJ6qLB+I9CKJbqMZucDNbPVAl/FctyyKxx24/ReGi3mpwL1Tq
tHaQGdsmw/fvqgzMiftlID1l4F4hDJlYeHO/CwuCHmVNGBTXby03fbmKwb8wARgx
ub9cKi6wzhpnush2Ye2yeY0lWHrSH3C8vZJt3GZUYbxZUDNEEApifktwXboxgTYw
892bImHNEYr1yfGZUC4HOauRRdVcGvkMPKwBVQQ6qP/RDcDznt2EGc2fsxx+cb+j
IcACtrIcnaHWS1s0dsV5+46IOWB+ApI9ETjiGWAu04jVtsDX4gXmXV2FxRUfqReN
uLNt4tMBTDGTnEDMzLmXtgIBPTdRCQ==
=wITH
-----END PGP SIGNATURE-----

--Ii5kohPc2k1R9VndKhFsgIO3QRBFn7AmC--

--===============0818741858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0818741858==--
