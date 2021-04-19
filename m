Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045C36486E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 18:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4406E40D;
	Mon, 19 Apr 2021 16:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF8C89227;
 Mon, 19 Apr 2021 15:30:45 +0000 (UTC)
Received: from Normandy.localdomain (unknown [88.129.173.226])
 (Authenticated sender: pierre.morrow@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CE72EB00593;
 Mon, 19 Apr 2021 17:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1618846243;
 bh=hTxMh/3AVmviRW4NuaHcdozpATtThaOjYz7vJa/CJ+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JRFgdJE6TDLvKwFh8j8EeE9a5Bb79jewZUMunxZBXfY3+cFwcevXnTsQxCW44krDm
 W2t9rW091wwy3KqlWQW6nf/RREwSJUVr7K7w/9LKwGp86gFkUsnNk7O04Zajlo36tR
 nhX+6kZ9cqwR3qnszxsH5vpEdjBNcbgPt5ttDRwhLyFy0zJDgDC525I64OelqtMB7G
 rUZ+KEJ2Pws0Xl2sml8v8gcG6VVyEgC47JY4VkiyKrXQ1Z0N7/6sdxNFkb2t93lzSH
 3js0kGNHGEl4Kjr4mpq54nuzQ9qxP+1MIwuRexorWpNjUnUk9mSRSGMVV0tq02YDW8
 R63mBLkm3uw9w==
Date: Mon, 19 Apr 2021 17:30:20 +0200
From: Pierre Moreau <pierre.morrow@free.fr>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix an error code in
 nouveau_backlight_init()
Message-ID: <20210419153020.kkwgc7kvg5zkhjmk@Normandy.localdomain>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <YHaEdBgqCFQRqg1B@mwanda>
MIME-Version: 1.0
In-Reply-To: <YHaEdBgqCFQRqg1B@mwanda>
X-Mailman-Approved-At: Mon, 19 Apr 2021 16:41:45 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============1744252439=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1744252439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="my3zcp46ylqrwbex"
Content-Disposition: inline


--my3zcp46ylqrwbex
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I can not remember why the original code did return 0 rather than an error,=
 but
-ENOMEM seems indeed way more fitting.

Reviewed-by: Pierre Moreau <pierre.morrow@free.fr>

On 2021-04-14 =E2=80=94 08:58, Dan Carpenter wrote:
> If nouveau_get_backlight_name() fails then this should return -ENOMEM
> but currently it returns success.
>=20
> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interface=
s")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from static analysis.  In the original commit db1a0ae21461
> ("drm/nouveau/bl: Assign different names to interfaces") then returning
> zero seemed to be a very deliberate choice.  I do think it was wrong
> though and -ENOMEM is the currect return.
>=20
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/dr=
m/nouveau/nouveau_backlight.c
> index 72f35a2babcb..3786b1c85182 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -274,6 +274,7 @@ nouveau_backlight_init(struct drm_connector *connecto=
r)
> =20
>  	if (!nouveau_get_backlight_name(backlight_name, bl)) {
>  		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight inte=
rface\n");
> +		ret =3D -ENOMEM;
>  		goto fail_alloc;
>  	}
> =20
> --=20
> 2.30.2
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--my3zcp46ylqrwbex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR/JmlivLpJL9Gbvb06GdGs4t/H/gUCYH2iDAAKCRA6GdGs4t/H
/uSvAQDcmak9o1JNcYSU2PrWd6XA6bO+q89J8zAUxMcCwqYXWwD/Uoasi8OTWyJ3
4CeMzekcwYCGulAvpXF0S29V6IDA6wA=
=BaJ7
-----END PGP SIGNATURE-----

--my3zcp46ylqrwbex--

--===============1744252439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1744252439==--
