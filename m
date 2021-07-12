Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15F3C6057
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 18:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBBD89388;
	Mon, 12 Jul 2021 16:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7702B89388
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 16:21:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8D991FB;
 Mon, 12 Jul 2021 09:21:52 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B1D53F774;
 Mon, 12 Jul 2021 09:21:52 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 468316850D9; Mon, 12 Jul 2021 17:21:51 +0100 (BST)
Date: Mon, 12 Jul 2021 17:21:51 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Normunds Rieksts <normunds.rieksts@arm.com>
Subject: Re: [PATCH] drm/fourcc: Add modifier definitions for Arm Fixed Rate
 Compression
Message-ID: <20210712162151.c7tkfkfvulkvgrlg@e110455-lin.cambridge.arm.com>
References: <20210701170709.39922-1-normunds.rieksts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210701170709.39922-1-normunds.rieksts@arm.com>
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
Cc: airlied@linux.ie, Matteo.Franchin@arm.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, nd@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 01, 2021 at 06:07:09PM +0100, Normunds Rieksts wrote:
> Arm Fixed Rate Compression (AFRC) is a proprietary fixed rate image
> compression protocol and format.
> It is designed to provide guaranteed bandwidth and memory footprint
> reductions in graphics and media use-cases.
> 
> This patch aims to add modifier definitions for describing
> AFRC.
> 
> Signed-off-by: Normunds Rieksts <normunds.rieksts@arm.com>

