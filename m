Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B0530FB4C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADAA6E123;
	Thu,  4 Feb 2021 18:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59B66E123
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:28:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B15DAC45;
 Thu,  4 Feb 2021 18:27:59 +0000 (UTC)
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20210204181756.109549-1-colin.king@canonical.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: make a const array static, makes object
 smaller
Message-ID: <9e979113-1b38-66e5-efe7-8bef22087117@suse.de>
Date: Thu, 4 Feb 2021 19:27:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204181756.109549-1-colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0774506912=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0774506912==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FpOESbSdYx0dqA2LtKG8SO3T02tTbekVw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FpOESbSdYx0dqA2LtKG8SO3T02tTbekVw
Content-Type: multipart/mixed; boundary="I99QvtZ93b7MT1gv8uK1TeHqhr6sWOiWb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <9e979113-1b38-66e5-efe7-8bef22087117@suse.de>
Subject: Re: [PATCH] drm/mgag200: make a const array static, makes object
 smaller
References: <20210204181756.109549-1-colin.king@canonical.com>
In-Reply-To: <20210204181756.109549-1-colin.king@canonical.com>

--I99QvtZ93b7MT1gv8uK1TeHqhr6sWOiWb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.02.21 um 19:17 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Don't populate the const array m_div_val on the stack but instead make
> it static. Makes the object code smaller by 29 bytes:
>=20
> Before:
>     text	   data	  bss   dec    hex filename
>    34736	   4552	    0 39288   9978 drivers/gpu/drm/mgag200/mgag200_mod=
e.o
>=20
> After:
>     text	   data	  bss   dec    hex filename
>    34625	   4616	    0 39241   9949 drivers/gpu/drm/mgag200/mgag200_mod=
e.o
>=20
> (gcc version 10.2.0)
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Very nice. I'm actually surprised that the compiler doesn't figure this=20
out automatically. When I once tested this (in userspace) it did so.=20
Maybe the kernel is different?

For style reasons, I would have moved the static definition to the top=20
of the function; before the variable declarations. In any case:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

If I don't here from you, I'll merge the patch soonish.

Best regards
Thomas

> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/m=
gag200/mgag200_mode.c
> index 1dfc42170059..27f33af09798 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -712,7 +712,7 @@ static int mga_g200er_set_plls(struct mga_device *m=
dev, long clock)
>   	unsigned int p, m, n;
>   	unsigned int computed, vco;
>   	int tmp;
> -	const unsigned int m_div_val[] =3D { 1, 2, 4, 8 };
> +	static const unsigned int m_div_val[] =3D { 1, 2, 4, 8 };
>  =20
>   	m =3D n =3D p =3D 0;
>   	vcomax =3D 1488000;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--I99QvtZ93b7MT1gv8uK1TeHqhr6sWOiWb--

--FpOESbSdYx0dqA2LtKG8SO3T02tTbekVw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAcPK4FAwAAAAAACgkQlh/E3EQov+Cx
zhAAqVcT8R0Tx8DNGHI0CEr7QmJbo4UmV/vUC5eGo8TG1JAwZ9hmk++WTZa9yU8/aQnBvKcOg5vJ
zHNs9VJ7eb9NKAsXMbLFK4wv9HLhpeqVMJvawKSFpvgWopyVl8kqSiTVrIqjwdI0vHRifw7d5IPB
VGJwkwqx8tyhKzE7q5G7si3UcN/soYi/4O8DC9n8v5K01T2hKJCLH0cargbjFzCDKsn/cGw61W5w
FEVPHZO1R5r3MtE0r6Kg5dNQ9hq/dMgONWU8ss4N8fsbq7sNx4S9YIPQqAdsT2SRgPQH+1JlX/0W
sHLfNqxeXhZjoM4RefrG2ZiDF3XNPcAaZ9wC1T9Ie8GdqPLJhcyKbVSo0z5PpOxhUYk8XswPtdg0
tzTjGWk638JjvU85nE5g4y0+sF0mYntp2/JrsuSc9A8O8XgJDS/KumwZ/tppGQ5JomnL7fOao9Iw
x2HslwW1bsps1EJ/g+UlJCau4F791l2hQx3JQXE7Dp1cnWJwh4dxHpEMo01D0RcqM3XcGuC1id+B
P2FRIjH9A8ElTUgT4zCKZHvLS1czTtw6741st3FKXPT0PdFwtfhPFwtzt+Q8nVV3RcaOTWZRseG/
ONM5aptTefpTmAavlhGvwJjoNfV5limnekXDXvf9dnhE5wnVIF1VF/6XT6Zw2ebwu75Zuqi72/xp
dRM=
=Ppb5
-----END PGP SIGNATURE-----

--FpOESbSdYx0dqA2LtKG8SO3T02tTbekVw--

--===============0774506912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0774506912==--
