Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F59A78E654
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63510E5B7;
	Thu, 31 Aug 2023 06:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D127D10E5B5;
 Thu, 31 Aug 2023 06:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIne4OL0tkfpAllqFVXkJpjJAa28NIRoltjnsZWNXi2KNBTS37Lg2bdO/9Nli9qcphRYZbyP9h0hq86Veh4fBee+P3RVLDaB9h1OPL/O9METqIp3vgnbZCdPjU85JAGyk/209RbBb+B0l7XC1sjlBdehHabLW7hIYIcw13v9QlcE6ZfyVcqKy0MVDjcjQsPWwsbWyz4lYniYfWlTnPP6y02DhAvWbgBRqCW+Zeha0HSgjWg/HThIcCxUk35rQj06SDMdZSd7Vpwfeuf2wNN7BVKnTVOuiOoKlDy/TK86CXK3TCmhrI33zF4RxekTXrC2boYmJfghrVpBTA/95GRwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP1PP8xDbIv+QLYz6JOcXtBMe2vQ8EeAQ3SohEzRbeU=;
 b=kcbuno/ivuQ4RXLE72F6cnyhll229syoXqnBaCb9TCdmtKbYpxLZRYcFHpuTzEsqtwznnL24NPvQNcETdGUOur1lP0gcMVLUb43J9+mMBaLO12/eODfpfuHVFHiuz9iuf96nWIYOLapRWpXhe+KgUaqrE6oYm+ZRbJsKwth1JUMsMkyCeImpAdBevXcCm7WGndjarTcY7cJWVDRSpUwqU+o2PJb/N5kT9VsaOqpSrNULPM9uCCOt3KjxuqobL15cVSaK6JXnqgt0qcg6y1A3lowy1qqCAH5Vqzfjg9OVN9WwRO0D7GMCAookM+jyWpNNH+DKE0YwLRid6KKT6SBuUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP1PP8xDbIv+QLYz6JOcXtBMe2vQ8EeAQ3SohEzRbeU=;
 b=h8kkS2UmgcXXq36kR+kcL6GAIZmZGnqkxPpGV+qffrslZbDDrDRqT5LWMt9sSEBwkqL8oskVsGtKNDKwPxTi5pn4mGAXhgb5bdXTuHYY7RftNzmQzYlR62lGCsT8GxbXY704KbsEHfmc6np0W0ZrnMEsx2/wvg9SjvOdgd5HJ7Q=
Received: from MW4PR04CA0047.namprd04.prod.outlook.com (2603:10b6:303:6a::22)
 by MW6PR12MB8914.namprd12.prod.outlook.com (2603:10b6:303:244::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 06:21:42 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:6a:cafe::7) by MW4PR04CA0047.outlook.office365.com
 (2603:10b6:303:6a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Thu, 31 Aug 2023 06:21:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Thu, 31 Aug 2023 06:21:42 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 01:21:36 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V11 8/8] drm/amd/pm: enable Wifi RFI mitigation feature support for
 SMU13.0.7
Date: Thu, 31 Aug 2023 14:20:31 +0800
Message-ID: <20230831062031.1014799-9-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831062031.1014799-1-evan.quan@amd.com>
References: <20230831062031.1014799-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|MW6PR12MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: 96116d53-db0c-4db8-5202-08dba9ea8afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eoFEqvH0CeVSXi16peAssQ/ZDR9Nk5TcWizTe1g6FuBMtJcf9U2PL5bVXUEN0sX/W+c5IIHSRreZPYMySRt8QBZpM05DpTjNgecmO1t24TVD5ydUhzRP/utzV3YYkzTzG64Op1DM0I9r1aY4iV4rBQkcSi3aSrmcUx7ll00NRAd/wwDSxsShyzohFugPaKvRVInhmS7zKA8XK/WOVmplsbSu6nt6YSxM0kTY+nzQai23LgKK6HnLL59Zyt8Suuy1DnAFMEIzlt1KY/Pg6fFfKWPMXvH/tw06JAr2FLAxpbNjhPZo/kwo5DZ1EfKWU8A7CwSwflL1s2Funmg18tV2xGCY1zmka7UbLQ+1AlULCfHWvJXc/4ioMCGNyUz7tIsazX25PF0z4DtrFODP6Ie/COc9OWFporV+EXny+I13TftZ6zRZWUEQA/gR9xdYOqC7qA+4kjvN9YOLwe+TliSIhZVTv9gro7OrCUj2E05CLP44XryUjGHXjPU3QvOJEmHG3db6h+4fW9HAqH0f8rRv2KH4/x4/pi/decldAdYnFsJH8h0VWXSKuggw0BdvstBxTUUU5uAVO/iwRvdn449clToHM2YH/qe3SOe6UVszap61P2OBz9LAgabkgvPWIqZ+mI6NEVHyNjBr+CLEUUZsS5Soc4Q5u5XsykOEDU0/AQtIM/tMFde8Pn/jLJoHHlIGbBQO7Ht7M6g69i7sReI6VxKU9CW00JDpx1g/qmXf2mIk/+SrXxHO2SL+nBIvLaP9M15/VKFFf7/IT7e/BdzD2Uq5nm9X6UH4Cf3zG4RVAIQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(70206006)(41300700001)(8936002)(83380400001)(40480700001)(47076005)(36860700001)(336012)(8676002)(4326008)(478600001)(6666004)(6636002)(110136005)(70586007)(26005)(316002)(2616005)(16526019)(426003)(1076003)(54906003)(7696005)(2906002)(356005)(82740400003)(81166007)(921005)(40460700003)(5660300002)(7416002)(36756003)(44832011)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:21:42.0884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96116d53-db0c-4db8-5202-08dba9ea8afc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8914
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fulfill the SMU13.0.7 support for Wifi RFI mitigation feature.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
--
v10->v11:
  - downgrade the prompt level on message failure(Lijo)
