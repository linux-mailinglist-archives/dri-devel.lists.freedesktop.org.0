Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D52435A2F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 07:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607CA6EACF;
	Thu, 21 Oct 2021 05:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DA86E409;
 Thu, 21 Oct 2021 05:07:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="229215255"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="229215255"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 22:07:06 -0700
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="484048426"
Received: from gmherteg-mobl2.amr.corp.intel.com (HELO
 kialmah1-mobl1.amr.corp.intel.com) ([10.251.20.183])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 22:07:06 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
Subject: [RFC PATCH 1/4] drm/dp: Rename DPCD 248h according to DP 2.0 specs
Date: Wed, 20 Oct 2021 22:07:10 -0700
Message-Id: <20211021050713.836498-2-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021050713.836498-1-khaled.almahallawy@intel.com>
References: <20211021050713.836498-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

DPCD 248h name was changed from “PHY_TEST_PATTERN” in DP 1.4 to “LINK_QUAL_PATTERN_SELECT” in DP 2.0.

Also, DPCD 248h [6:0] is the same as DPCDs 10Bh/10Ch/10Dh/10Eh [6:0]. So removed the repeated definition of PHY patterns.

Reference: “DPCD 248h/10Bh/10Ch/10Dh/10Eh Name/Description Consistency”
https://groups.vesa.org/wg/AllMem/documentComment/2738

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c |  6 +++---
 include/drm/drm_dp_helper.h     | 13 +++----------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index ada0a1ff262d..c9c928c08026 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -2489,19 +2489,19 @@ int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
 	if (lanes & DP_ENHANCED_FRAME_CAP)
 		data->enhanced_frame_cap = true;
 
-	err = drm_dp_dpcd_readb(aux, DP_PHY_TEST_PATTERN, &data->phy_pattern);
+	err = drm_dp_dpcd_readb(aux, DP_LINK_QUAL_PATTERN_SELECT, &data->phy_pattern);
 	if (err < 0)
 		return err;
 
 	switch (data->phy_pattern) {
-	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
+	case DP_LINK_QUAL_PATTERN_80BIT_CUSTOM:
 		err = drm_dp_dpcd_read(aux, DP_TEST_80BIT_CUSTOM_PATTERN_7_0,
 				       &data->custom80, sizeof(data->custom80));
 		if (err < 0)
 			return err;
 
 		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
+	case DP_LINK_QUAL_PATTERN_CP2520_PAT_1:
 		err = drm_dp_dpcd_read(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
 				       &data->hbr2_reset,
 				       sizeof(data->hbr2_reset));
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index afdf7f4183f9..ef915bb75bb4 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -862,16 +862,9 @@ struct drm_panel;
 # define DP_TEST_CRC_SUPPORTED		    (1 << 5)
 # define DP_TEST_COUNT_MASK		    0xf
 
-#define DP_PHY_TEST_PATTERN                 0x248
-# define DP_PHY_TEST_PATTERN_SEL_MASK       0x7
-# define DP_PHY_TEST_PATTERN_NONE           0x0
-# define DP_PHY_TEST_PATTERN_D10_2          0x1
-# define DP_PHY_TEST_PATTERN_ERROR_COUNT    0x2
-# define DP_PHY_TEST_PATTERN_PRBS7          0x3
-# define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
-# define DP_PHY_TEST_PATTERN_CP2520         0x5
-
-#define DP_PHY_SQUARE_PATTERN				0x249
+#define DP_LINK_QUAL_PATTERN_SELECT         0x248
+
+#define DP_PHY_SQUARE_PATTERN               0x249
 
 #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
 #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
-- 
2.25.1

