Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F9D3BEDBB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 20:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08196E19C;
	Wed,  7 Jul 2021 18:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876FB6E1A4;
 Wed,  7 Jul 2021 18:13:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209316965"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="209316965"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:13:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="457570319"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:13:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/gt: finish INTEL_GEN and friends conversion
Date: Wed,  7 Jul 2021 11:13:23 -0700
Message-Id: <20210707181325.2130821-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707181325.2130821-1-lucas.demarchi@intel.com>
References: <20210707181325.2130821-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit c816723b6b8a ("drm/i915/gt: replace IS_GEN and friends with
GRAPHICS_VER") converted INTEL_GEN and friends to the new version check
macros.  Meanwhile, some changes sneaked in to use INTEL_GEN. Remove the
last users so we can remove the macros.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 23c59ce66cee..14afa1974ea5 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -277,7 +277,7 @@ static int emit_pte(struct i915_request *rq,
 	u32 *hdr, *cs;
 	int pkt;
 
-	GEM_BUG_ON(INTEL_GEN(rq->engine->i915) < 8);
+	GEM_BUG_ON(GRAPHICS_VER(rq->engine->i915) < 8);
 
 	/* Compute the page directory offset for the target address range */
 	offset += (u64)rq->engine->instance << 32;
@@ -347,11 +347,11 @@ static int emit_pte(struct i915_request *rq,
 	return total;
 }
 
-static bool wa_1209644611_applies(int gen, u32 size)
+static bool wa_1209644611_applies(int ver, u32 size)
 {
 	u32 height = size >> PAGE_SHIFT;
 
-	if (gen != 11)
+	if (ver != 11)
 		return false;
 
 	return height % 4 == 3 && height <= 8;
@@ -359,15 +359,15 @@ static bool wa_1209644611_applies(int gen, u32 size)
 
 static int emit_copy(struct i915_request *rq, int size)
 {
-	const int gen = INTEL_GEN(rq->engine->i915);
+	const int ver = GRAPHICS_VER(rq->engine->i915);
 	u32 instance = rq->engine->instance;
 	u32 *cs;
 
-	cs = intel_ring_begin(rq, gen >= 8 ? 10 : 6);
+	cs = intel_ring_begin(rq, ver >= 8 ? 10 : 6);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
-	if (gen >= 9 && !wa_1209644611_applies(gen, size)) {
+	if (ver >= 9 && !wa_1209644611_applies(ver, size)) {
 		*cs++ = GEN9_XY_FAST_COPY_BLT_CMD | (10 - 2);
 		*cs++ = BLT_DEPTH_32 | PAGE_SIZE;
 		*cs++ = 0;
@@ -378,7 +378,7 @@ static int emit_copy(struct i915_request *rq, int size)
 		*cs++ = PAGE_SIZE;
 		*cs++ = 0; /* src offset */
 		*cs++ = instance;
-	} else if (gen >= 8) {
+	} else if (ver >= 8) {
 		*cs++ = XY_SRC_COPY_BLT_CMD | BLT_WRITE_RGBA | (10 - 2);
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_SRC_COPY | PAGE_SIZE;
 		*cs++ = 0;
@@ -491,17 +491,17 @@ intel_context_migrate_copy(struct intel_context *ce,
 
 static int emit_clear(struct i915_request *rq, int size, u32 value)
 {
-	const int gen = INTEL_GEN(rq->engine->i915);
+	const int ver = GRAPHICS_VER(rq->engine->i915);
 	u32 instance = rq->engine->instance;
 	u32 *cs;
 
 	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
 
-	cs = intel_ring_begin(rq, gen >= 8 ? 8 : 6);
+	cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
-	if (gen >= 8) {
+	if (ver >= 8) {
 		*cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (7 - 2);
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
 		*cs++ = 0;
-- 
2.31.1

