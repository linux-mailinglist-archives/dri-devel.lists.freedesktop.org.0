Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4EC475E11
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BCF10F0C4;
	Wed, 15 Dec 2021 16:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE70710F0C1;
 Wed, 15 Dec 2021 16:59:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id BF27A1F43D81
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639587564; bh=Ga0vB0SMOR72oNzfGzk4aJr5UfnPmDSgXQQ7sM6cZBo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G+Cq6fwRlAieLzmL/nuu5Y4P1z+x6e+iw9m3hG9+80MeGCQ0VCymJpJ7ojNMCHM0T
 3vKVqE+u01QMfxzuE2FwBZFa/8GL5yMSPK/hsME1WtclGAWbr858DWcNqUt4Rgu+5S
 +Kyb/BVOysY/vueFPE6WToNqmSe3ZayqvUmPfnPpbNKYQwxWHXAd8orQDp0x6vtLDb
 rrkcy0S4hTRWSTFrmVirQoYgCGtxehSxI2oLjaju1nddjgQzCRdIv2qbowjujiCRK2
 C5JS0zj+vDVTjARRsroMUeTcIIWXUqAwHiOppaJYYedGamzy1YiQucU9rIdzs/0UZc
 cLH6Pz+nJDWpQ==
Message-ID: <c34cc151-7ba3-2ad7-efd7-64185560a5b8@collabora.com>
Date: Wed, 15 Dec 2021 16:59:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH v4 06/16] drm/i915/gt: Clear compress metadata
 for Xe_HP platforms
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
 <20211209154533.4084-7-ramalingam.c@intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <20211209154533.4084-7-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fixes below fix gem_lmem_swapping@basic igt test

On 09/12/2021 15:45, Ramalingam C wrote:
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
> 
> Cc: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  14 +++
>   drivers/gpu/drm/i915/gt/intel_migrate.c      | 120 ++++++++++++++++++-
>   2 files changed, 131 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index f8253012d166..07bf5a1753bd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -203,6 +203,20 @@
>   #define GFX_OP_DRAWRECT_INFO     ((0x3<<29)|(0x1d<<24)|(0x80<<16)|(0x3))
>   #define GFX_OP_DRAWRECT_INFO_I965  ((0x7900<<16)|0x2)
>   
> +#define XY_CTRL_SURF_INSTR_SIZE	5
> +#define MI_FLUSH_DW_SIZE		3
> +#define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
> +#define   SRC_ACCESS_TYPE_SHIFT	21
> +#define   DST_ACCESS_TYPE_SHIFT	20
> +#define   CCS_SIZE_SHIFT		8
> +#define   XY_CTRL_SURF_MOCS_SHIFT	25
> +#define   NUM_CCS_BYTES_PER_BLOCK	256
> +#define   NUM_CCS_BLKS_PER_XFER	1024
> +#define   INDIRECT_ACCESS		0
> +#define   DIRECT_ACCESS		1
> +#define  MI_FLUSH_LLC			BIT(9)
> +#define  MI_FLUSH_CCS			BIT(16)
> +
>   #define COLOR_BLT_CMD			(2 << 29 | 0x40 << 22 | (5 - 2))
>   #define XY_COLOR_BLT_CMD		(2 << 29 | 0x50 << 22)
>   #define SRC_COPY_BLT_CMD		(2 << 29 | 0x43 << 22)
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 19a01878fee3..64ffaacac1e0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -16,6 +16,7 @@ struct insert_pte_data {
>   };
>   
>   #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
> +#define GET_CCS_SIZE(i915, size)	(HAS_FLAT_CCS(i915) ? (size) >> 8 : 0)

do the rounding here. Don't manually round, use kernel macros:

-#define GET_CCS_SIZE(i915, size)       (HAS_FLAT_CCS(i915) ? (size) >> 
8 : 0)

+#define GET_CCS_SIZE(i915, size)       (HAS_FLAT_CCS(i915) ? 
DIV_ROUND_UP(size, NUM_CCS_BYTES_PER_BLOCK ) : 0)


