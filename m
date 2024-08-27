Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A39605FB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 11:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9A710E04E;
	Tue, 27 Aug 2024 09:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYmsdoNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7008510E04E;
 Tue, 27 Aug 2024 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724751783; x=1756287783;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ISbSTQz/3MCGN1GeCY7OHq8j/4fCJJra79AnddcqTwY=;
 b=WYmsdoNHbzRqOtcJzYVevdOJe3JyPalIkGl27MXW8CRF9ixpas0n1MY4
 0t+Vtdm/IcY/4ph2gBqP3ZokR8oVGhQ3CNUcAJHoWxUnbw51psZF+4/AS
 zN/qon4G8X8+tQKgvguM98sgLyTIauVkoMeAWLq54joRdzZE09xRAlyfS
 7phubd0SiI0DkRa6hiscVWk1aUGN/6epxsUormjtI4iwVi0zXsakwNYI4
 TuwY8PzT/G+wDGsIpBWyy9XC6W/ZDcwYmkpZNSs8z8i9qW8UqN5tktJeU
 Mlu9MPKVkxYGiAIRdGxud8jdrwyN1QZ0EKqCrQ5eaZvzh95uyPQut3oC7 Q==;
X-CSE-ConnectionGUID: ZHAP4/goQNauRBrGoKoN2A==
X-CSE-MsgGUID: Rqdn810dS+2wut1HKL+JYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23098670"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23098670"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:43:03 -0700
X-CSE-ConnectionGUID: koQO+0i6Sd+6/CVbRq2TWg==
X-CSE-MsgGUID: RKhjADXDSLOg9aVLE9K3qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67503495"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.61]) ([10.245.244.61])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:43:02 -0700
Message-ID: <447e4cbd75e14e80b7d29e0e3b1859239b9e6c9a.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] Revert "drm/ttm: Add a flag to allow drivers to
 skip clear-on-free"
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Date: Tue, 27 Aug 2024 11:42:59 +0200
In-Reply-To: <20240821095035.29083-2-nirmoy.das@intel.com>
References: <20240821095035.29083-1-nirmoy.das@intel.com>
 <20240821095035.29083-2-nirmoy.das@intel.com>
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

On Wed, 2024-08-21 at 11:50 +0200, Nirmoy Das wrote:
> Remove TTM_TT_FLAG_CLEARED_ON_FREE now that XE stopped using this
> flag.
>=20
> This reverts commit decbfaf06db05fa1f9b33149ebb3c145b44e878f.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++-----------
> =C2=A0include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 +-----
> =C2=A02 files changed, 8 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> b/drivers/gpu/drm/ttm/ttm_pool.c
> index 935ab3cfd046..8504dbe19c1a 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -222,18 +222,15 @@ static void ttm_pool_unmap(struct ttm_pool
> *pool, dma_addr_t dma_addr,
> =C2=A0}
> =C2=A0
> =C2=A0/* Give pages into a specific pool_type */
> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page
> *p,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool cleared)
> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page
> *p)
> =C2=A0{
> =C2=A0	unsigned int i, num_pages =3D 1 << pt->order;
> =C2=A0
> -	if (!cleared) {
> -		for (i =3D 0; i < num_pages; ++i) {
> -			if (PageHighMem(p))
> -				clear_highpage(p + i);
> -			else
> -				clear_page(page_address(p + i));
> -		}
> +	for (i =3D 0; i < num_pages; ++i) {
> +		if (PageHighMem(p))
> +			clear_highpage(p + i);
> +		else
> +			clear_page(page_address(p + i));
> =C2=A0	}
> =C2=A0
> =C2=A0	spin_lock(&pt->lock);
> @@ -397,7 +394,6 @@ static void ttm_pool_free_range(struct ttm_pool
> *pool, struct ttm_tt *tt,
> =C2=A0				pgoff_t start_page, pgoff_t
> end_page)
> =C2=A0{
> =C2=A0	struct page **pages =3D &tt->pages[start_page];
> -	bool cleared =3D tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
> =C2=A0	unsigned int order;
> =C2=A0	pgoff_t i, nr;
> =C2=A0
> @@ -411,7 +407,7 @@ static void ttm_pool_free_range(struct ttm_pool
> *pool, struct ttm_tt *tt,
> =C2=A0
> =C2=A0		pt =3D ttm_pool_select_type(pool, caching, order);
> =C2=A0		if (pt)
> -			ttm_pool_type_give(pt, *pages, cleared);
> +			ttm_pool_type_give(pt, *pages);
> =C2=A0		else
> =C2=A0			ttm_pool_free_page(pool, caching, order,
> *pages);
> =C2=A0	}
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index cfaf49de2419..2b9d856ff388 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -85,9 +85,6 @@ struct ttm_tt {
> =C2=A0	 * fault handling abuses the DMA api a bit and dma_map_attrs
> can't be
> =C2=A0	 * used to assure pgprot always matches.
> =C2=A0	 *
> -	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver
> handles
> -	 * clearing backing store
> -	 *
> =C2=A0	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
> USE. This is
> =C2=A0	 * set by TTM after ttm_tt_populate() has successfully
> returned, and is
> =C2=A0	 * then unset when TTM calls ttm_tt_unpopulate().
> @@ -97,9 +94,8 @@ struct ttm_tt {
> =C2=A0#define TTM_TT_FLAG_EXTERNAL		BIT(2)
> =C2=A0#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
> =C2=A0#define TTM_TT_FLAG_DECRYPTED		BIT(4)
> -#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
> =C2=A0
> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> =C2=A0	uint32_t page_flags;
> =C2=A0	/** @num_pages: Number of pages in the page array. */
> =C2=A0	uint32_t num_pages;

