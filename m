Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D509B7CCAAE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 20:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFAE10E327;
	Tue, 17 Oct 2023 18:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E41889336;
 Tue, 17 Oct 2023 10:42:49 +0000 (UTC)
X-UUID: f78b398fc5b0488687c6865f72c1d3f0-20231017
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:76ffdbd8-1677-4506-b63a-68ddef809464, IP:15,
 URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,AC
 TION:release,TS:-25
X-CID-INFO: VERSION:1.1.32, REQID:76ffdbd8-1677-4506-b63a-68ddef809464, IP:15,
 UR
 L:0,TC:0,Content:-25,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:b76f08c0-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:231017184101ZBFZ2WG9,BulkQuantity:1,Recheck:0,SF:66|38|24|17|19|44|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: f78b398fc5b0488687c6865f72c1d3f0-20231017
X-User: chentao@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <chentao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1169852561; Tue, 17 Oct 2023 18:42:37 +0800
From: "Kunwu.Chan" <chentao@kylinos.cn>
To: daniel@ffwll.ch, airlied@gmail.com, Xinhui.Pan@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: Remove the useless variable 'disable_plloff_in_l1'
Date: Tue, 17 Oct 2023 18:42:01 +0800
Message-Id: <20231017104201.49386-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Oct 2023 18:32:59 +0000
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
Cc: "Kunwu.Chan" <chentao@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunwu.chan@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because the disable_plloff_in_l1 variable is always false, the if judgment
 on line 9696 is always true. Remove this variable and this if statement.

