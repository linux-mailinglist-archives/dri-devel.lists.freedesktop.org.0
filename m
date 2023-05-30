Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C537153EA
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 04:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D7910E332;
	Tue, 30 May 2023 02:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87AF10E331;
 Tue, 30 May 2023 02:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVobFsa8NpPMgGaV0rbMSeC5+vgz/WO6ndBoqBDEdMCCHBS3JdDmm2RE/ZVcbpNRQUwHsFreroY30pz/qbCvMMfqVf1WPGu6ak/EuTGIjnQQO5B3152OqETvd2I4YkAEcaTKPu/wvKN+s+MDRCzgjPEcVZ5uwsGN2c7INMlq+KG6gl0JH5lj57H4n15Ku54hISI15olkA9061ze9IDo3AX8BA49vDauLKYp1lVS/HUPFd+fjrIMxcvafNOAvbKRHMrUxG2R76XKPqtBKATlxBjKZftW/R+GRmxCZE3Q9GjvlSdOoj6LJmEWJij8Tpawx9IYIdEJi1X4+asMkMUhNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvOPH4a1HF+Wn1Cr30JJC456qjKMVEuOZFPrL3Y9Ajw=;
 b=J+GQRTuFj7dmV1ZKa/d67WW7Wt9Vn/WVo/o+4sy6XVBVQK2+TZXJaYd9tJyneECXyvn/y/PLXzCJ2WYtM4r3fkltODAGQc+Xj4Z63B1ACZhDqATCFEmYprHbeEjyl8NEcywURDnGe1aRaF2+yzDjQgQ0ZfQfmsKurP+9OSDtqhEQyuT2wekM7gl1APxnkjBd6dmXj3mnaapVLp8l9pvmzRFA3Ra0vEyH5EYajbUx7CNIj3VGscF05HEN0BglAVgTR6DrA6uYbBE/cG20YdtSvkQOCBjrONUgvdppqIk+SbE2q1SpNpGgZdVqzt5v7R9Z96fR89iUcwRzCGSabr0jHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvOPH4a1HF+Wn1Cr30JJC456qjKMVEuOZFPrL3Y9Ajw=;
 b=M8gKFGwOLkJ/FegitRQtGSLrjHMlo6jve08sqY9RirdSUire+SVF0Iq399oz/lRuQ3J98xA8GuniRiqJeWsj0mbR/WI3oqekklVwGx30GLFw09ZYXV/dktKdjz8gufgPRr1BuSCFw9ZYfZP43Bul/AulVsINWkJ6ZhFUVad5O+4=
Received: from BN0PR04CA0142.namprd04.prod.outlook.com (2603:10b6:408:ed::27)
 by CY8PR12MB7492.namprd12.prod.outlook.com (2603:10b6:930:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 02:44:12 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::1c) by BN0PR04CA0142.outlook.office365.com
 (2603:10b6:408:ed::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 02:44:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 02:44:12 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 21:44:06 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <evan.quan@amd.com>, <kvalo@kernel.org>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH 9/9] drm/amd/pm: enable Wifi RFI mitigation feature support
 for SMU13.0.7