Looks good to me!

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  include/uapi/drm/drm_fourcc.h | 109 +++++++++++++++++++++++++++++++++-
>  1 file changed, 106 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index f7156322aba5..9f4bb4a6f358 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -900,9 +900,9 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  
>  /*
>   * The top 4 bits (out of the 56 bits alloted for specifying vendor specific
> - * modifiers) denote the category for modifiers. Currently we have only two
> - * categories of modifiers ie AFBC and MISC. We can have a maximum of sixteen
> - * different categories.
> + * modifiers) denote the category for modifiers. Currently we have three
> + * categories of modifiers ie AFBC, MISC and AFRC. We can have a maximum of
> + * sixteen different categories.
>   */
>  #define DRM_FORMAT_MOD_ARM_CODE(__type, __val) \
>  	fourcc_mod_code(ARM, ((__u64)(__type) << 52) | ((__val) & 0x000fffffffffffffULL))
> @@ -1017,6 +1017,109 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   */
>  #define AFBC_FORMAT_MOD_USM	(1ULL << 12)
>  
> +/*
> + * Arm Fixed-Rate Compression (AFRC) modifiers
> + *
> + * AFRC is a proprietary fixed rate image compression protocol and format,
> + * designed to provide guaranteed bandwidth and memory footprint
> + * reductions in graphics and media use-cases.
> + *
> + * AFRC buffers consist of one or more planes, with the same components
> + * and meaning as an uncompressed buffer using the same pixel format.
> + *
> + * Within each plane, the pixel/luma/chroma values are grouped into
> + * "coding unit" blocks which are individually compressed to a
> + * fixed size (in bytes). All coding units within a given plane of a buffer
> + * store the same number of values, and have the same compressed size.
> + *
> + * The coding unit size is configurable, allowing different rates of compression.
> + *
> + * The start of each AFRC buffer plane must be aligned to an alignment granule which
> + * depends on the coding unit size.
> + *
> + * Coding Unit Size   Plane Alignment
> + * ----------------   ---------------
> + * 16 bytes           1024 bytes
> + * 24 bytes           512  bytes
> + * 32 bytes           2048 bytes
> + *
> + * Coding units are grouped into paging tiles. AFRC buffer dimensions must be aligned
> + * to a multiple of the paging tile dimensions.
> + * The dimensions of each paging tile depend on whether the buffer is optimised for
> + * scanline (SCAN layout) or rotated (ROT layout) access.
> + *
> + * Layout   Paging Tile Width   Paging Tile Height
> + * ------   -----------------   ------------------
> + * SCAN     16 coding units     4 coding units
> + * ROT      8  coding units     8 coding units
> + *
> + * The dimensions of each coding unit depend on the number of components
> + * in the compressed plane and whether the buffer is optimised for
> + * scanline (SCAN layout) or rotated (ROT layout) access.
> + *
> + * Number of Components in Plane   Layout      Coding Unit Width   Coding Unit Height
> + * -----------------------------   ---------   -----------------   ------------------
> + * 1                               SCAN        16 samples          4 samples
> + * Example: 16x4 luma samples in a 'Y' plane
> + *          16x4 chroma 'V' values, in the 'V' plane of a fully-planar YUV buffer
> + * -----------------------------   ---------   -----------------   ------------------
> + * 1                               ROT         8 samples           8 samples
> + * Example: 8x8 luma samples in a 'Y' plane
> + *          8x8 chroma 'V' values, in the 'V' plane of a fully-planar YUV buffer
> + * -----------------------------   ---------   -----------------   ------------------
> + * 2                               DONT CARE   8 samples           4 samples
> + * Example: 8x4 chroma pairs in the 'UV' plane of a semi-planar YUV buffer
> + * -----------------------------   ---------   -----------------   ------------------
> + * 3                               DONT CARE   4 samples           4 samples
> + * Example: 4x4 pixels in an RGB buffer without alpha
> + * -----------------------------   ---------   -----------------   ------------------
> + * 4                               DONT CARE   4 samples           4 samples
> + * Example: 4x4 pixels in an RGB buffer with alpha
> + */
> +
> +#define DRM_FORMAT_MOD_ARM_TYPE_AFRC 0x02
> +
> +#define DRM_FORMAT_MOD_ARM_AFRC(__afrc_mode) \
> +	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_AFRC, __afrc_mode)
> +
> +/*
> + * AFRC coding unit size modifier.
> + *
> + * Indicates the number of bytes used to store each compressed coding unit for
> + * one or more planes in an AFRC encoded buffer. The coding unit size for chrominance
> + * is the same for both Cb and Cr, which may be stored in separate planes.
> + *
> + * AFRC_FORMAT_MOD_CU_SIZE_P0 indicates the number of bytes used to store
> + * each compressed coding unit in the first plane of the buffer. For RGBA buffers
> + * this is the only plane, while for semi-planar and fully-planar YUV buffers,
> + * this corresponds to the luma plane.
> + *
> + * AFRC_FORMAT_MOD_CU_SIZE_P12 indicates the number of bytes used to store
> + * each compressed coding unit in the second and third planes in the buffer.
> + * For semi-planar and fully-planar YUV buffers, this corresponds to the chroma plane(s).
> + *
> + * For single-plane buffers, AFRC_FORMAT_MOD_CU_SIZE_P0 must be specified
> + * and AFRC_FORMAT_MOD_CU_SIZE_P12 must be zero.
> + * For semi-planar and fully-planar buffers, both AFRC_FORMAT_MOD_CU_SIZE_P0 and
> + * AFRC_FORMAT_MOD_CU_SIZE_P12 must be specified.
> + */
> +#define AFRC_FORMAT_MOD_CU_SIZE_MASK 0xf
> +#define AFRC_FORMAT_MOD_CU_SIZE_16 (1ULL)
> +#define AFRC_FORMAT_MOD_CU_SIZE_24 (2ULL)
> +#define AFRC_FORMAT_MOD_CU_SIZE_32 (3ULL)
> +
> +#define AFRC_FORMAT_MOD_CU_SIZE_P0(__afrc_cu_size) (__afrc_cu_size)
> +#define AFRC_FORMAT_MOD_CU_SIZE_P12(__afrc_cu_size) ((__afrc_cu_size) << 4)
> +
> +/*
> + * AFRC scanline memory layout.
> + *
> + * Indicates if the buffer uses the scanline-optimised layout
> + * for an AFRC encoded buffer, otherwise, it uses the rotation-optimised layout.
> + * The memory layout is the same for all planes.
> + */
> +#define AFRC_FORMAT_MOD_LAYOUT_SCAN (1ULL << 8)
> +
>  /*
>   * Arm 16x16 Block U-Interleaved modifier
>   *
> -- 
> 2.17.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
