Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F79435A33
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 07:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333EF6EB21;
	Thu, 21 Oct 2021 05:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CF06EA95;
 Thu, 21 Oct 2021 05:07:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="229215259"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="229215259"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 22:07:07 -0700
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="484048433"
Received: from gmherteg-mobl2.amr.corp.intel.com (HELO
 kialmah1-mobl1.amr.corp.intel.com) ([10.251.20.183])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 22:07:07 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>
Subject: [RFC PATCH 2/4] drm/i915/dp: Use DP 2.0 LINK_QUAL_PATTERN_* Phy test
 pattern definitions
Date: Wed, 20 Oct 2021 22:07:11 -0700
Message-Id: <20211021050713.836498-3-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021050713.836498-1-khaled.almahallawy@intel.com>
References: <20211021050713.836498-1-khaled.almahallawy@intel.com>
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

Update selected phy test pattern names to use the new names/definitions of DPCD 248h in DP2.0/drm_dp_helpers.h
No functional changes

Cc: Manasi Navare <manasi.d.navare@intel.com>
CC: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f5dc2126d140..931e8083e54a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3367,27 +3367,27 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp,
 	u32 pattern_val;
 
 	switch (data->phy_pattern) {
-	case DP_PHY_TEST_PATTERN_NONE:
+	case DP_LINK_QUAL_PATTERN_DISABLE:
 		DRM_DEBUG_KMS("Disable Phy Test Pattern\n");
 		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe), 0x0);
 		break;
-	case DP_PHY_TEST_PATTERN_D10_2:
+	case DP_LINK_QUAL_PATTERN_D10_2:
 		DRM_DEBUG_KMS("Set D10.2 Phy Test Pattern\n");
 		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
 			       DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_D10_2);
 		break;
-	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
+	case DP_LINK_QUAL_PATTERN_ERROR_RATE:
 		DRM_DEBUG_KMS("Set Error Count Phy Test Pattern\n");
 		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
 			       DDI_DP_COMP_CTL_ENABLE |
 			       DDI_DP_COMP_CTL_SCRAMBLED_0);
 		break;
-	case DP_PHY_TEST_PATTERN_PRBS7:
+	case DP_LINK_QUAL_PATTERN_PRBS7:
 		DRM_DEBUG_KMS("Set PRBS7 Phy Test Pattern\n");
 		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
 			       DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_PRBS7);
 		break;
-	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
+	case DP_LINK_QUAL_PATTERN_80BIT_CUSTOM:
 		/*
 		 * FIXME: Ideally pattern should come from DPCD 0x250. As
 		 * current firmware of DPR-100 could not set it, so hardcoding
@@ -3404,7 +3404,7 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp,
 			       DDI_DP_COMP_CTL_ENABLE |
 			       DDI_DP_COMP_CTL_CUSTOM80);
 		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
+	case DP_LINK_QUAL_PATTERN_CP2520_PAT_1:
 		/*
 		 * FIXME: Ideally pattern should come from DPCD 0x24A. As
 		 * current firmware of DPR-100 could not set it, so hardcoding
-- 
2.25.1

