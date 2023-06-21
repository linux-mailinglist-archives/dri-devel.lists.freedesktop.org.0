Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF0737B49
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 08:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DE010E3C7;
	Wed, 21 Jun 2023 06:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D12C10E3C3;
 Wed, 21 Jun 2023 06:32:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW5TUZxy4h/PS7PliEaf4UMKt///SyCB5UfTHI4yhjj3dr1rHasVYZ6ra37dm772mM0OOS6U9+YBfXwOEOMPTnfChd72hQaoztNYNnQC8kgErk+7Dt2YpasVz2rEKsiAUzFZUtDtGmNc0DAhGaoJQY1zcb8wCN/vh2qZp4iJdYvEviR8TPHy/TkFcSlMLzvEX9yvGUJyJGdQx3MtyrAyS6CFcpr8vTUoAtwWdIzkOSD2luGr6BaANC05UaP8NEeJ3PcDln/KvLwvW2Oi+AUcFjs1O+FUKUd0+yGctQqg4uE/ct96HwuF55jz5VwarpwgNtgWw4lxcl4XIFf7IAMvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSlpnl+sidA1+bONw7HsqZbmjMuJ3SbT1rIusJsrlEY=;
 b=T7bN5M1z+nafc8OiD0il1vFscB7456njnvEw6m3CtCU+3FIaqk+QB8wYhTrvce3BVgLd2Vi8p7ch4sf9BIqzy6pvAOO7QH3mgyUmYiz0NbOt/lwPYV9xpb9mo9ECarXt4Tp+ek6gI5LAxy31MihoZmHcXNS0JwcKzFM2XKksTU+CNIlvbkiCa1J3dAsVeXTfC3mlD1GoxJT8ZumdwV3EESRGaW3cEX9oo9p9M2DLyWpC1WnbgVpv+bt0o9C4hC2DojhaJDgw5d4H3Bl5TVKnEoomFS3tQuujp2tN3Jc/bLnynVxtejFjbmU5E7bnly4yVjUovo2tP3kjggUDQzBAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSlpnl+sidA1+bONw7HsqZbmjMuJ3SbT1rIusJsrlEY=;
 b=oZZwxCkKiN4AsAyM5qb739ToKzQaAvs05U3D3ZyOs6kBO+cLxzSe2qAOLS9Jd7XNJ8bLwOLbCL56zd4YIakfdImxTiTVsiGO4TYo7PtQ1AVbwGvmNOiBeEj0Cq0BSd1Dmhtt+WJ+G+AgUKO/VSnw2QVIRF8qsWaB+6Po4YYDU24=
