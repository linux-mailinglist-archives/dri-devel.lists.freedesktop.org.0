Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDB825D088
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 06:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A33F6EA6A;
	Fri,  4 Sep 2020 04:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3AC6E9FD;
 Fri,  4 Sep 2020 04:26:42 +0000 (UTC)
IronPort-SDR: rrLKcj9WuYD5TYLG9JuapA0l8rAUWEvkIAdwgl1R6hO1Txfj5KNKE8cdVmvumUpfg8HEGAObhV
 ED/eIyr91ZJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137744347"
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="137744347"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 21:26:41 -0700
IronPort-SDR: rTcZtu3QV6ACwQMoipHssWxmWiUHBcSkHxSJj3OMleZyOlSP5rAwJrwqkoLSKeQojKnofkV1vt
 W34J42np0BxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="315714433"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by orsmga002.jf.intel.com with ESMTP; 03 Sep 2020 21:26:40 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/dp: Add PHY_TEST_PATTERN CP2520 Pattern 2 and 3
Date: Fri,  4 Sep 2020 09:51:29 +0530
Message-Id: <1599193291-2705-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
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