---
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 62f2886ab4df..d1a93f961e9e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -126,6 +126,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_7_message_map[SMU_MSG_MAX_COUNT] =
 	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
 	MSG_MAP(GetPptLimit,			PPSMC_MSG_GetPptLimit,                 0),
 	MSG_MAP(NotifyPowerSource,		PPSMC_MSG_NotifyPowerSource,           0),
+	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_clk_map[SMU_CLK_COUNT] = {
@@ -207,6 +208,7 @@ static struct cmn2asic_mapping smu_v13_0_7_table_map[SMU_TABLE_COUNT] = {
 	TAB_MAP(ACTIVITY_MONITOR_COEFF),
 	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
 	TAB_MAP(OVERDRIVE),
+	TAB_MAP(WIFIBAND),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_pwr_src_map[SMU_POWER_SOURCE_COUNT] = {
@@ -503,6 +505,9 @@ static int smu_v13_0_7_tables_init(struct smu_context *smu)
 	               AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_COMBO_PPTABLE, MP0_MP1_DATA_REGION_SIZE_COMBOPPTABLE,
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
+		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
+		       AMDGPU_GEM_DOMAIN_VRAM);
 
 	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
 	if (!smu_table->metrics_table)
@@ -2179,6 +2184,57 @@ static int smu_v13_0_7_set_df_cstate(struct smu_context *smu,
 					       NULL);
 }
 
+static bool smu_v13_0_7_wbrf_support_check(struct smu_context *smu)
+{
+	return smu->smc_fw_version > 0x00524600;
+}
+
+static int smu_v13_0_7_set_wbrf_exclusion_ranges(struct smu_context *smu,
+						 struct exclusion_range *exclusion_ranges)
+{
+	WifiBandEntryTable_t wifi_bands;
+	int valid_entries = 0;
+	int ret, i;
+
+	memset(&wifi_bands, 0, sizeof(wifi_bands));
+	for (i = 0; i < ARRAY_SIZE(wifi_bands.WifiBandEntry); i++) {
+		if (!exclusion_ranges[i].start &&
+		    !exclusion_ranges[i].end)
+			break;
+
+		/* PMFW expects the inputs to be in Mhz unit */
+		wifi_bands.WifiBandEntry[valid_entries].LowFreq =
+			DIV_ROUND_DOWN_ULL(exclusion_ranges[i].start, HZ_IN_MHZ);
+		wifi_bands.WifiBandEntry[valid_entries++].HighFreq =
+			DIV_ROUND_UP_ULL(exclusion_ranges[i].end, HZ_IN_MHZ);
+	}
+	wifi_bands.WifiBandEntryNum = valid_entries;
+
+	/*
+	 * Per confirm with PMFW team, WifiBandEntryNum = 0 is a valid setting.
+	 * Considering the scenarios below:
+	 * - At first the wifi device adds an exclusion range e.g. (2400,2500) to
+	 *   BIOS and our driver gets notified. We will set WifiBandEntryNum = 1
+	 *   and pass the WifiBandEntry (2400, 2500) to PMFW.
+	 *
+	 * - Later the wifi device removes the wifiband list added above and
+	 *   our driver gets notified again. At this time, driver will set
+	 *   WifiBandEntryNum = 0 and pass an empty WifiBandEntry list to PMFW.
+	 *   - PMFW may still need to do some uclk shadow update(e.g. switching
+	 *     from shadow clock back to primary clock) on receiving this.
+	 */
+
+	ret = smu_cmn_update_table(smu,
+				   SMU_TABLE_WIFIBAND,
+				   0,
+				   (void *)(&wifi_bands),
+				   true);
+	if (ret)
+		dev_warn(smu->adev->dev, "Failed to set wifiband!");
+
+	return ret;
+}
+
 static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
 	.get_allowed_feature_mask = smu_v13_0_7_get_allowed_feature_mask,
 	.set_default_dpm_table = smu_v13_0_7_set_default_dpm_table,
@@ -2247,6 +2303,9 @@ static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
 	.set_mp1_state = smu_v13_0_7_set_mp1_state,
 	.set_df_cstate = smu_v13_0_7_set_df_cstate,
 	.gpo_control = smu_v13_0_gpo_control,
+	.is_asic_wbrf_supported = smu_v13_0_7_wbrf_support_check,
+	.enable_uclk_shadow = smu_v13_0_enable_uclk_shadow,
+	.set_wbrf_exclusion_ranges = smu_v13_0_7_set_wbrf_exclusion_ranges,
 };
 
 void smu_v13_0_7_set_ppt_funcs(struct smu_context *smu)
-- 
2.34.1

