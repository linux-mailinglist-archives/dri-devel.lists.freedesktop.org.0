Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA24BC4A1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 02:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA0410EB1B;
	Sat, 19 Feb 2022 01:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38010EB14;
 Sat, 19 Feb 2022 01:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645235244; x=1676771244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u6MnM3hf31o26ieTegb/Ig4reYxy9nGWksfq0p2fx2o=;
 b=VeEFA/JK5SnchB/mdWen/134iGrEFqL1eqBGX6ZnvynrFOy0SNutaLl1
 WCvIJVgqjyQbbIfkOWld1697/DlTOWsiLyrBYcx5pUoVG4S2Zx1xxUJ+w
 9dUK8VV5DssTs+Nv+0/upILGlSHH1oY/4B5PfIUTtkqwMRUS79V5ZYsLp
 OO1FbOvelqT0cRch11WDBgt9bbwWyvzgbN1rja1AMeI48Dvax3I6iTESD
 9/I6iqnccw5dtoLg7RCNMp724VRwFm3YiybWAzDbE7YrWOKEdmj2NNfBA
 q4IW8YziDDpn1YZw3a0cO2BtpM/CGy/TgfhA7nDH1k4Gmg+JPk8fYEvGh w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="251202675"
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="251202675"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 17:47:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="775457737"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 17:47:23 -0800
Date: Fri, 18 Feb 2022 17:47:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 15/15] drm/i915/gt: Clear compress metadata for Xe_HP
 platforms
Message-ID: <YhBMKq12AilHGCyl@mdroper-desk1.amr.corp.intel.com>
References: <20220218184752.7524-1-ramalingam.c@intel.com>
 <20220218184752.7524-16-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218184752.7524-16-ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, lucas.demarchi@intel.com,
 CQ Tang <cq.tang@intel.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 19, 2022 at 12:17:52AM +0530, Ramalingam C wrote:
> From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> 
> Xe-HP and latest devices support Flat CCS which reserved a portion of
> the device memory to store compression metadata, during the clearing of
> device memory buffer object we also need to clear the associated
> CCS buffer.
> 
> Flat CCS memory can not be directly accessed by S/W.
> Address of CCS buffer associated main BO is automatically calculated
> by device itself. KMD/UMD can only access this buffer indirectly using
> XY_CTRL_SURF_COPY_BLT cmd via the address of device memory buffer.
> 
> v2: Fixed issues with platform naming [Lucas]
> v3: Rebased [Ram]
>     Used the round_up funcs [Bob]
> v4: Fixed ccs blk calculation [Ram]
>     Added Kdoc on flat-ccs.
> 
> Cc: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  15 ++
>  drivers/gpu/drm/i915/gt/intel_migrate.c      | 145 ++++++++++++++++++-
>  2 files changed, 156 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index f8253012d166..166de5436c4a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -203,6 +203,21 @@
>  #define GFX_OP_DRAWRECT_INFO     ((0x3<<29)|(0x1d<<24)|(0x80<<16)|(0x3))
>  #define GFX_OP_DRAWRECT_INFO_I965  ((0x7900<<16)|0x2)
>  
> +#define XY_CTRL_SURF_INSTR_SIZE	5
> +#define MI_FLUSH_DW_SIZE		3
> +#define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
> +#define   SRC_ACCESS_TYPE_SHIFT		21
> +#define   DST_ACCESS_TYPE_SHIFT		20
> +#define   CCS_SIZE_SHIFT		8

Rather than using a shift, it might be better to just define the
bitfield.  E.g.,

        #define CCS_SIZE        GENMASK(17, 8)

and then later

        FIELD_PREP(CCS_SIZE, i - 1)

to refer to the proper value.

> +#define   XY_CTRL_SURF_MOCS_SHIFT	25

Same here; we can use GENMASK(31, 25) to define the field.

