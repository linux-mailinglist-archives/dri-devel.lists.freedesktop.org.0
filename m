Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97FE4E9F6D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 21:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6446B10EC7E;
	Mon, 28 Mar 2022 19:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5E910EC71;
 Mon, 28 Mar 2022 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648494423; x=1680030423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c3A47C0Ig0N2/HwHr1SkXYAa3nCNC/q8wD8RONd6V8A=;
 b=cxJG+yki+wFAI1DkpasmScVOE6vyns+rdjNUfLVO11gEnVsSFHwhDAR4
 qIBKRWuXxdkt/AK3SAhejQGEJtdVSmFulUkUszjZO5rREX3jacFBsfJ3y
 fbXmr+fc3A1Ipu0VsgJ9ZqyAkwWVRVbkurknn0DYMNLz8wCZAnwuVi9ay
 L8UGuYgdA/lfRAn5MYlH9bz0Fcd3ymHyTicV1d08upFvp1i7igYm6gl31
 n5n5bVGRdIAAj/27fjKAzREerE7l4/VAqInoFqsP44/Xufue3jME6B9CH
 lWax1goyWrdW5fSae2WdwCmjPvH9AKB5L43Iw8KknCWaFQcIzet3cmfYS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239678673"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="239678673"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:07:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563920931"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:07:00 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 2/9] drm/i915/gt: Use XY_FAST_COLOR_BLT to clear obj on
 graphics ver 12+
Date: Tue, 29 Mar 2022 00:37:29 +0530
Message-Id: <20220328190736.19697-3-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use faster XY_FAST_COLOR_BLT cmd on graphics version of 12 and more,
for clearing (Zero out) the pages of the newly allocated object.

XY_FAST_COLOR_BLT is faster than the older XY_COLOR_BLT.

v2:
  Typo fix at title [Thomas]
v3:
  XY_FAST_COLOR_BLT is used only for FLAT_CCS capable gen12+

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
index 9e6c98a17441..17dd372a47d1 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -614,18 +614,51 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
-static int emit_clear(struct i915_request *rq, u32 offset, int size, u32 value)
+static int emit_clear(struct i915_request *rq, u32 offset, int size,
+		      u32 value, bool is_lmem)
 {
-	const int ver = GRAPHICS_VER(rq->engine->i915);
+	struct drm_i915_private *i915 = rq->engine->i915;
+	int mocs = rq->engine->gt->mocs.uc_index << 1;
+	const int ver = GRAPHICS_VER(i915);
+	int ring_sz;
 	u32 *cs;
 
 	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
 
-	cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
+	if (HAS_FLAT_CCS(i915) && ver >= 12)
+		ring_sz = XY_FAST_COLOR_BLT_DW;
+	else if (ver >= 8)
+		ring_sz = 8;
+	else
+		ring_sz = 6;
+
+	cs = intel_ring_begin(rq, ring_sz);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
-	if (ver >= 8) {
+	if (HAS_FLAT_CCS(i915) && ver >= 12) {
+		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
+			(XY_FAST_COLOR_BLT_DW - 2);
+		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
+			(PAGE_SIZE - 1);
+		*cs++ = 0;
+		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
+		*cs++ = offset;
+		*cs++ = rq->engine->instance;
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
@@ -708,7 +741,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		err = emit_clear(rq, offset, len, value);
+		err = emit_clear(rq, offset, len, value, is_lmem);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-- 
2.20.1

