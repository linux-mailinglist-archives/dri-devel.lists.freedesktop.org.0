Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074B376F812
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 04:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E6010E1DE;
	Fri,  4 Aug 2023 02:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E546910E1DE;
 Fri,  4 Aug 2023 02:47:40 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RH98S2XdjzrS6h;
 Fri,  4 Aug 2023 10:46:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 10:47:36 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Alex
 Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [PATCH -next v2] drm/amdgpu: Remove a lot of unnecessary ternary
 operators
Date: Fri, 4 Aug 2023 10:46:48 +0800
Message-ID: <20230804024649.1650556-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are many ternary operators, the true or false judgement
of which is unnecessary in C language semantics.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
v2:
- add the wrong removed true or false judgement hunk code
- Update the commit message, Ther -> There
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c                 | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c                   | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c                   | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c                 | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c                    | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c                    | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c                  | 2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c    | 4 +---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c      | 4 ++--
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c  | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c    | 9 +++------
 .../gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c   | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c   | 7 +++----
 13 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index b582b83c4984..38ccec913f00 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -460,7 +460,7 @@ bool amdgpu_get_bios(struct amdgpu_device *adev)
 	return false;
 
 success:
-	adev->is_atom_fw = (adev->asic_type >= CHIP_VEGA10) ? true : false;
+	adev->is_atom_fw = adev->asic_type >= CHIP_VEGA10;
 	return true;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 79791379fc2b..df4440c21bbf 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -479,7 +479,7 @@ static int jpeg_v3_0_set_clockgating_state(void *handle,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 
 	if (enable) {
 		if (!jpeg_v3_0_is_idle(handle))
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index a707d407fbd0..3eb3dcd56b57 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -626,7 +626,7 @@ static int jpeg_v4_0_set_clockgating_state(void *handle,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 
 	if (enable) {
 		if (!jpeg_v4_0_is_idle(handle))
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index ce2b22f7e4e4..153731d6ce8b 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -785,7 +785,7 @@ static int jpeg_v4_0_3_set_clockgating_state(void *handle,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 	int i;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index b76ba21b5a89..9b662b105cc1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -2095,7 +2095,7 @@ static int vcn_v3_0_set_clockgating_state(void *handle,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 	int i;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 6089c7deba8a..7c486745bece 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1918,7 +1918,7 @@ static int vcn_v4_0_wait_for_idle(void *handle)
 static int vcn_v4_0_set_clockgating_state(void *handle, enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 	int i;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 550ac040b4be..e62472e6e7b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -1287,7 +1287,7 @@ static int vcn_v4_0_3_set_clockgating_state(void *handle,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 	int i;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
index fa314493ffc5..e4d65de2d0bb 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
@@ -941,9 +941,7 @@ bool dce110_link_encoder_validate_output_with_stream(
 	break;
 	case SIGNAL_TYPE_EDP:
 	case SIGNAL_TYPE_LVDS:
-		is_valid =
-			(stream->timing.
-				pixel_encoding == PIXEL_ENCODING_RGB) ? true : false;
+		is_valid = stream->timing.pixel_encoding == PIXEL_ENCODING_RGB;
 	break;
 	case SIGNAL_TYPE_VIRTUAL:
 		is_valid = true;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index 1cb402264497..3d61489209dd 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -904,7 +904,7 @@ static int smu7_setup_dpm_tables_v1(struct pp_hwmgr *hwmgr)
 					dep_sclk_table->entries[i].clk;
 
 			data->dpm_table.sclk_table.dpm_levels[data->dpm_table.sclk_table.count].enabled =
-					(i == 0) ? true : false;
+					i == 0;
 			data->dpm_table.sclk_table.count++;
 		}
 	}
@@ -919,7 +919,7 @@ static int smu7_setup_dpm_tables_v1(struct pp_hwmgr *hwmgr)
 			data->dpm_table.mclk_table.dpm_levels[data->dpm_table.mclk_table.count].value =
 							dep_mclk_table->entries[i].clk;
 			data->dpm_table.mclk_table.dpm_levels[data->dpm_table.mclk_table.count].enabled =
-							(i == 0) ? true : false;
+							i == 0;
 			data->dpm_table.mclk_table.count++;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
index 21be23ec3c79..d6eeef3c58f7 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
@@ -1103,7 +1103,7 @@ int smu7_enable_smc_cac(struct pp_hwmgr *hwmgr)
 		PP_ASSERT_WITH_CODE((0 == smc_result),
 				"Failed to enable CAC in SMC.", result = -1);
 
-		data->cac_enabled = (0 == smc_result) ? true : false;
+		data->cac_enabled = smc_result == 0;
 	}
 	return result;
 }
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index c51dd4c74fe9..52ae6fa2d2a6 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -1375,8 +1375,7 @@ static int vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
 						dep_mm_table->entries[i].eclk) {
 			dpm_table->dpm_levels[dpm_table->count].value =
 					dep_mm_table->entries[i].eclk;
-			dpm_table->dpm_levels[dpm_table->count].enabled =
-					(i == 0) ? true : false;
+			dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
 			dpm_table->count++;
 		}
 	}
@@ -1391,8 +1390,7 @@ static int vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
 						dep_mm_table->entries[i].vclk) {
 			dpm_table->dpm_levels[dpm_table->count].value =
 					dep_mm_table->entries[i].vclk;
-			dpm_table->dpm_levels[dpm_table->count].enabled =
-					(i == 0) ? true : false;
+			dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
 			dpm_table->count++;
 		}
 	}
@@ -1405,8 +1403,7 @@ static int vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
 						dep_mm_table->entries[i].dclk) {
 			dpm_table->dpm_levels[dpm_table->count].value =
 					dep_mm_table->entries[i].dclk;
-			dpm_table->dpm_levels[dpm_table->count].enabled =
-					(i == 0) ? true : false;
+			dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
 			dpm_table->count++;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
index e7ed2a7adf8f..ff6b563ecbf5 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
@@ -1888,7 +1888,7 @@ static int polaris10_populate_avfs_parameters(struct pp_hwmgr *hwmgr)
 						(avfs_params.ucEnableGB_VDROOP_TABLE_CKSOFF << BTCGB1_Vdroop_Enable_SHIFT) |
 						(avfs_params.ucEnableGB_FUSE_TABLE_CKSON << AVFSGB0_Vdroop_Enable_SHIFT) |
 						(avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF << AVFSGB1_Vdroop_Enable_SHIFT);
-		data->apply_avfs_cks_off_voltage = (avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1) ? true : false;
+		data->apply_avfs_cks_off_voltage = avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1;
 	}
 	return result;
 }
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
index 7d024d3facef..34c9f59b889a 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
@@ -295,9 +295,8 @@ static int vegam_process_firmware_header(struct pp_hwmgr *hwmgr)
 
 static bool vegam_is_dpm_running(struct pp_hwmgr *hwmgr)
 {
-	return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
-			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON))
-			? true : false;
+	return 1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
+			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON);
 }
 
 static uint32_t vegam_get_mac_definition(uint32_t value)
@@ -1660,7 +1659,7 @@ static int vegam_populate_avfs_parameters(struct pp_hwmgr *hwmgr)
 				(avfs_params.ucEnableGB_FUSE_TABLE_CKSON << AVFSGB0_Vdroop_Enable_SHIFT) |
 				(avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF << AVFSGB1_Vdroop_Enable_SHIFT);
 		data->apply_avfs_cks_off_voltage =
-				(avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1) ? true : false;
+				avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1;
 	}
 	return result;
 }
-- 
2.34.1