Fixes: 7235711a43b6 ("drm/radeon: add support for ASPM on CIK asics")
Signed-off-by: Kunwu.Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/radeon/cik.c | 134 +++++++++++++++++------------------
 1 file changed, 66 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 10be30366c2b..62a9c1126bb3 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -9652,7 +9652,7 @@ static void cik_pcie_gen3_enable(struct radeon_device *rdev)
 static void cik_program_aspm(struct radeon_device *rdev)
 {
 	u32 data, orig;
-	bool disable_l0s = false, disable_l1 = false, disable_plloff_in_l1 = false;
+	bool disable_l0s = false, disable_l1 = false;
 	bool disable_clkreq = false;
 
 	if (radeon_aspm == 0)
@@ -9693,86 +9693,84 @@ static void cik_program_aspm(struct radeon_device *rdev)
 		if (orig != data)
 			WREG32_PCIE_PORT(PCIE_LC_CNTL, data);
 
-		if (!disable_plloff_in_l1) {
-			bool clk_req_support;
+		bool clk_req_support;
 
-			orig = data = RREG32_PCIE_PORT(PB0_PIF_PWRDOWN_0);
-			data &= ~(PLL_POWER_STATE_IN_OFF_0_MASK | PLL_POWER_STATE_IN_TXS2_0_MASK);
-			data |= PLL_POWER_STATE_IN_OFF_0(7) | PLL_POWER_STATE_IN_TXS2_0(7);
-			if (orig != data)
-				WREG32_PCIE_PORT(PB0_PIF_PWRDOWN_0, data);
+		orig = data = RREG32_PCIE_PORT(PB0_PIF_PWRDOWN_0);
+		data &= ~(PLL_POWER_STATE_IN_OFF_0_MASK | PLL_POWER_STATE_IN_TXS2_0_MASK);
+		data |= PLL_POWER_STATE_IN_OFF_0(7) | PLL_POWER_STATE_IN_TXS2_0(7);
+		if (orig != data)
+			WREG32_PCIE_PORT(PB0_PIF_PWRDOWN_0, data);
 
-			orig = data = RREG32_PCIE_PORT(PB0_PIF_PWRDOWN_1);
-			data &= ~(PLL_POWER_STATE_IN_OFF_1_MASK | PLL_POWER_STATE_IN_TXS2_1_MASK);
-			data |= PLL_POWER_STATE_IN_OFF_1(7) | PLL_POWER_STATE_IN_TXS2_1(7);
-			if (orig != data)
-				WREG32_PCIE_PORT(PB0_PIF_PWRDOWN_1, data);
+		orig = data = RREG32_PCIE_PORT(PB0_PIF_PWRDOWN_1);
+		data &= ~(PLL_POWER_STATE_IN_OFF_1_MASK | PLL_POWER_STATE_IN_TXS2_1_MASK);
+		data |= PLL_POWER_STATE_IN_OFF_1(7) | PLL_POWER_STATE_IN_TXS2_1(7);
+		if (orig != data)
+			WREG32_PCIE_PORT(PB0_PIF_PWRDOWN_1, data);
 
-			orig = data = RREG32_PCIE_PORT(PB1_PIF_PWRDOWN_0);
-			data &= ~(PLL_POWER_STATE_IN_OFF_0_MASK | PLL_POWER_STATE_IN_TXS2_0_MASK);
-			data |= PLL_POWER_STATE_IN_OFF_0(7) | PLL_POWER_STATE_IN_TXS2_0(7);
-			if (orig != data)
-				WREG32_PCIE_PORT(PB1_PIF_PWRDOWN_0, data);
+		orig = data = RREG32_PCIE_PORT(PB1_PIF_PWRDOWN_0);
+		data &= ~(PLL_POWER_STATE_IN_OFF_0_MASK | PLL_POWER_STATE_IN_TXS2_0_MASK);
+		data |= PLL_POWER_STATE_IN_OFF_0(7) | PLL_POWER_STATE_IN_TXS2_0(7);
+		if (orig != data)
+			WREG32_PCIE_PORT(PB1_PIF_PWRDOWN_0, data);
 
-			orig = data = RREG32_PCIE_PORT(PB1_PIF_PWRDOWN_1);
-			data &= ~(PLL_POWER_STATE_IN_OFF_1_MASK | PLL_POWER_STATE_IN_TXS2_1_MASK);
-			data |= PLL_POWER_STATE_IN_OFF_1(7) | PLL_POWER_STATE_IN_TXS2_1(7);
-			if (orig != data)
-				WREG32_PCIE_PORT(PB1_PIF_PWRDOWN_1, data);
+		orig = data = RREG32_PCIE_PORT(PB1_PIF_PWRDOWN_1);
+		data &= ~(PLL_POWER_STATE_IN_OFF_1_MASK | PLL_POWER_STATE_IN_TXS2_1_MASK);
+		data |= PLL_POWER_STATE_IN_OFF_1(7) | PLL_POWER_STATE_IN_TXS2_1(7);
+		if (orig != data)
+			WREG32_PCIE_PORT(PB1_PIF_PWRDOWN_1, data);
 
-			orig = data = RREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL);
-			data &= ~LC_DYN_LANES_PWR_STATE_MASK;
-			data |= LC_DYN_LANES_PWR_STATE(3);
-			if (orig != data)
-				WREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL, data);
+		orig = data = RREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL);
+		data &= ~LC_DYN_LANES_PWR_STATE_MASK;
+		data |= LC_DYN_LANES_PWR_STATE(3);
+		if (orig != data)
+			WREG32_PCIE_PORT(PCIE_LC_LINK_WIDTH_CNTL, data);
 
-			if (!disable_clkreq &&
-			    !pci_is_root_bus(rdev->pdev->bus)) {
-				struct pci_dev *root = rdev->pdev->bus->self;
-				u32 lnkcap;
+		if (!disable_clkreq &&
+			!pci_is_root_bus(rdev->pdev->bus)) {
+			struct pci_dev *root = rdev->pdev->bus->self;
+			u32 lnkcap;
 
-				clk_req_support = false;
-				pcie_capability_read_dword(root, PCI_EXP_LNKCAP, &lnkcap);
-				if (lnkcap & PCI_EXP_LNKCAP_CLKPM)
-					clk_req_support = true;
-			} else {
-				clk_req_support = false;
-			}
+			clk_req_support = false;
+			pcie_capability_read_dword(root, PCI_EXP_LNKCAP, &lnkcap);
+			if (lnkcap & PCI_EXP_LNKCAP_CLKPM)
+				clk_req_support = true;
+		} else {
+			clk_req_support = false;
+		}
 
