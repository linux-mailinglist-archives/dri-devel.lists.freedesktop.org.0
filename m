Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C0C22A3BC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 02:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DD76E0F8;
	Thu, 23 Jul 2020 00:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09876E0F8;
 Thu, 23 Jul 2020 00:36:31 +0000 (UTC)
IronPort-SDR: zErzmJo9B3H1mQlDevC3wykp5+fy/MOGxxnlJpIDOloxcBrrexB5eE1vpwheSOs8EA+vo4mg9l
 bC9/J9PX3o5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="147938040"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="147938040"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 17:36:31 -0700
IronPort-SDR: f28wMEY6/V7j336m6O8D+0DVwWnS5er1FC3ofAltb2lIv2XjgNXEczH7jmEFomGdqfVFfxvCRp
 m6d5CvoQIP/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="488644363"
Received: from kialmah1-desk.jf.intel.com (HELO kialmah1-desk.vprodemo.com)
 ([134.134.156.178])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jul 2020 17:36:30 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/dp: Add PHY_TEST_PATTERN CP2520 Pattern 2 and 3
Date: Wed, 22 Jul 2020 17:36:26 -0700
Message-Id: <20200723003627.31198-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: manasi.d.navare@intel.com, animesh.manna@intel.com,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
index e47dc22ebf50..fbf83f207b15 100644
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
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
