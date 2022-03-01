Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDFA4C97D9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 22:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701EA10E2A7;
	Tue,  1 Mar 2022 21:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F0710E2A7;
 Tue,  1 Mar 2022 21:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646170661; x=1677706661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omUm03thqW5JLuWUxAApUOGOuHOABGiMIY2mozj1WHI=;
 b=Vv85HbHceT/DD9yXKOt9qGBZOgZFsjuXo8Rv185wcRSqFMX5Gz6gOLXw
 YcqYp4NrVD0gVkiQ7bup1hBxiE5EXSgKKEsp5L2b3bZUCv4HCXorq/lHr
 3NshtSO+9X26FzTmxGShHXaRuodzeCvlCQmY9ain1W5MESnHQt+3sIHDl
 yxD8R3ncqqDp9p/5V3hosjTqHw+K48VZJ4lCWjrSGBbvrf0T8TVgNhIOB
 qVod5c5aFCupsGZvkM1SFIVt+IEF8SWzLroClxbrOb93/852dOg7ezx/G
 3o6CEuEd57aft3BaAmRQ6l1mtrQWqWdF5JTgpo/FBDwnboUXKaHjH0xDZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="339681078"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="339681078"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 13:37:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="493272573"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 13:37:14 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6] drm/i915/gt: Clear compress metadata for Xe_HP platforms
Date: Wed,  2 Mar 2022 03:07:37 +0530
Message-Id: <20220301213737.31812-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>

Xe-HP and latest devices support Flat CCS which reserved a portion of
the device memory to store compression metadata, during the clearing of
device memory buffer object we also need to clear the associated
CCS buffer.

Flat CCS memory can not be directly accessed by S/W.
Address of CCS buffer associated main BO is automatically calculated
by device itself. KMD/UMD can only access this buffer indirectly using
XY_CTRL_SURF_COPY_BLT cmd via the address of device memory buffer.

v2: Fixed issues with platform naming [Lucas]
v3: Rebased [Ram]
    Used the round_up funcs [Bob]
v4: Fixed ccs blk calculation [Ram]
    Added Kdoc on flat-ccs.
v5: GENMASK is used [Matt]
    mocs fix [Matt]
    Comments Fix [Matt]
    Flush address programming [Ram]
v6: FLUSH_DW is fixed
    Few coding style fix

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  15 ++
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 143 ++++++++++++++++++-
 2 files changed, 154 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index f8253012d166..237c1baccc64 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -203,6 +203,21 @@
 #define GFX_OP_DRAWRECT_INFO     ((0x3<<29)|(0x1d<<24)|(0x80<<16)|(0x3))
 #define GFX_OP_DRAWRECT_INFO_I965  ((0x7900<<16)|0x2)
 
+#define XY_CTRL_SURF_INSTR_SIZE	5
+#define MI_FLUSH_DW_SIZE		3
+#define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
+#define   SRC_ACCESS_TYPE_SHIFT		21
+#define   DST_ACCESS_TYPE_SHIFT		20
+#define   CCS_SIZE_MASK			GENMASK(17, 8)
+#define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 25)
+#define   NUM_CCS_BYTES_PER_BLOCK	256
+#define   NUM_BYTES_PER_CCS_BYTE	256
+#define   NUM_CCS_BLKS_PER_XFER		1024
+#define   INDIRECT_ACCESS		0
+#define   DIRECT_ACCESS			1
+#define  MI_FLUSH_LLC			BIT(9)
+#define  MI_FLUSH_CCS			BIT(16)
+
 #define COLOR_BLT_CMD			(2 << 29 | 0x40 << 22 | (5 - 2))
 #define XY_COLOR_BLT_CMD		(2 << 29 | 0x50 << 22)
 #define SRC_COPY_BLT_CMD		(2 << 29 | 0x43 << 22)
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 20444d6ceb3c..330fcdc3e0cf 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -16,6 +16,8 @@ struct insert_pte_data {
 };
 
 #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
