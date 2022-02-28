Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F12CA4C743F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7484810E86B;
	Mon, 28 Feb 2022 17:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D561E10E84D;
 Mon, 28 Feb 2022 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070187; x=1677606187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ms2g7B4CpxD3OaGWYsJFV6y5HJWq4Miy0coNY/SeLN8=;
 b=SjhFDThpxskWyZani9KCQKO8NgC+tXaccbidqJH/040L8sTBl51deljh
 SiJVGlRAg5Efq5uXv4k/BhreNvqEOGqLLug8MmayysUXhfhBL9zOpeagp
 RgLT4uDoSxjuDA1vzmXKDrVgXuUA4bVQk5bfKKDXG3Om5wLxGH8BBVPdo
 oVqJH2Gljvvmdjp8P+cH+K+mY7vkkzPFF9+uDwzVIs/Yl7Ob8/JA+YQNJ
 KVchiCIi4PAHqKCQskfD+1nFrpij65Yo6jPHWjobKlIKBA+QVGviuxOxD
 myCyZWgaUkWCkYr6bM4ngkzBNV1GWUGT2c4sg10b2Rn0DclUtEN6ZNZ96 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="252866895"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="252866895"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:06 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392860"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/13] drm/i915/xehpsdv: Move render/compute engine reset
 domains related workarounds
Date: Mon, 28 Feb 2022 09:42:45 -0800
Message-Id: <20220228174245.1569581-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
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
Cc: Srinivasan Shanmugam <srinivasan.s@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Srinivasan Shanmugam <srinivasan.s@intel.com>

Registers that exist in the shared render/compute reset domain need to
be placed on an engine workaround list to ensure that they are properly
re-applied whenever an RCS or CCS engine is reset.  We have a number of
workarounds (updating registers MLTICTXCTL, L3SQCREG1_CCS0,
GEN12_MERT_MOD_CTRL, and GEN12_GAMCNTRL_CTRL) that are incorrectly
implemented on the 'gt' workaround list and need to be moved
accordingly.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.s@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 0b9435d62808..c014b40d2e9f 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1343,12 +1343,6 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	/* Wa_1409757795:xehpsdv */
 	wa_write_or(wal, SCCGCTL94DC, CG3DDISURB);
 
-	/* Wa_18011725039:xehpsdv */
-	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
-		wa_masked_dis(wal, MLTICTXCTL, TDONRENDER);
-		wa_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
-	}
-
 	/* Wa_16011155590:xehpsdv */
 	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
 		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
@@ -1385,19 +1379,12 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 			    GAMTLBVEBOX0_CLKGATE_DIS);
 	}
 
-	/* Wa_14012362059:xehpsdv */
-	wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
-
 	/* Wa_16012725990:xehpsdv */
 	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_FOREVER))
 		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE, VFUNIT_CLKGATE_DIS);
 
 	/* Wa_14011060649:xehpsdv */
 	wa_14011060649(gt, wal);
-
-	/* Wa_14014368820:xehpsdv */
-	wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
-		    GLOBAL_INVALIDATION_MODE);
 }
 
 static void
@@ -2617,6 +2604,19 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		/* Wa_14010449647:xehpsdv */
 		wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
 			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
+
+		/* Wa_18011725039:xehpsdv */
+		if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
+			wa_masked_dis(wal, MLTICTXCTL, TDONRENDER);
+			wa_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
+		}
+
+		/* Wa_14012362059:xehpsdv */
+		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+
+		/* Wa_14014368820:xehpsdv */
+		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
+				GLOBAL_INVALIDATION_MODE);
 	}
 }
 
-- 
2.34.1

