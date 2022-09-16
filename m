Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A15BA688
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 07:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EAF10E3B3;
	Fri, 16 Sep 2022 05:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA9110E3B3;
 Fri, 16 Sep 2022 05:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663307407; x=1694843407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F8g2OfLVm+cKGu5xcsqzh3R3kWw6y2Go/JAkL+jZP9Y=;
 b=QA1e9cVePOfAHGbZPIB2kJvIwn7FWp0xXncMKva03IhSBvk9otTeU/Hl
 JaxLBobJ3O0dFuOLKyIy2hLtOFLd5ZNfyaQiu0WsTsSVq7DHcKDR5ovF2
 Vj3Vm4QnHeaEFIx/xl0uSFGs9Izp2KmFu+IprpTNkZ0jLoEkxjR8Cr9Vy
 7iFIdQWELjHTJUloxt0ILE9sve9VVH3iE/V4DyOjBErqwe6tbEob4jTli
 0ULDiBNyvUdza1Rsdb6nEeQhFxQyt9u0ZjQBiFFW8XVW3XUDE288+tFeC
 5ql6spe33ALQ19cahdFtO+x/rtpIamCTdK4egaljJA2jb1tUPlOboDV2i g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="281946531"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="281946531"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 22:49:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="721299508"
Received: from mkedalag-mobl.amr.corp.intel.com (HELO kialmah1-mobl1.lan)
 ([10.209.109.86])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 22:49:04 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/display: Don't rewrite link config when setting phy test
 pattern
Date: Thu, 15 Sep 2022 22:49:00 -0700
Message-Id: <20220916054900.415804-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, Or Cochvi <or.cochvi@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sequence for Source DP PHY CTS automation is [2][1]:
1- Emulate successful Link Training(LT)
2- Short HPD and change link rates and number of lanes by LT.
(This is same flow for Link Layer CTS)
3- Short HPD and change PHY test pattern and swing/pre-emphasis
levels (This step should not trigger LT)

The problem is with DP PHY compliance setup as follow:

     [DPTX + on board LTTPR]------Main Link--->[Scope]
     	     	        ^                         |
			|                         |
			|                         |
			----------Aux Ch------>[Aux Emulator]

At step 3, before writing TRAINING_LANEx_SET/LINK_QUAL_PATTERN_SET
to declare the pattern/swing requested by scope, we write link
config in LINK_BW_SET/LANE_COUNT_SET on a port that has LTTPR.
As LTTPR snoops aux transaction, LINK_BW_SET/LANE_COUNT_SET writes
indicate a LT will start [Check DP 2.0 E11 -Sec 3.6.8.2 & 3.6.8.6.3],
and LTTPR will reset the link and stop sending DP signals to
DPTX/Scope causing the measurements to fail. Note that step 3 will
not trigger LT and DP link will never recovered by the
Aux Emulator/Scope.

The reset of link can be tested with a monitor connected to LTTPR
port simply by writing to LINK_BW_SET or LANE_COUNT_SET as follow

  igt/tools/dpcd_reg write --offset=0x100 --value 0x14 --device=2

OR

  printf '\x14' | sudo dd of=/dev/drm_dp_aux2 bs=1 count=1 conv=notrunc
  seek=$((0x100))

This single aux write causes the screen to blank, sending short HPD to
DPTX, setting LINK_STATUS_UPDATE = 1 in DPCD 0x204, and triggering LT.

As stated in [1]:
"Before any TX electrical testing can be performed, the link between a
DPTX and DPRX (in this case, a piece of test equipment), including all
LTTPRs within the path, shall be trained as defined in this Standard."

In addition, changing Phy pattern/Swing/Pre-emphasis (Step 3) uses the
same link rate and lane count applied on step 2, so no need to redo LT.

The fix is to not rewrite link config in step 3, and just writes
TRAINING_LANEx_SET and LINK_QUAL_PATTERN_SET

[1]: DP 2.0 E11 - 3.6.11.1 LTTPR DPTX_PHY Electrical Compliance

[2]: Configuring UnigrafDPTC Controller - Automation Test Sequence
https://www.keysight.com/us/en/assets/9922-01244/help-files/
D9040DPPC-DisplayPort-Test-Software-Online-Help-latest.chm

Cc: Imre Deak <imre.deak@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Or Cochvi <or.cochvi@intel.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 92990a3d577a..9f055d9710ea 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2670,17 +2670,8 @@ int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
 				struct drm_dp_phy_test_params *data, u8 dp_rev)
 {
 	int err, i;
-	u8 link_config[2];
 	u8 test_pattern;
 
-	link_config[0] = drm_dp_link_rate_to_bw_code(data->link_rate);
-	link_config[1] = data->num_lanes;
-	if (data->enhanced_frame_cap)
-		link_config[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
-	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, link_config, 2);
-	if (err < 0)
-		return err;
-
 	test_pattern = data->phy_pattern;
 	if (dp_rev < 0x12) {
 		test_pattern = (test_pattern << 2) &
-- 
2.25.1

