Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DD305D66
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 14:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F8F6E138;
	Wed, 27 Jan 2021 13:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187086E47E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:41:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8AB5ABDA;
 Wed, 27 Jan 2021 13:40:58 +0000 (UTC)
Subject: Re: [PATCH 10/12] drm/ast: Fix cursor BO pinning and mapping
To: airlied@redhat.com, daniel@ffwll.ch
References: <20210127120302.13532-1-tzimmermann@suse.de>
 <20210127120302.13532-11-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3cdca7e9-c86b-facd-b634-7cb52f61c287@suse.de>
Date: Wed, 27 Jan 2021 14:40:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127120302.13532-11-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1438616374=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1438616374==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Gs5KIv6Msgh2WTst6cDq5FvMmLmHUx1qz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Gs5KIv6Msgh2WTst6cDq5FvMmLmHUx1qz
Content-Type: multipart/mixed; boundary="1d9OCAwy5ibFRFPjl8qIY1vY466Ha9FqN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <3cdca7e9-c86b-facd-b634-7cb52f61c287@suse.de>
Subject: Re: [PATCH 10/12] drm/ast: Fix cursor BO pinning and mapping
References: <20210127120302.13532-1-tzimmermann@suse.de>
 <20210127120302.13532-11-tzimmermann@suse.de>
In-Reply-To: <20210127120302.13532-11-tzimmermann@suse.de>

--1d9OCAwy5ibFRFPjl8qIY1vY466Ha9FqN
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 27.01.21 um 13:03 schrieb Thomas Zimmermann:
> GEM vmap operations are not allowed in commit tail. Therefore, we canno=
t
> map the cursor source BO in atomic_update. Instead do this in prepare_f=
b.
> There was no pin operation for the BO, so add this as well.

Reviewing drm_gem_vram_vmap() I saw that is pins implicitly. I'll remove =

the pinning from the driver code in the patch's next iteration.

>=20
> Hence the cursor source BO is now mapped while it's being displayed. Th=
e
> change will allow us to move all cursor damage handling from prepare_fb=

> to atomic_update.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 37 +++++++++++++++++++++++++++++++--=
-
>   1 file changed, 34 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index 199ad9f9c932..192d3d34b9ed 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -751,6 +751,10 @@ static void ast_set_cursor_enabled(struct ast_priv=
ate *ast, bool enabled)
>  =20
>   struct ast_cursor_plane_state {
>   	struct drm_plane_state base;
> +
> +	/* Transitional state - do not export or duplicate */
> +
> +	struct dma_buf_map map;
>   };
>  =20
>   static inline struct ast_cursor_plane_state *
> @@ -771,6 +775,7 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane=
 *plane,