>   
>   static bool engine_supports_migration(struct intel_engine_cs *engine)
>   {
> @@ -488,15 +489,104 @@ intel_context_migrate_copy(struct intel_context *ce,
>   	return err;
>   }
>   
> -static int emit_clear(struct i915_request *rq, int size, u32 value)
> +static inline u32 *i915_flush_dw(u32 *cmd, u64 dst, u32 flags)
> +{
> +	/* Mask the 3 LSB to use the PPGTT address space */
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
> +	if (!GET_CCS_SIZE(i915, size))
> +		return 0;
> +
> +	/*
> +	 * XY_CTRL_SURF_COPY_BLT transfers CCS in 256 byte
> +	 * blocks. one XY_CTRL_SURF_COPY_BLT command can
> +	 * trnasfer upto 1024 blocks.
> +	 */
> +	num_blks = (GET_CCS_SIZE(i915, size) +
> +			   (NUM_CCS_BYTES_PER_BLOCK - 1)) >> 8;

-       num_blks = (GET_CCS_SIZE(i915, size) +

-                          (NUM_CCS_BYTES_PER_BLOCK - 1)) >> 8;

+       num_blks = GET_CCS_SIZE(i915, size);



> +	num_cmds = (num_blks + (NUM_CCS_BLKS_PER_XFER - 1)) >> 10;
> +	total_size = (XY_CTRL_SURF_INSTR_SIZE) * num_cmds;
> +
> +	/*
> +	 * We need to add a flush before and after
> +	 * XY_CTRL_SURF_COPY_BLT
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
> +static int emit_clear(struct i915_request *rq,
> +		      int size,
> +		      u32 value,
> +		      bool is_lmem)
>   {
>   	const int ver = GRAPHICS_VER(rq->engine->i915);
>   	u32 instance = rq->engine->instance;
>   	u32 *cs;
> +	struct drm_i915_private *i915 = rq->engine->i915;
> +	u32 num_ccs_blks, ccs_ring_size;
>   
>   	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
>   
> -	cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
> +	/* Clear flat css only when value is 0 */
> +	ccs_ring_size = (is_lmem && !value) ?
> +			 calc_ctrl_surf_instr_size(i915, size)
> +			 : 0;
> +
> +	cs = intel_ring_begin(rq, ver >= 8 ? 8 + ccs_ring_size : 6);

round up to qword:

-       cs = intel_ring_begin(rq, ver >= 8 ? 8 + ccs_ring_size : 6);

+       cs = intel_ring_begin(rq, round_up(ver >= 8 ? 8 + ccs_ring_size 
: 6, 2));



>   	if (IS_ERR(cs))
>   		return PTR_ERR(cs);
>   
> @@ -519,6 +609,30 @@ static int emit_clear(struct i915_request *rq, int size, u32 value)
>   		*cs++ = value;
>   	}
>   
> +	if (is_lmem && HAS_FLAT_CCS(i915) && !value) {
> +		num_ccs_blks = (GET_CCS_SIZE(i915, size) +
> +				NUM_CCS_BYTES_PER_BLOCK - 1) >> 8;

-               num_ccs_blks = (GET_CCS_SIZE(i915, size) +

-                               NUM_CCS_BYTES_PER_BLOCK - 1) >> 8;

+               num_ccs_blks = GET_CCS_SIZE(i915, size);


> +		/*
> +		 * Flat CCS surface can only be accessed via
> +		 * XY_CTRL_SURF_COPY_BLT CMD and using indirect
> +		 * mapping of associated LMEM.
> +		 * We can clear ccs surface by writing all 0s,
> +		 * so we will flush the previously cleared buffer
> +		 * and use it as a source.
> +		 */
> +
> +		cs = i915_flush_dw(cs, (u64)instance << 32,
> +				   MI_FLUSH_LLC | MI_FLUSH_CCS);
> +		cs = _i915_ctrl_surf_copy_blt(cs,
> +					      (u64)instance << 32,
> +					      (u64)instance << 32,
> +					      DIRECT_ACCESS,
> +					      INDIRECT_ACCESS,
> +					      1, 1,
> +					      num_ccs_blks);
> +		cs = i915_flush_dw(cs, (u64)instance << 32,
> +				   MI_FLUSH_LLC | MI_FLUSH_CCS);

pad to qword:

+               if (ccs_ring_size & 1)

+                       *cs++ = MI_NOOP;



> +	}
>   	intel_ring_advance(rq, cs);
>   	return 0;
>   }
> @@ -579,7 +693,7 @@ intel_context_migrate_clear(struct intel_context *ce,
>   		if (err)
>   			goto out_rq;
>   
> -		err = emit_clear(rq, len, value);
> +		err = emit_clear(rq, len, value, is_lmem);
>   
>   		/* Arbitration is re-enabled between requests. */
>   out_rq:
> 
