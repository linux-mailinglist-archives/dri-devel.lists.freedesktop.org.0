Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B17F4BADFF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 01:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0484610E8F1;
	Fri, 18 Feb 2022 00:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E01410E8CD;
 Fri, 18 Feb 2022 00:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645142739; x=1676678739;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=39Evd7Aky5scFsY79r61HyIl9JbUpXE6gzECVZMO/xw=;
 b=HEl/BgpqQ7hcCi++e/sdlwvzamm1UTKLVYsPQAj88ozYUXZPNjcPjN1m
 Vfn3zqFct7aQebht5JvQlTMSki/OCbJ+l75mSUPE/zsN8ou9OnLqDVjgI
 MLtnBEp0etlx/bcaBJmLGT+eibvXrXz7Adtvmuwy/R5K6Ic8YdSdiQEcs
 tYvvjiegZmFgxwENGMl7xgf8dc3aX9b/tnCjzhHr143vDlW6P+bdGBYjs
 eIfknkLn0VOLeJmf87GCOQiYXFqrQAsD8cU6PkzkKNDVjIgbaHl1JcvBZ
 cQ0zHHA7EDC114+hl17BGWJ0RGSpdWF+lfgoo9d1P7QLOM6TCxMObb6Qe Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337452456"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="337452456"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 16:05:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="541583947"
Received: from dburke-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.88.148])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 16:05:38 -0800
Date: Thu, 17 Feb 2022 16:05:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [RFC 2/2] drm/i915/migrate: Evict and restore the
 ccs data
Message-ID: <20220218000537.ugyc74wfyk36xhg4@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220207093743.14467-1-ramalingam.c@intel.com>
 <20220207093743.14467-3-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220207093743.14467-3-ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 03:07:43PM +0530, Ramalingam C wrote:
