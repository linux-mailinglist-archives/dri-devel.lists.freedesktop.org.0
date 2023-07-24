Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A475E672
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345DF10E22E;
	Mon, 24 Jul 2023 01:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B19710E05E;
 Mon, 24 Jul 2023 01:20:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71FC460EF3;
 Mon, 24 Jul 2023 01:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B251C433C8;
 Mon, 24 Jul 2023 01:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161614;
 bh=npt4vsqLpHMG0/ang8d1WWk6sCgughNtGgejCcIhq6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rGXPnIRJkHTul1sFwrU/8vUDvTuUBxDVgCmwKomq0i4HER4FstSbvhm4qwKfdI+T8
 +ze8scyTwwvOEY9AxJl2jvZqxS5YHdPINNcPEBH4/zrwSszED3Jlly5RxX3OPGV799
 l0FBMApH3oe3vi3nHiP5+IMeRE2wjpNMvHkPYT+Oa68pEOH3lBOMF8R5QccNYT/Tyl
 2WHU/eT27k3Lg+jfWJa9WR5s9Dg+nUFhS3H3k84xo1vL50UsXCTTtFuKf3kSnd4yNx
 m6uSjlT5Nel1lLbVooeb5M3VzpesAOsVVFFPBhT4Yx2Q6IBKA+icFqFzBo3FMH1jPB
 sPuFFlxlfXUbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 44/58] drm/amd/pm: Fill metrics data for SMUv13.0.6
Date: Sun, 23 Jul 2023 21:13:12 -0400
Message-Id: <20230724011338.2298062-44-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, kevinyang.wang@amd.com,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 asad.kamal@amd.com, bob.zhou@amd.com, Le Ma <le.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 evan.quan@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit 1718e973e3d23b653cd77994073a9deda3875689 ]

Populate metrics data table for SMU v13.0.6. Add PCIe link speed/width
information also.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Le Ma <le.ma@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c  | 107 +++++++++++-------
 1 file changed, 66 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index ea8f3d6fb98b3..de63e7fd1d7bf 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -80,7 +80,10 @@
 /* possible frequency drift (1Mhz) */
 #define EPSILON 1
 
-#define smnPCIE_ESM_CTRL 0x111003D0
+#define smnPCIE_ESM_CTRL 0x193D0
+#define smnPCIE_LC_LINK_WIDTH_CNTL 0x1ab40288
+#define PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD_MASK 0x00000070L
+#define PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD__SHIFT 0x4
 
 static const struct cmn2asic_msg_mapping smu_v13_0_6_message_map[SMU_MSG_MAX_COUNT] = {
 	MSG_MAP(TestMessage,			     PPSMC_MSG_TestMessage,			0),
@@ -201,6 +204,7 @@ struct PPTable_t {
 };
 
 #define SMUQ10_TO_UINT(x) ((x) >> 10)
+#define SMUQ16_TO_UINT(x) ((x) >> 16)
 
 struct smu_v13_0_6_dpm_map {
 	enum smu_clk_type clk_type;
@@ -1823,6 +1827,15 @@ static void smu_v13_0_6_log_thermal_throttling_event(struct smu_context *smu)
 						   smu_v13_0_6_throttler_map));
 }
 
