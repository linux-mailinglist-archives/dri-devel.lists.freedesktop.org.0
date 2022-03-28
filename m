Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313724E9F6F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 21:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D7F10EC80;
	Mon, 28 Mar 2022 19:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A1810EC83;
 Mon, 28 Mar 2022 19:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648494427; x=1680030427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YvORd1RXEzCwvD17yXmu+ZTVe9aMNsL8yuV4h2oaGgY=;
 b=bTKu0RrxKaqm6Y23ZD4Lf6cNbnGQD6cCgHNc2hJzRC3uEOsZbTjuwvkW
 QA/K5HspZXWjBpbJonxTFezTuZR25jQDez+kUnhC6goa6azY/139RLlBZ
 k2C/bI9yfe5I2uhB5zWDWUhgPFOPA8dXYpO8y3dZeiMfV++pOm+eI6vYh
 hDvo5QDDabnWUl3JWLGztmARvvOPbpqJDruL8y4L/5hi6Hocyza35kpnR
 beKQz80eo2s/r63jaIz1H9p3oH3AhxaUvYKiv8bk1xwCkDB/2m2PmgQRC
 Kqd1HgMMMNuUDXCOYW8rkOBi3QCq5IuQFf0RTbaaYIJ00kVM8cFkxX+i2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239678687"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="239678687"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:07:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563920985"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:07:05 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 4/9] drm/i915/gt: Clear compress metadata for Flat-ccs
 objects
Date: Tue, 29 Mar 2022 00:37:31 +0530
Message-Id: <20220328190736.19697-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220328190736.19697-1-ramalingam.c@intel.com>
References: <20220328190736.19697-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe-HP and latest devices support Flat CCS which reserved a portion of
the device memory to store compression metadata, during the clearing of
device memory buffer object we also need to clear the associated
CCS buffer.

XY_CTRL_SURF_COPY_BLT is a BLT cmd used for reading and writing the
ccs surface of a lmem memory. So on Flat-CCS capable platform we use
XY_CTRL_SURF_COPY_BLT  to clear the CCS meta data.

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
v7: Adopting the XY_FAST_COLOR_BLT (Thomas]
v8: XY_CTRL_SURF_COPY_BLT for ccs clearing.
v9: emit_copy_ccs is used.
v10: ctrl_surf cmds are filled in caller itself. [Thomas]
     only one ctrl surf cmd is used as size of lmem is <=8M [Thomas]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  16 +++
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 137 ++++++++++++++++++-
 2 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 925e55b6a94f..372ef4c3ce2a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -153,8 +153,10 @@
 #define   MI_FLUSH_DW_PROTECTED_MEM_EN	(1 << 22)
 #define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
 #define   MI_INVALIDATE_TLB		(1<<18)
+#define   MI_FLUSH_DW_CCS		(1<<16)
 #define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
 #define   MI_FLUSH_DW_OP_MASK		(3<<14)
+#define   MI_FLUSH_DW_LLC		(1<<9)
 #define   MI_FLUSH_DW_NOTIFY		(1<<8)
 #define   MI_INVALIDATE_BSD		(1<<7)
 #define   MI_FLUSH_DW_USE_GTT		(1<<2)
@@ -203,6 +205,20 @@
 #define GFX_OP_DRAWRECT_INFO     ((0x3<<29)|(0x1d<<24)|(0x80<<16)|(0x3))
 #define GFX_OP_DRAWRECT_INFO_I965  ((0x7900<<16)|0x2)
 
