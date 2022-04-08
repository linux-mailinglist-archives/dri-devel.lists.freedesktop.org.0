Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21154F8EEE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 08:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7864F10F821;
	Fri,  8 Apr 2022 06:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C51B10F81D;
 Fri,  8 Apr 2022 06:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649400758; x=1680936758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cZqsgQb4S07zXarKn6un/N4G9uMUcM+dYhSDHpg1uSU=;
 b=Hi+v/so1fP2HwhRcTu/zo+JgTsie56E+0ktI/nOzJuo8IvTeZXe4MhMA
 DA+sBdP6cvYg2zijWKarjV/xOI2v8SeH/mf7Qq0wDphNTgOamwZ96lKc0
 xadmJunYZy7ZCOkzJ9Spnx6GQZPM3spPTatMoaMvkOtUjUL53UOxxW9Kx
 fUZouseaD8W4yPEdInbhcd6vHGjcz0HOrFIrdyry73IWZZ6g3aBv3Vihf
 ejUF/SlI+vFmvdTRZK4qCIn+uRy1Yb0GNu4Wmoa6f/JOTvKbpsfjm+bAL
 p8C4BZo735U5h7cwc/opMEC1r/VPKVrPqd3WTKE9rb1G045+opPWGPwM/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261519494"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="261519494"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:52:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="557668473"
Received: from mrnys-mobl2.amr.corp.intel.com (HELO
 kialmah1-mobl1.amr.corp.intel.com.com) ([10.209.45.228])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:52:36 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp: Don't rewrite link config when setting phy CTS test
 pattern with LTTPR
Date: Thu,  7 Apr 2022 23:52:32 -0700
Message-Id: <20220408065232.180146-1-khaled.almahallawy@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sequence for Source DP PHY CTS automation[1]:
1- Emulate successful Link Training
2- Short HPD and Change link rates and number of lanes
3- Short HPD and Change PHY test pattern and swing/pre-emp levels

With DP PHY CTS setup as follow:

     [DPTX + on board LTTPR]------Main Link--->[Scope]
     	     	        ^                         |
			|                         |
			|                         |
			----------Aux Ch------>[Aux Emulator]

Writing to LINK_BW_SET on a port that has LTTPR is an indication of the
LT start for LTTPR [Check DP 2.0 E11 - Sec 3.6.8.2 & 3.6.8.6.3]. As
LTTPR snoops LINK_BW_SET/LANE_COUNT_SET, it will stop sending DP signals
to DP Scope causing the measurements to fail.

This can be tested with a monitor connected to LTTPR port by writing to
LINK_BW_SET as follow:

  igt/tools/dpcd_reg write --offset=0x100 --value 0x14 --device=2

OR

  printf '\x14' | sudo dd of=/dev/drm_dp_aux2 bs=1 count=1 conv=notrunc
  seek=$((0x100))

This single aux write causes the screen to blank, sending short HPD to
DPTX, setting LINK_STATUS_UPDATE = 1 in DPCD 0x204, and triggering LT.

However, sending the same aux write on a port without LTTPR (direct port
to the monitor) has no effect.

In the case of DP PHY CTS setup described above, the AUX emulator executes
a script file of aux transactoins it sends to DPTX. For setting PHY pattern
the relevant segment of the  script looks like the following:
    # Set TEST_REQUEST (0x0218): PHY_TEST_PATTERN (0x0218.3) to 1
    SetByte 0x218 0
    SetBit 0x201 1
    SetBit 0x218 3

    # Set Test Pattern
    SetPattern

    # Trigger 1ms HPD Pulse
    HPDPulse 0x06

    # Wait For 2 seconds
    Wait 2000000

    MODULEEND

After the aux emulator finish executing the above segment, the scope waits
for the required pattern from DPTX to verify it is the right one and
perform the measurements. No more aux transactions the AUX emulator
will send. So, when DPTX update LINK_BW_SET/LANE_COUNT_SET, the LTTPR will
stop the signals on the main link to DPRX/Scope in order to adjust rate and
lane count it snooped and will wait for link training to start which will
never happen given the script file for aux transactions already finished.

The fix for this issue, is to not rewrite link config that is already done
in step 2 by modeset, and just change PHY test patterns and swing/pre-emph
levels.

[1]: LTTPR Re-timer PHY test procedure proposal
     https://groups.vesa.org/wg/Link/document/16521

Cc: Imre Deak <imre.deak@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/dp/drm_dp.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index 580016a1b9eb..f72d48e59b89 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -2613,17 +2613,8 @@ int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
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

