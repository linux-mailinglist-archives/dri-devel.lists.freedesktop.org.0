Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B632B609
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 09:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6F389DC7;
	Wed,  3 Mar 2021 08:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7046389D2F;
 Wed,  3 Mar 2021 08:49:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC915ADCD;
 Wed,  3 Mar 2021 08:49:05 +0000 (UTC)
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
To: Oak Zeng <Oak.Zeng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cff35ce0-3ad1-cc4a-f6ec-d423a913d0bc@suse.de>
Date: Wed, 3 Mar 2021 09:49:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
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
Cc: jinhuieric.huang@amd.com, Alexander.Deucher@amd.com, Felix.Kuehling@amd.com,
 harish.kasiviswanathan@amd.com, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0549613316=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0549613316==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dcEG8TOKxco0taAtcCSxKMHSJLqkijiUp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dcEG8TOKxco0taAtcCSxKMHSJLqkijiUp
Content-Type: multipart/mixed; boundary="aNIX8VNiYpN8Xoxy5IQ4HTz0OODmtpS9G";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Oak Zeng <Oak.Zeng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Felix.Kuehling@amd.com, harish.kasiviswanathan@amd.com,
 christian.koenig@amd.com, jinhuieric.huang@amd.com, Alexander.Deucher@amd.com
Message-ID: <cff35ce0-3ad1-cc4a-f6ec-d423a913d0bc@suse.de>
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
References: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>

--aNIX8VNiYpN8Xoxy5IQ4HTz0OODmtpS9G
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.03.21 um 23:43 schrieb Oak Zeng:
> If tbo.mem.bus.caching is cached, buffer is intended to be mapped
> as cached from CPU. Map it with ioremap_cache.

Just a question for my understanding: This is on-device memory?=20
Accessing device memory is usually slow. If that memory can be mapped=20
with CPU caching enabled, access will roughly be as fast as for system=20
memory?

Best regards
Thomas

>=20
> This wasn't necessary before as device memory was never mapped
> as cached from CPU side. It becomes necessary for aldebaran as
> device memory is mapped cached from CPU.
>=20
> Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
> Reviewed-by: Christian Konig <Christian.Koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/tt=
m_bo_util.c
> index 031e581..8c65a13 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -91,6 +91,8 @@ static int ttm_resource_ioremap(struct ttm_device *bd=
ev,
>  =20
>   		if (mem->bus.caching =3D=3D ttm_write_combined)
>   			addr =3D ioremap_wc(mem->bus.offset, bus_size);
> +		else if (mem->bus.caching =3D=3D ttm_cached)
> +			addr =3D ioremap_cache(mem->bus.offset, bus_size);
>   		else
>   			addr =3D ioremap(mem->bus.offset, bus_size);
>   		if (!addr) {
> @@ -372,6 +374,9 @@ static int ttm_bo_ioremap(struct ttm_buffer_object =
*bo,
>   		if (mem->bus.caching =3D=3D ttm_write_combined)
>   			map->virtual =3D ioremap_wc(bo->mem.bus.offset + offset,
>   						  size);
> +		else if (mem->bus.caching =3D=3D ttm_cached)
> +			map->virtual =3D ioremap_cache(bo->mem.bus.offset + offset,
> +						  size);
>   		else
>   			map->virtual =3D ioremap(bo->mem.bus.offset + offset,
>   					       size);
> @@ -490,6 +495,9 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struc=
t dma_buf_map *map)
>   		else if (mem->bus.caching =3D=3D ttm_write_combined)
>   			vaddr_iomem =3D ioremap_wc(mem->bus.offset,
>   						 bo->base.size);
> +		else if (mem->bus.caching =3D=3D ttm_cached)
> +			vaddr_iomem =3D ioremap_cache(mem->bus.offset,
> +						  bo->base.size);
>   		else
>   			vaddr_iomem =3D ioremap(mem->bus.offset, bo->base.size);
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--aNIX8VNiYpN8Xoxy5IQ4HTz0OODmtpS9G--

--dcEG8TOKxco0taAtcCSxKMHSJLqkijiUp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA/TYAFAwAAAAAACgkQlh/E3EQov+CV
PA/+LVBESRFQtJN31l4xUHdHuDu95V7TGVGaqWrqgs9tHGzJlg3QMPSyYlMvNC6HfuS6wXpH23vY
oIY+RbucoFXYgHwD2unDt9SYGKf8xZdnpesmPAP4Jh6mEjgrJgXA6RanfN66oo4m48ZYfvQAR7zF
y0c0nQyY9oW6cyC07DBJyFjLyDIhlNaz4qMo1mm5utvIjaONAgyPiv1YjMVp649vSKNtTt23Tvxx
Xz3bbOkVx5YZrU3tolSEStCTLzh2FAnMGcy+9TdBMF4HQxe4b/HM6d4NiPYjhYmJc0Rp2VuEQz/U
HgmHdRLBDYl0uu+wvzMhXShm9ixe9hH8bo9PHvjVqhMf48qFYmuq+KuUbVJUIxXaZ4y4yo8kPxYN
RFNFF4ozOAU5GEY17LD2KXOVxx7MoWqHgBY5XnPel5fVlijCcKH/Zxva05JXORzsMWPHiHBfahhf
6TKBKRl/D/oZ8vlpmGbgaaivDdiUv0Kzu/mvExOVm/xvswHrsEICvoQXwYDkPeIrRUuzq6jzI9TJ
wTHt/aXprUb/ZcUG4S6esnKcuZHv+75YBpMsbySRbIYK+I6pnOq0vb86+Sm1PlV1sReuXCIL/o4s
9SLuSFSzdu5otZoBJz79wyfURCx6OC3CJVXr7lcQj+Dbx/4mlus/DAYY6EWf9gyrk4Yx4EOBfY1l
Co0=
=WSqr
-----END PGP SIGNATURE-----

--dcEG8TOKxco0taAtcCSxKMHSJLqkijiUp--

--===============0549613316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0549613316==--
