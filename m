Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C3392BF9D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 18:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6160D10E5EB;
	Tue,  9 Jul 2024 16:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oCGYxkw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113B810E5EB;
 Tue,  9 Jul 2024 16:21:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 809ABCE12AD;
 Tue,  9 Jul 2024 16:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021BEC3277B;
 Tue,  9 Jul 2024 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720542112;
 bh=PudzIrLLEe+juSZDGRLxrnpwV7MIcutbzRdXNGthclg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oCGYxkw0BobP1UZmstEqpjvDZvL8QrgtKwe1nas6v/WylMAoZzRG1CCPZEaNpAFrO
 U09YLCIdOpXSYn4V9C6orcR/gai8J+1xeU5Qemr78u1YJdeKULYsYyJ07FdNClsE9X
 WyBORjcx0uC4BCXvMBakYybsqi0A6jPNHK7Zj99NN1wtj5m4ulmpYr0YJQPW/YJWs4
 P8KUh8DA3RXbrrxyEHFAU4MLJGRGNYOrYKus6ddj7BPnr/R0Mi+9K0W2Vlb+OgFSo+
 c3u86rEg1afQtcFLNtRhoLXP1E8NLi6FzK5sOPGPAfLkq+Od6w99+KN52kvbh/wUDj
 NojJseJetAwAw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Li Ma <li.ma@amd.com>, Tim Huang <Tim.Huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 evan.quan@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, lijo.lazar@amd.com, Jun.Ma2@amd.com,
 kenneth.feng@amd.com, mario.limonciello@amd.com, Lang.Yu@amd.com,
 le.ma@amd.com, sunran001@208suo.com, bokun.zhang@amd.com,
 yifan1.zhang@amd.com, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 asad.kamal@amd.com, Xiaojian.Du@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.9 38/40] drm/amd/swsmu: add MALL init support
 workaround for smu_v14_0_1
Date: Tue,  9 Jul 2024 12:19:18 -0400
Message-ID: <20240709162007.30160-38-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162007.30160-1-sashal@kernel.org>
References: <20240709162007.30160-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.8
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

From: Li Ma <li.ma@amd.com>

[ Upstream commit c223376b3019a00a0241faea0bc8c966738d1cc5 ]

[Why]
SMU firmware has not supported MALL PG.

[How]
Disable MALL PG and make it always on until SMU firmware is ready.

Signed-off-by: Li Ma <li.ma@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 13 ++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  5 ++
 .../pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h  |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |  4 +-
 .../drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c  | 73 +++++++++++++++++++
 5 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 65333141b1c1b..5a2247018229c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -323,6 +323,18 @@ static int smu_dpm_set_umsch_mm_enable(struct smu_context *smu,
 	return ret;
 }
 
+static int smu_set_mall_enable(struct smu_context *smu)
+{
+	int ret = 0;
+
+	if (!smu->ppt_funcs->set_mall_enable)
+		return 0;
+
+	ret = smu->ppt_funcs->set_mall_enable(smu);
+
+	return ret;
+}
+
 /**
  * smu_dpm_set_power_gate - power gate/ungate the specific IP block
  *
@@ -1785,6 +1797,7 @@ static int smu_hw_init(void *handle)
 		smu_dpm_set_jpeg_enable(smu, true);
 		smu_dpm_set_vpe_enable(smu, true);
 		smu_dpm_set_umsch_mm_enable(smu, true);
+		smu_set_mall_enable(smu);
 		smu_set_gfx_cgpg(smu, true);
 	}
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 1fa81575788c5..8667e8c9d7e7c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -1391,6 +1391,11 @@ struct pptable_funcs {
 	 */
 	int (*dpm_set_umsch_mm_enable)(struct smu_context *smu, bool enable);
 
+	/**
+	 * @set_mall_enable: Init MALL power gating control.
+	 */
+	int (*set_mall_enable)(struct smu_context *smu);
+
 	/**
 	 * @notify_rlc_state: Notify RLC power state to SMU.
 	 */
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h
index c4dc5881d8df0..e7f5ef49049f9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h
@@ -106,8 +106,8 @@
 #define PPSMC_MSG_DisableLSdma                  0x35 ///< Disable LSDMA
 #define PPSMC_MSG_SetSoftMaxVpe                 0x36 ///<
 #define PPSMC_MSG_SetSoftMinVpe                 0x37 ///<
-#define PPSMC_MSG_AllocMALLCache                0x38 ///< Allocating MALL Cache
-#define PPSMC_MSG_ReleaseMALLCache              0x39 ///< Releasing MALL Cache
+#define PPSMC_MSG_MALLPowerController           0x38 ///< Set MALL control
+#define PPSMC_MSG_MALLPowerState                0x39 ///< Enter/Exit MALL PG
 #define PPSMC_Message_Count                     0x3A ///< Total number of PPSMC messages
 /** @}*/
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
index af427cc7dbb84..4a7404856b960 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
@@ -272,7 +272,9 @@
 	__SMU_DUMMY_MAP(SetSoftMinVpe), \
 	__SMU_DUMMY_MAP(GetMetricsVersion), \
 	__SMU_DUMMY_MAP(EnableUCLKShadow), \
-	__SMU_DUMMY_MAP(RmaDueToBadPageThreshold),
+	__SMU_DUMMY_MAP(RmaDueToBadPageThreshold), \
+	__SMU_DUMMY_MAP(MALLPowerController), \
+	__SMU_DUMMY_MAP(MALLPowerState),
 
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(type)	SMU_MSG_##type
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
index 63399c00cc28f..20f3861b5eeac 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
@@ -52,6 +52,19 @@
 #define mmMP1_SMN_C2PMSG_90			0x029a
 #define mmMP1_SMN_C2PMSG_90_BASE_IDX		    0
 