>When we are swapping out the local memory obj on flat-ccs capable platform,
>we need to capture the ccs data too along with main meory and we need to
>restore it when we are swapping in the content.
>
>Extracting and restoring the CCS data is done through a special cmd called
>XY_CTRL_SURF_COPY_BLT
>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_migrate.c | 283 +++++++++++++-----------
> 1 file changed, 155 insertions(+), 128 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
>index 5bdab0b3c735..e60ae6ff1847 100644
>--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
>+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
>@@ -449,14 +449,146 @@ static bool wa_1209644611_applies(int ver, u32 size)
> 	return height % 4 == 3 && height <= 8;
> }
>
>+/**
>+ * DOC: Flat-CCS - Memory compression for Local memory
>+ *
>+ * On Xe-HP and later devices, we use dedicated compression control state (CCS)
>+ * stored in local memory for each surface, to support the 3D and media
>+ * compression formats.
>+ *
>+ * The memory required for the CCS of the entire local memory is 1/256 of the
>+ * local memory size. So before the kernel boot, the required memory is reserved
>+ * for the CCS data and a secure register will be programmed with the CCS base
>+ * address.
>+ *
>+ * Flat CCS data needs to be cleared when a lmem object is allocated.
>+ * And CCS data can be copied in and out of CCS region through
>+ * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
>+ *
>+ * When we exaust the lmem, if the object's placements support smem, then we can
>+ * directly decompress the compressed lmem object into smem and start using it
>+ * from smem itself.
>+ *
>+ * But when we need to swapout the compressed lmem object into a smem region
>+ * though objects' placement doesn't support smem, then we copy the lmem content
>+ * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
>+ * When the object is referred, lmem content will be swaped in along with
>+ * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
>+ * location.
>+ *
>+ *
>+ * Flat-CCS Modifiers for different compression formats
>+ * ----------------------------------------------------
>+ *
>+ * I915_FORMAT_MOD_F_TILED_DG2_RC_CCS - used to indicate the buffers of Flat CCS
>+ * render compression formats. Though the general layout is same as
>+ * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, new hashing/compression algorithm is
>+ * used. Render compression uses 128 byte compression blocks
>+ *
>+ * I915_FORMAT_MOD_F_TILED_DG2_MC_CCS -used to indicate the buffers of Flat CCS
>+ * media compression formats. Though the general layout is same as
>+ * I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, new hashing/compression algorithm is
>+ * used. Media compression uses 256 byte compression blocks.
>+ *
>+ * I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC - used to indicate the buffers of Flat
>+ * CCS clear color render compression formats. Unified compression format for
>+ * clear color render compression. The genral layout is a tiled layout using
>+ * 4Kb tiles i.e Tile4 layout.
>+ */
>+
>+static inline u32 *i915_flush_dw(u32 *cmd, u64 dst, u32 flags)
>+{
>+	/* Mask the 3 LSB to use the PPGTT address space */
>+	*cmd++ = MI_FLUSH_DW | flags;
>+	*cmd++ = lower_32_bits(dst);
>+	*cmd++ = upper_32_bits(dst);
>+
>+	return cmd;
>+}
>+
>+static u32 calc_ctrl_surf_instr_size(struct drm_i915_private *i915, int size)
>+{
>+	u32 num_cmds, num_blks, total_size;
>+
>+	if (!GET_CCS_SIZE(i915, size))
>+		return 0;
>+
>+	/*
>+	 * XY_CTRL_SURF_COPY_BLT transfers CCS in 256 byte
>+	 * blocks. one XY_CTRL_SURF_COPY_BLT command can
>+	 * trnasfer upto 1024 blocks.
>+	 */
>+	num_blks = GET_CCS_SIZE(i915, size);
>+	num_cmds = (num_blks + (NUM_CCS_BLKS_PER_XFER - 1)) >> 10;
>+	total_size = (XY_CTRL_SURF_INSTR_SIZE) * num_cmds;
>+
>+	/*
>+	 * We need to add a flush before and after
>+	 * XY_CTRL_SURF_COPY_BLT
>+	 */
>+	total_size += 2 * MI_FLUSH_DW_SIZE;
>+	return total_size;
>+}
>+
>+static u32 *_i915_ctrl_surf_copy_blt(u32 *cmd, u64 src_addr, u64 dst_addr,
>+				     u8 src_mem_access, u8 dst_mem_access,
>+				     int src_mocs, int dst_mocs,
>+				     u16 num_ccs_blocks)
>+{
>+	int i = num_ccs_blocks;
>+
>+	/*
>+	 * The XY_CTRL_SURF_COPY_BLT instruction is used to copy the CCS
>+	 * data in and out of the CCS region.
>+	 *
>+	 * We can copy at most 1024 blocks of 256 bytes using one
>+	 * XY_CTRL_SURF_COPY_BLT instruction.
>+	 *
>+	 * In case we need to copy more than 1024 blocks, we need to add
>+	 * another instruction to the same batch buffer.
>+	 *
>+	 * 1024 blocks of 256 bytes of CCS represent a total 256KB of CCS.
>+	 *
>+	 * 256 KB of CCS represents 256 * 256 KB = 64 MB of LMEM.
>+	 */
>+	do {
>+		/*
>+		 * We use logical AND with 1023 since the size field
>+		 * takes values which is in the range of 0 - 1023
>+		 */
>+		*cmd++ = ((XY_CTRL_SURF_COPY_BLT) |
>+			  (src_mem_access << SRC_ACCESS_TYPE_SHIFT) |
>+			  (dst_mem_access << DST_ACCESS_TYPE_SHIFT) |
>+			  (((i - 1) & 1023) << CCS_SIZE_SHIFT));
>+		*cmd++ = lower_32_bits(src_addr);
>+		*cmd++ = ((upper_32_bits(src_addr) & 0xFFFF) |
>+			  (src_mocs << XY_CTRL_SURF_MOCS_SHIFT));
>+		*cmd++ = lower_32_bits(dst_addr);
>+		*cmd++ = ((upper_32_bits(dst_addr) & 0xFFFF) |
>+			  (dst_mocs << XY_CTRL_SURF_MOCS_SHIFT));
>+		src_addr += SZ_64M;
>+		dst_addr += SZ_64M;
>+		i -= NUM_CCS_BLKS_PER_XFER;
>+	} while (i > 0);
>+
>+	return cmd;
>+}
>+
> static int emit_copy(struct i915_request *rq,
>-		     u32 dst_offset, u32 src_offset, int size)
>+		     bool dst_is_lmem, u32 dst_offset,
>+		     bool src_is_lmem, u32 src_offset, int size)
> {
>+	struct drm_i915_private *i915 = rq->engine->i915;
> 	const int ver = GRAPHICS_VER(rq->engine->i915);
> 	u32 instance = rq->engine->instance;
>+	u32 num_ccs_blks, ccs_ring_size;
>+	u8 src_access, dst_access;
> 	u32 *cs;
>
>-	cs = intel_ring_begin(rq, ver >= 8 ? 10 : 6);
>+	ccs_ring_size = ((src_is_lmem || dst_is_lmem) && HAS_FLAT_CCS(i915)) ?
>+			 calc_ctrl_surf_instr_size(i915, size) : 0;
>+
>+	cs = intel_ring_begin(rq, ver >= 8 ? 10 + ccs_ring_size : 6);
> 	if (IS_ERR(cs))
> 		return PTR_ERR(cs);
>
>@@ -492,6 +624,25 @@ static int emit_copy(struct i915_request *rq,
> 		*cs++ = src_offset;
> 	}
>
>+	if (ccs_ring_size) {
>+		/* TODO: Migration needs to be handled with resolve of compressed data */
>+		num_ccs_blks = (GET_CCS_SIZE(i915, size) +
>+				NUM_CCS_BYTES_PER_BLOCK - 1) >> 8;
>+
>+		src_access = !src_is_lmem && dst_is_lmem;
>+		dst_access = !src_access;
>+
>+		if (src_access) /* Swapin of compressed data */
>+			src_offset += size;
>+		else
>+			dst_offset += size;
>+
>+		cs = _i915_ctrl_surf_copy_blt(cs, src_offset, dst_offset,
>+					      src_access, dst_access,
>+					      1, 1, num_ccs_blks);
>+		cs = i915_flush_dw(cs, dst_offset, MI_FLUSH_LLC | MI_FLUSH_CCS);
>+	}
>+
> 	intel_ring_advance(rq, cs);
> 	return 0;
> }
>@@ -578,7 +729,8 @@ intel_context_migrate_copy(struct intel_context *ce,
> 		if (err)
> 			goto out_rq;
>
>-		err = emit_copy(rq, dst_offset, src_offset, len);
>+		err = emit_copy(rq, dst_is_lmem, dst_offset,
>+				src_is_lmem, src_offset, len);
>
> 		/* Arbitration is re-enabled between requests. */
> out_rq:
>@@ -596,131 +748,6 @@ intel_context_migrate_copy(struct intel_context *ce,
> 	return err;
> }
>
>-/**
>- * DOC: Flat-CCS - Memory compression for Local memory

the patch that added this should add it above where you are moving it
now rather than having this additional hunk.

Lucas De Marchi
