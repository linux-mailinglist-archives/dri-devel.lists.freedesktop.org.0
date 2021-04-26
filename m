Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C1536B879
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 20:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001DA6E187;
	Mon, 26 Apr 2021 18:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E17C6E187
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 18:01:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC425ADDB;
 Mon, 26 Apr 2021 18:01:23 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Fix missing conversions to managed API
To: Takashi Iwai <tiwai@suse.de>, Dave Airlie <airlied@redhat.com>
References: <20210421170458.21178-1-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3d6d6217-9c51-6722-5ac9-14134cb198b0@suse.de>
Date: Mon, 26 Apr 2021 20:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210421170458.21178-1-tiwai@suse.de>
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
Content-Type: multipart/mixed; boundary="===============0975329498=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0975329498==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nGeKBsfsR5ofbVgj9MYjajeuZCL5CpB9X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nGeKBsfsR5ofbVgj9MYjajeuZCL5CpB9X
Content-Type: multipart/mixed; boundary="gMhYV8RMTRUdtOV0oLX3FvCSeo2nOQAB8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>, Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Message-ID: <3d6d6217-9c51-6722-5ac9-14134cb198b0@suse.de>
Subject: Re: [PATCH] drm/ast: Fix missing conversions to managed API
References: <20210421170458.21178-1-tiwai@suse.de>
In-Reply-To: <20210421170458.21178-1-tiwai@suse.de>

--gMhYV8RMTRUdtOV0oLX3FvCSeo2nOQAB8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 21.04.21 um 19:04 schrieb Takashi Iwai:
> The commit 7cbb93d89838 ("drm/ast: Use managed pci functions")
> converted a few PCI accessors to the managed API and dropped the
> manual pci_iounmap() calls, but it seems to have forgotten converting
> pci_iomap() to the managed one.  It resulted in the leftover resources
> after the driver unbind.  Let's fix them.
>=20
> Fixes: 7cbb93d89838 ("drm/ast: Use managed pci functions")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Added to drm-misc-next. Thanks, Takashi.

> ---
>   drivers/gpu/drm/ast/ast_main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 0ac3c2039c4b..c29cc7f19863 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -413,7 +413,7 @@ struct ast_private *ast_device_create(const struct =
drm_driver *drv,
>  =20
>   	pci_set_drvdata(pdev, dev);
>  =20
> -	ast->regs =3D pci_iomap(pdev, 1, 0);
> +	ast->regs =3D pcim_iomap(pdev, 1, 0);
>   	if (!ast->regs)
>   		return ERR_PTR(-EIO);
>  =20
> @@ -429,7 +429,7 @@ struct ast_private *ast_device_create(const struct =
drm_driver *drv,
>  =20
>   	/* "map" IO regs if the above hasn't done so already */
>   	if (!ast->ioregs) {
> -		ast->ioregs =3D pci_iomap(pdev, 2, 0);
> +		ast->ioregs =3D pcim_iomap(pdev, 2, 0);
>   		if (!ast->ioregs)
>   			return ERR_PTR(-EIO);
>   	}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--gMhYV8RMTRUdtOV0oLX3FvCSeo2nOQAB8--

--nGeKBsfsR5ofbVgj9MYjajeuZCL5CpB9X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCG//IFAwAAAAAACgkQlh/E3EQov+Bw
7RAAhEkiyDrwC7vnNg/Dhv0iJruQLh5t6m2/IgPXqVAXFVm7fR3YWqGsQNH4TfG2I1S5XheoYybf
QzykPQ0LVEmRIQhnasUiBzz/XM+hSdmRKIob42qrHUYscjHnr076WSB+LUmoEpPfQ9yJdGP0lzko
h6fLJgjqkxC30WdMJiJvw8IOtjm5DaX0tvra2GtFFeN9p9eO/OvkA7rLwAjsvkHrX+GtJkdHnM3I
TKvosuhVPQdKmfj+hhu92Fgxzlkp705Aez6gGe1mCff3gsjAsWrOKG5mZTwUjxJ5l9Arfvc/8JjQ
A+R2JXOCDjin83IAZ0Jb3e0tEBftnOiXTk16ElKbBbopR3VIU27Th//P+Ra/DZKeXN5S01dRVOca
FormY6N99ax3Pe+zFbcwiq3/FLKk9AEYvZkeDkO53C2/NP0UDQ/e4duxCLmf0Y5oCYgCWx9dJUkl
3mDJFR2aPUGhGX5p6lk2w8xlDjK2v6AugkutKG0m2U8M1HUA0EA92IZc7UTPIlk60Co2us7chqbB
k9SED4jzG/MVEDEYoUb2WFapvoI3mTcLd51gW65AJhD6Lby/8dpDx5etm03bJTBJnQZr7pnWX3l5
mz0JFuIWxjtcEPayPgdujjJkz8H7uH5MCsl0Pgum4qnopbF7/5RlP+vA2d6a6V9zcMuaJz+zHcoA
+7U=
=GR7e
-----END PGP SIGNATURE-----

--nGeKBsfsR5ofbVgj9MYjajeuZCL5CpB9X--

--===============0975329498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0975329498==--
