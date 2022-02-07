Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D6F4AB78E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490E210F6B9;
	Mon,  7 Feb 2022 09:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D63010F6B7;
 Mon,  7 Feb 2022 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644226661; x=1675762661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BE9Xr86GfvlPKb4HzfB/e1vh416aMq08g81SHhODJjE=;
 b=VdF4Q3lDdtEDCBZ4kVg6Ku1n+WEXC9hXR8k91x/h/vZkbbfZ/cGucuNZ
 L1jHHNSmKDoG8CQgAWl7XsK+Yac24529vp1ypmidNYB9yx3p8H/okAJw4
 DK+3CXBB8C/UHrEsbdNYe/UZXjVkdA1RkB1fQjunPwSUe9Rv8hHAldS8m
 RzRRz8PiTFAgnnYm8plYUNStNApsDi5uexfmwMsol/32KOIQOU27g3s2M
 3Nn8oeawFtpuaXNkSDm53SPVhEdtd8vndhNQNcRBnVGfYL9ZfGLiiAzwv
 jQDs5tbhDtnSS/yRzK9FS74ZxXCi2GwpBTiV9OUsnN9iUGSjyXgEWXQBp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273200183"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="273200183"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:37:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="484360854"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:37:38 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [RFC 2/2] drm/i915/migrate: Evict and restore the ccs data
Date: Mon,  7 Feb 2022 15:07:43 +0530
Message-Id: <20220207093743.14467-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220207093743.14467-1-ramalingam.c@intel.com>
References: <20220207093743.14467-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we are swapping out the local memory obj on flat-ccs capable platform,
we need to capture the ccs data too along with main meory and we need to
restore it when we are swapping in the content.

Extracting and restoring the CCS data is done through a special cmd called
XY_CTRL_SURF_COPY_BLT

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 283 +++++++++++++-----------
 1 file changed, 155 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 5bdab0b3c735..e60ae6ff1847 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -449,14 +449,146 @@ static bool wa_1209644611_applies(int ver, u32 size)
 	return height % 4 == 3 && height <= 8;
 }
 
