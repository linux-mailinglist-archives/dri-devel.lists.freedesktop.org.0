Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543404A5A4B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614FF10EC0B;
	Tue,  1 Feb 2022 10:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCFD10E8E0;
 Tue,  1 Feb 2022 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712127; x=1675248127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H5x9S16nfKL//eF/NT0kRN9/Z8Ke4Cd6YYFXo1LzITw=;
 b=nm7iwkDcQbIqZnxKpvPTUphWBOFHfRScz9AlGUjSbgbnn8DXSysyIbmw
 LndyLFE/WmfmsIBQaKydqCDAQcCS0b9v3pRqLO6BdslcWBTfpRAXu9/Rf
 tu7uQ6G8xmBhW7gkOm9DNhdty/uMUOz2E4aF9GT0ny11bD8fSFyKstxT5
 bUQVM3dTBemXlkyCL8rO/IpXUxoqhY+Sc5mjBjPxHifzPhYSPRyC3CEXs
 ZyUKZlDbl4hFJqPfE48z+7rMviwaDrRGgvzt2TuBWMFRyYyzGH689+j4v
 SZwK552gv3FuFwbXUsXle8Ak0V0b2ZrveDeu9mnulJ7wIzq0OowvCh9lQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020638"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020638"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011268"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:04 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 12/19] drm/i915/gt: Clear compress metadata for Xe_HP
 platforms
Date: Tue,  1 Feb 2022 16:11:25 +0530
Message-Id: <20220201104132.3050-13-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220201104132.3050-1-ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 CQ Tang <cq.tang@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
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

Cc: CQ Tang <cq.tang@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  14 +++
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 114 ++++++++++++++++++-
 2 files changed, 125 insertions(+), 3 deletions(-)

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
index cac791155244..3e1cf224cdf0 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -16,6 +16,8 @@ struct insert_pte_data {
 };
 
 #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
+#define GET_CCS_SIZE(i915, size)	(HAS_FLAT_CCS(i915) ? \
+					DIV_ROUND_UP(size, NUM_CCS_BYTES_PER_BLOCK) : 0)
 
 static bool engine_supports_migration(struct intel_engine_cs *engine)
 {
@@ -594,19 +596,105 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
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
 static int emit_clear(struct i915_request *rq,
 		      u64 offset,
 		      int size,
-		      u32 value)
+		      u32 value,
+		      bool is_lmem)
 {
+	struct drm_i915_private *i915 = rq->engine->i915;
 	const int ver = GRAPHICS_VER(rq->engine->i915);
+	u32 num_ccs_blks, ccs_ring_size;
 	u32 *cs;
 
 	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
 
 	offset += (u64)rq->engine->instance << 32;
 
-	cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
+	/* Clear flat css only when value is 0 */
+	ccs_ring_size = (is_lmem && !value) ?
+			 calc_ctrl_surf_instr_size(i915, size)
+			 : 0;
+
+	cs = intel_ring_begin(rq, round_up(ver >= 8 ? 8 + ccs_ring_size : 6, 2));
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
@@ -629,6 +717,26 @@ static int emit_clear(struct i915_request *rq,
 		*cs++ = value;
 	}
 
+	if (is_lmem && HAS_FLAT_CCS(i915) && !value) {
+		num_ccs_blks = GET_CCS_SIZE(i915, size);
+
+		/*
+		 * Flat CCS surface can only be accessed via
+		 * XY_CTRL_SURF_COPY_BLT CMD and using indirect
+		 * mapping of associated LMEM.
+		 * We can clear ccs surface by writing all 0s,
+		 * so we will flush the previously cleared buffer
+		 * and use it as a source.
+		 */
+		cs = i915_flush_dw(cs, offset, MI_FLUSH_LLC | MI_FLUSH_CCS);
+		cs = _i915_ctrl_surf_copy_blt(cs, offset, offset,
+					      DIRECT_ACCESS, INDIRECT_ACCESS,
+					      1, 1, num_ccs_blks);
+		cs = i915_flush_dw(cs, offset, MI_FLUSH_LLC | MI_FLUSH_CCS);
+
+		if (ccs_ring_size & 1)
+			*cs++ = MI_NOOP;
+	}
 	intel_ring_advance(rq, cs);
 	return 0;
 }
@@ -694,7 +802,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		err = emit_clear(rq, offset, len, value);
+		err = emit_clear(rq, offset, len, value, is_lmem);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-- 
2.20.1

