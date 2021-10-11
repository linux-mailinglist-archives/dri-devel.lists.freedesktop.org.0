Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA5429444
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 18:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879486E8F4;
	Mon, 11 Oct 2021 16:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3646E8EE;
 Mon, 11 Oct 2021 16:09:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="214056805"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="214056805"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 09:09:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="441477997"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 09:09:47 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Subject: [PATCH 12/14] drm/i915/gt: Clear compress metadata for Gen12.5 >=
 platforms
Date: Mon, 11 Oct 2021 21:41:53 +0530
Message-Id: <20211011161155.6397-13-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011161155.6397-1-ramalingam.c@intel.com>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>

Gen12.5+ devices support Flat CCS which reserved a portion of the device
memory to store compression metadata, during the clearing of device memory
buffer object we also need to clear the associated CCS buffer.

Flat CCS memory can not be directly accessed by S/W.
Address of CCS buffer associated main BO is automatically calculated
by device itself. KMD/UMD can only access this buffer indirectly using
XY_CTRL_SURF_COPY_BLT cmd via the address of device memory buffer.

Cc: CQ Tang <cq.tang@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  14 +++
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 120 ++++++++++++++++++-
 2 files changed, 131 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index f8253012d166..07bf5a1753bd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -203,6 +203,20 @@
 #define GFX_OP_DRAWRECT_INFO     ((0x3<<29)|(0x1d<<24)|(0x80<<16)|(0x3))
 #define GFX_OP_DRAWRECT_INFO_I965  ((0x7900<<16)|0x2)
 
+#define XY_CTRL_SURF_INSTR_SIZE	5
+#define MI_FLUSH_DW_SIZE		3
+#define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
+#define   SRC_ACCESS_TYPE_SHIFT	21
+#define   DST_ACCESS_TYPE_SHIFT	20
+#define   CCS_SIZE_SHIFT		8
+#define   XY_CTRL_SURF_MOCS_SHIFT	25
+#define   NUM_CCS_BYTES_PER_BLOCK	256
+#define   NUM_CCS_BLKS_PER_XFER	1024
+#define   INDIRECT_ACCESS		0
+#define   DIRECT_ACCESS		1
+#define  MI_FLUSH_LLC			BIT(9)
+#define  MI_FLUSH_CCS			BIT(16)
+
 #define COLOR_BLT_CMD			(2 << 29 | 0x40 << 22 | (5 - 2))
 #define XY_COLOR_BLT_CMD		(2 << 29 | 0x50 << 22)
 #define SRC_COPY_BLT_CMD		(2 << 29 | 0x43 << 22)
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index afb1cce9a352..0bed01750884 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -17,6 +17,7 @@ struct insert_pte_data {
 };
 
 #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
+#define GET_CCS_SIZE(i915, size)	(HAS_FLAT_CCS(i915) ? (size) >> 8 : 0)
 
 static bool engine_supports_migration(struct intel_engine_cs *engine)
 {
@@ -490,15 +491,104 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
-static int emit_clear(struct i915_request *rq, int size, u32 value)
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
+	num_blks = (GET_CCS_SIZE(i915, size) +
+			   (NUM_CCS_BYTES_PER_BLOCK - 1)) >> 8;
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
+static int emit_clear(struct i915_request *rq,
+		      int size,
+		      u32 value,
+		      bool is_lmem)
 {
 	const int ver = GRAPHICS_VER(rq->engine->i915);
 	u32 instance = rq->engine->instance;
 	u32 *cs;
+	struct drm_i915_private *i915 = rq->engine->i915;
+	u32 num_ccs_blks, ccs_ring_size;
 
 	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
 
-	cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
+	/* Clear flat css only when value is 0 */
+	ccs_ring_size = (is_lmem && !value) ?
+			 calc_ctrl_surf_instr_size(i915, size)
+			 : 0;
+
+	cs = intel_ring_begin(rq, ver >= 8 ? 8 + ccs_ring_size : 6);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
@@ -521,6 +611,30 @@ static int emit_clear(struct i915_request *rq, int size, u32 value)
 		*cs++ = value;
 	}
 
+	if (is_lmem && HAS_FLAT_CCS(i915) && !value) {
+		num_ccs_blks = (GET_CCS_SIZE(i915, size) +
+				NUM_CCS_BYTES_PER_BLOCK - 1) >> 8;
+		/*
+		 * Flat CCS surface can only be accessed via
+		 * XY_CTRL_SURF_COPY_BLT CMD and using indirect
+		 * mapping of associated LMEM.
+		 * We can clear ccs surface by writing all 0s,
+		 * so we will flush the previously cleared buffer
+		 * and use it as a source.
+		 */
+
+		cs = i915_flush_dw(cs, (u64)instance << 32,
+				   MI_FLUSH_LLC | MI_FLUSH_CCS);
+		cs = _i915_ctrl_surf_copy_blt(cs,
+					      (u64)instance << 32,
+					      (u64)instance << 32,
+					      DIRECT_ACCESS,
+					      INDIRECT_ACCESS,
+					      1, 1,
+					      num_ccs_blks);
+		cs = i915_flush_dw(cs, (u64)instance << 32,
+				   MI_FLUSH_LLC | MI_FLUSH_CCS);
+	}
 	intel_ring_advance(rq, cs);
 	return 0;
 }
@@ -581,7 +695,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		err = emit_clear(rq, len, value);
+		err = emit_clear(rq, len, value, is_lmem);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-- 
2.20.1