+/**
+ * DOC: Flat-CCS - Memory compression for Local memory
+ *
+ * On Xe-HP and later devices, we use dedicated compression control state (CCS)
+ * stored in local memory for each surface, to support the 3D and media
+ * compression formats.
+ *
+ * The memory required for the CCS of the entire local memory is 1/256 of the
+ * local memory size. So before the kernel boot, the required memory is reserved
+ * for the CCS data and a secure register will be programmed with the CCS base
+ * address.
+ *
+ * Flat CCS data needs to be cleared when a lmem object is allocated.
+ * And CCS data can be copied in and out of CCS region through
+ * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
+ *
+ * When we exaust the lmem, if the object's placements support smem, then we can
+ * directly decompress the compressed lmem object into smem and start using it
+ * from smem itself.
+ *
+ * But when we need to swapout the compressed lmem object into a smem region
+ * though objects' placement doesn't support smem, then we copy the lmem content
+ * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
+ * When the object is referred, lmem content will be swaped in along with
+ * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
+ * location.
+ *
+ *
+ * Flat-CCS Modifiers for different compression formats
+ * ----------------------------------------------------
+ *
+ * I915_FORMAT_MOD_F_TILED_DG2_RC_CCS - used to indicate the buffers of Flat CCS
+ * render compression formats. Though the general layout is same as
+ * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, new hashing/compression algorithm is
+ * used. Render compression uses 128 byte compression blocks
+ *
+ * I915_FORMAT_MOD_F_TILED_DG2_MC_CCS -used to indicate the buffers of Flat CCS
+ * media compression formats. Though the general layout is same as
+ * I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, new hashing/compression algorithm is
+ * used. Media compression uses 256 byte compression blocks.
+ *
+ * I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC - used to indicate the buffers of Flat
+ * CCS clear color render compression formats. Unified compression format for
+ * clear color render compression. The genral layout is a tiled layout using
+ * 4Kb tiles i.e Tile4 layout.
+ */
+
+static inline u32 *i915_flush_dw(u32 *cmd, u64 dst, u32 flags)
+{
+	/* Mask the 3 LSB to use the PPGTT address space */
+	*cmd++ = MI_FLUSH_DW | flags;
+	*cmd++ = lower_32_bits(dst);
+	*cmd++ = upper_32_bits(dst);
+
+	return cmd;
+}
+
+static u32 calc_ctrl_surf_instr_size(struct drm_i915_private *i915, int size)
+{
+	u32 num_cmds, num_blks, total_size;
+
+	if (!GET_CCS_SIZE(i915, size))
+		return 0;
+
+	/*
+	 * XY_CTRL_SURF_COPY_BLT transfers CCS in 256 byte
+	 * blocks. one XY_CTRL_SURF_COPY_BLT command can
+	 * trnasfer upto 1024 blocks.
+	 */
+	num_blks = GET_CCS_SIZE(i915, size);
+	num_cmds = (num_blks + (NUM_CCS_BLKS_PER_XFER - 1)) >> 10;
+	total_size = (XY_CTRL_SURF_INSTR_SIZE) * num_cmds;
+
+	/*
+	 * We need to add a flush before and after
+	 * XY_CTRL_SURF_COPY_BLT
+	 */
+	total_size += 2 * MI_FLUSH_DW_SIZE;
+	return total_size;
+}
+
+static u32 *_i915_ctrl_surf_copy_blt(u32 *cmd, u64 src_addr, u64 dst_addr,
+				     u8 src_mem_access, u8 dst_mem_access,
+				     int src_mocs, int dst_mocs,
+				     u16 num_ccs_blocks)
+{
+	int i = num_ccs_blocks;
+
+	/*
+	 * The XY_CTRL_SURF_COPY_BLT instruction is used to copy the CCS
+	 * data in and out of the CCS region.
+	 *
+	 * We can copy at most 1024 blocks of 256 bytes using one
+	 * XY_CTRL_SURF_COPY_BLT instruction.
+	 *
+	 * In case we need to copy more than 1024 blocks, we need to add
+	 * another instruction to the same batch buffer.
+	 *
+	 * 1024 blocks of 256 bytes of CCS represent a total 256KB of CCS.
+	 *
+	 * 256 KB of CCS represents 256 * 256 KB = 64 MB of LMEM.
+	 */
+	do {
+		/*
+		 * We use logical AND with 1023 since the size field
+		 * takes values which is in the range of 0 - 1023
+		 */
+		*cmd++ = ((XY_CTRL_SURF_COPY_BLT) |
+			  (src_mem_access << SRC_ACCESS_TYPE_SHIFT) |
+			  (dst_mem_access << DST_ACCESS_TYPE_SHIFT) |
+			  (((i - 1) & 1023) << CCS_SIZE_SHIFT));
+		*cmd++ = lower_32_bits(src_addr);
+		*cmd++ = ((upper_32_bits(src_addr) & 0xFFFF) |
+			  (src_mocs << XY_CTRL_SURF_MOCS_SHIFT));
+		*cmd++ = lower_32_bits(dst_addr);
+		*cmd++ = ((upper_32_bits(dst_addr) & 0xFFFF) |
+			  (dst_mocs << XY_CTRL_SURF_MOCS_SHIFT));
+		src_addr += SZ_64M;
+		dst_addr += SZ_64M;
+		i -= NUM_CCS_BLKS_PER_XFER;
+	} while (i > 0);
+
+	return cmd;
+}
+
 static int emit_copy(struct i915_request *rq,
-		     u32 dst_offset, u32 src_offset, int size)
+		     bool dst_is_lmem, u32 dst_offset,
+		     bool src_is_lmem, u32 src_offset, int size)
 {
+	struct drm_i915_private *i915 = rq->engine->i915;
 	const int ver = GRAPHICS_VER(rq->engine->i915);
 	u32 instance = rq->engine->instance;
+	u32 num_ccs_blks, ccs_ring_size;
+	u8 src_access, dst_access;
 	u32 *cs;
 
-	cs = intel_ring_begin(rq, ver >= 8 ? 10 : 6);
+	ccs_ring_size = ((src_is_lmem || dst_is_lmem) && HAS_FLAT_CCS(i915)) ?
+			 calc_ctrl_surf_instr_size(i915, size) : 0;
+
+	cs = intel_ring_begin(rq, ver >= 8 ? 10 + ccs_ring_size : 6);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
@@ -492,6 +624,25 @@ static int emit_copy(struct i915_request *rq,
 		*cs++ = src_offset;
 	}
 
+	if (ccs_ring_size) {
+		/* TODO: Migration needs to be handled with resolve of compressed data */
+		num_ccs_blks = (GET_CCS_SIZE(i915, size) +
+				NUM_CCS_BYTES_PER_BLOCK - 1) >> 8;
+
+		src_access = !src_is_lmem && dst_is_lmem;
+		dst_access = !src_access;
+
+		if (src_access) /* Swapin of compressed data */
+			src_offset += size;
+		else
+			dst_offset += size;
+
+		cs = _i915_ctrl_surf_copy_blt(cs, src_offset, dst_offset,
+					      src_access, dst_access,
+					      1, 1, num_ccs_blks);
+		cs = i915_flush_dw(cs, dst_offset, MI_FLUSH_LLC | MI_FLUSH_CCS);
+	}
+
 	intel_ring_advance(rq, cs);
 	return 0;
 }
