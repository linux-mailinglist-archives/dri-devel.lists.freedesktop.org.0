Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468AC25D045
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 06:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC566E222;
	Fri,  4 Sep 2020 04:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D691B6E21E;
 Fri,  4 Sep 2020 04:18:30 +0000 (UTC)
IronPort-SDR: 0bU4tGK0Sz9y1lVxwItqbBAImdVqI3ERXza7RHSoX2XDD953znETX0mIZPlyFFs4b/YCe9Brlz
 W7xaNeuB7WXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="175745508"
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="175745508"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 21:18:30 -0700
IronPort-SDR: MwKGxiCBOb0Vgc7Qxh1Zrg0CmCwPH+NkEDUjvG5LOwJn8pAGR62CDlzmAXznhkNxpl5fUlCoRX
 lInjNdcEOTig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="339527259"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Sep 2020 21:18:29 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/dp: Add PHY_TEST_PATTERN CP2520 Pattern 2 and 3
Date: Fri,  4 Sep 2020 09:43:06 +0530
Message-Id: <1599192789-2602-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591247028-5868-1-git-send-email-vidya.srinivas@intel.com>
References: <1591247028-5868-1-git-send-email-vidya.srinivas@intel.com>
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
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Khaled Almahallawy <khaled.almahallawy@intel.com>

Add the missing CP2520 pattern 2 and 3 phy compliance patterns

v2: cosemtic changes

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com> (v1)
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 include/drm/drm_dp_helper.h     | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index a3c82e726057..d0fb78c6aca6 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1583,7 +1583,7 @@ int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
 			return err;
 
 		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
+	case DP_PHY_TEST_PATTERN_CP2520_PAT1:
 		err = drm_dp_dpcd_read(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
 				       &data->hbr2_reset,
 				       sizeof(data->hbr2_reset));
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index e2d2df5e869e..73285b4c25a0 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -708,7 +708,9 @@
 # define DP_PHY_TEST_PATTERN_ERROR_COUNT    0x2
 # define DP_PHY_TEST_PATTERN_PRBS7          0x3
 # define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
-# define DP_PHY_TEST_PATTERN_CP2520         0x5
+# define DP_PHY_TEST_PATTERN_CP2520_PAT1    0x5
+# define DP_PHY_TEST_PATTERN_CP2520_PAT2    0x6
+# define DP_PHY_TEST_PATTERN_CP2520_PAT3    0x7
 
 #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
 #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
