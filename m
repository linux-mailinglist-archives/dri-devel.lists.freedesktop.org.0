Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C189F389E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B336010E749;
	Mon, 16 Dec 2024 18:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClF1GNyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D5210E408;
 Mon, 16 Dec 2024 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734372972; x=1765908972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xOM5+AJcfHhBvERLs4amnSFc5FC1/+yhUQNuoYL8xcw=;
 b=ClF1GNynzsQz9qkVstpDsBMDk/bjgwx91YMf0gIUZtx70yy+dH9Zwopg
 WZwFrWPuxMbqZYHvpcx7IXkmy+hXOMY5jn67JeoJG4uQIcByZ8Anwqasj
 Lx64qw5nfxXaQdrSEBY+i3byAYEKWBNhDVh21vGQ/QM/haHDgA/btmoj/
 rj3QfNtHOV0lzczLIKZttk+Sxi68jVCDxjInylmL8FsPRFZ3V9izSbR3T
 sd85t4gP29ccRRODqkoIZkNRW4fgLGjrYtCSNEs2PP7DfaJuDlC9tQCJ8
 JaIwfBOBZeLBMsxlgUnAkBR7d1ZJzGKGXbJhMLb9QiNEoEI8U69aPIywp A==;
X-CSE-ConnectionGUID: 2wEJtWW4RCSDbq6JqUCJow==
X-CSE-MsgGUID: DBnnqIkDTOG5YETzF+cIOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34997172"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="34997172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 10:16:00 -0800
X-CSE-ConnectionGUID: iLQr99szRZePMHXwfsEr2A==
X-CSE-MsgGUID: YUDNf4+8RdWKNrkmVKEazw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134615375"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 16 Dec 2024 10:15:57 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/cx0_phy: Fix C10 pll programming sequence
Date: Mon, 16 Dec 2024 23:45:54 +0530
Message-Id: <20241216181554.2861381-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to spec VDR_CUSTOM_WIDTH register gets programmed after pll
specific VDR registers and TX Lane programming registers are done.
Moreover we only program into C10_VDR_CONTROL1 to update config and
setup master lane once all VDR registers are written into.
Bspec: 67636

Fixes: 51390cc0e00a ("drm/i915/mtl: Add Support for C10 PHY message bus and pll programming")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 142de06818a7..5ebc90d210d4 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -2117,14 +2117,6 @@ static void intel_c10_pll_program(struct intel_display *display,
 		      0, C10_VDR_CTRL_MSGBUS_ACCESS,
 		      MB_WRITE_COMMITTED);
 
-	/* Custom width needs to be programmed to 0 for both the phy lanes */
-	intel_cx0_rmw(encoder, INTEL_CX0_BOTH_LANES, PHY_C10_VDR_CUSTOM_WIDTH,
-		      C10_VDR_CUSTOM_WIDTH_MASK, C10_VDR_CUSTOM_WIDTH_8_10,
-		      MB_WRITE_COMMITTED);
-	intel_cx0_rmw(encoder, INTEL_CX0_BOTH_LANES, PHY_C10_VDR_CONTROL(1),
-		      0, C10_VDR_CTRL_UPDATE_CFG,
-		      MB_WRITE_COMMITTED);
-
 	/* Program the pll values only for the master lane */
 	for (i = 0; i < ARRAY_SIZE(pll_state->pll); i++)
 		intel_cx0_write(encoder, INTEL_CX0_LANE0, PHY_C10_VDR_PLL(i),
@@ -2134,6 +2126,10 @@ static void intel_c10_pll_program(struct intel_display *display,
 	intel_cx0_write(encoder, INTEL_CX0_LANE0, PHY_C10_VDR_CMN(0), pll_state->cmn, MB_WRITE_COMMITTED);
 	intel_cx0_write(encoder, INTEL_CX0_LANE0, PHY_C10_VDR_TX(0), pll_state->tx, MB_WRITE_COMMITTED);
 
+	/* Custom width needs to be programmed to 0 for both the phy lanes */
+	intel_cx0_rmw(encoder, INTEL_CX0_BOTH_LANES, PHY_C10_VDR_CUSTOM_WIDTH,
+		      C10_VDR_CUSTOM_WIDTH_MASK, C10_VDR_CUSTOM_WIDTH_8_10,
+		      MB_WRITE_COMMITTED);
 	intel_cx0_rmw(encoder, INTEL_CX0_LANE0, PHY_C10_VDR_CONTROL(1),
 		      0, C10_VDR_CTRL_MASTER_LANE | C10_VDR_CTRL_UPDATE_CFG,
 		      MB_WRITE_COMMITTED);
-- 
2.34.1

