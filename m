Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F384B56F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 13:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BD910E52F;
	Tue,  6 Feb 2024 12:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmoFJyv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5589E10E52F;
 Tue,  6 Feb 2024 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707223179; x=1738759179;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ra/xUfbSKYDM5fd6fzYePv8MQqb5eTjtRhASrDYHMgk=;
 b=KmoFJyv7XEikwQ3g4n2ANiR/75rEaGMhy4QnkZh507tuU+unbh86pN2r
 ap4w7pKKjdLkaBTV/7qSEHABFsw44q7TZqiP6xADwGrbE4Gf3ULJqjEO7
 4lx8WvQyh1c8FJ0GDZ0YyiV0Bym2MHoTFUd2PkiwW5DrSmB8Uwq5nZWQk
 q/ceUPgiyKlkwcFhv5sPw3RCQkrs8KbAorIymvWgRwtM+KdoSIIIVlInU
 efIVL7Dm6rA+Jp29amYizmyvw8pSqpUhBrqvFVNSBODEC1SHowtx+ppDt
 xr4ny3AsV14GtHN+hJKM4A/DLgPob21BAc/ZDZSC8b5b4wlOaYgDNPwkV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="900869"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="900869"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5631089"
Received: from mstribae-mobl.ger.corp.intel.com (HELO [10.249.254.52])
 ([10.249.254.52])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:39:31 -0800
Message-ID: <f9a027765a3c65c69c2d49cf2964fe1155e914f4.camel@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Tue, 06 Feb 2024 13:39:28 +0100
In-Reply-To: <20240206122822.12a2df89@canb.auug.org.au>
References: <20240206122822.12a2df89@canb.auug.org.au>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
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

Hi

On Tue, 2024-02-06 at 12:28 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
>=20
> Caused by commit
>=20
> =C2=A0 a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
>=20
> interacting with commit
>=20
> =C2=A0 dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>=20
> (and maybe others) from Linus' tree (v6.8-rc1).
>=20
> I have applied the following merge fix patch for today.=C2=A0 This makes
> it build,
> but more is likely needed ...

There was a manual fixup for the drm-misc-next merge into drm-tip that
did the right thing here.

How do we ensure these are included into the linux-next builds?

Thanks,
Thomas



>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 6 Feb 2024 12:21:07 +1100
> Subject: [PATCH] fix up for "drm/ttm: replace busy placement with
> flags v6"
>=20
> interacting with commit
>=20
> =C2=A0 dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 11 -----------
> =C2=A01 file changed, 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 0b0e262e2166..280dbda8ae5a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -38,8 +38,6 @@ static const struct ttm_place sys_placement_flags =3D
> {
> =C2=A0static struct ttm_placement sys_placement =3D {
> =C2=A0	.num_placement =3D 1,
> =C2=A0	.placement =3D &sys_placement_flags,
> -	.num_busy_placement =3D 1,
> -	.busy_placement =3D &sys_placement_flags,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct ttm_place tt_placement_flags =3D {
> @@ -52,8 +50,6 @@ static const struct ttm_place tt_placement_flags =3D
> {
> =C2=A0static struct ttm_placement tt_placement =3D {
> =C2=A0	.num_placement =3D 1,
> =C2=A0	.placement =3D &tt_placement_flags,
> -	.num_busy_placement =3D 1,
> -	.busy_placement =3D &sys_placement_flags,
> =C2=A0};
> =C2=A0
> =C2=A0bool mem_type_is_vram(u32 mem_type)
> @@ -230,8 +226,6 @@ static int __xe_bo_placement_for_flags(struct
> xe_device *xe, struct xe_bo *bo,
> =C2=A0	bo->placement =3D (struct ttm_placement) {
> =C2=A0		.num_placement =3D c,
> =C2=A0		.placement =3D bo->placements,
> -		.num_busy_placement =3D c,
> -		.busy_placement =3D bo->placements,
> =C2=A0	};
> =C2=A0
> =C2=A0	return 0;
> @@ -251,7 +245,6 @@ static void xe_evict_flags(struct
> ttm_buffer_object *tbo,
> =C2=A0		/* Don't handle scatter gather BOs */
> =C2=A0		if (tbo->type =3D=3D ttm_bo_type_sg) {
> =C2=A0			placement->num_placement =3D 0;
> -			placement->num_busy_placement =3D 0;
> =C2=A0			return;
> =C2=A0		}
> =C2=A0
> @@ -1353,8 +1346,6 @@ static int __xe_bo_fixed_placement(struct
> xe_device *xe,
> =C2=A0	bo->placement =3D (struct ttm_placement) {
> =C2=A0		.num_placement =3D 1,
> =C2=A0		.placement =3D place,
> -		.num_busy_placement =3D 1,
> -		.busy_placement =3D place,
> =C2=A0	};
> =C2=A0
> =C2=A0	return 0;
> @@ -2112,9 +2103,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32
> mem_type)
> =C2=A0
> =C2=A0	xe_place_from_ttm_type(mem_type, &requested);
> =C2=A0	placement.num_placement =3D 1;
> -	placement.num_busy_placement =3D 1;
> =C2=A0	placement.placement =3D &requested;
> -	placement.busy_placement =3D &requested;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Stolen needs to be handled like below VRAM handling if we
> ever need
> --=20
> 2.43.0
>=20

