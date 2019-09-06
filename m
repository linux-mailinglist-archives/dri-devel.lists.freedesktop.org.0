Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A8DAB61E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 12:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126156E23F;
	Fri,  6 Sep 2019 10:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5316E23D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 10:37:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E154ABC4;
 Fri,  6 Sep 2019 10:37:55 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] drm/vram: Implement lazy unmapping for GEM VRAM
 buffers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190906085214.11677-1-tzimmermann@suse.de>
 <20190906085214.11677-4-tzimmermann@suse.de>
 <20190906093905.umz4wkwn4lukg2jg@sirius.home.kraxel.org>
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
Message-ID: <b08a47cf-8e2f-6632-7704-94c8ec4421d4@suse.de>
Date: Fri, 6 Sep 2019 12:37:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906093905.umz4wkwn4lukg2jg@sirius.home.kraxel.org>
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
Cc: feng.tang@intel.com, dave@stgolabs.net, rong.a.chen@intel.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, maxime.ripard@bootlin.com,
 ying.huang@intel.com, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============2038427415=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2038427415==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KbGkBz2cXDsSyBMU4xnQzHqlGmT45kCVN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KbGkBz2cXDsSyBMU4xnQzHqlGmT45kCVN
Content-Type: multipart/mixed; boundary="IGrERSsklhk7podfx9WPZXD7OhFRAwY0w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com, dave@stgolabs.net,
 dri-devel@lists.freedesktop.org
Message-ID: <b08a47cf-8e2f-6632-7704-94c8ec4421d4@suse.de>
Subject: Re: [PATCH v3 3/3] drm/vram: Implement lazy unmapping for GEM VRAM
 buffers
References: <20190906085214.11677-1-tzimmermann@suse.de>
 <20190906085214.11677-4-tzimmermann@suse.de>
 <20190906093905.umz4wkwn4lukg2jg@sirius.home.kraxel.org>
In-Reply-To: <20190906093905.umz4wkwn4lukg2jg@sirius.home.kraxel.org>

--IGrERSsklhk7podfx9WPZXD7OhFRAwY0w
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.09.19 um 11:39 schrieb Gerd Hoffmann:
>> +void drm_gem_vram_bo_driver_move_notify(struct ttm_buffer_object *bo,=

>> +					bool evict,
>> +					struct ttm_mem_reg *new_mem)
>> +{
> [ ... ]
>> +	if (!kmap->virtual)
>> +		return;
>> +	ttm_bo_kunmap(kmap);
>> +	kmap->virtual =3D NULL;
>> +}
>=20
> I think ttm_buffer_object_destroy() needs "if (kmap->virtual)
> ttm_bo_kunmap()" too, due to the lazy unmap you can land there
> with an active mapping.

Hmm, from my understanding, that final call to move_notify() is done by
ttm_bo_cleanup_memtype_use(), which is called from within ttm_bo_put().

If we want to add a final kunmap, There's also the release_notify()
callback, which is probably the right place to put it.

Best regards
Thomas

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


--IGrERSsklhk7podfx9WPZXD7OhFRAwY0w--

--KbGkBz2cXDsSyBMU4xnQzHqlGmT45kCVN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1yNvsACgkQaA3BHVML
eiOTtggAwIvAfzrcu4oOVwANg8JYjwybLVaPOUeieD/CkpmENz7P5JHgOUk6FrQS
8SVgiV064aXp3wLjwC6GSUkfqtU8aYvYMzYXSl+aHGtjBLlVe1d+3uLXd+Z9fcRJ
iXzfUIU1rz9cRI6DcuDWlBJty7YbYHpkqpSPoI6DK/JeU5g7pG53gk64+Yswvpfh
SzhhNfQt+mHUK/fTti8/0elhcy6RrgDeGxaFg2bpYBaAJcU2ASsLyuU1SxPIc07d
WsYMCD6NXnnBzu+vRBcS0OidPwrU/84riSGu2KyqCO26+YqVeegCdRpIloQTwv4M
YBWfVwDcIWBDQ4kS5HcfzqD4TKXU5w==
=ep8q
-----END PGP SIGNATURE-----

--KbGkBz2cXDsSyBMU4xnQzHqlGmT45kCVN--

--===============2038427415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2038427415==--