+/* MALLPowerController message arguments (Defines for the Cache mode control) */
+#define SMU_MALL_PMFW_CONTROL 0
+#define SMU_MALL_DRIVER_CONTROL 1
+
+/*
+ * MALLPowerState message arguments
+ * (Defines for the Allocate/Release Cache mode if in driver mode)
+ */
+#define SMU_MALL_EXIT_PG 0
+#define SMU_MALL_ENTER_PG 1
+
+#define SMU_MALL_PG_CONFIG_DEFAULT SMU_MALL_PG_CONFIG_DRIVER_CONTROL_ALWAYS_ON
+
 #define FEATURE_MASK(feature) (1ULL << feature)
 #define SMC_DPM_FEATURE ( \
 	FEATURE_MASK(FEATURE_CCLK_DPM_BIT) | \
@@ -66,6 +79,12 @@
 	FEATURE_MASK(FEATURE_GFX_DPM_BIT)	| \
 	FEATURE_MASK(FEATURE_VPE_DPM_BIT))
 
+enum smu_mall_pg_config {
+	SMU_MALL_PG_CONFIG_PMFW_CONTROL = 0,
+	SMU_MALL_PG_CONFIG_DRIVER_CONTROL_ALWAYS_ON = 1,
+	SMU_MALL_PG_CONFIG_DRIVER_CONTROL_ALWAYS_OFF = 2,
+};
+
 static struct cmn2asic_msg_mapping smu_v14_0_0_message_map[SMU_MSG_MAX_COUNT] = {
 	MSG_MAP(TestMessage,                    PPSMC_MSG_TestMessage,				1),
 	MSG_MAP(GetSmuVersion,                  PPSMC_MSG_GetPmfwVersion,			1),
@@ -113,6 +132,8 @@ static struct cmn2asic_msg_mapping smu_v14_0_0_message_map[SMU_MSG_MAX_COUNT] =
 	MSG_MAP(PowerDownUmsch,                 PPSMC_MSG_PowerDownUmsch,			1),
 	MSG_MAP(SetSoftMaxVpe,                  PPSMC_MSG_SetSoftMaxVpe,			1),
 	MSG_MAP(SetSoftMinVpe,                  PPSMC_MSG_SetSoftMinVpe,			1),
+	MSG_MAP(MALLPowerController,            PPSMC_MSG_MALLPowerController,		1),
+	MSG_MAP(MALLPowerState,                 PPSMC_MSG_MALLPowerState,			1),
 };
 
 static struct cmn2asic_mapping smu_v14_0_0_feature_mask_map[SMU_FEATURE_COUNT] = {
@@ -1417,6 +1438,57 @@ static int smu_v14_0_common_get_dpm_table(struct smu_context *smu, struct dpm_cl
 	return 0;
 }
 
+static int smu_v14_0_1_init_mall_power_gating(struct smu_context *smu, enum smu_mall_pg_config pg_config)
+{
+	struct amdgpu_device *adev = smu->adev;
+	int ret = 0;
+
+	if (pg_config == SMU_MALL_PG_CONFIG_PMFW_CONTROL) {
+		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_MALLPowerController,
+								SMU_MALL_PMFW_CONTROL, NULL);
+		if (ret) {
+			dev_err(adev->dev, "Init MALL PMFW CONTROL Failure\n");
+			return ret;
+		}
+	} else {
+		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_MALLPowerController,
+								SMU_MALL_DRIVER_CONTROL, NULL);
+		if (ret) {
+			dev_err(adev->dev, "Init MALL Driver CONTROL Failure\n");
+			return ret;
+		}
+
+		if (pg_config == SMU_MALL_PG_CONFIG_DRIVER_CONTROL_ALWAYS_ON) {
+			ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_MALLPowerState,
+									SMU_MALL_EXIT_PG, NULL);
+			if (ret) {
+				dev_err(adev->dev, "EXIT MALL PG Failure\n");
+				return ret;
+			}
+		} else if (pg_config == SMU_MALL_PG_CONFIG_DRIVER_CONTROL_ALWAYS_OFF) {
+			ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_MALLPowerState,
+									SMU_MALL_ENTER_PG, NULL);
+			if (ret) {
+				dev_err(adev->dev, "Enter MALL PG Failure\n");
+				return ret;
+			}
+		}
+	}
+
+	return ret;
+}
+
+static int smu_v14_0_common_set_mall_enable(struct smu_context *smu)
+{
+	enum smu_mall_pg_config pg_config = SMU_MALL_PG_CONFIG_DEFAULT;
+	int ret = 0;
+
+	if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) == IP_VERSION(14, 0, 1))
+		ret = smu_v14_0_1_init_mall_power_gating(smu, pg_config);
+
+	return ret;
+}
+
 static const struct pptable_funcs smu_v14_0_0_ppt_funcs = {
 	.check_fw_status = smu_v14_0_check_fw_status,
 	.check_fw_version = smu_v14_0_check_fw_version,
@@ -1448,6 +1520,7 @@ static const struct pptable_funcs smu_v14_0_0_ppt_funcs = {
 	.dpm_set_vpe_enable = smu_v14_0_0_set_vpe_enable,
 	.dpm_set_umsch_mm_enable = smu_v14_0_0_set_umsch_mm_enable,
 	.get_dpm_clock_table = smu_v14_0_common_get_dpm_table,
+	.set_mall_enable = smu_v14_0_common_set_mall_enable,
 };
 
 static void smu_v14_0_0_set_smu_mailbox_registers(struct smu_context *smu)
-- 
2.43.0