+#define XY_CTRL_SURF_INSTR_SIZE		5
+#define MI_FLUSH_DW_SIZE		3
+#define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
+#define   SRC_ACCESS_TYPE_SHIFT		21
+#define   DST_ACCESS_TYPE_SHIFT		20
+#define   CCS_SIZE_MASK			0x3FF
+#define   CCS_SIZE_SHIFT		8
+#define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 25)
+#define   NUM_CCS_BYTES_PER_BLOCK	256
+#define   NUM_BYTES_PER_CCS_BYTE	256
+#define   NUM_CCS_BLKS_PER_XFER		1024
+#define   INDIRECT_ACCESS		0
+#define   DIRECT_ACCESS			1
+
 #define COLOR_BLT_CMD			(2 << 29 | 0x40 << 22 | (5 - 2))
 #define XY_COLOR_BLT_CMD		(2 << 29 | 0x50 << 22)
 #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index ec9a9e7cb388..0657d33fedac 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -17,6 +17,8 @@ struct insert_pte_data {
 
 #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
 
+#define GET_CCS_BYTES(i915, size)	(HAS_FLAT_CCS(i915) ? \
+					 DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0)
 static bool engine_supports_migration(struct intel_engine_cs *engine)
 {
 	if (!engine)
@@ -467,6 +469,123 @@ static bool wa_1209644611_applies(int ver, u32 size)
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
+static int emit_copy_ccs(struct i915_request *rq,
+			 u32 dst_offset, u8 dst_access,
+			 u32 src_offset, u8 src_access, int size)
+{
+	struct drm_i915_private *i915 = rq->engine->i915;
+	int mocs = rq->engine->gt->mocs.uc_index << 1;
+	u32 num_ccs_blks, ccs_ring_size;
+	u32 *cs;
+
+	ccs_ring_size = calc_ctrl_surf_instr_size(i915, size);
+	WARN_ON(!ccs_ring_size);
+
+	cs = intel_ring_begin(rq, round_up(ccs_ring_size, 2));
+	if (IS_ERR(cs))
+		return PTR_ERR(cs);
+
+	num_ccs_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
+				    NUM_CCS_BYTES_PER_BLOCK);
+	GEM_BUG_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER);
+	cs = i915_flush_dw(cs, MI_FLUSH_DW_LLC | MI_FLUSH_DW_CCS);
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
+	*cs++ = XY_CTRL_SURF_COPY_BLT |
+		src_access << SRC_ACCESS_TYPE_SHIFT |
+		dst_access << DST_ACCESS_TYPE_SHIFT |
+		((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
+	*cs++ = src_offset;
+	*cs++ = rq->engine->instance |
+		FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, mocs);
+	*cs++ = dst_offset;
+	*cs++ = rq->engine->instance |
+		FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, mocs);
+
+	cs = i915_flush_dw(cs, MI_FLUSH_DW_LLC | MI_FLUSH_DW_CCS);
+	if (ccs_ring_size & 1)
+		*cs++ = MI_NOOP;
+
+	intel_ring_advance(rq, cs);
+
+	return 0;
+}
+
 static int emit_copy(struct i915_request *rq,
 		     u32 dst_offset, u32 src_offset, int size)
 {
@@ -687,6 +806,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 			    u32 value,
 			    struct i915_request **out)
 {
+	struct drm_i915_private *i915 = ce->engine->i915;
 	struct sgt_dma it = sg_sgt(sg);
 	struct i915_request *rq;
 	u32 offset;
@@ -698,7 +818,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
 	offset = 0;
-	if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
+	if (HAS_64K_PAGES(i915) && is_lmem)
 		offset = CHUNK_SZ;
 
 	do {
@@ -740,6 +860,21 @@ intel_context_migrate_clear(struct intel_context *ce,
 			goto out_rq;
 
 		err = emit_clear(rq, offset, len, value, is_lmem);
+		if (err)
+			goto out_rq;
+
+		if (HAS_FLAT_CCS(i915) && is_lmem && !value) {
+			/*
+			 * copy the content of memory into corresponding
+			 * ccs surface
+			 */
+			err = emit_copy_ccs(rq, offset, INDIRECT_ACCESS, offset,
+					    DIRECT_ACCESS, len);
+			if (err)
+				goto out_rq;
+		}
+
+		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-- 
2.20.1

