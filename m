Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78C813720
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 18:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DE610E970;
	Thu, 14 Dec 2023 17:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [207.46.229.174])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC7D010E96D;
 Thu, 14 Dec 2023 17:00:03 +0000 (UTC)
Received: from luzhipeng.223.5.5.5 (unknown [115.200.224.93])
 by mail-app4 (Coremail) with SMTP id cS_KCgCHjTWKNHtlNyaWAA--.38081S2;
 Fri, 15 Dec 2023 00:59:54 +0800 (CST)
From: Zhipeng Lu <alexious@zju.edu.cn>
To: alexious@zju.edu.cn
Subject: [PATCH] drm/amd/pm: fix a double-free in
 amdgpu_parse_extended_power_table
Date: Fri, 15 Dec 2023 00:59:38 +0800
Message-Id: <20231214165941.3484829-1-alexious@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cS_KCgCHjTWKNHtlNyaWAA--.38081S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XrW3Cr4kWFWktryUtw4ktFb_yoWfGry8pF
 Z3Gr9xKry5Xr18Xr42qr4jvr1q9w4q9w4UGryUAry5ta47uryF93Z3ArWYva4kuFZ7uwnr
 tFWjqFyDZa10gF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxkIecxEwVAFwVWUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VUUQVy7UUUUU==
X-CM-SenderInfo: qrsrjiarszq6lmxovvfxof0/
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, Kees Cook <keescook@chromium.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amdgpu_free_extended_power_table is called in every error-handling
paths of amdgpu_parse_extended_power_table. However, after the following
call chain of returning:

amdgpu_parse_extended_power_table
  |-> kv_dpm_init / si_dpm_init
      (the only two caller of amdgpu_parse_extended_power_table)
        |-> kv_dpm_sw_init / si_dpm_sw_init
            (the only caller of kv_dpm_init / si_dpm_init, accordingly)
              |-> kv_dpm_fini / si_dpm_fini
                  (goto dpm_failed in xx_dpm_sw_init)
                    |-> amdgpu_free_extended_power_table

As above, the amdgpu_free_extended_power_table is called twice in this
returning chain and thus a double-free is triggered. Similarily, the
last kfree in amdgpu_parse_extended_power_table also cause a double free
with amdgpu_free_extended_power_table in kv_dpm_fini.

Fixes: 84176663e70d ("drm/amd/pm: create a new holder for those APIs used only by legacy ASICs(si/kv)")
Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
---
 .../gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c    | 52 +++++--------------
 1 file changed, 13 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
index 81fb4e5dd804..60377747bab4 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
@@ -272,10 +272,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				 le16_to_cpu(power_info->pplib4.usVddcDependencyOnSCLKOffset));
 			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.vddc_dependency_on_sclk,
 								 dep_table);
-			if (ret) {
-				amdgpu_free_extended_power_table(adev);
+			if (ret)
 				return ret;
-			}
 		}
 		if (power_info->pplib4.usVddciDependencyOnMCLKOffset) {
 			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
@@ -283,10 +281,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				 le16_to_cpu(power_info->pplib4.usVddciDependencyOnMCLKOffset));
 			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.vddci_dependency_on_mclk,
 								 dep_table);
-			if (ret) {
-				amdgpu_free_extended_power_table(adev);
+			if (ret)
 				return ret;
-			}
 		}
 		if (power_info->pplib4.usVddcDependencyOnMCLKOffset) {
 			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
@@ -294,10 +290,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				 le16_to_cpu(power_info->pplib4.usVddcDependencyOnMCLKOffset));
 			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.vddc_dependency_on_mclk,
 								 dep_table);
-			if (ret) {
-				amdgpu_free_extended_power_table(adev);
+			if (ret)
 				return ret;
-			}
 		}
 		if (power_info->pplib4.usMvddDependencyOnMCLKOffset) {
 			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
@@ -305,10 +299,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				 le16_to_cpu(power_info->pplib4.usMvddDependencyOnMCLKOffset));
 			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.mvdd_dependency_on_mclk,
 								 dep_table);