>   	struct drm_framebuffer *fb =3D new_state->fb;
>   	struct dma_buf_map dst_map =3D
>   		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
> +	struct ast_cursor_plane_state *new_ast_state =3D to_ast_cursor_plane_=
state(new_state);
>   	struct drm_gem_vram_object *src_gbo;
>   	struct dma_buf_map src_map;
>   	void __iomem *dst;
> @@ -782,9 +787,13 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plan=
e *plane,
>  =20
>   	src_gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>  =20
> -	ret =3D drm_gem_vram_vmap(src_gbo, &src_map);
> +	ret =3D drm_gem_vram_pin(src_gbo, 0);
>   	if (ret)
>   		return ret;
> +
> +	ret =3D drm_gem_vram_vmap(src_gbo, &src_map);
> +	if (ret)
> +		goto err_drm_gem_vram_unpin;
>   	src =3D src_map.vaddr; /* TODO: Use mapping abstraction properly */
>  =20
>   	dst =3D dst_map.vaddr_iomem; /* TODO: Use mapping abstraction proper=
ly */
> @@ -792,9 +801,31 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plan=
e *plane,
>   	/* do data transfer to cursor BO */
>   	ast_update_cursor_image(dst, src, fb->width, fb->height);
>  =20
> -	drm_gem_vram_vunmap(src_gbo, &src_map);
> +	new_ast_state->map =3D src_map;
>  =20
>   	return 0;
> +
> +err_drm_gem_vram_unpin:
> +	drm_gem_vram_unpin(src_gbo);
> +	return ret;
> +}
> +
> +static void ast_cursor_plane_helper_cleanup_fb(struct drm_plane *plane=
,
> +					       struct drm_plane_state *old_state)
> +{
> +	struct ast_cursor_plane_state *old_ast_state =3D to_ast_cursor_plane_=
state(old_state);
> +	struct drm_framebuffer *fb =3D old_state->fb;
> +	struct drm_gem_vram_object *gbo;
> +	struct dma_buf_map map;
> +
> +	if (!fb)
> +		return;
> +
> +	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> +	map =3D old_ast_state->map;
> +
> +	drm_gem_vram_vunmap(gbo, &map);
> +	drm_gem_vram_unpin(gbo);
>   }
>  =20
>   static int ast_cursor_plane_helper_atomic_check(struct drm_plane *pla=
ne,
> @@ -899,7 +930,7 @@ ast_cursor_plane_helper_atomic_disable(struct drm_p=
lane *plane,
>  =20
>   static const struct drm_plane_helper_funcs ast_cursor_plane_helper_fu=
ncs =3D {
>   	.prepare_fb =3D ast_cursor_plane_helper_prepare_fb,
> -	.cleanup_fb =3D NULL, /* not required for cursor plane */
> +	.cleanup_fb =3D ast_cursor_plane_helper_cleanup_fb,
>   	.atomic_check =3D ast_cursor_plane_helper_atomic_check,
>   	.atomic_update =3D ast_cursor_plane_helper_atomic_update,
>   	.atomic_disable =3D ast_cursor_plane_helper_atomic_disable,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--1d9OCAwy5ibFRFPjl8qIY1vY466Ha9FqN--

--Gs5KIv6Msgh2WTst6cDq5FvMmLmHUx1qz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmARbWkFAwAAAAAACgkQlh/E3EQov+DN
4xAAx2UR3G9Ab8wg/BiLo+BwVj6wP9TYK02NCgxsX5vH6Kz05KjHgkBbmfwhItUxoX4vyXc0TMhw
MvKsnPk8IYo479SYnPkRPtPn2HOWuwB3qt09cZz2m/6PImaYZeVZ3Z/9A5nRJJ9lheY90mIE4s6T
Q/ym9sicFhPKSooeNppiDqI+XjKEizP3MYCrFkiNm7LjRkYxK79DyMRbZ1hy5/F6OYMMAkqU3CmS
gv/h+WcNQ+KOpXOWgoqJYRAW5RNmqV80Cqzgu8oK3olfOZ5rQgobhyi1w0bVHzYGCOH1oX47+PJS
g42XW+ULJXOIFQK4XytAygMOXfxndwmwqdyHhiUibSSvI91tUZQdxdGFguFWOU4zCs46TAXJtpcl
bOix1WXmIvbXoCrgaIh4EB+5HAL/bj5HhHeu8wMvHgrnA/UkR7zCc5uj5Xw8yXZIBJsEtjekJF6L
f2rMfMIM5NLEQx5XcH50E23YQtVO1ocp2KXTwuETmrqifw9cEo/as/pzgNy2TX+O8x1DiMnJEx/r
PWQ+cgJbHhybS93YOmrEZFXnQl0fnlQeu9j1QPnFxEm+dO9q8XApYkkyfPYbe3/IEsbVN2MyWHQ9
qc1bSrH+iY+wAMPlzGuoLIUzllnBaSNR4FNDN8nv2B/xNHRyiB8HWE9jG7fKnMMywC1fjjjjgoUQ
bLQ=
=vThB
-----END PGP SIGNATURE-----

--Gs5KIv6Msgh2WTst6cDq5FvMmLmHUx1qz--

--===============1438616374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1438616374==--
