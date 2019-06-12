Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0346541DD8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75589110;
	Wed, 12 Jun 2019 07:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C251289110
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:35:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63CACAEC8;
 Wed, 12 Jun 2019 07:35:37 +0000 (UTC)
Subject: Re: [PATCH v2 5/9] drm/ast: Pin framebuffer BO during dirty update
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190611130344.18988-1-tzimmermann@suse.de>
 <20190611130344.18988-6-tzimmermann@suse.de>
 <20190611202953.GA18315@ravnborg.org>
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
Message-ID: <038d4a58-1980-3b76-ea53-9b354980723a@suse.de>
Date: Wed, 12 Jun 2019 09:35:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611202953.GA18315@ravnborg.org>
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
Cc: maxime.ripard@bootlin.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1723008435=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1723008435==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sS1Hx6bimTLHfU3dFmBTCIDfRh4yrrh3F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sS1Hx6bimTLHfU3dFmBTCIDfRh4yrrh3F
Content-Type: multipart/mixed; boundary="7802NKn3Mlxyu3awESru6TcD03evH4NhX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, dri-devel@lists.freedesktop.org
Message-ID: <038d4a58-1980-3b76-ea53-9b354980723a@suse.de>
Subject: Re: [PATCH v2 5/9] drm/ast: Pin framebuffer BO during dirty update
References: <20190611130344.18988-1-tzimmermann@suse.de>
 <20190611130344.18988-6-tzimmermann@suse.de>
 <20190611202953.GA18315@ravnborg.org>
In-Reply-To: <20190611202953.GA18315@ravnborg.org>

--7802NKn3Mlxyu3awESru6TcD03evH4NhX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.06.19 um 22:29 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Tue, Jun 11, 2019 at 03:03:40PM +0200, Thomas Zimmermann wrote:
>> Another explicit lock operation of a GEM VRAM BO is located in AST's
>> framebuffer update code. Instead of locking the BO, we pin it to where=
ver
>> it is.
>>
>> v2:
>> 	* update with pin flag of 0
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/ast/ast_fb.c | 33 ++++++++++++++++-----------------
>>  1 file changed, 16 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_fb.c b/drivers/gpu/drm/ast/ast_fb=
=2Ec
>> index 05f45222b702..b404b51c2c55 100644
>> --- a/drivers/gpu/drm/ast/ast_fb.c
>> +++ b/drivers/gpu/drm/ast/ast_fb.c
>> @@ -48,32 +48,31 @@ static void ast_dirty_update(struct ast_fbdev *afb=
dev,
>>  			     int x, int y, int width, int height)
>>  {
>>  	int i;
>> -	struct drm_gem_object *obj;
>>  	struct drm_gem_vram_object *gbo;
>>  	int src_offset, dst_offset;
>>  	int bpp =3D afbdev->afb.base.format->cpp[0];
>> -	int ret =3D -EBUSY;
>> +	int ret;
>>  	u8 *dst;
>>  	bool unmap =3D false;
>>  	bool store_for_later =3D false;
>>  	int x2, y2;
>>  	unsigned long flags;
>> =20
>> -	obj =3D afbdev->afb.obj;
>> -	gbo =3D drm_gem_vram_of_gem(obj);
>> -
>> -	/* Try to lock the BO. If we fail with -EBUSY then
>> -	 * the BO is being moved and we should store up the
>> -	 * damage until later.
>> -	 */
>> -	if (drm_can_sleep())
>> -		ret =3D drm_gem_vram_lock(gbo, true);
>> -	if (ret) {
>> -		if (ret !=3D -EBUSY)
>> -			return;
>> -
>> +	gbo =3D drm_gem_vram_of_gem(afbdev->afb.obj);
>> +
>> +	if (drm_can_sleep()) {
>=20
> While touching this code, anyway we could get rid of drm_can_sleep()?
> I only ask because Daniel V. said that we should not use it.
> This was some months ago during some ehader file clean-up, so nothing
> in particular related to the ast driver.

I'm aware of what is commented in the header and the todo file. Do you
have a link to this discussion?

In any case, I'd prefer to fix this in a separate patch set. I have
patches that replace the ast and mgag200 fbdev consoles with generic
code. That might be the right place.

Best regards
Thomas

>=20
> 	Sam
>=20
>> +		/* We pin the BO so it won't be moved during the
>> +		 * update. The actual location, video RAM or system
>> +		 * memory, is not important.
>> +		 */
>> +		ret =3D drm_gem_vram_pin(gbo, 0);
>> +		if (ret) {
>> +			if (ret !=3D -EBUSY)
>> +				return;
>> +			store_for_later =3D true;
>> +		}
>> +	} else
>>  		store_for_later =3D true;
>> -	}
>> =20
>>  	x2 =3D x + width - 1;
>>  	y2 =3D y + height - 1;
>> @@ -126,7 +125,7 @@ static void ast_dirty_update(struct ast_fbdev *afb=
dev,
>>  		drm_gem_vram_kunmap(gbo);
>> =20
>>  out:
>> -	drm_gem_vram_unlock(gbo);
>> +	drm_gem_vram_unpin(gbo);
>>  }
>> =20
>>  static void ast_fillrect(struct fb_info *info,
>> --=20
>> 2.21.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--7802NKn3Mlxyu3awESru6TcD03evH4NhX--

--sS1Hx6bimTLHfU3dFmBTCIDfRh4yrrh3F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0Aq0QACgkQaA3BHVML
eiPCMgf+JZwpv65SgpuqG4Bd8WJaFA7FFXW6fGbj2pbg2HRPU8yzjeC0tVaYk3P1
j5S51yYyyZw2hxe5tGMw6nNjbDcn4TKLe1fJCpCq8RIgg3fdd29550ERB8QQp45g
4YlnmvbRI2KTaKNhuPXBxjy6xOvFxB/ZDOtaaGEtjcxKDmTsszR8oFME4A+RLviN
ZnUU5gV4W8bg0hDrjZOLx+MjAodTF9owH5kzdFdaS90V95zxxYGTchQbZMNOiR8D
41xGBVadmQ+5lIRI8oxMYX0c1LqeWOtBjTj2QNUdawPSlMXSQDqDIaFcmgbdOPi4
R9o2S6qT5YXErMzfNL0WHXQKYeye1w==
=6T4g
-----END PGP SIGNATURE-----

--sS1Hx6bimTLHfU3dFmBTCIDfRh4yrrh3F--

--===============1723008435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1723008435==--
