Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19051719018
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 03:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C4410E1FA;
	Thu,  1 Jun 2023 01:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2197F10E1FA;
 Thu,  1 Jun 2023 01:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsaRp30FSC0olwDPvo2mvxKXlv3PS5ys3vlMZDSe1fioPI0vfHLn33J07gjCpx8Kc7TW9jXxH/kroJtE2G9RPAl9LElE5/r78dYi7pw8vREDCV0I5jvh1XlBZSu9LH2yiNa7QRsvBQM3ch6Dr3K1b6zxdGgLl50tvOufs3RT+RQ8d+TyyzyXl44xZ5k5HYG0ukapxTvnv6uWvT+OFUTZO+2swqdLD3n2xia890ia52Qywcz+mBIrd03DlB6uk5ju7Iv+8Nb0WNxxLXIfhixcYkdfdtY6GKCGOlAYfi2XFKqw1K/Jb+vbaat8KVQwxt5LUyr/S4GQN3n3u3YLGsLo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vfN1xyKl7lw0CpABFH0akPL2vBfQZyRU1ONOnJYq9A=;
 b=AV3rHBWgDBf5x51r68fr/YmiYjUJm7aZMHtjJffX2fxwhsWJ4eKIx4cF0J2SMgMi0898j69O76SJWOKoH6PibECdzH0ULIxa8Puf2GoA8L5yKmOrE6U6ix2Q7a/mlwmIYOSh6i8Wcnzo7JrA3k3lfBGyURx3jSETJytDiR/yoEmRGrbDj9X9cBwayiig+6r+UV7gGLLvhDZE3TaZkgmSK49U0a4OcCAXifkF/jri3AcHnVxyUssCuq0zvx+y1NwaTlCsPOxAVXZY+PB47cMVvF7yd3m2s51wfpELgUPZYFn5SKZkVgBacbZg1chkUadmz6rj4rCN3FBQ1atE181Nvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vfN1xyKl7lw0CpABFH0akPL2vBfQZyRU1ONOnJYq9A=;
 b=xvm2YVH/L9muCoOq4sSX+gkzgx94gZ6V5oNSPKFE23mWMA92EABKHYLUsFWr3U3IxTkcDDXHI47TLGm2sFDQhg4+vdVxRwT3T4+DdMWAe0QDcIkeWCEeSSXa3Y/QWhS4mLKSRxnI91xmu5Kp4owLXi7A3aslkrxVMwCnmLlwSbA=
