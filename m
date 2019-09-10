Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11BAEADB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 14:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7558933D;
	Tue, 10 Sep 2019 12:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B4E8933D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 12:49:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19100AFCD;
 Tue, 10 Sep 2019 12:49:04 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-2-tzimmermann@suse.de>
 <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
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
Message-ID: <52e8e124-f8e6-d2e6-0102-472b9fa70317@suse.de>
Date: Tue, 10 Sep 2019 14:48:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 ying.huang@intel.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============1682923240=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1682923240==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="y83uEJOS8p0MxMtFbJP8yGIPJS1kvHCkL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--y83uEJOS8p0MxMtFbJP8yGIPJS1kvHCkL
Content-Type: multipart/mixed; boundary="LaoJEF5fZRBY7ynQjxOCe1xAxFxhpjsgK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 dri-devel@lists.freedesktop.org
Message-ID: <52e8e124-f8e6-d2e6-0102-472b9fa70317@suse.de>
Subject: Re: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-2-tzimmermann@suse.de>
 <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
In-Reply-To: <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>

--LaoJEF5fZRBY7ynQjxOCe1xAxFxhpjsgK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.09.19 um 13:52 schrieb Gerd Hoffmann:
> On Mon, Sep 09, 2019 at 04:06:32PM +0200, Thomas Zimmermann wrote:
>> Before updating the display from the console's shadow buffer, the dirt=
y
>> worker now waits for vblank. This allows several screen updates to pil=
e
>> up and acts as a rate limiter.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_fb_helper.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_=
helper.c
>> index a7ba5b4902d6..017e2f6bd1b9 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -402,8 +402,20 @@ static void drm_fb_helper_dirty_work(struct work_=
struct *work)
>>  						    dirty_work);
>>  	struct drm_clip_rect *clip =3D &helper->dirty_clip;
>>  	struct drm_clip_rect clip_copy;
>> +	struct drm_crtc *crtc;
>>  	unsigned long flags;
>>  	void *vaddr;
>> +	int ret;
>> +
>> +	/* rate-limit update frequency */
>> +	mutex_lock(&helper->lock);
>> +	crtc =3D helper->client.modesets[0].crtc;
>> +	ret =3D drm_crtc_vblank_get(crtc);
>> +	if (!ret) {
>> +		drm_crtc_wait_one_vblank(crtc);
>> +		drm_crtc_vblank_put(crtc);
>> +	}
>> +	mutex_unlock(&helper->lock);
>=20
> Hmm, not sure it is the best plan to sleep for a while in the worker,
> especially while holding the lock.
>=20
> What does the lock protect against here?  Accessing

This lock is hold by the fbdev code during mode-setting operations (but
not drawing operations). So *crtc might be gone if we don't hold it here.=


> helper->client.modesets?  If so then you can unlock before going to
> sleep in drm_crtc_wait_one_vblank() I think.

I looked, but I cannot find any code that protects crtc while vblank is
active. I'd rather not change the current code until someone can clarify.=


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


--LaoJEF5fZRBY7ynQjxOCe1xAxFxhpjsgK--

--y83uEJOS8p0MxMtFbJP8yGIPJS1kvHCkL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl13m74ACgkQaA3BHVML
eiM1eggAnDrqqyd8u5wC+Mb1No9mkK/S4ty/ckoV9j44l3KIWK4Dcq9YDNOLYiMP
+nhZdLhnWWHWmCSuFA4MWg/fpnAj+gsz34uhnIh/w9TLGFlaw/jyzK6DNiC+op+l
0ejG4CiHf8mckSRUSqSU5ixuPvPHM3E1NHZKknCb4frUTnN4Rkqjs7tkoTiyQPf4
42BAv+V2KwpX051VA/a59a9ZArGNeoq0F8bxAlng76/Wdkt7JrTxlUSQ9Eh1opL3
3gu7UPVK7lj0QygeJAe5Ej+/pYf8ZUP8uPaWjPrdKe90F2GucFH42FkKE+lJwRbB
kgZ/5ZEjtTuSNAJAy5LJadHua2sWKA==
=lq0w
-----END PGP SIGNATURE-----

--y83uEJOS8p0MxMtFbJP8yGIPJS1kvHCkL--

--===============1682923240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1682923240==--