> +#define   NUM_CCS_BYTES_PER_BLOCK	256
> +#define   NUM_BYTES_PER_CCS_BYTE	256
> +#define   NUM_CCS_BLKS_PER_XFER		1024
> +#define   INDIRECT_ACCESS		0
> +#define   DIRECT_ACCESS			1
> +#define  MI_FLUSH_LLC			BIT(9)
> +#define  MI_FLUSH_CCS			BIT(16)
> +
>  #define COLOR_BLT_CMD			(2 << 29 | 0x40 << 22 | (5 - 2))
>  #define XY_COLOR_BLT_CMD		(2 << 29 | 0x50 << 22)
>  #define SRC_COPY_BLT_CMD		(2 << 29 | 0x43 << 22)
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 20444d6ceb3c..9f9cd2649377 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -16,6 +16,8 @@ struct insert_pte_data {
>  };
>  
>  #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
> +#define GET_CCS_BYTES(i915, size)	(HAS_FLAT_CCS(i915) ? \
> +					 DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0)
>  
>  static bool engine_supports_migration(struct intel_engine_cs *engine)
>  {
> @@ -467,6 +469,113 @@ static bool wa_1209644611_applies(int ver, u32 size)
>  	return height % 4 == 3 && height <= 8;
>  }
>  
> +/**
> + * DOC: Flat-CCS - Memory compression for Local memory
> + *
> + * On Xe-HP and later devices, we use dedicated compression control state (CCS)
> + * stored in local memory for each surface, to support the 3D and media
> + * compression formats.
> + *
> + * The memory required for the CCS of the entire local memory is 1/256 of the
> + * local memory size. So before the kernel boot, the required memory is reserved
> + * for the CCS data and a secure register will be programmed with the CCS base
> + * address.
> + *
> + * Flat CCS data needs to be cleared when a lmem object is allocated.
> + * And CCS data can be copied in and out of CCS region through
> + * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
> + *
> + * When we exaust the lmem, if the object's placements support smem, then we can

Typo: exhaust

> + * directly decompress the compressed lmem object into smem and start using it
> + * from smem itself.
> + *
> + * But when we need to swapout the compressed lmem object into a smem region
> + * though objects' placement doesn't support smem, then we copy the lmem content
> + * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
> + * When the object is referred, lmem content will be swaped in along with
> + * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
> + * location.
> + */
> +
> +static inline u32 *i915_flush_dw(u32 *cmd, u64 dst, u32 flags)
> +{
> +	/* Mask the 3 LSB to use the PPGTT address space */

This comment implies that we'd be doing something like

        *cmd++ = lower_32_bits(dst) & GEN_MASK(31, 3);

but that doesn't seem to be the case.  The bspec does say the address
must be qword-aligned, so maybe we should just have a drm_WARN_ON() if
we get passed something that isn't aligned properly?

> +	*cmd++ = MI_FLUSH_DW | flags;
> +	*cmd++ = lower_32_bits(dst);
> +	*cmd++ = upper_32_bits(dst);
> +
> +	return cmd;
> +}
> +
> +static u32 calc_ctrl_surf_instr_size(struct drm_i915_private *i915, int size)
> +{
> +	u32 num_cmds, num_blks, total_size;
> +
> +	if (!GET_CCS_BYTES(i915, size))
> +		return 0;
> +
> +	/*
> +	 * XY_CTRL_SURF_COPY_BLT transfers CCS in 256 byte
> +	 * blocks. one XY_CTRL_SURF_COPY_BLT command can
> +	 * trnasfer upto 1024 blocks.

Typo: transfer.

> +	 */
> +	num_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
> +				NUM_CCS_BYTES_PER_BLOCK);
> +	num_cmds = DIV_ROUND_UP(num_blks, NUM_CCS_BLKS_PER_XFER);
> +	total_size = (XY_CTRL_SURF_INSTR_SIZE) * num_cmds;
> +
> +	/*
> +	 * We need to add a flush before and after
> +	 * XY_CTRL_SURF_COPY_BLT

Do you have a bspec reference for this?  It sounds reasonable, but I
wanted to confirm with the bspec that we're programming the flush the
way it wants us to.

> +	 */
> +	total_size += 2 * MI_FLUSH_DW_SIZE;
> +	return total_size;
> +}
> +
> +static u32 *_i915_ctrl_surf_copy_blt(u32 *cmd, u64 src_addr, u64 dst_addr,
> +				     u8 src_mem_access, u8 dst_mem_access,
> +				     int src_mocs, int dst_mocs,
> +				     u16 num_ccs_blocks)
> +{
> +	int i = num_ccs_blocks;
> +
> +	/*
> +	 * The XY_CTRL_SURF_COPY_BLT instruction is used to copy the CCS
> +	 * data in and out of the CCS region.
> +	 *
> +	 * We can copy at most 1024 blocks of 256 bytes using one
> +	 * XY_CTRL_SURF_COPY_BLT instruction.
> +	 *
> +	 * In case we need to copy more than 1024 blocks, we need to add
> +	 * another instruction to the same batch buffer.
> +	 *
> +	 * 1024 blocks of 256 bytes of CCS represent a total 256KB of CCS.
> +	 *
> +	 * 256 KB of CCS represents 256 * 256 KB = 64 MB of LMEM.
> +	 */
> +	do {
> +		/*
> +		 * We use logical AND with 1023 since the size field
> +		 * takes values which is in the range of 0 - 1023

I think you mean 'bitwise AND' here?  A logical AND would be '&&' which
isn't what you want.

> +		 */
> +		*cmd++ = ((XY_CTRL_SURF_COPY_BLT) |
> +			  (src_mem_access << SRC_ACCESS_TYPE_SHIFT) |
> +			  (dst_mem_access << DST_ACCESS_TYPE_SHIFT) |
> +			  (((i - 1) & 1023) << CCS_SIZE_SHIFT));
> +		*cmd++ = lower_32_bits(src_addr);
> +		*cmd++ = ((upper_32_bits(src_addr) & 0xFFFF) |
> +			  (src_mocs << XY_CTRL_SURF_MOCS_SHIFT));
> +		*cmd++ = lower_32_bits(dst_addr);
> +		*cmd++ = ((upper_32_bits(dst_addr) & 0xFFFF) |
> +			  (dst_mocs << XY_CTRL_SURF_MOCS_SHIFT));
> +		src_addr += SZ_64M;
> +		dst_addr += SZ_64M;
> +		i -= NUM_CCS_BLKS_PER_XFER;
> +	} while (i > 0);
> +
> +	return cmd;
> +}
> +
>  static int emit_copy(struct i915_request *rq,
>  		     u32 dst_offset, u32 src_offset, int size)
>  {
> @@ -614,16 +723,23 @@ intel_context_migrate_copy(struct intel_context *ce,
>  	return err;
>  }
>  
> -static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
> +static int emit_clear(struct i915_request *rq, u64 offset, int size,
> +		      u32 value, bool is_lmem)
>  {
> -	const int ver = GRAPHICS_VER(rq->engine->i915);
> +	struct drm_i915_private *i915 = rq->engine->i915;
> +	const int ver = GRAPHICS_VER(i915);
> +	u32 num_ccs_blks, ccs_ring_size;
>  	u32 *cs;
>  
>  	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
>  
>  	offset += (u64)rq->engine->instance << 32;
>  
> -	cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
> +	/* Clear flat css only when value is 0 */

Typo: ccs

> +	ccs_ring_size = (is_lmem && !value) ?
> +			 calc_ctrl_surf_instr_size(i915, size) : 0;
> +
> +	cs = intel_ring_begin(rq, round_up(ver >= 8 ? 8 + ccs_ring_size : 6, 2));
>  	if (IS_ERR(cs))
>  		return PTR_ERR(cs);
>  
> @@ -646,6 +762,27 @@ static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
>  		*cs++ = value;
>  	}
>  
> +	if (is_lmem && HAS_FLAT_CCS(i915) && !value) {
> +		num_ccs_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
> +					    NUM_CCS_BYTES_PER_BLOCK);
> +
> +		/*
> +		 * Flat CCS surface can only be accessed via
> +		 * XY_CTRL_SURF_COPY_BLT CMD and using indirect
> +		 * mapping of associated LMEM.
> +		 * We can clear ccs surface by writing all 0s,
> +		 * so we will flush the previously cleared buffer
> +		 * and use it as a source.
> +		 */
> +		cs = i915_flush_dw(cs, offset, MI_FLUSH_LLC | MI_FLUSH_CCS);
> +		cs = _i915_ctrl_surf_copy_blt(cs, offset, offset,
> +					      DIRECT_ACCESS, INDIRECT_ACCESS,
> +					      1, 1, num_ccs_blks);

The magic number '1' used for MOCS here doesn't look right.  The proper
MOCS entry is probably going to vary from platform to platform.  Bspec
47980 says it should be UC with GO:Memory, so I think that would be
index 2 for DG2 and Xe_HP SDV.  Since MOCS values are (index << 1), that
would mean we we'd need to program a value of "4" here if I'm reading
the description correctly.

Right now we have mocs->uc_index pointing to the uncached entry with
GO:L3.  But I from a quick skim, I think the only places we're using
that value are the programming of BLIT_CCTL (bspec 45807) and
RING_CMD_CCTL (bspec 45826), both of which are supposed to be using
GO:Memory instead of GO:L3.  So maybe we should fix the uc_index value
for those platforms and then use "rq->engine->gt->mocs.uc_index << 1"
here.  Might be worth renaming the field to "uc_index_gomemory" just to
make it more explicit what it's representing to prevent mistakes during
enablement of future platforms.


Matt

> +		cs = i915_flush_dw(cs, offset, MI_FLUSH_LLC | MI_FLUSH_CCS);
> +
> +		if (ccs_ring_size & 1)
> +			*cs++ = MI_NOOP;
> +	}
>  	intel_ring_advance(rq, cs);
>  	return 0;
>  }
> @@ -711,7 +848,7 @@ intel_context_migrate_clear(struct intel_context *ce,
>  		if (err)
>  			goto out_rq;
>  
> -		err = emit_clear(rq, offset, len, value);
> +		err = emit_clear(rq, offset, len, value, is_lmem);
>  
>  		/* Arbitration is re-enabled between requests. */
>  out_rq:
> -- 
> 2.20.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
