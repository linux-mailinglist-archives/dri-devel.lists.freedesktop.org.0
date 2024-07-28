Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18E93E68D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1735610E292;
	Sun, 28 Jul 2024 15:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GnJbnuLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3760410E288;
 Sun, 28 Jul 2024 15:49:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 98152CE0937;
 Sun, 28 Jul 2024 15:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA09C116B1;
 Sun, 28 Jul 2024 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181770;
 bh=G8oQTjcYt4EIYN3WqlpBpoy1VAYDrd06NdL+PMqQDdQ=;
 h=From:To:Cc:Subject:Date:From;
 b=GnJbnuLXEDZycHSo/tY0BjSfW75r2H6bMU2fC5/hL02zGdGLbrXYKU31SWnHlC+zA
 lPH4dFT5KbcXwvkB2vvS/bynbhvIKNi2YgLh+VDluA1Hg6Lx9c57JwZ7JxdJMcCM7z
 GQZiGRRlr8Z1EwXqS0xvtai0pzpH6vzLyvHOD1w2MHT8B5dVY9eC2Y9O0N4Fv0OzfT
 NmD0sk7vjcKCpveTSX4zUi/mxhloH0bu+7AYEnhwMvRgh5Xud57k7wotmNO7DEbkCA
 nqsabzD/mWQnOxfQSP23XXs3ISL9h1v/E/LYQIt/eZwqOvd0Jn2c0b+0LcXy+j+5/y
 z4SITfjmp1Pgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ma Jun <Jun.Ma2@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 evan.quan@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, mario.limonciello@amd.com,
 sunran001@208suo.com, alexious@zju.edu.cn, ruanjinjie@huawei.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.15 01/10] drm/amdgpu/pm: Fix the null pointer
 dereference for smu7
Date: Sun, 28 Jul 2024 11:48:59 -0400
Message-ID: <20240728154927.2050160-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
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

From: Ma Jun <Jun.Ma2@amd.com>

[ Upstream commit c02c1960c93eede587576625a1221205a68a904f ]

optimize the code to avoid pass a null pointer (hwmgr->backend)
to function smu7_update_edc_leakage_table.

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 50 +++++++++----------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index 9bfc465d08fb0..2451cec031dda 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -2907,6 +2907,7 @@ static int smu7_update_edc_leakage_table(struct pp_hwmgr *hwmgr)
 
 static int smu7_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
 {
+	struct amdgpu_device *adev = hwmgr->adev;
 	struct smu7_hwmgr *data;
 	int result = 0;
 
@@ -2943,40 +2944,37 @@ static int smu7_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
 	/* Initalize Dynamic State Adjustment Rule Settings */
 	result = phm_initializa_dynamic_state_adjustment_rule_settings(hwmgr);
 
-	if (0 == result) {
-		struct amdgpu_device *adev = hwmgr->adev;
+	if (result)
+		goto fail;
 
-		data->is_tlu_enabled = false;
+	data->is_tlu_enabled = false;
 
-		hwmgr->platform_descriptor.hardwareActivityPerformanceLevels =
+	hwmgr->platform_descriptor.hardwareActivityPerformanceLevels =
 							SMU7_MAX_HARDWARE_POWERLEVELS;
-		hwmgr->platform_descriptor.hardwarePerformanceLevels = 2;
-		hwmgr->platform_descriptor.minimumClocksReductionPercentage = 50;
+	hwmgr->platform_descriptor.hardwarePerformanceLevels = 2;
+	hwmgr->platform_descriptor.minimumClocksReductionPercentage = 50;
 
-		data->pcie_gen_cap = adev->pm.pcie_gen_mask;
-		if (data->pcie_gen_cap & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)
-			data->pcie_spc_cap = 20;
-		else
-			data->pcie_spc_cap = 16;
-		data->pcie_lane_cap = adev->pm.pcie_mlw_mask;
-
-		hwmgr->platform_descriptor.vbiosInterruptId = 0x20000400; /* IRQ_SOURCE1_SW_INT */
-/* The true clock step depends on the frequency, typically 4.5 or 9 MHz. Here we use 5. */
-		hwmgr->platform_descriptor.clockStep.engineClock = 500;
-		hwmgr->platform_descriptor.clockStep.memoryClock = 500;
-		smu7_thermal_parameter_init(hwmgr);
-	} else {
-		/* Ignore return value in here, we are cleaning up a mess. */
-		smu7_hwmgr_backend_fini(hwmgr);
-	}
+	data->pcie_gen_cap = adev->pm.pcie_gen_mask;
+	if (data->pcie_gen_cap & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)
+		data->pcie_spc_cap = 20;
+	else
+		data->pcie_spc_cap = 16;
+	data->pcie_lane_cap = adev->pm.pcie_mlw_mask;
+
+	hwmgr->platform_descriptor.vbiosInterruptId = 0x20000400; /* IRQ_SOURCE1_SW_INT */
+	/* The true clock step depends on the frequency, typically 4.5 or 9 MHz. Here we use 5. */
+	hwmgr->platform_descriptor.clockStep.engineClock = 500;
+	hwmgr->platform_descriptor.clockStep.memoryClock = 500;
+	smu7_thermal_parameter_init(hwmgr);
 
 	result = smu7_update_edc_leakage_table(hwmgr);
-	if (result) {
-		smu7_hwmgr_backend_fini(hwmgr);
-		return result;
-	}
+	if (result)
+		goto fail;
 
 	return 0;
+fail:
+	smu7_hwmgr_backend_fini(hwmgr);
+	return result;
 }
 
 static int smu7_force_dpm_highest(struct pp_hwmgr *hwmgr)
-- 
2.43.0