+static int
+smu_v13_0_6_get_current_pcie_link_width_level(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	return REG_GET_FIELD(RREG32_PCIE(smnPCIE_LC_LINK_WIDTH_CNTL),
+			     PCIE_LC_LINK_WIDTH_CNTL, LC_LINK_WIDTH_RD);
+}
+
 static int smu_v13_0_6_get_current_pcie_link_speed(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
@@ -1841,8 +1854,12 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table
 	struct smu_table_context *smu_table = &smu->smu_table;
 	struct gpu_metrics_v1_3 *gpu_metrics =
 		(struct gpu_metrics_v1_3 *)smu_table->gpu_metrics_table;
+	struct amdgpu_device *adev = smu->adev;
+	int ret = 0, inst0, xcc0;
 	MetricsTable_t *metrics;
-	int i, ret = 0;
+
+	inst0 = adev->sdma.instance[0].aid_id;
+	xcc0 = GET_INST(GC, 0);
 
 	metrics = kzalloc(sizeof(MetricsTable_t), GFP_KERNEL);
 	ret = smu_v13_0_6_get_metrics_table(smu, metrics, true);
@@ -1851,51 +1868,59 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table
 
 	smu_cmn_init_soft_gpu_metrics(gpu_metrics, 1, 3);
 
-	/* TODO: Decide on how to fill in zero value fields */
-	gpu_metrics->temperature_edge = 0;
-	gpu_metrics->temperature_hotspot = 0;
-	gpu_metrics->temperature_mem = 0;
-	gpu_metrics->temperature_vrgfx = 0;
-	gpu_metrics->temperature_vrsoc = 0;
-	gpu_metrics->temperature_vrmem = 0;
-
-	gpu_metrics->average_gfx_activity = 0;
-	gpu_metrics->average_umc_activity = 0;
-	gpu_metrics->average_mm_activity = 0;
-
-	gpu_metrics->average_socket_power = 0;
-	gpu_metrics->energy_accumulator = 0;
-
-	gpu_metrics->average_gfxclk_frequency = 0;
-	gpu_metrics->average_socclk_frequency = 0;
-	gpu_metrics->average_uclk_frequency = 0;
-	gpu_metrics->average_vclk0_frequency = 0;
-	gpu_metrics->average_dclk0_frequency = 0;
-
-	gpu_metrics->current_gfxclk = 0;
-	gpu_metrics->current_socclk = 0;
-	gpu_metrics->current_uclk = 0;
-	gpu_metrics->current_vclk0 = 0;
-	gpu_metrics->current_dclk0 = 0;
-
+	gpu_metrics->temperature_hotspot =
+		SMUQ10_TO_UINT(metrics->MaxSocketTemperature);
+	/* Individual HBM stack temperature is not reported */
+	gpu_metrics->temperature_mem =
+		SMUQ10_TO_UINT(metrics->MaxHbmTemperature);
+	/* Reports max temperature of all voltage rails */
+	gpu_metrics->temperature_vrsoc =
+		SMUQ10_TO_UINT(metrics->MaxVrTemperature);
+
+	gpu_metrics->average_gfx_activity =
+		SMUQ10_TO_UINT(metrics->SocketGfxBusy);
+	gpu_metrics->average_umc_activity =
+		SMUQ10_TO_UINT(metrics->DramBandwidthUtilization);
+
+	gpu_metrics->average_socket_power =
+		SMUQ10_TO_UINT(metrics->SocketPower);
+	gpu_metrics->energy_accumulator =
+		SMUQ16_TO_UINT(metrics->SocketEnergyAcc);
+
+	gpu_metrics->current_gfxclk =
+		SMUQ10_TO_UINT(metrics->GfxclkFrequency[xcc0]);
+	gpu_metrics->current_socclk =
+		SMUQ10_TO_UINT(metrics->SocclkFrequency[inst0]);
+	gpu_metrics->current_uclk = SMUQ10_TO_UINT(metrics->UclkFrequency);
+	gpu_metrics->current_vclk0 =
+		SMUQ10_TO_UINT(metrics->VclkFrequency[inst0]);
+	gpu_metrics->current_dclk0 =
+		SMUQ10_TO_UINT(metrics->DclkFrequency[inst0]);
+
+	gpu_metrics->average_gfxclk_frequency = gpu_metrics->current_gfxclk;
+	gpu_metrics->average_socclk_frequency = gpu_metrics->current_socclk;
+	gpu_metrics->average_uclk_frequency = gpu_metrics->current_uclk;
+	gpu_metrics->average_vclk0_frequency = gpu_metrics->current_vclk0;
+	gpu_metrics->average_dclk0_frequency = gpu_metrics->current_dclk0;
+
+	/* Throttle status is not reported through metrics now */
 	gpu_metrics->throttle_status = 0;
-	gpu_metrics->indep_throttle_status = smu_cmn_get_indep_throttler_status(
-		gpu_metrics->throttle_status, smu_v13_0_6_throttler_map);
-
-	gpu_metrics->current_fan_speed = 0;
 
-	gpu_metrics->pcie_link_width = 0;
-	gpu_metrics->pcie_link_speed = smu_v13_0_6_get_current_pcie_link_speed(smu);
+	if (!(adev->flags & AMD_IS_APU)) {
+		gpu_metrics->pcie_link_width =
+			smu_v13_0_6_get_current_pcie_link_width_level(smu);
+		gpu_metrics->pcie_link_speed =
+			smu_v13_0_6_get_current_pcie_link_speed(smu);
+	}
 
 	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
 
-	gpu_metrics->gfx_activity_acc = 0;
-	gpu_metrics->mem_activity_acc = 0;
-
-	for (i = 0; i < NUM_HBM_INSTANCES; i++)
-		gpu_metrics->temperature_hbm[i] = 0;
+	gpu_metrics->gfx_activity_acc =
+		SMUQ10_TO_UINT(metrics->SocketGfxBusyAcc);
+	gpu_metrics->mem_activity_acc =
+		SMUQ10_TO_UINT(metrics->DramBandwidthUtilizationAcc);
 
-	gpu_metrics->firmware_timestamp = 0;
+	gpu_metrics->firmware_timestamp = metrics->Timestamp;
 
 	*table = (void *)gpu_metrics;
 	kfree(metrics);
-- 
2.39.2

