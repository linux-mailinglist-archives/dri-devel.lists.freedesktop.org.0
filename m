Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB39D158998
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 06:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEB46ED9F;
	Tue, 11 Feb 2020 05:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE6D6ED9F;
 Tue, 11 Feb 2020 05:28:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63B40ADE4;
 Tue, 11 Feb 2020 05:28:52 +0000 (UTC)
Subject: Re: [PATCH] drm/nouveau: Fix NULL ptr access in nv50_wndw_prepare_fb()
To: James Jones <jajones@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20200210230943.2874-1-jajones@nvidia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <d40e1738-f313-e84d-8d4c-af5efd60aa93@suse.de>
Date: Tue, 11 Feb 2020 06:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210230943.2874-1-jajones@nvidia.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1323173028=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1323173028==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OoueAXJCEkTFSJ8tULKXQ8oe6omqc1UID"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OoueAXJCEkTFSJ8tULKXQ8oe6omqc1UID
Content-Type: multipart/mixed; boundary="q59L1jm9NiShTNrr1fzrvV1anlZz1XX7N";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: James Jones <jajones@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <d40e1738-f313-e84d-8d4c-af5efd60aa93@suse.de>
Subject: Re: [PATCH] drm/nouveau: Fix NULL ptr access in
 nv50_wndw_prepare_fb()
References: <20200210230943.2874-1-jajones@nvidia.com>
In-Reply-To: <20200210230943.2874-1-jajones@nvidia.com>

--q59L1jm9NiShTNrr1fzrvV1anlZz1XX7N
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

I'm surprised that prepare_fb is called with fb =3D=3D NULL. But, OK

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the fix.

Am 11.02.20 um 00:09 schrieb James Jones:
> This fixes a kernel oops when loading the nouveau
> module with fb console enabled after the change:
>=20
>   drm/nouveau: Remove field nvbo from struct nouveau_framebuffer
>=20
> state->fb may be NULL in nv50_wndw_prepare_fb(),
> so defer initializing nvbo from its obj[] array
> until after the NULL check.
>=20
> Signed-off-by: James Jones <jajones@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/=
nouveau/dispnv50/wndw.c
> index 4a67a656e007..68c0dc2dc2d3 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -490,7 +490,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struc=
t drm_plane_state *state)
>  	struct nouveau_drm *drm =3D nouveau_drm(plane->dev);
>  	struct nv50_wndw *wndw =3D nv50_wndw(plane);
>  	struct nv50_wndw_atom *asyw =3D nv50_wndw_atom(state);
> -	struct nouveau_bo *nvbo =3D nouveau_gem_object(fb->obj[0]);
> +	struct nouveau_bo *nvbo;
>  	struct nv50_head_atom *asyh;
>  	struct nv50_wndw_ctxdma *ctxdma;
>  	int ret;
> @@ -499,6 +499,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struc=
t drm_plane_state *state)
>  	if (!asyw->state.fb)
>  		return 0;
> =20
> +	nvbo =3D nouveau_gem_object(fb->obj[0]);
>  	ret =3D nouveau_bo_pin(nvbo, TTM_PL_FLAG_VRAM, true);
>  	if (ret)
>  		return ret;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--q59L1jm9NiShTNrr1fzrvV1anlZz1XX7N--

--OoueAXJCEkTFSJ8tULKXQ8oe6omqc1UID
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5CO5MACgkQaA3BHVML
eiMlHgf/Q3a58ZaiLehyXAfLIa14LRPUa/o5uy6q9Sy0kyZW0JlXz04uXIJJoPt3
RMAs5HTPXFqj0sAIzJTKrvmJ9xl4ZdTX87bsS5DCNa1haM35crTVuCiYDD+LJqUq
l+pYiWxRwflYbUY6jIEpXntKobWXxCO882ZvhNRchRutv+0XL2diRAyabySZezQL
l3Mub00bkQCalPukRjheun4Wmy63jqdwU/gssJsiJ8CUg8zy+7eXvPm6NXMN+vvm
HYYGl1aWQGOTQ/X1XMVxWKwZ/yawRF+Yxkdfw/2d7K/mmjOYNa/CpFfTWh7yezWi
w6l0kDkZescLLqroO4i5cVGUPuRwlw==
=YB2F
-----END PGP SIGNATURE-----

--OoueAXJCEkTFSJ8tULKXQ8oe6omqc1UID--

--===============1323173028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1323173028==--
