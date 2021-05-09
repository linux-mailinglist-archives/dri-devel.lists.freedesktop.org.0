Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F7377916
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 00:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C940A89DA3;
	Sun,  9 May 2021 22:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91A689CDF;
 Sun,  9 May 2021 22:48:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6FB4613DE;
 Sun,  9 May 2021 22:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620600535;
 bh=qWXb20vcO5wJt2Jy6Q7UgExw6hN5mc2Y86pHLAQUgRk=;
 h=Date:From:To:Cc:Subject:From;
 b=bomHmrBhEzXhLt1M31+4c5UF+1uXHfAHgxmh/g85hHuiEY3PfAu5zfp5V3svCSvMU
 GOZN3pR9+pr2QYlSBu+1dgswWI9q7SN8GzDJFGHyy2M4PmLXvtC568HYkfxI6BFHNH
 BeHS19eNX1gaejb1xdJ5o2R3fxb0y+rvOAeHwKsAubaoj3fkHhIHnBc96ge/O701qP
 tiDUmTnig4ZVl0mkAbdNSina081AJJEkrddfuz5XEWc/ZdFXqom/wsgLQSewVmqHaS
 i+k7kTWVrzJwlk/s++cUjf0lCOwP3pXVOtvgkrOHekuFlE6uQ0Jt39YdifN5CVt5mt
 ZVZuodazr27Rw==
Date: Sun, 9 May 2021 17:49:26 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH] drm/radeon/ni_dpm: Fix booting bug
Message-ID: <20210509224926.GA31035@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create new structure NISLANDS_SMC_SWSTATE_SINGLE, as initialState.levels
and ACPIState.levels are never actually used as flexible arrays. Those
arrays can be used as simple objects of type
NISLANDS_SMC_HW_PERFORMANCE_LEVEL, instead.

Currently, the code fails because flexible array _levels_ in
struct NISLANDS_SMC_SWSTATE doesn't allow for code that access
the first element of initialState.levels and ACPIState.levels
arrays:

drivers/gpu/drm/radeon/ni_dpm.c:
1690         table->initialState.levels[0].mclk.vMPLL_AD_FUNC_CNTL =
1691                 cpu_to_be32(ni_pi->clock_registers.mpll_ad_func_cntl);
...
1903:   table->ACPIState.levels[0].mclk.vMPLL_AD_FUNC_CNTL = cpu_to_be32(mpll_ad_func_cntl);
1904:   table->ACPIState.levels[0].mclk.vMPLL_AD_FUNC_CNTL_2 = cpu_to_be32(mpll_ad_func_cntl_2);

because such element cannot exist without previously allocating
any dynamic memory for it (which never actually happens).

That's why struct NISLANDS_SMC_SWSTATE should only be used as type
for object driverState and new struct SISLANDS_SMC_SWSTATE_SINGLE is
created as type for objects initialState, ACPIState and ULVState.

