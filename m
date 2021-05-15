Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A53818A8
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 14:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D846E108;
	Sat, 15 May 2021 12:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DD06E11E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 12:08:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A54DAF59;
 Sat, 15 May 2021 12:08:23 +0000 (UTC)
Subject: Re: [PATCH] drm: simpledrm: fix a potential NULL dereference
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
References: <YJ+aC47XX58ICXax@mwanda>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1bdf5216-7503-71ca-f8c2-4bd55d110d87@suse.de>
Date: Sat, 15 May 2021 14:08:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJ+aC47XX58ICXax@mwanda>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="a2edGrlxnKaXkBgRndnK8RuD8ns712nVp"
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--a2edGrlxnKaXkBgRndnK8RuD8ns712nVp
Content-Type: multipart/mixed; boundary="cZnVOTFPw6EFZYAsyug9zYdv4zPapUC7s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Message-ID: <1bdf5216-7503-71ca-f8c2-4bd55d110d87@suse.de>
Subject: Re: [PATCH] drm: simpledrm: fix a potential NULL dereference
References: <YJ+aC47XX58ICXax@mwanda>
In-Reply-To: <YJ+aC47XX58ICXax@mwanda>

--cZnVOTFPw6EFZYAsyug9zYdv4zPapUC7s
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 15.05.21 um 11:53 schrieb Dan Carpenter:
> The drm_format_info() function returns NULL if the format is
> unsupported, but the simplefb_get_validated_format() is expected to
> return error pointers.  If we propagate teh NULL return then it will
> lead to a NULL dereference in the callers.  Swap the NULL and trade it
> in for an ERR_PTR(-EINVAL).

Thank you. I've added the patch to drm-misc-next.

Best regards
Thomas

>=20
> Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/tiny/simpledrm.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/si=
mpledrm.c
> index f72ca3a1c2d4..4f605c5fe856 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -72,6 +72,7 @@ simplefb_get_validated_format(struct drm_device *dev,=20
const char *format_name)
>   	static const struct simplefb_format formats[] =3D SIMPLEFB_FORMATS;
>   	const struct simplefb_format *fmt =3D formats;
>   	const struct simplefb_format *end =3D fmt + ARRAY_SIZE(formats);
> +	const struct drm_format_info *info;
>  =20
>   	if (!format_name) {
>   		drm_err(dev, "simplefb: missing framebuffer format\n");
> @@ -79,8 +80,12 @@ simplefb_get_validated_format(struct drm_device *dev=
, const char *format_name)
>   	}
>  =20
>   	while (fmt < end) {
> -		if (!strcmp(format_name, fmt->name))
> -			return drm_format_info(fmt->fourcc);
> +		if (!strcmp(format_name, fmt->name)) {
> +			info =3D drm_format_info(fmt->fourcc);
> +			if (!info)
> +				return ERR_PTR(-EINVAL);
> +			return info;
> +		}
>   		++fmt;
>   	}
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cZnVOTFPw6EFZYAsyug9zYdv4zPapUC7s--

--a2edGrlxnKaXkBgRndnK8RuD8ns712nVp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCfubYFAwAAAAAACgkQlh/E3EQov+DO
bQ//Z/v3WC/Mu+3IHlG3XzTn7MpfzR0Xgyh0Qiaz3/vlOMGWwfNzG3ZWwKfS8sPa7wglcYvoXYg4
ycWZlFcMgIYI5iwhwtqnH+hhDjAhSQ6hV2+TdPAh5EzJJF7zlMBbmdKRQBLz2JB3kBF6Ci0cWfW/
g5t9Q7v8VIv+Vgl48Vi+OijYpJMz8MzrmrZ0CrMvjRG1NzVAshh/om1F4iHA2SSmMrVTIpYK2KBA
iesvvyPcaVUv/85ViR6kX+Y5RCJh7z4Y3DYsXhEC79JAQmawthtFQaAfgKCC2KzW/paAIq8r9oqM
B8Tv9aVepzswIJlImZ/iT22PAqgbwnL4DEW6srcwpbaQWXO8FpcUicXhxQl1z3B8+cwPilCO0cUC
PO2punVOrYun7kh41M8ihRn2mif/X5DO4+hbqa3QLEbMLRgSlGyoDj+Mi6GhWfuWeMKDKKWcIbu8
eCO8V8j5o90qOblJI4qn1D0/5ZE7aQVZLCrEpTPRLRe7JDRokNZk72wwMVLYR7NaKv+v2Q4U87Y3
qhgMtpk0rp/m3DxhDUrBNyoFpz3JqkK9o+mE/wR8KRnzdD/KTCXzHyIqf7gHyJ+ziPh0YpCTnqyw
0HEliv+mczy2X5/XmUx4aY97dVOhuGbrKPJxP31bzG0kv25B2R4oMAIvayfb3LqozUfVnV9vTmZL
+qQ=
=bSHB
-----END PGP SIGNATURE-----

--a2edGrlxnKaXkBgRndnK8RuD8ns712nVp--
