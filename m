Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CFC4D0045
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851D410F0A9;
	Mon,  7 Mar 2022 13:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8544D10F0A9;
 Mon,  7 Mar 2022 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646660419; x=1678196419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LuRBLm4ejpO9hQzFMQ5mHMWifGuuej/Z+RiYqNbo7qs=;
 b=Aaht+ME49WmAq43BG5YphBFQmKshbZYtsUoVOAwHpQIQ/I5avqIRJkpv
 KEuZHdaInO8ShmHk638YBroXcrWAuXgsZ0mcv2zDcVE6LrEcTFSxKApo9
 kWcsg9s1OZBfJWEcfgfUemvAj0lPuDPWAwVEiHAR6v/LutpSPtT9xgOCV
 1c1A13DRzIarkhRirnhR10PR1hsFOiWie9R/uCGc4ikpgt4we5+cpguzX
 KqpyBkpImquhNSXGm5voLiBfoxChpUnxiPoOtanXB+mGnJyC1RGy75Jhc
 FUdpPrxu7sDAZhIyHOUDAm8f3/OOCyUlcgGQkQn7rL/NGhXmcY8viN/1Z w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="251963957"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="251963957"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 05:40:19 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="643248113"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 05:40:16 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 2/6] drm/i915/gt: Clear compress metadata for Flat-ccs
 objects
Date: Mon,  7 Mar 2022 19:10:34 +0530
Message-Id: <20220307134038.30525-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220307134038.30525-1-ramalingam.c@intel.com>
References: <20220307134038.30525-1-ramalingam.c@intel.com>
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
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe-HP and latest devices support Flat CCS which reserved a portion of
the device memory to store compression metadata, during the clearing of
device memory buffer object we also need to clear the associated
CCS buffer.

XY_FAST_COLOR_BLT cmd provides a option to clear the ccs metadata
corresponding to the main memory that is cleared. So on Flat-CCS capable
platform we use this option to clear the CCS meta data along with main
memory.

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

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  3 ++
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 39 ++++++++++++++++++--
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 925e55b6a94f..34cead49f35e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -207,8 +207,11 @@
 #define XY_COLOR_BLT_CMD		(2 << 29 | 0x50 << 22)
 #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
 #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
+#define   FAST_CLEAR_0			(2 << 12)
 #define   XY_FAST_COLOR_BLT_DW		16
 #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 21)
+#define   XY_FAST_COLOR_BLT_AUX_MASK	GENMASK(20, 18)
+#define   XY_FAST_COLOR_BLT_AUX_CCS_E	5
 #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
 #define SRC_COPY_BLT_CMD		(2 << 29 | 0x43 << 22)
 #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index cb68f7bf6b28..05262f1b438e 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -469,6 +469,34 @@ static bool wa_1209644611_applies(int ver, u32 size)
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
 static int emit_copy(struct i915_request *rq,
 		     u32 dst_offset, u32 src_offset, int size)
 {
@@ -621,8 +649,8 @@ static int emit_clear(struct i915_request *rq, u64 offset, int size,
 {
 	struct drm_i915_private *i915 = rq->engine->i915;
 	int mocs = rq->engine->gt->mocs.uc_index << 1;
+	u32 *cs, spl_mode = 0, aux = 0, mem_type = 0;
 	const int ver = GRAPHICS_VER(i915);
-	u32 *cs, mem_type = 0;
 	int ring_sz;
 
 	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
@@ -644,10 +672,15 @@ static int emit_clear(struct i915_request *rq, u64 offset, int size,
 		return PTR_ERR(cs);
 
 	if (ver >= 12) {
+		if (HAS_FLAT_CCS(i915)) {
+			spl_mode = FAST_CLEAR_0;
+			aux = FIELD_PREP(XY_FAST_COLOR_BLT_AUX_MASK,
+					 XY_FAST_COLOR_BLT_AUX_CCS_E);
+		}
 		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
-			(XY_FAST_COLOR_BLT_DW - 2);
+			spl_mode | (XY_FAST_COLOR_BLT_DW - 2);
 		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
-			(PAGE_SIZE - 1);
+			(PAGE_SIZE - 1) | aux;
 		*cs++ = 0;
 		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
 		*cs++ = lower_32_bits(offset);
-- 
2.20.1