Also, with the change from one-element array to flexible-array member
in commit 434fb1e7444a ("drm/radeon/nislands_smc.h: Replace one-element
array with flexible-array member in struct NISLANDS_SMC_SWSTATE"), the
size of dpmLevels in struct NISLANDS_SMC_STATETABLE should be fixed to
be NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE instead of
NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE - 1.

Bug: https://lore.kernel.org/dri-devel/3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de/
Fixes: 434fb1e7444a ("drm/radeon/nislands_smc.h: Replace one-element array with flexible-array member in struct NISLANDS_SMC_SWSTATE")
Cc: stable@vger.kernel.org
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Link: https://lore.kernel.org/dri-devel/9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de/
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/radeon/ni_dpm.c       | 144 +++++++++++++-------------
 drivers/gpu/drm/radeon/nislands_smc.h |  34 +++---
 2 files changed, 94 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ni_dpm.c b/drivers/gpu/drm/radeon/ni_dpm.c
index dd5ef6493723..769f666335ac 100644
--- a/drivers/gpu/drm/radeon/ni_dpm.c
+++ b/drivers/gpu/drm/radeon/ni_dpm.c
@@ -1687,102 +1687,102 @@ static int ni_populate_smc_initial_state(struct radeon_device *rdev,
 	u32 reg;
 	int ret;
 
-	table->initialState.levels[0].mclk.vMPLL_AD_FUNC_CNTL =
+	table->initialState.level.mclk.vMPLL_AD_FUNC_CNTL =
 		cpu_to_be32(ni_pi->clock_registers.mpll_ad_func_cntl);
-	table->initialState.levels[0].mclk.vMPLL_AD_FUNC_CNTL_2 =
+	table->initialState.level.mclk.vMPLL_AD_FUNC_CNTL_2 =
 		cpu_to_be32(ni_pi->clock_registers.mpll_ad_func_cntl_2);
-	table->initialState.levels[0].mclk.vMPLL_DQ_FUNC_CNTL =
+	table->initialState.level.mclk.vMPLL_DQ_FUNC_CNTL =
 		cpu_to_be32(ni_pi->clock_registers.mpll_dq_func_cntl);
-	table->initialState.levels[0].mclk.vMPLL_DQ_FUNC_CNTL_2 =
+	table->initialState.level.mclk.vMPLL_DQ_FUNC_CNTL_2 =
 		cpu_to_be32(ni_pi->clock_registers.mpll_dq_func_cntl_2);
-	table->initialState.levels[0].mclk.vMCLK_PWRMGT_CNTL =
+	table->initialState.level.mclk.vMCLK_PWRMGT_CNTL =
 		cpu_to_be32(ni_pi->clock_registers.mclk_pwrmgt_cntl);
-	table->initialState.levels[0].mclk.vDLL_CNTL =
+	table->initialState.level.mclk.vDLL_CNTL =
 		cpu_to_be32(ni_pi->clock_registers.dll_cntl);
-	table->initialState.levels[0].mclk.vMPLL_SS =
+	table->initialState.level.mclk.vMPLL_SS =
 		cpu_to_be32(ni_pi->clock_registers.mpll_ss1);
-	table->initialState.levels[0].mclk.vMPLL_SS2 =
+	table->initialState.level.mclk.vMPLL_SS2 =
 		cpu_to_be32(ni_pi->clock_registers.mpll_ss2);
-	table->initialState.levels[0].mclk.mclk_value =
+	table->initialState.level.mclk.mclk_value =
 		cpu_to_be32(initial_state->performance_levels[0].mclk);
 
-	table->initialState.levels[0].sclk.vCG_SPLL_FUNC_CNTL =
+	table->initialState.level.sclk.vCG_SPLL_FUNC_CNTL =
 		cpu_to_be32(ni_pi->clock_registers.cg_spll_func_cntl);
-	table->initialState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_2 =
+	table->initialState.level.sclk.vCG_SPLL_FUNC_CNTL_2 =
 		cpu_to_be32(ni_pi->clock_registers.cg_spll_func_cntl_2);
-	table->initialState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_3 =
+	table->initialState.level.sclk.vCG_SPLL_FUNC_CNTL_3 =
 		cpu_to_be32(ni_pi->clock_registers.cg_spll_func_cntl_3);
-	table->initialState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_4 =
+	table->initialState.level.sclk.vCG_SPLL_FUNC_CNTL_4 =
 		cpu_to_be32(ni_pi->clock_registers.cg_spll_func_cntl_4);
-	table->initialState.levels[0].sclk.vCG_SPLL_SPREAD_SPECTRUM =
+	table->initialState.level.sclk.vCG_SPLL_SPREAD_SPECTRUM =
 		cpu_to_be32(ni_pi->clock_registers.cg_spll_spread_spectrum);
-	table->initialState.levels[0].sclk.vCG_SPLL_SPREAD_SPECTRUM_2 =
+	table->initialState.level.sclk.vCG_SPLL_SPREAD_SPECTRUM_2 =
 		cpu_to_be32(ni_pi->clock_registers.cg_spll_spread_spectrum_2);
-	table->initialState.levels[0].sclk.sclk_value =
+	table->initialState.level.sclk.sclk_value =
 		cpu_to_be32(initial_state->performance_levels[0].sclk);
-	table->initialState.levels[0].arbRefreshState =
+	table->initialState.level.arbRefreshState =
 		NISLANDS_INITIAL_STATE_ARB_INDEX;
 
-	table->initialState.levels[0].ACIndex = 0;
+	table->initialState.level.ACIndex = 0;
 
 	ret = ni_populate_voltage_value(rdev, &eg_pi->vddc_voltage_table,
 					initial_state->performance_levels[0].vddc,
-					&table->initialState.levels[0].vddc);
+					&table->initialState.level.vddc);
 	if (!ret) {
 		u16 std_vddc;
 
 		ret = ni_get_std_voltage_value(rdev,
-					       &table->initialState.levels[0].vddc,
+					       &table->initialState.level.vddc,
 					       &std_vddc);
 		if (!ret)
 			ni_populate_std_voltage_value(rdev, std_vddc,
-						      table->initialState.levels[0].vddc.index,
-						      &table->initialState.levels[0].std_vddc);
+						      table->initialState.level.vddc.index,
+						      &table->initialState.level.std_vddc);
 	}
 
 	if (eg_pi->vddci_control)
 		ni_populate_voltage_value(rdev,
 					  &eg_pi->vddci_voltage_table,
 					  initial_state->performance_levels[0].vddci,
-					  &table->initialState.levels[0].vddci);
+					  &table->initialState.level.vddci);
 
