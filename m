Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431F5F0412
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 07:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DC010EB58;
	Fri, 30 Sep 2022 05:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6494D10E18A;
 Fri, 30 Sep 2022 05:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664514592; x=1696050592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wtOU1q1kAgSXF7iNDzop8vycjK3TL69rdvFAm8PMaBQ=;
 b=RYjDdLS2BX4JyICGPdP4szb4oZ3xMbxjFNfogBNM2lb2CknQxKiyus35
 n/cqjbNehzfgHwakqMsqe2vN45uQk/v+uBu2WW5z4GmDa3O/NVx2vt7HW
 ZSI24kKwVFwC/p19X9Ov4OacIFOPHRXtCVkYs7RuQ192DzCZBId+tsftN
 Ti0H3nJseWQPRX0ghQoPUtCqAQdFgog+l3xTCKK6/wJ6U/1FzqBouKFH0
 OrBJkHzeCmEtGpj9WDRggYAvw40XFEpRVHdNoiZdsj9CoeMpU/abqTiR+
 b74I+0SJUBEuTPNfAnz22JW8yiTU1MNhzHGXS+SwmzJODI6E2injlOKa9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="282469423"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="282469423"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:09:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="711668532"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="711668532"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:09:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Fix __gen125_emit_bb_start() without WA
Date: Thu, 29 Sep 2022 22:09:01 -0700
Message-Id: <20220930050903.3479619-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930050903.3479619-1-lucas.demarchi@intel.com>
References: <20220930050903.3479619-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ce->wa_bb_page is allocated only for graphics version 12. However
__gen125_emit_bb_start() is used for any graphics version >= 12.50. For
the currently supported platforms this is not an issue, but for future
ones there's a mismatch causing the jump to
`wa_offset + DG2_PREDICATE_RESULT_BB` to be invalid since wa_offset is
not correct.

As in other places in the driver, check for graphics version "greater or
equal" to future-proof the support for new platforms.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c |  2 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c      | 19 +++++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 31a2fbd8c4a8..e000eaf8abed 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -405,6 +405,8 @@ static int __gen125_emit_bb_start(struct i915_request *rq,
 	u32 wa_offset = lrc_indirect_bb(ce);
 	u32 *cs;
 
+	GEM_BUG_ON(!ce->wa_bb_page);
+
 	cs = intel_ring_begin(rq, 12);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index e84ef3859934..3515882a91fb 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -825,19 +825,18 @@ static int lrc_ring_cmd_buf_cctl(const struct intel_engine_cs *engine)
 static u32
 lrc_ring_indirect_offset_default(const struct intel_engine_cs *engine)
 {
-	switch (GRAPHICS_VER(engine->i915)) {
-	default:
-		MISSING_CASE(GRAPHICS_VER(engine->i915));
-		fallthrough;
-	case 12:
+	if (GRAPHICS_VER(engine->i915) >= 12)
 		return GEN12_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT;
-	case 11:
+	else if (GRAPHICS_VER(engine->i915) >= 11)
 		return GEN11_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT;
-	case 9:
+	else if (GRAPHICS_VER(engine->i915) >= 9)
 		return GEN9_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT;
-	case 8:
+	else if (GRAPHICS_VER(engine->i915) >= 8)
 		return GEN8_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT;
-	}
+
+	GEM_BUG_ON(GRAPHICS_VER(engine->i915) < 8);
+
+	return 0;
 }
 
 static void
@@ -1092,7 +1091,7 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
 		context_size += I915_GTT_PAGE_SIZE; /* for redzone */
 
-	if (GRAPHICS_VER(engine->i915) == 12) {
+	if (GRAPHICS_VER(engine->i915) >= 12) {
 		ce->wa_bb_page = context_size / PAGE_SIZE;
 		context_size += PAGE_SIZE;
 	}
-- 
2.37.3

