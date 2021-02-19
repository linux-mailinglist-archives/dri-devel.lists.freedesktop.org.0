Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7AC31FA24
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 14:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755F06E02B;
	Fri, 19 Feb 2021 13:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966D16E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:54:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26A45ABAE;
 Fri, 19 Feb 2021 13:54:55 +0000 (UTC)
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20210219122203.51130-1-noralf@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
Date: Fri, 19 Feb 2021 14:54:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219122203.51130-1-noralf@tronnes.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============1788855927=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1788855927==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VOO3K2P3gvE7MHVxN2LyBmyLzKarC31W3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VOO3K2P3gvE7MHVxN2LyBmyLzKarC31W3
Content-Type: multipart/mixed; boundary="728obEepaVVEGPth4uI0iDJ0Z8o1pjALk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
References: <20210219122203.51130-1-noralf@tronnes.org>
In-Reply-To: <20210219122203.51130-1-noralf@tronnes.org>

--728obEepaVVEGPth4uI0iDJ0Z8o1pjALk
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 19.02.21 um 13:22 schrieb Noralf Tr=C3=B8nnes:
> dma-buf importing was reworked in commit 7d2cd72a9aa3
> ("drm/shmem-helpers: Simplify dma-buf importing"). Before that commit
> drm_gem_shmem_prime_import_sg_table() did set ->pages_use_count=3D1 and=

> drm_gem_shmem_vunmap_locked() could call drm_gem_shmem_put_pages()
> unconditionally. Now without the use count set, put pages is called als=
o
> on dma-bufs. Fix this by only putting pages if it's not imported.
>=20
> Fixes: 7d2cd72a9aa3 ("drm/shmem-helpers: Simplify dma-buf importing")
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

Just when I saw the error. Nice. :)

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>

For testing the GUD driver, you may also want to keep an eye at [1]

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/02a45c11-fc73-1e5a-3839-30b080950af8@am=
d.com/T/#t

> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 9825c378dfa6..c8a6547a1757 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -357,13 +357,14 @@ static void drm_gem_shmem_vunmap_locked(struct dr=
m_gem_shmem_object *shmem,
>   	if (--shmem->vmap_use_count > 0)
>   		return;
>  =20
> -	if (obj->import_attach)
> +	if (obj->import_attach) {
>   		dma_buf_vunmap(obj->import_attach->dmabuf, map);
> -	else
> +	} else {
>   		vunmap(shmem->vaddr);
> +		drm_gem_shmem_put_pages(shmem);
> +	}
>  =20
>   	shmem->vaddr =3D NULL;
> -	drm_gem_shmem_put_pages(shmem);
>   }
>  =20
>   /*
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--728obEepaVVEGPth4uI0iDJ0Z8o1pjALk--

--VOO3K2P3gvE7MHVxN2LyBmyLzKarC31W3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAvwy0FAwAAAAAACgkQlh/E3EQov+Cw
QBAAsni/I9tEq880qnT7bGPHzcHu9WQsEzDfCA52Pkjl3N/NQc1/0kSz/tOK4AEdgPbDiDEcLXB5
vpU6fVhxjrhsGT4m75uLzgwriFliNoU+HGHKaLtLqz0iqV7xwoT7XNEmveGpfmwi4ZnmBW9zircT
rmiS0hPMvOw7pgKoX3A3XpT9D4xfGM+uJU2TMgrfvdaQImM7yr2bFBv0mJCRMnKR/vNies1ZkIx5
FmU1NpmjO/6j2k6nB58uEBuuXk+XN6qnAr8ILNKQRsFIfRUnua5vH2LGocheGjx2yvIe1hwT3/RB
Aqm9ICHEVAMxhtjkVc5Q1YX0yrmpe8sYj2T5LAw8z1jyi3Vuw743wIayxNCNOoJAGKa0V17Pgv6/
GZabqTHu5+E2jokXZa7e82BJ93GMOWE/KN4ur6BVFSacLqPuBrfgAZipSTT2H/LwQwCaL0IexHeH
aEjikVb/AduqsgNcpgr1wv0Mswv4pZ5R3Fo+jGd5KhBEqF02HrYW9BxWZ1Q7rkztriOrw1gihr3w
Bj+sW6W/bt/8dl1WrZIjXxT5+4eadTgz+iyQ8xEFWgnL/SVoecRvMF8YdKntYxsPfMY494+euJ7V
wtJxXDGAw+OSu+J+6DBjGw7PlCKWYhepKZp09NL6Y9JE6w6edp6pmeLgcMGJFiF1PDRaZ9nUBJ33
A/g=
=JJMN
-----END PGP SIGNATURE-----

--VOO3K2P3gvE7MHVxN2LyBmyLzKarC31W3--

--===============1788855927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1788855927==--
