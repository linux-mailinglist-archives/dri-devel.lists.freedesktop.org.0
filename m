Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C6958801
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 15:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044C510E7D5;
	Tue, 20 Aug 2024 13:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fK8z1eii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342D710E7D4;
 Tue, 20 Aug 2024 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724160827; x=1755696827;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GUDTef32w6NC9/PmUaPHd4SwljSuMc10LzU6k9qeT4Y=;
 b=fK8z1eiiTm0Uo5fMXPHVUaVd8PykApbivWa+ipzgUVbEHKxpT/UNaMKu
 KjL934FWfw5wCK4nc0QXWi3LZB0Lcjd/mm7ZO9N0crwEAhIBRe0Yry8NF
 ocGjti/7LP2p4sj+Rkg3TyZ2KC53OBfsLHsC+iXHIPbYqL37dB3KnhOvN
 z5CFiJkErIHYalJ9RaJLq1xybfi/+J6Rjo+zR7LOzTCbF2EYhi6RuyLhT
 RSijcy3n1t+QAxm6a6YL5QSwF4B8UpJVfzvOIuF52znd6XTCm3NlSk3hT
 8T0TbmoU2cZJ1OTXXgvw6pALIq6Bi6cE4RoQINeFSIozHkLcbrXlCHlM8 w==;
X-CSE-ConnectionGUID: bCjpIHtARIiRUVtNBJCzEA==
X-CSE-MsgGUID: yLzvZ46FTW2N00ct/9Yq7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33614874"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33614874"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:33:47 -0700
X-CSE-ConnectionGUID: q6lcPdq5TjeESUBRSW86Sg==
X-CSE-MsgGUID: wFFaG+C1R7q+ixiQ4ABnvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65596413"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.74])
 ([10.245.245.74])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:33:46 -0700
Message-ID: <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
Subject: Re: [PATCH v6 1/2] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 20 Aug 2024 15:33:43 +0200
In-Reply-To: <20240816135154.19678-1-nirmoy.das@intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Nirmoy, Christian

On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
> releasing backing stores if they want to skip clear-on-free.
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

What happens if two devices share the same global TTM pool
 type and one that does its own clearing. Wouldn't there be a pretty
high chance that the the device that doesn't clear its own pages
allocate non-cleared memory from the pool?

/Thomas

> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
> =C2=A0include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 +++++-
> =C2=A02 files changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> b/drivers/gpu/drm/ttm/ttm_pool.c
> index 8504dbe19c1a..935ab3cfd046 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool
> *pool, dma_addr_t dma_addr,
> =C2=A0}
> =C2=A0
> =C2=A0/* Give pages into a specific pool_type */
> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page
> *p)
> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page
> *p,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool cleared)
> =C2=A0{
> =C2=A0	unsigned int i, num_pages =3D 1 << pt->order;
> =C2=A0
> -	for (i =3D 0; i < num_pages; ++i) {
> -		if (PageHighMem(p))
> -			clear_highpage(p + i);
> -		else
> -			clear_page(page_address(p + i));
> +	if (!cleared) {
> +		for (i =3D 0; i < num_pages; ++i) {
> +			if (PageHighMem(p))
> +				clear_highpage(p + i);
> +			else
> +				clear_page(page_address(p + i));
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	spin_lock(&pt->lock);
> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct ttm_pool
> *pool, struct ttm_tt *tt,
> =C2=A0				pgoff_t start_page, pgoff_t
> end_page)
> =C2=A0{
> =C2=A0	struct page **pages =3D &tt->pages[start_page];
> +	bool cleared =3D tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
> =C2=A0	unsigned int order;
> =C2=A0	pgoff_t i, nr;
> =C2=A0
> @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct ttm_pool
> *pool, struct ttm_tt *tt,
> =C2=A0
> =C2=A0		pt =3D ttm_pool_select_type(pool, caching, order);
> =C2=A0		if (pt)
> -			ttm_pool_type_give(pt, *pages);
> +			ttm_pool_type_give(pt, *pages, cleared);
> =C2=A0		else
> =C2=A0			ttm_pool_free_page(pool, caching, order,
> *pages);
> =C2=A0	}
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 2b9d856ff388..cfaf49de2419 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -85,6 +85,9 @@ struct ttm_tt {
> =C2=A0	 * fault handling abuses the DMA api a bit and dma_map_attrs
> can't be
> =C2=A0	 * used to assure pgprot always matches.
> =C2=A0	 *
> +	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver
> handles
> +	 * clearing backing store
> +	 *
> =C2=A0	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
> USE. This is
> =C2=A0	 * set by TTM after ttm_tt_populate() has successfully
> returned, and is
> =C2=A0	 * then unset when TTM calls ttm_tt_unpopulate().
> @@ -94,8 +97,9 @@ struct ttm_tt {
> =C2=A0#define TTM_TT_FLAG_EXTERNAL		BIT(2)
> =C2=A0#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
> =C2=A0#define TTM_TT_FLAG_DECRYPTED		BIT(4)
> +#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
> =C2=A0
> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
> =C2=A0	uint32_t page_flags;
> =C2=A0	/** @num_pages: Number of pages in the page array. */
> =C2=A0	uint32_t num_pages;