-	ni_populate_initial_mvdd_value(rdev, &table->initialState.levels[0].mvdd);
+	ni_populate_initial_mvdd_value(rdev, &table->initialState.level.mvdd);
 
 	reg = CG_R(0xffff) | CG_L(0);
-	table->initialState.levels[0].aT = cpu_to_be32(reg);
+	table->initialState.level.aT = cpu_to_be32(reg);
 
-	table->initialState.levels[0].bSP = cpu_to_be32(pi->dsp);
+	table->initialState.level.bSP = cpu_to_be32(pi->dsp);
 
 	if (pi->boot_in_gen2)
-		table->initialState.levels[0].gen2PCIE = 1;
+		table->initialState.level.gen2PCIE = 1;
 	else
-		table->initialState.levels[0].gen2PCIE = 0;
+		table->initialState.level.gen2PCIE = 0;
 
 	if (pi->mem_gddr5) {
-		table->initialState.levels[0].strobeMode =
+		table->initialState.level.strobeMode =
 			cypress_get_strobe_mode_settings(rdev,
 							 initial_state->performance_levels[0].mclk);
 
 		if (initial_state->performance_levels[0].mclk > pi->mclk_edc_enable_threshold)
-			table->initialState.levels[0].mcFlags = NISLANDS_SMC_MC_EDC_RD_FLAG | NISLANDS_SMC_MC_EDC_WR_FLAG;
+			table->initialState.level.mcFlags = NISLANDS_SMC_MC_EDC_RD_FLAG | NISLANDS_SMC_MC_EDC_WR_FLAG;
 		else
-			table->initialState.levels[0].mcFlags =  0;
+			table->initialState.level.mcFlags =  0;
 	}
 
 	table->initialState.levelCount = 1;
 
 	table->initialState.flags |= PPSMC_SWSTATE_FLAG_DC;
 
-	table->initialState.levels[0].dpm2.MaxPS = 0;
-	table->initialState.levels[0].dpm2.NearTDPDec = 0;
-	table->initialState.levels[0].dpm2.AboveSafeInc = 0;
-	table->initialState.levels[0].dpm2.BelowSafeInc = 0;
+	table->initialState.level.dpm2.MaxPS = 0;
+	table->initialState.level.dpm2.NearTDPDec = 0;
+	table->initialState.level.dpm2.AboveSafeInc = 0;
+	table->initialState.level.dpm2.BelowSafeInc = 0;
 
 	reg = MIN_POWER_MASK | MAX_POWER_MASK;
