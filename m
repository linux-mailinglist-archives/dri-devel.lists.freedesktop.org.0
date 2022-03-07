Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABF4D0043
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57B910E6E6;
	Mon,  7 Mar 2022 13:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B49210E6E6;
 Mon,  7 Mar 2022 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646660417; x=1678196417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t8PDakrSDKB3WLBFbQ4PTT7lFNM8Qcvdj4IysheQ4A8=;
 b=gZgd1Dq52Dgk3LpJOLmnCIAj1bPmORWHq0ZqHHrN4T3+9liONaVh2Yuk
 bDgfQoXZ8PA/mIj8yYW/zoDucVUclmNvBWlclqk5TuWE7YpXYf+o3cQqK
 p3r3PGb77tz3SVYHHicwsAf6TxeznCL+zOW1pEMCuj4xkVOKjR4yWGbVD
 ybUW3zko52cv91BECLf6RyJfrwOhCcIX8erWXu1vKZN1x52WL/czJ09pa
 NehF2gEWZIO4K8UB7/mErf24pqDyZvDF2+vel1HtSK2NwJKkjolbZLc2o
 wUVkZyMBVvYnIZcqpeCY1UbjkeNpE/D4YTIMh0waBgRIyoJd4W6tyTSPs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="251963948"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="251963948"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 05:40:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="643248100"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 05:40:14 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/6] drm/i915/gt: Use XY_FASR_COLOR_BLT to clear obj on
 graphics ver 12+
Date: Mon,  7 Mar 2022 19:10:33 +0530
Message-Id: <20220307134038.30525-2-ramalingam.c@intel.com>
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

XY_FAST_COLOR_BLT cmd is faster than the older XY_COLOR_BLT. Hence for
clearing (Zero out) the pages of the newly allocated object, faster cmd
is used.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  5 ++
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 51 +++++++++++++++++---
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index d112ffd56418..925e55b6a94f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -205,6 +205,11 @@
 
 #define COLOR_BLT_CMD			(2 << 29 | 0x40 << 22 | (5 - 2))
 #define XY_COLOR_BLT_CMD		(2 << 29 | 0x50 << 22)
+#define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
+#define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
+#define   XY_FAST_COLOR_BLT_DW		16
+#define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 21)
+#define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
 #define SRC_COPY_BLT_CMD		(2 << 29 | 0x43 << 22)
 #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
 #define XY_SRC_COPY_BLT_CMD		(2 << 29 | 0x53 << 22)
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 20444d6ceb3c..cb68f7bf6b28 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -16,6 +16,8 @@ struct insert_pte_data {
 };
 
 #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
+#define GET_CCS_BYTES(i915, size)	(HAS_FLAT_CCS(i915) ? \
+					 DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0)
 
 static bool engine_supports_migration(struct intel_engine_cs *engine)
 {
@@ -614,20 +616,56 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
-static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
+static int emit_clear(struct i915_request *rq, u64 offset, int size,
+		      u32 value, bool is_lmem)
 {
-	const int ver = GRAPHICS_VER(rq->engine->i915);
-	u32 *cs;
+	struct drm_i915_private *i915 = rq->engine->i915;
+	int mocs = rq->engine->gt->mocs.uc_index << 1;
+	const int ver = GRAPHICS_VER(i915);
+	u32 *cs, mem_type = 0;
+	int ring_sz;
 
 	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
 
 	offset += (u64)rq->engine->instance << 32;
 
-	cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
+	if (ver >= 12)
+		ring_sz = 16;
+	else if (ver >= 8)
+		ring_sz = 8;
+	else
+		ring_sz = 6;
+
+	if (!is_lmem)
+		mem_type = 1 << XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
+
+	cs = intel_ring_begin(rq, ring_sz);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
-	if (ver >= 8) {
+	if (ver >= 12) {
+		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
+			(XY_FAST_COLOR_BLT_DW - 2);
+		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
+			(PAGE_SIZE - 1);
+		*cs++ = 0;
+		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
+		*cs++ = lower_32_bits(offset);
+		*cs++ = upper_32_bits(offset);
+		*cs++ = mem_type;
+		/* BG7 */
+		*cs++ = value;
+		*cs++ = 0;
+		*cs++ = 0;
+		*cs++ = 0;
+		/* BG11 */
+		*cs++ = 0;
+		*cs++ = 0;
+		/* BG13 */
+		*cs++ = 0;
+		*cs++ = 0;
+		*cs++ = 0;
+	} else if (ver >= 8) {
 		*cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (7 - 2);
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
 		*cs++ = 0;
@@ -645,7 +683,6 @@ static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
 		*cs++ = lower_32_bits(offset);
 		*cs++ = value;
 	}
-
 	intel_ring_advance(rq, cs);
 	return 0;
 }
@@ -711,7 +748,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		err = emit_clear(rq, offset, len, value);
+		err = emit_clear(rq, offset, len, value, is_lmem);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-- 
2.20.1

