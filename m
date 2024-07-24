Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B2993B36B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 17:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB2610E70E;
	Wed, 24 Jul 2024 15:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5lnQlgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B3410E70E;
 Wed, 24 Jul 2024 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721833952; x=1753369952;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=LXhi1BrjW76+0rUpkkpIeojliCaifsRS7uKHZSuOoAo=;
 b=I5lnQlgUkqSo3ycPmbaM5wbvDTohuSjd7CHFZ38/1/cs3Zwwoub4pGPt
 z1EahF9UXKfrHLUMp6YCFFp1ptDPsg+yXZCJohUI2+e/gyJ6rTomFrRm1
 xrwtJLdrz0KQxyZY+Dern4QBSf51akpsgqVEeGWYWpotyKknS06HVBBWF
 d0PA8zD8RhQfdUwrPsDgRXoQmrF4os/yXosd2Vk3KCMjZ7PEvjwSBrbaX
 LNVF2EPVvnKhCQqhtxGB//wmdyJqJ2jvHcP1gVGOuO5FiEXe9P8PzXITS
 V3eTek0ACLLA7PRlkSDRRhv7ARHqR24R/O/vRdURjidPMbxdQw/zLEdC8 g==;
X-CSE-ConnectionGUID: R5cSSH1nTByHZ1qztf4Y8Q==
X-CSE-MsgGUID: hq1JVX6mSAqHqZpLVdW7MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19665259"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19665259"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:12:31 -0700
X-CSE-ConnectionGUID: IFZk065pRjO/WYQufD9BdQ==
X-CSE-MsgGUID: uAGeGsbSSx+mCYvL89adzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="52836154"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:12:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com,
 marek.olsak@amd.com, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [PATCH v7 1/2] drm/buddy: Add start address support to trim
 function
In-Reply-To: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
Date: Wed, 24 Jul 2024 18:12:23 +0300
Message-ID: <87h6cekenc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 23 Jul 2024, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.=
com> wrote:
> - Add a new start parameter in trim function to specify exact
>   address from where to start the trimming. This would help us
>   in situations like if drivers would like to do address alignment
>   for specific requirements.
>
> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>   flag to disable the allocator trimming part. This patch enables
>   the drivers control trimming and they can do it themselves
>   based on the application requirements.
>
> v1:(Matthew)
>   - check new_start alignment with min chunk_size
>   - use range_overflows()
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>  include/drm/drm_buddy.h              |  2 ++
>  3 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 6a8e45e9d0ec..103c185bb1c8 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct drm_buddy=
 *mm,
>   * drm_buddy_block_trim - free unused pages
>   *
>   * @mm: DRM buddy manager
> + * @start: start address to begin the trimming.
>   * @new_size: original size requested
>   * @blocks: Input and output list of allocated blocks.
>   * MUST contain single block as input to be trimmed.
> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct drm_bud=
dy *mm,
>   * 0 on success, error code on failure.
>   */
>  int drm_buddy_block_trim(struct drm_buddy *mm,
> +			 u64 *start,

Is this a pointer only to allow passing NULL as "don't specify"? It's
not used for returning anything in *start. Maybe it should be a const
pointer?

Not the prettiest of interfaces, and the kernel-doc does not reflect any
of this.

BR,
Jani.


>  			 u64 new_size,
>  			 struct list_head *blocks)
>  {
>  	struct drm_buddy_block *parent;
>  	struct drm_buddy_block *block;
> +	u64 block_start, block_end;
>  	LIST_HEAD(dfs);
>  	u64 new_start;
>  	int err;
> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>  				 struct drm_buddy_block,
>  				 link);
>=20=20
> +	block_start =3D drm_buddy_block_offset(block);
> +	block_end =3D block_start + drm_buddy_block_size(mm, block);
> +
>  	if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>  		return -EINVAL;
>=20=20
> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>  	if (new_size =3D=3D drm_buddy_block_size(mm, block))
>  		return 0;
>=20=20
> +	new_start =3D block_start;
> +	if (start) {
> +		new_start =3D *start;
> +
> +		if (new_start < block_start)
> +			return -EINVAL;
> +
> +		if (!IS_ALIGNED(new_start, mm->chunk_size))
> +			return -EINVAL;
> +
> +		if (range_overflows(new_start, new_size, block_end))
> +			return -EINVAL;
> +	}
> +
>  	list_del(&block->link);
>  	mark_free(mm, block);
>  	mm->avail +=3D drm_buddy_block_size(mm, block);
> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>  	parent =3D block->parent;
>  	block->parent =3D NULL;
>=20=20
> -	new_start =3D drm_buddy_block_offset(block);
>  	list_add(&block->tmp_link, &dfs);
>  	err =3D  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>  	if (err) {
> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>  	} while (1);
>=20=20
>  	/* Trim the allocated block to the required size */
> -	if (original_size !=3D size) {
> +	if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
> +	    original_size !=3D size) {
>  		struct list_head *trim_list;
>  		LIST_HEAD(temp);
>  		u64 trim_size;
> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>  		}
>=20=20
>  		drm_buddy_block_trim(mm,
> +				     NULL,
>  				     trim_size,
>  				     trim_list);
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index fe3779fdba2c..423b261ea743 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_ma=
nager *man,
>  	} while (remaining_size);
>=20=20
>  	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
> +		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
>  			size =3D vres->base.size;
>  	}
>=20=20
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 2a74fa9d0ce5..9689a7c5dd36 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -27,6 +27,7 @@
>  #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
>  #define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
>  #define DRM_BUDDY_CLEARED			BIT(4)
> +#define DRM_BUDDY_TRIM_DISABLE			BIT(5)
>=20=20
>  struct drm_buddy_block {
>  #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>  			   unsigned long flags);
>=20=20
>  int drm_buddy_block_trim(struct drm_buddy *mm,
> +			 u64 *start,
>  			 u64 new_size,
>  			 struct list_head *blocks);
>=20=20
>
> base-commit: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b

--=20
Jani Nikula, Intel