Received: from DM6PR06CA0059.namprd06.prod.outlook.com (2603:10b6:5:54::36) by
 CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37; Wed, 21 Jun 2023 06:32:00 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:5:54:cafe::ee) by DM6PR06CA0059.outlook.office365.com
 (2603:10b6:5:54::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23 via Frontend
 Transport; Wed, 21 Jun 2023 06:31:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Wed, 21 Jun 2023 06:31:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 01:31:48 -0500
Received: from archlinux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 21 Jun 2023 01:31:45 -0500
From: Wenyou Yang <WenYou.Yang@amd.com>
To: <alexander.deucher@amd.com>, <mario.limonciello@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <evan.quan@amd.com>
Subject: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire
 gpu_metrics
Date: Wed, 21 Jun 2023 14:31:39 +0800
Message-ID: <20230621063139.583787-1-WenYou.Yang@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 4895bc8f-3fb1-4c35-c1b8-08db722137a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VhPsBVoc/g01D6mNt8LXntahVMFLGep42vAVH1Rn1BCGlgDukFa5VuHy010Enjd6nIPHZhTO934rQabRZMKOi4e1VtXiHOhI+BlAXNtHLfgBGzKYZ0h5ouZ0pPgtFaSUJ+7HbitsSeRkiicBVOm0BqnaGIUdtTLeNQHfSwg3LfyYg7/eYUQb4bMQrNJ+QkNI/IfSnGFu5W+dJOajdLYHZLDjDtZ4OUtcDiUN6vBVUOoTTnY8YS8uGlJI2jwV6otygyft2QL9XyYAiT42MMo87om5QJrYoq68sFb9OHih+szz9SVqAveP2KXn3sr/dGTrcxtPnX7UkPZM/LQXf2FWBa4KrTvo4zTI6BlovzhhuHa6GdvZKlANDoXTey4XyjhMWbVo2d+Pc78+vuB4hEZ+llAN64PB3ZxC0cf3I3z+1iHbBEeNYjqN5etw4j96hXNLQFSd3UCmkj7sa4cRyLJvvZA9XG/2Ansdiu5KU0/o8FTyZaybHBGlaZxvSTl/A3sJ1EGhv9gnSCvKVqR5zY0ElZzWbgzPVoNUfRSBsYYyFpbqw/sUUlvWKoos0QqwHM5VjAAMHCXyKHLynr8WY7ihXNb9xL0vJZx2I2SWjCde6eLYqdlGFwo1ZTOTfGLT//Db0kYSUvmivSyALrOKrpxUNVtMXyytRA6ux/OfPdsJBGrT5/+7zKem6ULtLvkc4xqjnl980NnN9AzYVpJ3dbc8uAqQjfP+n/gIWsh9PMKINiqDsxuT69tXqpbQhbw+CCrtHVZ7eelKAAew2j6pCAuyog==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(7696005)(40460700003)(478600001)(6666004)(36860700001)(47076005)(426003)(26005)(2616005)(336012)(186003)(1076003)(83380400001)(82310400005)(36756003)(86362001)(82740400003)(81166007)(356005)(40480700001)(8676002)(8936002)(316002)(5660300002)(4326008)(6636002)(2906002)(70586007)(70206006)(54906003)(110136005)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 06:31:59.4929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4895bc8f-3fb1-4c35-c1b8-08db722137a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552
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

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Wenyou Yang <WenYou.Yang@amd.com>
---
 .../gpu/drm/amd/include/kgd_pp_interface.h    |  69 +++++++++++
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 109 ++++++++++++++++--
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        |   3 +
 3 files changed, 172 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
index 9f542f6e19ed..90989405eddc 100644
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
+	/* Temperature (unit: centi-Celsius) */
+	uint16_t			temperature_gfx;
+	uint16_t			temperature_soc;
+	uint16_t			temperature_core[8];
+	uint16_t			temperature_l3[2];
+
+	/* Utilization (unit: centi) */
+	uint16_t			average_gfx_activity;
+	uint16_t			average_mm_activity;
+
+	/* Driver attached timestamp (in ns) */
+	uint64_t			system_clock_counter;
+
+	/* Power/Energy (unit: mW) */
+	uint16_t			average_socket_power;
+	uint16_t			average_cpu_power;
+	uint16_t			average_soc_power;
+	uint16_t			average_gfx_power;
+	uint16_t			average_core_power[8];
+
+	/* Average clocks (unit: MHz) */
+	uint16_t			average_gfxclk_frequency;
+	uint16_t			average_socclk_frequency;
+	uint16_t			average_uclk_frequency;
+	uint16_t			average_fclk_frequency;
+	uint16_t			average_vclk_frequency;
+	uint16_t			average_dclk_frequency;
+
+	/* Current clocks (unit: MHz) */
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
+	/* Average Temperature (unit: centi-Celsius) */
+	uint16_t			average_temperature_gfx;
+	uint16_t			average_temperature_soc;
+	uint16_t			average_temperature_core[8];
+	uint16_t			average_temperature_l3[2];
+
+	/* Power/Voltage (unit: mV) */
+	uint16_t			average_cpu_voltage;
+	uint16_t			average_soc_voltage;
+	uint16_t			average_gfx_voltage;
+
+	/* Power/Current (unit: mA) */
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