+#define GET_CCS_BYTES(i915, size)	(HAS_FLAT_CCS(i915) ? \
+					 DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0)
 
 static bool engine_supports_migration(struct intel_engine_cs *engine)
 {
@@ -467,6 +469,110 @@ static bool wa_1209644611_applies(int ver, u32 size)
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
+ * When we exhaust the lmem, if the object's placements support smem, then we can
+ * directly decompress the compressed lmem object into smem and start using it
+ * from smem itself.
+ *
+ * But when we need to swapout the compressed lmem object into a smem region
+ * though objects' placement doesn't support smem, then we copy the lmem content
+ * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
+ * When the object is referred, lmem content will be swaped in along with
+ * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
+ * location.
+ */
+
+static inline u32 *i915_flush_dw(u32 *cmd, u32 flags)
+{
+	*cmd++ = MI_FLUSH_DW | flags;
+	*cmd++ = 0;
+	*cmd++ = 0;
+
+	return cmd;
+}
+
+static u32 calc_ctrl_surf_instr_size(struct drm_i915_private *i915, int size)
+{
+	u32 num_cmds, num_blks, total_size;
+
+	if (!GET_CCS_BYTES(i915, size))
+		return 0;
+
+	/*
+	 * XY_CTRL_SURF_COPY_BLT transfers CCS in 256 byte
+	 * blocks. one XY_CTRL_SURF_COPY_BLT command can
+	 * transfer upto 1024 blocks.
+	 */
+	num_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
+				NUM_CCS_BYTES_PER_BLOCK);
+	num_cmds = DIV_ROUND_UP(num_blks, NUM_CCS_BLKS_PER_XFER);
+	total_size = XY_CTRL_SURF_INSTR_SIZE * num_cmds;
+
+	/*
+	 * Adding a flush before and after XY_CTRL_SURF_COPY_BLT
+	 */
+	total_size += 2 * MI_FLUSH_DW_SIZE;
+
+	return total_size;
+}
+
+static u32 *_i915_ctrl_surf_copy_blt(u32 *cmd, u64 src_addr, u64 dst_addr,
+				     u8 src_mem_access, u8 dst_mem_access,
+				     int src_mocs, int dst_mocs,
+				     u32 ccs_blocks)
+{
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
+		int blks_per_copy;
+
+		blks_per_copy = ccs_blocks >= NUM_CCS_BLKS_PER_XFER ?
+				NUM_CCS_BLKS_PER_XFER : ccs_blocks;
+		*cmd++ = XY_CTRL_SURF_COPY_BLT |
+			 src_mem_access << SRC_ACCESS_TYPE_SHIFT |
+			 dst_mem_access << DST_ACCESS_TYPE_SHIFT |
+			 FIELD_PREP(CCS_SIZE_MASK, blks_per_copy - 1);
+		*cmd++ = lower_32_bits(src_addr);
+		*cmd++ = (upper_32_bits(src_addr) & 0xFFFF) |
+			  FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, src_mocs);
+		*cmd++ = lower_32_bits(dst_addr);
+		*cmd++ = (upper_32_bits(dst_addr) & 0xFFFF) |
+			  FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, dst_mocs);
+		src_addr += SZ_64M;
+		dst_addr += SZ_64M;
+		ccs_blocks -= blks_per_copy;
+	} while (ccs_blocks > 0);
+
+	return cmd;
+}
+
 static int emit_copy(struct i915_request *rq,
 		     u32 dst_offset, u32 src_offset, int size)
 {
@@ -614,16 +720,24 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
-static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
+static int emit_clear(struct i915_request *rq, u64 offset, int size,
+		      u32 value, bool is_lmem)
 {
-	const int ver = GRAPHICS_VER(rq->engine->i915);
+	struct drm_i915_private *i915 = rq->engine->i915;
+	const int ver = GRAPHICS_VER(i915);
+	u32 num_ccs_blks, ccs_ring_size;
+	int mocs = rq->engine->gt->mocs.uc_index << 1;
 	u32 *cs;
 
 	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
 
 	offset += (u64)rq->engine->instance << 32;
 
-	cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
+	/* Clear CCS only when value is 0 */
+	ccs_ring_size = (is_lmem && !value) ?
+			 calc_ctrl_surf_instr_size(i915, size) : 0;
+
+	cs = intel_ring_begin(rq, round_up(ver >= 8 ? 8 + ccs_ring_size : 6, 2));
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
@@ -646,6 +760,27 @@ static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
 		*cs++ = value;
 	}
 
+	if (is_lmem && HAS_FLAT_CCS(i915) && !value) {
+		num_ccs_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
+					    NUM_CCS_BYTES_PER_BLOCK);
+
+		/*
+		 * Flat CCS surface can only be accessed via
+		 * XY_CTRL_SURF_COPY_BLT CMD and using indirect
+		 * mapping of associated LMEM.
+		 * We can clear ccs surface by writing all 0s,
+		 * so we will flush the previously cleared buffer
+		 * and use it as a source.
+		 */
+		cs = i915_flush_dw(cs, MI_FLUSH_LLC | MI_FLUSH_CCS);
+		cs = _i915_ctrl_surf_copy_blt(cs, offset, offset,
+					      DIRECT_ACCESS, INDIRECT_ACCESS,
+					      mocs, mocs, num_ccs_blks);
+		cs = i915_flush_dw(cs, MI_FLUSH_LLC | MI_FLUSH_CCS);
+
+		if (ccs_ring_size & 1)
+			*cs++ = MI_NOOP;
+	}
 	intel_ring_advance(rq, cs);
 	return 0;
 }
@@ -711,7 +846,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		err = emit_clear(rq, offset, len, value);
+		err = emit_clear(rq, offset, len, value, is_lmem);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-- 
2.20.1