Date: Tue, 30 May 2023 10:42:27 +0800
Message-ID: <20230530024227.2139632-10-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530024227.2139632-1-evan.quan@amd.com>
References: <20230530024227.2139632-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT029:EE_|CY8PR12MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9173ad-4b57-4c6f-6f8b-08db60b7c071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6RhYQkiKZPMJAVr/JkuK27HisTs8JHQFCnZZ2UUkqiPAclRuBaTvo2cm7+oUVWjr3HXEtBXheG6y+WRIeQozsKpekQ7hppGWeULG7nD+nxPRNIogaWOPB5khRkgj652lWopCgBBknfUhhuyiElov4R9k2JCV5VmK2CPTTaUs5JsynKUGHaZ9wBJtM+n18F3cn5M5Tzh07ioMRsj3wSaHcc1PWvP6j1WThQBRpa9k44zFArfwi3B8NPJleERROSfiHxKcXan+F6tYjTdsrLk5vGK3Tb+rdtoV+omWkQxYYVYQALPIXJ3qo+Lri86dMFeoeCEItWd1efobI2fhzwXr5w0Xk3v26cTQFwFDZ3yQqZsBzYJWm38M951w45zmA9FN7WHp+YxlL34OAMG1m4WgMm8Dpz7j9QR90QyRwQQ+0bfvUi+4xfYz8yDAaif9K+LvGNr96WAOREwH77mhPO6mMnhIWQel3t2ytGH23bJmj80Strwd2ovX6JOXAjEqSPmITyVYX6Fo29W8vx9BGcy5ymO0Q6vKVwMMcNz6KsJGL8ncLpRDnCnkt4z7oOFB9/ykWz+BlTX09ONFS7/EibY0aau/KBUA0CkelcNr15M1Xk/5Nbz3YTnN/6PXPtzIe04AubOrSUhpcpXAaFKHMX5IgC0/hoQyzu2bYaYsSp6pxM7yB2a0S5hpDiprKdfxY0WaEGmCFjK2MoJGD+YgXP1kQfhKqkOoRkEDQ+VzcoxE6gajxyBmtfKuMhJGslfqh3KeKKOoyVaberNz7AK3SA5uP36Vqr3EdBiKosRianD1vQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(47076005)(83380400001)(2616005)(426003)(336012)(2906002)(16526019)(186003)(40480700001)(36756003)(82740400003)(356005)(81166007)(921005)(36860700001)(8936002)(8676002)(7416002)(5660300002)(86362001)(478600001)(6636002)(4326008)(70586007)(70206006)(41300700001)(7696005)(316002)(6666004)(26005)(1076003)(110136005)(82310400005)(44832011)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 02:44:12.6529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9173ad-4b57-4c6f-6f8b-08db60b7c071
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7492
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
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 ath11k@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fulfill the SMU13.0.7 support for Wifi RFI mitigation feature.

Signed-off-by: Evan Quan <evan.quan@amd.com>
--
v1->v2:
  - check wbrf support using pmfw version(Lijo)
v2->v3:
  - some minor fixes(Mario)
---
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 98a33f8ee209..d885f20e33d7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -125,6 +125,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_7_message_map[SMU_MSG_MAX_COUNT] =
 	MSG_MAP(ArmD3,				PPSMC_MSG_ArmD3,                       0),
 	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
 	MSG_MAP(GetPptLimit,			PPSMC_MSG_GetPptLimit,                 0),
+	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_clk_map[SMU_CLK_COUNT] = {
@@ -205,6 +206,7 @@ static struct cmn2asic_mapping smu_v13_0_7_table_map[SMU_TABLE_COUNT] = {
 	TAB_MAP(DRIVER_SMU_CONFIG),
 	TAB_MAP(ACTIVITY_MONITOR_COEFF),
 	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
+	TAB_MAP(WIFIBAND),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_pwr_src_map[SMU_POWER_SOURCE_COUNT] = {
@@ -487,6 +489,9 @@ static int smu_v13_0_7_tables_init(struct smu_context *smu)
 	               AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_COMBO_PPTABLE, MP0_MP1_DATA_REGION_SIZE_COMBOPPTABLE,
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
+		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
+		       AMDGPU_GEM_DOMAIN_VRAM);
 
 	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
 	if (!smu_table->metrics_table)
@@ -1721,6 +1726,59 @@ static int smu_v13_0_7_set_df_cstate(struct smu_context *smu,
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
+	uint64_t start_rounddown;
+	uint64_t end_roundup;
+	int valid_entries = 0;
+	int ret, i;
+
+	memset(&wifi_bands, 0, sizeof(wifi_bands));
+	for (i = 0; i < ARRAY_SIZE(wifi_bands.WifiBandEntry); i++) {
+		if (!exclusion_ranges[i].start &&
+		    !exclusion_ranges[i].end)
+			break;
+
+		start_rounddown = rounddown(exclusion_ranges[i].start, HZ_IN_MHZ);
+		end_roundup = roundup(exclusion_ranges[i].end, HZ_IN_MHZ);
+		/* PMFW expects the inputs to be in Mhz unit */
+		wifi_bands.WifiBandEntry[valid_entries].LowFreq = HZ_TO_MHZ(start_rounddown);
+		wifi_bands.WifiBandEntry[valid_entries++].HighFreq = HZ_TO_MHZ(end_roundup);
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
+		dev_err(smu->adev->dev, "Failed to set wifiband!");
+
+	return ret;
+}
+
 static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
 	.get_allowed_feature_mask = smu_v13_0_7_get_allowed_feature_mask,
 	.set_default_dpm_table = smu_v13_0_7_set_default_dpm_table,
@@ -1786,6 +1844,9 @@ static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
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

