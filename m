Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CA17F30BA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 15:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C7910E4B5;
	Tue, 21 Nov 2023 14:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838E910E4B5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 14:29:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F4A76000D;
 Tue, 21 Nov 2023 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1700576955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MxWe3zt1b36C0+KRQ6v8yf2cKpPI8F5PGpIu/HRQudw=;
 b=R0Rce0aGsk7OBhkV4DtVZCNxc0YAWubhv6MR2/9305gOTIc7x7K6CnqDksnIQonEpFI/YV
 bwk0gt1ppAa3LYgMB70R38ko58FQIVHvDI7Qt3fj2JElY3Pm6JDnwLWW0PqbUS7yST3Y6W
 izyaHzgQ6VvClwtrJRAZIfw3nj46btr5DyczR95Y+sf7M6Ek+bYuCL5PrU7tRTc5X4N5ja
 DE96YFQkNOKHqv8neYgoM8FBBOWew7MS2hiwn1GGYF1Mzbhnk+vkbbSurgvDy7+HDMRRgE
 C85DZvFHMWqMyY5DpEhtGvgAjTyMCvZyHphbcOJCHd9CCV+AhXFvPCFa16/OIg==
Date: Tue, 21 Nov 2023 15:29:14 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/logicvc: Avoid possible overflow in layer buffer
 setup variables
Message-ID: <ZVy-uuMnNktDnepS@aptenodytes>
References: <20231025130946.119957-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Maw3DNwEx0ys9J+Y"
Content-Disposition: inline
In-Reply-To: <20231025130946.119957-1-paul.kocialkowski@bootlin.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Maw3DNwEx0ys9J+Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks,

On Wed 25 Oct 23, 15:09, Paul Kocialkowski wrote:
> The buffer_sel, voffset and hoffset values are calculated from u32
> values and might overflow under certain conditions.
>=20
> Move them to u32 definitions instead of u8/u16 to avoid the issue.

Any chance to get a quick review on this simple fixup (and the next one)?
I can certainly push them myself after that.

Thanks,

Paul

> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller=
")
> ---
>  drivers/gpu/drm/logicvc/logicvc_layer.c | 6 +++---
>  drivers/gpu/drm/logicvc/logicvc_layer.h | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/lo=
gicvc/logicvc_layer.c
> index 464000aea765..eea22379d042 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_layer.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> @@ -268,9 +268,9 @@ int logicvc_layer_buffer_find_setup(struct logicvc_dr=
m *logicvc,
>  	u32 layer_stride =3D layer_bytespp * logicvc->config.row_stride;
>  	u32 base_offset =3D layer->config.base_offset * layer_stride;
>  	u32 buffer_offset =3D layer->config.buffer_offset * layer_stride;
> -	u8 buffer_sel =3D 0;
> -	u16 voffset =3D 0;
> -	u16 hoffset =3D 0;
> +	u32 buffer_sel =3D 0;
> +	u32 voffset =3D 0;
> +	u32 hoffset =3D 0;
>  	phys_addr_t fb_addr;
>  	u32 fb_offset;
>  	u32 gap;
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.h b/drivers/gpu/drm/lo=
gicvc/logicvc_layer.h
> index 4a4b02e9b819..a06feeda3abf 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_layer.h
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.h
> @@ -18,9 +18,9 @@
>  #define LOGICVC_LAYER_ALPHA_PIXEL		1
> =20
>  struct logicvc_layer_buffer_setup {
> -	u8 buffer_sel;
> -	u16 voffset;
> -	u16 hoffset;
> +	u32 buffer_sel;
> +	u32 voffset;
> +	u32 hoffset;
>  };
> =20
>  struct logicvc_layer_config {
> --=20
> 2.42.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Maw3DNwEx0ys9J+Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVcvroACgkQ3cLmz3+f
v9G7cgf/dc7VF8HvefPTOkiRgDycHW6ArFSDEgPMQQ4BCvllErH3T9aoTJwBsi2q
tiSh7ZZJ2aJluhTVjUaI5zdDmBovpfU0Lx/sRpiqkwCh4Qx/L/p/KULzlsTjE8Sf
rrutaDzSQ/zd6f5TIwEdZyX67JNzbyCNcXwckKlGTtBOpb9XwyjYxZNZ5+nEuxG5
2KYIUZaw7QNNH4PkQucFi1bZyaZfTjQwvI31JFTcwFGZkWm1VbZnz7EHaiQ4bqNb
HETWwejxIN0IgCdpjdoMOmo1rTJzE5CjUzRDveUdpIKB68+1ytKDBJwtdPSDhLtH
TAmkFajL5HYsJcgd/xcy4Ycxw/6EgA==
=5TT0
-----END PGP SIGNATURE-----

--Maw3DNwEx0ys9J+Y--