-	table->initialState.levels[0].SQPowerThrottle = cpu_to_be32(reg);
+	table->initialState.level.SQPowerThrottle = cpu_to_be32(reg);
 
 	reg = MAX_POWER_DELTA_MASK | STI_SIZE_MASK | LTI_RATIO_MASK;
-	table->initialState.levels[0].SQPowerThrottle_2 = cpu_to_be32(reg);
+	table->initialState.level.SQPowerThrottle_2 = cpu_to_be32(reg);
 
 	return 0;
 }
@@ -1813,43 +1813,43 @@ static int ni_populate_smc_acpi_state(struct radeon_device *rdev,
 	if (pi->acpi_vddc) {
 		ret = ni_populate_voltage_value(rdev,
 						&eg_pi->vddc_voltage_table,
-						pi->acpi_vddc, &table->ACPIState.levels[0].vddc);
+						pi->acpi_vddc, &table->ACPIState.level.vddc);
 		if (!ret) {
 			u16 std_vddc;
 
 			ret = ni_get_std_voltage_value(rdev,
-						       &table->ACPIState.levels[0].vddc, &std_vddc);
+						       &table->ACPIState.level.vddc, &std_vddc);
 			if (!ret)
 				ni_populate_std_voltage_value(rdev, std_vddc,
-							      table->ACPIState.levels[0].vddc.index,
-							      &table->ACPIState.levels[0].std_vddc);
+							      table->ACPIState.level.vddc.index,
+							      &table->ACPIState.level.std_vddc);
 		}
 
 		if (pi->pcie_gen2) {
 			if (pi->acpi_pcie_gen2)
-				table->ACPIState.levels[0].gen2PCIE = 1;
+				table->ACPIState.level.gen2PCIE = 1;
 			else
-				table->ACPIState.levels[0].gen2PCIE = 0;
+				table->ACPIState.level.gen2PCIE = 0;
 		} else {
-			table->ACPIState.levels[0].gen2PCIE = 0;
+			table->ACPIState.level.gen2PCIE = 0;
 		}
 	} else {
 		ret = ni_populate_voltage_value(rdev,
 						&eg_pi->vddc_voltage_table,
 						pi->min_vddc_in_table,
-						&table->ACPIState.levels[0].vddc);
+						&table->ACPIState.level.vddc);
 		if (!ret) {
 			u16 std_vddc;
 
 			ret = ni_get_std_voltage_value(rdev,
-						       &table->ACPIState.levels[0].vddc,
+						       &table->ACPIState.level.vddc,
 						       &std_vddc);
 			if (!ret)
 				ni_populate_std_voltage_value(rdev, std_vddc,
-							      table->ACPIState.levels[0].vddc.index,
-							      &table->ACPIState.levels[0].std_vddc);
+							      table->ACPIState.level.vddc.index,
+							      &table->ACPIState.level.std_vddc);
 		}
-		table->ACPIState.levels[0].gen2PCIE = 0;
+		table->ACPIState.level.gen2PCIE = 0;
 	}
 
 	if (eg_pi->acpi_vddci) {
@@ -1857,7 +1857,7 @@ static int ni_populate_smc_acpi_state(struct radeon_device *rdev,
 			ni_populate_voltage_value(rdev,
 						  &eg_pi->vddci_voltage_table,
 						  eg_pi->acpi_vddci,
-						  &table->ACPIState.levels[0].vddci);
+						  &table->ACPIState.level.vddci);
 	}
 
 
