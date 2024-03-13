Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7455D87A495
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 10:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAE210F71E;
	Wed, 13 Mar 2024 09:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLU8LV+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5250F10F71E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710320772; x=1741856772;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Uy2Tj9ngzUijuTMtncQohayNkXLGtU2Pk6FSX9TAi6c=;
 b=TLU8LV+GuYXIzCTQiG6v6MC3IABuN4x3yqIWWlF7mCwCTBO+YlThbal/
 ewuB7fXQE+mwBJ1SpG8vbgxHTWqX+u1FcHnJ/Kr9XEAd9v5ttmnClAXnT
 sUf9+iO3QAoKr/Gmp8YUqXjpSdjQ0+UssWhS6Mu8Q0Zr3sALbdpiOATfv
 jHAoF9BZvSWeTl6ycMkY5vYUfR0jKbQQiyV6+ZV2QQL/9kfQ+jOP4gGXz
 YA8uGha9UsYTdrSfepN8oc8exb3XV3K/WWFfLNikXH+XG3dCsu/T4ouV3
 oK1FDX0IybrK3QK8ABJrFkPil6eZtsQCptz8j1FNiUzZd80rojICc1nc7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="15708110"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="15708110"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 02:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16419088"
Received: from janlundk-mobl.ger.corp.intel.com (HELO [10.249.254.162])
 ([10.249.254.162])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 02:06:10 -0700
Message-ID: <63855bd4bd3504367108f0ef94cae3798183a776.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: warn when resv objs are mixed in a bulk_move
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org
Date: Wed, 13 Mar 2024 10:06:08 +0100
In-Reply-To: <20240312105555.3065-1-christian.koenig@amd.com>
References: <20240312105555.3065-1-christian.koenig@amd.com>
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

On Tue, 2024-03-12 at 11:55 +0100, Christian K=C3=B6nig wrote:
> The BOs in a bulk move must share all the same reservation object
> to make sure that we lock the whole bulk during eviction.
>=20
> Actually document and enforce that with a warning.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Tested with Xe CI,

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>





> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_resource.c | 1 +
> =C2=A0include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A02 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> b/drivers/gpu/drm/ttm/ttm_resource.c
> index 65155f2013ca..be8d286513f9 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -105,6 +105,7 @@ static void ttm_lru_bulk_move_add(struct
> ttm_lru_bulk_move *bulk,
> =C2=A0		pos->first =3D res;
> =C2=A0		pos->last =3D res;
> =C2=A0	} else {
> +		WARN_ON(pos->first->bo->base.resv !=3D res->bo-
> >base.resv);
> =C2=A0		ttm_lru_bulk_move_pos_tail(pos, res);
> =C2=A0	}
> =C2=A0}
> diff --git a/include/drm/ttm/ttm_resource.h
> b/include/drm/ttm/ttm_resource.h
> index 7561023db43d..69769355139f 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -251,6 +251,9 @@ struct ttm_lru_bulk_move_pos {
> =C2=A0 *
> =C2=A0 * Container for the current bulk move state. Should be used with
> =C2=A0 * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
> + * All BOs in a bulk_move structure need to share the same
> reservation object to
> + * ensure that the bulk as a whole is locked for eviction even if
> only one BO of
> + * the bulk is evicted.
> =C2=A0 */
> =C2=A0struct ttm_lru_bulk_move {
> =C2=A0	struct ttm_lru_bulk_move_pos
> pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];