@@ -578,7 +729,8 @@ intel_context_migrate_copy(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		err = emit_copy(rq, dst_offset, src_offset, len);
+		err = emit_copy(rq, dst_is_lmem, dst_offset,
+				src_is_lmem, src_offset, len);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
@@ -596,131 +748,6 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
-/**
- * DOC: Flat-CCS - Memory compression for Local memory
- *
- * On Xe-HP and later devices, we use dedicated compression control state (CCS)
- * stored in local memory for each surface, to support the 3D and media
- * compression formats.
- *
- * The memory required for the CCS of the entire local memory is 1/256 of the
- * local memory size. So before the kernel boot, the required memory is reserved
- * for the CCS data and a secure register will be programmed with the CCS base
- * address.
- *
- * Flat CCS data needs to be cleared when a lmem object is allocated.
- * And CCS data can be copied in and out of CCS region through
- * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
- *
- * When we exaust the lmem, if the object's placements support smem, then we can
- * directly decompress the compressed lmem object into smem and start using it
- * from smem itself.
- *
- * But when we need to swapout the compressed lmem object into a smem region
- * though objects' placement doesn't support smem, then we copy the lmem content
- * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
- * When the object is referred, lmem content will be swaped in along with
- * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
- * location.
- *
- *
- * Flat-CCS Modifiers for different compression formats
- * ----------------------------------------------------
- *
- * I915_FORMAT_MOD_F_TILED_DG2_RC_CCS - used to indicate the buffers of Flat CCS
- * render compression formats. Though the general layout is same as
- * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, new hashing/compression algorithm is
- * used. Render compression uses 128 byte compression blocks
- *
- * I915_FORMAT_MOD_F_TILED_DG2_MC_CCS -used to indicate the buffers of Flat CCS
- * media compression formats. Though the general layout is same as
- * I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, new hashing/compression algorithm is
- * used. Media compression uses 256 byte compression blocks.
- *
- * I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC - used to indicate the buffers of Flat
- * CCS clear color render compression formats. Unified compression format for
- * clear color render compression. The genral layout is a tiled layout using
- * 4Kb tiles i.e Tile4 layout.
- */
-
-static inline u32 *i915_flush_dw(u32 *cmd, u64 dst, u32 flags)
-{
-	/* Mask the 3 LSB to use the PPGTT address space */
-	*cmd++ = MI_FLUSH_DW | flags;
-	*cmd++ = lower_32_bits(dst);
-	*cmd++ = upper_32_bits(dst);
-
-	return cmd;
-}
-
-static u32 calc_ctrl_surf_instr_size(struct drm_i915_private *i915, int size)
-{
-	u32 num_cmds, num_blks, total_size;
-
-	if (!GET_CCS_SIZE(i915, size))
-		return 0;
-
-	/*
-	 * XY_CTRL_SURF_COPY_BLT transfers CCS in 256 byte
-	 * blocks. one XY_CTRL_SURF_COPY_BLT command can
-	 * trnasfer upto 1024 blocks.
-	 */
-	num_blks = GET_CCS_SIZE(i915, size);
-	num_cmds = (num_blks + (NUM_CCS_BLKS_PER_XFER - 1)) >> 10;
-	total_size = (XY_CTRL_SURF_INSTR_SIZE) * num_cmds;
-
-	/*
-	 * We need to add a flush before and after
-	 * XY_CTRL_SURF_COPY_BLT
-	 */
-	total_size += 2 * MI_FLUSH_DW_SIZE;
-	return total_size;
-}
-
-static u32 *_i915_ctrl_surf_copy_blt(u32 *cmd, u64 src_addr, u64 dst_addr,
-				     u8 src_mem_access, u8 dst_mem_access,
-				     int src_mocs, int dst_mocs,
-				     u16 num_ccs_blocks)
-{
-	int i = num_ccs_blocks;
-
-	/*
-	 * The XY_CTRL_SURF_COPY_BLT instruction is used to copy the CCS
-	 * data in and out of the CCS region.
-	 *
-	 * We can copy at most 1024 blocks of 256 bytes using one
-	 * XY_CTRL_SURF_COPY_BLT instruction.
-	 *
-	 * In case we need to copy more than 1024 blocks, we need to add
-	 * another instruction to the same batch buffer.
-	 *
-	 * 1024 blocks of 256 bytes of CCS represent a total 256KB of CCS.
-	 *
-	 * 256 KB of CCS represents 256 * 256 KB = 64 MB of LMEM.
-	 */
-	do {
-		/*
-		 * We use logical AND with 1023 since the size field
-		 * takes values which is in the range of 0 - 1023
-		 */
-		*cmd++ = ((XY_CTRL_SURF_COPY_BLT) |
-			  (src_mem_access << SRC_ACCESS_TYPE_SHIFT) |
-			  (dst_mem_access << DST_ACCESS_TYPE_SHIFT) |
-			  (((i - 1) & 1023) << CCS_SIZE_SHIFT));
-		*cmd++ = lower_32_bits(src_addr);
-		*cmd++ = ((upper_32_bits(src_addr) & 0xFFFF) |
-			  (src_mocs << XY_CTRL_SURF_MOCS_SHIFT));
-		*cmd++ = lower_32_bits(dst_addr);
-		*cmd++ = ((upper_32_bits(dst_addr) & 0xFFFF) |
-			  (dst_mocs << XY_CTRL_SURF_MOCS_SHIFT));
-		src_addr += SZ_64M;
-		dst_addr += SZ_64M;
-		i -= NUM_CCS_BLKS_PER_XFER;
-	} while (i > 0);
-
-	return cmd;
-}
-
 static int emit_clear(struct i915_request *rq,
 		      u64 offset,
 		      int size,
-- 
2.20.1

