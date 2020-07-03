Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E90121347F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 08:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714676E8CA;
	Fri,  3 Jul 2020 06:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F166C6E8CA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 06:51:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CAD83AD26;
 Fri,  3 Jul 2020 06:51:34 +0000 (UTC)
Subject: Re: [PATCH v2 12/14] drm/ast: Replace struct ast_crtc with struct
 drm_crtc
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200702115029.5281-1-tzimmermann@suse.de>
 <20200702115029.5281-13-tzimmermann@suse.de>
 <20200703063848.GA1690637@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <59bd0ea8-ab95-5e37-287c-021c33e6556d@suse.de>
Date: Fri, 3 Jul 2020 08:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703063848.GA1690637@ravnborg.org>
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
Cc: airlied@redhat.com, emil.l.velikov@gmail.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0955156559=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0955156559==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GhRKmF1RyrxjogXDXUgPXENHQXtB7eJa2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GhRKmF1RyrxjogXDXUgPXENHQXtB7eJa2
Content-Type: multipart/mixed; boundary="VlzPJ4DTTsE09TU00mjKiGl6u6QF8q0bF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Message-ID: <59bd0ea8-ab95-5e37-287c-021c33e6556d@suse.de>
Subject: Re: [PATCH v2 12/14] drm/ast: Replace struct ast_crtc with struct
 drm_crtc
References: <20200702115029.5281-1-tzimmermann@suse.de>
 <20200702115029.5281-13-tzimmermann@suse.de>
 <20200703063848.GA1690637@ravnborg.org>
In-Reply-To: <20200703063848.GA1690637@ravnborg.org>

--VlzPJ4DTTsE09TU00mjKiGl6u6QF8q0bF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 03.07.20 um 08:38 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> Just browsing code..
>=20
> On Thu, Jul 02, 2020 at 01:50:27PM +0200, Thomas Zimmermann wrote:
>> Struct ast_crtc has been cleaned up and it's now a wrapper around the
>> DRM CRTC structure struct drm_crtc. This patch converts the driver to
>> struct drm_crtc and removes struct ast_crtc.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Why is it we cannot embed struct drm_crtc?

I want to do that in a later patchset. The conversion to managed code is
fairly large, so thought it might be better to do it in several rounds.

This patchset is only for modesetting. I have another patchset that
converts the memory management to managed interfaces. After that the
final patchset will address device structures. Embedding everything CRTC
and other structures in struct ast_private would be part of this.

If you prefer a longer patchset that does everything, let me know.

> And I also failed to see where is is de-allocated - but surely I miss
> something obvious here.

It's freed in ast_crtc_destroy().

Best regards
Thomas

>=20
> 	Sam
>=20
>> ---
>>  drivers/gpu/drm/ast/ast_drv.h  |  5 -----
>>  drivers/gpu/drm/ast/ast_mode.c | 11 ++++++-----
>>  2 files changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_d=
rv.h
>> index ea4de3dce2c4..77226e2fd7c0 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -238,11 +238,6 @@ struct ast_connector {
>>  	struct ast_i2c_chan *i2c;
>>  };
>> =20
>> -struct ast_crtc {
>> -	struct drm_crtc base;
>> -};
>> -
>> -#define to_ast_crtc(x) container_of(x, struct ast_crtc, base)
>>  #define to_ast_connector(x) container_of(x, struct ast_connector, bas=
e)
>> =20
>>  struct ast_vbios_stdtable {
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index 89d9ee0a9e81..43c9686ba0f7 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -881,21 +881,22 @@ static const struct drm_crtc_funcs ast_crtc_func=
s =3D {
>>  static int ast_crtc_init(struct drm_device *dev)
>>  {
>>  	struct ast_private *ast =3D to_ast_private(dev);
>> -	struct ast_crtc *crtc;
>> +	struct drm_crtc *crtc;
>>  	int ret;
>> =20
>> -	crtc =3D kzalloc(sizeof(struct ast_crtc), GFP_KERNEL);
>> +	crtc =3D kzalloc(sizeof(*crtc), GFP_KERNEL);
>>  	if (!crtc)
>>  		return -ENOMEM;
>> =20
>> -	ret =3D drm_crtc_init_with_planes(dev, &crtc->base, &ast->primary_pl=
ane,
>> +	ret =3D drm_crtc_init_with_planes(dev, crtc, &ast->primary_plane,
>>  					&ast->cursor_plane, &ast_crtc_funcs,
>>  					NULL);
>>  	if (ret)
>>  		goto err_kfree;
>> =20
>> -	drm_mode_crtc_set_gamma_size(&crtc->base, 256);
>> -	drm_crtc_helper_add(&crtc->base, &ast_crtc_helper_funcs);
>> +	drm_mode_crtc_set_gamma_size(crtc, 256);
>> +	drm_crtc_helper_add(crtc, &ast_crtc_helper_funcs);
>> +
>>  	return 0;
>> =20
>>  err_kfree:
>> --=20
>> 2.27.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VlzPJ4DTTsE09TU00mjKiGl6u6QF8q0bF--

--GhRKmF1RyrxjogXDXUgPXENHQXtB7eJa2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7+1XMUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPI2Af5AWQoDyfox0qU9J7j2s2xnollOFGj
8c8+r/ejEYMeeS6w5AUl7vhS2dOmUwBbTEKv3lVvFt4577eRaHOHZDJ9MLkltfxT
a/xUMSIM/b/zAfFC8p8aZR932IzR/RPHX1+PTkAziOw1na/eGS//e2DId+cNdZrZ
mzYPOC4oIiJZ3h1d8EpanGZoBgFuOuyqNv9NPrjCzd3kCQps6BWxTF3fmbnHKoow
d4PwEZrF+0noLMWuRs2e+17Bf7OHwgmN+S6qvwMLQthNSvrrsma5+PHHDFo40bPU
CVb0zvqqnLVs/mybA6Z654zRVVXDABQD5CYPxzCv17a63Mxl2w2Ex77xyQ==
=49Tg
-----END PGP SIGNATURE-----

--GhRKmF1RyrxjogXDXUgPXENHQXtB7eJa2--

--===============0955156559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0955156559==--
