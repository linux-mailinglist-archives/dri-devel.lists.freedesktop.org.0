Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB56870F6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 23:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BCE10E1AD;
	Wed,  1 Feb 2023 22:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71A610E1A3;
 Wed,  1 Feb 2023 22:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675290517; x=1706826517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=74vq66cGI/CTy0tEaC/WPOtRAtPA/2ahr0MfCaEw4xg=;
 b=kTPePUs2ps72qX2IXZZjfjqOak7x3YKjdB4bHyAcN8dGJ3Et4HyUJ38V
 lx6j6WcdhvkVI6EoEcHniUjh7yySynW1dOLC9l6POwguKWqrWe2DdxjLd
 LF2i63+X0iIf38zAQHmPyPEZGgks52Co5i9U6nigZWUdJyDIqLOegz9Ln
 x6Mk/zeLyocR46P2BMm46mxUGJXOOOmKbEpyMtAqrr03MYD/aSsMFAke5
 VDbLzhmqh3mIKBNlNXep+cmKdQhTM7437/eSX2bjx6Llt9ZXrUJabPoXx
 e4fwVIiZc3lmrRkOiTaxf8eMCcNWKVl9PvGXiG7EgpAa9lbOvDwwZOOun A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355626151"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="355626151"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 14:28:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807733576"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="807733576"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 14:28:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/gen11: Wa_1408615072/Wa_1407596294 should be on
 GT list
Date: Wed,  1 Feb 2023 14:28:29 -0800
Message-Id: <20230201222831.608281-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201222831.608281-1-matthew.d.roper@intel.com>
References: <20230201222831.608281-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The UNSLICE_UNIT_LEVEL_CLKGATE register programmed by this workaround
has 'BUS' style reset, indicating that it does not lose its value on
engine resets.  Furthermore, this register is part of the GT forcewake
domain rather than the RENDER domain, so it should not be impacted by
RCS engine resets.  As such, we should implement this on the GT
workaround list rather than an engine list.

Bspec: 19219
Fixes: 3551ff928744 ("drm/i915/gen11: Moving WAs to rcs_engine_wa_init()")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index f45ca3d4a07c..7e93ba6b3208 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1405,6 +1405,13 @@ icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 		    GAMT_CHKN_BIT_REG,
 		    GAMT_CHKN_DISABLE_L3_COH_PIPE);
 
+	/*
+	 * Wa_1408615072:icl,ehl  (vsunit)
+	 * Wa_1407596294:icl,ehl  (hsunit)
+	 */
+	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
+		    VSUNIT_CLKGATE_DIS | HSUNIT_CLKGATE_DIS);
+
 	/* Wa_1407352427:icl,ehl */
 	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
 		    PSDUNIT_CLKGATE_DIS);
@@ -2536,13 +2543,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		wa_masked_en(wal, GEN9_CSFE_CHICKEN1_RCS,
 			     GEN11_ENABLE_32_PLANE_MODE);
 
-		/*
-		 * Wa_1408615072:icl,ehl  (vsunit)
-		 * Wa_1407596294:icl,ehl  (hsunit)
-		 */
-		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
-			    VSUNIT_CLKGATE_DIS | HSUNIT_CLKGATE_DIS);
-
 		/*
 		 * Wa_1408767742:icl[a2..forever],ehl[all]
 		 * Wa_1605460711:icl[a0..c0]
-- 
2.39.1