@@ -1900,37 +1900,37 @@ static int ni_populate_smc_acpi_state(struct radeon_device *rdev,
 	spll_func_cntl_2 &= ~SCLK_MUX_SEL_MASK;
 	spll_func_cntl_2 |= SCLK_MUX_SEL(4);
 
-	table->ACPIState.levels[0].mclk.vMPLL_AD_FUNC_CNTL = cpu_to_be32(mpll_ad_func_cntl);
-	table->ACPIState.levels[0].mclk.vMPLL_AD_FUNC_CNTL_2 = cpu_to_be32(mpll_ad_func_cntl_2);
-	table->ACPIState.levels[0].mclk.vMPLL_DQ_FUNC_CNTL = cpu_to_be32(mpll_dq_func_cntl);
-	table->ACPIState.levels[0].mclk.vMPLL_DQ_FUNC_CNTL_2 = cpu_to_be32(mpll_dq_func_cntl_2);
-	table->ACPIState.levels[0].mclk.vMCLK_PWRMGT_CNTL = cpu_to_be32(mclk_pwrmgt_cntl);
-	table->ACPIState.levels[0].mclk.vDLL_CNTL = cpu_to_be32(dll_cntl);
+	table->ACPIState.level.mclk.vMPLL_AD_FUNC_CNTL = cpu_to_be32(mpll_ad_func_cntl);
+	table->ACPIState.level.mclk.vMPLL_AD_FUNC_CNTL_2 = cpu_to_be32(mpll_ad_func_cntl_2);
+	table->ACPIState.level.mclk.vMPLL_DQ_FUNC_CNTL = cpu_to_be32(mpll_dq_func_cntl);
+	table->ACPIState.level.mclk.vMPLL_DQ_FUNC_CNTL_2 = cpu_to_be32(mpll_dq_func_cntl_2);
+	table->ACPIState.level.mclk.vMCLK_PWRMGT_CNTL = cpu_to_be32(mclk_pwrmgt_cntl);
+	table->ACPIState.level.mclk.vDLL_CNTL = cpu_to_be32(dll_cntl);
 
-	table->ACPIState.levels[0].mclk.mclk_value = 0;
+	table->ACPIState.level.mclk.mclk_value = 0;
 
-	table->ACPIState.levels[0].sclk.vCG_SPLL_FUNC_CNTL = cpu_to_be32(spll_func_cntl);
-	table->ACPIState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_2 = cpu_to_be32(spll_func_cntl_2);
-	table->ACPIState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_3 = cpu_to_be32(spll_func_cntl_3);
-	table->ACPIState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_4 = cpu_to_be32(spll_func_cntl_4);
+	table->ACPIState.level.sclk.vCG_SPLL_FUNC_CNTL = cpu_to_be32(spll_func_cntl);
+	table->ACPIState.level.sclk.vCG_SPLL_FUNC_CNTL_2 = cpu_to_be32(spll_func_cntl_2);
+	table->ACPIState.level.sclk.vCG_SPLL_FUNC_CNTL_3 = cpu_to_be32(spll_func_cntl_3);
+	table->ACPIState.level.sclk.vCG_SPLL_FUNC_CNTL_4 = cpu_to_be32(spll_func_cntl_4);
 
-	table->ACPIState.levels[0].sclk.sclk_value = 0;
+	table->ACPIState.level.sclk.sclk_value = 0;
 
-	ni_populate_mvdd_value(rdev, 0, &table->ACPIState.levels[0].mvdd);
+	ni_populate_mvdd_value(rdev, 0, &table->ACPIState.level.mvdd);
 
 	if (eg_pi->dynamic_ac_timing)
-		table->ACPIState.levels[0].ACIndex = 1;
+		table->ACPIState.level.ACIndex = 1;
 
-	table->ACPIState.levels[0].dpm2.MaxPS = 0;
-	table->ACPIState.levels[0].dpm2.NearTDPDec = 0;
-	table->ACPIState.levels[0].dpm2.AboveSafeInc = 0;
-	table->ACPIState.levels[0].dpm2.BelowSafeInc = 0;
+	table->ACPIState.level.dpm2.MaxPS = 0;
+	table->ACPIState.level.dpm2.NearTDPDec = 0;
+	table->ACPIState.level.dpm2.AboveSafeInc = 0;
+	table->ACPIState.level.dpm2.BelowSafeInc = 0;
 
 	reg = MIN_POWER_MASK | MAX_POWER_MASK;
-	table->ACPIState.levels[0].SQPowerThrottle = cpu_to_be32(reg);
+	table->ACPIState.level.SQPowerThrottle = cpu_to_be32(reg);
 
 	reg = MAX_POWER_DELTA_MASK | STI_SIZE_MASK | LTI_RATIO_MASK;
-	table->ACPIState.levels[0].SQPowerThrottle_2 = cpu_to_be32(reg);
+	table->ACPIState.level.SQPowerThrottle_2 = cpu_to_be32(reg);
 
 	return 0;
 }
