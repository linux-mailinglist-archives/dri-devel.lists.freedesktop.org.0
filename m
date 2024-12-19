Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D5E9F7AE9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 13:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA3810ECEE;
	Thu, 19 Dec 2024 12:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a7Tbwibe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212A610ECE9;
 Thu, 19 Dec 2024 12:03:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FB555C5F8E;
 Thu, 19 Dec 2024 12:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A7CC4CECE;
 Thu, 19 Dec 2024 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734609831;
 bh=8PH/DWN/c9/9fyd6ftKv7/M7QYHtzh3//Hu5Mz/KnLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a7TbwibeVI0NjEa8csMF5UCh16/W5N0o/IA8zcK/qH0nhrO2qQMzSTTu2TAQlrP0i
 NO4bNCKKLvBC9Dnd5P8lnnfSZN8BDFooO5XHmXspnbK6jEI4K4u/2/wXedieeBl4vu
 Je8w0fpycJY+eTP48dDWvidxUvIYtRtXsa31OjHVuuro0hQatBHp2SY4WaxnVTjlKV
 DNs4gIHh57AJt77NvCbkH1jfGfAgIg23V38c1RiLx2otTccQotVbipKeSVdeob9o1f
 hHUXWLt+2A2WMYj6ijLMuH6VtM6sgehOZOEwI4OPxbLadYDFVIJWPXhfs8BwWPyhMK
 e2Du5ncTub0bA==
Date: Thu, 19 Dec 2024 13:03:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org, 
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 4/7] drm/xe: Implement cgroup for vram
Message-ID: <20241219-banana-pudu-of-radiance-aa62db@houat>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241204134410.1161769-5-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5iyklvofd5jx5ou2"
Content-Disposition: inline
In-Reply-To: <20241204134410.1161769-5-dev@lankhorst.se>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5iyklvofd5jx5ou2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/7] drm/xe: Implement cgroup for vram
MIME-Version: 1.0

Hi Lucas, Thomas, Rodrigo,

We forgot to Cc you on this series, sorry. Could you have a look at it,
and especially the following patch?



On Wed, Dec 04, 2024 at 02:44:04PM +0100, Maarten Lankhorst wrote:
> Add vram based cgroup eviction to Xe.
> Most hardware with VRAM uses TTM for its management, and can be
> similarly trivially enabled.
>=20
> Co-developed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index c95728c45ea48..f4a16e5fa7700 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -5,6 +5,7 @@
>   */
> =20
>  #include <drm/drm_managed.h>
> +#include <drm/drm_drv.h>
> =20
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_range_manager.h>
> @@ -311,6 +312,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, str=
uct xe_ttm_vram_mgr *mgr,
>  	struct ttm_resource_manager *man =3D &mgr->manager;
>  	int err;
> =20
> +	if (mem_type !=3D XE_PL_STOLEN) {
> +		const char *name =3D mem_type =3D=3D XE_PL_VRAM0 ? "vram0" : "vram1";
> +		man->cg =3D drmm_cgroup_register_region(&xe->drm, name, size);
> +		if (IS_ERR(man->cg))
> +			return PTR_ERR(man->cg);
> +	}
> +
>  	man->func =3D &xe_ttm_vram_mgr_func;
>  	mgr->mem_type =3D mem_type;
>  	mutex_init(&mgr->lock);
> --=20
> 2.43.0
>=20

--5iyklvofd5jx5ou2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2QLpAAKCRAnX84Zoj2+
dql1AYCyzH2b+9id2ZtcdDKPRcjpVHpPPKa9YUlwBXCWZRc2Cp/OdQB0XUAnWdRP
SVvncNoBfi4EkuvuzdkaXRQICUAD2hMvKBypNAKgio0vUTBwF64j2WVhsNWAhFLR
Pj9H6miOCA==
=UMTT
-----END PGP SIGNATURE-----

--5iyklvofd5jx5ou2--