-			if (ret) {
-				amdgpu_free_extended_power_table(adev);
+			if (ret)
 				return ret;
-			}
 		}
 		if (power_info->pplib4.usMaxClockVoltageOnDCOffset) {
 			ATOM_PPLIB_Clock_Voltage_Limit_Table *clk_v =
@@ -339,10 +331,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				kcalloc(psl->ucNumEntries,
 					sizeof(struct amdgpu_phase_shedding_limits_entry),
 					GFP_KERNEL);
-			if (!adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries) {
-				amdgpu_free_extended_power_table(adev);
+			if (!adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries)
 				return -ENOMEM;
-			}
 
 			entry = &psl->entries[0];
 			for (i = 0; i < psl->ucNumEntries; i++) {
@@ -383,10 +373,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 			ATOM_PPLIB_CAC_Leakage_Record *entry;
 			u32 size = cac_table->ucNumEntries * sizeof(struct amdgpu_cac_leakage_table);
 			adev->pm.dpm.dyn_state.cac_leakage_table.entries = kzalloc(size, GFP_KERNEL);
-			if (!adev->pm.dpm.dyn_state.cac_leakage_table.entries) {
-				amdgpu_free_extended_power_table(adev);
+			if (!adev->pm.dpm.dyn_state.cac_leakage_table.entries)
 				return -ENOMEM;
-			}
 			entry = &cac_table->entries[0];
 			for (i = 0; i < cac_table->ucNumEntries; i++) {
 				if (adev->pm.dpm.platform_caps & ATOM_PP_PLATFORM_CAP_EVV) {
@@ -438,10 +426,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				sizeof(struct amdgpu_vce_clock_voltage_dependency_entry);
 			adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries =
 				kzalloc(size, GFP_KERNEL);
-			if (!adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries) {
-				amdgpu_free_extended_power_table(adev);
+			if (!adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries)
 				return -ENOMEM;
-			}
 			adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.count =
 				limits->numEntries;
 			entry = &limits->entries[0];
@@ -493,10 +479,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				sizeof(struct amdgpu_uvd_clock_voltage_dependency_entry);
 			adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries =
 				kzalloc(size, GFP_KERNEL);
-			if (!adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries) {
-				amdgpu_free_extended_power_table(adev);
+			if (!adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries)
 				return -ENOMEM;
-			}
 			adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.count =
 				limits->numEntries;
 			entry = &limits->entries[0];
@@ -525,10 +509,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				sizeof(struct amdgpu_clock_voltage_dependency_entry);
 			adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries =
 				kzalloc(size, GFP_KERNEL);
-			if (!adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries) {
-				amdgpu_free_extended_power_table(adev);
+			if (!adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries)
 				return -ENOMEM;
-			}
 			adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.count =
 				limits->numEntries;
 			entry = &limits->entries[0];
@@ -548,10 +530,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				 le16_to_cpu(ext_hdr->usPPMTableOffset));
 			adev->pm.dpm.dyn_state.ppm_table =
 				kzalloc(sizeof(struct amdgpu_ppm_table), GFP_KERNEL);
-			if (!adev->pm.dpm.dyn_state.ppm_table) {
-				amdgpu_free_extended_power_table(adev);
+			if (!adev->pm.dpm.dyn_state.ppm_table)
 				return -ENOMEM;
-			}
 			adev->pm.dpm.dyn_state.ppm_table->ppm_design = ppm->ucPpmDesign;
 			adev->pm.dpm.dyn_state.ppm_table->cpu_core_number =
 				le16_to_cpu(ppm->usCpuCoreNumber);
@@ -583,10 +563,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 				sizeof(struct amdgpu_clock_voltage_dependency_entry);
 			adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries =
 				kzalloc(size, GFP_KERNEL);
-			if (!adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries) {
-				amdgpu_free_extended_power_table(adev);
+			if (!adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries)
 				return -ENOMEM;
-			}
 			adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.count =
 				limits->numEntries;
 			entry = &limits->entries[0];
@@ -606,10 +584,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 			ATOM_PowerTune_Table *pt;
 			adev->pm.dpm.dyn_state.cac_tdp_table =
 				kzalloc(sizeof(struct amdgpu_cac_tdp_table), GFP_KERNEL);
-			if (!adev->pm.dpm.dyn_state.cac_tdp_table) {
-				amdgpu_free_extended_power_table(adev);
+			if (!adev->pm.dpm.dyn_state.cac_tdp_table)
 				return -ENOMEM;
-			}
 			if (rev > 0) {
 				ATOM_PPLIB_POWERTUNE_Table_V1 *ppt = (ATOM_PPLIB_POWERTUNE_Table_V1 *)
 					(mode_info->atom_context->bios + data_offset +
@@ -645,10 +621,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
 			ret = amdgpu_parse_clk_voltage_dep_table(
 					&adev->pm.dpm.dyn_state.vddgfx_dependency_on_sclk,
 					dep_table);
-			if (ret) {
-				kfree(adev->pm.dpm.dyn_state.vddgfx_dependency_on_sclk.entries);
+			if (ret)
 				return ret;
-			}
 		}
 	}
 
-- 
2.34.1