@@ -1980,7 +1980,9 @@ static int ni_init_smc_table(struct radeon_device *rdev)
 	if (ret)
 		return ret;
 
-	table->driverState = table->initialState;
+	table->driverState.flags = table->initialState.flags;
+	table->driverState.levelCount = table->initialState.levelCount;
+	table->driverState.levels[0] = table->initialState.level;
 
 	table->ULVState = table->initialState;
 
diff --git a/drivers/gpu/drm/radeon/nislands_smc.h b/drivers/gpu/drm/radeon/nislands_smc.h
index 7395cb6b3cac..42f3bab0f9ee 100644
--- a/drivers/gpu/drm/radeon/nislands_smc.h
+++ b/drivers/gpu/drm/radeon/nislands_smc.h
@@ -143,6 +143,14 @@ struct NISLANDS_SMC_SWSTATE
 
 typedef struct NISLANDS_SMC_SWSTATE NISLANDS_SMC_SWSTATE;
 
+struct NISLANDS_SMC_SWSTATE_SINGLE {
+	uint8_t                             flags;
+	uint8_t                             levelCount;
+	uint8_t                             padding2;
+	uint8_t                             padding3;
+	NISLANDS_SMC_HW_PERFORMANCE_LEVEL   level;
+};
+
 #define NISLANDS_SMC_VOLTAGEMASK_VDDC  0
 #define NISLANDS_SMC_VOLTAGEMASK_MVDD  1
 #define NISLANDS_SMC_VOLTAGEMASK_VDDCI 2
@@ -160,19 +168,19 @@ typedef struct NISLANDS_SMC_VOLTAGEMASKTABLE NISLANDS_SMC_VOLTAGEMASKTABLE;
 
 struct NISLANDS_SMC_STATETABLE
 {
-    uint8_t                             thermalProtectType;
-    uint8_t                             systemFlags;
-    uint8_t                             maxVDDCIndexInPPTable;
-    uint8_t                             extraFlags;
-    uint8_t                             highSMIO[NISLANDS_MAX_NO_VREG_STEPS];
-    uint32_t                            lowSMIO[NISLANDS_MAX_NO_VREG_STEPS];
-    NISLANDS_SMC_VOLTAGEMASKTABLE       voltageMaskTable;
-    PP_NIslands_DPM2Parameters          dpm2Params;
-    NISLANDS_SMC_SWSTATE                initialState;
-    NISLANDS_SMC_SWSTATE                ACPIState;
-    NISLANDS_SMC_SWSTATE                ULVState;
-    NISLANDS_SMC_SWSTATE                driverState;
-    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   dpmLevels[NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE - 1];
+	uint8_t                             thermalProtectType;
+	uint8_t                             systemFlags;
+	uint8_t                             maxVDDCIndexInPPTable;
+	uint8_t                             extraFlags;
+	uint8_t                             highSMIO[NISLANDS_MAX_NO_VREG_STEPS];
+	uint32_t                            lowSMIO[NISLANDS_MAX_NO_VREG_STEPS];
+	NISLANDS_SMC_VOLTAGEMASKTABLE       voltageMaskTable;
+	PP_NIslands_DPM2Parameters          dpm2Params;
+	struct NISLANDS_SMC_SWSTATE_SINGLE  initialState;
+	struct NISLANDS_SMC_SWSTATE_SINGLE  ACPIState;
+	struct NISLANDS_SMC_SWSTATE_SINGLE  ULVState;
+	NISLANDS_SMC_SWSTATE                driverState;
+	NISLANDS_SMC_HW_PERFORMANCE_LEVEL   dpmLevels[NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE];
 };
 
 typedef struct NISLANDS_SMC_STATETABLE NISLANDS_SMC_STATETABLE;
-- 
2.27.0

