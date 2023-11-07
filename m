Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2467E3D33
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FC810E582;
	Tue,  7 Nov 2023 12:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B583110E580;
 Tue,  7 Nov 2023 12:26:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 41EA6B8168C;
 Tue,  7 Nov 2023 12:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E8CC433C8;
 Tue,  7 Nov 2023 12:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359992;
 bh=qAmdG8DMH7MIER4C2Q516PpvDxn39fxvFUomVEuN5RQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X4JVQB+eu5sIo0BeI1U582UdcjCw3lPqLOYLYc5zMHJYMmmYfCsPbnYdIjao5YA75
 6vsxOeGSmo5+xTJ5GDKmkdMwPTWA44N3sDexzpVNeNJi6l/1WsPMGFn4SoyjncYOjC
 naH+GDL/wduO3gtJJZTc7J6vAt7YW0VptgaWXz5/Y3azAXAx6v4D4ZwPdJ6u6IUMGp
 oBYtCdkWzLGd9Bq+P5kAYfLyumu8yAmYbA8KGNR6xc+GBH/Su8/dkbAmbYrOlrsmvA
 sYSnboMbTZOdCcbIArAZGsrHI/dVOHI0avK/070HXhN7AWnhRvsFbQAm6PbJD5F+HQ
 qFhBpHHUUr2KA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 30/37] drm/amd: Disable PP_PCIE_DPM_MASK when
 dynamic speed switching not supported
Date: Tue,  7 Nov 2023 07:21:41 -0500
Message-ID: <20231107122407.3760584-30-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122407.3760584-1-sashal@kernel.org>
References: <20231107122407.3760584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
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
Cc: lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>, srinivasan.shanmugam@amd.com,
 Sasha Levin <sashal@kernel.org>, mumei6102@gmail.com, guchun.chen@amd.com,
 shashank.sharma@amd.com, amd-gfx@lists.freedesktop.org, bokun.zhang@amd.com,
 andrealmeid@igalia.com, Lyndon.Li@amd.com, le.ma@amd.com, sunran001@208suo.com,
 evan.quan@amd.com, yifan1.zhang@amd.com, kevinyang.wang@amd.com, drv@mailo.com,
 Xinhui.Pan@amd.com, tzimmermann@suse.de,
 Alex Deucher <alexander.deucher@amd.com>, candice.li@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit fbf1035b033a51eee48d5f42e781b02fff272ca0 ]

Rather than individual ASICs checking for the quirk, set the quirk at the
driver level.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c              | 2 ++
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c     | 4 +---
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c          | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ecc61a6d13e13..65779cbdbad13 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2318,6 +2318,8 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
 	if (amdgpu_sriov_vf(adev) && adev->asic_type == CHIP_SIENNA_CICHLID)
 		adev->pm.pp_feature &= ~PP_OVERDRIVE_MASK;
+	if (!amdgpu_device_pcie_dynamic_switching_supported())
+		adev->pm.pp_feature &= ~PP_PCIE_DPM_MASK;
 
 	total = true;
 	for (i = 0; i < adev->num_ip_blocks; i++) {
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index 1cb4022644977..a38888176805d 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -1823,9 +1823,7 @@ static void smu7_init_dpm_defaults(struct pp_hwmgr *hwmgr)
 
 	data->mclk_dpm_key_disabled = hwmgr->feature_mask & PP_MCLK_DPM_MASK ? false : true;
 	data->sclk_dpm_key_disabled = hwmgr->feature_mask & PP_SCLK_DPM_MASK ? false : true;
-	data->pcie_dpm_key_disabled =
-		!amdgpu_device_pcie_dynamic_switching_supported() ||
-		!(hwmgr->feature_mask & PP_PCIE_DPM_MASK);
+	data->pcie_dpm_key_disabled = !(hwmgr->feature_mask & PP_PCIE_DPM_MASK);
 	/* need to set voltage control types before EVV patching */
 	data->voltage_control = SMU7_VOLTAGE_CONTROL_NONE;
 	data->vddci_control = SMU7_VOLTAGE_CONTROL_NONE;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 9a5f3d31e7780..94f22df5ac205 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -2107,7 +2107,7 @@ static int sienna_cichlid_update_pcie_parameters(struct smu_context *smu,
 	min_lane_width = min_lane_width > max_lane_width ?
 			 max_lane_width : min_lane_width;
 
-	if (!amdgpu_device_pcie_dynamic_switching_supported()) {
+	if (!(smu->adev->pm.pp_feature & PP_PCIE_DPM_MASK)) {
 		pcie_table->pcie_gen[0] = max_gen_speed;
 		pcie_table->pcie_lane[0] = max_lane_width;
 	} else {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 4fa94f583b87c..223e890575a2b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -2436,7 +2436,7 @@ int smu_v13_0_update_pcie_parameters(struct smu_context *smu,
 	uint32_t smu_pcie_arg;
 	int ret, i;
 
-	if (!amdgpu_device_pcie_dynamic_switching_supported()) {
+	if (!(smu->adev->pm.pp_feature & PP_PCIE_DPM_MASK)) {
 		if (pcie_table->pcie_gen[num_of_levels - 1] < pcie_gen_cap)
 			pcie_gen_cap = pcie_table->pcie_gen[num_of_levels - 1];
 
-- 
2.42.0