Received: from BN8PR16CA0002.namprd16.prod.outlook.com (2603:10b6:408:4c::15)
 by PH0PR12MB5497.namprd12.prod.outlook.com (2603:10b6:510:eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 01:38:36 +0000
Received: from BL02EPF000145B9.namprd05.prod.outlook.com
 (2603:10b6:408:4c:cafe::7c) by BN8PR16CA0002.outlook.office365.com
 (2603:10b6:408:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Thu, 1 Jun 2023 01:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000145B9.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.18 via Frontend Transport; Thu, 1 Jun 2023 01:38:35 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 31 May
 2023 20:38:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 31 May
 2023 18:38:35 -0700
Received: from archlinux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 31 May 2023 20:38:32 -0500
From: Wenyou Yang <WenYou.Yang@amd.com>
To: <alexander.deucher@amd.com>, <mario.limonciello@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <evan.quan@amd.com>
Subject: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire
 gpu_metrics
Date: Thu, 1 Jun 2023 09:38:26 +0800
Message-ID: <20230601013826.265885-1-WenYou.Yang@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B9:EE_|PH0PR12MB5497:EE_
X-MS-Office365-Filtering-Correlation-Id: 77520a6d-d3c1-426e-27de-08db6240eaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /y77472i82d4cZ05Htc1LDmFB1l+VmwFJHVMbA5kdiac8Q332hdoKNmk8uYgDUzax1mRUShJJqJCwOYWnfSrFkJcXJt37RFK3qyHMQYjRE6nr1BzAiOOOccZlvvsiCGVcfVOn1BLpjMTK6HTinyWFJHbf63WHbu8KItjtzvqUtsWKewmX1nQahJfer8YInpLcIdCfggmuYpprHqa3e5HEi6JCgh7gagctq5tF4AqkcV7TcYLHe5wKUTtS5eh7SwF+MGfdIUKcHpYLHOs/rmiqsTQZl8C8YC2aUvut0Ry+UZPtw+yqPx1MgpszWIvmTkN1eEhO3zmBgD3Jv0o0pn8jGRAQGT0qC1kh9nAEngjpCYvt3nFA6wBs9tY4u/7s/9pLMBseXLQ4rqRLoILzsEM8dTAK2qpFOUhs9trQtR0g5kbWMlcRPKFogOWL2PxmLy1OHQtO+AqfJljdxBzvS3nUrr8h6sXa0neAoAeJi76E1eZdWO7XjryXPKhQA82bVzhVdW2tzd9kokdh31zzzSQWytx8P//Kyt6cFOJL5+9d3xEZKeG384Q3Wzxzj477CnrJ+XbsS/ZhultauCq+kGH/HZhwUavNENXgdK1vH1t3jESBNVEU/ZIlccrVmQKxNkiFytU3gMM5b3kBvmjuxCqiiy/+9fUlKsyJ5qI2+DIx+xc88YNxCR4e4/V9zVe9wpJAgm9Ari7E6DP7m1czs6cCImlpLLCb0xSr+wiFFpRokAAj+lhlMDOCpJRqfPu+EJTL71BqaoioTJsfWM4DcnE1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(7696005)(41300700001)(86362001)(40480700001)(6636002)(4326008)(40460700003)(6666004)(316002)(36756003)(70586007)(70206006)(47076005)(186003)(83380400001)(2616005)(1076003)(26005)(478600001)(36860700001)(426003)(336012)(5660300002)(2906002)(356005)(8676002)(81166007)(110136005)(54906003)(82740400003)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 01:38:35.8085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77520a6d-d3c1-426e-27de-08db6240eaba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000145B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5497
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wenyou Yang <WenYou.Yang@amd.com>, amd-gfx@lists.freedesktop.org,
 weiyuan2@amd.com, richardqi.liang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To acquire the voltage and current info from gpu_metrics interface,
but gpu_metrics_v2_3 doesn't contain them, and to be backward compatible,
add new gpu_metrics_v2_4 structure.

Acked-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Wenyou Yang <WenYou.Yang@amd.com>
---
 .../gpu/drm/amd/include/kgd_pp_interface.h    |  69 +++++++++++
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 109 ++++++++++++++++--
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        |   3 +
 3 files changed, 172 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
index 9f542f6e19ed..0f37dafafcf9 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -892,4 +892,73 @@ struct gpu_metrics_v2_3 {
 	uint16_t			average_temperature_core[8]; // average CPU core temperature on APUs
 	uint16_t			average_temperature_l3[2];
 };
+
+struct gpu_metrics_v2_4 {
+	struct metrics_table_header	common_header;
+
+	/* Temperature */
+	uint16_t			temperature_gfx;
+	uint16_t			temperature_soc;
+	uint16_t			temperature_core[8];
+	uint16_t			temperature_l3[2];
+
+	/* Utilization */
+	uint16_t			average_gfx_activity;
+	uint16_t			average_mm_activity;
+
+	/* Driver attached timestamp (in ns) */
+	uint64_t			system_clock_counter;
+
+	/* Power/Energy */
+	uint16_t			average_socket_power;
+	uint16_t			average_cpu_power;
+	uint16_t			average_soc_power;
+	uint16_t			average_gfx_power;
+	uint16_t			average_core_power[8];
+
+	/* Average clocks */
+	uint16_t			average_gfxclk_frequency;
+	uint16_t			average_socclk_frequency;
+	uint16_t			average_uclk_frequency;
+	uint16_t			average_fclk_frequency;
+	uint16_t			average_vclk_frequency;
+	uint16_t			average_dclk_frequency;
+
+	/* Current clocks */
+	uint16_t			current_gfxclk;
+	uint16_t			current_socclk;
+	uint16_t			current_uclk;
+	uint16_t			current_fclk;
+	uint16_t			current_vclk;
+	uint16_t			current_dclk;
+	uint16_t			current_coreclk[8];
+	uint16_t			current_l3clk[2];
+
+	/* Throttle status (ASIC dependent) */
+	uint32_t			throttle_status;
+
+	/* Fans */
+	uint16_t			fan_pwm;
+
+	uint16_t			padding[3];
+
+	/* Throttle status (ASIC independent) */
+	uint64_t			indep_throttle_status;
+
+	/* Average Temperature */
+	uint16_t			average_temperature_gfx;
+	uint16_t			average_temperature_soc;
+	uint16_t			average_temperature_core[8];
+	uint16_t			average_temperature_l3[2];
+
+	/* Power/Voltage */
+	uint16_t			average_cpu_voltage;
+	uint16_t			average_soc_voltage;
+	uint16_t			average_gfx_voltage;
+
+	/* Power/Current */
+	uint16_t			average_cpu_current;
+	uint16_t			average_soc_current;
+	uint16_t			average_gfx_current;
+};
 #endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 067b4e0b026c..185d0b50ee8e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -1854,6 +1854,86 @@ static ssize_t vangogh_get_gpu_metrics_v2_3(struct smu_context *smu,
 	return sizeof(struct gpu_metrics_v2_3);
 }
 
+static ssize_t vangogh_get_gpu_metrics_v2_4(struct smu_context *smu,
+					    void **table)
+{
+	SmuMetrics_t metrics;
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct gpu_metrics_v2_4 *gpu_metrics =
+				(struct gpu_metrics_v2_4 *)smu_table->gpu_metrics_table;
+	int ret = 0;
+
+	ret = smu_cmn_get_metrics_table(smu, &metrics, true);
+	if (ret)
+		return ret;
+
+	smu_cmn_init_soft_gpu_metrics(gpu_metrics, 2, 4);
+
+	gpu_metrics->temperature_gfx = metrics.Current.GfxTemperature;
+	gpu_metrics->temperature_soc = metrics.Current.SocTemperature;
+	memcpy(&gpu_metrics->temperature_core[0],
+	       &metrics.Current.CoreTemperature[0],
+	       sizeof(uint16_t) * 4);
+	gpu_metrics->temperature_l3[0] = metrics.Current.L3Temperature[0];
+
+	gpu_metrics->average_temperature_gfx = metrics.Average.GfxTemperature;
+	gpu_metrics->average_temperature_soc = metrics.Average.SocTemperature;
+	memcpy(&gpu_metrics->average_temperature_core[0],
+	       &metrics.Average.CoreTemperature[0],
+	       sizeof(uint16_t) * 4);
+	gpu_metrics->average_temperature_l3[0] = metrics.Average.L3Temperature[0];
+
+	gpu_metrics->average_gfx_activity = metrics.Current.GfxActivity;
+	gpu_metrics->average_mm_activity = metrics.Current.UvdActivity;
+
+	gpu_metrics->average_socket_power = metrics.Current.CurrentSocketPower;
+	gpu_metrics->average_cpu_power = metrics.Current.Power[0];
+	gpu_metrics->average_soc_power = metrics.Current.Power[1];
+	gpu_metrics->average_gfx_power = metrics.Current.Power[2];
+
+	gpu_metrics->average_cpu_voltage = metrics.Current.Voltage[0];
+	gpu_metrics->average_soc_voltage = metrics.Current.Voltage[1];
+	gpu_metrics->average_gfx_voltage = metrics.Current.Voltage[2];
+
+	gpu_metrics->average_cpu_current = metrics.Current.Current[0];
+	gpu_metrics->average_soc_current = metrics.Current.Current[1];
+	gpu_metrics->average_gfx_current = metrics.Current.Current[2];
+
+	memcpy(&gpu_metrics->average_core_power[0],
+	       &metrics.Average.CorePower[0],
+	       sizeof(uint16_t) * 4);
+
+	gpu_metrics->average_gfxclk_frequency = metrics.Average.GfxclkFrequency;
+	gpu_metrics->average_socclk_frequency = metrics.Average.SocclkFrequency;
+	gpu_metrics->average_uclk_frequency = metrics.Average.MemclkFrequency;
+	gpu_metrics->average_fclk_frequency = metrics.Average.MemclkFrequency;
+	gpu_metrics->average_vclk_frequency = metrics.Average.VclkFrequency;
+	gpu_metrics->average_dclk_frequency = metrics.Average.DclkFrequency;
+
+	gpu_metrics->current_gfxclk = metrics.Current.GfxclkFrequency;
+	gpu_metrics->current_socclk = metrics.Current.SocclkFrequency;
+	gpu_metrics->current_uclk = metrics.Current.MemclkFrequency;
+	gpu_metrics->current_fclk = metrics.Current.MemclkFrequency;
+	gpu_metrics->current_vclk = metrics.Current.VclkFrequency;
+	gpu_metrics->current_dclk = metrics.Current.DclkFrequency;
+
+	memcpy(&gpu_metrics->current_coreclk[0],
+	       &metrics.Current.CoreFrequency[0],
+	       sizeof(uint16_t) * 4);
+	gpu_metrics->current_l3clk[0] = metrics.Current.L3Frequency[0];
+
+	gpu_metrics->throttle_status = metrics.Current.ThrottlerStatus;
+	gpu_metrics->indep_throttle_status =
+			smu_cmn_get_indep_throttler_status(metrics.Current.ThrottlerStatus,
+							   vangogh_throttler_map);
+
+	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
+
+	*table = (void *)gpu_metrics;
+
+	return sizeof(struct gpu_metrics_v2_4);
+}
+
 static ssize_t vangogh_get_gpu_metrics(struct smu_context *smu,
 				      void **table)
 {
@@ -1923,23 +2003,34 @@ static ssize_t vangogh_common_get_gpu_metrics(struct smu_context *smu,
 {
 	uint32_t if_version;
 	uint32_t smu_version;
+	uint32_t smu_program;
+	uint32_t fw_version;
 	int ret = 0;
 
 	ret = smu_cmn_get_smc_version(smu, &if_version, &smu_version);
-	if (ret) {
+	if (ret)
 		return ret;
-	}
 
-	if (smu_version >= 0x043F3E00) {
-		if (if_version < 0x3)
-			ret = vangogh_get_legacy_gpu_metrics_v2_3(smu, table);
+	smu_program = (smu_version >> 24) & 0xff;
+	fw_version = smu_version & 0xffffff;
+	if (smu_program == 6) {
+		if (fw_version >= 0x3F0800)
+			ret = vangogh_get_gpu_metrics_v2_4(smu, table);
 		else
 			ret = vangogh_get_gpu_metrics_v2_3(smu, table);
+
 	} else {
-		if (if_version < 0x3)
-			ret = vangogh_get_legacy_gpu_metrics(smu, table);
-		else
-			ret = vangogh_get_gpu_metrics(smu, table);
+		if (smu_version >= 0x043F3E00) {
+			if (if_version < 0x3)
+				ret = vangogh_get_legacy_gpu_metrics_v2_3(smu, table);
+			else
+				ret = vangogh_get_gpu_metrics_v2_3(smu, table);
+		} else {
+			if (if_version < 0x3)
+				ret = vangogh_get_legacy_gpu_metrics(smu, table);
+			else
+				ret = vangogh_get_gpu_metrics(smu, table);
+		}
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
index 3ecb900e6ecd..cee5e32b4ff9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -996,6 +996,9 @@ void smu_cmn_init_soft_gpu_metrics(void *table, uint8_t frev, uint8_t crev)
 	case METRICS_VERSION(2, 3):
 		structure_size = sizeof(struct gpu_metrics_v2_3);
 		break;
+	case METRICS_VERSION(2, 4):
+		structure_size = sizeof(struct gpu_metrics_v2_4);
+		break;
 	default:
 		return;
 	}
-- 
2.39.2

