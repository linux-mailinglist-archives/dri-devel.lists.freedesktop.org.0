Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E200A4E32C4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 23:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937D410E49B;
	Mon, 21 Mar 2022 22:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F1310E05D;
 Mon, 21 Mar 2022 22:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647902668; x=1679438668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5KszfNdaZBps+2xX48R/GU+VDsNb0geRNtkAfr71j50=;
 b=QP4yEqRst75eoDVxH5GkMA4dAu7ZsxHR9tfrIYHyaun3DpJXdG4EhfFx
 o50glO+YOuO1ZRtAWCcJPYX/CAU62fH2Tj5nA2imBQJuQs+fmJ6tj7KPt
 3iuAXAE910La1vnxL2AzbhFFCedn+BBDChyid5Tuxhro6Pkt94pqWeMoq
 EcxNT2HekSqQ/MtIqPeorI/IKyBMeB/O7e3j3jw1EOd2CmF4CrOT2Sl96
 rfTU6eD/YGU4g+Did4/blaD0I38aOp35eEATIbuI+oHP9AA+pGfkw6jf1
 mHkSn2Hv1Qji4yOWZZ1gFSrRnmJI6nd4O7chYUUZ0IWO5gcTWK3DQL1oL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257613678"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="257613678"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="543414172"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:25 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 1/9] drm/i915/gt: Use XY_FAST_COLOR_BLT to clear obj on
 graphics ver 12+
Date: Tue, 22 Mar 2022 04:14:51 +0530
Message-Id: <20220321224459.12223-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220321224459.12223-1-ramalingam.c@intel.com>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
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
 Matthew Auld <matthew.auld@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use faster XY_FAST_COLOR_BLT cmd on graphics version of 12 and more,
for clearing (Zero out) the pages of the newly allocated object.

XY_FAST_COLOR_BLT is faster than the older XY_COLOR_BLT.

v2:
  Typo fix at title [Thomas]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
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

