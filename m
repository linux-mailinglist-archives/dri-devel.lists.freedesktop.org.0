Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28005F9462
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A986D10E5D0;
	Sun,  9 Oct 2022 23:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AF210E5B8
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 23:55:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67752B80DF0;
 Sun,  9 Oct 2022 23:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB72AC43470;
 Sun,  9 Oct 2022 23:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359721;
 bh=eMMz/bzyjKDaTSFfsHVIqdswAnQO2E3Q+3QAdTBksh4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Misfq8Buls/7r/Vs/fLCOS9oMIdu0HfdIxYpKYLLp81LVwoynpoQoEwphX95evgQi
 9CnAL+4QyeupK5FfeDLv07og6X/hsvlmpLjQlpfwSnJQx80VIQZusOyyt8Hz9tyXYL
 Uz2rhoL+KOdRJlCwEFa+XpHbTlkLneUYqwbwY4gSyvP7veLGNDF4NUTomuP2wxBiaV
 etPFsOIVDH/YhMlsHDofTS0I5kOdPericCnLonvXn/XwhhQk2fT035I7/CY0tLCSVt
 v2UXut089T3MAM1WzNdm+FUxpTOoyErCy1A5+Z7QulsiqMmCl1FEDSfXYFu05BBIBQ
 V0jIblhZU8STQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 23/25] drm/dp: Don't rewrite link config when
 setting phy test pattern
Date: Sun,  9 Oct 2022 19:54:23 -0400
Message-Id: <20221009235426.1231313-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235426.1231313-1-sashal@kernel.org>
References: <20221009235426.1231313-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Or Cochvi <or.cochvi@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Khaled Almahallawy <khaled.almahallawy@intel.com>

[ Upstream commit 7b4d8db657192066bc6f1f6635d348413dac1e18 ]

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
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220916054900.415804-1-khaled.almahallawy@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_dp_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 7bb24523a749..b8815e7f5832 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -2376,17 +2376,8 @@ int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
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
2.35.1