-			if (clk_req_support) {
-				orig = data = RREG32_PCIE_PORT(PCIE_LC_CNTL2);
-				data |= LC_ALLOW_PDWN_IN_L1 | LC_ALLOW_PDWN_IN_L23;
-				if (orig != data)
-					WREG32_PCIE_PORT(PCIE_LC_CNTL2, data);
+		if (clk_req_support) {
+			orig = data = RREG32_PCIE_PORT(PCIE_LC_CNTL2);
+			data |= LC_ALLOW_PDWN_IN_L1 | LC_ALLOW_PDWN_IN_L23;
+			if (orig != data)
+				WREG32_PCIE_PORT(PCIE_LC_CNTL2, data);
 
-				orig = data = RREG32_SMC(THM_CLK_CNTL);
-				data &= ~(CMON_CLK_SEL_MASK | TMON_CLK_SEL_MASK);
-				data |= CMON_CLK_SEL(1) | TMON_CLK_SEL(1);
-				if (orig != data)
-					WREG32_SMC(THM_CLK_CNTL, data);
+			orig = data = RREG32_SMC(THM_CLK_CNTL);
+			data &= ~(CMON_CLK_SEL_MASK | TMON_CLK_SEL_MASK);
+			data |= CMON_CLK_SEL(1) | TMON_CLK_SEL(1);
+			if (orig != data)
+				WREG32_SMC(THM_CLK_CNTL, data);
 
-				orig = data = RREG32_SMC(MISC_CLK_CTRL);
-				data &= ~(DEEP_SLEEP_CLK_SEL_MASK | ZCLK_SEL_MASK);
-				data |= DEEP_SLEEP_CLK_SEL(1) | ZCLK_SEL(1);
-				if (orig != data)
-					WREG32_SMC(MISC_CLK_CTRL, data);
+			orig = data = RREG32_SMC(MISC_CLK_CTRL);
+			data &= ~(DEEP_SLEEP_CLK_SEL_MASK | ZCLK_SEL_MASK);
+			data |= DEEP_SLEEP_CLK_SEL(1) | ZCLK_SEL(1);
+			if (orig != data)
+				WREG32_SMC(MISC_CLK_CTRL, data);
 
-				orig = data = RREG32_SMC(CG_CLKPIN_CNTL);
-				data &= ~BCLK_AS_XCLK;
-				if (orig != data)
-					WREG32_SMC(CG_CLKPIN_CNTL, data);
+			orig = data = RREG32_SMC(CG_CLKPIN_CNTL);
+			data &= ~BCLK_AS_XCLK;
+			if (orig != data)
+				WREG32_SMC(CG_CLKPIN_CNTL, data);
 
-				orig = data = RREG32_SMC(CG_CLKPIN_CNTL_2);
-				data &= ~FORCE_BIF_REFCLK_EN;
-				if (orig != data)
-					WREG32_SMC(CG_CLKPIN_CNTL_2, data);
+			orig = data = RREG32_SMC(CG_CLKPIN_CNTL_2);
+			data &= ~FORCE_BIF_REFCLK_EN;
+			if (orig != data)
+				WREG32_SMC(CG_CLKPIN_CNTL_2, data);
 
-				orig = data = RREG32_SMC(MPLL_BYPASSCLK_SEL);
-				data &= ~MPLL_CLKOUT_SEL_MASK;
-				data |= MPLL_CLKOUT_SEL(4);
-				if (orig != data)
-					WREG32_SMC(MPLL_BYPASSCLK_SEL, data);
-			}
+			orig = data = RREG32_SMC(MPLL_BYPASSCLK_SEL);
+			data &= ~MPLL_CLKOUT_SEL_MASK;
+			data |= MPLL_CLKOUT_SEL(4);
+			if (orig != data)
+				WREG32_SMC(MPLL_BYPASSCLK_SEL, data);
 		}
 	} else {
 		if (orig != data)
-- 
2.25.1

