Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A991688DD3B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A5C10FA82;
	Wed, 27 Mar 2024 12:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ht5WjYyh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A98710FA7E;
 Wed, 27 Mar 2024 12:07:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B1BB4CE2632;
 Wed, 27 Mar 2024 12:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411D7C43390;
 Wed, 27 Mar 2024 12:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541244;
 bh=uzpbAgzkcpuAXG9dO+IUM9J+PeeWa0CoBAnw2tUCoQA=;
 h=From:To:Cc:Subject:Date:From;
 b=ht5WjYyh2zoDMLIre6QQqxXdRoFeDH1OnqEwvCiU9Gt3by43t7/7eYE+0s+r86Npy
 VMA9QrozO/hrIB+h6G1oz+HUBSMq/FzdMILkFouOl3ZK9nJ8s172/ytZEjRGxq1bIb
 fT0Tbr4H7Qj9CgRSSMblDIxfq4QyY3Rk1SaRrZX9lDY6x0+V41MwDRInLXq7WAOkPd
 hDjHBDhodeJJCgrWSBl6BUwbRtsa5nnnNUWMdsJpWA+YExsaZ5MpbmWpKJXMAynmQl
 Q/MggaE5t0pCX9eIy4yfC+YDfjTLItKGgY/3VWhcKpKp4PUJU2MlQiWJo0lMj9GwLf
 Vsc12wNCnfz5A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	mario.limonciello@amd.com
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "Revert "drm/amd/pm: fix the high voltage and
 temperature issue"" failed to apply to 6.8-stable tree
Date: Wed, 27 Mar 2024 08:07:21 -0400
Message-ID: <20240327120722.2825357-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.8-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 7055c5856aa10a7f2d687557c50751a72080e4c8 Mon Sep 17 00:00:00 2001
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Fri, 19 Jan 2024 03:08:37 -0600
Subject: [PATCH] Revert "drm/amd/pm: fix the high voltage and temperature
 issue"

This reverts commit 5f38ac54e60562323ea4abb1bfb37d043ee23357.
This causes issues with rebooting and the 7800XT.

Cc: Kenneth Feng <kenneth.feng@amd.com>
Cc: stable@vger.kernel.org
Fixes: 5f38ac54e605 ("drm/amd/pm: fix the high voltage and temperature issue")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3062
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 24 ++++----------
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 33 ++-----------------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  1 -
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  8 +----
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  |  8 +----
 5 files changed, 11 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2df14f0e79d80..1a04ccba9542a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4140,23 +4140,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 				}
 			}
 		} else {
-			switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
-			case IP_VERSION(13, 0, 0):
-			case IP_VERSION(13, 0, 7):
-			case IP_VERSION(13, 0, 10):
-				r = psp_gpu_reset(adev);
-				break;
-			default:
-				tmp = amdgpu_reset_method;
-				/* It should do a default reset when loading or reloading the driver,
-				 * regardless of the module parameter reset_method.
-				 */
-				amdgpu_reset_method = AMD_RESET_METHOD_NONE;
-				r = amdgpu_asic_reset(adev);
-				amdgpu_reset_method = tmp;
-				break;
-			}
-
+			tmp = amdgpu_reset_method;
+			/* It should do a default reset when loading or reloading the driver,
+			 * regardless of the module parameter reset_method.
+			 */
+			amdgpu_reset_method = AMD_RESET_METHOD_NONE;
+			r = amdgpu_asic_reset(adev);
+			amdgpu_reset_method = tmp;
 			if (r) {
 				dev_err(adev->dev, "asic reset on init failed\n");
 				goto failed;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index a54663f2e2ab9..13223fbaf3faa 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -734,7 +734,7 @@ static int smu_early_init(void *handle)
 	smu->adev = adev;
 	smu->pm_enabled = !!amdgpu_dpm;
 	smu->is_apu = false;
-	smu->smu_baco.state = SMU_BACO_STATE_NONE;
+	smu->smu_baco.state = SMU_BACO_STATE_EXIT;
 	smu->smu_baco.platform_support = false;
 	smu->user_dpm_profile.fan_mode = -1;
 
@@ -1954,31 +1954,10 @@ static int smu_smc_hw_cleanup(struct smu_context *smu)
 	return 0;
 }
 
-static int smu_reset_mp1_state(struct smu_context *smu)
-{
-	struct amdgpu_device *adev = smu->adev;
-	int ret = 0;
-
-	if ((!adev->in_runpm) && (!adev->in_suspend) &&
-		(!amdgpu_in_reset(adev)))
-		switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
-		case IP_VERSION(13, 0, 0):
-		case IP_VERSION(13, 0, 7):
-		case IP_VERSION(13, 0, 10):
-			ret = smu_set_mp1_state(smu, PP_MP1_STATE_UNLOAD);
-			break;
-		default:
-			break;
-		}
-
-	return ret;
-}
-
 static int smu_hw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct smu_context *smu = adev->powerplay.pp_handle;
-	int ret;
 
 	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
 		return 0;
@@ -1996,15 +1975,7 @@ static int smu_hw_fini(void *handle)
 
 	adev->pm.dpm_enabled = false;
 
-	ret = smu_smc_hw_cleanup(smu);
-	if (ret)
-		return ret;
-
-	ret = smu_reset_mp1_state(smu);
-	if (ret)
-		return ret;
-
-	return 0;
+	return smu_smc_hw_cleanup(smu);
 }
 
 static void smu_late_fini(void *handle)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 2aa4fea873147..66e84defd0b6e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -424,7 +424,6 @@ enum smu_reset_mode {
 enum smu_baco_state {
 	SMU_BACO_STATE_ENTER = 0,
 	SMU_BACO_STATE_EXIT,
-	SMU_BACO_STATE_NONE,
 };
 
 struct smu_baco_context {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index e769adb8da2cb..462a0e6aa53e3 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -2749,13 +2749,7 @@ static int smu_v13_0_0_set_mp1_state(struct smu_context *smu,
 
 	switch (mp1_state) {
 	case PP_MP1_STATE_UNLOAD:
-		ret = smu_cmn_send_smc_msg_with_param(smu,
-											  SMU_MSG_PrepareMp1ForUnload,
-											  0x55, NULL);
-
-		if (!ret && smu->smu_baco.state == SMU_BACO_STATE_EXIT)
-			ret = smu_v13_0_disable_pmfw_state(smu);
-
+		ret = smu_cmn_set_mp1_state(smu, mp1_state);
 		break;
 	default:
 		/* Ignore others */
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 7c3e162e2d818..0ffdb58af74e6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -2505,13 +2505,7 @@ static int smu_v13_0_7_set_mp1_state(struct smu_context *smu,
 
 	switch (mp1_state) {
 	case PP_MP1_STATE_UNLOAD:
-		ret = smu_cmn_send_smc_msg_with_param(smu,
-											  SMU_MSG_PrepareMp1ForUnload,
-											  0x55, NULL);
-
-		if (!ret && smu->smu_baco.state == SMU_BACO_STATE_EXIT)
-			ret = smu_v13_0_disable_pmfw_state(smu);
-
+		ret = smu_cmn_set_mp1_state(smu, mp1_state);
 		break;
 	default:
 		/* Ignore others */
-- 
2.43.0




