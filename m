Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487084DEAB6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 21:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE9E10EC97;
	Sat, 19 Mar 2022 20:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C1210E6DB;
 Sat, 19 Mar 2022 20:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647722518; x=1679258518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ov6Q1jWOlPThZlteD+DiyvAo7u/Yhrn7Oso3y7vEB08=;
 b=khGT+xoOqnXUrehqKWWeBbtrgn7yCgYlzMs8MtlLk3eHcUVDLoYGlam0
 KgUSWiKnFP5zBxrcbKg7gfRU7jvVh0VPyRgWx9pO6o97cjZ6Xv6Co3vV6
 5SE9evjWIJnBlGO2Vis/OXQdaooqajiCrq+AphPKSdlYfkmXw06tfJxSa
 SMcCSDiHXNZhadGIEafC/jF/scVZlqHpYLEdMFsbJq48P+se/v0dsowWM
 fKjmAUV4UUlkqsFhdfpdKZDuMR2W8NSrxnZYuFaKyBtMo3GW/vBUtwtq6
 zBumtYA7qZ7QItZydlL44LfrHInoi3afC4cm098tilQbxTiRuevnBv6Ur w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="237270086"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="237270086"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:41:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="559244969"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:41:56 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 1/8] drm/i915/gt: Use XY_FASR_COLOR_BLT to clear obj on
 graphics ver 12+
Date: Sun, 20 Mar 2022 02:12:22 +0530
Message-Id: <20220319204229.9846-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220319204229.9846-1-ramalingam.c@intel.com>
References: <20220319204229.9846-1-ramalingam.c@intel.com>
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
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

XY_FAST_COLOR_BLT cmd is faster than the older XY_COLOR_BLT. Hence for
clearing (Zero out) the pages of the newly allocated object, faster cmd
is used.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  5 +++
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 43 +++++++++++++++++---
 2 files changed, 43 insertions(+), 5 deletions(-)

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
index 20444d6ceb3c..73199ebf0671 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -614,20 +614,53 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
-static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
+static int emit_clear(struct i915_request *rq, u64 offset, int size,
+		      u32 value, bool is_lmem)
 {
-	const int ver = GRAPHICS_VER(rq->engine->i915);
+	struct drm_i915_private *i915 = rq->engine->i915;
+	int mocs = rq->engine->gt->mocs.uc_index << 1;
+	const int ver = GRAPHICS_VER(i915);
+	int ring_sz;
 	u32 *cs;
 
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
+		*cs++ = !is_lmem << XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
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
@@ -711,7 +744,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		err = emit_clear(rq, offset, len, value);
+		err = emit_clear(rq, offset, len, value, is_lmem);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-- 
2.20.1

